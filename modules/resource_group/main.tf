provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.region

  tags = {
    BusinessUnit = var.business_unit
    Owner        = var.owner
    Application  = var.application
  }
}