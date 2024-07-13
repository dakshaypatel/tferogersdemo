provider "azurerm" {
  features {}
}

resource "azurerm_storage_account" "blob_storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.region
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  enable_https_traffic_only = true
  public_network_access_enabled = false


  tags = {
    BusinessUnit = var.business_unit
    Owner        = var.owner
    Application  = var.application
  }

    network_rules {
    default_action             = "Deny"
    virtual_network_subnet_ids = [var.subnet_id]
  }
}

resource "azurerm_private_endpoint" "storage_pe" {
  name                = "${var.storage_account_name}-pe"
  location            = var.region
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "${var.storage_account_name}-sc"
    private_connection_resource_id = azurerm_storage_account.blob_storage.id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }
}

output "resource_group_name" {
  value = azurerm_storage_account.blob_storage.resource_group_name
}

output "region" {
  value = azurerm_storage_account.blob_storage.location
}

output "tags" {
  value = azurerm_storage_account.blob_storage.tags
}