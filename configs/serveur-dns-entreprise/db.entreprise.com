$TTL    3H
@       IN      SOA     ns.entreprise.com. admin.entreprise.com. (
                              2         ; Serial
                             3H         ; Refresh
                             15         ; Retry
                             1w         ; Expire
                             3h )       ; Negative Cache TTL

@       IN      NS      ns.entreprise.com.

; Serveur DNS
ns      IN      A       192.168.20.4
