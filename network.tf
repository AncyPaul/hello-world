provider "azurerm" {
  subscription_id = "612bca9a-b622-499a-9937-835b8fe3ad08"
  client_id = "adc9e754-a639-4e17-8745-36c75812a736"
  tenant_id = "db0d2a25-ca5f-43e4-8a83-f4e576ff4df8"
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "UK South"
}

resource "azurerm_virtual_network" "example" {
  name                = "example-vnet"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["172.16.0.0/16"]
}

resource "azurerm_subnet" "example" {
  name                 = "example-subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["172.16.1.0/24"]
}
