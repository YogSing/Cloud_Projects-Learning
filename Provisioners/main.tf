resource "azurerm_resource_group" "rg" {
  name     = "provisioner-resources"
  location = "Canada Central"
}

resource "azurerm_virtual_network" "Vnet" {
  name                = "virtual-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "subnet1"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.Vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_public_ip" "publicip" {
  name                = "PublicIp"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"

}

resource "azurerm_network_interface" "nic" {
  name                = "vm-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip.id
  }

}

resource "azurerm_network_security_group" "nsg" {
  name                = "vm-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "SSH"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "HTTP"
    priority                   = 201
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "nsg-association" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "null_resource" "before-deployment" {
  triggers = {
    always_run = timestamp()
  }
  provisioner "local-exec" {
    command = "echo 'Deployment started at ${timestamp()}' > deployment-${replace(timestamp(), ":", "-")}.log"
  }

}

module "ssh_key" {
  source      = "./ssh_key"
  rg          = azurerm_resource_group.rg.name
  rg_id       = azurerm_resource_group.rg.id
  rg_location = azurerm_resource_group.rg.location

}



resource "azurerm_linux_virtual_machine" "vm" {
  name                = "virtual-machine"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = module.ssh_key.key_data
  }

  depends_on = [null_resource.before-deployment]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  provisioner "remote-exec" {

    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx",
      #smaple html page 
      "echo '<html><body><h1>Provisioners should only be used as a last resort!</h1><h2>But we still have to learn :)</h2></body> </html>' | sudo tee /var/www/html/index.html",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx",
    ]
    connection {
      type        = "ssh"
      host        = azurerm_public_ip.publicip.ip_address
      user        = "adminuser"
      private_key = module.ssh_key.private_key
    }
  }

  provisioner "file" {
    source      = "configs/sample.txt"
    destination = "/home/adminuser/sample.txt"
    connection {
      type        = "ssh"
      host        = azurerm_public_ip.publicip.ip_address
      user        = "adminuser"
      private_key = module.ssh_key.private_key
    }
  }

  provisioner "local-exec" {
    command = "echo 'Provisioning completed at ${timestamp()}' > deployment-${replace(timestamp(), ":", "-")}.log"
  }


}

output "vm_name" {
  value = azurerm_linux_virtual_machine.vm.name
}
output "public_ip" {
  value = azurerm_public_ip.publicip.ip_address

}