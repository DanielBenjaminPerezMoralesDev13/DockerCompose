<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# **Explicacion Docker Compose**

## **Explicación detallada del archivo `docker-compose.yaml`**

### **Estructura del archivo**

```yaml
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielBenjaminPerezMoralesDev13
# Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

services:
  base_image:
    build:
      context: ./
      dockerfile: Dockerfile.onbuild
    image: d4nitrix13/base:latest

  app:
    build:
      context: ./
      dockerfile: Dockerfile
    image: d4nitrix13/my-app:1.0.0
    depends_on:
      - base_image
    labels:
      - maintainer=D4nitrix13
    container_name: app-container
    volumes:
      - myvolume:/App:ro
    healthcheck:
      test: ["CMD", "wait-for-it", "--host=0.0.0.0", "--port=8080", "--strict", "--timeout=5", "--", "echo", "'Server Up'"]
      interval: 1m30s
      timeout: 30s
      retries: 5
      start_period: 30s
    stdin_open: true
    tty: true
    command: bash server.sh

volumes:
  myvolume:
```

---

### **Sección de servicios**

#### **1. Servicio `base_image`:**

- **`build`**:
  - **`context`:** *Indica el directorio raíz donde se encuentra el `Dockerfile` y los archivos necesarios para construir la imagen.*
  - **`dockerfile`:** *Especifica el nombre del archivo Dockerfile usado para construir la imagen (`Dockerfile.onbuild`).*
- **`image`:** *Define el nombre y la etiqueta de la imagen construida (`d4nitrix13/base:latest`).*

#### **2. Servicio `app`:**

- **`build`**:
  - **`context`:** *Similar al servicio anterior, se refiere al directorio actual (`./`).*
  - **`dockerfile`:** *Especifica el Dockerfile utilizado para construir este servicio (`Dockerfile`).*
- **`image`:** *Nombre y etiqueta de la imagen construida (`d4nitrix13/my-app:1.0.0`).*
- **`depends_on`:** *Indica que este servicio depende de que `base_image` se haya iniciado primero.*
- **`labels`:** *Agrega metadatos como etiquetas, aquí especifica al mantenedor del servicio.*
- **`container_name`:** *Define un nombre personalizado para el contenedor (`app-container`).*
- **`volumes`:** *Monta un volumen llamado `myvolume` en el directorio `/App` en modo de solo lectura (`:ro`).*
- **`healthcheck`**:
  - **`test`:** *Comando ejecutado para verificar si el contenedor está saludable.*
  - **`interval`:** *Tiempo entre chequeos consecutivos (1 minuto y 30 segundos).*
  - **`timeout`:** *Tiempo máximo para que el healthcheck termine (30 segundos).*
  - **`retries`:** *Número de intentos fallidos antes de marcar el contenedor como `unhealthy`.*
  - **`start_period`:** *Tiempo inicial de espera antes de comenzar a realizar chequeos (30 segundos).*
- **`stdin_open`:** *Mantiene abierto el flujo de entrada estándar para el contenedor.*
- **`tty`:** *Habilita un terminal pseudo-TTY.*
- **`command`:** *Especifica el comando principal que ejecutará el contenedor (`bash server.sh`).*

---

### **Sección de volúmenes**

- **`myvolume`:** *Define un volumen llamado `myvolume`, utilizado para compartir datos entre el host y los contenedores.*

---

### **Comandos explicados**

#### **Construcción y ejecución**

- **Construcción de contenedores:**

  ```bash
  docker compose --project-name project --file docker-compose.yaml create --build --remove-orphans --force-recreate
  ```

- **`--project-name project`:** *Asigna el nombre del proyecto (`project`) a los contenedores y recursos creados.*
- **`--file docker-compose.yaml`:** *Especifica el archivo `docker-compose.yaml` a usar.*
- **`create`:** *Crea los contenedores pero **no los inicia**.*
- **`--build`:** *Fuerza la construcción de las imágenes antes de crear los contenedores.*
- **`--remove-orphans`:** *Elimina cualquier contenedor que no esté definido en el archivo de configuración.*
- **`--force-recreate`:** *Obliga a Docker a recrear los contenedores incluso si ya existen.*

```bash
docker compose --project-name project --file docker-compose.yaml create --build --remove-orphans --force-recreate
[+] Creating 0/0
[+] Creating 0/1image  Building                                                                                                                       0.1s 
[+] Building 1.7s (13/14)                                                                                                                   docker:default 
[+] Building 1.9s (21/21) FINISHED                                                                                                          docker:default
 => [base_image internal] load build definition from Dockerfile.onbuild                                                                               0.0s
 => => transferring dockerfile: 1.28kB                                                                                                                0.0s
 => WARN: FromPlatformFlagConstDisallowed: FROM --platform flag should not use constant value "linux/amd64" (line 7)                                  0.0s
 => [base_image internal] load metadata for docker.io/library/debian:bullseye                                                                         1.6s 
 => [base_image auth] library/debian:pull token for registry-1.docker.io                                                                              0.0s
 => [base_image internal] load .dockerignore                                                                                                          0.0s
 => => transferring context: 274B                                                                                                                     0.0s
 => [base_image build 1/5] FROM docker.io/library/debian:bullseye@sha256:e5bfb7364038fd100c2faebdd674145bd1bc758a57f3c67023cced99d0eff0f7             0.0s 
 => [base_image build 5/5] ADD --chown=0:0 http://192.168.1.17:3000/project.tar /App/server.sh                                                        0.0s 
 => CACHED [base_image build 2/5] RUN [ "apt", "update" ]                                                                                             0.0s
 => CACHED [base_image build 3/5] RUN apt install -y wait-for-it                                                                                      0.0s
 => CACHED [base_image build 4/5] WORKDIR /App                                                                                                        0.0s
 => CACHED [base_image build 5/5] ADD --chown=0:0 http://192.168.1.17:3000/project.tar /App/server.sh                                                 0.0s
 => CACHED [base_image run 1/2] COPY --chown=0:0 --from=0 /App /App                                                                                   0.0s
 => CACHED [base_image run 2/2] COPY --chown=0:0 --from=0 /usr/bin/wait-for-it /usr/bin/wait-for-it                                                   0.0s
 => [base_image] exporting to image                                                                                                                   0.0s
 => => exporting layers                                                                                                                               0.0s
 => => writing image sha256:0bf19672508f8f5b0d11b63a383f28a4059fecfac04893dc049e1e6b7c908a2f                                                          0.0s
 => => naming to docker.io/d4nitrix13/base:latest                                                                                                     0.0s
 => [base_image] resolving provenance for metadata file                                                                                               0.0s
 => [app internal] load build definition from Dockerfile                                                                                              0.0s
 => => transferring dockerfile: 297B                                                                                                                  0.0s
 => [app internal] load metadata for docker.io/d4nitrix13/base:latest                                                                                 0.0s
 => [app internal] load .dockerignore                                                                                                                 0.0s
 => => transferring context: 274B                                                                                                                     0.0s
 => [app 1/1] FROM docker.io/d4nitrix13/base:latest                                                                                                   0.0s
 => CACHED [app 2/2] ONBUILD RUN sed -i '1s/.*/#!\/usr\/bin\/env bash -lp/' /App/server.sh                                                            0.0s
 => [app] exporting to image                                                                                                                          0.0s
 => => exporting layers                                                                                                                               0.0s
[+] Creating 5/4mage sha256:b55d2da9b20b16df3136469e5b4dec46c000517766a86ece0b1b6d58dee3728e                                                          0.0s
 ✔ Service base_image              Built                                                                                                              1.8s 
 ✔ Service app                     Built                                                                                                              0.2s 
 ✔ Network project_default         Created                                                                                                            0.2s 
 ✔ Container project-base_image-1  Created                                                                                                            0.1s 
 ✔ Container app-container         Created                                                                                                            0.0s 
```

- **Construcción y ejecución en un solo paso:**

```bash
docker compose --project-name project --file docker-compose.yaml up --timestamps --build --detach
```

- **`up`:** *Construye las imágenes (si no existen), crea los contenedores y los inicia.*
- **`--timestamps`:** *Muestra marcas de tiempo en los registros.*
- **`--build`:** *Construye las imágenes aunque ya existan previamente.*
- **`--detach`:** *Inicia los contenedores en segundo plano.*

---

### **Comparación de comandos**

- **`docker compose create`:** *Equivalente a `docker container create`. Crea contenedores pero no los inicia.*
- **`docker compose up`:** *Equivalente a `docker container run`. Crea los contenedores (si no existen), los inicia y ejecuta.*

---

### **Otras verificaciones**

1. **Listar servicios con diferentes estados:**

- **Mostrar todos los servicios:**

  ```bash
  docker compose --project-name project ps --all --services
  ```

  Resultado:  

  ```bash
  app
  base_image
  ```

- **Mostrar solo servicios en ejecución:**

  ```bash
  docker compose --project-name project ps --all --services --status running
  ```

  **Resultado:**

  ```bash
  app
  ```

- **Listar proyectos:**

- **Ver estado general de un proyecto:**

  ```bash
  docker compose --project-name project ls
  ```

  **Resultado:**

  ```bash
  NAME                STATUS              CONFIG FILES
  project             running(1)          /home/d4nitrix13/Code/docker-compose.yaml
  ```

- **Ver en formato JSON:**

  ```bash
  docker compose --project-name project ls --all --format json
  ```

  **Resultado:**

  ```json
  [{"Name":"project","Status":"exited(1), running(1)","ConfigFiles":"/home/d4nitrix13/Escritorio/Repository/Docker Compose/Gestionar La Sincronización Y La Espera De Un Servicio/Wait For It/docker-compose.yaml"}]
  ```

  ```json
  [
    {
      "Name": "project",
      "Status": "exited(1), running(1)",
      "ConfigFiles": "/home/d4nitrix13/Code/docker-compose.yaml"
    }
  ]
  ```

---

### **Healthcheck y respuesta del contenedor**

#### **Ejecución de una petición**

```bash
curl -X GET http://172.18.0.3:8080/
```

**Respuesta esperada:**

```html
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Directory listing for /</title>
</head>
<body>
<h1>Directory listing for /</h1>
<hr>
<ul>
<li><a href="server.sh">server.sh</a></li>
</ul>
<hr>
</body>
</html>
```

**Interpretación:**  

- *El contenedor está sirviendo un directorio donde se encuentra el archivo `server.sh`.*
