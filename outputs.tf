output "debug" {
  value       = var.output_debug_info ? azurecaf_name.naming : null
  description = "A map of resources of all the supported resources."
}

output "names" {
  value       = azurecaf_name.naming.results
  description = "A map of resources of all the supported resources."
}