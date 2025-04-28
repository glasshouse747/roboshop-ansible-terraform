provider "azurerm" {
  features {}
  subscription_id = "eb986b09-9743-4aa1-b10f-53da04d8708c"
}

# NETWORK SECURITY GROUP

data "azurerm_network_security_group" "existing_nsg" {
  name                = "my-first-nsg"
  resource_group_name = var.rg_name
}

resource "azurerm_subnet_network_security_group_association" "existing_nsg" {
  subnet_id = var.ip_configuration_subnet_id
  network_security_group_id = data.azurerm_network_security_group.existing_nsg.id
}

# FRONTEND

resource "azurerm_public_ip" "frontend" {
  name                = "var.name-ip"
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "frontend" {
  name                = "var.name-nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "var.name"
    subnet_id                     = var.ip_configuration_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.frontend.ip_address
  }
}

resource "azurerm_virtual_machine" "vm" {
  name                = "var.name"
  location            = var.location
  resource_group_name = var.rg_name
  network_interface_ids = [azurerm_network_interface.frontend.id]
  vm_size             = "Standard_B2s"

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = var.storage_image_reference_id
  }
  storage_os_disk {
    name              = "var.name-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "var.name"
    admin_username = "azuser"
    admin_password = "Giveme123456"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "frontend" {
  name                = "var.name-dev"
  zone_name           = var.zone_name
  resource_group_name = var.rg_name
  ttl                 = 3
  records             = [azurerm_network_interface.frontend.id]
}

# MONGODB

resource "azurerm_public_ip" "mongodb" {
  name                = "${var.name}-ip"
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "mongodb" {
  name                = "${var.name}-nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.name
    subnet_id                     = var.ip_configuration_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.mongodb.id
  }
}

resource "azurerm_virtual_machine" "vm" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  network_interface_ids = [azurerm_network_interface.mongodb.id]
  vm_size             = "Standard_B2s"

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = var.storage_image_reference_id
  }
  storage_os_disk {
    name              = "${var.name}-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = var.name
    admin_username = "azuser"
    admin_password = "Giveme123456"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "mongodb" {
  name                = "${var.name}-dev"
  zone_name           = var.zone_name
  resource_group_name = var.rg_name
  ttl                 = 3
  records             = [azurerm_network_interface.mongodb.id]
}

# CATALOGUE

resource "azurerm_public_ip" "catalogue" {
  name                = "${var.name}-ip"
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "catalogue" {
  name                = "${var.name}-nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.name
    subnet_id                     = var.ip_configuration_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.catalogue.id
  }
}

resource "azurerm_virtual_machine" "catalogue" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  network_interface_ids = [azurerm_network_interface.catalogue.id]
  vm_size             = "Standard_B2s"

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = var.storage_image_reference_id
  }
  storage_os_disk {
    name              = "${var.name}-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = var.name
    admin_username = "azuser"
    admin_password = "Giveme123456"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "catalogue" {
  name                = "${var.name}-dev"
  zone_name           = var.zone_name
  resource_group_name = var.rg_name
  ttl                 = 3
  records             = [azurerm_network_interface.catalogue.private_ip_address]
}

# REDIS

resource "azurerm_public_ip" "redis" {
  name                = "${var.name}-ip"
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "redis" {
  name                = "${var.name}-nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.name
    subnet_id                     = var.ip_configuration_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.redis.id
  }
}

resource "azurerm_virtual_machine" "vm" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  network_interface_ids = [azurerm_network_interface.redis.id]
  vm_size             = "Standard_B2s"

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = var.storage_image_reference_id
  }
  storage_os_disk {
    name              = "${var.name}-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = {var.name}
    admin_username = "azuser"
    admin_password = "Giveme123456"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "redis" {
  name                = "${var.name}-dev"
  zone_name           = var.zone_name
  resource_group_name = var.rg_name
  ttl                 = 3
  records             = [azurerm_network_interface.redis.private_ip_address]
}

# USER

resource "azurerm_public_ip" "user" {
  name                = "${var.name}-ip"
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "user" {
  name                = "${var.name}-nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.name
    subnet_id                     = var.ip_configuration_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.user.id
  }
}

resource "azurerm_virtual_machine" "vm" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  network_interface_ids = [azurerm_network_interface.user.id]
  vm_size             = "Standard_B2s"

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = var.storage_image_reference_id
  }
  storage_os_disk {
    name              = "${var.name}-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "user"
    admin_username = "azuser"
    admin_password = "Giveme123456"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "user" {
  name                = "${var.name}-dev"
  zone_name           = var.zone_name
  resource_group_name = var.rg_name
  ttl                 = 3
  records             = [azurerm_network_interface.user.private_ip_address]
}

# CART

resource "azurerm_public_ip" "cart" {
  name                = "${var.name}-ip"
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "cart" {
  name                = "${var.name}-nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.name
    subnet_id                     = var.ip_configuration_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.cart.id
  }
}

resource "azurerm_virtual_machine" "vm" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  network_interface_ids = [azurerm_network_interface.cart.id]
  vm_size             = "Standard_B2s"

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = var.storage_image_reference_id
  }
  storage_os_disk {
    name              = "${var.name}-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = var.name
    admin_username = "azuser"
    admin_password = "Giveme123456"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "cart" {
  name                = "${var.name}-dev"
  zone_name           = var.zone_name
  resource_group_name = var.rg_name
  ttl                 = 3
  records             = [azurerm_network_interface.cart.private_ip_address]
}

# MYSQL

resource "azurerm_public_ip" "mysql" {
  name                = "${var.name}-ip"
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "mysql" {
  name                = "${var.name}-nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.name
    subnet_id                     = var.ip_configuration_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.mysql.id
  }
}

resource "azurerm_virtual_machine" "vm" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  network_interface_ids = [azurerm_network_interface.mysql.id]
  vm_size             = "Standard_B2s"

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = var.storage_image_reference_id
  }
  storage_os_disk {
    name              = "${var.name}-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = var.name
    admin_username = "azuser"
    admin_password = "Giveme123456"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "mysql" {
  name                = "${var.name}-dev"
  zone_name           = var.zone_name
  resource_group_name = var.rg_name
  ttl                 = 3
  records             = [azurerm_network_interface.mysql.private_ip_address]
}

# SHIPPING

resource "azurerm_public_ip" "shipping" {
  name                = "${var.name}-ip"
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "shipping" {
  name                = "${var.name}-nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.name
    subnet_id                     = var.ip_configuration_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.shipping.id
  }
}

resource "azurerm_virtual_machine" "vm" {
  name                = "${var.name}"
  location            = var.location
  resource_group_name = var.rg_name
  network_interface_ids = [azurerm_network_interface.shipping.id]
  vm_size             = "Standard_B2s"

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = var.storage_image_reference_id
  }
  storage_os_disk {
    name              = "${var.name}-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "shipping"
    admin_username = "azuser"
    admin_password = "Giveme123456"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "shipping" {
  name                = "${var.name}-dev"
  zone_name           = var.zone_name
  resource_group_name = var.rg_name
  ttl                 = 3
  records             = [azurerm_network_interface.shipping.private_ip_address]
}

# RABBITMQ

resource "azurerm_public_ip" "rabbitmq" {
  name                = "${var.name}-ip"
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "rabbitmq" {
  name                = "${var.name}-nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.name
    subnet_id                     = var.ip_configuration_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.rabbitmq.id
  }
}

resource "azurerm_virtual_machine" "vm" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  network_interface_ids = [azurerm_network_interface.rabbitmq.id]
  vm_size             = "Standard_B2s"

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = var.storage_image_reference_id
  }
  storage_os_disk {
    name              = "${var.name}-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = var.name
    admin_username = "azuser"
    admin_password = "Giveme123456"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "rabbitmq" {
  name                = "${var.name}-dev"
  zone_name           = var.zone_name
  resource_group_name = var.rg_name
  ttl                 = 3
  records             = [azurerm_network_interface.rabbitmq.private_ip_address]
}

# PAYMENT

resource "azurerm_public_ip" "payment" {
  name                = "${var.name}-ip"
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "payment" {
  name                = "${var.name}-nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.name
    subnet_id                     = var.ip_configuration_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.payment.id
  }
}

resource "azurerm_virtual_machine" "vm" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  network_interface_ids = [azurerm_network_interface.payment.id]
  vm_size             = "Standard_B2s"

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = var.storage_image_reference_id
  }
  storage_os_disk {
    name              = "${var.name}-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = var.name
    admin_username = "azuser"
    admin_password = "Giveme123456"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "payment" {
  name                = "${var.name}-dev"
  zone_name           = var.zone_name
  resource_group_name = var.rg_name
  ttl                 = 3
  records             = [azurerm_network_interface.payment.private_ip_address]
}

# DISPATCH

resource "azurerm_public_ip" "dispatch" {
  name                = "${var.name}-ip"
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "dispatch" {
  name                = "${var.name}-nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.name
    subnet_id                     = var.ip_configuration_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.dispatch.id
  }
}

resource "azurerm_virtual_machine" "dispatch" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  network_interface_ids = [azurerm_network_interface.dispatch.id]
  vm_size             = "Standard_B2s"

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = var.storage_image_reference_id
  }
  storage_os_disk {
    name              = "${var.name}-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "dispatch"
    admin_username = "azuser"
    admin_password = "Giveme123456"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "dispatch" {
  name                = "${var.name}-dev"
  zone_name           = var.zone_name
  resource_group_name = var.rg_name
  ttl                 = 3
  records             = [azurerm_network_interface.dispatch.private_ip_address]
}