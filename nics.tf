resource "azurerm_public_ip" "web_pip" {
  name 				= "rppg_web_ip"
  location 			= var.location
  resource_group_name 		= azurerm_resource_group.rppg_rg.name
  public_ip_address_allocation 	= "static"

  tags {
	environment = "dev"
  }
}

resource "azurerm_network_interface" "public_nic_web" {
  name 		      = "rppg-web"
  location 	      = var.location
  resource_group_name = azurerm_resource_group.rppg_rg.name
  network_security_group_id = azurerm_network_security_group.nsg_web.id

  ip_configuration {
    name 			= "rppg_web_private"
    subnet_id 			= azurerm_subnet.rppg_subnet_1.id
    private_ip_address_allocation = "dynamic"
    public_ip_address_id	= azurerm_public_ip.web_pip.id
  }
  tags {
	environment = "dev"
  }
}

resource "azurerm_network_interface" "private_nic_backend" {
  name 			= "rppg-backend"
  location 		= var.location
  resource_group_name 	= azurerm_resource_group.rppg_rg.name
  network_security_group_id = azurerm_network_security_group.nsg_back.id

  ip_configuration {
    name 			= "Rppg-BackendPrivate"
    subnet_id 			= azurerm_subnet.rppg_subnet_2.id
    private_ip_address_allocation = "static"
    private_ip_address = "192.168.2.5"
  }
  tags {
	environment = "dev"
  }
}

# resource "azurerm_network_interface" "private_nic_db" {
#   name 			= "rppg-db"
#   location 		= "${var.location}"
#   resource_group_name 	= "${azurerm_resource_group.rppg_rg.name}"
#   network_security_group_id = "${azurerm_network_security_group.nsg_db.id}"

#   ip_configuration {
#     name 			= "Rppg-DBPrivate"
#     subnet_id 			= "${azurerm_subnet.rppg_subnet_2.id}"
#     private_ip_address_allocation = "static"
#     private_ip_address = "192.168.2.6"
#   }
#   tags {
# 	environment = "dev"
#   }
# }


