resource "google_compute_instance" "backend" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2404-lts-amd64"
    }
  }

  network_interface {
    subnetwork = var.subnet

    access_config {}
  }

  metadata_startup_script = file(var.startup_script)

  tags = ["backend"]
}
