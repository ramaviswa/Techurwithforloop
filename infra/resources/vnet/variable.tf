resource "azurerm_virtual_network" "viswavnet" {
    for_each = var.virtualnetwork
    name = each.value.vnetname
    resource_group_name = var.resourcegroup[each.value.rgkey]
    location = var.location
    address_space = each.value.address
}