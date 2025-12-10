$TTL    3H
@       IN      SOA     ns.as2.com. admin.as2.com. (
                              2         ; Serial
                             3H         ; Refresh
                             15         ; Retry
                             1w         ; Expire
                             3h )       ; Negative Cache TTL

@       IN      NS      ns.as2.com.

; Serveur DNS
ns      IN      A       120.0.33.2

; Web public
www     IN      A       120.0.33.3

; Web entreprise prive
intranet IN     A       120.0.33.4

; SMTP
mailServer    IN      A       120.0.33.5