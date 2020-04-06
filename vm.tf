resource "azurerm_linux_virtual_machine" "managment" {
  name                  = "Rppg-ManagmentVM"
  location              = var.location
  resource_group_name   = azurerm_resource_group.rppg_rg.name
  network_interface_ids = [azurerm_network_interface.public_nic_managment.id]
  size               = "Basic_A1"

#This will delete the OS disk and data disk automatically when deleting the VM
  

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

   os_disk {
        name              = "managment-os"
        caching           = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

 
    computer_name  = "ops"
    admin_username = var.vm_username
    disable_password_authentication = true


  admin_ssh_key {
        username       = "azureuser"
        public_key     =  file("/home/nikhil/.ssh/rppg.pub")
    }


  tags = {
    environment = "dev"
  }
}



resource "azurerm_linux_virtual_machine" "web" {
  name                  = "Rppg-WebVM"
  location              = var.location
  resource_group_name   = azurerm_resource_group.rppg_rg.name
  network_interface_ids = [azurerm_network_interface.public_nic_web.id]
  size               = "Basic_A1"

#This will delete the OS disk and data disk automatically when deleting the VM
  

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

   os_disk {
        name              = "web-os"
        caching           = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

 
    computer_name  = "webserver"
    admin_username = var.vm_username
    disable_password_authentication = true


  admin_ssh_key {
        username       = "azureuser"
        public_key     =  file("/home/nikhil/.ssh/rppg.pub")
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
  size               = "Basic_A1"

#This will delete the OS disk and data disk automatically when deleting the VM
  

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

   os_disk {
        name              = "backend-os"
        caching           = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

  
    computer_name  = "backend"
    admin_username = var.vm_username
    disable_password_authentication = true

  admin_ssh_key {
        username       = "azureuser"
        public_key     =  file("/home/nikhil/.ssh/rppg.pub")
    }


  tags = {
    environment = "dev"
  }
}


resource "azurerm_linux_virtual_machine" "db" {
  name                  = "Rppg-DBVM"
  location              = var.location
  resource_group_name   = azurerm_resource_group.rppg_rg.name
  network_interface_ids = [azurerm_network_interface.private_nic_db.id]
  size               = "Basic_A1"

#This will delete the OS disk and data disk automatically when deleting the VM
  

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

   os_disk {
        name              = "db-os"
        caching           = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

  
    computer_name  = "db"
    admin_username = var.vm_username
    disable_password_authentication = true

  admin_ssh_key {
        username       = "azureuser"
        public_key     =  file("/home/nikhil/.ssh/rppg.pub")
    }


  tags = {
    environment = "dev"
  }
}

resource "azurerm_managed_disk" "db_disk" {
  name                 = "db-data"
  location             = var.location
  resource_group_name  = azurerm_resource_group.rppg_rg.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
}

resource "azurerm_virtual_machine_data_disk_attachment" "db_attach" {
  managed_disk_id    = azurerm_managed_disk.db_disk.id
  virtual_machine_id = azurerm_linux_virtual_machine.db.id
  lun                = "10"
  caching            = "ReadWrite"
}

