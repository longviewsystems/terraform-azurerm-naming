terraform {
  required_version = ">= 1.1"
  required_providers {
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = "1.2.23"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.4"
    }
  }
}