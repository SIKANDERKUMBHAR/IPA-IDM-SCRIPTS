#!/bin/bash

# Function to reset password for IDM user
reset_password_for_user() {
    local user_login="$1"
    local new_password="$2"

    # Command to reset password using ipa command
    echo "Resetting password for user $user_login..."
    echo -e "$new_password\n$new_password" | ipa passwd "$user_login"

    if [ $? -eq 0 ]; then
        echo "Password reset successfully for user $user_login."
    else
        echo "Failed to reset password for user $user_login."
        exit 1
    fi
}

# Check for required arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 <user_login> <new_password>"
    exit 1
fi

# Assign arguments to variables
USER_LOGIN="$1"
NEW_PASSWORD="$2"

# Prompt for confirmation
read -p "Are you sure you want to reset the password for user $USER_LOGIN? (yes/no): " confirmation

# Check user's response
if [[ "$confirmation" != "yes" ]]; then
    echo "Operation cancelled."
    exit 0
fi

# Reset password for IDM user
reset_password_for_user "$USER_LOGIN" "$NEW_PASSWORD"

echo "Password for user $USER_LOGIN has been successfully reset."

