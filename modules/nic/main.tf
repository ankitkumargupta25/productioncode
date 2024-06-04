resource "azurerm_network_interface" "nicprod" {
    for_each = var.nic_name
   name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.dtsubnet[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}


data "azurerm_subnet" "dtsubnet" {
    for_each = var.nic_name
    name=each.value.subnetname
    virtual_network_name = each.value.vnetname
    resource_group_name = each.value.rg_name
  
}