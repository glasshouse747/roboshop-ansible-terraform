# data "azurerm_resource_group" "rg" {
#   name = var.rg_name
# }

data "vault_generic_secret" "ssh" {
  path = "robsohop-infra/ssh"
}