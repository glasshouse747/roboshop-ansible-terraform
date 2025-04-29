variable "ip_configuration_subnet_id" {
  default = "/subscriptions/eb986b09-9743-4aa1-b10f-53da04d8708c/resourceGroups/my-first-rg/providers/Microsoft.Network/virtualNetworks/test-network/subnets/default"
}

variable "location" {
  default = "UK West"
}

variable "rg_name" {
  default = "my-first-rg"
}

variable "storage_image_reference_id" {
  default = "/subscriptions/eb986b09-9743-4aa1-b10f-53da04d8708c/resourceGroups/my-first-rg/providers/Microsoft.Compute/images/local-devops-practice"
}

variable "zone_name" {
  default = "mydevops.shop"
}

variable "network_security_group_id" {
  default = "/subscriptions/eb986b09-9743-4aa1-b10f-53da04d8708c/resourceGroups/my-first-rg/providers/Microsoft.Network/networkSecurityGroups/my-first-nsg"
}

variable "databases" {
  default = {
    mongodb = {}
    rabbitmq = {}
    mysql = {}
    redis = {}
  }
}

variable "applications" {
  default = {
    catalogue= {}
    user = {}
    cart = {}
    payment = {}
    shipping = {}
    frontend = {}
  }
}