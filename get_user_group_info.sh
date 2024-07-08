#!/bin/bash

# Function to get information about a user group in IDM using ipa command
get_user_group_info() {
    local user_group="$1"
    
    # Command to retrieve user group information using ipa command
    echo "Getting information about user group $user_group..."
    ipa group-show "$user_group"
    
    if [ $? -ne 0 ]; then
        echo "Failed to retrieve information for user group $user_group."
        exit 1
    fi
}

# Check for required argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <user_group>"
    exit 1
fi

# Assign argument to variable
USER_GROUP="$1"

# Get information about user group
get_user_group_info "$USER_GROUP"
