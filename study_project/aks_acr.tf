#resource "azurerm_container_registry" "unyleyaacr" {
#  name                = "unyleyaacr"
#  location            = azurerm_resource_group.RG-UNYLEYA.location
#  resource_group_name = azurerm_resource_group.RG-UNYLEYA.name
#  sku                 = "Basic"
#}
#
#resource "azurerm_kubernetes_cluster" "unyleya-aks" {
#  name                = "unyleya-aks"
#  location            = azurerm_resource_group.RG-UNYLEYA.location
#  resource_group_name = azurerm_resource_group.RG-UNYLEYA.name
#  dns_prefix          = "unyleya-aks-dns"
#
#  default_node_pool {
#    name       = "default"
#    node_count = 1
#    vm_size    = "Standard_D2_v2"
#  }
#
#  identity {
#    type = "SystemAssigned"
#  }
#
#  tags = {
#    Study_Project = "AKS"
#  }
#}
#
#resource "azurerm_role_assignment" "example" {
#  principal_id                     = azurerm_kubernetes_cluster.unyleya-aks.kubelet_identity[0].object_id
#  role_definition_name             = "AcrPull"
#  scope                            = azurerm_container_registry.unyleyaacr.id
#  skip_service_principal_aad_check = true
#}