#!/bin/bash

# Function to add a new user to IDM using ipa command
add_user_to_idm() {
    local username="$1"
    local first_name="$2"
    local last_name="$3"
    local email="$4"

    # Command to add user to IDM using ipa command
    echo "Adding user $username to IDM..."
    ipa user-add --first="$first_name" --last="$last_name" --email="$email" "$username"

    if [ $? -eq 0 ]; then
        echo "User $username added to IDM successfully."
    else
        echo "Failed to add user $username to IDM."
        exit 1
    fi
}

# Check for required arguments
if [ $# -ne 4 ]; then
    echo "Usage: $0 <username> <first_name> <last_name> <email>"
    exit 1
fi

# Assign arguments to variables
USERNAME="$1"
FIRST_NAME="$2"
LAST_NAME="$3"
EMAIL="$4"

# Add user to IDM
add_user_to_idm "$USERNAME" "$FIRST_NAME" "$LAST_NAME" "$EMAIL"

echo "User $USERNAME has been successfully added to IDM."
