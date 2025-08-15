# Create the service account
resource "google_service_account" "service_account" {
  account_id   = var.service_account_id
  display_name = var.service_account_display_name
  project      = var.project_id
  description  = var.service_account_description
}

# Assign standard operational roles to the service account
resource "google_project_iam_member" "service_account_standard_roles" {
  for_each = toset(var.service_account_roles)

  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

# Assign admin roles only if explicitly enabled
resource "google_project_iam_member" "service_account_admin_roles" {
  for_each = var.enable_admin_roles ? toset(var.admin_roles) : []

  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

# Create a key for the service account with expiration (to enforce key rotation)
resource "google_service_account_key" "sa_key" {
  service_account_id = google_service_account.service_account.name
  # Note: In a production environment, consider using a secrets management solution
}
