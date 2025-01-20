<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# **Instrucción ONBUILD**

## **¿Qué es ONBUILD, para qué sirve y es recomendable?**

*La instrucción **ONBUILD** en Docker es una directiva que define acciones específicas que se ejecutarán automáticamente en las etapas posteriores del proceso de construcción de imágenes. En términos simples, se utiliza para establecer disparadores que solo se activan cuando otra imagen extiende la imagen base que contiene la instrucción ONBUILD.*

- **¿Para qué sirve?**  
  *Sirve para automatizar configuraciones y acciones que deseas aplicar a imágenes derivadas, como agregar archivos, instalar dependencias adicionales, o realizar configuraciones específicas que no se necesitan en la imagen base.*

- **¿Es recomendable usarla?**  
  *Su uso depende del contexto. Aunque puede ser útil, también introduce complejidad y hace que las dependencias y comportamientos sean menos evidentes en las imágenes derivadas. Es recomendable solo si tienes control total sobre las imágenes que extenderán la base y entiendes bien los efectos secundarios.*

---

## **Ejemplo práctico de Dockerfile con ONBUILD**

### **Creación del archivo Dockerfile**

```bash
touch Dockerfile.onbuild
```

### **Contenido del archivo Dockerfile**

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

# Nota: El comando ADD en Docker no descomprime automáticamente archivos .zip.
# ADD puede manejar archivos .tar, .tar.gz, .tar.bz2, pero no .zip.
ADD --chown=0:0 http://192.168.1.17:3000/project.tar /App/server.sh

# Sintaxis: ONBUILD INSTRUCTION
FROM build AS run
ONBUILD RUN sed -i '1s/.*/#!\/usr\/bin\/env bash -lp/' /App/server.sh
COPY --chown=0:0 --from=0 /App /App
COPY --chown=0:0 --from=0 /usr/bin/wait-for-it /usr/bin/wait-for-it

VOLUME [ "/App" ]
LABEL maintainer="D4nitrix13"

# SHELL requiere que los argumentos estén en formato JSON
SHELL [ "/bin/bash", "-plc" ]

HEALTHCHECK --interval=30s \
    --timeout=30s \
    --start-period=5s \
    --retries=3 \
    CMD [ "wait-for-it", "--host=0.0.0.0", "--port=8080", "--strict", "--timeout=5", "--", "echo", "'Server Up'" ]

STOPSIGNAL SIGTERM
CMD bash /App/server.sh
```

---

## **Construcción de la imagen**

**Para construir la imagen, ejecutamos:**

```bash
docker build -t d4nitrix13/my-app:latest --platform linux/amd64 --pull --no-cache --file ./Dockerfile.onbuild .
```

1. **`-t d4nitrix13/my-app:latest`**  
   - *Esta flag especifica la **etiqueta** o nombre de la imagen que se creará.*
   - *`d4nitrix13/my-app` es el nombre del repositorio y `latest` es la etiqueta o versión de la imagen. Esto permite identificar y organizar fácilmente las imágenes.*

2. **`--platform linux/amd64`**  
   - *Define la arquitectura y el sistema operativo objetivo para la imagen construida.*
   - *En este caso, `linux/amd64` especifica que la imagen será compatible con sistemas operativos Linux de arquitectura x86_64 (64 bits).*
   - *Es útil cuando trabajas en sistemas con diferentes arquitecturas o necesitas construir imágenes multiplataforma.*

3. **`--pull`**  
   - *Fuerza a Docker a obtener la última versión de la imagen base especificada en el Dockerfile desde el registro (por ejemplo, Docker Hub).*
   - *Si no se usa esta flag, Docker puede reutilizar una copia en caché de la imagen base si ya existe localmente.*

4. **`--no-cache`**  
   - *Desactiva el uso de la caché de construcción de Docker.*
   - *Esto asegura que cada instrucción en el Dockerfile se ejecute desde cero, lo que garantiza un proceso de construcción completamente limpio, pero puede aumentar el tiempo de construcción.*

5. **`--file ./Dockerfile.onbuild`**  
   - *Especifica la ubicación del archivo Dockerfile a usar.*
   - *Por defecto, Docker busca un archivo llamado `Dockerfile` en el directorio actual. Con esta flag, se puede indicar un archivo específico, en este caso `Dockerfile.onbuild`.*

6. **`.`**  
   - *Representa el **contexto de construcción**, es decir, el directorio donde Docker buscará los archivos necesarios durante el proceso de construcción.*
   - *Aquí, se utiliza el directorio actual como contexto.*

```bash
docker build -t d4nitrix13/my-app:latest --platform linux/amd64 --pull --no-cache --file ./Dockerfile.onbuild .
[+] Building 8.3s (12/12) FINISHED                                                                                                                                                                                  docker:default
 => [internal] load build definition from Dockerfile.onbuild                                                                                                                                                                  0.0s
 => => transferring dockerfile: 1.28kB                                                                                                                                                                                        0.0s
 => WARN: FromPlatformFlagConstDisallowed: FROM --platform flag should not use constant value "linux/amd64" (line 7)                                                                                                          0.0s
 => [internal] load metadata for docker.io/library/debian:bullseye                                                                                                                                                            0.4s
 => [internal] load .dockerignore                                                                                                                                                                                             0.0s
 => => transferring context: 274B                                                                                                                                                                                             0.0s
 => CACHED [build 1/5] FROM docker.io/library/debian:bullseye@sha256:e5bfb7364038fd100c2faebdd674145bd1bc758a57f3c67023cced99d0eff0f7                                                                                         0.0s
 => CACHED [build 5/5] ADD --chown=0:0 http://192.168.1.17:3000/project.tar /App/server.sh                                                                                                                                    0.1s
 => [build 2/5] RUN [ "apt", "update" ]                                                                                                                                                                                       5.1s
 => [build 3/5] RUN apt install -y wait-for-it                                                                                                                                                                                2.3s
 => [build 4/5] WORKDIR /App                                                                                                                                                                                                  0.0s
 => [build 5/5] ADD --chown=0:0 http://192.168.1.17:3000/project.tar /App/server.sh                                                                                                                                           0.1s
 => [run 1/2] COPY --chown=0:0 --from=0 /App /App                                                                                                                                                                             0.1s
 => [run 2/2] COPY --chown=0:0 --from=0 /usr/bin/wait-for-it /usr/bin/wait-for-it                                                                                                                                             0.0s
 => exporting to image                                                                                                                                                                                                        0.2s
 => => exporting layers                                                                                                                                                                                                       0.2s
 => => writing image sha256:3f45684eae5bc76d22b3fc706a250dcca988bdc37ceae91300dc76c59270f937                                                                                                                                  0.0s
 => => naming to docker.io/d4nitrix13/my-app:latest                                                                                                                                                                           0.0s

 1 warning found (use docker --debug to expand):
 - FromPlatformFlagConstDisallowed: FROM --platform flag should not use constant value "linux/amd64" (line 7)
```

---

## **Inspección de la imagen**

### **Inspección básica**

```bash
docker image inspect d4nitrix13/my-app:latest
```

### **Inspección específica de las instrucciones ONBUILD**

```bash
docker image inspect d4nitrix13/my-app:latest
```

```bash
[
    {
        "Id": "sha256:3f45684eae5bc76d22b3fc706a250dcca988bdc37ceae91300dc76c59270f937",
        "RepoTags": [
            "d4nitrix13/my-app:latest"
        ],
        "RepoDigests": [],
        "Parent": "",
        "Comment": "buildkit.dockerfile.v0",
        "Created": "2025-01-18T21:42:03.131350084-06:00",
        "DockerVersion": "",
        "Author": "",
        "Config": {
            "Hostname": "",
            "Domainname": "",
            "User": "0:0",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "ExposedPorts": {
                "8080/tcp": {}
            },
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "/bin/bash",
                "-plc",
                "bash /App/server.sh"
            ],
            "Healthcheck": {
                "Test": [
                    "CMD",
                    "wait-for-it",
                    "--host=0.0.0.0",
                    "--port=8080",
                    "--strict",
                    "--timeout=5",
                    "--",
                    "echo",
                    "'Server Up'"
                ],
                "Interval": 30000000000,
                "Timeout": 30000000000,
                "StartPeriod": 5000000000,
                "Retries": 3
            },
            "ArgsEscaped": true,
            "Image": "",
            "Volumes": {
                "/App": {}
            },
            "WorkingDir": "/App",
            "Entrypoint": null,
            "OnBuild": [
                "RUN sed -i '1s/.*/#!\\/usr\\/bin\\/env bash -lp/' /App/server.sh"
            ],
            "Labels": {
                "maintainer": "D4nitrix13"
            },
            "StopSignal": "SIGTERM",
            "Shell": [
                "/bin/bash",
                "-plc"
            ]
        },
        "Architecture": "amd64",
        "Os": "linux",
        "Size": 143489160,
        "GraphDriver": {
            "Data": {
                "LowerDir": "/var/lib/docker/overlay2/xgxcbqv95kxduquffuniivd9w/diff:/var/lib/docker/overlay2/6bzxcdhvbs9feukee7s9yf43c/diff:/var/lib/docker/overlay2/rvr6n9ij0141gl96by37eaxu4/diff:/var/lib/docker/overlay2/dby0ypw0tle9s8b7ggtzpa6ep/diff:/var/lib/docker/overlay2/nlj5rokf7uquuluh5egzeljlv/diff:/var/lib/docker/overlay2/dd9d012fcc8878558b049f4ae59b21bfc4a24df44afa9b976a694212fa8aa6cb/diff",
                "MergedDir": "/var/lib/docker/overlay2/vkox6xmb11rdqr4rhp1afb3zi/merged",
                "UpperDir": "/var/lib/docker/overlay2/vkox6xmb11rdqr4rhp1afb3zi/diff",
                "WorkDir": "/var/lib/docker/overlay2/vkox6xmb11rdqr4rhp1afb3zi/work"
            },
            "Name": "overlay2"
        },
        "RootFS": {
            "Type": "layers",
            "Layers": [
                "sha256:2c58b81ad30a8bb3fa66b64a7da4c0b1df9e9677f56f270874ce6226777e7c68",
                "sha256:facd58829efa244aabbe359676732d224a1258c00085e21ac7fe0bf71e828653",
                "sha256:773cdb255e80739539b13a3b6ea2ed848205b6a72c10700ccda0e2f87ff8663f",
                "sha256:71bf13b458b37c90ac006b4ea4cb71a4eed789c0e023c5e95757457cf2ec58a4",
                "sha256:094034b2a0cbf634230881b6caab7a02be29e4415cb4a2384a90eb0f061dc757",
                "sha256:094034b2a0cbf634230881b6caab7a02be29e4415cb4a2384a90eb0f061dc757",
                "sha256:782fe25f711283d9ef9fd130c3f9882d72e1e796d01a5ec7bd988448508b25d7"
            ]
        },
        "Metadata": {
            "LastTagTime": "2025-01-18T21:42:03.364883989-06:00"
        }
    }
]
```

```bash
docker image inspect --format "{{.Config.OnBuild}}" d4nitrix13/my-app:latest
```

**Resultado esperado:**

```bash
[RUN sed -i '1s/.*/#!\/usr\/bin\/env bash -lp/' /App/server.sh]
```
