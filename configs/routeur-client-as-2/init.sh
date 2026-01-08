echo "nameserver 8.8.8.8" > /etc/resolv.conf
apk add -U wireguard-tools dhcpcd dnsmasq
echo 1 > /proc/sys/net/ipv4/ip_forward
ip addr flush dev eth0
udhcpc -i eth0 -R
ip route del default || true
ip route add default via 120.0.16.1
echo "nameserver 127.0.0.1" > /etc/resolv.conf
# Rien ne passe.
iptables -P FORWARD DROP
# Sauf les connexions deja etablies.
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
# Et les requetes sortants du reseau prive.
iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
# On remplace l'adresse ip privee des machines par l'adresse publique du routeur.
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# Creation interface
ip link add dev wg0 type wireguard
ip addr add 10.0.0.2/24 dev wg0

# Configuration des cles (Utilise la cle PRIVEE du Client)
echo "qMd0No8eLidPf9HrvJRaUjQa9v7P5hnD1CPmzRq5VXU=" > /tmp/private.key

# Configuration du pair (L'Entreprise)
# Endpoint = IP Publique de l'entreprise (120.0.16.3)
# Allowed-ips = IP Tunnel entreprise + LAN entreprise
wg set wg0 \
    listen-port 51820 \
    private-key /tmp/private.key \
    peer Y2Vc8iIzE4gl9GotUI1hZ+r4Ip/UsbJ0cj9y+jvBOAU= \
    endpoint 120.0.16.3:51820 \
    allowed-ips 10.0.0.1/32,192.168.20.0/24

ip link set up dev wg0
ip route add 192.168.20.0/24 dev wg0

# Autoriser le trafic DANS le tunnel
iptables -A FORWARD -i wg0 -j ACCEPT
iptables -A FORWARD -o wg0 -j ACCEPT

# Autoriser le trafic UDP chiffre a ENTRER sur l'interface publique
iptables -A INPUT -p udp --dport 51820 -j ACCEPT

exec /usr/lib/frr/docker-start &
exec dnsmasq -d -q 