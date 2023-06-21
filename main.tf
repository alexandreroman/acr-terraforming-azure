terraform {
  required_version = ">= 1.3"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.59.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Get the main Azure resource group.
data "azurerm_resource_group" "acr" {
  name = var.az_res_group
}

# Create a ACR instance in the resource group.
resource "azurerm_container_registry" "acr" {
  name                = var.az_acr_name
  resource_group_name = data.azurerm_resource_group.acr.name
  location            = data.azurerm_resource_group.acr.location
  sku                 = var.az_acr_sku

  # Admin access is enabled so you can easily use "docker pull" or "docker push".
  admin_enabled = true
}
