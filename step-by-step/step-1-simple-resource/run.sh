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

terraform plan -out plan.tfplan

wait_for_user

terraform apply plan.tfplan
