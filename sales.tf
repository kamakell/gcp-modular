resource "google_project" "ngbi_project" {
  provider            = google
  name                = "ebpw-vf-ngbi-prod"
  project_id          = "ebpw-vf-ngbi-prod"
  billing_account     = module.simple_folders.billing_account_id
  folder_id           = google_folder.layout_folder.id
  skip_delete         = true
  auto_create_network = false
}

resource "google_project_service" "ngbi_services" {
  count              = length(var.project_services)
  project            = google_project.ngbi_project.project_id
  service            = element(var.project_services, count.index)
  disable_on_destroy = false
}
