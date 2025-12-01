$TTL 86400
@       IN SOA  ns.site_serveur_public.com. admin.site_serveur_public.com. (
                1         ; Serial
                3600      ; Refresh
                1800      ; Retry
                604800    ; Expire
                86400 )   ; Negative Cache TTL

; Déclarer le serveur NS principal
@       IN NS   ns.site_serveur_public.com.

; ------------------------------
; Enregistrement du serveur DNS
; ------------------------------

ns      IN A    120.0.33.22

; ------------------------------
; Enregistrement du site web
; ------------------------------

@       IN A    120.0.33.30
www     IN A    120.0.33.30

