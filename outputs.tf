output "bucket_name" {
  description = "The name of the created storage bucket."
  value       = module.gcp-bucket.bucket_name
}

output "bucket_url" {
  description = "The URL (gs://) of the created storage bucket."
  value       = module.gcp-bucket.bucket_url
}
