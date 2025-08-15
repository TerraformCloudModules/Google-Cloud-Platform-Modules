variable "project_id" {
  description = "The GCP project ID"
  type        = string
  default = "" # Set to empty string to allow for default value to be set in the module
}

variable "service_account_id" {
  description = "The service account ID"
  type        = string
  default = "" # Set to empty string to allow for default value to be set in the module
}

variable "service_account_display_name" {
  description = "The display name for the service account"
  type        = string
  default = "" # Set to empty string to allow for default value to be set in the module
}

variable "service_account_roles" {
  description = "IAM roles to assign to the service account"
  type        = list(string)
  default = [
    "roles/artifactregistry.admin",
    "roles/bigquery.dataViewer",
    "roles/run.viewer",
    "roles/cloudsql.viewer",
    "roles/compute.admin",
    "roles/compute.networkAdmin",
    "roles/compute.storageAdmin",
    "roles/compute.viewer",
    "roles/resourcemanager.projectIamAdmin",
    "roles/pubsub.viewer",
    "roles/iam.serviceAccountAdmin",
    "roles/iam.serviceAccountKeyAdmin",
    "roles/storage.objectAdmin",
    "roles/iam.serviceAccountUser",
    "roles/iam.serviceAccountTokenCreator",
    "roles/iam.serviceAccountTokenAdmin",
    "roles/iam.serviceAccountCredentialsAdmin",
    "roles/iam.serviceAccountCredentialsUser",
    "roles/iam.serviceAccountCredentialsTokenCreator",
    "roles/iam.serviceAccountCredentialsTokenAdmin",
    # Add More according to need
  ]
}

variable "admin_roles" {
  description = "Admin-level IAM roles to assign to the service account (use with caution)"
  type        = list(string)
  default = [
    "roles/iam.serviceAccountAdmin",
    "roles/resourcemanager.projectIamAdmin"
  ]
}

variable "enable_admin_roles" {
  description = "Whether to enable admin-level roles (use with caution)"
  type        = bool
  default     = false
}