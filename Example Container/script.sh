#!/usr/bin/env bash -pl

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielBenjaminPerezMoralesDev13
# Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

apt update &>/dev/null && apt install -y expect >/dev/null 2>/dev/null

expect -c '
spawn su root
expect {
    "Password:" {
        send "abc\n"
        exp_continue
    }
    "root@" {
        send "exec bash -pl\n"
    }
    timeout {
        send_user "Timeout occurred\n"
        exit 1
    }
}
interact
'