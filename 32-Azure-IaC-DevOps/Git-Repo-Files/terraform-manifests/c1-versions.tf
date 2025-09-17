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
    null = {
      source = "hashicorp/null"
      version = ">= 3.0"
    }    
  }
# Terraform State Storage to Azure Storage Container (Values will be taken from Azure DevOps)
  backend "azurerm" {
  #resource_group_name   = "terraform-storage-rg"
    #storage_account_name  = "terraformstate888"
    #container_name        = "tfstatefiles"
    #key                   = "dev-terraform.tfstate"  
    #sas_token = var.tfstate_sas_token
  }   
}

# Provider Block
provider "azurerm" {
  features {}
subscription_id = "0e6c5fc5-3180-4de5-923a-4eb74fafaafc"
tenant_id       = "2652e19c-101f-4022-867c-3bffe73ea6d5"
}

#TEst CI CD
#Test till QA
#Test till QA 05Aug

