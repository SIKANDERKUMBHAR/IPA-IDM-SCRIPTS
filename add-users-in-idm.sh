#!/bin/bash

# Function to add user to IDM using ipa command
add_user_to_idm() {
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

# Check for required arguments
if [ $# -ne 4 ]; then
    echo "Usage: $0 <user_login> <first_name> <last_name> <new_password>"
    exit 1
fi

# Assign arguments to variables
USER_LOGIN="$1"
FIRST_NAME="$2"
LAST_NAME="$3"
NEW_PASSWORD="$4"

# Add user to IDM
add_user_to_idm "$USER_LOGIN" "$FIRST_NAME" "$LAST_NAME" "$NEW_PASSWORD"

echo "User $USER_LOGIN has been successfully added to IDM."
