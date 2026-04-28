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

variable "appgw_subnet_id" {
  description = "Resource ID of the dedicated Application Gateway subnet"
  type        = string
}

variable "sku_name" {
  description = "Application Gateway SKU name"
  type        = string
  default     = "Standard_v2"
}

variable "sku_tier" {
  description = "Application Gateway SKU tier"
  type        = string
  default     = "Standard_v2"
}

variable "capacity" {
  description = "Number of Application Gateway instances (autoscale is off in dev)"
  type        = number
  default     = 1
}
