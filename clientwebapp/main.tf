module "resource_group" {
  source = "../tferogersdemo/modules/resource_group/"

  resource_group_name = "rogers-webapp-rg"
  region              = "CanadaCentral"
  business_unit       = "IT"
  owner               = "Dakshay"
  application         = "Webapp"
}

module "keyvault" {
  source = "../tferogersdemo/modules/keyvault"

  keyvault_name       = "rogers-webapp-kv"
  resource_group_name = "rogers-webapp-rg"
  region              = "CanadaCentral"
  business_unit       = "IT"
  owner               = "Dakshay"
  application         = "Webapp"
}

module "blob_storage" {
  source = "../tferogersdemo/modules/blob_storage"

  storage_account_name    = "rogerswebappblob"
  resource_group_name     = "rogers-webapp-rg"
  region                  = "CanadaEast"
  business_unit           = "IT"
  owner                   = "Dakshay"
  application             = "Webapp"
  account_tier            = "Standard"
  account_replication_type = "LRS"
  subnet_id               = "/subscriptions/f4b73c4b-d707-43cd-be9a-da1334390201/resourceGroups/rogers-network-rg/providers/Microsoft.Network/virtualNetworks/vnet-canadaeast/subnets/rogers-webapp-subnet-pe"
}


output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "region" {
  value = module.resource_group.region
}

output "tags" {
  value = module.resource_group.tags
}

output "keyvault_resource_group_name" {
  value = module.keyvault.kv_resource_group_name
}

output "keyvault_region" {
  value = module.keyvault.kv_region
}

output "keyvault_tags" {
  value = module.keyvault.kv_tags
}