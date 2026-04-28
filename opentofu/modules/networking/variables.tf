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

variable "vnet_address_space" {
  description = "CIDR block for the virtual network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "aks_subnet_prefix" {
  description = "CIDR block for the AKS nodes subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "appgw_subnet_prefix" {
  description = "CIDR block for the Application Gateway subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "pe_subnet_prefix" {
  description = "CIDR block for private endpoints subnet"
  type        = string
  default     = "10.0.3.0/24"
}

variable "nat_gateway_idle_timeout" {
  description = "Idle timeout in minutes for the NAT Gateway"
  type        = number
  default     = 10
}
