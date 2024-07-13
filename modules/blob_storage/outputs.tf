output "bs_resource_group_name" {
  value = azurerm_storage_account.blob_storage.resource_group_name
}

output "bs_region" {
  value = azurerm_storage_account.blob_storage.location
}

output "bs_tags" {
  value = azurerm_storage_account.blob_storage.tags
}
