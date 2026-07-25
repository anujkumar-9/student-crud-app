variable "network_name" {
  type = string
}

variable "ssh_source_ranges" {
  type = list(string)
}

variable "http_source_ranges" {
  type = list(string)
}
