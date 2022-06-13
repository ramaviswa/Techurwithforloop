resource "azurerm_role_assignment" "roleassignmenttorg" {
    for_each = var.role_definition_name
    role_definition_name = each.value.role_definition_name
    scope = var.rg[each.value.rgkey].id
    principal_id = var.users[each.value.userskey].objet_id
  
}