[![Automated-Dependency-Tests-and-Release](https://github.com/Pwd9000-ML/terraform-azurerm-custom-role-definitions/actions/workflows/dependency-tests.yml/badge.svg)](https://github.com/Pwd9000-ML/terraform-azurerm-custom-role-definitions/actions/workflows/dependency-tests.yml)

# Module: Custom Role Definitions

## Description

Create one or many AZURE custom role definitions by using a list variable: `custom_role_definitions`

Example:

```hcl
custom_role_definitions = [
  {
    role_definition_name = "CUSTOM - App Settings Reader"
    description          = "Allows view access for Azure Sites Configuration"
    permissions = {
      actions          = ["Microsoft.Web/sites/config/list/action", "Microsoft.Web/sites/config/read"]
      data_actions     = []
      not_actions      = []
      not_data_actions = []
    }
  },
  {
    role_definition_name = "CUSTOM - App Settings Admin"
    description          = "Allows edit access for Azure Sites Configuration"
    permissions = {
      actions          = ["Microsoft.Web/sites/config/*"]
      data_actions     = []
      not_actions      = []
      not_data_actions = []
    }
  }
]
```

See [examples](https://github.com/Pwd9000-ML/terraform-azurerm-custom-role-definitions/tree/master/examples/example_01) for more usage examples.  
## Providers and terraform version requirements
  
- terraform version ~> 1.1.0
- provider "azurerm" ~> 2.97.0
  
## Module Input variables

- `custom_role_definitions` - (Required) Specifies a list of AZURE Custom Role Definitions of type ANY.

## Module Outputs

- `role_definition_ids` - List of Role Definition IDs.
- `role_definition_resource_ids` -  List of Azure Resource Manager IDs for the resources..

## Example 1

This example creates two custom role definitions, `CUSTOM - App Settings Reader` and `CUSTOM - App Settings Admin` to specifically to manage AZURE app services and functions **App settings**.  

```hcl
### VARIABLE ###
variable "custom_role_definitions" {
  type        = list(any)
  description = "Specifies a list of custom roles"
  default = [
    {
      role_definition_name = "CUSTOM - App Settings Reader"
      description          = "Allows view access for Azure Sites Configuration"
      permissions = {
        actions          = ["Microsoft.Web/sites/config/list/action", "Microsoft.Web/sites/config/read"]
        data_actions     = []
        not_actions      = []
        not_data_actions = []
      }
    },
    {
      role_definition_name = "CUSTOM - App Settings Admin"
      description          = "Allows edit access for Azure Sites Configuration"
      permissions = {
        actions          = ["Microsoft.Web/sites/config/*"]
        data_actions     = []
        not_actions      = []
        not_data_actions = []
      }
    }
  ]
}

### PROVIDER ###
provider "azurerm" {
  features {}
}

### MODULE ###
module "custom_roles" {
  source                  = "github.com/Pwd9000-ML/terraform-azurerm-custom-role-definitions"
  custom_role_definitions = var.custom_role_definitions
}
```
