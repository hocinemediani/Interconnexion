apk add dhcpcd
ip addr flush dev eth0
udhcpc -i eth0
ip route del default || true
ip route add default via 192.168.20.1
tail -f /dev/null