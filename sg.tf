resource "azurerm_network_security_group" "nsg_web" {
  name 					= "Rppg-Web-NSG"
  location 				= var.location
  resource_group_name 	= "${azurerm_resource_group.rppg_rg.name}"

  security_rule {
	name 						= "AllowSSH"
	priority 					= 100
	direction 					= "Inbound"
	access 						= "Allow"
	protocol 					= "Tcp"
	source_port_range          	= "*"
    destination_port_range     	= "22"
    source_address_prefix      	= "*"
    destination_address_prefix 	= "*"
  }

  security_rule {
	name 						= "AllowHTTP"
	priority					= 200
	direction					= "Inbound"
	access 						= "Allow"
	protocol 					= "Tcp"
	source_port_range          	= "*"
    destination_port_range     	= "80"
    source_address_prefix      	= "Internet"
    destination_address_prefix 	= "*"
  }

  security_rule {
	name 						= "BackendProxy"
	priority					= 200
	direction					= "Inbound"
	access 						= "Allow"
	protocol 					= "Tcp"
	source_port_range          	= "*"
    destination_port_range     	= "8888"
    source_address_prefix      	= var.subnet2_cidr
    destination_address_prefix 	= "*"
  }

  tags = {
	environment = "dev"
  }
}

# resource "azurerm_network_security_group" "nsg_db" {
#   name 					= "Rppg-Backend-NSG"
#   location 				= "${var.location}"
#   resource_group_name 	= "${azurerm_resource_group.rppg_rg.name}"

 

#   security_rule {
# 	name 						= "AllowSQL"
# 	priority					= 200
# 	direction					= "Inbound"
# 	access 						= "Allow"
# 	protocol 					= "Tcp"
# 	source_port_range          	= "*"
#     destination_port_range     	= "5432"
#     source_address_prefix      	= "${var.subnet2_cidr}"
#     destination_address_prefix 	= "*"
#   }

#   security_rule {
# 	name 						= "AllowSSH"
# 	priority 					= 100
# 	direction 					= "Inbound"
# 	access 						= "Allow"
# 	protocol 					= "Tcp"
# 	source_port_range          	= "*"
#     destination_port_range     	= "22"
#     source_address_prefix      	= "${var.subnet1_cidr}"
#     destination_address_prefix 	= "*"
#   }

#   tags {
# 	environment = "dev"
#   }
# }

resource "azurerm_network_security_group" "nsg_back" {
  name 					= "Rppg-Backend-NSG"
  location 				= var.location
  resource_group_name 	= "${azurerm_resource_group.rppg_rg.name}"

 

  

  security_rule {
	name 						= "AllowSSH"
	priority 					= 100
	direction 					= "Inbound"
	access 						= "Allow"
	protocol 					= "Tcp"
	source_port_range          	= "*"
    destination_port_range     	= "22"
    source_address_prefix      	= var.subnet1_cidr
    destination_address_prefix 	= "*"
  }

  security_rule {
	name 						= "BackendProxy"
	priority					= 200
	direction					= "Inbound"
	access 						= "Allow"
	protocol 					= "Tcp"
	source_port_range          	= "*"
    destination_port_range     	= "8888"
    source_address_prefix      	= var.subnet1_cidr
    destination_address_prefix 	= "*"
  }

 




  tags = {
	environment = "dev"
  }
}



