# resource "azurerm_resource_group" "rg" {
#   name     = "rg-terraform"
#   location = "Canada East"

# }

resource "azurerm_resource_group" "rg1" {
  name     = "rg-terraform"
  location = "west us2"

}