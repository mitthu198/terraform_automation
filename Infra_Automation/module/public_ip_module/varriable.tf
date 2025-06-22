variable "pip_name" {
  description = "Name of the public IP"
  type        = string
}

variable "rg_name" {
  description = "Name of the resource group where the public IP will be created"
  type        = string
  
}

variable "pip_location" {
  description = "Location where the public IP will be created"
  type        = string
  
}

variable "pip_allocation_method" {
  description = "Allocation method for the public IP (Static or Dynamic)"
  type        = string
}