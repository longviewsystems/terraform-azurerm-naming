locals {
  #["ResourceType", "Org", "ProjAppSvc", "Environment", "Location", "Instance"]
  # Turn that into prefixes and suffixes

  #Check how many components are in the list
  num_of_elements = length(var.name_components)

  #Get the index of the ResourceType.  It's special.
  index_of_resource_type = index(var.name_components, "ResourceType")

  #Replace each part of the name.
  update_env  = [for nc in var.name_components : nc == "Environment" ? var.environment : nc]
  update_loc  = [for nc in local.update_env : nc == "Location" ? var.location : nc]
  update_prj  = [for nc in local.update_loc : nc == "ProjAppSvc" ? var.proj_app_or_svc : nc]
  update_inst = [for nc in local.update_prj : nc == "Instance" ? var.instance : nc]
  update_org  = [for nc in local.update_inst : nc == "Org" ? var.organization : nc]
  update_ud   = [for nc in local.update_org : nc == "UnitDept" ? var.unit_or_dept : nc]

  #Split the list into prefixes and suffixes
  prefixes = slice(local.update_ud, 0, local.index_of_resource_type)
  suffixes = slice(local.update_ud, local.index_of_resource_type + 1, local.num_of_elements)

}

module "naming" {
  source                 = "Azure/naming/azurerm"
  version                = "0.1.1"
  prefix                 = local.prefixes
  suffix                 = local.suffixes
  unique-seed            = var.unique_seed
  unique-length          = var.unique_length
  unique-include-numbers = var.unique_include_numbers
}



