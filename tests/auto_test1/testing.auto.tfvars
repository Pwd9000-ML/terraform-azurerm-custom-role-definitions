#Custom Roles
deploy_custom_roles = true
custom_role_definitions = [
  {
    role_definition_name = "CUSTOM - App Settings Reader"
    description          = "Allows view access for Azure Sites Configuration"
    scope = ""
    permissions = {
      actions          = ["Microsoft.Web/sites/config/list/action", "Microsoft.Web/sites/config/read"]
      data_actions     = []
      not_actions      = []
      not_data_actions = []
    }
    assignable_scopes = []
  },
  {
    role_definition_name = "CUSTOM - App Settings Admin"
    description          = "Allows edit access for Azure Sites Configuration"
    scope = ""

    permissions = {
      actions          = ["Microsoft.Web/sites/config/*"]
      data_actions     = []
      not_actions      = []
      not_data_actions = []
    }
    assignable_scopes = []
  }
]