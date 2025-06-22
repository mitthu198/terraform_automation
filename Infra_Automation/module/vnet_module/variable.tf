variable "rg_name" {
  description = "The name of the resource group."
  type        = string
}

variable "vnet_location" {
  description = "The name of the resource group."
  type        = string
}

variable "vnet_name" {
  description = "The name of the resource group."
  type        = string
}

variable "vnet_address_space" {
  description = "The address space of the resource group."
  type        = list(string)
}