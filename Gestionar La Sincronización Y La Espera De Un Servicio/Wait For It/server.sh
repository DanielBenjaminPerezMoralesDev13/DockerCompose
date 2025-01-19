#!/usr/bin/env bash -lp

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielBenjaminPerezMoralesDev13
# Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

apt update &>/dev/null && apt install -y python3 >/dev/null 2>/dev/null;

cat << EOF
[x] Instalando Paquetes Necesarios ...

Espere un momento
EOF

clear;

host=0.0.0.0;
port=8080;
directory=./;

python3 -m http.server --cgi --bind $host --directory $directory $port &>/dev/null &

if [ $(echo $?) -eq 0 ]; then
    cat << EOF
[*] Server HTTP Python3.11 iniciado correctamente
[*] Host: $host
[*] Puerto: $port
[*] Directorio servido: $directory
EOF
else
    cat << EOF
[x] Error al iniciar el servidor HTTP
EOF
exit 1;
fi

/bin/bash -lp;