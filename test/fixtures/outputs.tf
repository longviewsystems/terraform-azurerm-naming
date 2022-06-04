/* Test one outputs **/

output "test_one_app_service" {
  value = module.test_one.names.app_service.name
}

output "test_one_storage_account" {
  value = module.test_one.names.storage_account.name
}

output "test_one_subnet" {
  value = module.test_one.names.subnet.name
}

output "test_one_virtual_network" {
  value = module.test_one.names.virtual_network.name
}


/* Test two outputs **/
output "test_two_app_service" {
  value = module.test_two.names.app_service.name
}

output "test_two_storage_account" {
  value = module.test_two.names.storage_account.name
}

output "test_two_subnet" {
  value = module.test_two.names.subnet.name
}

output "test_two_virtual_network" {
  value = module.test_two.names.virtual_network.name
}

/* Test two outputs **/
output "test_three_app_service" {
  value = module.test_three.names.app_service.name
}

output "test_three_storage_account" {
  value = module.test_three.names.storage_account.name
}

output "test_three_subnet" {
  value = module.test_three.names.subnet.name
}

output "test_three_virtual_network" {
  value = module.test_three.names.virtual_network.name
}