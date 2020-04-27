# install
mkdir -p /tmp/idb
cd /tmp/idb
wget --no-clobber https://dl.influxdata.com/influxdb/releases/influxdb_2.0.0-beta.9_linux_amd64.tar.gz
tar xvzf influxdb*.gz
cp influxdb*/{influx,influxd} ~/apps/local/bin/

exit 0

# repl

influxd --reporting-disabled

# configure
# visit http://localhost:9999

export INFLUX_TOKEN=xmLX1cWVnQ0UD65nN_sqvwBSRw5ZWpVgPn5tvvk0phwpxc0NXzpA40300AtOzQee74pf0Wr0w3PSQXvbPS5Omw==

telegraf --config http://whisper-quiet.local:9999/api/v2/telegrafs/059a118ac04d5000
