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