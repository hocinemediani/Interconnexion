echo 1 > /proc/sys/net/ipv4/ip_forward
ip route del default || true
ip route add default via 120.0.32.1
iptables -P FORWARD DROP
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
exec /usr/lib/frr/docker-start