$TTL    604800
@       IN      SOA     ns.as2.com. admin.as2.com. (
                              1         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL

@       IN      NS      ns.as2.com.

@       IN      A       120.0.17.2

www     IN      A       120.0.17.2
