apk add dhcpcd
ip addr flush dev eth0
udhcpc -i eth0
# Installation de l'outil de test VoIP (pjsua)
# Pour avoir un téléphone en ligne de commande
apk update
apk add pjsip-tools
tail -f /dev/null