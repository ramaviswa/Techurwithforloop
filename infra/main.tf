##Backenddetails
terraform {
  backend "azurerm" {}
}

## The below lines from 2 to 9 are providers details of terraform
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.6.0"
    }
  }
}


##The below lines for features details for azurerm
provider "azurerm" {
  features {   
  }
}

module "techurrg" {
    source = "./resources/resourcegroup"
    resourcegroup = var.techurrg
    location = var.techurlocation
}
module "techurvnet" {
  source = "./resources/vnet"
  virtualnetwork = var.techurvnet
  resourcegroup = module.techurrg.resourcegroupoutput
  location = var.techurlocation
}

module "azusers" {
  source = "./resources/azureusers"
  userslist = var.techuruserslist

}

module "roleassigntorg" {
  source = "./resources/roleassignment"
  role_definition_name = var.techurrole
  rg = module.techurrg.resourcegroupoutput
  users = module.azusers.userlistoutput
}
