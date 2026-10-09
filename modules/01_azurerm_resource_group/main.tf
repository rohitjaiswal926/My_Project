resource "azurerm_resource_group" "resourcerg" {
  for_each = var.rgs
  name     = each.value.name
  location = each.value.location
}


terraform {
  

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.9.0"
    }
  }
}

provider "azurerm" {
  features {}
}
