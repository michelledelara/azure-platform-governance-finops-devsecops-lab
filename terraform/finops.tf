data "azurerm_subscription" "current" {}

resource "azurerm_consumption_budget_subscription" "platform" {
  count = var.enable_budget ? 1 : 0

  name            = "budget-${local.base_name}-${var.environment}"
  subscription_id = data.azurerm_subscription.current.id

  amount     = var.monthly_budget_amount
  time_grain = "Monthly"

  time_period {
    start_date = "2026-09-01T00:00:00Z"
    end_date   = "2030-12-31T00:00:00Z"
  }

  notification {
    enabled        = true
    threshold      = 80
    operator       = "GreaterThan"
    threshold_type = "Forecasted"
    contact_emails = var.budget_contact_emails
  }

  notification {
    enabled        = true
    threshold      = 100
    operator       = "GreaterThan"
    threshold_type = "Actual"
    contact_emails = var.budget_contact_emails
  }
}
