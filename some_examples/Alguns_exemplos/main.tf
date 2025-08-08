terraform {
  backend "s3" {
    # Lembre de trocar o bucket para o seu, não pode ser o mesmo nome
    bucket  = "terraformbucketdoug29"
    key     = "my-terraform.tfstate"
    region  = "us-east-2"
    encrypt = true
  }

  required_providers {
    aws = {
      version = "~> 3.0"
      source  = "hashicorp/aws"
    }
    azurerm = {
      source = "hashicorp/azurerm"
    version = "~> 2.42.0" }
  }
}

# Configure the Azure Provider
provider "azurerm" {
  #alias = "Azure"
  subscription_id = "aa5e6421-56b7-48bf-b549-4367bb60988f"
  client_id       = "douglasnoronha29hotmail.onmicrosoft.com"
  tenant_id       = "00ccdb16-2390-47d6-acd3-7fc45e0e3541"
  features {}
}
# Configure the AWS Provider
provider "aws" {
  #alias = "AWS"
  region = "us-east-2"
}