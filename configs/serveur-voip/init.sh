apt-get update
apt-get install -y iproute2 isc-dhcp-client
ip addr flush dev eth0
dhclient eth0
asterisk -f

