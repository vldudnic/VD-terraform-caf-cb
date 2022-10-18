terraform {
  required_providers {
  }
  required_version = ">= 0.15"
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = var.provider_azurerm_features_keyvault.purge_soft_delete_on_destroy
    }
  }
}

provider "azurerm" {
  alias                      = "vhub"
  skip_provider_registration = true
  features {}
  subscription_id = data.azurerm_client_config.default.subscription_id
  tenant_id       = data.azurerm_client_config.default.tenant_id
}

data "azurerm_client_config" "default" {}


module "caf" {
  source  = "aztfmod/caf/azurerm"
  version = ">=5.4.2"
 # version = "5.4.2"

  providers = {
    azurerm.vhub = azurerm.vhub
  }

  global_settings             = var.global_settings
  resource_groups             = var.resource_groups
#  logged_user_objectId        = var.logged_user_objectId
  keyvaults = var.keyvaults


  compute = {
    virtual_machines = var.virtual_machines
  }

  networking = {
    public_ip_addresses = var.public_ip_addresses
    vnets               = var.vnets
  }
}


