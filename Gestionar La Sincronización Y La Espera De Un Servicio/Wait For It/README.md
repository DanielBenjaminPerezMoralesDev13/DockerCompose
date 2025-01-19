<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# **Wait For It**

## **Descargar la imagen base de Debian Bullseye**

```bash
docker image pull debian:bullseye
```

*Esto descarga la imagen oficial de Debian con la etiqueta `bullseye` desde el registro de Docker Hub. Una vez completada, verás el estado del proceso, incluyendo el digest de la imagen descargada.*

---

### **Crear un contenedor con parámetros personalizados**

```bash
docker container create --interactive --tty --init --user 0:0 --privileged --stop-signal SIGTERM --stop-timeout 10 --platform linux/amd64 --network bridge --attach STDOUT --attach STDERR --attach STDIN --dns 8.8.8.8 --label manteiner="D4nitrix13" --name container-wait-for-it debian:bullseye
```

*Este comando crea un contenedor basado en la imagen descargada previamente. Explicación de los parámetros:*

- **`--interactive`, `--tty`:** *Permiten la interacción con la consola.*
- **`--init`:** *Usa un proceso init para manejar señales y procesos huérfanos.*
- **`--user 0:0`:** *Especifica que el contenedor se ejecutará como usuario root (`UID: 0`, `GID: 0`).*
- **`--privileged`:** *Otorga permisos elevados al contenedor.*
- **`--stop-signal SIGTERM`:** *Configura la señal usada para detener el contenedor.*
- **`--stop-timeout 10`:** *Especifica 10 segundos como tiempo de espera al detener el contenedor.*
- **`--platform linux/amd64`:** *Garantiza que el contenedor se ejecuta en la arquitectura `linux/amd64`.*
- **`--network bridge`:** *Configura el contenedor en modo de red `bridge`.*
- **`--dns 8.8.8.8`:** *Configura un servidor DNS específico.*
- **`--label manteiner="D4nitrix13"`:** *Añade una etiqueta con información del responsable.*
- **`--name container-wait-for-it`:** *Establece el nombre del contenedor como `container-wait-for-it`.*

---

### **Iniciar el contenedor creado**

```bash
docker container start -i container-wait-for-it
```

**Este comando inicia el contenedor y permite interactuar con él mediante la terminal.**

---

### **Buscar el paquete `wait-for-it`**

```bash
apt search wait-for-it
```

*Busca en el índice de paquetes de Debian el script `wait-for-it`, que es una utilidad para esperar la disponibilidad de un host y puerto.*

```bash
apt search wait-for-it
Sorting... Done
Full Text Search... Done
ruby-wait-for-it/oldstable 0.2.1-2 all
  Stop sleeping in your tests, instead wait for it

wait-for-it/oldstable 0.0~git20180723-1 all
  script that will wait on the availability of a host and TCP port
```

---

### **Instalar el paquete `wait-for-it`**

```bash
apt install -y wait-for-it
```

*Instala el paquete de manera automática. Una vez instalado, puedes verificar su funcionalidad usando:*

```bash
wait-for-it --help
```

*Esto mostrará las opciones y el uso del script.*

```bash
root@cb88f6ed536f:/# wait-for-it --help
Usage:
    wait-for-it host:port [-s] [-t timeout] [-- command args]
    -h HOST | --host=HOST       Host or IP under test
    -p PORT | --port=PORT       TCP port under test
                                Alternatively, you specify the host and port as host:port
    -s | --strict               Only execute subcommand if the test succeeds
    -q | --quiet                Don't output any status messages
    -t TIMEOUT | --timeout=TIMEOUT
                                Timeout in seconds, zero for no timeout
    -- COMMAND ARGS             Execute command with args after the test finishes
```

---

### **Descargar manualmente el script `wait-for-it.sh` desde GitHub**

*Si necesitas la última versión del script desde el repositorio oficial, puedes descargarlo con `wget` o `curl`:*

- **Con `wget`:**

```bash
apt install -y wget
```

```bash
wget https://raw.githubusercontent.com/vishnubob/wait-for-it/refs/heads/master/wait-for-it.sh -O wait-for-it.sh
```

```bash
wget https://raw.githubusercontent.com/vishnubob/wait-for-it/refs/heads/master/wait-for-it.sh
--2025-01-18 18:23:31--  https://raw.githubusercontent.com/vishnubob/wait-for-it/refs/heads/master/wait-for-it.sh
Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 185.199.111.133, 185.199.110.133, 185.199.109.133, ...
Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|185.199.111.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 5227 (5.1K) [text/plain]
Saving to: 'wait-for-it.sh'

wait-for-it.sh                 100%[==================================================>]   5.10K  --.-KB/s    in 0s

2025-01-18 18:23:32 (13.8 MB/s) - 'wait-for-it.sh' saved [5227/5227]
```

```bash
wget https://raw.githubusercontent.com/vishnubob/wait-for-it/refs/heads/master/wait-for-it.sh -O wait-for-it.sh
--2025-01-18 18:24:23--  https://raw.githubusercontent.com/vishnubob/wait-for-it/refs/heads/master/wait-for-it.sh
Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 185.199.111.133, 185.199.108.133, 185.199.109.133, ...
Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|185.199.111.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 5227 (5.1K) [text/plain]
Saving to: 'wait-for-it.sh'

wait-for-it.sh                 100%[==================================================>]   5.10K  --.-KB/s    in 0.001s

2025-01-18 18:24:24 (6.91 MB/s) - 'wait-for-it.sh' saved [5227/5227]
```

- **Con `curl`:**

```bash
apt install -y curl
```

```bash
curl https://raw.githubusercontent.com/vishnubob/wait-for-it/refs/heads/master/wait-for-it.sh -o wait-for-it.sh
```

*Ambos comandos descargan el script y lo guardan como `wait-for-it.sh`.*

```bash
curl https://raw.githubusercontent.com/vishnubob/wait-for-it/refs/heads/master/wait-for-it.sh -o wait-for-it.sh
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  5227  100  5227    0     0  14559      0 --:--:-- --:--:-- --:--:-- 14559
```

---

### **Hacer ejecutable el script**

```bash
chmod u+x wait-for-it.sh
```

**Esto otorga permisos de ejecución al script. Luego, puedes verificar su funcionalidad nuevamente con:**

```bash
./wait-for-it.sh --help
```

```bash
./wait-for-it.sh --help
Usage:
    wait-for-it.sh host:port [-s] [-t timeout] [-- command args]
    -h HOST | --host=HOST       Host or IP under test
    -p PORT | --port=PORT       TCP port under test
                                Alternatively, you specify the host and port as host:port
    -s | --strict               Only execute subcommand if the test succeeds
    -q | --quiet                Don't output any status messages
    -t TIMEOUT | --timeout=TIMEOUT
                                Timeout in seconds, zero for no timeout
    -- COMMAND ARGS             Execute command with args after the test finishes
```

---

### **Instruccion Run Shell Form & Exec Form**

**Forma shell:**

- *Es más flexible y adecuada para comandos complejos porque permite usar operadores de shell (`&&, ||, ;,` etc.).*
- *Docker traduce `RUN apt update && apt install -y wait-for-it` en un comando que se ejecuta con `/bin/sh -c`.*

**Forma exec:**

- *Más estricta, ya que no usa un intérprete de comandos y ejecuta directamente los binarios especificados.*
- *No soporta operadores como `&&`, `||`, `>`, `<`.*
