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
 

}

provider "azapi" {
 

}
