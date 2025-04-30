provider "azurerm" {
  features {}
  subscription_id = "eb986b09-9743-4aa1-b10f-53da04d8708c"
}

resource "azurerm_storage_account" "roboshop_tf_state" {
  name                     = "mydevopshop"
  resource_group_name      = "my-first-rg"
  location                 = "UK West"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "roboshop_tf_state" {
  name                  = "robsoshop-state-files"
  storage_account_id    = azurerm_storage_account.roboshop_tf_state.id
  container_access_type = "private"
}

