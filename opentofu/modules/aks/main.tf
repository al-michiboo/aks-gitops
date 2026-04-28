resource "azurerm_user_assigned_identity" "aks" {
  name                = "id-aks-${var.prefix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

# AKS control plane needs Network Contributor on the VNet to manage load balancers
# and attach NICs to subnets.
resource "azurerm_role_assignment" "aks_network_contributor" {
  scope                = var.vnet_id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.aks.principal_id
}

resource "azurerm_kubernetes_cluster" "main" {
  name                = "aks-${var.prefix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "aks-${var.prefix}"
  kubernetes_version  = var.kubernetes_version
  sku_tier            = "Free"

  default_node_pool {
    name           = "system"
    node_count     = var.system_node_count
    vm_size        = var.system_node_vm_size
    vnet_subnet_id = var.aks_subnet_id
    os_disk_size_gb = 30
    type           = "VirtualMachineScaleSets"

    only_critical_addons_enabled = true

    upgrade_settings {
      max_surge = "10%"
    }
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.aks.id]
  }

  network_profile {
    network_plugin    = "azure"
    network_policy    = "azure"
    load_balancer_sku = "standard"
    outbound_type     = "userAssignedNATGateway"
    service_cidr      = var.service_cidr
    dns_service_ip    = var.dns_service_ip
  }

  key_vault_secrets_provider {
    secret_rotation_enabled  = true
    secret_rotation_interval = "2m"
  }

  tags = var.tags

  depends_on = [azurerm_role_assignment.aks_network_contributor]
}

resource "azurerm_kubernetes_cluster_node_pool" "user" {
  name                  = "user"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.main.id
  vm_size               = var.user_node_vm_size
  node_count            = var.user_node_count
  vnet_subnet_id        = var.aks_subnet_id
  os_disk_size_gb       = 30
  mode                  = "User"

  upgrade_settings {
    max_surge = "10%"
  }

  tags = var.tags
}
