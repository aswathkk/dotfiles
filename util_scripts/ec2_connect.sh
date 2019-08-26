#!/bin/bash

function get_public_ip {
    PRIVATE_IP="$1"
    PUBLIC_IP="$PRIVATE_IP"
    if [[ "$PRIVATE_IP" =~ "^172" ]]; then
        PUBLIC_IP=$(aws ec2 describe-instances \
            --filters="Name=network-interface.addresses.private-ip-address,Values=$PRIVATE_IP" \
            --query "Reservations[*].Instances[*].PublicIpAddress" \
            | jq -r '.[0][0]')
    fi
    echo "$PUBLIC_IP"
}
