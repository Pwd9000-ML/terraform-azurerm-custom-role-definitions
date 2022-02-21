# Terraform Example - Subnets on a new Azure Vnet

## Description

This example creates two custom role definitions, `CUSTOM - App Settings Reader` and `CUSTOM - App Settings Admin` to specifically to manage AZURE app services and functions **App settings**.  

## Usage

1. Clone or copy the files in this path to a local directory and open a command prompt.
2. Amend the .tf file and .tfvars file with desired variables.
3. Log into azure using CLI "az login".
4. **BUILD:**

    ```HCL
    terraform init
    terraform plan -out deploy.tfplan
    terraform apply deploy.tfplan
    ```

5. **DESTROY:**

    ```HCL
    terraform plan -destroy -out destroy.tfplan
    terraform apply destroy.tfplan
    ```

## Providers and terraform version requirements
  
- terraform version ~> 1.1.0
- provider "azurerm" ~> 2.97.0
  
## module inputs

- `deploy_custom_roles` - (Optional) Specifies whether custom RBAC roles should be created.
- `custom_role_definitions` - (Required) Specifies a list of custom roles:

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
