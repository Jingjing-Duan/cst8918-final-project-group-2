output "id" {
  description = "Resource ID of the Redis instance"
  value       = azurerm_redis_cache.this.id
}

output "name" {
  description = "Name of the Redis instance"
  value       = azurerm_redis_cache.this.name
}

output "hostname" {
  description = "Hostname used by the Weather App"
  value       = azurerm_redis_cache.this.hostname
}

output "ssl_port" {
  description = "TLS port used by the Weather App"
  value       = azurerm_redis_cache.this.ssl_port
}

output "primary_access_key" {
  description = "Primary Redis access key"
  value       = azurerm_redis_cache.this.primary_access_key
  sensitive   = true
}