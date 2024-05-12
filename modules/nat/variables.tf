variable "project_id" {
  description = "The ID of the project where the routes will be created"
  type        = string
}

variable "region" {
  description = "The ID of the project where the routes will be created"
  type        = string
}

variable "network_name" {
  description = "Name of the targeted network"
  type        = string
}

variable "log_config_enable" {
  type        = bool
  default     = false
  description = "Indicates whether or not to export logs."
}

variable "log_config_filter" {
  type        = string
  default     = "ERRORS_ONLY"
  description = "Specifies the desired filtering of logs on this NAT. Possible values are ERRORS_ONLY, TRANSLATIONS_ONLY, and ALL"
}

