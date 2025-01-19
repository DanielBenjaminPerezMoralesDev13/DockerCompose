<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***`dockerize`** y **`wait-for-it.sh`** son herramientas útiles para gestionar la sincronización y la espera de que un servicio esté disponible antes de que otro servicio intente conectarse a él, especialmente en el contexto de contenedores Docker*

- *[Foro Unix](https://unix.stackexchange.com/questions/32182/simple-command-line-http-server "https://unix.stackexchange.com/questions/32182/simple-command-line-http-server")*
- *[Foro Stack Overflow](https://stackoverflow.com/questions/16640054/minimal-web-server-using-netcat "https://stackoverflow.com/questions/16640054/minimal-web-server-using-netcat")*

---

## **`dockerize`**

> [!NOTE]
> ***`dockerize`** es una herramienta que ayuda a gestionar dependencias de servicios en contenedores Docker, especialmente para esperar que un servicio esté completamente listo antes de intentar conectarse a él. Es útil cuando tienes múltiples contenedores que dependen unos de otros, como una aplicación que depende de una base de datos, y necesitas asegurarte de que el servicio al que intentas conectarte esté disponible.*

### **Características de `dockerize`**

- **Esperar a que un servicio esté disponible:** *Puedes usar `dockerize` para esperar que un puerto esté disponible antes de continuar con la ejecución de otro contenedor.*
- **Expresión de dependencia:** *Permite expresar dependencias de red, por ejemplo, esperar que un contenedor de base de datos esté disponible en un puerto específico antes de que tu aplicación intente conectarse.*
- **Configuración fácil:** *Es fácil de usar en el fichero `Dockerfile` o `docker-compose.yml`, donde puedes especificar qué puerto o servicio debe estar listo.*

#### **Ejemplo de uso de `dockerize`**

**Imagina que tienes un servicio de MongoDB y quieres asegurarte de que MongoDB esté disponible antes de iniciar tu aplicación:**

```yaml
services:
  mongo-demo:
    image: mongo:latest
    ports:
      - 27017:27017
    environment:
      - MONGO_INITDB_ROOT_USERNAME=admin
      - MONGO_INITDB_ROOT_PASSWORD=supersecret
  app:
    image: my-app:latest
    command: dockerize -wait tcp://mongo-demo:27017 -timeout 30s /start.sh
    depends_on:
      - mongo-demo
```

- *En este ejemplo, el contenedor **`app`** usará `dockerize` para esperar hasta que **MongoDB** esté disponible en el puerto `27017` antes de ejecutar el script de inicio (`/start.sh`).*

---

### **`wait-for-it.sh`**

> [!NOTE]
> ***`wait-for-it.sh`** es un script de shell que espera hasta que un servicio o puerto específico esté disponible antes de ejecutar otro comando. Es muy similar a **`dockerize`**, pero con un enfoque más simple y específico para situaciones en las que necesitas esperar por un servicio en particular.*

- **[Debian Package](https://tracker.debian.org/pkg/wait-for-it "https://tracker.debian.org/pkg/wait-for-it")**

#### **Características de `wait-for-it.sh`**

- **Esperar un puerto:** *Puedes usar `wait-for-it.sh` para esperar que un servicio en un puerto determinado esté disponible antes de continuar con la ejecución de un script o aplicación.*
- **Sencillez:** *Es un script sencillo de usar que puede ser fácilmente integrado en la configuración de Docker.*
- **Control de tiempo de espera:** *Permite definir un tiempo de espera máximo para verificar la disponibilidad del servicio.*

#### **Ejemplo de uso de `wait-for-it.sh`**

- *Si tienes un contenedor que depende de una base de datos MongoDB, puedes usar **`wait-for-it.sh`** para esperar que MongoDB esté listo antes de ejecutar tu aplicación:*

1. *Primero, descargas el script **`wait-for-it.sh`** y lo colocas en tu contenedor o Dockerfile.*
2. *Luego, en tu **docker-compose.yml**:*

```bash
wget https://raw.githubusercontent.com/vishnubob/wait-for-it/refs/heads/master/wait-for-it.sh
```

```bash
wget https://raw.githubusercontent.com/vishnubob/wait-for-it/refs/heads/master/wait-for-it.sh
--2025-01-12 17:30:14--  https://raw.githubusercontent.com/vishnubob/wait-for-it/refs/heads/master/wait-for-it.sh
Resolviendo raw.githubusercontent.com (raw.githubusercontent.com)... 2606:50c0:8000::154, 2606:50c0:8003::154, 2606:50c0:8001::154, ...
Conectando con raw.githubusercontent.com (raw.githubusercontent.com)[2606:50c0:8000::154]:443... conectado.
Petición HTTP enviada, esperando respuesta... 200 OK
Longitud: 5227 (5.1K) [text/plain]
Guardando como: ‘wait-for-it.sh’

wait-for-it.sh             100%[=====================================>]   5.10K  --.-KB/s    en 0.002s  

2025-01-12 17:30:15 (2.69 MB/s) - ‘wait-for-it.sh’ guardado [5227/5227]
```

```yaml
services:
  app:
    build: ./
      
```

```Dockerfile
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielBenjaminPerezMoralesDev13
# Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

ARG tag=bullseye
FROM --platform=linux/amd64 debian:${tag} AS build
RUN [ "apt", "update" ]
RUN apt install -y wait-for-it
EXPOSE 8080/tcp
USER 0:0
WORKDIR /App
# El Comando Add En Docker No Descomprime Automáticamente Los Archivos .zip.
# Aunque Add Puede Descomprimir Automáticamente Archivos .tar, .tar.gz, .tar.bz2, Etc., No Hace Lo Mismo Con Archivos .zip.
ADD --chown=0:0 http://192.168.1.17:3000/project.tar /App/server.sh
# Sintaxis: ONBUILD INSTRUCTION
ONBUILD RUN sed -i '1s/.*/#!\/usr\/bin\/env bash -lp/' /App/server.sh
ARG tag=bullseye
FROM --platform=linux/amd64 debian:${tag} AS run
COPY --chown=0:0 --from=0 /App /App
COPY --chown=0:0 --from=0 /usr/bin/wait-for-it /usr/bin/wait-for-it
VOLUME [ "/App" ]
LABEL maintainer="D4nitrix13"
# SHELL Requires The Arguments To Be In JSON
SHELL [ "/bin/bash", "-plc" ]
HEALTHCHECK --interval=30s \
    --timeout=30s \
    --start-period=5s \
    --retries=3 \
    CMD [ "wait-for-it", "--host=0.0.0.0", "--port=8080", "--strict", "--timeout=5", "--", "echo", "'Server Up'" ]
STOPSIGNAL SIGTERM
CMD bash /App/server.sh
```

- *En este ejemplo, **`wait-for-it.sh`** espera a que el contenedor **`mongo-demo`** esté escuchando en el puerto `27017` antes de ejecutar el script de inicio **`/start.sh`**.*

---

### **Diferencias clave**

*[Github Dockerize](https://github.com/jwilder/dockerize "https://github.com/jwilder/dockerize")*
*[Github Wait For It](https://github.com/vishnubob/wait-for-it "https://github.com/vishnubob/wait-for-it")*

*[Wait For It](https://stackoverflow.com/questions/63198731/how-to-use-wait-for-it-in-docker-compose-file "https://stackoverflow.com/questions/63198731/how-to-use-wait-for-it-in-docker-compose-file")*

- **`dockerize`** *tiene más opciones y funcionalidades, como esperar por servicios TCP, ficheros o HTTP, lo que lo hace más flexible en algunos escenarios.*
- **`wait-for-it.sh`** *es una solución más simple y ligera, ideal si solo necesitas esperar un puerto específico.*

*Ambas herramientas son útiles para evitar problemas de sincronización en contenedores Docker, garantizando que los servicios dependientes estén listos antes de intentar interactuar con ellos.*
