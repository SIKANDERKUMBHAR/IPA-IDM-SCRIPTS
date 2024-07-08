#!/bin/bash

# Function to add HBAC rule to IDM user
add_hbac_rule_to_user() {
    local user_login="$1"
    local hbac_rule="$2"

    # Command to add HBAC rule to user in IDM using ipa command
    echo "Adding HBAC rule $hbac_rule to user $user_login..."
    ipa hbacrule-add-user --users="$user_login" "$hbac_rule"

    if [ $? -eq 0 ]; then
        echo "HBAC rule $hbac_rule added to user $user_login successfully."
    else
        echo "Failed to add HBAC rule $hbac_rule to user $user_login."
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
read -p "Are you sure you want to add HBAC rule $HBAC_RULE to user $USER_LOGIN? (yes/no): " confirmation

# Check user's response
if [[ "$confirmation" != "yes" ]]; then
    echo "Operation cancelled."
    exit 0
fi

# Add HBAC rule to IDM user
add_hbac_rule_to_user "$USER_LOGIN" "$HBAC_RULE"

echo "HBAC rule $HBAC_RULE has been successfully added to user $USER_LOGIN."
