FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    frr \
    isc-dhcp-relay \
    iptables \
    iproute2 \
    iputils-ping \
    tcpdump \
    && rm -rf /var/lib/apt/lists/*

# On prépare les dossiers FRR
RUN chown -R frr:frr /etc/frr
