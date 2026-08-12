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

resource "azurerm_log_analytics_workspace" "aks" {
  name                = "cst8918-g2-aks-logs"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = {
    Project   = "CST8918 Final Project"
    ManagedBy = "Terraform"
  }
}

module "aks_test" {
  source = "../modules/aks"

  cluster_name               = "cst8918-g2-test-aks"
  dns_prefix                 = "cst8918-g2-test"
  resource_group_name        = azurerm_resource_group.rg.name
  location                   = azurerm_resource_group.rg.location
  log_analytics_workspace_id = azurerm_log_analytics_workspace.aks.id

  subnet_id = azurerm_subnet.subnets["test"].id
  acr_id    = module.acr.id

  kubernetes_version = "1.32"
  sku_tier           = "Premium"
  support_plan       = "AKSLongTermSupport"
  vm_size            = "Standard_B2s"

  enable_auto_scaling = false
  node_count          = 1

  service_cidr   = "172.20.0.0/16"
  dns_service_ip = "172.20.0.10"

  tags = merge(local.member3_common_tags, {
    Environment = "test"
  })
}


module "aks_prod" {
  source = "../modules/aks"

  cluster_name               = "cst8918-g2-prod-aks"
  dns_prefix                 = "cst8918-g2-prod"
  resource_group_name        = azurerm_resource_group.rg.name
  location                   = azurerm_resource_group.rg.location
  log_analytics_workspace_id = azurerm_log_analytics_workspace.aks.id

  subnet_id = azurerm_subnet.subnets["prod"].id
  acr_id    = module.acr.id

  kubernetes_version = "1.32"
  sku_tier           = "Premium"
  support_plan       = "AKSLongTermSupport"
  vm_size            = "Standard_B2s"

  enable_auto_scaling = true
  min_count           = 1
  max_count           = 3

  service_cidr   = "172.21.0.0/16"
  dns_service_ip = "172.21.0.10"

  tags = merge(local.member3_common_tags, {
    Environment = "prod"
  })
}