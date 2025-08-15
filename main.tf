locals {
  configs = nonsensitive(module.config.configs)
}

# Include a configuration module for managing shared or global configuration settings
module "config" {
  source = "./modules/gcp-config"
}

module "gcp-service-account" {
  source = "./modules/gcp-service-account"
  project_id = local.configs.project_id
  service_account_display_name = local.configs.service_account_display_name
  service_account_description = local.configs.service_account_description
  service_account_id = local.configs.service_account_id
  service_account_roles = local.configs.service_account_roles
  enable_admin_roles = local.configs.enable_admin_roles
}