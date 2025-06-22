variable "nic_name" {
  description = "Name of the network interface"
  type        = string
  
}

variable "location" {
  description = "Location of the virtual network"
  type        = string  
}

variable "rg_name" {
  description = "Name of the resource group"
  type        = string  
}

variable "vm_name" {
    description = "Name of the virtual machine"
    type        = string    
}

variable "vm_size" {
    description = "Size of the virtual machine"
    type        = string
}


variable "subnet_name" {
    description = "Name of the subnet"
    type        = string
  
}

variable "vnet_name" {
    description = "Name of the virtual network"
    type        = string
}

variable "pip_name" {
    description = "Name of the public IP address"
    type        = string
}

variable "key_vault_name" {
    description = "Name of the Key Vault"
    type        = string
  
}

variable "key_username" {
    description = "Username for the virtual machine"
    type        = string
  
}

variable "key_password" {
    description = "Password for the virtual machine"
    type        = string
  
}