# Create the project only if create_project is enabled
resource "google_project" "project" {
  count           = var.create_project ? 1 : 0
  name            = var.project_name
  project_id      = var.project_id
  org_id          = var.org_id != "" ? var.org_id : null
  folder_id       = var.folder_id != "" ? var.folder_id : null
  billing_account = var.billing_account != "" ? var.billing_account : null
  deletion_policy = "DELETE"

  lifecycle {
    prevent_destroy = false
  }
}

# Enable APIs dynamically for either the new or existing project
resource "google_project_service" "enabled_apis" {
  for_each = toset(var.apis_to_enable)

  project            = var.create_project ? google_project.project[0].project_id : var.project_id
  service            = each.value
  disable_on_destroy = false
}
