resource "google_compute_firewall" "allow_ssh" {
  name    = "${var.network_name}-allow-ssh"
  network = var.network_name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.ssh_source_ranges
}

resource "google_compute_firewall" "allow_http" {
  name    = "${var.network_name}-allow-http"
  network = var.network_name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = var.http_source_ranges
}

resource "google_compute_firewall" "allow_backend" {
  name    = "${var.network_name}-allow-backend"
  network = var.network_name

  allow {
    protocol = "tcp"
    ports    = ["5000"]
  }

  source_ranges = ["10.10.0.0/24"]
}
