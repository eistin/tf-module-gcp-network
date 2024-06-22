variable "project_id" {
  description = "The project ID of the VPC network to peer. This can be a shared VPC host projec."
  type        = string
}

variable "network_name" {
  description = "Name of the VPC network to peer."
  type        = string
}

variable "vpc_access_connectors" {
  type = list(object({
    name          = string
    ip_cidr_range = string
  }))
}
