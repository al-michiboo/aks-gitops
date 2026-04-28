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

variable "vnet_id" {
  description = "Resource ID of the virtual network (used for RBAC)"
  type        = string
}

variable "aks_subnet_id" {
  description = "Resource ID of the AKS nodes subnet"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.33"
}

variable "system_node_count" {
  description = "Number of nodes in the system pool"
  type        = number
  default     = 1
}

variable "system_node_vm_size" {
  description = "VM size for the system node pool"
  type        = string
  default     = "Standard_B2s_v2"
}

variable "user_node_count" {
  description = "Number of nodes in the user pool"
  type        = number
  default     = 1
}

variable "user_node_vm_size" {
  description = "VM size for the user node pool"
  type        = string
  default     = "Standard_B2s_v2"
}

variable "key_vault_id" {
  description = "Resource ID of the Key Vault (for the CSI Secrets Store add-on)"
  type        = string
}

variable "service_cidr" {
  description = "CIDR range for Kubernetes services — must not overlap the VNet or any subnet"
  type        = string
  default     = "10.96.0.0/16"
}

variable "dns_service_ip" {
  description = "IP address for the cluster DNS service — must be within service_cidr"
  type        = string
  default     = "10.96.0.10"
}
