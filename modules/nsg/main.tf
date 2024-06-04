resource "azurerm_network_security_group" "nsg_prod" {
    for_each = var.nsg_name
  name                = each.value.nsg_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  security_rule {
    name                       = each.value.security_name
    priority                   = each.value.priority
    direction                  = each.value.direction
    access                     = each.value.access
    protocol                   = each.value.protocol
    source_port_range          =each.value.source_port_range
    destination_port_range     =each.value.destination_port_range
    source_address_prefix      =each.value.source_address_prefix
    destination_address_prefix =each.value.destination_address_prefix
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg_link" {
  for_each = var.nsg_name
  subnet_id                 = data.azurerm_subnet.dtsubnet[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg_prod[each.key].id
}

data "azurerm_subnet" "dtsubnet" {
  for_each = var.nsg_name
  name                 = each.value.subnetname
  virtual_network_name = each.value.vnetname
  resource_group_name  = each.value.rg_name
} 