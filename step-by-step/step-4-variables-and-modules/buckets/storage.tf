# The bucket and service account names are now prefixed with environment name

resource "google_storage_bucket" "bucket-for-project-config" {
  name     = "${var.env_name}-configuration-files-for-project"
  location = "EU"
}

resource "google_storage_bucket" "bucket-for-project-data" {
  name     = "${var.env_name}-data-files-for-project"
  location = "EU"
}

resource "google_service_account" "account-that-will-read-bucket" {
  account_id = "${var.env_name}-microservice-name"
}

# The permission setting does not need to calculate the resource names with the environment name in them, because
# it is reading the names from the resources above and will get the correct names from them.

locals {
  all_buckets = [
    google_storage_bucket.bucket-for-project-config,
    google_storage_bucket.bucket-for-project-data,
  ]
}

resource "google_storage_bucket_iam_member" "account-bucket-access" {
  count  = length(local.all_buckets)
  bucket = local.all_buckets[count.index].name
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.account-that-will-read-bucket.email}"
}
