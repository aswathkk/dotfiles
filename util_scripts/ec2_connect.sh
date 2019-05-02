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

function ec2_connect() {
    INPUT=$1

    # Machine Mapping File format:
    # Machine_name<Tab>Private_IP
    MACHINE_MAPPING_FILE="$XDG_CONFIG_HOME/private_configs/machine_list"
    KEY_FILE=$(cat "$XDG_CONFIG_HOME/private_configs/key_file_location")

    # Default user is centos
    USER=centos
    IP=$INPUT

    if [[ "$IP" =~ "@" ]]; then
        IP=$(echo "$INPUT" | cut -d'@' -f2)
        USER=$(echo "$INPUT" | cut -d'@' -f1)
    fi
    
    PRIVATE_IP=$(grep -w "$IP" "$MACHINE_MAPPING_FILE" | cut -f2)

    if [[ -z "$PRIVATE_IP" ]]; then
        PRIVATE_IP=$IP
    fi

    PUBLIC_IP=$(get_public_ip "$PRIVATE_IP")

    if [[ "$2" = "mosh" ]]; then
        mosh --ssh="ssh -i $KEY_FILE" "$USER"@"$PUBLIC_IP"
    else
        ssh -i "$KEY_FILE" "$USER"@"$PUBLIC_IP"
    fi
}
