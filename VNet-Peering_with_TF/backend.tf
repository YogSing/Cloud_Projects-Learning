terraform {
  backend "azurerm" {
    resource_group_name  = "Backend-tsate"
    storage_account_name = "state02084less"
    container_name       = "data"
    key                  = "dev.terraform.tfstate"

  }
}
