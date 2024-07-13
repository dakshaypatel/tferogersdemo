variable "storage_account_name" {
  description = "The name of the Blob Storage Account, must start with 'rogers' and end with 'blob'"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "region" {
  description = "The region for the Blob Storage Account, restricted to CanadaCentral and CanadaEast"
  type        = string
  validation {
    condition     = contains(["CanadaCentral", "CanadaEast"], var.region)
    error_message = "The region must be either 'CanadaCentral' or 'CanadaEast'."
  }
}

variable "business_unit" {
  description = "The business unit associated with the Blob Storage Account"
  type        = string
}

variable "owner" {
  description = "The owner of the Blob Storage Account"
  type        = string
}

variable "application" {
  description = "The application associated with the Blob Storage Account"
  type        = string
}

variable "account_tier" {
  description = "The tier of the storage account"
  type        = string
}

variable "account_replication_type" {
  description = "The replication type of the storage account"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet for the private endpoint"
  type        = string
}