output "acr_id" {
  description = "Resource ID of the shared Azure Container Registry"
  value       = module.acr.id
}

output "acr_name" {
  description = "Name of the shared Azure Container Registry"
  value       = module.acr.name
}

output "acr_login_server" {
  description = "Login server used to push and pull Weather App images"
  value       = module.acr.login_server
}
output "test_redis_name" {
  description = "Name of the test Redis instance"
  value       = module.redis_test.name
}

output "test_redis_hostname" {
  description = "Redis hostname for the test environment"
  value       = module.redis_test.hostname
}

output "test_redis_ssl_port" {
  description = "Redis TLS port for the test environment"
  value       = module.redis_test.ssl_port
}

output "test_redis_primary_access_key" {
  description = "Primary Redis key for the test environment"
  value       = module.redis_test.primary_access_key
  sensitive   = true
}

output "prod_redis_name" {
  description = "Name of the production Redis instance"
  value       = module.redis_prod.name
}

output "prod_redis_hostname" {
  description = "Redis hostname for the production environment"
  value       = module.redis_prod.hostname
}

output "prod_redis_ssl_port" {
  description = "Redis TLS port for the production environment"
  value       = module.redis_prod.ssl_port
}

output "prod_redis_primary_access_key" {
  description = "Primary Redis key for the production environment"
  value       = module.redis_prod.primary_access_key
  sensitive   = true
}


output "test_aks_id" {
  description = "Resource ID of the test AKS cluster"
  value       = module.aks_test.id
}

output "test_aks_name" {
  description = "Name of the test AKS cluster"
  value       = module.aks_test.name
}

output "test_aks_resource_group_name" {
  description = "Resource group containing the test AKS cluster"
  value       = module.aks_test.resource_group_name
}

output "test_aks_node_resource_group" {
  description = "Node resource group of the test AKS cluster"
  value       = module.aks_test.node_resource_group
}

output "prod_aks_id" {
  description = "Resource ID of the production AKS cluster"
  value       = module.aks_prod.id
}

output "prod_aks_name" {
  description = "Name of the production AKS cluster"
  value       = module.aks_prod.name
}

output "prod_aks_resource_group_name" {
  description = "Resource group containing the production AKS cluster"
  value       = module.aks_prod.resource_group_name
}

output "prod_aks_node_resource_group" {
  description = "Node resource group of the production AKS cluster"
  value       = module.aks_prod.node_resource_group
}