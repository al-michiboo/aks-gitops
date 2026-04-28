resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
  numeric = true
}

# Key Vault names are globally unique and limited to 24 chars.
resource "azurerm_key_vault" "main" {
  name                = "kv-${var.prefix}-${random_string.suffix.result}"
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = var.tenant_id

  sku_name                   = "standard"
  soft_delete_retention_days = var.soft_delete_retention_days
  purge_protection_enabled   = var.purge_protection_enabled

  rbac_authorization_enabled = false

  network_acls {
    default_action = "Allow"
    bypass         = "AzureServices"
  }

  tags = var.tags
}

# Full access for the identity that runs OpenTofu (CI service principal or developer).
resource "azurerm_key_vault_access_policy" "deployer" {
  key_vault_id = azurerm_key_vault.main.id
  tenant_id    = var.tenant_id
  object_id    = var.deployer_object_id

  key_permissions = [
    "Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get",
    "Import", "List", "Purge", "Recover", "Restore", "Sign",
    "UnwrapKey", "Update", "Verify", "WrapKey",
  ]
  secret_permissions = [
    "Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set",
  ]
  certificate_permissions = [
    "Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers",
    "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers",
    "Purge", "Recover", "Restore", "SetIssuers", "Update",
  ]
}
