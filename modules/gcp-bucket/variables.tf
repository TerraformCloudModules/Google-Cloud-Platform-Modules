variable "project_id" {
  description = "The target GCP project ID where the bucket will be created."
  type        = string
}

variable "bucket_name" {
  description = "The name of the GCS bucket. Must be globally unique."
  type        = string
}

variable "bucket_location" {
  description = "The regional or multi-regional location of the bucket."
  type        = string
  default     = "US"
}

variable "storage_class" {
  description = "The storage class of the bucket (e.g., STANDARD, NEARLINE, COLDLINE, ARCHIVE)."
  type        = string
  default     = "STANDARD"
}

variable "versioning_enabled" {
  description = "Whether to enable versioning for objects in the GCS bucket."
  type        = bool
  default     = false
}

variable "environment" {
  description = "The environment name (e.g., dev, staging, prod). Appended to resource names."
  type        = string
}
