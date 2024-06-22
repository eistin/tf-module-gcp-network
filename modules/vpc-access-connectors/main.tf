locals {
  vpc_access_connectors = {
    for x in var.vpc_access_connectors : x.name => x
  }
}

resource "google_vpc_access_connector" "this" {
  for_each = local.vpc_access_connectors
  provider = google-beta

  project       = var.project_id
  name          = "${lookup(each.value, "name")}-connector"
  ip_cidr_range = lookup(each.value, "ip_cidr_range")
  network       = var.network_name
}
