env = "dev"

rg_name     = "roboshop-dev"
rg_location = "UK West"
ip_configuration_subnet_id = "/subscriptions/eb986b09-9743-4aa1-b10f-53da04d8708c/resourceGroups/my-first-rg/providers/Microsoft.Network/virtualNetworks/test-network/subnets/default"
storage_image_reference_id = "/subscriptions/eb986b09-9743-4aa1-b10f-53da04d8708c/resourceGroups/my-first-rg/providers/Microsoft.Compute/images/local-devops-practice"
zone_name = "mydevops.shop"
network_security_group_id = "/subscriptions/eb986b09-9743-4aa1-b10f-53da04d8708c/resourceGroups/my-first-rg/providers/Microsoft.Network/networkSecurityGroups/my-first-nsg"
databases = {
    mongodb = {}
    rabbitmq = {}
    mysql = {}
    redis = {}
  }
applications = {
    catalogue= {}
    user = {}
    cart = {}
    payment = {}
    shipping = {}
    frontend = {}
    dispatch = {}
  }
}
