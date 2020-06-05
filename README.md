# Terraform Tutorial

This repo contains some _very_ basic terraform code used as part of an introductory session.

## Running the Code

You'll need...

- [Terraform installed](https://learn.hashicorp.com/terraform/getting-started/install.html)
- A GCP project set up
- Your local shell set up and logged into GCP already with `gcloud auth` (terraform will use your identity by default)

Now simply change google project in the [providers.tf] files, cd into each `step-by-step` directory and then...

- `terraform init`
- `terraform plan`
- `terraform apply`

Change or add some resources and then run `plan` and `apply` again to see your new resources created!

---

## Other Resources

- [Hashicorp Learn](https://learn.hashicorp.com/terraform)
