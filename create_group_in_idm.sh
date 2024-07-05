#!/bin/bash

# Function to create a new group in IDM using ipa command
create_group_in_idm() {
    local groupname="$1"

    # Command to create group in IDM using ipa command
    echo "Creating group $groupname in IDM..."
    ipa group-add "$groupname"

    if [ $? -eq 0 ]; then
        echo "Group $groupname created in IDM successfully."
    else
        echo "Failed to create group $groupname in IDM."
        exit 1
    fi
}

# Check for required arguments
if [ $# -ne 1 ]; then
    echo "Usage: $0 <groupname>"
    exit 1
fi

# Assign argument to variable
GROUPNAME="$1"

# Create group in IDM
create_group_in_idm "$GROUPNAME"

echo "Group $GROUPNAME has been successfully created in IDM."
