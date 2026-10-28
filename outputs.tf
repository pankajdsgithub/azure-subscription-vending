output "subscription_request" {
  description = "Structured metadata captured from the subscription vending request."
  value       = module.subscription_request.request
}

output "subscription_id" {
  description = "Created subscription resource ID if subscription creation is enabled."
  value       = try(module.subscription[0].subscription_id, null)
}

output "management_group_association_id" {
  description = "Management group subscription association ID when management group placement is enabled."
  value       = try(module.management_group_association[0].id, null)
}

output "policy_assignment_id" {
  description = "Subscription policy assignment ID when a policy definition is supplied."
  value       = try(module.governance_assignment[0].id, null)
}

output "rbac_assignment_ids" {
  description = "Map of RBAC assignment IDs created for the subscription."
  value       = { for name, assignment in module.rbac_assignments : name => assignment.id }
}
