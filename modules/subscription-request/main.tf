locals {
  normalized_name = lower(replace(var.display_name, " ", "-"))
}

output "request" {
  description = "Structured subscription request payload."
  value = {
    request_id          = var.request_id
    business_unit       = var.business_unit
    environment         = var.environment
    workload            = var.workload
    owner               = var.owner
    display_name        = var.display_name
    billing_scope_id    = var.billing_scope_id
    management_group_id = var.management_group_id
    tags                = var.tags
  }
}

output "display_name" {
  description = "Normalized display name to use for the requested subscription."
  value       = var.display_name
}

output "safe_name" {
  description = "Safe lowercase name derived from the display name for resource naming."
  value       = local.normalized_name
}

output "tags" {
  description = "Tags associated with the subscription request."
  value       = var.tags
}
