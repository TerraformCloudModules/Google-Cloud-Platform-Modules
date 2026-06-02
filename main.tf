locals {
  configs = nonsensitive(module.config.configs)

  # Resolve the active environment from the workspace
  env = terraform.workspace == "default" ? "dev" : terraform.workspace
}

# 1. Config module to read and parse the local YAML variables
module "config" {
  source = "./modules/gcp-config"
}

# 2. Bootstrap module to conditionally create the project and enable GCP APIs
#    Project and APIs are shared across all environments (no suffix needed)
module "gcp-project" {
  source          = "./modules/gcp-project"
  create_project  = try(local.configs.create_project, false)
  project_id      = local.configs.project_id
  project_name    = try(local.configs.project_name, local.configs.project_id)
  billing_account = try(local.configs.billing_account, "")
  org_id          = try(local.configs.org_id, "")
  folder_id       = try(local.configs.folder_id, "")
  apis_to_enable  = try(local.configs.apis_to_enable, [])
}

# 3. Service Account module — naming pattern applied inside the module
module "gcp-service-account" {
  source                       = "./modules/gcp-service-account"
  project_id                   = module.gcp-project.project_id
  service_account_id           = local.configs.service_account_id
  service_account_display_name = local.configs.service_account_display_name
  service_account_description  = local.configs.service_account_description
  service_account_roles        = local.configs.service_account_roles
  enable_admin_roles           = local.configs.enable_admin_roles
  admin_roles                  = local.configs.admin_roles
  environment                  = local.env

  depends_on = [module.gcp-project]
}

# 4. GCS Bucket module — naming pattern applied inside the module
module "gcp-bucket" {
  source             = "./modules/gcp-bucket"
  project_id         = module.gcp-project.project_id
  bucket_name        = local.configs.bucket_name
  bucket_location    = try(local.configs.bucket_location, "US")
  storage_class      = try(local.configs.storage_class, "STANDARD")
  versioning_enabled = try(local.configs.versioning_enabled, false)
  environment        = local.env

  depends_on = [module.gcp-project]
}