variable "token" {}
provider "vault" {
  address = "http://vault.mydevops.shop:8200"
  token = var.token
}

resource "vault_mount" "kv" {
  for_each    = var.secrets
  path        = each.key
  type        = "kv"
  options     = { version = "2" }
  description = "KV Version 2 secret engine mount"
}

variable "secrets" {
  default = {
    roboshop-dev = {
      description = "RoboShop App Component All secrets"
    }
  }
}