resource "azurerm_user_assigned_identity" "aks" {
  name                = "${var.cluster_name}-identity"
  resource_group_name = var.resource_group_name
  location            = var.location

  tags = var.tags
}

resource "azurerm_role_assignment" "network_contributor" {
  scope                = var.subnet_id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.aks.principal_id

  skip_service_principal_aad_check = true
}

# GitHub-hosted runners use changing outbound IP addresses for the required
# test and production deployment workflows.
#tfsec:ignore:azure-container-limit-authorized-ips
resource "azurerm_kubernetes_cluster" "this" {
  name                = var.cluster_name
  resource_group_name = var.resource_group_name
  location            = var.location

  dns_prefix         = var.dns_prefix
  kubernetes_version = var.kubernetes_version

  sku_tier                  = var.sku_tier
  support_plan              = var.support_plan
  automatic_channel_upgrade = "patch"

  node_resource_group = "${var.cluster_name}-nodes-rg"

  role_based_access_control_enabled = true

  default_node_pool {
    name                = "system"
    vm_size             = var.vm_size
    vnet_subnet_id      = var.subnet_id
    type                = "VirtualMachineScaleSets"
    os_disk_size_gb     = 30
    enable_auto_scaling = var.enable_auto_scaling

    node_count = var.enable_auto_scaling ? null : var.node_count
    min_count  = var.enable_auto_scaling ? var.min_count : null
    max_count  = var.enable_auto_scaling ? var.max_count : null
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.aks.id]
  }
  oms_agent {
    log_analytics_workspace_id      = var.log_analytics_workspace_id
    msi_auth_for_monitoring_enabled = true
  }


  network_profile {
    network_plugin    = "azure"
    network_policy    = "azure"
    load_balancer_sku = "standard"

    service_cidr   = var.service_cidr
    dns_service_ip = var.dns_service_ip
  }

  tags = var.tags

  depends_on = [
    azurerm_role_assignment.network_contributor
  ]
}

resource "azurerm_role_assignment" "acr_pull" {
  scope                = var.acr_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id

  skip_service_principal_aad_check = true
}