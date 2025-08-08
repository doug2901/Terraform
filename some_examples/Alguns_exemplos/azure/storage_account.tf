resource "azurerm_storage_account" "dnfcorpsacloudshell" {
 name                     = "dnfcorpsacloudshell"
  resource_group_name      = azurerm_resource_group.RG-Storage.name
  location                 = azurerm_resource_group.RG-Storage.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {ms-resource-usage = "azure-cloud-shell"}
}