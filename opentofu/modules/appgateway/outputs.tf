output "appgw_id" {
  description = "Resource ID of the Application Gateway"
  value       = azurerm_application_gateway.main.id
}

output "appgw_name" {
  description = "Name of the Application Gateway"
  value       = azurerm_application_gateway.main.name
}

output "public_ip_id" {
  description = "Resource ID of the Application Gateway public IP"
  value       = azurerm_public_ip.appgw.id
}

output "public_ip_address" {
  description = "Public IP address of the Application Gateway"
  value       = azurerm_public_ip.appgw.ip_address
}
