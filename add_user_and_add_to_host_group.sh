#!/bin/bash

# Function to create user in IDM using ipa command
create_user_in_idm() {
    local user_login="$1"
    local first_name="$2"
    local last_name="$3"
    local new_password="$4"
    
    # Command to add user to IDM using ipa command
    echo "Adding user $user_login to IDM..."
    echo -e "$new_password\n$new_password" | ipa user-add "$user_login" --first "$first_name" --last "$last_name" --password
    
    if [ $? -eq 0 ]; then
        echo "User $user_login added to IDM successfully."
    else
        echo "Failed to add user $user_login to IDM."
        exit 1
    fi
}

# Function to add user to host-group in IDM using ipa command
add_user_to_host_group() {
    local user_login="$1"
    local host_group="$2"
    
    # Command to add user to host-group using ipa command
    echo "Adding user $user_login to host-group $host_group..."
    ipa hostgroup-add-member "$host_group" --hosts="$user_login"
    
    if [ $? -eq 0 ]; then
        echo "User $user_login added to host-group $host_group successfully."
    else
        echo "Failed to add user $user_login to host-group $host_group."
        exit 1
    fi
}

# Check for required arguments
if [ $# -ne 6 ]; then
    echo "Usage: $0 <user_login> <first_name> <last_name> <new_password> <host_group>"
    exit 1
fi

# Assign arguments to variables
USER_LOGIN="$1"
FIRST_NAME="$2"
LAST_NAME="$3"
NEW_PASSWORD="$4"
HOST_GROUP="$5"

# Prompt for confirmation
read -p "Are you sure you want to create user $USER_LOGIN and add them to host-group $HOST_GROUP? (yes/no): " confirmation

# Check user's response
if [[ "$confirmation" != "yes" ]]; then
    echo "Operation cancelled."
    exit 0
fi

# Create user in IDM
create_user_in_idm "$USER_LOGIN" "$FIRST_NAME" "$LAST_NAME" "$NEW_PASSWORD"

# Add user to host-group in IDM
add_user_to_host_group "$USER_LOGIN" "$HOST_GROUP"

echo "User $USER_LOGIN has been successfully created and added to host-group $HOST_GROUP."
