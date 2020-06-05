#!/bin/bash

function wait_for_user() {
    echo ""
    echo ""
    read -n1 -r -s -p "Press any key to continue..."
    echo ""
    echo ""
}

terraform init

wait_for_user

# This step simply ties the code from step 4 into our code from step 5.
#
# In reality you wouldn't need this as you would just be extending an existing
# terraform codebase/state.

terraform import module.buckets-and-account.google_storage_bucket.bucket-for-project-config steam-habitat-260913/prod-configuration-files-for-project
terraform import module.buckets-and-account.google_storage_bucket.bucket-for-project-data steam-habitat-260913/prod-data-files-for-project
terraform import 'module.buckets-and-account.google_storage_bucket_iam_member.account-bucket-access[0]' 'b/prod-configuration-files-for-project roles/storage.objectViewer serviceaccount:prod-microservice-name@steam-habitat-260913.iam.gserviceaccount.com'
terraform import 'module.buckets-and-account.google_storage_bucket_iam_member.account-bucket-access[1]' 'b/prod-data-files-for-project roles/storage.objectViewer serviceaccount:prod-microservice-name@steam-habitat-260913.iam.gserviceaccount.com'

wait_for_user

terraform plan -out plan.tfplan

wait_for_user

terraform apply plan.tfplan
