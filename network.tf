resource "azurerm_resource_group" "rppg_rg" {
  name 		= "${var.resource_group_name}"
  location 	= "${var.location}"
}
#VNET
resource "azurerm_virtual_network" "rppg_vnet" {
  name 					= "Rppg-VNet"
  address_space 		= ["${var.vnet_cidr}"]
  location 				= "${var.location}"
  resource_group_name 	= "${azurerm_resource_group.rppg_rg.name}"
  
  tags {
	environment = "dev"
  }
}
#SUBNETS

resource "azurerm_subnet" "rppg_subnet_1" {
  name 					= "Rppg-Subnet-1"
  address_prefix 		= "${var.subnet1_cidr}"
  virtual_network_name 	= "${azurerm_virtual_network.rppg_vnet.name}"
  resource_group_name 	= "${azurerm_resource_group.rppg_rg.name}"
}

resource "azurerm_subnet" "rppg_subnet_2" {
  name 					= "Rppg-Subnet-2"
  address_prefix 		= "${var.subnet2_cidr}"
  virtual_network_name 	= "${azurerm_virtual_network.rppg_vnet.name}"
  resource_group_name 	= "${azurerm_resource_group.rppg_rg.name}"
}



