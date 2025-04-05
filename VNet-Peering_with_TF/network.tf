# This file contains the configuration for the virtual networks and subnets in Azure. 
# Resource group
resource "azurerm_resource_group" "RG" {
  name     = "Vnet-Peering-RG"
  location = "East US"
  tags = {
    environment = "Created with Terraform"
  }
}
# Virtual Network 1
resource "azurerm_virtual_network" "vnet1" {
  name                = "Virtual-Network-1"
  resource_group_name = azurerm_resource_group.RG.name
  location            = azurerm_resource_group.RG.location
  address_space       = ["10.0.0.0/16"]
}
# Virtual Network -subnet 1
resource "azurerm_subnet" "vnet1-subnet" {
  name                 = "Virtual-Network-1-Subnet"
  resource_group_name  = azurerm_resource_group.RG.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.0.0.0/26"]
}

# Virtual Network 2
resource "azurerm_virtual_network" "vnet2" {
  name                = "Virtual-Network-2"
  resource_group_name = azurerm_resource_group.RG.name
  location            = azurerm_resource_group.RG.location
  address_space       = ["10.1.0.0/16"]
}
# Virtual Network -subnet 2
resource "azurerm_subnet" "vnet2-subnet" {
  name                 = "Virtual-Network-2-Subnet"
  resource_group_name  = azurerm_resource_group.RG.name
  virtual_network_name = azurerm_virtual_network.vnet2.name
  address_prefixes     = ["10.1.0.0/26"]
}

# Vnet 1 to Vnet 2 peering
resource "azurerm_virtual_network_peering" "vnet1-to-vnet2" {
  name                      = "Vnet1-to-Vnet2-Peering"
  resource_group_name       = azurerm_resource_group.RG.name
  virtual_network_name      = azurerm_virtual_network.vnet1.name
  remote_virtual_network_id = azurerm_virtual_network.vnet2.id
}

# Vnet 2 to Vnet 1 peering
resource "azurerm_virtual_network_peering" "vnet2-to-vnet1" {
  name                      = "Vnet2-to-Vnet1-Peering"
  resource_group_name       = azurerm_resource_group.RG.name
  virtual_network_name      = azurerm_virtual_network.vnet2.name
  remote_virtual_network_id = azurerm_virtual_network.vnet1.id
}