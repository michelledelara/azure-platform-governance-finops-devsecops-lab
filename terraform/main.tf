resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "azurerm_resource_group" "platform" {
  name     = "rg-${local.base_name}-${var.environment}"
  location = var.location
  tags     = local.common_tags
}
