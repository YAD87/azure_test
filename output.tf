output "web" {
  value = "${azurerm_public_ip.web_pip.ip_address}"
}

output "backend" {
  value = "${private_ip_address.private_nic_backend.ip_address}"
}
output "postgresql_server_name" {
  value = "${azurerm_postgresql_server.postgresql_server.name}"
}



