# Bucket as in step 1

resource "google_storage_bucket" "bucket-for-project-config" {
  name     = "configuration-files-for-project"
  location = "EU"
}

# Also create a service account

resource "google_service_account" "account-that-will-read-bucket" {
  account_id = "microservice-name"
}

# Give the account access to the bucket
# Notice the bucket name and account name are retrieved by references to the bucket and service account
# resources, as this ensures that the bucket and account are created before the permission is applied

resource "google_storage_bucket_iam_member" "account-bucket-access" {
  bucket = "${google_storage_bucket.bucket-for-project-config.name}"
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.account-that-will-read-bucket.email}"
}
