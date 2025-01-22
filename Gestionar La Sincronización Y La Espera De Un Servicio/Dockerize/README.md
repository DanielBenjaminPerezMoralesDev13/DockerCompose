<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# **Dockerize Tutorial**

## **Descargar la imagen oficial de Dockerize**

**Para obtener la imagen oficial de Dockerize, ejecutamos el siguiente comando:**

```bash
docker image pull jwilder/dockerize
```

## **Ejecutar la imagen de Dockerize**

**Ejecutamos el contenedor interactivo de Dockerize:**

```bash
docker run -it --rm --name container-dockerize jwilder/dockerize:latest
```

### **Salida esperada**

```bash
docker run -it --rm jwilder/dockerize:latest
Usage: dockerize [options] [command]

Utility to simplify running applications in docker containers

Options:
  -delims string
        template tag delimiters. default "{{":"}}"
  -no-overwrite
        Do not overwrite destination file if it already exists.
  -poll
        enable polling
  -stderr value
        Tails a file to stderr. Can be passed multiple times
  -stdout value
        Tails a file to stdout. Can be passed multiple times
  -template value
        Template (/template:/dest). Can be passed multiple times. Does also support directories
  -timeout duration
        Host wait timeout (default 10s)
  -version
        show version
  -wait value
        Host (tcp/tcp4/tcp6/http/https/unix/file) to wait for before this container starts. Can be passed multiple times. e.g. tcp://db:5432
  -wait-http-header value
        HTTP headers, colon separated. e.g "Accept-Encoding: gzip". Can be passed multiple times
  -wait-retry-interval duration
        Duration to wait before retrying (default 1s)

Arguments:
  command - command to be executed

Examples:

   Generate /etc/nginx/nginx.conf using nginx.tmpl as a template, tail /var/log/nginx/access.log
   and /var/log/nginx/error.log, waiting for a website to become available on port 8000 and start nginx.

   dockerize -template nginx.tmpl:/etc/nginx/nginx.conf \
             -stdout /var/log/nginx/access.log \
             -stderr /var/log/nginx/error.log \
             -wait tcp://web:8000 nginx

For more information, see https://github.com/jwilder/dockerize
```

---

### **Opciones:**

1. **`-delims string`**  
   - *Permite especificar delimitadores personalizados para las etiquetas de plantillas (templates).*
   - *Por defecto, los delimitadores son `{{` y `}}`.*
   - *Útil si los delimitadores predeterminados generan conflictos con otros sistemas o plantillas.*
   - *Ejemplo:*

     ```bash
     dockerize -delims "[[", "]]" -template config.tmpl:/app/config.json
     ```

2. **`-no-overwrite`**  
   - *Evita sobrescribir un archivo de destino si ya existe.*
   - *Útil para proteger archivos generados previamente durante ejecuciones repetidas.*
   - *Ejemplo:*

     ```bash
     dockerize -template config.tmpl:/app/config.json -no-overwrite
     ```

3. **`-poll`**  
   - *Habilita la funcionalidad de polling (sondeo continuo) para verificar si los hosts definidos en las opciones `-wait` están disponibles.*
   - *Es útil en situaciones donde se necesita verificar repetidamente la disponibilidad de un recurso o servicio.*

4. **`-stderr value`**  
   - *Permite redirigir y mostrar el contenido de un archivo en tiempo real hacia la salida de error estándar (stderr).*
   - *Puede usarse varias veces para observar múltiples archivos.*
   - *Ejemplo:*

     ```bash
     dockerize -stderr /var/log/server/error.log
     ```

5. **`-stdout value`**  
   - *Similar a `-stderr`, pero redirige el contenido de un archivo en tiempo real hacia la salida estándar (stdout).*
   - *Puede usarse varias veces.*
   - *Ejemplo:*

     ```bash
     dockerize -stdout /var/log/server/access.log
     ```

6. **`-template value`**  
   - *Genera archivos a partir de plantillas. Se especifica la plantilla de origen y el archivo de destino en el formato `/template:/dest`.*
   - *También admite directorios completos.*
   - *Ejemplo:*

     ```bash
     dockerize -template nginx.tmpl:/etc/nginx/nginx.conf
     ```

7. **`-timeout duration`**  
   - *Establece el tiempo máximo para esperar que un recurso esté disponible, como un host o servicio.*
   - *Valor predeterminado: `10s` (10 segundos).*
   - *Ejemplo:*

     ```bash
     dockerize -wait tcp://db:5432 -timeout 30s
     ```

8. **`-version`**  
   - *Muestra la versión actual de `dockerize`.*
   - *Ejemplo:*

     ```bash
     dockerize -version
     ```

9. **`-wait value`**  
   - *Define recursos que deben estar disponibles antes de que el contenedor comience a ejecutar el comando especificado.*
   - *Admite protocolos como `tcp`, `http`, `https`, `unix` y archivos regulares.*
   - *Puede usarse múltiples veces para esperar a varios recursos.*
   - *Ejemplo:*

     ```bash
     dockerize -wait tcp://db:5432 -wait http://web:8080
     ```

10. **`-wait-http-header value`**  
    - *Permite enviar encabezados HTTP personalizados al realizar solicitudes HTTP o HTTPS especificadas con `-wait`.*
    - *Puede usarse varias veces para agregar varios encabezados.*
    - *Ejemplo:*

      ```bash
      dockerize -wait http://example.com -wait-http-header "Accept-Encoding: gzip"
      ```

11. **`-wait-retry-interval duration`**  
    - *Establece el intervalo de espera entre los intentos de verificar la disponibilidad de un recurso especificado con `-wait`.*
    - *Valor predeterminado: `1s` (1 segundo).*
    - *Ejemplo:*

      ```bash
      dockerize -wait tcp://db:5432 -wait-retry-interval 5s
      ```

---

### **Argumentos:**

- **`command`**  
  - *Comando que se ejecutará después de cumplir las condiciones especificadas en las opciones `-wait`.*
  - *Ejemplo:*

    ```bash
    dockerize -template nginx.tmpl:/etc/nginx/nginx.conf -wait tcp://web:8000 nginx
    ```

---

## **Crear un Dockerfile**

**Creamos un archivo Dockerfile:**

```bash
touch Dockerfile
```

### **Contenido del Dockerfile**

```Dockerfile
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielBenjaminPerezMoralesDev13
# GitLab: https://gitlab.com/DanielBenjaminPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

FROM ubuntu:jammy

# Actualizamos y configuramos el entorno
RUN apt update && \
    apt install -y tini ncat && \
    useradd -m d4nitrix13 -s /usr/bin/bash && \
    mkdir -p /var/log/server/ && \
    touch /var/log/server/access.log /var/log/server/error.log

USER d4nitrix13
SHELL [ "/usr/bin/bash", "-plc" ]

# Copiamos Dockerize desde la imagen base
COPY --from=jwilder/dockerize --chown=1000:1000 /bin/dockerize /usr/bin/dockerize

# Configuramos el Healthcheck del contenedor
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "dockerize", "-stdout", "/var/log/server/access.log", "-stderr", "/var/log/server/error.log", "-wait", "tcp4://localhost:8000", "--", "echo", "'Server Up'" ]

# Exponemos el puerto
EXPOSE 5757/tcp

# Configuramos el manejador de señales
STOPSIGNAL 15

# Metadata del contenedor
MAINTAINER Daniel Benjamin Perez Morales
LABEL maintainer="Daniel Benjamin Perez Morales (D4nitrix13)"

# Definimos el ENTRYPOINT y CMD
ENTRYPOINT [ "tini", "--" ]
CMD [ "nc", "-nlvkp", "5757" ]
```

---

## **Construir la imagen**

**Construimos la imagen con el siguiente comando:**

```bash
docker build -t d4nitrix13/use-dockerize:latest .
```

```bash
docker build -t d4nitrix13/use-dockerize:latest .
[+] Building 29.6s (11/11) FINISHED                                                                        docker:default
 => [internal] load build definition from Dockerfile                                                                 0.0s
 => => transferring dockerfile: 1.12kB                                                                               0.0s
 => WARN: MaintainerDeprecated: Maintainer instruction is deprecated in favor of using label (line 19)               0.0s
 => [internal] load metadata for docker.io/jwilder/dockerize:latest                                                  1.8s
 => [internal] load metadata for docker.io/library/ubuntu:jammy                                                      1.8s
 => [auth] jwilder/dockerize:pull token for registry-1.docker.io                                                     0.0s
 => [auth] library/ubuntu:pull token for registry-1.docker.io                                                        0.0s
 => [internal] load .dockerignore                                                                                    0.0s
 => => transferring context: 2B                                                                                      0.0s
 => [stage-0 1/3] FROM docker.io/library/ubuntu:jammy@sha256:0e5e4a57c2499249aafc3b40fcd541e9a456aab7296681a3994d63  9.9s
 => => resolve docker.io/library/ubuntu:jammy@sha256:0e5e4a57c2499249aafc3b40fcd541e9a456aab7296681a3994d631587203f  0.0s
 => => sha256:0e5e4a57c2499249aafc3b40fcd541e9a456aab7296681a3994d631587203f97 6.69kB / 6.69kB                       0.0s
 => => sha256:3d1556a8a18cf5307b121e0a98e93f1ddf1f3f8e092f1fddfd941254785b95d7 424B / 424B                           0.0s
 => => sha256:97271d29cb7956f0908cfb1449610a2cd9cb46b004ac8af25f0255663eb364ba 2.30kB / 2.30kB                       0.0s
 => => sha256:6414378b647780fee8fd903ddb9541d134a1947ce092d08bdeb23a54cb3684ac 29.54MB / 29.54MB                     7.9s
 => => extracting sha256:6414378b647780fee8fd903ddb9541d134a1947ce092d08bdeb23a54cb3684ac                            1.7s
 => FROM docker.io/jwilder/dockerize:latest@sha256:b625a91f3ec52c32990fcc009669b1e6a25bc532ea558e14df9d5a3e85ae94d3  8.7s
 => => resolve docker.io/jwilder/dockerize:latest@sha256:b625a91f3ec52c32990fcc009669b1e6a25bc532ea558e14df9d5a3e85  0.0s
 => => sha256:6c3ce6d9ab6e29bc8283232d06c3778f9728be43a8d7fa02c6bb0ea04c1eb7dc 2.56kB / 2.56kB                       0.0s
 => => sha256:688513194d7a0f0d77e4a3692748d21c4ccd1af6a5ff9012f18f053ed9573c13 104.24kB / 104.24kB                   0.4s
 => => sha256:b625a91f3ec52c32990fcc009669b1e6a25bc532ea558e14df9d5a3e85ae94d3 856B / 856B                           0.0s
 => => sha256:17151b83b99208548ce4ca67533182eddf64020e34c30b10e48d234c13cd157f 2.47kB / 2.47kB                       0.0s
 => => sha256:bfb59b82a9b65e47d485e53b3e815bca3b3e21a095bd0cb88ced9ac0b48062bf 13.36kB / 13.36kB                     0.5s
 => => extracting sha256:688513194d7a0f0d77e4a3692748d21c4ccd1af6a5ff9012f18f053ed9573c13                            0.0s
 => => sha256:efa9d1d5d3a286c60a7261496166fdf31cec2284dafe7eef7cda89eba2f675d6 541.99kB / 541.99kB                   1.4s
 => => extracting sha256:bfb59b82a9b65e47d485e53b3e815bca3b3e21a095bd0cb88ced9ac0b48062bf                            0.0s
 => => sha256:a62778643d563b511190663ef9a77c30d46d282facfdce4f3a7aecc03423c1f3 67B / 67B                             0.9s
 => => sha256:7c12895b777bcaa8ccae0605b4de635b68fc32d60fa08f421dc3818bf55ee212 188B / 188B                           1.6s
 => => extracting sha256:efa9d1d5d3a286c60a7261496166fdf31cec2284dafe7eef7cda89eba2f675d6                            0.2s
 => => sha256:3214acf345c0cc6bbdb56b698a41ccdefc624a09d6beb0d38b5de0b2303ecaf4 123B / 123B                           1.9s
 => => sha256:5664b15f108bf9436ce3312090a767300800edbbfd4511aa1a6d64357024d5dd 168B / 168B                           2.0s
 => => extracting sha256:a62778643d563b511190663ef9a77c30d46d282facfdce4f3a7aecc03423c1f3                            0.0s
 => => extracting sha256:7c12895b777bcaa8ccae0605b4de635b68fc32d60fa08f421dc3818bf55ee212                            0.0s
 => => extracting sha256:3214acf345c0cc6bbdb56b698a41ccdefc624a09d6beb0d38b5de0b2303ecaf4                            0.0s
 => => extracting sha256:5664b15f108bf9436ce3312090a767300800edbbfd4511aa1a6d64357024d5dd                            0.0s
 => => sha256:0bab15eea81d0fe6ab56ebf5fba14e02c4c1775a7f7436fbddd3505add4e18fa 93B / 93B                             2.2s
 => => sha256:4aa0ea1413d37a58615488592a0b827ea4b2e48fa5a77cf707d0e35f025e613f 385B / 385B                           2.2s
 => => extracting sha256:0bab15eea81d0fe6ab56ebf5fba14e02c4c1775a7f7436fbddd3505add4e18fa                            0.0s
 => => sha256:da7816fa955ea24533c388143c78804c28682eef99b4ee3723b548c70148bba6 321B / 321B                           2.5s
 => => extracting sha256:4aa0ea1413d37a58615488592a0b827ea4b2e48fa5a77cf707d0e35f025e613f                            0.0s
 => => sha256:9aee425378d2c16cd44177dc54a274b312897f5860a8e78fdfda555a0d79dd71 130.50kB / 130.50kB                   2.5s
 => => extracting sha256:da7816fa955ea24533c388143c78804c28682eef99b4ee3723b548c70148bba6                            0.0s
 => => extracting sha256:9aee425378d2c16cd44177dc54a274b312897f5860a8e78fdfda555a0d79dd71                            0.0s
 => => sha256:fd2a53a68df148ba4fe6dbe7b8263a6feb7a6b8d77245dfedc080ba22b3a8be9 6.57MB / 6.57MB                       8.3s
 => => extracting sha256:fd2a53a68df148ba4fe6dbe7b8263a6feb7a6b8d77245dfedc080ba22b3a8be9                            0.2s
 => [stage-0 2/3] RUN apt update &&     apt install -y tini ncat &&     useradd -m d4nitrix13 -s /usr/bin/bash &&   16.8s
 => [stage-0 3/3] COPY --from=jwilder/dockerize --chown=1000:1000 /bin/dockerize /usr/bin/dockerize                  0.1s
 => exporting to image                                                                                               0.9s
 => => exporting layers                                                                                              0.9s
 => => writing image sha256:65fc2621ca90b1246f77152f4e4bcad018bdc134931d39c13d293003c497eaae                         0.0s
 => => naming to docker.io/d4nitrix13/use-dockerize:latest                                                           0.0s

 1 warning found (use docker --debug to expand):
 - MaintainerDeprecated: Maintainer instruction is deprecated in favor of using label (line 19)
```

## **Crear y ejecutar el contenedor**

**Creamos y ejecutamos el contenedor basado en la imagen creada:**

```bash
docker run -it --name server d4nitrix13/use-dockerize:latest
```

- **Salida esperada**

```bash
Ncat: Version 7.80 ( https://nmap.org/ncat )
Ncat: Listening on :::5757
Ncat: Listening on 0.0.0.0:5757
```

---

## **Realizar una petición desde el host**

**Para probar la conectividad al puerto expuesto del contenedor:**

```bash
nc -zv 172.17.0.2 5757
```

### **Salida esperada en el servidor TCP**

```bash
Ncat: Connection from 172.17.0.1.
Ncat: Connection from 172.17.0.1:55408.
```

### **Salida del comando en el host**

```bash
Connection to 172.17.0.2 5757 port [tcp/*] succeeded!
```

---

## **Verificar el contenedor**

**Ejecutamos el siguiente comando para verificar el contenedor en ejecución:**

```bash
docker ps --size
```

- **Salida esperada**

```bash
CONTAINER ID   IMAGE                             COMMAND                  CREATED              STATUS                                 PORTS      NAMES     SIZE
61b446e87ffb   d4nitrix13/use-dockerize:latest   "tini -- nc -nlvkp 5…"   About a minute ago   Up About a minute (health: starting)   5757/tcp   server    0B (virtual 152MB)
```

- **Docker Exec**

```bash
docker exec -h
Flag shorthand -h has been deprecated, use --help

Usage:  docker exec [OPTIONS] CONTAINER COMMAND [ARG...]

Execute a command in a running container

Aliases:
  docker container exec, docker exec

Options:
  -d, --detach               Detached mode: run command in the background
      --detach-keys string   Override the key sequence for detaching a container
  -e, --env list             Set environment variables
      --env-file list        Read in a file of environment variables
  -i, --interactive          Keep STDIN open even if not attached
      --privileged           Give extended privileges to the command
  -t, --tty                  Allocate a pseudo-TTY
  -u, --user string          Username or UID (format: "<name|uid>[:<group|gid>]")
  -w, --workdir string       Working directory inside the container
```

```bash
docker exec -itu0:0 -w/var/log/server/ --privileged server bash
```

### **1. Comando:**

```bash
docker exec --interactive --tty --user 0:0 --privileged --workdir /var/log/server/ server bash
```

- **Este comando ejecuta una instancia interactiva del shell `bash` dentro de un contenedor Docker llamado `server`. Veamos cada opción:**

- **`docker exec`:** *Ejecuta un comando dentro de un contenedor en ejecución.*
- **`--interactive` (`-i`):** *Mantiene la entrada estándar abierta para interacción.*
- **`--tty` (`-t`):** *Asocia una terminal pseudo-TTY al proceso.*
- **`--user 0:0`:** *Ejecuta el comando como el usuario con ID `0` (raíz) y grupo `0` (raíz). Esto otorga permisos administrativos dentro del contenedor.*
- **`--privileged`:** *Otorga privilegios adicionales al proceso. Esto permite al proceso dentro del contenedor acceder a ciertas características del sistema host.*
- **`--workdir /var/log/server/`:** *Cambia al directorio de trabajo `/var/log/server/` dentro del contenedor.*
- **`server`:** *Nombre del contenedor donde se ejecuta el comando.*
- **`bash`:** *El comando que se ejecutará dentro del contenedor (una instancia del shell `bash`).*

---

### **2. Verificación de archivos dentro del contenedor**

```bash
root@61b446e87ffb:/var/log/server# ls -lA
total 0
-rw-r--r-- 1 root root 0 Jan 22 02:26 access.log
-rw-r--r-- 1 root root 0 Jan 22 02:26 error.log
```

- **El comando `ls -lA` muestra información detallada sobre los archivos en el directorio `/var/log/server/`. Aquí se ven dos archivos de log (`access.log` y `error.log`) con las siguientes características:**

- **`-rw-r--r--`:** *Permisos de los archivos.*
  - *El propietario (root) puede leer y escribir.*
  - *Otros usuarios solo tienen permiso de lectura.*
- **`1 root root`:** *El archivo pertenece al usuario `root` y al grupo `root`.*
- **`0`:** *Tamaño de los archivos en bytes (vacíos).*
- **`Jan 22 02:26`:** *Fecha y hora de creación o modificación.*
- **`access.log` y `error.log`:** *Archivos de registro definidos en el `Dockerfile`.*

---

### **3. Comando desde el host**

```bash
echo -n "" > /dev/tcp/172.17.0.2/5757
```

*Este comando crea una conexión TCP al contenedor en el puerto `5757`. Desglosamos:*

- **`echo -n ""`:**
  - **`echo`:** *Envía datos al flujo de salida estándar.*
  - **`-n`:** *Evita que `echo` añada una nueva línea al final.*
  - **`""`:** *Un string vacío; no envía datos al destino.*

- **`>`:** *Redirecciona el flujo de datos al archivo o dispositivo especificado.*

- **`/dev/tcp/172.17.0.2/5757`:**
  - **`/dev/tcp`:** *Una característica especial del shell `bash` que permite interactuar con puertos TCP directamente.*
  - **`172.17.0.2`:** *Dirección IP del contenedor.*
  - **`5757`:** *Puerto al que se conecta.*

**En resumen, este comando abre una conexión TCP sin enviar datos.**

---

### **4. Salida en el servidor**

```bash
Ncat: Connection from 172.17.0.1.
Ncat: Connection from 172.17.0.1:48224.
```

*Este mensaje aparece en el servidor porque la herramienta `ncat` (usada en el `CMD` del contenedor) está escuchando en el puerto `5757` y detecta una conexión entrante. Desglose:*

- **`Connection from 172.17.0.1`:**
  - **`172.17.0.1`:** *Dirección IP del host que inició la conexión (la máquina que ejecuta Docker).*
  
- **`Connection from 172.17.0.1:48224`:**
  - **`48224`:** *Puerto de origen en el host que usó para establecer la conexión.*

*Esto confirma que el servidor dentro del contenedor está escuchando correctamente en el puerto `5757` y que las conexiones externas son aceptadas.*

---

### **Flujo general:**

1. *Se lanza el contenedor y se configuran los logs (`access.log` y `error.log`).*
2. *El servidor escucha en el puerto `5757` usando `ncat`.*
3. *Desde el host, se ejecuta un comando para abrir una conexión al puerto del contenedor.*
4. *El servidor detecta la conexión y registra su información.*
