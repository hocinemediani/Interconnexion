dhclient
ip route del default || true
ip route add default via 192.168.30.1
tail -f /dev/null
