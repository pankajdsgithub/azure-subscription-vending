data "azurerm_role_definition" "this" {
  name = var.role_definition_name
}

resource "azurerm_role_assignment" "this" {
  scope              = var.scope
  role_definition_id = data.azurerm_role_definition.this.id
  principal_id       = var.principal_id
}

output "id" {
  description = "ID of the Azure RBAC assignment."
  value       = azurerm_role_assignment.this.id
}
