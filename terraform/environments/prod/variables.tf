variable "project_id" {}
variable "region" {}
variable "zone" {}

variable "network_name" {}
variable "machine_type" {}

variable "frontend_name" {}
variable "backend_name" {}

variable "ssh_source_ranges" {
  type = list(string)
}

variable "http_source_ranges" {
  type = list(string)
}
