resource "azurerm_public_ip" "web_pip" {
  name 				= "rppg_web_ip"
  location 			= var.location
  resource_group_name 		= azurerm_resource_group.rppg_rg.name
  allocation_method 	= "Static"

  tags = {
	environment = "dev"
  }
}

resource "azurerm_public_ip" "managment_pip" {
  name 				= "rppg_managment_ip"
  location 			= var.location
  resource_group_name 		= azurerm_resource_group.rppg_rg.name
  allocation_method 	= "Static"

  tags = {
	environment = "dev"
  }
}

resource "azurerm_network_interface" "public_nic_managment" {
  name 		      = "rppg-managment"
  location 	      = var.location
  resource_group_name = azurerm_resource_group.rppg_rg.name
  

  ip_configuration {
    name 			= "rppg_managment_private"
    subnet_id 			= azurerm_subnet.rppg_subnet_1.id
    private_ip_address_allocation = "dynamic"
    public_ip_address_id	= azurerm_public_ip.managment_pip.id
  }
  tags = {
	environment = "dev"
  }
}

resource "azurerm_network_interface" "public_nic_web" {
  name 		      = "rppg-web"
  location 	      = var.location
  resource_group_name = azurerm_resource_group.rppg_rg.name
  

  ip_configuration {
    name 			= "rppg_web_private"
    subnet_id 			= azurerm_subnet.rppg_subnet_1.id
    private_ip_address = "192.168.1.4"
    private_ip_address_allocation = "static"
    public_ip_address_id	= azurerm_public_ip.web_pip.id
  }
  tags = {
	environment = "dev"
  }
}

resource "azurerm_network_interface" "private_nic_backend" {
  name 			= "rppg-backend"
  location 		= var.location
  resource_group_name 	= azurerm_resource_group.rppg_rg.name
  

  ip_configuration {
    name 			= "Rppg-BackendPrivate"
    subnet_id 			= azurerm_subnet.rppg_subnet_2.id
    private_ip_address_allocation = "static"
    private_ip_address = "192.168.2.5"
  }
  tags = {
	environment = "dev"
  }
}

resource "azurerm_network_interface_security_group_association" "web" {
    network_interface_id      = azurerm_network_interface.public_nic_web.id
    network_security_group_id = azurerm_network_security_group.nsg_web.id
}

resource "azurerm_network_interface_security_group_association" "managment" {
    network_interface_id      = azurerm_network_interface.public_nic_managment.id
    network_security_group_id = azurerm_network_security_group.nsg_managment.id
}

resource "azurerm_network_interface_security_group_association" "backend" {
    network_interface_id      = azurerm_network_interface.private_nic_backend.id
    network_security_group_id = azurerm_network_security_group.nsg_back.id
}

resource "azurerm_network_interface_security_group_association" "backend_pv" {
    network_interface_id      = azurerm_network_interface.private_nic_backend_pv.id
    network_security_group_id = azurerm_network_security_group.nsg_back.id
}

resource "azurerm_network_interface_security_group_association" "db" {
    network_interface_id      = azurerm_network_interface.private_nic_db.id
    network_security_group_id = azurerm_network_security_group.nsg_db.id
}

 resource "azurerm_network_interface" "private_nic_db" {
   name 			= "rppg-db"
   location 		= var.location
   resource_group_name 	= azurerm_resource_group.rppg_rg.name
   

   ip_configuration {
     name 			= "Rppg-DBPrivate"
     subnet_id 			= azurerm_subnet.rppg_subnet_2.id
     private_ip_address_allocation = "static"
     private_ip_address = "192.168.2.6"
   }
   tags = {
 	environment = "dev"
   }
 }

resource "azurerm_network_interface" "private_nic_backend_pv" {
   name 			= "rppg-backend_pv"
   location 		= var.location
   resource_group_name 	= azurerm_resource_group.rppg_rg.name
   

   ip_configuration {
     name 			= "Rppg-BackendPVPrivate"
     subnet_id 			= azurerm_subnet.rppg_subnet_2.id
     private_ip_address_allocation = "static"
     private_ip_address = "192.168.2.7"
   }
   tags = {
 	environment = "dev"
   }
 }


