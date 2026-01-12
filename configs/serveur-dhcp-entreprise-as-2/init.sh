#!/bin/bash

apt-get update && apt-get install -y iputils-ping iproute2

ip route del default || true
ip route add default via 192.168.23.129

exec /entrypoint.sh "$@"
