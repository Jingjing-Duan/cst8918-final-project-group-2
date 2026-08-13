terraform {
  backend "azurerm" {
    storage_account_name = "cst8918g2tfstatestorage"
    container_name       = "tfstate"
    key                  = "networking.tfstate"

    use_azuread_auth = true
  }
}
