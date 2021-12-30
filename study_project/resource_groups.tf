resource "azurerm_resource_group" "RG-VM" {
  name     = "RG-VM"
  location = "eastus2"
}
resource "azurerm_resource_group" "RG-ADM" {
  name     = "RG-ADM"
  location = "brazilsouth"
}