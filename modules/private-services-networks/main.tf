locals {
  private_service_networks = {
    for x in var.private_services_networks : x.name => x
  }
}

resource "google_compute_global_address" "address_private_services" {
  for_each      = local.private_service_networks
  provider      = google-beta
  project       = var.project_id
  network       = var.network_self_link
  name          = "${lookup(each.value, "name")}-${var.network_name}"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  address       = lookup(each.value, "address", null)
  prefix_length = lookup(each.value, "prefix_length", 16)
}

resource "google_service_networking_connection" "private_services_networking" {
  count    = length(local.private_service_networks) > 0 ? 1 : 0
  provider = google-beta
  network  = var.network_self_link
  service  = "servicenetworking.googleapis.com"
  # reserved_peering_ranges = [google_compute_global_address.address_private_services.name]
  reserved_peering_ranges = [for k, v in google_compute_global_address.address_private_services : google_compute_global_address.address_private_services[k].name]
}
