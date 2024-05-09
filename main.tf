terraform {
  required_version = ">=1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }
  }
  cloud {
    organization = "terraform_azure_cloud_guru"

    workspaces {
      name = "terraformcli_cloud_guru"
    }
  }
}


provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "809-a7218fb1-deploy-to-azure-using-the-terraform-c"
  location = "East US"

}

resource "azurerm_storage_account" "storage" {
  account_replication_type = "LRS"
  account_tier             = "Standard"
  location                 = azurerm_resource_group.rg.location
  name                     = "stgrcaiml001"
  resource_group_name      = azurerm_resource_group.rg.name

}