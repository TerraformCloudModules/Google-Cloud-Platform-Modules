# Define local variables for better readability and reusability.
locals {
  config_path = var.config_path != "" ? var.config_path : "${path.root}/gcp-config"

  # Define template variables for use in template files.
  tpl_vars = {}

  # List YAML files from the global config directory
  files_base = toset([
    for f in fileset(local.config_path, "*.yaml") : f
  ])

  # Decode YAML files
  configs_base = [
    for f in local.files_base :
    yamldecode(templatefile("${local.config_path}/${f}", local.tpl_vars))
  ]

  # Merge all configurations
  configs = merge(local.configs_base...)
}