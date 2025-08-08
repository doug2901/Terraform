resource "azurerm_resource_group" "RG-VM" {
  name     = "RG-VM"
  location = "eastus2"
}
resource "azurerm_resource_group" "RG-ADM" {
  name     = "RG-ADM"
  location = "brazilsouth"
}
#resource "azurerm_resource_group" "RG-UNYLEYA" {
#  name     = "RG-UNYLEYA"
#  location = "eastus2"
#}
resource "azurerm_resource_group" "RG-AKS" {
  name     = "RG-AKS"
  location = "eastus2"
}