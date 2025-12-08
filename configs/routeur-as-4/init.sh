echo 1 > /proc/sys/net/ipv4/ip_forward
ip route del default || true
ip route add default via 120.0.32.1
exec /usr/lib/frr/docker-start
