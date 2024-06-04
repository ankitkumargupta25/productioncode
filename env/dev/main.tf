
module "resource_group" {
  source  = "../../modules/rg"
  rg_name = var.mod_rg_name
}

module "virtual_network" {
  source     = "../../modules/vnet"
  vnet_name  = var.mod_vnet_name
  depends_on = [module.resource_group]
}

module "subnet" {
  source      = "../../modules/subnet"
  subnet_name = var.mod_subnet_name
  depends_on  = [module.virtual_network]
}

module "nic" {
  source     = "../../modules/nic"
  nic_name   = var.mod_nic_name
  depends_on = [module.subnet]

}

module "vm" {
  source     = "../../modules/vm"
  linux_vm   = var.mod_linux_vm
  depends_on = [module.nic]
}


module "bastion" {
  source       = "../../modules/bastion"
  bastion_name = var.mod_bastion_name
  depends_on   = [module.resource_group,module.virtual_network]
}

module "nsg" {
  source     = "../../modules/nsg"
  nsg_name   = var.mod_nsg_name
  depends_on = [module.resource_group,module.subnet]
}