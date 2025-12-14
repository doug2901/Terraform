terraform {
  required_version = ">=v1.12.1"
  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.38.1"
    }
  }

  backend "azurerm" {
    resource_group_name  = "RG-Storage"
    storage_account_name = "dnfcorpterraform"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

module "azure" {
  source = "./azure"
}
#