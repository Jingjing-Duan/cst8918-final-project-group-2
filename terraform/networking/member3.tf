locals {
  member3_common_tags = {
    Course    = "CST8918"
    Project   = "Final Project"
    Group     = "2"
    ManagedBy = "Terraform"
  }
}

module "acr" {
  source = "../modules/acr"

  name                = "cst8918g2weatheracr"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  tags = merge(local.member3_common_tags, {
    Environment = "shared"
  })
}
module "redis_test" {
  source = "../modules/redis"

  name                = "cst8918-g2-weather-test-redis"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  sku_name = "Basic"
  capacity = 0

  tags = merge(local.member3_common_tags, {
    Environment = "test"
  })
}

module "redis_prod" {
  source = "../modules/redis"

  name                = "cst8918-g2-weather-prod-redis"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  sku_name = "Basic"
  capacity = 0

  tags = merge(local.member3_common_tags, {
    Environment = "prod"
  })
}