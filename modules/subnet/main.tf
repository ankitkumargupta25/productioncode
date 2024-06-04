resource "azurerm_subnet" "subnetprod" {
for_each = var.subnet_name
name=each.value.name
resource_group_name =each.value.rg_name
virtual_network_name = each.value.vnetname
address_prefixes = each.value.address_prefixes

}