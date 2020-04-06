output "web" {
  value = "${azurerm_public_ip.web_pip.ip_address}"
}

output "managment" {
  value = "${azurerm_public_ip.managment_pip.ip_address}"
}

output "backend" {
  value = "${azurerm_network_interface.private_nic_backend.private_ip_address}"
}

output "db" {
  value = "${azurerm_network_interface.private_nic_db.private_ip_address}"
}








