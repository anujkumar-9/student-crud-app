project_id = "prud-project"

region = "asia-south1"
zone   = "asia-south1-a"

network_name = "student-prod-network"

machine_type = "e2-micro"

frontend_name = "student-prod-frontend"
backend_name  = "student-prod-backend"

ssh_source_ranges = ["160.202.36.52"]

http_source_ranges = ["0.0.0.0/0"]
