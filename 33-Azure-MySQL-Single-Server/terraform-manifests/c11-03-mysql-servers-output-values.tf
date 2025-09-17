# Output Values
/*output "mysql_server_fqdn" {
  description = "MySQL Server FQDN"
  value = azurerm_mysql_server.mysql_server.fqdn
}*/

output "mysql_server_fqdn" {
  value = azurerm_mysql_flexible_server.mysql.fqdn
}

output "mysql_database_name" {
  value = azurerm_mysql_flexible_database.webappdb.name
}