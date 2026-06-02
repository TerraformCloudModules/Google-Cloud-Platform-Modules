variable "create_project" {
  description = "Whether to create the GCP project using Terraform."
  type        = bool
  default     = false
}

variable "project_name" {
  description = "The display name of the GCP project."
  type        = string
}

variable "project_id" {
  description = "The unique GCP project ID."
  type        = string
}

variable "billing_account" {
  description = "The billing account ID to associate with the project (required for API enablement)."
  type        = string
  default     = ""
}

variable "org_id" {
  description = "The parent GCP Organization ID (optional)."
  type        = string
  default     = ""
}

variable "folder_id" {
  description = "The parent GCP Folder ID (optional)."
  type        = string
  default     = ""
}

variable "apis_to_enable" {
  description = "List of GCP APIs to enable on the project."
  type        = list(string)
  default     = []
}
