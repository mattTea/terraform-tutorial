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
cp ../step-by-step/step-2-resources-and-dependencies/*.tf .

terraform init

terraform plan -out plan.tfplan

wait_for_user

terraform apply plan.tfplan
