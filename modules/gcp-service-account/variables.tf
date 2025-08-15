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
  default = [ ]
}

variable "admin_roles" {
  description = "Admin-level IAM roles to assign to the service account (use with caution)"
  type        = list(string)
  default = []
}

variable "enable_admin_roles" {
  description = "Whether to enable admin-level roles (use with caution)"
  type        = bool
  default     = false
}

variable "service_account_description" {
  description = "The description for the service account"
  type        = string
  default = "" # Set to empty string to allow for default value to be set in the module
}