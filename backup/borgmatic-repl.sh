#
# borgmatic

mkdir ~/.config/borgmatic.d

ln -srf backup/borgmatic.yaml ~/.config/borgmatic.d/

validate-borgmatic-config

cat ~/.borg_pass

generate-borgmatic-config --destination ~/projects/dotfiles/borgmatic.yaml

validate-borgmatic-config --config ~/projects/dotfiles/borgmatic.yaml



borgmatic init --encryption=repokey

borg key export abergman@wg:/data/borg /tmp/borg.key

borg key export --qr-html abergman@wg:/data/borg /tmp/borg.key

cd ~
borgmatic --verbosity 1

borgmatic

borgmatic list

borgmatic info

cd /tmp/bb
borgmatic extract --archive latest


mkdir -p /tmp/bb
borgmatic mount --mount-point /tmp/bb

borgmatic umount --mount-point /tmp/bb

/bin/systemd-inhibit --who="borgmatic" --why="Prevent interrupting scheduled backup" /home/abergman/.local/bin/borgmatic --log-file-verbosity 2 --log-file=/home/abergman/log/borgmatic.log



