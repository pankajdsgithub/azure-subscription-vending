locals {
  standard_tags = merge(
    {
      environment  = var.environment
      owner        = var.owner
      workload     = var.workload
      managed_by   = "terraform"
      portfolio    = "subscription-vending"
      businessUnit = var.business_unit
    },
    var.tags
  )
}

module "subscription_request" {
  source = "./modules/subscription-request"

  request_id          = var.request_id
  business_unit       = var.business_unit
  environment         = var.environment
  workload            = var.workload
  owner               = var.owner
  display_name        = var.subscription_display_name
  billing_scope_id    = var.billing_scope_id
  management_group_id = var.management_group_id
  tags                = local.standard_tags
}

module "subscription" {
  source = "./modules/subscription"
  count  = var.enable_subscription_creation ? 1 : 0

  subscription_name = module.subscription_request.display_name
  billing_scope_id  = var.billing_scope_id
  workload          = var.workload
  tags              = module.subscription_request.tags
}

module "management_group_association" {
  source = "./modules/management-group-association"
  count  = var.enable_subscription_creation && var.management_group_id != null ? 1 : 0

  subscription_id     = module.subscription[0].subscription_id
  management_group_id = var.management_group_id
}

module "governance_assignment" {
  source = "./modules/governance-assignment"
  count  = var.enable_subscription_creation && var.policy_definition_id != null ? 1 : 0

  name                 = "${module.subscription_request.safe_name}-policy-assignment"
  display_name         = "${module.subscription_request.display_name} governance"
  description          = "Applies the requested governance baseline to the subscribed workload."
  policy_definition_id = var.policy_definition_id
  subscription_id      = module.subscription[0].subscription_id
  location             = var.location
  parameters           = jsonencode({})
  enforce              = true
}

module "rbac_assignments" {
  source   = "./modules/rbac-assignment"
  for_each = var.rbac_assignments

  principal_id         = each.value.principal_id
  role_definition_name = each.value.role_definition_name
  scope                = coalesce(each.value.scope, try(module.subscription[0].subscription_id, null))
}
