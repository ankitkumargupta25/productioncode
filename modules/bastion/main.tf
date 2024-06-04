resource "azurerm_subnet" "subnet_bastion" {
    for_each = var.bastion_name
  name                 = each.value.subnetbastion_name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet
  address_prefixes     = each.value.address_prefixes
}

resource "azurerm_public_ip" "pip_prod" {
    for_each = var.bastion_name
  name                = each.value.pip_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "azbastionprod" {
    for_each = var.bastion_name
  name                = each.value.bastionname
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.subnet_bastion[each.key].id
    public_ip_address_id = azurerm_public_ip.pip_prod[each.key].id
      }
}

# output "basionhost_linuxvm_public_ipaddress" {
#   description = "bastion host linux vm public ip address"
# value = azurerm_bastion_host.azbastionprod.id

# }

