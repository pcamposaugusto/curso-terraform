output "vm_ip" {
  value = azurerm_linux_virtual_machine.vm.public_ip_addresses
}