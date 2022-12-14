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
  prefixes      = slice(local.update_ud, 0, local.index_of_resource_type)
  temp_suffixes = slice(local.update_ud, local.index_of_resource_type + 1, local.num_of_elements)

  #Randomize the name 
  #if enable_random_name_component, then use var.unique_length, else use 0 (disable).
  suffixes = var.enable_random_name_component ? concat(local.temp_suffixes, [random_string.random.result]) : local.temp_suffixes

}

//build a random string of a certain legth with lower case letters only.
resource "random_string" "random" {
  length  = var.unique_length
  special = false
  upper   = false
  lower   = true
  numeric = false
}

resource "azurecaf_name" "naming" {
  resource_types = var.resource_types
  prefixes       = local.prefixes
  suffixes       = local.suffixes
  random_length  = 0 //Built-in random feature has major issue.
  clean_input    = var.clean_input
  separator      = var.separator
  use_slug       = var.use_slug
}

