##################################################
# VARIABLES                                      #
##################################################
variable "custom_role_definitions" {
  type = list(object({
    role_definition_name = string
    scope                = optional(string)
    description          = string
    permissions = object({
      actions          = list(string)
      data_actions     = list(string)
      not_actions      = list(string)
      not_data_actions = list(string)
    })
    assignable_scopes = optional(list(string))
  }))
  description = "Specifies a list of custom role definitions"
}