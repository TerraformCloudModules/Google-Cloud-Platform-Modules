# Create the Google Cloud Storage Bucket
resource "google_storage_bucket" "bucket" {
  name          = "${var.bucket_name}-${var.environment}"
  project       = var.project_id
  location      = var.bucket_location
  storage_class = var.storage_class

  # Force destroy allows destroying non-empty buckets during teardown/demolition
  force_destroy = true

  # Modern security best-practices
  public_access_prevention    = "enforced"
  uniform_bucket_level_access = true

  # Versioning settings
  versioning {
    enabled = var.versioning_enabled
  }
}
