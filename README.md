# IPA IDM Scripts
                     





This repository contains various scripts for managing users and groups in an Identity Management (IDM) system using IPA commands. Below is a brief description of each script and its purpose.

## Scripts

### 1. add-users-in-idm.sh
This script is used to add multiple users to the IDM system. It takes a list of users and their details, and adds each user to the IDM.

### 2. add_user_to_group.sh
This script adds a specified user to an existing user group in the IDM system.

### 3. add_user_to_idm_and_group.sh
This script adds a user to the IDM system and then adds the same user to a specified user group.

### 4. add_user_to_idm.sh
This script adds a single user to the IDM system. It requires the user login, first name, last name, and a new password as arguments.

### 5. create_group_in_idm.sh
This script creates a new user group in the IDM system. It takes the group name as an argument.

### 6. delete-user-from-idm.sh
This script deletes a specified user from the IDM system. It takes the user login as an argument.

### 7. disable_user_in_idm.sh
This script disables a specified user in the IDM system. It takes the user login as an argument.

### 8. get_idm_user_details.sh
This script retrieves and displays the details of a specified user from the IDM system. It takes the user login as an argument.

### 9. ipa_scripts.zip
This file contains all the scripts in this repository, packaged together for easy download and distribution.

### 10. list_all_users.sh
This script lists all users currently in the IDM system.

### 11. remove_user_from_group.sh
This script removes a specified user from a specified user group in the IDM system.

## Usage

To use these scripts, you need to have the necessary permissions to run IPA commands and manage users and groups in the IDM system. 

### Example: Adding a User to IDM and a Group

```bash
./add_user_to_idm_and_group.sh <user_login> <first_name> <last_name> <new_password> <user_group>
