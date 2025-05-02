resource "azurerm_public_ip" "public_ip" {
  name                = "${var.name}-ip"
  resource_group_name = var.rg_name
  location            = var.rg_location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "private_ip" {
  name                = var.rg_name
  location            = var.rg_location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.rg_name
    subnet_id                     = "/subscriptions/eb986b09-9743-4aa1-b10f-53da04d8708c/resourceGroups/my-first-rg/providers/Microsoft.Network/virtualNetworks/test-network/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

resource "azurerm_network_interface_security_group_association" "existing_nsg" {
  network_interface_id      = azurerm_network_interface.private_ip.id
  network_security_group_id = "/subscriptions/eb986b09-9743-4aa1-b10f-53da04d8708c/resourceGroups/my-first-rg/providers/Microsoft.Network/networkSecurityGroups/my-first-nsg"
}

resource "azurerm_dns_a_record" "public_dns_record" {
  name                = var.name
  zone_name           = "mydevops.shop"
  resource_group_name = var.rg_name
  ttl                 = 3
  records             = [azurerm_public_ip.public_ip.ip_address]
}

resource "azurerm_dns_a_record" "private_dns_record" {
  name                = var.name
  zone_name           = "mydevops.shop"
  resource_group_name = var.rg_name
  ttl                 = 3
  records = [azurerm_network_interface.private_ip.private_ip_address]
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                  = var.name
  location              = var.rg_location
  resource_group_name   = var.rg_name
  network_interface_ids = [azurerm_network_interface.private_ip.id]
  size                  = var.vm_size
  admin_username        = "azuser"
  admin_password        = "Giveme123456"
  disable_password_authentication = false
  priority              = "Spot"
  max_bid_price         = -1
  eviction_policy       = "Deallocate"
  source_image_id       = "/subscriptions/eb986b09-9743-4aa1-b10f-53da04d8708c/resourceGroups/my-first-rg/providers/Microsoft.Compute/images/local-devops-practice"

  os_disk {
    name                 = "${var.name}-disk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

}
