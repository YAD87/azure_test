resource "azurerm_virtual_machine" "web" {
  name                  = "Rppg-WebVM"
  location              = var.location
  resource_group_name   = "${azurerm_resource_group.rppg_rg.name}"
  network_interface_ids = ["${azurerm_network_interface.public_nic_web.id}"]
  vm_size               = "Standard_DS1_v2"

#This will delete the OS disk and data disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

   os_disk {
        name              = "myOsDisk"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        storage_account_type = "Standard_LRS"
    }

  os_profile {
    computer_name  = "webserver"
    admin_username = var.vm_username
  }


  os_profile_linux_config {
    disable_password_authentication = false
  }

  admin_ssh_key {
        username       = "azureuser"
        public_key     =  file("/home/azureuser/.ssh/rppg.pub")
    }


  tags = {
    environment = "dev"
  }
}

resource "azurerm_virtual_machine" "backend" {
  name                  = "Rppg-BackendVM"
  location              = var.location
  resource_group_name   = "${azurerm_resource_group.rppg_rg.name}"
  network_interface_ids = ["${azurerm_network_interface.private_nic_backend.id}"]
  vm_size               = "Standard_DS1_v2"

#This will delete the OS disk and data disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

   os_disk {
        name              = "myOsDisk"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        storage_account_type = "Standard_LRS"
    }

  os_profile {
    computer_name  = "backend"
    admin_username = var.vm_username
  }


  os_profile_linux_config {
    disable_password_authentication = false
  }

  admin_ssh_key {
        username       = "azureuser"
        public_key     =  file("/home/azureuser/.ssh/rppg.pub")
    }


  tags = {
    environment = "dev"
  }
}
