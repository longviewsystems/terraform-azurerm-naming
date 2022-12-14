/***********/
/* Naming components.
/***********/

variable "name_components" {
  type        = list(string)
  description = "The components of the names.  Each compoent will be replaced with a value from one of the variables.  See the readme for further details."
  default     = ["ResourceType", "Org", "ProjAppSvc", "Environment", "Location", "Instance"]
}

variable "environment" {
  type        = string
  description = "The value to replace the 'Environment' name components with."
  default     = "dev"
}

variable "organization" {
  type        = string
  description = "The value to replace the 'Org' name components with."
  default     = "rog"
}

variable "location" {
  type        = string
  description = "The value to replace the 'Location' name components with."
  default     = "wu"
}

variable "proj_app_or_svc" {
  type        = string
  description = "The value to replace the 'ProjAppSvc' name components"
  default     = "mtx"
}

variable "unit_or_dept" {
  type        = string
  description = "The value to replace the 'UnitDept' name components"
  default     = "fin"
}

variable "instance" {
  type        = string
  description = "The value to replace the 'Instance' name components"
  default     = "01"
}

/***********/
/* RANDOM Characters
/***********/
variable "enable_random_name_component" {
  type        = bool
  description = "Enable or disable random name component.  Sets variable unique_length to 0."
  default     = false
}

variable "unique_seed" {
  type        = number
  description = "The seed for the random generator.  This value should be random.  It will be appended in place of a random string in the names."
  default     = null
}

variable "unique_length" {
  type        = number
  description = "The length of the random string to insert into the names.  Variable enable_random_name_component must be true."
  default     = 4
}

/***********/
/* Naming controls
/***********/
variable "resource_types" {
  type        = list(string)
  description = "A list of resource type(s) that should be generated (output) using the same settings.  Pick from this list: https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/azurecaf_name#resource-types"
  default     = ["azurerm_resource_group", "azurerm_app_service", "azurerm_storage_account", "azurerm_key_vault", "azurerm_network_watcher", "azurerm_network_security_group", "azurerm_virtual_network", "azurerm_subnet", "azurerm_virtual_network_gateway", "azurerm_firewall"]
}

variable "clean_input" {
  type        = bool
  description = "Remove any noncompliant character from the name, suffix or prefix."
  default     = true
}

variable "separator" {
  type        = string
  description = "The separator character to use between prefixes, resource type, name, suffixes, random character."
  default     = "-"
}

variable "use_slug" {
  type        = bool
  description = "If a slug should be added to the name - If you put false no slug (the few letters that identify the resource type) will be added to the name."
  default     = true
}

/***********/
/* Output Control
/***********/
variable "output_debug_info" {
  type        = bool
  description = "Limits the output of the module to names by default (false)."
  default     = false
}