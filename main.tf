module "service_account" {
  source                       = "./modules/service-account"
  project_id                   = var.project_id # Required : Hardcode it here or add it in "modules/gcp-service-account/variables.tf"
  service_account_id           = var.service_account_id # Required : Hardcode it here or add it in "modules/gcp-service-account/variables.tf"
  service_account_display_name = var.service_account_display_name # Required : Hardcode it here or add it in "modules/gcp-service-account/variables.tf"
  
  # Optional: You can also override the default roles   
  service_account_roles = var.service_account_roles # Optional
  
  # Optional: You can also override the default admin roles
  admin_roles = var.admin_roles # Optional
  
  # Enable admin roles only when needed
  enable_admin_roles = false
}