terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.97.1"
    }
    oci = {
      source  = "hashicorp/oci"
      version = "5.39.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "RG-Storage"
    storage_account_name = "dnfcorpterraform"
    container_name       = "tfstate"
    key                  = "study.terraform.tfstate"
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Configure the Oracle Cloud Infrastructure Provider
provider "oci" {
  region           = var.oci_region
  tenancy_ocid     = var.oci_tenancy_ocid
  user_ocid        = var.oci_user_ocid
  fingerprint      = var.oci_fingerprint
  private_key_path = var.oci_private_key_path
}
