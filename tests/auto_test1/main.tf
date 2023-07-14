terraform {
  backend "azurerm" {}
  #backend "local" { path = "terraform-example.tfstate" }
}

provider "azurerm" {
  features {}
}

##################################################
# MODULES                                        #
##################################################
module "custom_roles" {
  source                  = "../.."
  count                   = var.deploy_custom_roles == true ? 1 : 0
  custom_role_definitions = var.custom_role_definitions
}