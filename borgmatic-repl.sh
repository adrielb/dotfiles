#
# borg
b=/tmp/bb

mkdir -p /tmp/bb

cd /tmp/bb

borg init --encryption=none /tmp/bb

borg create /tmp/bb::Mon ~/projects/wiki

borg create --stats /tmp/bb::Tues ~/projects/wiki

borg list $b

borg list $b::Mon

e=/tmp/extracted
mkdir -p $e
cd $e

borg extract $b::Mon

export BORG_PASSCOMMAND="cat /home/abergman/.borg_pass"
borg list abergman@wg:/data/borg

borg create --debug --show-rc abergman@wg:/data/borg::g9x-1 projects/wiki

#
# borgmatic

mkdir ~/.config/borgmatic.d

ln -sr borgmatic.yaml ~/.config/borgmatic.d/

cat ~/.borg_pass

generate-borgmatic-config --destination ~/projects/dotfiles/borgmatic.yaml

validate-borgmatic-config --config ~/projects/dotfiles/borgmatic.yaml

validate-borgmatic-config


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

#
# systemd timer

wget https://projects.torsion.org/witten/borgmatic/raw/branch/master/sample/systemd/borgmatic.service

systemctl list-timers --no-pager --all

# mkdir -p ~/.config/systemd/user
# ln -sr borgmatic.timer ~/.config/systemd/user
# ln -sr borgmatic.service ~/.config/systemd/user

# systemctl --user enable /home/abergman/projects/dotfiles/borgmatic.service

systemctl --user enable `pwd`/borgmatic.service
systemctl --user enable `pwd`/borgmatic.timer

systemctl --user daemon-reload

systemd-analyze verify ~/.config/systemd/user/borgmatic.service

systemd-analyze verify ~/.config/systemd/user/borgmatic.timer

systemctl --user daemon-reload
systemctl --user start borgmatic.service

systemctl --user start borgmatic.timer

systemctl --user status borgmatic

systemctl --user status

systemctl --user list-timers

systemctl --user list-unit-files

journalctl --user

journalctl --user --unit borgmatic.service -q

journalctl --user --unit borgmatic.timer -q

journalctl --user --unit borgmatic

journalctl --user-unit borgmatic

man systemd.time

man systemd.exec

systemctl --user stop borgmatic.timer

systemctl --user disable borgmatic.service
