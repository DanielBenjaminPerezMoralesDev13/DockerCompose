<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# **Docker Build**

*[Docker Build Flag -f](https://stackoverflow.com/questions/32235987/docker-build-with-f-option-cannot-find-dockerfile "https://stackoverflow.com/questions/32235987/docker-build-with-f-option-cannot-find-dockerfile")*
*[How can I correctly specify the platform for my dockerfile?](https://stackoverflow.com/questions/70754255/how-can-i-correctly-specify-the-platform-for-my-dockerfile "https://stackoverflow.com/questions/70754255/how-can-i-correctly-specify-the-platform-for-my-dockerfile")*
*[Docker: Label Image on Build (Dockerfile) – Example](https://www.shellhacks.com/docker-label-image-build-dockerfile-example/ "https://www.shellhacks.com/docker-label-image-build-dockerfile-example/")*
*[Kill Process Linux](https://phoenixnap.com/kb/how-to-kill-a-process-in-linux "https://phoenixnap.com/kb/how-to-kill-a-process-in-linux")*
*[Docker Tini](https://dev.to/joeyb908/docker-dockerizing-a-simple-nodejs-app-1pjp "https://dev.to/joeyb908/docker-dockerizing-a-simple-nodejs-app-1pjp")*
*[Is there a best practice on setting up glibc on docker alpine linux base image?](https://stackoverflow.com/questions/37818831/is-there-a-best-practice-on-setting-up-glibc-on-docker-alpine-linux-base-image "https://stackoverflow.com/questions/37818831/is-there-a-best-practice-on-setting-up-glibc-on-docker-alpine-linux-base-image")*

```bash
docker image build --platform=linux/amd64 --label version="0.1" --label maintainer="Daniel Perez" --tag d4nitrix13/python-healthcheck --file ./Dockerfile.dev --no-cache .
```

```bash
docker build --platform=linux/amd64 --label version="0.1" --label maintainer="Daniel Perez" -t d4nitrix13/python-healthcheck -f ./Dockerfile.dev --no-cache .
```

```bash
docker build --platform=linux/amd64 --label version="0.1" --label maintainer="Daniel Perez" -td4nitrix13/python-healthcheck -f./Dockerfile.dev --no-cache .
```

```bash
docker build --platform=linux/amd64 --label version="0.1" --label maintainer="Daniel Perez" -td4nitrix13/python-healthcheck -f./Dockerfile.dev --no-cache .
[+] Building 5.1s (7/7) FINISHED                                                                                                                         docker:default
 => [internal] load build definition from Dockerfile.dev                                                                                                           0.0s
 => => transferring dockerfile: 619B                                                                                                                               0.0s
 => [internal] load metadata for docker.io/library/python:alpine                                                                                                   0.9s
 => [auth] library/python:pull token for registry-1.docker.io                                                                                                      0.0s
 => [internal] load .dockerignore                                                                                                                                  0.0s
 => => transferring context: 2B                                                                                                                                    0.0s
 => CACHED [1/2] FROM docker.io/library/python:alpine@sha256:b6f01a01e34091438a29b6dda4664199e34731fb2581ebb6fe255a2ebf441099                                      0.0s
 => [2/2] RUN apk --no-cache add curl && apk add --no-cache tini                                                                                                   4.0s
 => exporting to image                                                                                                                                             0.1s
 => => exporting layers                                                                                                                                            0.1s
 => => writing image sha256:8131f58c64c8fbd694113ffabbd2da75e2bc8e30e86823292eccd7f266209eae                                                                       0.0s
 => => naming to docker.io/d4nitrix13/python-healthcheck                                                                                                           0.0s

 1 warning found (use docker --debug to expand):
 - JSONArgsRecommended: JSON arguments recommended for CMD to prevent unintended behavior related to OS signals (line 18)
```

## **Crear un contenedor**

```bash
docker run -d --name python-container d4nitrix13/python-healthcheck
```

- **docker run:** *Inicia un nuevo contenedor.*
- **-d:** *Ejecuta el contenedor en segundo plano (modo "detached").*
- **--name python-container:** *Asigna un nombre legible al contenedor (en este caso, `python-container`).*
- **d4nitrix13/python-healthcheck:** *Imagen base que contiene un servidor Python para pruebas de salud.*

---

### **Listar contenedores activos**

```bash
docker ps
```

- **docker ps:** *Muestra una lista de contenedores activos.*
- **CONTAINER ID:** *Identificador único del contenedor.*
- **IMAGE:** *Imagen base del contenedor.*
- **COMMAND:** *Comando ejecutado dentro del contenedor.*
- **STATUS:** *Estado del contenedor (e.g., "Up", "Exited", "(health: starting)").*
- **PORTS:** *Puertos expuestos.*
- **NAMES:** *Nombre del contenedor.*

**Ejemplo de salida:**

```bash
CONTAINER ID   IMAGE                          COMMAND                  CREATED         STATUS                            PORTS     NAMES
46c134fa0413   d4nitrix13/python-healthcheck   "python3 -m http.ser…"   2 seconds ago   Up 2 seconds (health: starting)   80/tcp    python-container
```

---

#### **Acceder al contenedor**

```bash
docker exec -itu0:0 python-container sh
```

- **docker exec:** *Ejecuta un comando en un contenedor activo.*
- **-i:** *Permite entrada interactiva.*
- **-t:** *Asigna una pseudo-terminal.*
- **-u0:0:** *Ejecuta el comando como usuario y grupo `root` (ID 0).*
- **python-container:** *Nombre del contenedor.*
- **sh:** *Ejecuta una sesión de shell dentro del contenedor.*

---

#### **Buscar procesos en ejecución dentro del contenedor**

```bash
pgrep -f 'python3 -m http.server 80'
```

- **pgrep:** *Busca procesos activos que coincidan con un criterio.*
- **-f:** *Permite buscar en la línea completa del comando.*
- **'python3 -m http.server 80':** *Proceso del servidor HTTP Python.*

**Salida esperada:**

```bash
1
```

---

#### **Visualizar procesos en el contenedor**

```bash
top
```

- **top:** *Muestra los procesos en ejecución y el uso de recursos en tiempo real.*
- **Mem:** *Uso de memoria.*
- **CPU:** *Uso de CPU.*
- **COMMAND:** *Nombre del comando ejecutado.*

**Ejemplo de salida:**

```bash
Mem: 6250020K used, 1789844K free, 429964K shrd, 187536K buff, 3037492K cached
CPU:   2% usr   0% sys   0% nic  97% idle   0% io   0% irq   0% sirq
Load average: 0.84 1.10 1.01 2/1016 55
  PID  PPID USER     STAT   VSZ %VSZ CPU %CPU COMMAND
    1     0 root     S    24992   0%   2   0% python3 -m http.server 80
   49     0 root     S     1708   0%   2   0% sh
   55    49 root     R     1636   0%   0% top
```

---

#### **Ver procesos desde el host**

```bash
docker top python-container
```

- **docker top:** *Muestra los procesos del contenedor desde el host.*
- **UID:** *Usuario que ejecuta el proceso.*
- **PID:** *ID del proceso en el host.*
- **PPID:** *ID del proceso padre.*
- **CMD:** *Comando ejecutado.*

**Salida:**

```bash
UID                 PID                 PPID                C                   STIME               TTY                 TIME                CMD
root                279186              279165              0                   14:30               ?                   00:00:00            python3 -m http.server 80
```

#### **Verificar directorio de un proceso en el host**

```bash
sudo pwdx 279186
```

- **pwdx:** *Muestra el directorio de trabajo de un proceso.*
- **279186:** *ID del proceso (PID).*

**Salida:**

```bash
279186: /
```

---

#### **Filtrar procesos en el host**

```bash
ps aux | rg 279165
```

- **ps aux:** *Muestra todos los procesos activos.*
- **rg:** *Filtro para buscar por ID de proceso.*

**Salida:**

```bash
root      279165  0.0  0.1 1238196 14400 ?       Sl   14:30   0:00 /usr/bin/containerd-shim-runc-v2 -namespace moby -id 050be68d83138ff73416a6c9aa3049809181640796f5fac9c0bd904752993d3d -address /run/containerd/containerd.sock
```

#### **Obtener ID del contenedor a partir del proceso**

```bash
ps aux | rg 279165 | head -n 1 | awk '{print $15}'
```

- **awk '{print $15}':** *Extrae la columna 15 que contiene el ID del contenedor.*

**Salida:**

```bash
050be68d83138ff73416a6c9aa3049809181640796f5fac9c0bd904752993d3d
```

#### **Filtrar contenedores por ID**

```bash
docker ps --filter id=050be68d83138ff73416a6c9aa3049809181640796f5fac9c0bd904752993d3d --size
```

- **--filter id=:** *Filtra los contenedores por ID.*
- **--size:** *Muestra el tamaño del contenedor y su imagen virtual.*

**Salida:**

```bash
CONTAINER ID   IMAGE                           COMMAND                  CREATED         STATUS                     PORTS     NAMES              SIZE
050be68d8313   d4nitrix13/python-healthcheck   "python3 -m http.ser…"   8 minutes ago   Up 8 minutes (unhealthy)   80/tcp    python-container   1.71MB (virtual 46.6MB)
```

- **Diferencia entre el PID en el host y en el contenedor**

> [!IMPORTANT]
> **El motivo por el cual el PID dentro del contenedor es diferente del PID que aparece en el host se debe a la forma en que Docker implementa los contenedores. Cada contenedor se ejecuta dentro de su propio espacio de nombres de procesos (PID namespace), lo que significa que los procesos dentro del contenedor tienen su propia jerarquía de procesos independiente de la del host.**

**Espacio de nombres de PID:**

> [!NOTE]
> *Dentro del contenedor, el proceso principal (en este caso python3 -m http.server 80) tiene el PID 1 porque es el primer proceso en el espacio de nombres del contenedor.*

- **En el host, Docker ejecuta el contenedor como un subproceso utilizando una herramienta como containerd o runc. Por eso, el proceso tiene un PID diferente en el host.**

- **Contexto del host:**
  - **En el host, puedes identificar el proceso del contenedor con herramientas como docker top o verificando el containerd-shim que gestiona el contenedor.**

- **Más información con pwdx:**
  - **Puedes usar pwdx para verificar el directorio de trabajo del proceso en el host y confirmar que corresponde al contenedor.**

---

#### **Probar conectividad desde el host**

```bash
curl -X GET http://172.17.0.2/
```

- **curl:** *Realiza peticiones HTTP desde la línea de comandos.*
- **-X GET:** *Especifica el método HTTP (en este caso, GET).*
- **`http://172.17.0.2/`:** *Dirección IP del contenedor.*

Salida:

```html
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Directory listing for /</title>
</head>
<body>
<h1>Directory listing for /</h1>
<hr>
<ul>
<li><a href=".dockerenv">.dockerenv</a></li>
<li><a href="bin/">bin/</a></li>
<li><a href="dev/">dev/</a></li>
<li><a href="etc/">etc/</a></li>
<li><a href="home/">home/</a></li>
<li><a href="lib/">lib/</a></li>
<li><a href="media/">media/</a></li>
<li><a href="mnt/">mnt/</a></li>
<li><a href="opt/">opt/</a></li>
<li><a href="proc/">proc/</a></li>
<li><a href="root/">root/</a></li>
<li><a href="run/">run/</a></li>
<li><a href="sbin/">sbin/</a></li>
<li><a href="srv/">srv/</a></li>
<li><a href="sys/">sys/</a></li>
<li><a href="tmp/">tmp/</a></li>
<li><a href="usr/">usr/</a></li>
<li><a href="var/">var/</a></li>
</ul>
<hr>
</body>
</html>
```

---

#### **Intentar detener un proceso en el contenedor**

```bash
kill -9 1
```

- **kill -9:** *Fuerza la terminación de un proceso.*
- **1:** *PID del proceso dentro del contenedor (servidor HTTP Python).*

**Resultado:**

- **El proceso es reiniciado automáticamente por Docker debido al health check configurado.**

---

#### **Detener y eliminar todos los contenedores**

```bash
docker rm -f $(docker ps -aq)
```

- **docker rm -f:** *Elimina contenedores forzadamente.*
- **$(docker ps -aq):** *Lista todos los IDs de los contenedores, activos e inactivos.*

---

### **Configuración manual de Healthcheck en Docker**

#### **Comando para ejecutar el contenedor con un healthcheck personalizado**

```bash
docker run -d \
  --name python-healthcheck \
  --health-cmd="curl --silent --fail http://localhost/ || exit 1" \
  --health-interval=30s \
  --health-start-period=30s \
  --health-timeout=5s \
  --health-retries=3 \
  -p 80:80 \
  python:alpine
```

---

#### **Explicación detallada de cada parámetro**

1. **`docker run -d`:**
   - **Ejecuta el contenedor en segundo plano (modo *detached*).**

2. **`--name python-healthcheck`:**
   - *Asigna el nombre `python-healthcheck` al contenedor para facilitar su identificación.*

3. **`--health-cmd="curl --silent --fail http://localhost/ || exit 1"`:**
   - **`curl`:** *Herramienta para realizar solicitudes HTTP desde la línea de comandos.*
   - **`--silent`:** *Suprime la salida del progreso de la descarga.*
   - **`--fail`:** *Devuelve un código de salida distinto de 0 si ocurre un error HTTP.*
   - **`http://localhost/`:** *URL objetivo que el healthcheck monitorea.*
   - **`|| exit 1`:** *Si el comando falla, se indica que el contenedor no está saludable devolviendo un estado de error.*

4. **`--health-interval=30s`:**
   - *Define que el healthcheck se ejecutará cada 30 segundos.*

5. **`--health-start-period=30s`:**
   - *Permite un periodo inicial de 30 segundos para que el contenedor se inicie completamente antes de que comience la supervisión del healthcheck.*

6. **`--health-timeout=5s`:**
   - *Especifica que el comando del healthcheck debe completarse en 5 segundos, de lo contrario, se considera fallido.*

7. **`--health-retries=3`:**
   - **Si el healthcheck falla, se reintenta hasta 3 veces antes de marcar el contenedor como *unhealthy*.**

8. **`-p 80:80`:**
   - *Publica el puerto 80 del contenedor en el puerto 80 del host, haciendo accesible el servidor HTTP desde el exterior.*

9. **`python:alpine`:**
   - *Utiliza la imagen oficial de Python basada en Alpine Linux, que es ligera y adecuada para aplicaciones simples como este servidor HTTP.*

---

#### **Ejecución del contenedor**

**Al ejecutar este comando, Docker buscará la imagen `python:alpine`.**

---

#### **Verificando el estado del contenedor**

1. **Comando:**

   ```bash
   docker ps
   ```

2. **Primera salida (inicializando healthcheck):**

   ```bash
   CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS                             PORTS                               NAMES
   b96d6493c8a6   python:alpine   "python3 -m http.ser…"   25 seconds ago   Up 23 seconds (health: starting)   0.0.0.0:80->80/tcp, :::80->80/tcp   python-healthcheck
   ```

   - **`health: starting`:** *Indica que el healthcheck está en proceso de evaluación inicial.*

3. **Segunda salida (healthcheck aprobado):**

   ```bash
   CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS                   PORTS                               NAMES
   b96d6493c8a6   python:alpine   "python3 -m http.ser…"   2 minutes ago   Up 2 minutes (healthy)   0.0.0.0:80->80/tcp, :::80->80/tcp   python-healthcheck
   ```

   - **`health: healthy`:** *Significa que el contenedor ha pasado el healthcheck y se considera en buen estado.*

## *El proceso que estás intentando detener con `kill -9 1` (PID 1) no se puede matar de manera normal porque **PID 1** es el proceso raíz del sistema (init o systemd), que es fundamental para el funcionamiento del sistema operativo o el contenedor. En otras palabras, **el proceso con PID 1 no se puede matar**, ya que es el que maneja y controla todos los demás procesos en el contenedor o en el sistema.*

## **Explicación del problema**

1. **PID 1** *es el primer proceso que se ejecuta cuando el sistema inicia, y generalmente se encarga de inicializar otros procesos y servicios. En tu caso, `python3 -m http.server 80` se está ejecutando bajo PID 1, lo que indica que este proceso está actuando como el proceso principal del contenedor.*

2. *Matar **PID 1** podría hacer que el contenedor o el sistema pierda su capacidad de gestionar otros procesos, lo que generalmente no es deseado.*

### **Soluciones posibles**

#### *Opción 1: **Matar el contenedor completo***

*Si estás ejecutando este proceso dentro de un contenedor (por ejemplo, Docker), puedes detener el contenedor entero en lugar de matar solo el proceso:*

```bash
docker stop <name_container_or_id_container>
```

*Esto detendrá todos los procesos dentro del contenedor, incluyendo el servidor HTTP de Python.*

#### *Opción 2: **Reiniciar el contenedor***

*Si necesitas reiniciar el contenedor (y, por lo tanto, matar todos los procesos dentro de él), puedes usar:*

```bash
docker restart <name_container_or_id_container>
```

#### *Opción 3: **Evitar que `python3 -m http.server` se ejecute como PID 1***

*Si realmente necesitas ejecutar un servidor HTTP en un contenedor y deseas evitar que el proceso `python3 -m http.server` ocupe PID 1, puedes configurar el contenedor para ejecutar un proceso supervisado, como `tini` o `supervisord`, que manejará los procesos y no bloqueará el PID 1.*

**Por ejemplo, usando `tini` como entrypoint:**

```Dockerfile
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielBenjaminPerezMoralesDev13
# Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

# Usa la imagen oficial de Python como base
FROM python:alpine

RUN apk --no-cache add curl && apk add --no-cache tini
# Define el puerto en el que escucha el servidor
EXPOSE 80

# HealthCheck para verificar que el servidor responde a peticiones HTTP en el puerto 80
HEALTHCHECK --interval=30s --timeout=5s --retries=3 --start-period=30s \
    CMD curl --silent --fail http://localhost/ || exit 1

ENTRYPOINT [ "tini", "--" ]

CMD sh
```

- **Ahora cuando creamos e iniciamos el contenedor ejecutamos el siguiente comando `python3 -m http.server 80`**
*Esto permitiría que el proceso principal (servidor HTTP) no ocupe PID 1, lo que facilita su terminación sin afectar el contenedor.*

#### *Opción 4: **Revisar el contenedor***

**Si el proceso sigue corriendo incluso después de haber intentado matarlo, puede ser un indicio de que el contenedor está configurado para reiniciar automáticamente en caso de que el proceso termine. Revisa la configuración de reinicio del contenedor con:**

```bash
docker inspect <name_container_or_id_container> | grep -i restart
```

*Esto te indicará si el contenedor está configurado para reiniciar siempre, lo que explicaría por qué el proceso sigue ejecutándose.*

> [!IMPORTANT]
> **En resumen, no puedes matar directamente el proceso con PID 1 porque es crítico para el funcionamiento del sistema o contenedor. La mejor solución depende de tu entorno (contenedor o sistema) y de cómo deseas manejar el proceso.**

```Dockerfile
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielBenjaminPerezMoralesDev13
# Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

# Usa la imagen oficial de Python como base
FROM python:alpine

# Define el puerto en el que escucha el servidor
EXPOSE 80

# HealthCheck para verificar que el servidor responde a peticiones HTTP en el puerto 80
HEALTHCHECK --interval=30s --timeout=5s --retries=3 --start-period=30s \
    CMD curl --silent --fail http://localhost/ || exit 1


CMD sh
```

- **Volvemos a construir la imagen**

```bash
docker build --platform=linux/amd64 --label version="0.1" --label maintainer="Daniel Perez" -td4nitrix13/python-healthcheck -f./Dockerfile.dev --no-cache .
```

```bash
docker build --platform=linux/amd64 --label version="0.1" --label maintainer="Daniel Perez" -td4nitrix13/python-healthcheck -f./Dockerfile.dev --no-cache .
[+] Building 8.3s (6/6) FINISHED                                                                                       docker:default
 => [internal] load build definition from Dockerfile.dev                                                                         0.0s
 => => transferring dockerfile: 708B                                                                                             0.0s
 => [internal] load metadata for docker.io/library/python:alpine                                                                 1.5s
 => [internal] load .dockerignore                                                                                                0.0s
 => => transferring context: 2B                                                                                                  0.0s
 => [1/2] FROM docker.io/library/python:alpine@sha256:b6f01a01e34091438a29b6dda4664199e34731fb2581ebb6fe255a2ebf441099           3.9s
 => => resolve docker.io/library/python:alpine@sha256:b6f01a01e34091438a29b6dda4664199e34731fb2581ebb6fe255a2ebf441099           0.0s
 => => sha256:b6f01a01e34091438a29b6dda4664199e34731fb2581ebb6fe255a2ebf441099 9.02kB / 9.02kB                                   0.0s
 => => sha256:59b935dc28398059a4f8ec346bdbb90917085bfe14c5c673ea5c47fddfeb4110 1.73kB / 1.73kB                                   0.0s
 => => sha256:0a5bfb768070b1903a3e7e2900f9183d0065d820fa3dcfbe3c0dfb6654ebc90a 4.82kB / 4.82kB                                   0.0s
 => => sha256:1f3e46996e2966e4faa5846e56e76e3748b7315e2ded61476c24403d592134f0 3.64MB / 3.64MB                                   1.5s
 => => sha256:8a862d332164437997f94a48a55e4a936dceeefdfe0fd05c46d2c9870a74c07a 458.75kB / 458.75kB                               1.7s
 => => sha256:b112603475e1131289cfe42ace4443b4e764c7b69a7f792d2529cb349fa6c407 12.49MB / 12.49MB                                 3.0s
 => => extracting sha256:1f3e46996e2966e4faa5846e56e76e3748b7315e2ded61476c24403d592134f0                                        0.2s
 => => sha256:b9cdd0abfb159ba8501bec56423ea963db34458b8736d28607431219013b2a17 248B / 248B                                       1.9s
 => => extracting sha256:8a862d332164437997f94a48a55e4a936dceeefdfe0fd05c46d2c9870a74c07a                                        0.1s
 => => extracting sha256:b112603475e1131289cfe42ace4443b4e764c7b69a7f792d2529cb349fa6c407                                        0.8s
 => => extracting sha256:b9cdd0abfb159ba8501bec56423ea963db34458b8736d28607431219013b2a17                                        0.0s
 => [2/2] RUN apk --no-cache add curl && apk add --no-cache tini                                                                 2.7s
 => exporting to image                                                                                                           0.0s
 => => exporting layers                                                                                                          0.0s
 => => writing image sha256:453264cc4fa6e6dcb006a9aa3a69417b53d7653ff52807d76a7a25f64be3508c                                     0.0s
 => => naming to docker.io/d4nitrix13/python-healthcheck                                                                         0.0s

 1 warning found (use docker --debug to expand):
 - JSONArgsRecommended: JSON arguments recommended for CMD to prevent unintended behavior related to OS signals (line 18)
```

### **Ejecución de un contenedor con opciones avanzadas**

#### **Comando utilizado**

```bash
docker run -itu root:root \
  --stop-signal SIGTERM \
  --stop-timeout 10 \
  --network bridge \
  --dns 8.8.8.8 \
  --platform linux/amd64 \
  --label maintainer="Daniel Perez" \
  --expose 80 \
  --publish 80 \
  --privileged \
  --name python-healthcheck \
  d4nitrix13/python-healthcheck
```

---

#### **Explicación detallada del comando**

1. **`-itu root:root`:**
   - **`-i`:** *Mantiene el contenedor interactivo.*
   - **`-t`:** *Asigna una terminal al contenedor.*
   - **`-u root:root`:** *Establece al usuario y grupo `root` como predeterminados dentro del contenedor.*

2. **`--stop-signal SIGTERM`:**
   - *Especifica la señal `SIGTERM` como la utilizada para detener el contenedor de manera controlada.*

3. **`--stop-timeout 10`:**
   - *Define un tiempo de espera de 10 segundos para que los procesos internos se detengan antes de forzar su cierre.*

4. **`--network bridge`:**
   - *Asigna al contenedor la red `bridge`, que es la configuración predeterminada en Docker.*

5. **`--dns 8.8.8.8`:**
   - *Configura el servidor DNS de Google como resolutor de nombres para el contenedor.*

6. **`--platform linux/amd64`:**
   - *Indica que el contenedor debe ejecutarse bajo la plataforma `linux/amd64`, independientemente de la arquitectura del host.*

7. **`--label maintainer="Daniel Perez"`:**
   - *Añade una etiqueta para identificar al mantenedor del contenedor.*

8. **`--expose 80`:**
   - *Expone el puerto 80 del contenedor para que sea accesible internamente.*

9. **`--publish 80`:**
   - *Publica el puerto 80 del contenedor en el host, permitiendo acceso desde el exterior.*

10. **`--privileged`:**
    - *Otorga permisos elevados al contenedor, permitiéndole realizar operaciones con dispositivos o recursos del host.*

11. **`--name python-healthcheck`:**
    - *Nombra al contenedor como `python-healthcheck`.*

12. **`d4nitrix13/python-healthcheck`:**
    - *Especifica la imagen del contenedor a utilizar.*

---

#### **Monitoreo del contenedor con Healthcheck**

1. **Estado inicial:**

   ```bash
   Cada 1.0s: docker ps
   
   CONTAINER ID   IMAGE                           COMMAND                  CREATED         STATUS                     PORTS                                       NAMES
   0085e0e71a36   d4nitrix13/python-healthcheck   "tini -- /bin/sh -c …"   2 minutes ago   Up 15 seconds (health: starting)   0.0.0.0:32769->80/tcp, [::]:32769->80/tcp   python-healthcheck
   ```

   - **`health: starting`:** *Indica que el healthcheck está en la fase de evaluación inicial.*

2. **Cambio de estado tras cumplir el healthcheck:**

   ```bash
   CONTAINER ID   IMAGE                           COMMAND                  CREATED         STATUS                   PORTS                                       NAMES
   0085e0e71a36   d4nitrix13/python-healthcheck   "tini -- /bin/sh -c …"   3 minutes ago   Up 3 minutes (healthy)   0.0.0.0:32769->80/tcp, [::]:32769->80/tcp   python-healthcheck
   ```

   - **`health: healthy`:** *El contenedor ha cumplido con los criterios del healthcheck.*

3. **Simulación de un fallo manual:**
   - **Inicio del servidor HTTP manualmente:**

     ```bash
     python3 -m http.server 80 &>/dev/null &
     ```

   - **Estado del contenedor:**

     ```bash
     CONTAINER ID   IMAGE                           COMMAND                  CREATED         STATUS                   PORTS                                       NAMES
     0085e0e71a36   d4nitrix13/python-healthcheck   "tini -- /bin/sh -c …"   3 minutes ago   Up 3 minutes (healthy)   0.0.0.0:32769->80/tcp, [::]:32769->80/tcp   python-healthcheck
     ```

---

#### **Comandos para gestión de procesos**

1. **Listar procesos dentro del contenedor:**

   ```bash
   ps aux
   ```

   **Salida:**

   ```bash
   PID   USER     TIME  COMMAND
       1 root      0:00 tini -- /bin/sh -c sh
       7 root      0:00 sh
      59 root      0:00 python3 -m http.server 80
     161 root      0:00 ps aux
   ```

2. **Filtrar el proceso del servidor HTTP:**

   ```bash
   ps aux | grep -iEw "python3" | awk 'NR==1' | awk '{print $1}'
   ```

   **Salida:**

   ```bash
   59
   ```

3. **Detener el proceso manualmente:**

   ```bash
   kill -SIGKILL $(ps aux | grep -iEw "python3" | awk 'NR==1' | awk '{print $1}')
   ```

4. **Estado del contenedor tras detener el proceso:**

   ```bash
   Cada 1.0s: docker ps

   CONTAINER ID   IMAGE                           COMMAND                  CREATED         STATUS                     PORTS                                       NAMES
   0085e0e71a36   d4nitrix13/python-healthcheck   "tini -- /bin/sh -c …"   5 minutes ago   Up 5 minutes (unhealthy)   0.0.0.0:32769->80/tcp, [::]:32769->80/tcp   python-healthcheck
   ```

   - **`health: unhealthy`:** *El contenedor ha sido marcado como no saludable debido a la falta del proceso supervisado por el healthcheck.*
