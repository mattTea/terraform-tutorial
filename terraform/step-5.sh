#!/bin/bash

function wait_for_user() {
    echo ""
    echo ""
    read -n1 -r -s -p "Press any key to continue..."
    echo ""
    echo ""
}

rm -f *.tf
rm -f *.tfplan
rm -rf buckets
cp ../step-by-step/step-5-using-data-blocks/*.tf .
cp -r ../step-by-step/step-5-using-data-blocks/buckets .

wait_for_user

terraform init

# NOTE: we remove the service account from the state here as we're simulating
# a resource that has been created elsewhere via the use of a data block.  If
# we left the SA in the state terraform would delete the SA as it's no longer
# defined in the code.
terraform state rm module.buckets-and-account.google_service_account.account-that-will-read-bucket

terraform plan -out plan.tfplan

wait_for_user

terraform apply plan.tfplan
