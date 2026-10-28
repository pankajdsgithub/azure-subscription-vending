resource "azurerm_management_group_subscription_association" "this" {
  management_group_id = var.management_group_id
  subscription_id     = var.subscription_id
}

output "id" {
  description = "Association resource ID between the subscription and management group."
  value       = azurerm_management_group_subscription_association.this.id
}
