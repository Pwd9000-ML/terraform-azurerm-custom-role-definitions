# Terraform Example - Create custom RBAC

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

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_custom_roles"></a> [custom\_roles](#module\_custom\_roles) | Pwd9000-ML/custom-role-definitions/azurerm | >= 1.2.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_custom_role_definitions"></a> [custom\_role\_definitions](#input\_custom\_role\_definitions) | Specifies a list of custom roles | `list(any)` | n/a | yes |
| <a name="input_deploy_custom_roles"></a> [deploy\_custom\_roles](#input\_deploy\_custom\_roles) | Specifies whether custom RBAC roles should be created | `bool` | `false` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
