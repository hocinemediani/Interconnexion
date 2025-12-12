echo 1 > /proc/sys/net/ipv4/ip_forward
ip route del default || true
ip route add 120.0.17.0/28 via 120.0.16.2
echo "nameserver 120.0.17.3" > /etc/resolv.conf
# il manquera les routes vers les as
exec /usr/lib/frr/docker-start
