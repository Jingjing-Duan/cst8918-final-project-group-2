resource "azurerm_redis_cache" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  capacity = var.capacity
  family   = "C"
  sku_name = var.sku_name

  redis_version                 = "6"
  non_ssl_port_enabled          = false
  minimum_tls_version           = "1.2"
  public_network_access_enabled = true

  redis_configuration {
  }

  tags = var.tags
}