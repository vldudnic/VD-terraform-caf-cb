variable "virtual_machines" {
  default     = {}
  description = "Create a virtual machine from CAF module"
}
variable "vnets" {
  default = {}
}
variable "public_ip_addresses" {
  default = {}
}
variable "keyvaults" {
  default = {}
}

variable "global_settings" {
  default = {}
}
  
variable "resource_groups" {
  default = {}
}

variable "logged_user_objectId" {
  default = {}
}

variable "provider_azurerm_features_keyvault" {
  default = {
    purge_soft_delete_on_destroy = true
  }
}

