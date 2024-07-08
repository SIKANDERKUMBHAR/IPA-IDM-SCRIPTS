#!/bin/bash

# Function to remove sudo rule from IDM user
remove_sudo_rule_from_user() {
    local user_login="$1"
    local sudo_rule="$2"

    # Command to remove sudo rule from user in IDM using ipa command
    echo "Removing sudo rule $sudo_rule from user $user_login..."
    ipa sudorule-remove-user --users="$user_login" "$sudo_rule"

    if [ $? -eq 0 ]; then
        echo "Sudo rule $sudo_rule removed from user $user_login successfully."
    else
        echo "Failed to remove sudo rule $sudo_rule from user $user_login."
        exit 1
    fi
}

# Check for required arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 <user_login> <sudo_rule>"
    exit 1
fi

# Assign arguments to variables
USER_LOGIN="$1"
SUDO_RULE="$2"

# Prompt for confirmation
read -p "Are you sure you want to remove sudo rule $SUDO_RULE from user $USER_LOGIN? (yes/no): " confirmation

# Check user's response
if [[ "$confirmation" != "yes" ]]; then
    echo "Operation cancelled."
    exit 0
fi

# Remove sudo rule from IDM user
remove_sudo_rule_from_user "$USER_LOGIN" "$SUDO_RULE"

echo "Sudo rule $SUDO_RULE has been successfully removed from user $USER_LOGIN."
