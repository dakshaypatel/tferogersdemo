output "kv_resource_group_name" {
  value = azurerm_key_vault.keyvault.resource_group_name
}

output "kv_region" {
  value = azurerm_key_vault.keyvault.location
}

output "kv_tags" {
  value = azurerm_key_vault.keyvault.tags
}