output "private_service_networks" {
  value       = google_service_networking_connection.private_services_networking
  description = "List of the private services created."
}
