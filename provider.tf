terraform {
  required_version = ">= 1.1"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.99"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.1.0"
    }
  }
}

provider "azurerm" {
  features {}
}