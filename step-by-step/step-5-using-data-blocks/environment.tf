locals {
  env_name = "prod"
}

data "google_service_account" "existing-service-account" {
  account_id = "${local.env_name}-microservice-name"
}

module "buckets-and-account" {
  source                = "./buckets"
  env_name              = local.env_name
  service_account_email = data.google_service_account.existing-service-account.email
}
