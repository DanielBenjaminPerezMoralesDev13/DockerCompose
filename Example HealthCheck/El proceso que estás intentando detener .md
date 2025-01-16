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

```dockerfile
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielBenjaminPerezMoralesDev13
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

docker run -itu root:root --stop-signal SIGTERM --stop-timeout 10 --network bridge --dns 8.8.8.8 --platform linux/amd64 --label maintainer="Daniel Perez" --expose 80 --publish 80 --privileged --name python-healthcheck d4nitrix13/python-healthcheck

Cada 1.0s: docker ps                                                                                                  d4nitrix13-Inspiron-3558: Wed Jan 15 15:28:38 2025

Cada 1.0s: docker ps                                                                                                                                                          d4nitrix13-Inspiron-3558: Wed Jan 15 15:41:01 2025

CONTAINER ID   IMAGE                           COMMAND                  CREATED         STATUS                     PORTS                                       NAMES
0085e0e71a36   d4nitrix13/python-healthcheck   "tini -- /bin/sh -c …"   2 minutes ago   Up 15 seconds (health: starting)   0.0.0.0:32769->80/tcp, [::]:32769->80/tcp   python-healthcheck

Despues de un tiempo vemos el healthcheck se cumplo

Cada 1.0s: docker ps                                                                                                                                                          d4nitrix13-Inspiron-3558: Wed Jan 15 15:41:01 2025

CONTAINER ID   IMAGE                           COMMAND                  CREATED         STATUS                     PORTS                                       NAMES
0085e0e71a36   d4nitrix13/python-healthcheck   "tini -- /bin/sh -c …"   2 minutes ago   Up 2 minutes (unhealthy)   0.0.0.0:32769->80/tcp, [::]:32769->80/tcp   python-healthcheck

iniciamos el contenedor en el shell
python3 -m http.server 80 &>/dev/null &

vemos que el estado cambia

Cada 1.0s: docker ps                                                                                                                                                          d4nitrix13-Inspiron-3558: Wed Jan 15 15:42:20 2025

CONTAINER ID   IMAGE                           COMMAND                  CREATED         STATUS                   PORTS                                       NAMES
0085e0e71a36   d4nitrix13/python-healthcheck   "tini -- /bin/sh -c …"   3 minutes ago   Up 3 minutes (healthy)   0.0.0.0:32769->80/tcp, [::]:32769->80/tcp   python-healthcheck

ps aux
PID   USER     TIME  COMMAND
    1 root      0:00 tini -- /bin/sh -c sh
    7 root      0:00 sh
   59 root      0:00 python3 -m http.server 80
  161 root      0:00 ps aux
/ # ps aux | grep -iEw "python3"
   59 root      0:00 python3 -m http.server 80
  163 root      0:00 grep -iEw python3
/ # ps aux | grep -iEw "python3" | awk 'NR==1'
   59 root      0:00 python3 -m http.server 80
/ # ps aux | grep -iEw "python3" | awk 'NR==1' | awk '{print $1}'
59

kill -SIGKILL $(ps aux | grep -iEw "python3" | awk 'NR==1' | awk '{print $1}')

ps aux
PID   USER     TIME  COMMAND
    1 root      0:00 tini -- /bin/sh -c sh
    7 root      0:00 sh
  187 root      0:00 ps aux

  vemos despues de un tiempo y vemos

  Cada 1.0s: docker ps                                                                                                                                                          d4nitrix13-Inspiron-3558: Wed Jan 15 15:44:16 2025

CONTAINER ID   IMAGE                           COMMAND                  CREATED         STATUS                     PORTS                                       NAMES
0085e0e71a36   d4nitrix13/python-healthcheck   "tini -- /bin/sh -c …"   5 minutes ago   Up 5 minutes (unhealthy)   0.0.0.0:32769->80/tcp, [::]:32769->80/tcp   python-healthcheck
