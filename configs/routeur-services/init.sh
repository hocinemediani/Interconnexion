echo 1 > /proc/sys/net/ipv4/ip_forward
ip route del default || true
ip route add default via 120.0.16.1
# Politique par defaut, rien ne passe.
iptables -P FORWARD DROP
# Autoriser les reponses des services sur des connexions deja etablies.
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
# Communication DNS.
iptables -A FORWARD -d 120.0.17.3 -p udp --dport 53 -j ACCEPT
iptables -A FORWARD -d 120.0.17.3 -p tcp --dport 53 -j ACCEPT
# Ping DNS, WEB Public, WEB Prive.
iptables -A FORWARD -d 120.0.17.2 -p icmp -j ACCEPT
iptables -A FORWARD -d 120.0.17.3 -p icmp -j ACCEPT
# Requetes HTTP WEB Public.
iptables -A FORWARD -d 120.0.17.2 -p tcp --dport 80 -j ACCEPT
# Il faudra rajouter le smtp, on ne sait pas sur quel port le mettre.
exec /usr/lib/frr/docker-start
