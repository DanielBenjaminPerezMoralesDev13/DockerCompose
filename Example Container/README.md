<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# **Container**

- *[Setting Password Of The New User In Non Interactive Way In Shell Script On Ubuntu](https://stackoverflow.com/questions/65226720/setting-password-of-the-new-user-in-non-interactive-way-in-shell-script-on-ubunt "https://stackoverflow.com/questions/65226720/setting-password-of-the-new-user-in-non-interactive-way-in-shell-script-on-ubunt")*
- *[How to su non-interactively?](https://serverfault.com/questions/894440/how-to-su-non-interactively "https://serverfault.com/questions/894440/how-to-su-non-interactively")*
- *[Linux Expect](https://phoenixnap.com/kb/linux-expect "https://phoenixnap.com/kb/linux-expect")*

```bash
docker container run --help

Usage:  docker container run [OPTIONS] IMAGE [COMMAND] [ARG...]

Create and run a new container from an image

Aliases:
  docker container run, docker run

Options:
      --add-host list                    Add a custom host-to-IP mapping (host:ip)
      --annotation map                   Add an annotation to the container (passed through to the OCI runtime)
                                         (default map[])
  -a, --attach list                      Attach to STDIN, STDOUT or STDERR
      --blkio-weight uint16              Block IO (relative weight), between 10 and 1000, or 0 to disable (default 0)
      --blkio-weight-device list         Block IO weight (relative device weight) (default [])
      --cap-add list                     Add Linux capabilities
      --cap-drop list                    Drop Linux capabilities
      --cgroup-parent string             Optional parent cgroup for the container
      --cgroupns string                  Cgroup namespace to use (host|private)
                                         'host':    Run the container in the Docker host's cgroup namespace
                                         'private': Run the container in its own private cgroup namespace
                                         '':        Use the cgroup namespace as configured by the
                                                    default-cgroupns-mode option on the daemon (default)
      --cidfile string                   Write the container ID to the file
      --cpu-period int                   Limit CPU CFS (Completely Fair Scheduler) period
      --cpu-quota int                    Limit CPU CFS (Completely Fair Scheduler) quota
      --cpu-rt-period int                Limit CPU real-time period in microseconds
      --cpu-rt-runtime int               Limit CPU real-time runtime in microseconds
  -c, --cpu-shares int                   CPU shares (relative weight)
      --cpus decimal                     Number of CPUs
      --cpuset-cpus string               CPUs in which to allow execution (0-3, 0,1)
      --cpuset-mems string               MEMs in which to allow execution (0-3, 0,1)
  -d, --detach                           Run container in background and print container ID
      --detach-keys string               Override the key sequence for detaching a container
      --device list                      Add a host device to the container
      --device-cgroup-rule list          Add a rule to the cgroup allowed devices list
      --device-read-bps list             Limit read rate (bytes per second) from a device (default [])
      --device-read-iops list            Limit read rate (IO per second) from a device (default [])
      --device-write-bps list            Limit write rate (bytes per second) to a device (default [])
      --device-write-iops list           Limit write rate (IO per second) to a device (default [])
      --disable-content-trust            Skip image verification (default true)
      --dns list                         Set custom DNS servers
      --dns-option list                  Set DNS options
      --dns-search list                  Set custom DNS search domains
      --domainname string                Container NIS domain name
      --entrypoint string                Overwrite the default ENTRYPOINT of the image
  -e, --env list                         Set environment variables
      --env-file list                    Read in a file of environment variables
      --expose list                      Expose a port or a range of ports
      --gpus gpu-request                 GPU devices to add to the container ('all' to pass all GPUs)
      --group-add list                   Add additional groups to join
      --health-cmd string                Command to run to check health
      --health-interval duration         Time between running the check (ms|s|m|h) (default 0s)
      --health-retries int               Consecutive failures needed to report unhealthy
      --health-start-interval duration   Time between running the check during the start period (ms|s|m|h) (default 0s)
      --health-start-period duration     Start period for the container to initialize before starting
                                         health-retries countdown (ms|s|m|h) (default 0s)
      --health-timeout duration          Maximum time to allow one check to run (ms|s|m|h) (default 0s)
      --help                             Print usage
  -h, --hostname string                  Container host name
      --init                             Run an init inside the container that forwards signals and reaps processes
  -i, --interactive                      Keep STDIN open even if not attached
      --ip string                        IPv4 address (e.g., 172.30.100.104)
      --ip6 string                       IPv6 address (e.g., 2001:db8::33)
      --ipc string                       IPC mode to use
      --isolation string                 Container isolation technology
      --kernel-memory bytes              Kernel memory limit
  -l, --label list                       Set meta data on a container
      --label-file list                  Read in a line delimited file of labels
      --link list                        Add link to another container
      --link-local-ip list               Container IPv4/IPv6 link-local addresses
      --log-driver string                Logging driver for the container
      --log-opt list                     Log driver options
      --mac-address string               Container MAC address (e.g., 92:d0:c6:0a:29:33)
  -m, --memory bytes                     Memory limit
      --memory-reservation bytes         Memory soft limit
      --memory-swap bytes                Swap limit equal to memory plus swap: '-1' to enable unlimited swap
      --memory-swappiness int            Tune container memory swappiness (0 to 100) (default -1)
      --mount mount                      Attach a filesystem mount to the container
      --name string                      Assign a name to the container
      --network network                  Connect a container to a network
      --network-alias list               Add network-scoped alias for the container
      --no-healthcheck                   Disable any container-specified HEALTHCHECK
      --oom-kill-disable                 Disable OOM Killer
      --oom-score-adj int                Tune host's OOM preferences (-1000 to 1000)
      --pid string                       PID namespace to use
      --pids-limit int                   Tune container pids limit (set -1 for unlimited)
      --platform string                  Set platform if server is multi-platform capable
      --privileged                       Give extended privileges to this container
  -p, --publish list                     Publish a container's port(s) to the host
  -P, --publish-all                      Publish all exposed ports to random ports
      --pull string                      Pull image before running ("always", "missing", "never") (default "missing")
  -q, --quiet                            Suppress the pull output
      --read-only                        Mount the container's root filesystem as read only
      --restart string                   Restart policy to apply when a container exits (default "no")
      --rm                               Automatically remove the container and its associated anonymous volumes
                                         when it exits
      --runtime string                   Runtime to use for this container
      --security-opt list                Security Options
      --shm-size bytes                   Size of /dev/shm
      --sig-proxy                        Proxy received signals to the process (default true)
      --stop-signal string               Signal to stop the container
      --stop-timeout int                 Timeout (in seconds) to stop a container
      --storage-opt list                 Storage driver options for the container
      --sysctl map                       Sysctl options (default map[])
      --tmpfs list                       Mount a tmpfs directory
  -t, --tty                              Allocate a pseudo-TTY
      --ulimit ulimit                    Ulimit options (default [])
  -u, --user string                      Username or UID (format: <name|uid>[:<group|gid>])
      --userns string                    User namespace to use
      --uts string                       UTS namespace to use
  -v, --volume list                      Bind mount a volume
      --volume-driver string             Optional volume driver for the container
      --volumes-from list                Mount volumes from the specified container(s)
  -w, --workdir string                   Working directory inside the container
```

## **Creación y uso de volúmenes con diferentes permisos**

**En Docker, se pueden configurar permisos de lectura y escritura para volúmenes al montarlos en contenedores. Aquí se muestran ejemplos de cómo crear y usar volúmenes con acceso **lectura-escritura** (predeterminado), **solo lectura**, y **solo escritura**. Se demostrará el uso tanto de `--volume` como de `--mount`.**

---

### **Preparativos: Crear el volumen**

**Primero, creamos un volumen llamado `my-volume`:**

```bash
docker volume create my-volume
```

---

### **Volumen de Lectura-Escritura (Predeterminado)**

#### **Con `--volume`**

**Ejecuta un contenedor con el volumen montado con permisos predeterminados (lectura y escritura):**

```bash
docker run -itu root:root -w /App --volume my-volume:/App --name rw-container ubuntu:latest
```

**Dentro del contenedor, crea un fichero para probar los permisos:**

```bash
echo "Este es un fichero de prueba" > /App/test.txt
```

```bash
cat /App/test.txt
```

```bash
Este es un fichero de prueba
```

#### **Con `--mount`**

**Usa `--mount` para montar el volumen con permisos de lectura y escritura:**

```bash
docker run -itu root:root -w /App --mount type=volume,source=my-volume,target=/App --name rw-mount-container ubuntu:latest
```

**Prueba creando y leyendo ficheros:**

```bash
echo "Fichero creado con --mount" > /App/mount-test.txt
```

```bash
cat /App/mount-test.txt
```

```bash
Fichero creado con --mount
```

---

### **Volumen de Solo Lectura**

*Para configurar el volumen como solo lectura, agrega `:ro` al final de la definición:*

```bash
docker run -itu root:root -w /App --volume my-volume:/App:ro --name ro-container ubuntu:latest
```

**Prueba escribiendo en el volumen (esto debe fallar):**

```bash
echo "Prueba de escritura fallida" > /App/no-write.txt
```

**Error esperado:**

```bash
bash: /App/no-write.txt: Read-only file system
```

- *Con `--mount`, usa la opción `readonly=true` para configurar el volumen como solo lectura:*

```bash
docker run -itu root:root -w /App --mount type=volume,source=my-volume,target=/App,readonly=true --name ro-mount-container ubuntu:latest
```

**Intentar escribir en el volumen producirá el mismo error de solo lectura.**

```bash
echo "Prueba de escritura fallida" > /App/no-write.txt
```

**Error esperado:**

```bash
bash: /App/no-write.txt: Read-only file system
```

---

### **Volumen de Solo Escritura (Simulado)**

*Docker no admite volúmenes con permisos "solo escritura" de manera nativa, pero podemos simular este comportamiento mediante permisos del sistema operativo dentro del contenedor.*

> [!WARNING]
> **Al ser root dentro del contenedor, puedes ignorar ciertos permisos del sistema de ficheros,**

**Montamos el volumen y cambiamos los permisos del sistema operativo dentro del contenedor:**

```bash
docker run -itu 0:0 -w /App --volume my-volume:/App --entrypoint "/bin/bash" --name wo-container ubuntu:latest -lpc "echo 'root:abc' | chpasswd && echo 'ubuntu:123' | chpasswd && chmod 222 /App && su ubuntu && exec bash -lp"
```

```bash
ls /App
```

```bash
ubuntu@086856fb0772:/App$ ls /App
ls: cannot open directory '/App': Permission denied
```

```bash
ls -ld /App
```

```bash
ubuntu@086856fb0772:/App$ ls -ld /App
d-w--w--w- 2 root root 4096 Jan 15 17:31 /App
```

```bash
cat /App/test.txt
```

```bash
cat: /App/test.txt: Permission denied
```

**Prueba leyendo (esto debe fallar):**

```bash
cat /App/test.txt
```

**Error esperado:**

```bash
bash: /App/test.txt: Permission denied
```

**Prueba escribiendo (esto debe funcionar):**

```bash
apt update &>/dev/null && apt install -y expect >/dev/null 2>/dev/null
```

```bash
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
```

```bash
echo "Fichero solo escritura" > /App/write-only.txt
```

**Usa el mismo enfoque con `--mount`:**

```bash
docker run -itu 0:0 -w /App --mount type=volume,source=my-volume,target=/App --entrypoint "/bin/bash" --name wo-container ubuntu:latest -lpc "echo 'root:abc' | chpasswd && echo 'ubuntu:123' | chpasswd && chmod 222 /App && su ubuntu && exec bash -lp"
```

```bash
ls /App
```

```bash
ubuntu@086856fb0772:/App$ ls /App
ls: cannot open directory '/App': Permission denied
```

```bash
ls -ld /App
```

```bash
ubuntu@086856fb0772:/App$ ls -ld /App
d-w--w--w- 2 root root 4096 Jan 15 17:31 /App
```

```bash
cat /App/test.txt
```

```bash
cat: /App/test.txt: Permission denied
```

**Prueba leyendo (esto debe fallar):**

```bash
cat /App/test.txt
```

**Error esperado:**

```bash
bash: /App/test.txt: Permission denied
```

**Prueba escribiendo (esto debe funcionar):**

```bash
apt update &>/dev/null && apt install -y expect >/dev/null 2>/dev/null
```

```bash
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
```

```bash
echo "Fichero solo escritura" > /App/write-only.txt
```

---

### **Verificación de cambios en el host**

**Puedes verificar los datos del volumen en el host:**

```bash
sudo lsd -lA --tree /var/lib/docker/volumes/my-volume/_data
```

*Deberías ver los ficheros creados desde los diferentes contenedores, excepto en los casos donde el acceso estaba restringido.*

---

### **Conclusión**

- **`--volume`** *es más simple y se utiliza comúnmente para configuraciones básicas.*
- **`--mount`** *proporciona mayor flexibilidad y es más explícito para configuraciones avanzadas.*
- *Los permisos pueden controlarse directamente desde Docker (`readonly`) o combinando con herramientas del sistema operativo (simulación de solo escritura).*

---

## **`apt update &>/dev/null && apt install -y expect >/dev/null 2>/dev/null`**

**Este comando realiza las siguientes acciones:**

1. **`apt update &>/dev/null`:**
   - *`apt update`:** *Este comando se usa para actualizar la lista de paquetes en el sistema desde los repositorios configurados. Es esencial antes de instalar nuevos paquetes, ya que asegura que el sistema tiene la información más actual sobre qué paquetes están disponibles y sus versiones.*
   - **`&>/dev/null`:** *Redirige tanto la salida estándar (`stdout`) como la salida de error estándar (`stderr`) a `/dev/null`, que es un "agujero negro" donde se descarta cualquier salida. En otras palabras, esto suprime cualquier mensaje de salida o error generado por el comando `apt update`. Si el comando `apt update` tiene algún error o mensaje informativo, no aparecerá en la terminal.*

2. **`&&`:**
   - *Este operador lógico ejecuta el siguiente comando solo si el anterior se ejecutó correctamente (es decir, si el comando `apt update` no falló). Si el comando anterior fallara (por ejemplo, si no se pudo actualizar la lista de paquetes), el siguiente comando no se ejecutaría.*

3. **`apt install -y expect >/dev/null 2>/dev/null`:**
   - **`apt install -y expect`:** *Este comando instala el paquete `expect` en el sistema. El flag `-y` significa que se acepta automáticamente la instalación de los paquetes y las dependencias necesarias sin pedir confirmación al usuario.*
   - **`>/dev/null`:** *Redirige la salida estándar (`stdout`) a `/dev/null`, lo que significa que cualquier mensaje de salida normal de `apt install` no se mostrará.*
   - **`2>/dev/null`:** *Redirige la salida de error estándar (`stderr`) a `/dev/null`, lo que significa que los mensajes de error de `apt install` también se suprimen. Es útil si quieres instalar algo y no deseas ver ningún mensaje de error o salida durante la instalación.*

   - **Este comando instalará `expect` sin mostrar ningún mensaje de salida ni de error.**

**Resumen:** *El comando `apt update &>/dev/null && apt install -y expect >/dev/null 2>/dev/null` actualiza los repositorios y luego instala `expect` sin mostrar ninguna salida ni error en la terminal.*

---

### **`expect -c 'spawn su root ...'`**

- **Este es un script que usa `expect` para automatizar la interacción con el comando `su` y gestionar la autenticación como el usuario `root`. Vamos a desglosarlo paso a paso:**

**`expect -c '...'`:**

- *La opción `-c` permite ejecutar un comando `expect` desde la línea de comandos en lugar de escribirlo en un fichero. Dentro de las comillas, se define todo el script `expect`.*

**`spawn su root`:**

- *`spawn` inicia un nuevo proceso en `expect`. En este caso, está ejecutando el comando `su root`, que cambia al usuario `root`.*
- *Esto te pide la contraseña de `root`, lo cual es lo que intentamos automatizar con `expect`.*

**`expect { ... }`:**

- *Aquí se define una serie de patrones que `expect` buscará en la salida del proceso que ha comenzado. Dependiendo de lo que se encuentre, `expect` ejecutará ciertas acciones.*

**`"Password:" { send "abc\n"; exp_continue }`:**

- *Esta parte está esperando el prompt `"Password:"`, que es lo que muestra el comando `su` al pedir la contraseña.*
- *Cuando se encuentra este texto, se envía `"abc\n"` (la contraseña que estamos usando en este ejemplo) para completar la autenticación.*
- **`exp_continue`:** *Esto hace que `expect` siga buscando más patrones en la salida después de haber enviado la contraseña.*

**`"root@" { send "exec bash -pl\n" }`:**

- *Aquí `expect` está esperando que el prompt cambie a algo como `root@`, lo que indica que la autenticación fue exitosa y que ya estamos como `root`.*
- *En este caso, se ejecuta el comando `exec bash -pl`, que ejecuta un nuevo shell de login interactivo como `root`.*

**`timeout { send_user "Timeout occurred\n"; exit 1 }`:**

- *Si `expect` no encuentra los patrones esperados dentro de un tiempo determinado, ejecuta este bloque. En caso de que no se reciba la respuesta esperada en un tiempo razonable, se imprime el mensaje `"Timeout occurred"` y termina el script con un código de salida `1` (que indica error).*

**`interact`:**

- *La instrucción `interact` le dice a `expect` que deje de controlar el proceso y que permita la interacción del usuario con el nuevo shell que se ha lanzado, es decir, el usuario puede comenzar a usar la terminal de forma manual.*

### **Resumen del comando `expect`:**

- *El comando `spawn su root` ejecuta `su` para cambiar al usuario `root`.*
- *`expect` espera que aparezca el prompt de contraseña, envía la contraseña `abc` y luego espera el prompt de `root@`.*
- *Una vez que el prompt de `root@` se muestra, se ejecuta un nuevo shell de login interactivo con `exec bash -pl`.*
- *Si algo sale mal y no se recibe la respuesta esperada, se informa de un error con un mensaje de tiempo de espera.*
- *Finalmente, el control se pasa al usuario para interactuar con el shell.*

*Este script automatiza el proceso de iniciar sesión como `root` y ejecutar comandos como si estuvieras trabajando de manera manual en la terminal, pero todo es gestionado automáticamente por `expect`.*
