resource "azurerm_resource_group" "RG-Storage" {
  name     = "RG-Storage"
  location = "eastus2"
  tags = {Study_Project = "Storage"}
}
resource "azurerm_resource_group" "RG-ADM" {
  name     = "RG-ADM"
  location = "brazilsouth"
}