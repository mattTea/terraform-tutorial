# Terraform Tutorial

This repo contains some _very_ basic terraform code used as part of an introductory session.

## Running the Code

### Prerequisites

- [Terraform installed](https://learn.hashicorp.com/terraform/getting-started/install.html)
- A GCP project set up
- Your local shell set up and logged into GCP already with `gcloud auth` (terraform will use your identity by default)

You'll also need to change every occurrence of `steam-habitat-260913` to your own Google Cloud project id.

### Actually running the code...

We ran the tutorial as if you were updating the code in place at each step - to follow along, just cd into the `terraform` directory and run each `step-*.sh` script in turn. This copies the necessary files into the `terraform` directory and runs a plan and apply - this keeps the state within this directory so you can simulate subsequent terraform runs on the code.

We hope you find this useful. :)

---

## Other Resources

- [Hashicorp Learn](https://learn.hashicorp.com/terraform)
