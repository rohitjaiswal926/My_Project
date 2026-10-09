resource "azurerm_public_ip" "public_ip" {
  for_each            = var.public_ip
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method
}

terraform {
  required_version = ">= 1.14.6"

  

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