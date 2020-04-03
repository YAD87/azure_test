output "web" {
  value = "${azurerm_public_ip.web_pip.ip_address}"
}

output "postgresql_server_name" {
  value = "${azurerm_postgresql_server.postgresql_server.name}"
}



