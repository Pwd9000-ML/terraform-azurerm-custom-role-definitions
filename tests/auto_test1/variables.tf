##################################################
# VARIABLES                                      #
##################################################
#Custom RBAC Roles
variable "deploy_custom_roles" {
  type        = bool
  default     = false
  description = "Specifies whether custom RBAC roles should be created"
}

variable "custom_role_definitions" {
  type = list(object({
    role_definition_name = string
    scope                = string
    description          = string
    permissions = object({
      actions          = list(string)
      data_actions     = list(string)
      not_actions      = list(string)
      not_data_actions = list(string)
    })
    assignable_scopes = list(string)
  }))
  default     = []
  description = "Specifies a list of custom role definitions"
}