resource "azurerm_storage_account" "platform" {
  name                            = "st${substr(replace(local.base_name, "-", ""), 0, 12)}${random_string.suffix.result}"
  resource_group_name             = azurerm_resource_group.platform.name
  location                        = azurerm_resource_group.platform.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = false
  public_network_access           = "Enabled"
  shared_access_key_enabled       = true
  tags                            = local.common_tags

  blob_properties {
    versioning_enabled = true

    delete_retention_policy {
      days = 7
    }

    container_delete_retention_policy {
      days = 7
    }
  }
}

resource "azurerm_storage_container" "platform" {
  name                  = "platform-data"
  storage_account_id    = azurerm_storage_account.platform.id
  container_access_type = "private"
}
