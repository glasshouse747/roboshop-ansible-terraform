resource "azurerm_resource_group" "main" {
  location = var.name
  name     = var.location
}