#!/bin/bash
echo "[+] Installing dnsrecon and dependencies..."
apt update
apt install -y dnsrecon python3-pip git docker.io
systemctl start docker
systemctl enable docker
echo "[+] dnsrecon y docker instalados correctamente."
