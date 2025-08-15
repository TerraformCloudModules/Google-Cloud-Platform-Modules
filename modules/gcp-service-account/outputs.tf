# Output the email of the created service account
output "service_account_email" {
  description = "The email address of the service account"
  value       = google_service_account.service_account.email
}

# Output the service account ID
output "service_account_id" {
  description = "The ID of the service account"
  value       = google_service_account.service_account.id
}

# Output the service account unique ID
output "service_account_unique_id" {
  description = "The unique ID of the service account"
  value       = google_service_account.service_account.unique_id
}

# Output the service account name
output "service_account_name" {
  description = "The fully-qualified name of the service account"
  value       = google_service_account.service_account.name
}

# Output the service account key
output "service_account_key" {
  description = "The service account key (sensitive)"
  value       = google_service_account_key.sa_key.private_key
  sensitive   = true
}