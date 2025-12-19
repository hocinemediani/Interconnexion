ip route del default || true
ip route add default via 120.0.17.1
exec named -g
