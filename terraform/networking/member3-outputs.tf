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