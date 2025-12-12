echo 1 > /proc/sys/net/ipv4/ip_forward
ip route del default || true
ip route add default via 120.0.16.1
echo "nameserver 120.0.17.3" > /etc/resolv.conf
exec /usr/lib/frr/docker-start
