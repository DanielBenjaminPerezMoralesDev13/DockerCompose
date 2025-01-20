<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# *La instrucción `HEALTHCHECK` en Docker soporta tanto **forma exec** como **forma shell**. Sin embargo, usar **forma exec** (corchetes `[ ]`) es generalmente preferido porque es más robusto y seguro, ya que no depende de un intérprete de shell (como `/bin/sh`). Esto evita problemas con caracteres especiales y errores relacionados con el entorno del shell*

**En el caso del ejemplo que proporcionaste, el comando en forma exec tiene un pequeño problema: está intentando usar comillas dentro de las comillas del comando, lo cual no es válido en la forma exec.**

---

## **Forma correcta de usar `HEALTHCHECK` en exec form**

```Dockerfile
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "wait-for-it", "--host=0.0.0.0", "--port=8080", "--strict", "--timeout=5", "--", "echo", "Server Up" ]
```

### **Notas sobre los cambios**

1. **Citas dobles y simples:**
   - *En exec form, no es necesario envolver cadenas con comillas simples `'` porque cada argumento es tratado de forma independiente.*
   - *La cadena `Server Up` se pasa como un solo argumento, sin necesidad de envolturas adicionales.*

2. **Formato general:**
   - *Cada parte del comando se pasa como un elemento separado en el array, asegurando que Docker lo ejecute correctamente como un proceso independiente, sin depender del shell.*

---

### **Forma shell (si es necesaria)**

*Si decides usar la **forma shell**, el comando se ejecutará en un shell (`/bin/sh -c`). En este caso, puedes usar operadores de shell y escribir todo como una cadena:*

```Dockerfile
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD wait-for-it --host=0.0.0.0 --port=8080 --strict --timeout=5 -- echo 'Server Up'
```

#### **Notas sobre shell form**

1. *En la forma shell, puedes usar comillas simples o dobles para manejar cadenas complejas.*
2. *Es menos seguro y más propenso a errores si tienes caracteres especiales o si el intérprete de shell varía.*

---

### **Comparación entre exec form y shell form**

| **Aspecto**           | **Exec form**                                                    | **Shell form**                                 |
| --------------------- | ---------------------------------------------------------------- | ---------------------------------------------- |
| **Seguridad**         | *Más segura, no depende de un shell.*                            | *Menos segura, depende del shell (`/bin/sh`).* |
| **Robustez**          | *Menos propenso a errores por espacios o caracteres especiales.* | *Puede romperse con caracteres especiales.*    |
| **Uso de operadores** | *No soporta operadores de shell (`&&`, `\|\|`, etc.).*           | *Soporta operadores como `&&`, `\|\|`.*        |
| **Rendimiento**       | *Ligero, ya que no invoca un shell adicional.*                   | *Puede ser un poco más pesado.*                |

---

### **Recomendación**

*Usa **exec form** siempre que sea posible, especialmente para comandos simples como el del ejemplo. Solo usa la forma shell si necesitas operadores o funcionalidades específicas del shell.*

---

# **Healthcheck en Docker: Formato Shell y Exec**

## **Creación de archivos Dockerfile**

### **1. Healthcheck en formato Shell**

#### **Archivo: `Dockerfile.healthcheckShellForm`**

**Creamos el archivo:**

```bash
touch Dockerfile.healthcheckShellForm
```

#### **Contenido**

```Dockerfile
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielBenjaminPerezMoralesDev13
# Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

ARG tag=bullseye
FROM --platform=linux/amd64 debian:${tag}

RUN [ "apt", "update" ]
RUN apt install -y wait-for-it

EXPOSE 8080/tcp
USER 0:0
WORKDIR /App
VOLUME [ "/App" ]

# Nota: El comando ADD en Docker no descomprime automáticamente archivos .zip.
# Aunque ADD puede manejar archivos .tar, .tar.gz, .tar.bz2, no hace lo mismo con archivos .zip.
ADD ./project.tar /App/project

LABEL maintainer="D4nitrix13"

# SHELL requiere que los argumentos estén en formato JSON
SHELL [ "/bin/bash", "-plc" ]

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD wait-for-it --host=0.0.0.0 --port=8080 --strict --timeout=5 -- echo 'Server Up'

STOPSIGNAL SIGTERM
CMD "bash"
```

#### **Construcción de la imagen**

```bash
docker build -t d4nitrix13/healthcheck-shell-form -f Dockerfile.healthcheckShellForm .
```

```bash
docker build -t d4nitrix13/healthcheck-shell-form -f Dockerfile.healthcheckShellForm .
[+] Building 1.8s (11/11) FINISHED                                                        docker:default
 => [internal] load build definition from Dockerfile.healthcheckShellForm                           0.0s
 => => transferring dockerfile: 964B                                                                0.0s
 => WARN: FromPlatformFlagConstDisallowed: FROM --platform flag should not use constant value "lin  0.0s
 => [internal] load metadata for docker.io/library/debian:bullseye                                  1.7s
 => [auth] library/debian:pull token for registry-1.docker.io                                       0.0s
 => [internal] load .dockerignore                                                                   0.0s
 => => transferring context: 274B                                                                   0.0s
 => [1/5] FROM docker.io/library/debian:bullseye@sha256:e5bfb7364038fd100c2faebdd674145bd1bc758a57  0.0s
 => [internal] load build context                                                                   0.0s
 => => transferring context: 33B                                                                    0.0s
 => CACHED [2/5] RUN [ "apt", "update" ]                                                            0.0s
 => CACHED [3/5] RUN apt install -y wait-for-it                                                     0.0s
 => CACHED [4/5] WORKDIR /App                                                                       0.0s
 => CACHED [5/5] ADD ./project.tar /App/project                                                     0.0s
 => exporting to image                                                                              0.0s
 => => exporting layers                                                                             0.0s
 => => writing image sha256:7597feceb9e7fa0e47b145d8aea9486db05775f9d7a316f457a64a773a2cd9ae        0.0s
 => => naming to docker.io/d4nitrix13/healthcheck-shell-form                                        0.0s

 1 warning found (use docker --debug to expand):
 - FromPlatformFlagConstDisallowed: FROM --platform flag should not use constant value "linux/amd64" (line 7)
```

#### **Inspección de la imagen**

```bash
docker image inspect -f "{{.Config.Healthcheck}}" d4nitrix13/healthcheck-shell-form:latest
```

#### **Salida esperada**

```bash
{[CMD-SHELL wait-for-it --host=0.0.0.0 --port=8080 --strict --timeout=5 -- echo 'Server Up'] 30s 30s 5s 0s 3}
```

- **Inspección Completa**

```bash
docker image inspect d4nitrix13/healthcheck-shell-form:latest
```

```bash
[
    {
        "Id": "sha256:7597feceb9e7fa0e47b145d8aea9486db05775f9d7a316f457a64a773a2cd9ae",
        "RepoTags": [
            "d4nitrix13/healthcheck-shell-form:latest"
        ],
        "RepoDigests": [],
        "Parent": "",
        "Comment": "buildkit.dockerfile.v0",
        "Created": "2025-01-19T13:24:09.352174176-06:00",
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
                "\"bash\""
            ],
            "Healthcheck": {
                "Test": [
                    "CMD-SHELL",
                    "wait-for-it --host=0.0.0.0 --port=8080 --strict --timeout=5 -- echo 'Server Up'"
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
            "OnBuild": null,
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
        "Size": 143465374,
        "GraphDriver": {
            "Data": {
                "LowerDir": "/var/lib/docker/overlay2/56ady9c3ne2ultssj00mkla3t/diff:/var/lib/docker/overlay2/ygfx8myba3r1lw6rzfmipq9t7/diff:/var/lib/docker/overlay2/47jdugjsqprri2l4vfx6wpn59/diff:/var/lib/docker/overlay2/dd9d012fcc8878558b049f4ae59b21bfc4a24df44afa9b976a694212fa8aa6cb/diff",
                "MergedDir": "/var/lib/docker/overlay2/jkxf4pxdb1pdehumu31gayelf/merged",
                "UpperDir": "/var/lib/docker/overlay2/jkxf4pxdb1pdehumu31gayelf/diff",
                "WorkDir": "/var/lib/docker/overlay2/jkxf4pxdb1pdehumu31gayelf/work"
            },
            "Name": "overlay2"
        },
        "RootFS": {
            "Type": "layers",
            "Layers": [
                "sha256:2c58b81ad30a8bb3fa66b64a7da4c0b1df9e9677f56f270874ce6226777e7c68",
                "sha256:2cb0795d3a56db5670efa9e3be0796b873ee9712c09f9ed9bbdaf5760c18d0ba",
                "sha256:54fa10b1502ce85df4cc5bce9db5538cbb0ea2e4ca651cf9e651bd65afd36131",
                "sha256:08a49390d78e0a9c76c714532dda97ab0fe765a0225f26795bea479f980f6744",
                "sha256:c7c9ce06909c521e7176a4afffa862acaf0cb978756ee8898d1fa3fbd85c0827"
            ]
        },
        "Metadata": {
            "LastTagTime": "2025-01-19T19:52:19.553902996-06:00"
        }
    }
]
```

---

### **2. Healthcheck en formato Exec**

#### **Archivo: `Dockerfile.healthcheck`**

**Creamos el archivo:**

```bash
touch Dockerfile.healthcheck
```

- **Contenido**

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
# Aunque ADD puede manejar archivos .tar, .tar.gz, .tar.bz2, no hace lo mismo con archivos .zip.
ADD --chown=0:0 http://192.168.1.17:3000/project.tar /App/server.sh

# ONBUILD permite agregar instrucciones que se ejecutan en imágenes derivadas.
ONBUILD RUN sed -i '1s/.*/#!\/usr\/bin\/env bash -lp/' /App/server.sh

ARG tag=bullseye
FROM --platform=linux/amd64 debian:${tag} AS run

COPY --chown=0:0 --from=0 /App /App
COPY --chown=0:0 --from=0 /usr/bin/wait-for-it /usr/bin/wait-for-it

VOLUME [ "/App" ]
LABEL maintainer="D4nitrix13"

# SHELL requiere que los argumentos estén en formato JSON
SHELL [ "/bin/bash", "-plc" ]

STOPSIGNAL SIGTERM

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "wait-for-it", "--host=0.0.0.0", "--port=8080", "--strict", "--timeout=5", "--", "echo", "'Server Up'" ]

CMD bash /App/server.sh
```

- **Construcción de la imagen**

```bash
docker build -t d4nitrix13/healthcheck-exec-form -f Dockerfile.healthcheck .
```

```bash
docker build -t d4nitrix13/healthcheck-exec-form -f Dockerfile.healthcheck .
[+] Building 1.8s (12/12) FINISHED                                                                                                          docker:default
 => [internal] load build definition from Dockerfile.healthcheck                                                                                      0.0s
 => => transferring dockerfile: 1.13kB                                                                                                                0.0s
 => WARN: FromPlatformFlagConstDisallowed: FROM --platform flag should not use constant value "linux/amd64" (line 7)                                  0.0s
 => WARN: FromPlatformFlagConstDisallowed: FROM --platform flag should not use constant value "linux/amd64" (line 19)                                 0.0s
 => [internal] load metadata for docker.io/library/debian:bullseye                                                                                    1.0s
 => [internal] load .dockerignore                                                                                                                     0.0s
 => => transferring context: 274B                                                                                                                     0.0s
 => [build 5/5] ADD --chown=0:0 http://192.168.1.17:3000/project.tar /App/server.sh                                                                   0.0s
 => CACHED [build 1/5] FROM docker.io/library/debian:bullseye@sha256:e5bfb7364038fd100c2faebdd674145bd1bc758a57f3c67023cced99d0eff0f7                 0.0s
 => CACHED [build 2/5] RUN [ "apt", "update" ]                                                                                                        0.0s
 => CACHED [build 3/5] RUN apt install -y wait-for-it                                                                                                 0.0s
 => CACHED [build 4/5] WORKDIR /App                                                                                                                   0.0s
 => CACHED [build 5/5] ADD --chown=0:0 http://192.168.1.17:3000/project.tar /App/server.sh                                                            0.0s
 => [run 2/3] COPY --chown=0:0 --from=0 /App /App                                                                                                     0.1s
 => [run 3/3] COPY --chown=0:0 --from=0 /usr/bin/wait-for-it /usr/bin/wait-for-it                                                                     0.1s
 => exporting to image                                                                                                                                0.1s
 => => exporting layers                                                                                                                               0.1s
 => => writing image sha256:e634103514ec885dba3cd2f2d15a12868cdb989c11dcef59a15f2c411b1c9767                                                          0.0s
 => => naming to docker.io/d4nitrix13/healthcheck-exec-form                                                                                           0.0s

 2 warnings found (use docker --debug to expand):
 - FromPlatformFlagConstDisallowed: FROM --platform flag should not use constant value "linux/amd64" (line 7)
 - FromPlatformFlagConstDisallowed: FROM --platform flag should not use constant value "linux/amd64" (line 19)
```

- **Inspección de la imagen**

```bash
docker image inspect -f "{{json .Config.Healthcheck}}" d4nitrix13/healthcheck-exec-form:latest
```

```bash
{"Test":["CMD","wait-for-it","--host=0.0.0.0","--port=8080","--strict","--timeout=5","--","echo","'Server Up'"],"Interval":30000000000,"Timeout":30000000000,"StartPeriod":5000000000,"Retries":3}
```

- **Inspección Completa**

```bash
docker image inspect d4nitrix13/healthcheck-exec-form:latest
```

```json
[
    {
        "Id": "sha256:c9173edec1d1002eb7ba9738443f4c802627f4a07db3f4ae6695d658b850792a",
        "RepoTags": [
            "d4nitrix13/healthcheck-exec-form:latest"
        ],
        "RepoDigests": [],
        "Parent": "",
        "Comment": "buildkit.dockerfile.v0",
        "Created": "2025-01-20T11:35:23.290760627-06:00",
        "DockerVersion": "",
        "Author": "",
        "Config": {
            "Hostname": "",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
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
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
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
        "Size": 124306631,
        "GraphDriver": {
            "Data": {
                "LowerDir": "/var/lib/docker/overlay2/n5g3e3c0r67e2xjmr0dxbrypk/diff:/var/lib/docker/overlay2/dd9d012fcc8878558b049f4ae59b21bfc4a24df44afa9b976a694212fa8aa6cb/diff",
                "MergedDir": "/var/lib/docker/overlay2/kwjqmzrqnl110k4dlcd89rkbt/merged",
                "UpperDir": "/var/lib/docker/overlay2/kwjqmzrqnl110k4dlcd89rkbt/diff",
                "WorkDir": "/var/lib/docker/overlay2/kwjqmzrqnl110k4dlcd89rkbt/work"
            },
            "Name": "overlay2"
        },
        "RootFS": {
            "Type": "layers",
            "Layers": [
                "sha256:2c58b81ad30a8bb3fa66b64a7da4c0b1df9e9677f56f270874ce6226777e7c68",
                "sha256:ea460b2aa8eb9b6de08eabfddc1184ec54967ca782c6142d1430eb85b8fbc61a",
                "sha256:680c171b8b34a014b2c7107bcc9569ccb6c5726d2b97b32bc5c20575f64acaf5"
            ]
        },
        "Metadata": {
            "LastTagTime": "2025-01-20T11:40:31.539698362-06:00"
        }
    }
]
```

---

## **Diferencia entre Formato Shell y Exec**

- **Formato Shell (`CMD-SHELL`):** *El comando se ejecuta como una línea de shell, lo que permite usar construcciones del shell como tuberías o redirecciones. Ejemplo: `CMD-SHELL wait-for-it ...`.*
- **Formato Exec (`CMD`):** *El comando se ejecuta como un array JSON, donde cada argumento se pasa explícitamente sin usar un intérprete de shell. Ejemplo: `["CMD", "wait-for-it", ...]`.*

*El uso de `{{json .Config.Healthcheck}}` en el formato de inspección asegura que la salida del healthcheck se muestre en formato JSON, proporcionando detalles claros sobre los intervalos, tiempos de espera y comandos configurados.*
