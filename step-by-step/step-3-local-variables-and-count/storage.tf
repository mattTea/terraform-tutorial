# Now we have two buckets

resource "google_storage_bucket" "bucket-for-project-config" {
  name               = "configuration-files-for-project"
  location           = "EU"
}

resource "google_storage_bucket" "bucket-for-project-data" {
  name               = "data-files-for-project"
  location           = "EU"
}

# Service account as before

resource "google_service_account" "account-that-will-read-bucket" {
  account_id = "microservice-name"
}

# Give the account access to both buckets
# We can do this using a list of buckets and the "count" parameter

# a local variable with a list of the buckets in it
locals {
  all_buckets = [google_storage_bucket.bucket-for-project-config, google_storage_bucket.bucket-for-project-data]
}

# Use "count" to apply this to each of the buckets in the list
# This will result in two resources being created, called "account-bucket-access[0]" and "account-bucket-access[1]"
resource "google_storage_bucket_iam_member" "account-bucket-access" {
  count = local.all_buckets.count
  bucket = local.all_buckets[count.index]
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.account-that-will-read-bucket.email}"
}
