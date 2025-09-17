# Generic Input Variables
# Business Division
variable "business_divsion" {
  description = "Business Division in the large organization this Infrastructure belongs"
  type = string
  default = "sap"
}
# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type = string
  default = "dev"
}

# Azure Resource Group Name 
variable "resource_group_name" {
  description = "Resource Group Name"
  type = string
  default = "rg-default"  
}

# Azure Resources Location
variable "resource_group_location" {
  description = "Region in which Azure Resources to be created"
  type = string
  default = "eastus2"  
}
variable "mysql_location" {
  type    = string
  default = "eastus2"           # pick a supported region for MySQL Flexible
}

variable "mysql_sku_name" {
  type    = string
  default = "GP_Standard_D2ds_v4"  # choose one that exists in your region
}
