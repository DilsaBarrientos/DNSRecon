#!/bin/bash

echo "[+] Instalando BIND9..."
apt update
apt install -y bind9 bind9utils

# Configurar zona DNS
echo "[+] Configurando zona DNS..."

cat <<EOF >> /etc/bind/named.conf.local
zone "midominio.local" {
    type master;
    file "/etc/bind/db.midominio.local";
};
EOF

cat <<EOF > /etc/bind/db.midominio.local
$TTL    604800
@       IN      SOA     ns1.midominio.local. admin.midominio.local. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      ns1.midominio.local.
ns1     IN      A       192.168.56.20
www     IN      A       192.168.56.30
mail    IN      A       192.168.56.40
@       IN      MX 10   mail.midominio.local.
EOF

named-checkconf
named-checkzone midominio.local /etc/bind/db.midominio.local

systemctl restart bind9
echo "[+] BIND9 configurado y funcionando."
