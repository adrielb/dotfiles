

sudo apt-get install -y apt-transport-https
sudo apt-get install -y software-properties-common wget
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -

sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"

sudo apt-get update
sudo apt-get install grafana


# To start the service and verify that the service has started:
sudo systemctl daemon-reload
sudo systemctl start grafana-server
sudo systemctl status grafana-server

# Configure the Grafana server to start at boot:
sudo systemctl enable grafana-server.service
