# Provider Block
provider "azurerm" {
  features {}
 subscription_id = "0e6c5fc5-3180-4de5-923a-4eb74fafaafc"
 tenant_id       = "2652e19c-101f-4022-867c-3bffe73ea6d5"
}

# Random String Resource
resource "random_string" "myrandom" {
  length  = 6
  upper   = false
  special = false
  numeric  = false
}

# Create Resource Group
resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.location
}

# Create Azure Storage account
resource "azurerm_storage_account" "storage_account" {
  name                = "${var.storage_account_name}${random_string.myrandom.id}"
  resource_group_name = azurerm_resource_group.resource_group.name

  location                 = var.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  account_kind             = var.storage_account_kind

  #static_website {
  #  index_document     = var.static_website_index_document
  #  error_404_document = var.static_website_error_404_document
  #}

   # (optional hardening)
  https_traffic_only_enabled    = true
  min_tls_version               = "TLS1_2"
  public_network_access_enabled = true
 }
 
 ## NEW: Use the dedicated resource (replaces deprecated inline block)
  resource "azurerm_storage_account_static_website" "site" {
  storage_account_id = azurerm_storage_account.storage_account.id
  index_document     = var.static_website_index_document
  error_404_document = var.static_website_error_404_document
 }


