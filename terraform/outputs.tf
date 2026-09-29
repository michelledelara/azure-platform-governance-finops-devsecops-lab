output "resource_group_name" {
  description = "Azure Resource Group created by the lab."
  value       = azurerm_resource_group.platform.name
}

output "vnet_name" {
  description = "Azure Virtual Network name."
  value       = azurerm_virtual_network.platform.name
}

output "vm_public_ip" {
  description = "Public IP address for the Linux VM."
  value       = azurerm_public_ip.vm.ip_address
}

output "storage_account_name" {
  description = "Storage Account name."
  value       = azurerm_storage_account.platform.name
}

output "key_vault_name" {
  description = "Key Vault name."
  value       = azurerm_key_vault.platform.name
}

output "log_analytics_workspace_name" {
  description = "Log Analytics workspace name."
  value       = azurerm_log_analytics_workspace.platform.name
}
