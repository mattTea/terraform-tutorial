# Simple Google storage bucket creation.
# The type of resource is "google_storage_bucket", which the Google provider knows how to create.
# The resource's name in Terraform is "bucket-for-project", which we'll use later.

resource "google_storage_bucket" "bucket-for-project-config" {
  name     = "configuration-files-for-project"
  location = "EU"
}
