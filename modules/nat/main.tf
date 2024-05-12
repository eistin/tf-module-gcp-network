resource "google_compute_router" "this" {
  project = var.project_id
  name    = length("${var.network_name}-${var.region}-router") >= 63 ? "${substr(var.network_name, 0, 56 - length("${var.region}"))}-${var.region}-router" : "${var.network_name}-${var.region}-router"
  network = var.network_name
  region  = var.region

  bgp {
    asn = 64514
  }
}

resource "google_compute_router_nat" "this" {
  project                            = var.project_id
  name                               = length("${var.network_name}-${var.region}-nat") >= 63 ? "${substr(var.network_name, 0, 59 - length("${var.region}"))}-${var.region}-nat" : "${var.network_name}-${var.region}-nat"
  router                             = google_compute_router.this.name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = var.log_config_enable
    filter = var.log_config_filter
  }
}
