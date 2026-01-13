echo 1 > /proc/sys/net/ipv4/ip_forward
ip route del default || true
echo "nameserver 120.0.17.3" > /etc/resolv.conf
# il manquera les routes vers les as
chown -R frr:frr /etc/frr && chmod -R 640 /etc/frr/*.conf && chmod 640 /etc/frr/daemons && exec /usr/lib/frr/docker-start
