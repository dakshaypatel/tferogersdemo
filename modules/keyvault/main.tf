provider "azurerm" {
  features {}
}

resource "azurerm_key_vault" "keyvault" {
  name                        = var.keyvault_name
  location                    = var.region
  resource_group_name         = var.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  enabled_for_disk_encryption = true
  soft_delete_retention_days  = 7
  sku_name                    = "standard"
  purge_protection_enabled    = false

  tags = {
    BusinessUnit = var.business_unit
    Owner        = var.owner
    Application  = var.application
  }

  network_acls {
    default_action = "Deny" /* Allow OR Deny */
    bypass         = "AzureServices" /* ip_rules OR virtual_network_subnet_ids */
  }
}

data "azurerm_client_config" "current" {}

output "resource_group_name" {
  value = azurerm_key_vault.keyvault.resource_group_name
}

output "region" {
  value = azurerm_key_vault.keyvault.location
}

output "tags" {
  value = azurerm_key_vault.keyvault.tags
}