/* Test one outputs **/
//"azurerm_resource_group", "azurerm_storage_account", "azurerm_key_vault", "azurerm_network_watcher", "azurerm_network_security_group", "azurerm_virtual_network", "azurerm_subnet", "azurerm_virtual_network_gateway", "azurerm_firewall"


output "test_one_app_service_output" {
  value = module.test_one
}

output "test_one_app_service" {
  value = module.test_one.names["azurerm_app_service"]
}

output "test_one_storage_account" {
  value = module.test_one.names["azurerm_storage_account"]
}

output "test_one_subnet" {
  value = module.test_one.names["azurerm_subnet"]
}

output "test_one_virtual_network" {
  value = module.test_one.names["azurerm_virtual_network"]
}

/* Test two outputs **/
output "test_two_app_service_output" {
  value = module.test_two
}

output "test_two_app_service" {
  value = module.test_two.names["azurerm_app_service"]
}

output "test_two_storage_account" {
  value = module.test_two.names["azurerm_storage_account"]
}

output "test_two_subnet" {
  value = module.test_two.names["azurerm_subnet"]
}

output "test_two_virtual_network" {
  value = module.test_two.names["azurerm_virtual_network"]
}

/* Test two outputs **/
output "test_three_app_service_output" {
  value = module.test_three
}

output "test_three_app_service" {
  value = module.test_three.names["azurerm_app_service"]
}

output "test_three_storage_account" {
  value = module.test_three.names["azurerm_storage_account"]
}

output "test_three_subnet" {
  value = module.test_three.names["azurerm_subnet"]
}

output "test_three_virtual_network" {
  value = module.test_three.names["azurerm_virtual_network"]
}