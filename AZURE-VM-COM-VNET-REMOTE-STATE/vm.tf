resource "azurerm_resource_group" "resource_group_vm" {
    name = "vm"
    location = var.location
    tags = local.common_tags
}

resource "azurerm_public_ip" "public_ip" {
  name                = "public-ip-terraform"
  resource_group_name = azurerm_resource_group.resource_group_vm.name
  location            = var.location
  allocation_method   = "Dynamic"

  tags = local.common_tags
}