# Terraform Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0"
    }
  }
}

# Provider Block
provider "azurerm" {
  features {}
 subscription_id = "0e6c5fc5-3180-4de5-923a-4eb74fafaafc"
 tenant_id       = "2652e19c-101f-4022-867c-3bffe73ea6d5"
}

