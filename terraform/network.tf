# Crear de red
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network
resource "azurerm_virtual_network" "NetworkCp2" {
  name                = "networkcp2"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  tags = {
    environment = "UNIR_CP2"
  }
}

# Crear de subnet
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet
resource "azurerm_subnet" "SubnetCp2" {
  name                   = "subnetcp2"
  resource_group_name    = azurerm_resource_group.rg.name
  virtual_network_name   = azurerm_virtual_network.NetworkCp2.name
  address_prefixes       = ["10.0.1.0/24"]
}

# Crear NIC
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface
resource "azurerm_network_interface" "Nic1Cp2" {
  name                = "nic1cp2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                           = "ipconfiguration1cp2"
    subnet_id                      = azurerm_subnet.SubnetCp2.id
    private_ip_address_allocation  = "Static"
    private_ip_address             = "10.0.1.10"
    public_ip_address_id           = azurerm_public_ip.PublicIp1Cp2.id
  }

  tags = {
    environment = "UNIR_CP2"
  }
}

# Crear IP pública
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip
resource "azurerm_public_ip" "PublicIp1Cp2" {
  name                = "ip1cp2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"

  tags = {
    environment = "UNIR_CP2"
  }
}
