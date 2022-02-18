##################################################
# DATA                                           #
##################################################
data "azurerm_subscription" "primary" {}

##################################################
# RESOURCES                                      #
##################################################
resource "azurerm_role_definition" "custom_role" {
  count       = length(var.custom_role_definitions)
  name        = lookup(var.custom_role_definitions[count.index], "role_definition_name", "CUSTOM-ROLE-01")
  scope       = lookup(var.custom_role_definitions[count.index], "scope", data.azurerm_subscription.primary.id)
  description = lookup(var.custom_role_definitions[count.index], "description", "Specify description for CUSTOM role definition")

  permissions {
    actions          = lookup(var.custom_role_definitions[count.index].permissions, "actions", [])
    data_actions     = lookup(var.custom_role_definitions[count.index].permissions, "data_actions", [])
    not_actions      = lookup(var.custom_role_definitions[count.index].permissions, "not_actions", [])
    not_data_actions = lookup(var.custom_role_definitions[count.index].permissions, "not_data_actions", [])
  }
  assignable_scopes = lookup(var.custom_role_definitions[count.index], "assignable_scopes", [data.azurerm_subscription.primary.id])
}