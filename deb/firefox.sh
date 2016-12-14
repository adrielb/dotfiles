# https://mozilla.debian.net/

# /etc/apt/sources.list
deb http://mozilla.debian.net/ jessie-backports firefox-release

apt-get update
apt-get install -t jessie-backports firefox
