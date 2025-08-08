/* abrir e Fechar comentarios*/

#Create a resource group
resource "azurerm_resource_group" "RG-APP-Services"{
  name = "RG-APP-Services"
  location = "eastus2" 
  tags = { Study_Project = "APP-Services"} 
}

resource "azurerm_resource_group" "RG-Storage" {
  name = "RG-Storage"
  location = "eastus2" 
  tags = { Study_Project = "Storage"} 
}