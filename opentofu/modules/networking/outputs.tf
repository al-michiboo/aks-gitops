output "vnet_id" {
  description = "Resource ID of the virtual network"
  value       = azurerm_virtual_network.main.id
}

output "vnet_name" {
  description = "Name of the virtual network"
  value       = azurerm_virtual_network.main.name
}

output "aks_subnet_id" {
  description = "Resource ID of the AKS subnet"
  value       = azurerm_subnet.aks.id
}

output "appgw_subnet_id" {
  description = "Resource ID of the Application Gateway subnet"
  value       = azurerm_subnet.appgw.id
}

output "pe_subnet_id" {
  description = "Resource ID of the private endpoints subnet"
  value       = azurerm_subnet.pe.id
}

output "nat_gateway_id" {
  description = "Resource ID of the NAT Gateway"
  value       = azurerm_nat_gateway.main.id
}

output "nat_gateway_public_ip" {
  description = "Public IP address of the NAT Gateway"
  value       = azurerm_public_ip.nat_gateway.ip_address
}
