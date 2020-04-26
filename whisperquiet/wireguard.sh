# wireguard install
echo "deb http://deb.debian.org/debian/ unstable main" > /etc/apt/sources.list.d/unstable.list
printf 'Package: *\nPin: release a=unstable\nPin-Priority: 90\n' > /etc/apt/preferences.d/limit-unstable
apt update
apt install wireguard

# check if kernel module installed
lsmod | grep -i wireguard

ip link

ip link add dev wg0 type wireguard

ip address add dev wg0 192.168.2.1/24

cd /etc/wireguard

wg genkey | tee wg-server-private.key |  wg pubkey > wg-server-public.key
wg genkey | tee wg-laptop-private.key |  wg pubkey > wg-laptop-public.key
wg genkey | tee wg-mobile-private.key |  wg pubkey > wg-mobile-public.key

wg set wg0 private-key wg-server-private.key
wg set wg0 peer $(cat wg-laptop-public.key) allowed-ips 192.168.2.2/32
wg set wg0 peer $(cat wg-mobile-public.key) allowed-ips 192.168.2.3/32
wg showconf wg0 > /etc/wireguard/wg0.conf

[Interface]
Address = 192.168.2.1/24
PostUp   = iptables -A FORWARD -i %i -j ACCEPT; iptables -t nat -A POSTROUTING -o enp1s0f0 -j MASQUERADE
PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -t nat -D POSTROUTING -o enp1s0f0 -j MASQUERADE

wg-quick up wg0

qrencode -t ansiutf8 < mobile.conf

ip link set up dev wg0

# 
systemctl enable wg-quick@wg0.service 
systemctl daemon-reload
systemctl start wg-quick@wg0
# reboot and check
systemctl status wg-quick@wg0

# to remove
systemctl stop wg-quick@wg0
systemctl disable wg-quick@wg0.service
rm -i /etc/systemd/system/wg-quick@wg0*
systemctl daemon-reload
systemctl reset-failed

# pihole reconfigure
pihole -r
# Do you want to use your current network settings as a static address?
#  <NO>
# Enter your desired IPv4 address   (wireguard ip)
#  192.168.2.1/24
# Enter your desired IPv4 default gateway  (router)
#  10.0.0.1

# router
host pagead2.googlesyndication.com 10.0.0.1

# pihole
host pagead2.googlesyndication.com 192.168.2.1

#
#
#
wg setconf wg0 /etc/wireguard/wg0.conf

wg show

wg showconf wg0

wg

umask 077

wg genkey > privatekey

wg pubkey < privatekey > publickey

wg genkey | tee privatekey | wg pubkey > publickey

wg set wg0 private-key ./privatekey

wg set wg0 listen-port 51820

wg-quick up wg0

wg-quick down wg0

ip addr show wg0

wg-quick save wg0

cd /etc/wireguard

cat /etc/wireguard/wg0.conf

ip addr flush dev wg0

nvim /etc/sysctl.conf
# uncomment:
net.ipv4.ip_forward = 1

enp1s0f0

wg set wg0 PostUp iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o enp1s0f0 -j MASQUERADE; ip6tables -A FORWARD -i wg0 -j ACCEPT; ip6tables -t nat -A POSTROUTING -o enp1s0f0 -j MASQUERADE

PostDown = iptables -D FORWARD -i wg0 -j ACCEPT; iptables -t nat -D POSTROUTING -o enp1s0f0 -j MASQUERADE; ip6tables -D FORWARD -i wg0 -j ACCEPT; ip6tables -t nat -D POSTROUTING -o enp1s0f0 -j MASQUERADE
SaveConfig = true

PostUp     iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o enp1s0f0 -j MASQUERADE; ip6tables -A FORWARD -i wg0 -j ACCEPT; ip6tables -t nat -A POSTROUTING -o enp1s0f0 -j MASQUERADE
