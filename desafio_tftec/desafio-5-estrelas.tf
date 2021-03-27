resource "azurerm_resource_group" "RG-DESAFIO"{
  name = "RG-DESAFIO"
  location = "eastus2" 
  tags = { Study_Project = "Desafio_5_estrelas"} 
}

resource "azurerm_virtual_network" "VNET-DESAFIO" {
  name                = "VNET-DESAFIO"
  location            = azurerm_resource_group.RG-DESAFIO.location
  resource_group_name = azurerm_resource_group.RG-DESAFIO.name
  address_space       = ["172.16.0.0/16"]

  subnet {
    name           = "LAN_DESAFIO"
    address_prefix = "172.16.1.0/24"
  }

tags = { Study_Project = "Desafio_5_estrelas"}
}

resource "azurerm_virtual_machine" "VM-LNX-DOUG-N-FERREIRA" {
  name                  = "VM-LNX-DOUG-N-FERREIRA"
  location              = azurerm_resource_group.RG-DESAFIO.location
  resource_group_name   = azurerm_resource_group.RG-DESAFIO.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_B1s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "thanos"
    admin_password = "Thanos@19549"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = { Study_Project = "Desafio_5_estrelas"}
}