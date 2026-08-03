terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.81.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-prod"
    storage_account_name = "stprodterraform1"
    container_name       = "tfstate"
    key                  = "preprod_terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}