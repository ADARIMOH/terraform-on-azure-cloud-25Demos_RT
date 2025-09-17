# Resource-1: Azure MySQL Server
/*resource "azurerm_mysql_server" "mysql_server" {
  name                = "${local.resource_name_prefix}-${var.mysql_db_name}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  administrator_login          = var.mysql_db_username
  administrator_login_password = var.mysql_db_password

  #sku_name   = "B_Gen5_2" # Basic Tier - Azure Virtual Network Rules not supported
  sku_name   = "GP_Gen5_2" # General Purpose Tier - Supports Azure Virtual Network Rules
  storage_mb = 5120
  version    = "8.0"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = false
  ssl_minimal_tls_version_enforced  = "TLSEnforcementDisabled" 

}*/

# MySQL Flexible Server (replaces azurerm_mysql_server)
/*resource "azurerm_mysql_flexible_server" "mysql" {
  name                = "${local.resource_name_prefix}-${var.mysql_db_name}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  administrator_login    = var.mysql_db_username
  administrator_password = var.mysql_db_password

  # Choose a small, general-purpose SKU for labs; adjust as needed
  sku_name  = "GP_Standard_D2ds_v4"
  version   = "8.0.21"

  backup_retention_days          = 7
  #public_network_access_enabled  = true  # using public access + firewall rule below
  public_network_access = "Enabled"

  storage {
    size_gb = 64
  }
}*/

resource "azurerm_mysql_flexible_server" "mysql" {
  name                = "${local.resource_name_prefix}-${var.mysql_db_name}"
  #location            = azurerm_resource_group.rg.location
  location            = var.mysql_location
  resource_group_name = azurerm_resource_group.rg.name

  administrator_login    = var.mysql_db_username
  administrator_password = var.mysql_db_password

  version   = "8.0.21"
  #sku_name  = "GP_Standard_D2ds_v4"
  sku_name  = var.mysql_sku_name

  public_network_access = "Enabled"  # use "Disabled" if you later go private (delegated subnet)

  backup_retention_days = 7

  storage {
    size_gb = 64
  }
}



# Resource-2: Azure MySQL Database / Schema
/*resource "azurerm_mysql_database" "webappdb" {
  name                = var.mysql_db_schema
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_mysql_server.mysql_server.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}
*/

# Database (replaces azurerm_mysql_database)
resource "azurerm_mysql_flexible_database" "webappdb" {
  name                = var.mysql_db_schema
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_mysql_flexible_server.mysql.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}


# Resource-3: Azure MySQL Firewall Rule - Allow access from Bastion Host Public IP
/*resource "azurerm_mysql_firewall_rule" "mysql_fw_rule" {
  name                = "allow-access-from-bastionhost-publicip"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_mysql_server.mysql_server.name
  start_ip_address    = azurerm_public_ip.bastion_host_publicip.ip_address
  end_ip_address      = azurerm_public_ip.bastion_host_publicip.ip_address
}*/

# Firewall rule (replaces azurerm_mysql_firewall_rule)
resource "azurerm_mysql_flexible_server_firewall_rule" "mysql_fw_rule" {
  name                = "allow-access-from-bastionhost-publicip"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_mysql_flexible_server.mysql.name
  start_ip_address    = azurerm_public_ip.bastion_host_publicip.ip_address
  end_ip_address      = azurerm_public_ip.bastion_host_publicip.ip_address
}

# Resource-4: Azure MySQL Virtual Network Rule
/*resource "azurerm_mysql_virtual_network_rule" "mysql_virtual_network_rule" {
  name                = "mysql-vnet-rule"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_mysql_server.mysql_server.name
  subnet_id           = azurerm_subnet.websubnet.id
}*/
