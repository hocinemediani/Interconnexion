apk add dhcpcd
ip addr flush dev eth0
MY_HOSTNAME=$(hostname)
udhcpc -i eth0 -x hostname:$MY_HOSTNAME
echo "nameserver 192.168.20.8" > /etc/resolv.conf
tail -f /dev/null