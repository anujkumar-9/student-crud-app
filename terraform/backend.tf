terraform {
  backend "gcs" {
    bucket = "student-crud-app-tfstate"
    prefix = "terraform/state"
  }
}
