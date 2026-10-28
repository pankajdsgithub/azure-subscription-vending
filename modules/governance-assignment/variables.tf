variable "name" {
  type        = string
  description = "Assignment name."
}

variable "display_name" {
  type        = string
  description = "Friendly assignment name."
}

variable "description" {
  type        = string
  description = "Detailed description of the assignment."
  default     = ""
}

variable "policy_definition_id" {
  type        = string
  description = "ID of the Azure Policy definition or initiative to apply."
}

variable "subscription_id" {
  type        = string
  description = "Subscription ID to assign the policy to."
}

variable "location" {
  type        = string
  description = "Assignment location metadata."
  default     = "uksouth"
}

variable "parameters" {
  type        = string
  description = "JSON parameters for the policy assignment."
  default     = "{}"
}

variable "enforce" {
  type        = bool
  description = "Whether the assignment enforces policy."
  default     = true
}
