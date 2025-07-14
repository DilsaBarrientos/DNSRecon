Guía del Laboratorio: DNSRecon con Vagrant y Docker
1. Estructura del laboratorio descomprimido:
- Vagrantfile
- kali/setup.sh
- bind9/setup.sh
2. Lanzar las máquinas virtuales:
$ cd dnsrecon-lab
$ vagrant up
3. Verificar el estado de las VMs:
$ vagrant status
4. Conectarse a la máquina Kali (atacante):
$ vagrant ssh kali
5. Desde Kali, probar resolución DNS:
$ dig @192.168.56.20 www.midominio.local
6. Ataques con dnsrecon:
- Recolectar registros estándar:
$ dnsrecon -d midominio.local -t std -n 192.168.56.20
- Probar transferencia de zona (AXFR):
$ dnsrecon -d midominio.local -t axfr -n 192.168.56.20
7. (Opcional) Lanzar un servidor víctima desde Kali usando Docker:$ sudo docker run -d --name victim-web --restart always -p 80:80 --network host httpd
8. Archivos importantes:
- Vagrantfile: define las 2 VMs (Kali y Ubuntu DNS)
- kali/setup.sh: instala dnsrecon y docker en Kali
- bind9/setup.sh: instala y configura BIND9 con zona 'midominio.local'
9. Apagar las VMs cuando termines:
$ vagrant halt
10. Eliminar completamente las VMs (opcional):
$ vagrant destroy -f
