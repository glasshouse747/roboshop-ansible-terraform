env = "dev"
ip_configuration_subnet_id = "/subscriptions/eb986b09-9743-4aa1-b10f-53da04d8708c/resourceGroups/my-first-rg/providers/Microsoft.Network/virtualNetworks/test-network/subnets/default"
storage_image_reference_id = "/subscriptions/eb986b09-9743-4aa1-b10f-53da04d8708c/resourceGroups/my-first-rg/providers/Microsoft.Compute/images/local-devops-practice"
zone_name                  = "mydevops.shop"
dns_record_rg_name         =  "my-first-rg"
network_security_group_id  = "/subscriptions/eb986b09-9743-4aa1-b10f-53da04d8708c/resourceGroups/my-first-rg/providers/Microsoft.Network/networkSecurityGroups/my-first-nsg"
databases = {
  mongodb  = {
    rgname = "ukwest"
  }
  rabbitmq = {
    rgname = "ukwest"
  }
  mysql    = {
    rgname = "ukwest"
  }
  redis    = {
    rgname = "ukwest"
  }
}
applications = {
  catalogue = {
    rgname = "ukwest"
  }
  user      = {
    rgname = "ukwest"
  }
  cart      = {
    rgname = "ukwest"
  }
  payment   = {
    rgname = "ukwest"
  }
  shipping  = {
    rgname = "ukwest"
  }
  frontend  = {
    rgname = "ukwest"
  }
  dispatch  = {
    rgname = "ukwest"
  }
}
rg_name = {
  ukwest = {
    location = "UK West"
  }
}