variable "project_id" {
  description = "The project ID of the VPC network to peer. This can be a shared VPC host projec."
  type        = string
}

variable "network_name" {
  description = "Name of the VPC network to peer."
  type        = string
}

variable "network_self_link" {
  description = "Self link of the VPC network to peer."
  type        = string
}

variable "prefix_length" {
  description = "Prefix length of the IP range reserved for Cloud SQL instances and other Private Service Access services. Defaults to /16."
  type        = number
  default     = 16
}

variable "private_services_networks" {
  type = list(object({
    name          = string
    prefix_length = optional(string)
    address       = optional(string)
  }))
}
