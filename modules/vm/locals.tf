locals {
  role_name = var.type == "db" || var.type == "app" ? var.name : "${var.name}-docker"
}