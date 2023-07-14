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
  type        = list(any)
  description = "Specifies a list of custom roles"
}