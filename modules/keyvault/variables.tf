variable "keyvault_name" {
  description = "The name of the Key Vault, must start with 'rogers' and end with 'kv'"
  type        = string
  validation {
    condition     = can(regex("^rogers.*kv$", var.keyvault_name))
    error_message = "The Key Vault name must start with 'rogers' and end with 'kv'."
  }
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "region" {
  description = "The region for the Key Vault, restricted to CanadaCentral and CanadaEast"
  type        = string
  validation {
    condition     = contains(["CanadaCentral", "CanadaEast"], var.region)
    error_message = "The region must be either 'CanadaCentral' or 'CanadaEast'."
  }
}

variable "business_unit" {
  description = "The business unit associated with the Key Vault"
  type        = string
}

variable "owner" {
  description = "The owner of the Key Vault"
  type        = string
}

variable "application" {
  description = "The application associated with the Key Vault"
  type        = string
}