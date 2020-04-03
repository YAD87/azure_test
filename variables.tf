provider "azurerm" {
    # The "feature" block is required for AzureRM provider 2.x.
    # If you're using version 1.x, the "features" block is not allowed.
    version = "~>2.0"
    features {}

}

variable "location" {
  description = "The default Azure region for the resource provisioning"
}


variable "resource_group_name" {
  description = "Resource group name that will contain various resources"
}

variable "subnet1_cidr" {
  description = "CIDR block for Frontend Subnet within a Virtual Network."
}

variable "subnet2_cidr" {
  description = "CIDR block for Backend Subnet within a Virtual Network."
}

variable "vnet_cidr" {
  description = "CIDR block for Frontend Subnet within a Virtual Network."
}

variable "postgresql_server_name" {
  description = "CIDR block for Frontend Subnet within a Virtual Network."
}

variable "postgresql_server_sku_capacity" {
  description = "CIDR block for Frontend Subnet within a Virtual Network."
}

variable "postgresql_server_sku_tier" {
  description = "CIDR block for Frontend Subnet within a Virtual Network."
}

variable "postgresql_server_sku_family" {
  description = "CIDR block for Frontend Subnet within a Virtual Network."
}

variable "postgresql_server_administrator_login" {
  description = "CIDR block for Frontend Subnet within a Virtual Network."
}

variable "postgresql_server_administrator_login_password" {
  description = "CIDR block for Frontend Subnet within a Virtual Network."
}
variable "postgresql_server_version" {
  description = "CIDR block for Frontend Subnet within a Virtual Network."
}

variable "postgresql_server_ssl_enforcement" {
  description = "CIDR block for Frontend Subnet within a Virtual Network."
}

variable "postgresql_database_name" {
  description = "CIDR block for Frontend Subnet within a Virtual Network."
}

variable "postgresql_database_charset" {
  description = "CIDR block for Frontend Subnet within a Virtual Network."
}

variable "postgresql_database_collation" {
  description = "CIDR block for Frontend Subnet within a Virtual Network."
}



variable "vm_username" {
  description = "Enter admin username to SSH into Linux VM"
}
