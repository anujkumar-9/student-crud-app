output "ssh_firewall" {
  value = google_compute_firewall.allow_ssh.name
}

output "http_firewall" {
  value = google_compute_firewall.allow_http.name
}

output "backend_firewall" {
  value = google_compute_firewall.allow_backend.name
}
