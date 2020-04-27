mkdir -p /tmp/telegraph
cd $_
wget https://dl.influxdata.com/telegraf/releases/telegraf_1.14.1-1_amd64.deb
echo "031852db4093fcc97c40cfea1fb0e8ee2d90c2ae2eee82dc397f8dd7a1eafafa  telegraf_1.14.1-1_amd64.deb" | sha256sum --check
su -c 'dpkg -i telegraf_1.14.1-1_amd64.deb'
systemctl start telegraf

exit 0

telegraf -config telegraf.conf -test
