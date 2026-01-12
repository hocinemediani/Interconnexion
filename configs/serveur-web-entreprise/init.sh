ip route del default || true
ip route add default via 192.168.23.129
exec nginx -g 'daemon off;'
