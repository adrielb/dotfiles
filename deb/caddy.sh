#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

# https://github.com/caddyserver/caddy/releases

VERSION=2.3.0

mkdir /tmp/caddy
cd /tmp/caddy

wget --no-clobber "https://github.com/caddyserver/caddy/releases/download/v$VERSION/caddy_${VERSION}_linux_amd64.tar.gz"

tar zxvf caddy*.tar.gz
cp caddy ~/apps/local/bin/

caddy version

exit 0


apt-get install libnss3-tools


# REPL

caddy environ

#######################################################################
#                      user service didn't work                       #
#######################################################################


sudo getcap /home/abergman/apps/local/bin/caddy

sudo setcap cap_net_bind_service=+ep /home/abergman/apps/local/bin/caddy

systemctl --user enable /home/abergman/projects/dotfiles/services/caddy.service
systemctl --user daemon-reload
systemd-analyze --user verify caddy.service
systemctl --user status caddy
systemctl --user start caddy
journalctl --user --follow --unit caddy
systemctl --user stop caddy
systemctl --user disable caddy


#######################################################################
#                           global service                            #
#######################################################################

# https://github.com/caddyserver/dist/tree/master/init
sudo groupadd --system caddy

sudo useradd --system \
    --gid caddy \
    --create-home \
    --home-dir /var/lib/caddy \
    --shell /usr/sbin/nologin \
    --comment "Caddy web server" \
    caddy


cd ~/projects/dotfiles/services

wget https://raw.githubusercontent.com/caddyserver/dist/master/init/caddy-api.service

wget https://raw.githubusercontent.com/caddyserver/dist/master/init/caddy.service

sudo cp caddy-api.service /etc/systemd/system/

sudo cp caddy.service /etc/systemd/system/

# version 232
systemctl --version

sudo systemctl enable caddy-api.service
sudo systemctl disable caddy-api.service

sudo systemctl enable caddy.service
sudo systemctl disable caddy.service

sudo systemctl daemon-reload



sudo journalctl --follow --unit caddy
systemd-analyze verify caddy.service
systemctl status caddy
sudo systemctl start caddy
sudo systemctl stop caddy


sudo date
sudo cp caddy.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl stop caddy
sudo systemctl start caddy

sudo -g caddy -u caddy caddy run --config /var/lib/caddy/Caddyfile
sudo  -u caddy caddy run --config /var/lib/caddy/Caddyfile

cp /var/lib/caddy/.local/share/caddy/pki/authorities/local/root.crt /usr/local/share/ca-certificates/
update-ca-certificates

################################################################################

curl http://localhost:2019

curl http://localhost:2019/config

curl https://localhost:2016

caddy reverse-proxy --to 127.0.0.1:1313

curl localhost:2019/load \
  -X POST \
  -H "Content-Type: text/caddyfile" \
  --data-binary @Caddyfile

