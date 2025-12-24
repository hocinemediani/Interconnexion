apk add dhcpcd
ip addr flush dev eth0
udhcpc -i eth0
tail -f /dev/null