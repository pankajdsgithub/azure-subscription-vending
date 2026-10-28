variable "principal_id" {
  type        = string
  description = "Object ID of the user, group, or service principal receiving the role assignment."
}

variable "role_definition_name" {
  type        = string
  description = "Built-in Azure RBAC role name to assign."
}

variable "scope" {
  type        = string
  description = "Scope of the RBAC assignment, typically the subscription resource ID."
}
