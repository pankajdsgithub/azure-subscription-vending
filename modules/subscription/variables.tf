variable "subscription_name" {
  type        = string
  description = "Name to assign to the Azure subscription."
}

variable "billing_scope_id" {
  type        = string
  description = "Billing scope that authorizes the subscription creation."
  default     = null
}

variable "workload" {
  type        = string
  description = "Workload classification used for metadata."
  default     = "DevTest"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to the subscription."
  default     = {}
}
