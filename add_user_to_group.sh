#!/bin/bash

# Function to add a user to a group in IDM using ipa command
add_user_to_group() {
    local username="$1"
    local groupname="$2"

    # Command to add user to group using ipa command
    echo "Adding user $username to group $groupname in IDM..."
    ipa group-add-member --users="$username" "$groupname"

    if [ $? -eq 0 ]; then
        echo "User $username added to group $groupname in IDM successfully."
    else
        echo "Failed to add user $username to group $groupname in IDM."
        exit 1
    fi
}

# Check for required arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 <username> <groupname>"
    exit 1
fi

# Assign arguments to variables
USERNAME="$1"
GROUPNAME="$2"

# Add user to group in IDM
add_user_to_group "$USERNAME" "$GROUPNAME"

echo "User $USERNAME has been successfully added to group $GROUPNAME in IDM."
