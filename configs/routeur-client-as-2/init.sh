echo 1 > /proc/sys/net/ipv4/ip_forward
ip route del default || true
ip route add default via 120.0.32.1
echo "nameserver 120.0.33.2" > /etc/resolv.conf
# Rien ne passe.
iptables -P FORWARD DROP
# Sauf les connexions deja etablies.
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
# Et les requetes sortants du reseau prive.
iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
# On remplace l'adresse ip privee des machines par l'adresse publique du routeur
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# Creation du tunnel avec le protocole GRE entre 2 routeur.
ip tunnel add tun0 mode gre local 120.0.32.4 remote 120.0.32.3
# Ajout d'une ip sur "l'interface" du tunnel.
ip link set tun0 up
ip addr add 10.0.0.2/30 dev tun0
ip route add 192.168.20.0/24 dev tun0
# On autorise les entrees-sorties dans le tunnel.
iptables -A FORWARD -i tun0 -j ACCEPT
iptables -A FORWARD -o tun0 -j ACCEPT
# Autoriser les paquets encapsules avec le protocole GRE a entrer.
iptables -A INPUT -p gre -j ACCEPT

exec /usr/lib/frr/docker-start