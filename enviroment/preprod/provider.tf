terraform { 
backend "azurerm" {
  resource_group_name  = "chinki"
  storage_account_name = "storagechinki"
  container_name       = "containerchinki"
  key                  = "backendfile"
}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.7.0"
    }
  }
}

provider "azurerm" {
  features {}
}
