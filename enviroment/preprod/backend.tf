terraform {
  backend "azurerm" {
    resource_group_name  = "backendchinki"
    storage_account_name = "backendstoragechinki"
    container_name       = "containerbackend"
    key                  = "backendfile1"
  }
}