#!/bin/bash

# Function to remove user from host-group in IDM using ipa command
remove_user_from_host_group() {
    local user_login="$1"
    local host_group="$2"
    
    # Command to remove user from host-group using ipa command
    echo "Removing user $user_login from host-group $host_group..."
    ipa hostgroup-remove-member "$host_group" --hosts="$user_login"
    
    if [ $? -eq 0 ]; then
        echo "User $user_login removed from host-group $host_group successfully."
    else
        echo "Failed to remove user $user_login from host-group $host_group."
        exit 1
    fi
}

# Check for required arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 <user_login> <host_group>"
    exit 1
fi

# Assign arguments to variables
USER_LOGIN="$1"
HOST_GROUP="$2"

# Prompt for confirmation
read -p "Are you sure you want to remove user $USER_LOGIN from host-group $HOST_GROUP? (yes/no): " confirmation

# Check user's response
if [[ "$confirmation" != "yes" ]]; then
    echo "Operation cancelled."
    exit 0
fi

# Remove user from host-group in IDM
remove_user_from_host_group "$USER_LOGIN" "$HOST_GROUP"

echo "User $USER_LOGIN has been successfully removed from host-group $HOST_GROUP."
