apk add dhcpcd
ip addr flush dev eth0
udhcpc -i eth0
echo "nameserver 120.0.33.2" > /etc/resolv.conf
tail -f /dev/null