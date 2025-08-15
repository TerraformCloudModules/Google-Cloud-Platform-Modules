# Output blocks for exposing all configurations and secrets
output "configs" {
  description = "All configs"
  value       = local.configs
}