curl https://rclone.org/install.sh | sudo bash

rclone config

cd ~/Music/spanish

rclone ls fatboya:sound

rclone sync ~/Music/spanish fatboya: --progress

rclone about fatboya:

#
# FireHD8 books
rclone config

# Storage> drive
# client_id> (left blank for now, can make your own: https://rclone.org/drive/#making-your-own-client-id)
# client_secret> (blank too)
# scope> 1
# root_folder_id> (left blank)
# service_account_file> (left blank)
# advanced config? y/n> y
# team drive? y/n> n
# is this ok? y/n> y
# quit config> q

rclone ls FireHD8:

rclone about FireHD8:

rclone sync ~/Downloads/books FireHD8:books --progress --exclude '.git/**' --dry-run

rclone sync ~/Downloads/books FireHD8:books --progress --exclude '.git/**'
