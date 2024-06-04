resource "azurerm_public_ip" "pubip_lbprod" {
  for_each = var.lb_name
  name                = each.value.pubip_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  allocation_method   = "Static"
}

resource "azurerm_lb" "lb" {
  for_each = var.lb_name
  name                = each.value.lb_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  frontend_ip_configuration {
    name                 = each.value.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.pubip_lbprod[each.key].id
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  for_each = var.lb_name
  loadbalancer_id = azurerm_lb.lb[each.key].id
  name            =each.value.backend_pool_name
}

resource "azurerm_network_interface_backend_address_pool_association" "ni_bapa" {
  for_each = var.lb_name

  network_interface_id    = azurerm_network_interface.example.id
  ip_configuration_name   = each.value.ip_configuration_name
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool[each.key].id
}

# data "azurerm_network_interface" "dtnic" {
#   for_each = var.lb_name
#   name                = each.value.nic_name
#   resource_group_name = each.value.rg_name
# }

resource "azurerm_lb_probe" "example" {
  loadbalancer_id = azurerm_lb.example.id
  name            = "ssh-running-probe"
  port            = 22
}

resource "azurerm_lb_rule" "example" {
  loadbalancer_id                = azurerm_lb.example.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = "PublicIPAddress"
}

