dhclient
ip route del default || true
ip route add default via 192.168.20.1
tail -f /dev/null
