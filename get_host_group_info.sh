#!/bin/bash

# Function to get information about a host group in IDM using ipa command
get_host_group_info() {
    local host_group="$1"
    
    # Command to retrieve host group information using ipa command
    echo "Getting information about host group $host_group..."
    ipa hostgroup-show "$host_group"
    
    if [ $? -ne 0 ]; then
        echo "Failed to retrieve information for host group $host_group."
        exit 1
    fi
}

# Check for required argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <host_group>"
    exit 1
fi

# Assign argument to variable
HOST_GROUP="$1"

# Get information about host group
get_host_group_info "$HOST_GROUP"
