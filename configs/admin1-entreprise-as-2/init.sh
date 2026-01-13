echo "nameserver 8.8.8.8" > /etc/resolv.conf
# Installation de l'outil de test VoIP (pjsua)
# Pour avoir un téléphone en ligne de commande
apk update && apk add pjsua
apk add dhcpcd
ip addr flush dev eth0
udhcpc -i eth0

echo "nameserver 192.168.20.4" > /etc/resolv.conf

tail -f /dev/null