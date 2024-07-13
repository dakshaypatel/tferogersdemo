variable "resource_group_name" {
  description = "The name of the resource group, must start with 'rogers' and end with 'rg'"
  type        = string
  validation {
    condition     = can(regex("^rogers.*rg$", var.resource_group_name))
    error_message = "The resource group name must start with 'rogers' and end with 'rg'."
  }
}

variable "region" {
  description = "The region for the resource group, restricted to CanadaCentral and CanadaEast"
  type        = string
  validation {
    condition     = contains(["CanadaCentral", "CanadaEast"], var.region)
    error_message = "The region must be either 'CanadaCentral' or 'CanadaEast'."
  }
}
