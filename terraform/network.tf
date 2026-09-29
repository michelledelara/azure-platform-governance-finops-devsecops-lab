resource "azurerm_virtual_network" "platform" {
  name                = "vnet-${local.base_name}-${var.environment}"
  address_space       = ["10.20.0.0/16"]
  location            = azurerm_resource_group.platform.location
  resource_group_name = azurerm_resource_group.platform.name
  tags                = local.common_tags
}

resource "azurerm_subnet" "workload" {
  name                 = "snet-workload"
  resource_group_name  = azurerm_resource_group.platform.name
  virtual_network_name = azurerm_virtual_network.platform.name
  address_prefixes     = ["10.20.10.0/24"]
}

resource "azurerm_network_security_group" "workload" {
  name                = "nsg-${local.base_name}-${var.environment}"
  location            = azurerm_resource_group.platform.location
  resource_group_name = azurerm_resource_group.platform.name
  tags                = local.common_tags

  security_rule {
    name                       = "Allow-SSH-From-Admin"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.admin_cidr
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "workload" {
  subnet_id                 = azurerm_subnet.workload.id
  network_security_group_id = azurerm_network_security_group.workload.id
}

resource "azurerm_public_ip" "vm" {
  name                = "pip-${local.base_name}-${var.environment}"
  location            = azurerm_resource_group.platform.location
  resource_group_name = azurerm_resource_group.platform.name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = local.common_tags
}

resource "azurerm_network_interface" "vm" {
  name                = "nic-${local.base_name}-${var.environment}"
  location            = azurerm_resource_group.platform.location
  resource_group_name = azurerm_resource_group.platform.name
  tags                = local.common_tags

  ip_configuration {
    name                          = "primary"
    subnet_id                     = azurerm_subnet.workload.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm.id
  }
}
