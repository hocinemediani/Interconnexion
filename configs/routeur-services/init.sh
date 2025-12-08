echo 1 > /proc/sys/net/ipv4/ip_forward
ip route del default || true
ip route add default via 120.0.32.1
iptables -P FORWARD DROP
iptables -A FORWARD -d 120.0.33.2 -p udp --dport 53 -j ACCEPT
iptables -A FORWARD -d 120.0.33.2 -p tcp --dport 53 -j ACCEPT
iptables -A FORWARD -d 120.0.33.2 -p icmp -j ACCEPT
iptables -A FORWARD -d 120.0.33.2 -p icmp -j ACCEPT
iptables -A FORWARD -d 120.0.33.3 -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -d 120.0.33.3 -p icmp -j ACCEPT
iptables -A FORWARD -s 120.0.32.3 -d 120.0.33.4 -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -s 120.0.32.3 -d 120.0.33.4 -p icmp -j ACCEPT # icmp pour tester le ping
iptables -A FORWARD -s 120.0.32.6 -d 120.0.33.4 -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -s 120.0.32.6 -d 120.0.33.4 -p icmp -j ACCEPT # icmp pour tester le ping
# Il faudra rajouter le smtp, on ne sait pas sur quel port le mettre
exec /usr/lib/frr/docker-start