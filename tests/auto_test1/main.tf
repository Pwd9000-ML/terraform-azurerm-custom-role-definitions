
terraform {
  backend "azurerm" {}
}

##################################################
# PROVIDERS                                      #
##################################################
provider "azurerm" {
  features {}
}

##################################################
# MODULES                                        #
##################################################
module "custom_roles" {
  source                  = "github.com/Pwd9000-ML/terraform-azurerm-custom-role-definitions"
  count                   = var.deploy_custom_roles == true ? 1 : 0
  custom_role_definitions = var.custom_role_definitions
}