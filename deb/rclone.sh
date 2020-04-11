curl https://rclone.org/install.sh | sudo bash

rclone config

cd ~/Music/spanish

rclone ls fatboya:sound

rclone sync ~/Music/spanish fatboya: --progress

rclone about fatboya:
