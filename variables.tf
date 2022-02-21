##################################################
# VARIABLES                                      #
##################################################
variable "custom_role_definitions" {
  type        = list(any)
  description = "Required Input - Specifies a list of AZURE Custom Role Definitions of type ANY"
}