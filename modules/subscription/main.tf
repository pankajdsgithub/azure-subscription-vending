resource "azurerm_subscription" "this" {
  count = var.subscription_name != null && var.billing_scope_id != null ? 1 : 0

  subscription_name = var.subscription_name
  billing_scope_id  = var.billing_scope_id
  tags              = var.tags
}

output "subscription_id" {
  description = "ID of the created Azure subscription."
  value       = try(azurerm_subscription.this[0].subscription_id, null)
}
