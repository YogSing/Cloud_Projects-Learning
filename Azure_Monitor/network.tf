# This file contains the configuration for the virtual networks and subnets in Azure. 
# Resource group
resource "azurerm_resource_group" "RG" {
  name     = "Monitoring-Resource-Group"
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

# NSG 

resource "azurerm_network_security_group" "NSG" {
  name                = "NSG-1"
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name

  security_rule {
    name                       = "Allow-SSH"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow" # Action allow or deny
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*" # Add your trusted IP address or range here
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow-HTTP"
    priority                   = 201
    direction                  = "Inbound"
    access                     = "Allow" # Action allow or deny
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*" # Add your trusted IP address or range here
    destination_address_prefix = "*"
  }
}

# NSG association with subnet
resource "azurerm_subnet_network_security_group_association" "vnet1-subnet-nsg" {
  subnet_id                 = azurerm_subnet.vnet1-subnet.id
  network_security_group_id = azurerm_network_security_group.NSG.id
}
