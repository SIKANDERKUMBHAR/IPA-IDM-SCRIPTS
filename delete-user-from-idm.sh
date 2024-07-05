#!/bin/bash

# Function to delete user from IDM using ipa command
delete_user_from_idm() {
    local user_login="$1"

    # Command to delete user from IDM using ipa command
    echo "Deleting user $user_login from IDM..."
    ipa user-del "$user_login"

    if [ $? -eq 0 ]; then
        echo "User $user_login deleted from IDM successfully."
    else
        echo "Failed to delete user $user_login from IDM."
        exit 1
    fi
}

# Check for required arguments
if [ $# -ne 1 ]; then
    echo "Usage: $0 <user_login>"
    exit 1
fi

# Assign argument to variable
USER_LOGIN="$1"

# Delete user from IDM
delete_user_from_idm "$USER_LOGIN"

echo "User $USER_LOGIN has been successfully deleted from IDM."
