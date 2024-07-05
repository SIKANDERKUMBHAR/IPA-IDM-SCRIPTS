#!/bin/bash

# Function to list all users in IDM using ipa command
list_all_users() {
    echo "Listing all users in IDM..."
    ipa user-find

    if [ $? -eq 0 ]; then
        echo "Listed all users in IDM successfully."
    else
        echo "Failed to list users in IDM."
        exit 1
    fi
}

# List all users in IDM
list_all_users
