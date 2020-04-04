resource "azurerm_linux_virtual_machine" "web" {
  name                  = "Rppg-WebVM"
  location              = var.location
  resource_group_name   = azurerm_resource_group.rppg_rg.name
  network_interface_ids = [azurerm_network_interface.public_nic_web.id]
  size               = "Standard_B1ls"

#This will delete the OS disk and data disk automatically when deleting the VM
  

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

   os_disk {
        name              = "myOsDisk"
        caching           = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

 
    computer_name  = "webserver"
    admin_username = var.vm_username
    disable_password_authentication = true


  admin_ssh_key {
        username       = "azureuser"
        public_key     =  file("/home/denys/.ssh/rppg.pub")
    }


  tags = {
    environment = "dev"
  }
}

resource "azurerm_linux_virtual_machine" "backend" {
  name                  = "Rppg-BackendVM"
  location              = var.location
  resource_group_name   = azurerm_resource_group.rppg_rg.name
  network_interface_ids = [azurerm_network_interface.private_nic_backend.id]
  size               = "Standard_B1ls"

#This will delete the OS disk and data disk automatically when deleting the VM
  

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

   os_disk {
        name              = "myOsDisk"
        caching           = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

  
    computer_name  = "backend"
    admin_username = var.vm_username
    disable_password_authentication = true

  admin_ssh_key {
        username       = "azureuser"
        public_key     =  file("/home/denys/.ssh/rppg.pub")
    }


  tags = {
    environment = "dev"
  }
}
