# wireguard install
echo "deb http://deb.debian.org/debian/ unstable main" > /etc/apt/sources.list.d/unstable.list
printf 'Package: *\nPin: release a=unstable\nPin-Priority: 90\n' > /etc/apt/preferences.d/limit-unstable
apt update
apt install wireguard

# check if kernel module installed
lsmod | grep -i wireguard

ip link add dev wg0 type wireguard

ip address add dev wg0 192.168.2.1/24

wg set wg0 peer U2euGDZX8VXGLkijo/NBr7WEUfF3g60TtxWODHrsOGU= allowed-ips 192.168.2.2/24

ip link set up dev wg0

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
