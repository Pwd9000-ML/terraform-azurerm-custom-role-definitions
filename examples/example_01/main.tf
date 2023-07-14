terraform {
  #backend "azurerm" {}
  backend "local" { path = "terraform-example.tfstate" }
}

provider "azurerm" {
  features {}
}

##################################################
# MODULES                                        #
##################################################
module "custom_roles" {
  source                  = "Pwd9000-ML/custom-role-definitions/azurerm"
  version                 = ">= 1.2.0"
  count                   = var.deploy_custom_roles == true ? 1 : 0
  custom_role_definitions = var.custom_role_definitions
}