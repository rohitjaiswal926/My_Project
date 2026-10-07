terraform {
    backend "azurerm" {
  resource_group_name  = "chinki"
  storage_account_name = "storagechinki"
  container_name       = "containerchinki"
  key                  = "backendfile"
}
}