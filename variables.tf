variable "request_id" {
  description = "Unique subscription request identifier used in validation and workflow metadata."
  type        = string
  default     = "SUB-REQ-001"

  validation {
    condition     = trimspace(var.request_id) != ""
    error_message = "request_id must not be empty."
  }
}

variable "business_unit" {
  description = "Business unit or platform area requesting the subscription."
  type        = string
  default     = "Platform"

  validation {
    condition     = trimspace(var.business_unit) != ""
    error_message = "business_unit must not be empty."
  }
}

variable "environment" {
  description = "Target environment for the subscription."
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "test", "qa", "prod", "shared"], lower(trimspace(var.environment)))
    error_message = "environment must be one of: dev, test, qa, prod, shared."
  }
}

variable "workload" {
  description = "Workload classification for the subscription."
  type        = string
  default     = "DevTest"

  validation {
    condition     = contains(["Production", "DevTest", "Other"], trimspace(var.workload))
    error_message = "workload must be one of: Production, DevTest, Other."
  }
}

variable "owner" {
  description = "Owner or team that will receive the workload subscription."
  type        = string
  default     = "platform-team"

  validation {
    condition     = trimspace(var.owner) != ""
    error_message = "owner must not be empty."
  }
}

variable "subscription_display_name" {
  description = "Friendly name shown in Azure for the new subscription."
  type        = string
  default     = "contoso-dev-platform"

  validation {
    condition     = trimspace(var.subscription_display_name) != ""
    error_message = "subscription_display_name must not be empty."
  }
}

variable "billing_scope_id" {
  description = "Billing scope that authorizes subscription creation. Use a real Azure billing scope in production."
  type        = string
  default     = null

  validation {
    condition     = var.billing_scope_id == null || trimspace(var.billing_scope_id) != ""
    error_message = "billing_scope_id must be null or non-empty."
  }
}

variable "management_group_id" {
  description = "Optional management group to place the subscription under after creation."
  type        = string
  default     = null

  validation {
    condition     = var.management_group_id == null || trimspace(var.management_group_id) != ""
    error_message = "management_group_id must be null or non-empty."
  }
}

variable "policy_definition_id" {
  description = "Optional Azure Policy definition ID applied to the new subscription."
  type        = string
  default     = null

  validation {
    condition     = var.policy_definition_id == null || trimspace(var.policy_definition_id) != ""
    error_message = "policy_definition_id must be null or non-empty."
  }
}

variable "location" {
  description = "Location used for policy assignment metadata when the subscription is governed."
  type        = string
  default     = "uksouth"

  validation {
    condition     = trimspace(var.location) != ""
    error_message = "location must not be empty."
  }
}

variable "tags" {
  description = "Additional tags applied to the subscription and governance metadata."
  type        = map(string)
  default     = {}
}

variable "enable_subscription_creation" {
  description = "Set to false to model the workflow without creating an Azure subscription in this local validation run."
  type        = bool
  default     = true
}

variable "rbac_assignments" {
  description = "RBAC assignments to grant the requested workload owners access to the subscription."
  type = map(object({
    principal_id         = string
    role_definition_name = string
    scope                = optional(string, null)
  }))
  default = {}

  validation {
    condition = alltrue([
      for assignment in values(var.rbac_assignments) :
      trimspace(assignment.principal_id) != "" && trimspace(assignment.role_definition_name) != ""
    ])
    error_message = "Each RBAC assignment must include a non-empty principal_id and role_definition_name."
  }
}
