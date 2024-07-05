#!/bin/bash

# Function to disable a user in IDM using ipa command
disable_user_in_idm() {
    local username="$1"

    # Command to disable user in IDM using ipa command
    echo "Disabling user $username in IDM..."
    ipa user-disable "$username"

    if [ $? -eq 0 ]; then
        echo "User $username disabled in IDM successfully."
    else
        echo "Failed to disable user $username in IDM."
        exit 1
    fi
}

# Check for required arguments
if [ $# -ne 1 ]; then
    echo "Usage: $0 <username>"
    exit 1
fi

# Assign argument to variable
USERNAME="$1"

# Disable user in IDM
disable_user_in_idm "$USERNAME"

echo "User $USERNAME has been successfully disabled in IDM."
