echo "nameserver 8.8.8.8" > /etc/resolv.conf

echo 1 > /proc/sys/net/ipv4/ip_forward
ip route del default || true
ip route add default via 120.0.16.1
echo "nameserver 120.0.17.3" > /etc/resolv.conf
# Rien ne passe.
iptables -P FORWARD DROP
# Sauf les connexions deja etablies.
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
# Et les requetes sortants du reseau prive.
iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth2 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth3 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth2 -j ACCEPT
iptables -A FORWARD -i eth2 -o eth1 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth3 -j ACCEPT
iptables -A FORWARD -i eth3 -o eth1 -j ACCEPT
iptables -A FORWARD -i eth2 -o eth3 -j ACCEPT
iptables -A FORWARD -i eth3 -o eth2 -j ACCEPT
# On remplace l'adresse ip privee des machines par l'adresse publique du routeur.
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# Creation interface
ip link add dev wg0 type wireguard
ip addr add 10.0.0.1/24 dev wg0

# Configuration des cles (Utilise la cle PRIVEE de l'Entreprise)
echo "6P6uTnMtu9t4OX31C30UIx3SrKcvCAlMOs4T6tuiRlY=" > /tmp/private.key

# Configuration du pair (Le Client)
# Endpoint = IP Publique du client (120.0.16.4)
# Allowed-ips = IP Tunnel du client + LAN du client
wg set wg0 \
    listen-port 51820 \
    private-key /tmp/private.key \
    peer kJu1XZnZpE+XxOjFmF1GnctTCI9fIeBqHkGp5iAySyc= \
    endpoint 120.0.16.4:51820 \
    allowed-ips 10.0.0.2/32,192.168.30.0/24

ip link set up dev wg0
ip route add 192.168.30.0/24 dev wg0

# Autoriser le trafic DANS le tunnel
iptables -A FORWARD -i wg0 -j ACCEPT
iptables -A FORWARD -o wg0 -j ACCEPT

# Autoriser le trafic UDP chiffre a ENTRER sur l'interface publique
iptables -A INPUT -p udp --dport 51820 -j ACCEPT
/usr/sbin/dhcrelay -4 -i eth1 -i eth2 -i eth3 192.168.23.133 &

/usr/lib/frr/frrinit.sh start

# Empêcher le conteneur de s'arrêter
tail -f /dev/null
