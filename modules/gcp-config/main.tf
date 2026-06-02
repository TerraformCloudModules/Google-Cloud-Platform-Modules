# Define local variables for better readability and reusability.
locals {
  config_path = var.config_path != "" ? var.config_path : "${path.root}/gcp-config"

  # Resolve the environment name: default to var.environment, otherwise terraform.workspace.
  # If terraform.workspace is "default", fallback to "dev".
  resolved_environment = var.environment != "" ? var.environment : (
    terraform.workspace == "default" ? "dev" : terraform.workspace
  )

  # Load the single corresponding YAML file
  config_file = "${local.config_path}/${local.resolved_environment}.yaml"

  # Decode the file
  configs = yamldecode(templatefile(local.config_file, {}))
}