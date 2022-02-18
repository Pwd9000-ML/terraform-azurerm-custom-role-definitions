##################################################
# OUTPUTS                                        #
##################################################
output "role_definition_ids" {
  value       = azurerm_role_definition.custom_role.*.role_definition_id
  description = "The Role Definition ID."
}

output "role_definition_resource_ids" {
  value       = azurerm_role_definition.custom_role.*.role_definition_resource_id
  description = "The Azure Resource Manager ID for the resource."
}