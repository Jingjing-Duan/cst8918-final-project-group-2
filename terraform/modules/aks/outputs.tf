output "id" {
  description = "Resource ID of the AKS cluster"
  value       = azurerm_kubernetes_cluster.this.id
}

output "name" {
  description = "Name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.this.name
}

output "resource_group_name" {
  description = "Resource group containing the AKS cluster"
  value       = azurerm_kubernetes_cluster.this.resource_group_name
}

output "node_resource_group" {
  description = "Resource group containing AKS-managed node resources"
  value       = azurerm_kubernetes_cluster.this.node_resource_group
}

output "fqdn" {
  description = "FQDN of the AKS API server"
  value       = azurerm_kubernetes_cluster.this.fqdn
}

output "kubelet_identity_object_id" {
  description = "Object ID receiving AcrPull permission"
  value       = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id
}