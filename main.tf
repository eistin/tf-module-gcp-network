/******************************************
	VPC configuration
 *****************************************/
module "vpc" {
  source                                 = "./modules/vpc"
  network_name                           = var.network_name
  auto_create_subnetworks                = var.auto_create_subnetworks
  routing_mode                           = var.routing_mode
  project_id                             = var.project_id
  description                            = var.description
  shared_vpc_host                        = var.shared_vpc_host
  delete_default_internet_gateway_routes = var.delete_default_internet_gateway_routes
  internal_ipv6_range                    = var.internal_ipv6_range
}

/******************************************
	Subnet configuration
 *****************************************/
module "subnets" {
  source           = "./modules/subnets"
  project_id       = var.project_id
  network_name     = module.vpc.network_name
  subnets          = var.subnets
  secondary_ranges = var.secondary_ranges
}

/******************************************
	Routes
 *****************************************/
module "routes" {
  source       = "./modules/routes"
  project_id   = var.project_id
  network_name = module.vpc.network_name
  routes       = var.routes
  depends_on   = [module.subnets.subnets]
}

/******************************************
	Firewall rules
 *****************************************/
locals {
  rules = [
    for f in var.firewall_rules : {
      name                    = f.name
      direction               = f.direction
      disabled                = lookup(f, "disabled", null)
      priority                = lookup(f, "priority", null)
      description             = lookup(f, "description", null)
      ranges                  = lookup(f, "ranges", null)
      source_tags             = lookup(f, "source_tags", null)
      source_service_accounts = lookup(f, "source_service_accounts", null)
      target_tags             = lookup(f, "target_tags", null)
      target_service_accounts = lookup(f, "target_service_accounts", null)
      allow                   = lookup(f, "allow", [])
      deny                    = lookup(f, "deny", [])
      log_config              = lookup(f, "log_config", null)
    }
  ]
}

module "firewall_rules" {
  source        = "./modules/firewall-rules"
  project_id    = var.project_id
  network_name  = module.vpc.network_name
  rules         = local.rules
  ingress_rules = var.ingress_rules
  egress_rules  = var.egress_rules
}

/******************************************
	NAT Gateways
 *****************************************/

module "nat" {
  count        = var.create_nat_gateway ? 1 : 0
  source       = "./modules/nat"
  network_name = var.network_name
  project_id   = var.project_id
  region       = var.subnets[0].subnet_region
  depends_on   = [module.subnets.subnets]
}

/******************************************
	Private Services Networks
 *****************************************/
module "private_services_networks" {
  source                    = "./modules/private-services-networks"
  network_name              = var.network_name
  network_self_link         = module.vpc.network_self_link
  project_id                = var.project_id
  private_services_networks = var.private_services_networks
}
