#!/bin/bash

# Function to remove a user from a group in IDM using ipa command
remove_user_from_group() {
    local username="$1"
    local groupname="$2"

    # Command to remove user from group using ipa command
    echo "Removing user $username from group $groupname in IDM..."
    ipa group-remove-member --users="$username" "$groupname"

    if [ $? -eq 0 ]; then
        echo "User $username removed from group $groupname in IDM successfully."
    else
        echo "Failed to remove user $username from group $groupname in IDM."
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

# Remove user from group in IDM
remove_user_from_group "$USERNAME" "$GROUPNAME"

echo "User $USERNAME has been successfully removed from group $GROUPNAME in IDM."
