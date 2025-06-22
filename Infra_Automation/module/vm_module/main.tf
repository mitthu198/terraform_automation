resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    public_ip_address_id = data.azurerm_public_ip.pip_data.id
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet_data.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "linux_vm" {
  name                = var.vm_name
  resource_group_name = var.rg_name
  location            = var.location
  size                = var.vm_size
  admin_username      = data.azurerm_key_vault_secret.secret_username.value
  admin_password      = data.azurerm_key_vault_secret.secret_password.value
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical" 
    offer = "0001-com-ubuntu-server-focal" 
    sku = "20_04-lts" 
    version = "latest"
  }

  custom_data = base64encode(<<EOF
#!/bin/bash
apt-get update
apt-get install -y nginx
systemctl enable nginx
systemctl start nginx
EOF
  )
}