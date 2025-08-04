# Terraform Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0" 
    }
    random = {
      source = "hashicorp/random"
      version = ">= 3.0"
    }
  }
}

# Provider Block
provider "azurerm" {
  features {}
subscription_id = "455c3b60-50c3-47d1-9e54-ec046e2686b9"
tenant_id       = "d77ec4e8-c88b-431b-8d7f-77755a4bbefc"
}

