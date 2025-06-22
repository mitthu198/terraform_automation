data "azurerm_subnet" "subnet_data" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.rg_name
}

data "azurerm_public_ip" "pip_data" {
  name                = var.pip_name
  resource_group_name = var.rg_name
}

data "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  resource_group_name = var.rg_name
}

data "azurerm_key_vault_secret" "secret_username" {
  name         = var.key_username
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "secret_password" {
  name         = var.key_password
  key_vault_id = data.azurerm_key_vault.kv.id
}