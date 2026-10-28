resource "azurerm_subscription_policy_assignment" "this" {
  name                 = var.name
  display_name         = var.display_name
  description          = var.description
  policy_definition_id = var.policy_definition_id
  subscription_id      = var.subscription_id
  location             = var.location
  parameters           = var.parameters
  enforce              = var.enforce
}

output "id" {
  description = "Resource ID for the subscription policy assignment."
  value       = azurerm_subscription_policy_assignment.this.id
}
