terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "$RESOURCE_GROUP_NAME"
    storage_account_name = "$TF_VAR_sta_name"
    container_name       = "$CONTAINER_NAME"
    key                  = "$KEY"
  }
}

