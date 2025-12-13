apk add dhcpcd
ip addr flush dev eth0
udhcpc -i eth0
echo "nameserver 192.168.20.4" > /etc/resolv.conf
tail -f /dev/null