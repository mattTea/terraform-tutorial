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

# This step simply ties the code from step 2 into our code from step 3.
#
# In reality you wouldn't need this as you would just be extending an existing
# terraform codebase/state.

terraform import google_storage_bucket.bucket-for-project-config steam-habitat-260913/configuration-files-for-project
terraform import google_service_account.account-that-will-read-bucket projects/steam-habitat-260913/serviceAccounts/microservice-name@steam-habitat-260913.iam.gserviceaccount.com

wait_for_user

terraform plan -out plan.tfplan

wait_for_user

terraform apply plan.tfplan
