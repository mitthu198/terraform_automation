
data "azurerm_client_config" "current_user" {}

resource "azurerm_key_vault" "my_key_vault" {
  name                        = var.key_vault_name
  location                    = var.key_vault_location
  resource_group_name         = var.rg_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current_user.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current_user.tenant_id
    object_id = data.azurerm_client_config.current_user.object_id


secret_permissions = [
      "Get",
      "Set",
      "List",
      "Delete",
    ]

    # key_permissions = [
    #   "get",
    #   "Set"
    # ]

    # secret_permissions = [
    #   "Get", "Set"
    # ]

    # storage_permissions = [
    #   "Get","Set"
    # ]
  }
}

# Create Secret: Username
resource "azurerm_key_vault_secret" "username" {
  depends_on = [ azurerm_key_vault.my_key_vault ]
  name         = var.key_user_name
  value        = var.val_user_name
  key_vault_id = azurerm_key_vault.my_key_vault.id
}

# Create Secret: Password
resource "azurerm_key_vault_secret" "password" {
  depends_on = [ azurerm_key_vault.my_key_vault ]
  name         = var.key_password
  value        = var.val_password
  key_vault_id = azurerm_key_vault.my_key_vault.id
}