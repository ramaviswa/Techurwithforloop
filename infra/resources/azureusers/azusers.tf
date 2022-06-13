data "azurerm_client_config" "current" {
  
}
provider "azuread" {
  tenant_id = data.azurerm_client_config.current.tenant_id  
}


# Retrieve domain information
data "azuread_domains" "techurtenetdomain" {
  only_initial = true
}

resource "azuread_user" "userlist" {
  for_each = var.userslist
  display_name = each.value.display_name
  user_principal_name = "${each.value.user_principal_name}@${data.azuread_domains.techurtenantdomain.domains.0.domain_name}"
  employee_type = each.value.employee_type
  city = each.value.city
  mail_nickname = each.value.mail_nickname
  password = each.value.password
}

