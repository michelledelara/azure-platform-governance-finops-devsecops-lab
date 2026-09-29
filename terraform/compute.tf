resource "azurerm_linux_virtual_machine" "platform" {
  name                = "vm-${local.base_name}-${var.environment}"
  resource_group_name = azurerm_resource_group.platform.name
  location            = azurerm_resource_group.platform.location
  size                = var.vm_size
  admin_username      = var.admin_username
  network_interface_ids = [
    azurerm_network_interface.vm.id
  ]

  disable_password_authentication = true

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }

  identity {
    type = "SystemAssigned"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }

  custom_data = base64encode(<<-CLOUDINIT
    #cloud-config
    package_update: true
    packages:
      - nginx
      - curl
      - jq
    runcmd:
      - systemctl enable nginx
      - systemctl start nginx
      - echo "Azure Platform Engineering Lab" > /var/www/html/index.html
  CLOUDINIT
  )

  tags = local.common_tags
}

resource "azurerm_role_assignment" "vm_keyvault_reader" {
  scope                = azurerm_key_vault.platform.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azurerm_linux_virtual_machine.platform.identity[0].principal_id
}
