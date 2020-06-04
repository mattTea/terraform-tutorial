resource "google_storage_bucket" "static-site" {
  name               = "test.happyhoppersoftware.com"
  location           = "EU"
  force_destroy      = true
  bucket_policy_only = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}
