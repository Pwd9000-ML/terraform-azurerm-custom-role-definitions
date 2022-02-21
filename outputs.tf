##################################################
# OUTPUTS                                        #
##################################################
output "role_definition_ids" {
  value       = azurerm_role_definition.custom_role.*.role_definition_id
  description = "List of Role Definition IDs."
}

output "role_definition_resource_ids" {
  value       = azurerm_role_definition.custom_role.*.role_definition_resource_id
  description = "List of Azure Resource Manager IDs for the resources."
}