module "network" {
  source = "../../modules/network"

  network_name      = var.network_name
  ssh_source_ranges = var.ssh_source_ranges
}

module "firewall" {
  source = "../../modules/firewall"

  network_name       = module.network.network_name
  ssh_source_ranges  = var.ssh_source_ranges
  http_source_ranges = var.http_source_ranges
}

module "frontend" {
  source = "../../modules/frontend-vm"

  project_id     = var.project_id
  zone           = var.zone
  instance_name  = var.frontend_name
  machine_type   = var.machine_type
  subnet         = module.network.subnet_name
  startup_script = "../../startup/frontend.sh"
}

module "backend" {
  source = "../../modules/backend-vm"

  project_id     = var.project_id
  zone           = var.zone
  instance_name  = var.backend_name
  machine_type   = var.machine_type
  subnet         = module.network.subnet_name
  startup_script = "../../startup/backend.sh"
}
