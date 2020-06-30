

# Boot start up
# To make Cockpit available by default after system boot the cockpit.socket needs to be enabled:
sudo systemctl enable cockpit.socket

# port conflicts with Prometheus, change to :9080
