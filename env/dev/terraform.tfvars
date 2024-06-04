mod_rg_name = {

  rg1 = {
    "name"     = "rg_prod1"
    "location" = "Canada Central"
  }


  rg2 = {
    "name"     = "rg_prod2"
    "location" = "Japan East"
  }


}

mod_vnet_name = {

  vnet1 = {
    "name"          = "vnet_prod1"
    "rg_name"       = "rg_prod1"
    "location"      = "Canada Central"
    "address_space" = ["10.0.0.0/16"]
  }

  vnet2 = {
    "name"          = "vnet_prod2"
    "rg_name"       = "rg_prod1"
    "location"      = "Canada Central"
    "address_space" = ["10.1.0.0/16"]
  }

 vnet3 = {
    "name"          = "vnet_prod3"
    "rg_name"       = "rg_prod1"
    "location"      = "Canada Central"
    "address_space" = ["10.2.0.0/16"]
  }


}

mod_subnet_name = {

  subnet1 = {
    "name"             = "subnet_prod1"
    "rg_name"          = "rg_prod1"
    "vnetname"         = "vnet_prod1"
    "address_prefixes" = ["10.0.1.0/24"]
  }


  subnet2 = {
    "name"             = "subnet_prod2"
    "rg_name"          = "rg_prod1"
    "vnetname"         = "vnet_prod1"
    "address_prefixes" = ["10.0.2.0/24"]
  }


  subnet3 = {
    "name"             = "subnet_prod3"
    "rg_name"          = "rg_prod1"
    "vnetname"         = "vnet_prod1"
    "address_prefixes" = ["10.0.3.0/24"]
  }



}


mod_nic_name = {

  nic1 = {

    "name"       = "nic_prod1"
    "rg_name"    = "rg_prod1"
    "location"   = "Canada Central"
    "subnetname" = "subnet_prod1"
    "vnetname"   = "vnet_prod1"
  }

  nic2 = {

    "name"       = "nic_prod2"
    "rg_name"    = "rg_prod1"
    "location"   = "Canada Central"
    "subnetname" = "subnet_prod2"
    "vnetname"   = "vnet_prod1"
  }

}

mod_linux_vm = {

  vm1 = {

    "name"           = "vmprod1"
    "rg_name"        = "rg_prod1"
    "location"       = "Canada Central"
    "size"           = "Standard_F2"
    "admin_username" = "adminuser"
    "admin_password" = "Ank@1234"
    "nicname"        = "nic_prod1"
  }


  vm2 = {
    "name"           = "vmprod2"
    "rg_name"        = "rg_prod1"
    "location"       = "Canada Central"
    "size"           = "Standard_F2"
    "admin_username" = "adminuser"
    "admin_password" = "Ank@1234"
    "nicname"        = "nic_prod2"
  }


}

mod_bastion_name = {

  az_bastion = {

    "subnetbastion_name" = "AzureBastionSubnet"
    "rg_name"            = "rg_prod1"
    "vnet"               = "vnet_prod1"
    "address_prefixes"   = ["10.0.4.0/24"]

    "pip_name" = "pip_prod1"
    "location" = "Canada Central"

    "bastionname" = "bastion_prod1"

  }



}


mod_nsg_name = {

  nsg1 = {

    "nsg_name"      = "nsg_prod1"
    "rg_name"       = "rg_prod1"
    "location"      = "Canada Central"
    "security_name" = "nsg11"
    "priority"                   = 100
    "direction"                  = "Inbound"
    "access"                     = "Allow"
    "protocol"                   = "Tcp"
    "source_port_range"          = "*"
    "destination_port_range"     = "*"
    "source_address_prefix"      = "*"
    "destination_address_prefix" = "*"

    "subnetname" = "subnet_prod1"
    "vnetname"   = "vnet_prod1"
  }
}

mod_lb_name = {
 lb1={
   "pubip_name"="pubip_LB"
   "rg_name"       = "rg_prod1"
   "location"      = "Canada Central"
    "lb_name"="frontend-loadbalancer"
    "frontend_ip_configuration_name"="frontend_ip_config"
 
 "backend_pool_name"="backend_pool"
 
"ip_configuration_name"="intername"

 }




}

































