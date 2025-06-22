variable "key_vault_name" { 
  description = "The name of the Key Vault"
  type        = string
}

variable "key_vault_location" { 
  description = "The location where the Key Vault will be created"
  type        = string
}

variable "rg_name" { 
  description = "The name of the resource group where the Key Vault will be created"
  type        = string
  
}

variable "key_user_name" { 
  description = "The username to be stored in the Key Vault"
  type        = string
  
}

variable "val_user_name" { 
  description = "The username to be stored in the Key Vault"
  type        = string
  
}

variable "key_password" { 
  description = "The password to be stored in the Key Vault"
  type        = string
  sensitive   = true
  
}

variable "val_password" { 
  description = "The password to be stored in the Key Vault"
  type        = string
  sensitive   = true
  
}