resource "azurerm_resource_group" "rg" {
    for_each = var.resourcegroup
    name = each.value.rgname
    location = var.location 
}

output "resourcegroupoutput" {
    value = azurerm_resource_group.rg  
}