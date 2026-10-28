variable "request_id" {
  type        = string
  description = "Subscription request identifier."
}

variable "business_unit" {
  type        = string
  description = "Business unit or platform area requesting the subscription."
}

variable "environment" {
  type        = string
  description = "Subscription environment label."
}

variable "workload" {
  type        = string
  description = "Workload classification."
}

variable "owner" {
  type        = string
  description = "Subscription owner or team."
}

variable "display_name" {
  type        = string
  description = "Subscription display name."
}

variable "billing_scope_id" {
  type        = string
  description = "Optional billing scope used when the subscription is created."
  default     = null
}

variable "management_group_id" {
  type        = string
  description = "Optional management group target for placement."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Tags associated with the subscription."
}
