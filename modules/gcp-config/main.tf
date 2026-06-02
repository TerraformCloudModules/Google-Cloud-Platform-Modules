# Define local variables for better readability and reusability.
locals {
  config_path = var.config_path != "" ? var.config_path : "${path.root}/gcp-config"

  # List YAML files from the config directory
  files_base = toset([
    for f in fileset(local.config_path, "*.yaml") : f
  ])

  # Decode YAML files
  configs_base = [
    for f in local.files_base :
    yamldecode(templatefile("${local.config_path}/${f}", {}))
  ]

  # Merge all configurations
  configs = merge(local.configs_base...)
}