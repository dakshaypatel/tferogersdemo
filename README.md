# tferogersdemo

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

## Naming Standard Validations

<img width="953" alt="Screenshot 2024-07-12 at 9 17 52 PM" src="https://github.com/user-attachments/assets/93a97ee4-85f0-45f2-a35a-cceca9669907">
