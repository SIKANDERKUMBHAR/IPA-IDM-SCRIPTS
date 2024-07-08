#!/bin/bash

# Function to add sudo rule to IDM user
add_sudo_rule_to_user() {
    local user_login="$1"
    local sudo_rule="$2"
    
    # Command to add sudo rule to user in IDM using ipa command
    echo "Adding sudo rule $sudo_rule to user $user_login..."
    ipa sudorule-add-user --users="$user_login" "$sudo_rule"
    
    if [ $? -eq 0 ]; then
        echo "Sudo rule $sudo_rule added to user $user_login successfully."
    else
        echo "Failed to add sudo rule $sudo_rule to user $user_login."
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

# Add sudo rule to IDM user
add_sudo_rule_to_user "$USER_LOGIN" "$SUDO_RULE"

echo "Sudo rule $SUDO_RULE has been successfully added to user $USER_LOGIN."
