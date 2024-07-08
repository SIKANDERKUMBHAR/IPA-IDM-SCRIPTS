#!/bin/bash

# Function to remove HBAC rule from IDM user
remove_hbac_rule_from_user() {
    local user_login="$1"
    local hbac_rule="$2"

    # Command to remove HBAC rule from user in IDM using ipa command
    echo "Removing HBAC rule $hbac_rule from user $user_login..."
    ipa hbacrule-remove-user --users="$user_login" "$hbac_rule"

    if [ $? -eq 0 ]; then
        echo "HBAC rule $hbac_rule removed from user $user_login successfully."
    else
        echo "Failed to remove HBAC rule $hbac_rule from user $user_login."
        exit 1
    fi
}

# Check for required arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 <user_login> <hbac_rule>"
    exit 1
fi

# Assign arguments to variables
USER_LOGIN="$1"
HBAC_RULE="$2"

# Prompt for confirmation
read -p "Are you sure you want to remove HBAC rule $HBAC_RULE from user $USER_LOGIN? (yes/no): " confirmation

# Check user's response
if [[ "$confirmation" != "yes" ]]; then
    echo "Operation cancelled."
    exit 0
fi

# Remove HBAC rule from IDM user
remove_hbac_rule_from_user "$USER_LOGIN" "$HBAC_RULE"

echo "HBAC rule $HBAC_RULE has been successfully removed from user $USER_LOGIN."
