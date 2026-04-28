variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "prefix" {
  description = "Resource name prefix"
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "tenant_id" {
  description = "Azure AD tenant ID"
  type        = string
}

variable "deployer_object_id" {
  description = "Object ID of the principal running OpenTofu (receives full admin access)"
  type        = string
}

variable "soft_delete_retention_days" {
  description = "Number of days to retain soft-deleted vaults (7-90)"
  type        = number
  default     = 7
}

variable "purge_protection_enabled" {
  description = "Enable purge protection — set true in production to prevent data loss"
  type        = bool
  default     = false
}
