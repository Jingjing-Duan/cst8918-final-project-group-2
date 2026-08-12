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