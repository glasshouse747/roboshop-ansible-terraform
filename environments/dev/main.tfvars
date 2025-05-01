env = "dev"

ip_configuration_subnet_id = "/subscriptions/eb986b09-9743-4aa1-b10f-53da04d8708c/resourceGroups/my-first-rg/providers/Microsoft.Network/virtualNetworks/test-network/subnets/default"
storage_image_reference_id = "/subscriptions/eb986b09-9743-4aa1-b10f-53da04d8708c/resourceGroups/my-first-rg/providers/Microsoft.Compute/images/local-devops-practice"
zone_name                  = "mydevops.shop"
network_security_group_id  = "/subscriptions/eb986b09-9743-4aa1-b10f-53da04d8708c/resourceGroups/my-first-rg/providers/Microsoft.Network/networkSecurityGroups/my-first-nsg"
databases = {
  mongodb  = {
    rgname = "ukwest-dev"
  }
  rabbitmq = {
    rgname = "ukwest-dev"
  }
  mysql    = {
    rgname = "ukwest-dev"
  }
  redis    = {
    rgname = "ukwest-dev"
  }
}
applications = {
  catalogue = {
    rgname = "ukwest-dev"
  }
  user      = {
    rgname = "ukwest-dev"
  }
  cart      = {
    rgname = "ukwest-dev"
  }
  payment   = {
    rgname = "ukwest-dev"
  }
  shipping  = {
    rgname = "ukwest-dev"
  }
  frontend  = {
    rgname = "ukwest-dev"
  }
  dispatch  = {
    rgname = "ukwest-dev"
  }
}
rg_name = {
  ukwest = {
    rg_location = "UK West"
  }
}