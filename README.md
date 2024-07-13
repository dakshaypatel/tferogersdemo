# Terraform Demo

Usecase - Deploy Keyvault in Canada Central and Blob Storage in Canada East with private endpoint under same resource group using Terraform code. The code can be deployed on their own subscription. This would be in the Cloud.

# Azure Resource Group Terraform Module

This Terraform module deploys an Azure Resource Group with specific constraints and mandatory tags.

## RG Module main.tf

This file defines the resources and configurations for the Azure Resource Group module.

| Resource                  | Description                                                                             |
|---------------------------|-----------------------------------------------------------------------------------------|
| `azurerm_resource_group`  | Creates an Azure Resource Group with the specified name, region, and mandatory tags.    |
| `output "resource_group_name"` | Outputs the name of the created resource group.                                      |
| `output "region"`         | Outputs the region of the created resource group.                                        |
| `output "tags"`           | Outputs the tags associated with the resource group.                                     |

## Module Variables

| Name                 | Description                                                             | Type   | Default | Required |
|----------------------|-------------------------------------------------------------------------|--------|---------|----------|
| `resource_group_name`| The name of the resource group. Must start with 'rogers' and end with 'rg'. | string | n/a     | yes      |
| `region`             | The region for the resource group. Must be either 'CanadaCentral' or 'CanadaEast'. | string | n/a     | yes      |
| `business_unit`      | The business unit associated with the resource group.                   | string | n/a     | yes      |
| `owner`              | The owner of the resource group.                                        | string | n/a     | yes      |
| `application`        | The application associated with the resource group.                     | string | n/a     | yes      |

## Module Outputs

| Name                  | Description                             |
|-----------------------|-----------------------------------------|
| `resource_group_name` | The name of the created resource group. |
| `region`              | The region of the created resource group. |
| `tags`                | The tags associated with the resource group. |

## Azure Key Vault Terraform Module
## Module main.tf

This file defines the resources and configurations for the Azure Key Vault module.

| Resource                    | Description                                                                              |
|-----------------------------|------------------------------------------------------------------------------------------|
| `azurerm_key_vault`         | Creates an Azure Key Vault with the specified name, region, and mandatory tags.          |
| `output "keyvault_id"`      | Outputs the ID of the created Key Vault.                                                 |
| `output "resource_group_name"` | Outputs the name of the resource group where the Key Vault is created.                 |
| `output "region"`           | Outputs the region where the Key Vault is created.                                       |
| `output "tags"`             | Outputs the tags associated with the Key Vault.                                          |

## variables.tf

| Name                 | Description                                                             | Type   | Default | Required |
|----------------------|-------------------------------------------------------------------------|--------|---------|----------|
| `keyvault_name`      | The name of the Key Vault, must start with 'rogers' and end with 'kv'.  | string | n/a     | yes      |
| `resource_group_name`| The name of the resource group.                                         | string | n/a     | yes      |
| `region`             | The region for the Key Vault, restricted to CanadaCentral and CanadaEast. | string | n/a     | yes      |
| `business_unit`      | The business unit associated with the Key Vault.                        | string | n/a     | yes      |
| `owner`              | The owner of the Key Vault.                                             | string | n/a     | yes      |
| `application`        | The application associated with the Key Vault.                          | string | n/a     | yes      |

## outputs.tf

| Name                   | Description                             |
|------------------------|-----------------------------------------|
| `keyvault_id`          | The ID of the created Key Vault.        |
| `resource_group_name`  | The name of the resource group.         |
| `region`               | The region of the created Key Vault.    |
| `tags`                 | The tags associated with the Key Vault. |


## Azure Blob Storage Terraform Module
## Module main.tf
This file defines the resources and configurations for the Azure Blob Storage module.

| Resource                            | Description                                                                              |
|-------------------------------------|------------------------------------------------------------------------------------------|
| `azurerm_storage_account`           | Creates an Azure Storage Account with the specified configurations.                       |
| `azurerm_private_endpoint`          | Creates a private endpoint for the Blob Storage account.                                 |
| `azurerm_private_dns_zone`          | Creates a Private DNS Zone for the Blob Storage account.                                 |
| `azurerm_private_dns_zone_group`    | Associates the Private DNS Zone with the Private Endpoint.                               |
| `output "storage_account_id"`       | Outputs the ID of the created Storage Account.                                           |
| `output "resource_group_name"`      | Outputs the name of the resource group where the Storage Account is created.             |
| `output "region"`                   | Outputs the region where the Storage Account is created.                                 |
| `output "tags"`                     | Outputs the tags associated with the Storage Account.                                    |

## variables.tf

| Name                      | Description                                                             | Type   | Default | Required |
|---------------------------|-------------------------------------------------------------------------|--------|---------|----------|
| `storage_account_name`    | The name of the Storage Account, must start with 'rogers' and end with 'blob'. | string | n/a     | yes      |
| `resource_group_name`     | The name of the resource group.                                         | string | n/a     | yes      |
| `region`                  | The region for the Storage Account, restricted to CanadaCentral and CanadaEast. | string | n/a     | yes      |
| `business_unit`           | The business unit associated with the Storage Account.                  | string | n/a     | yes      |
| `owner`                   | The owner of the Storage Account.                                       | string | n/a     | yes      |
| `application`             | The application associated with the Storage Account.                    | string | n/a     | yes      |
| `account_tier`            | The performance tier of the Storage Account.                            | string | n/a     | yes      |
| `account_replication_type`| The replication type of the Storage Account.                            | string | n/a     | yes      |
| `vnet_id`                 | The ID of the virtual network.                                          | string | n/a     | yes      |
| `subnet_id`               | The ID of the subnet within the virtual network.                        | string | n/a     | yes      |

## outputs.tf

| Name                   | Description                             |
|------------------------|-----------------------------------------|
| `storage_account_id`   | The ID of the created Storage Account.  |
| `resource_group_name`  | The name of the resource group.         |
| `region`               | The region of the created Storage Account. |
| `tags`                 | The tags associated with the Storage Account. |

## Naming Standard Validations

<img width="953" alt="Screenshot 2024-07-12 at 9 17 52 PM" src="https://github.com/user-attachments/assets/93a97ee4-85f0-45f2-a35a-cceca9669907">

## Result

These modules ensure that infrastructure is deployed with consistent naming conventions, specific regional restrictions, and mandatory organizational tags, providing a standardized and compliant way to manage Azure resources.