location = "westeurope"
resource_group_name ="rppg-dev"
subnet1_cidr = "192.168.1.0/24"
vnet_cidr 			= "192.168.0.0/16"
subnet2_cidr		= "192.168.2.0/24"
postgresql_server_name                         = "postgres-dev"
postgresql_server_sku_capacity = 2
postgresql_server_sku_tier = "GeneralPurpose"
postgresql_server_sku_family   = "Gen5"
postgresql_server_administrator_login          = "psqladmin"
postgresql_server_administrator_login_password = "psqldevBase1"
postgresql_server_version                      = "9.5"
postgresql_server_ssl_enforcement = "Enabled"
postgresql_database_name = "rppg-back"
postgresql_database_charset   = "UTF8"
postgresql_database_collation = "English_United States.1252"
vm_username = "azureuser"



