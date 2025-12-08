echo 1 > /proc/sys/net/ipv4/ip_forward
ip route del default || true
ip route add 120.0.33.0/28 via 120.0.32.2
# il manquera les routes vers les as
exec /usr/lib/frr/docker-start