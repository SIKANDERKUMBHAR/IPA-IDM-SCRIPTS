#!/bin/bash

# Function to get user details from IDM using ipa command
get_user_details_from_idm() {
    local user_login="$1"

    # Command to get user details from IDM using ipa command
    echo "Retrieving details for user $user_login from IDM..."
    ipa user-show "$user_login"

    if [ $? -eq 0 ]; then
        echo "Details for user $user_login retrieved successfully."
    else
        echo "Failed to retrieve details for user $user_login from IDM."
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

# Get user details from IDM
get_user_details_from_idm "$USER_LOGIN"

echo "Details for user $USER_LOGIN have been successfully retrieved from IDM."
