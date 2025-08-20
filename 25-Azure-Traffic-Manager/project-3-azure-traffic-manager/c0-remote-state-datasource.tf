# Project-1: East US2 Datasource
data "terraform_remote_state" "project1_eastus2" {
  backend = "azurerm"
  config = {
    resource_group_name   = "terraform-storage-rg"
    storage_account_name  = "terraformstate888"
    container_name        = "tfstatefiles"
    key                   = "project-1-eastus2-terraform.tfstate"
    #use_azuread_auth     = true # --MA
    sas_token = var.tfstate_sas_token
  }
}

# Project-2: West US2 Datasource
data "terraform_remote_state" "project2_westus2" {
  backend = "azurerm"
  config = {
    resource_group_name   = "terraform-storage-rg"
    storage_account_name  = "terraformstate888"
    container_name        = "tfstatefiles"
    key                   = "project-2-westus2-terraform.tfstate"
    #use_azuread_auth     = true  # --MA
    sas_token = var.tfstate_sas_token
  }
}

/* 
1. Project-1: Web LB Public IP Address
data.terraform_remote_state.project1_eastus2.outputs.web_lb_public_ip_address_id
1. Project-2: Web LB Public IP Address
data.terraform_remote_state.project2_westus2.outputs.web_lb_public_ip_address_id
*/