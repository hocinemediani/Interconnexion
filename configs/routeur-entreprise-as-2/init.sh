echo 1 > /proc/sys/net/ipv4/ip_forward
ip route del default || true
ip route add default via 120.0.32.1
# Rien ne passe.
iptables -P FORWARD DROP
# Sauf les connexions deja etablies.
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
# Et les requetes sortants du reseau prive.
iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
# On remplace l'adresse ip privee des machines par l'adresse publique du routeur
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
exec /usr/lib/frr/docker-start