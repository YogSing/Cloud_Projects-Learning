terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.8.0"

    }
    azapi = {
      source  = "azure/azapi"
      version = "~>1.5"
    }
  }


  required_version = ">=1.9.0"
}

provider "azurerm" {
  features {}
  subscription_id = "ddd46a73-d9f0-4223-a18d-1dd4c4b8c68c"

}

provider "azapi" {
  subscription_id = "ddd46a73-d9f0-4223-a18d-1dd4c4b8c68c"

}
