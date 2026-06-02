output "project_id" {
  description = "The ID of the project (either created or pre-existing)."
  value       = var.create_project ? google_project.project[0].project_id : var.project_id
}

output "enabled_apis" {
  description = "The list of APIs that were enabled on the project."
  value       = [for k, v in google_project_service.enabled_apis : v.service]
}
