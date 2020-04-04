resource "azurerm_postgresql_server" "postgresql_server" {
  name                = var.postgresql_server_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rppg_rg.name

  sku_name     = "B_Gen5_1"
   

  storage_profile {
    storage_mb            = "5120"
    backup_retention_days = "7"
    geo_redundant_backup  = "Disabled"
    auto_grow             = "Enabled"
  }

  administrator_login          = var.postgresql_server_administrator_login
  administrator_login_password = var.postgresql_server_administrator_login_password
  version                      = var.postgresql_server_version
  ssl_enforcement              = var.postgresql_server_ssl_enforcement

  tags = {
      environment = "dev"
  }
}

resource "azurerm_postgresql_database" "postgresql_database" {
  name                = var.postgresql_database_name
  resource_group_name = azurerm_resource_group.rppg_rg.name
  server_name         = azurerm_postgresql_server.postgresql_server.name
  charset             = var.postgresql_database_charset
  collation           = var.postgresql_database_collation
}
