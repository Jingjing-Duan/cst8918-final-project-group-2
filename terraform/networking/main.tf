resource "azurerm_resource_group" "rg" {
  name     = "cst8918-final-project-group-2"
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = "cst8918-vnet"
  address_space       = ["10.0.0.0/14"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnets" {
  for_each             = var.environment_slugs
  name                 = "subnet-${each.key}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [each.value]
}