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
variable "unique_seed" {
  type        = string
  description = "The seed for the random generator.  This value should be random.  It will be appended in place of a random string in the names."
  default     = ""  
}

variable "unique_length" {
  type        = number
  description = "The length of the random string"
  default     = 4
}

variable "unique_include_numbers" {
  type        = bool
  description = "Include numbers in the random string"
  default     = false
}