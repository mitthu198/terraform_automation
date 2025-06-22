module "resourcegroup" {
    source = "../module/resource_group_module"
    rg_name = "mitthu-grp"
    rg_location            = "Australia East"
}

module "virtualnetwork" {
    depends_on = [ module.resourcegroup ]
    source = "../module/vnet_module"
    vnet_name = "mitthu-vnet"
    rg_name =  "mitthu-grp"
    vnet_location = "Australia East"
    vnet_address_space = ["10.0.0.0/16"]
}

module "frontend_subnet" {
    depends_on = [ module.virtualnetwork ]
    source = "../module/subnet_module"
    subnet_name = "front-subnet"
    rg_name = "mitthu-grp"
    vnet_name = "mitthu-vnet"
    address_prefixes = ["10.0.0.0/24"]
  
}

module "publicip" {
    depends_on = [ module.resourcegroup ]
    source = "../module/public_ip_module"
    pip_name = "mitthu-pip"
    rg_name = "mitthu-grp"
    pip_location = "Australia East"
    pip_allocation_method = "Static"
}

module "keyvault" {
    depends_on = [ module.resourcegroup ]
    source = "../module/key_vault_module"
    key_vault_name = "mitthu-kv"
    rg_name = "mitthu-grp"
    key_vault_location = "Australia East"  
    key_user_name = "mitthu-user"
    val_user_name = "mitthu-admin"
    key_password = "mitthu-password"
    val_password = "Password@1234"  
}

module "virtualmachine" {
    depends_on = [ module.frontend_subnet, module.publicip, module.resourcegroup, module.keyvault]
    source = "../module/vm_module"
    nic_name = "mitthu-nic"
    location = "Australia East"
    rg_name = "mitthu-grp"
    vm_name = "mitthu-vm"
    vm_size = "Standard_B1s"
    vnet_name = "mitthu-vnet"
    subnet_name = "front-subnet"
    pip_name = "mitthu-pip"
    key_vault_name = "mitthu-kv"
    key_password = "mitthu-password"
    key_username = "mitthu-user"
}