<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# **Docker Compose Commands (Up, Downk, Start, Stop, Logs)**

```bash
docker compose up --help
```

```bash
docker compose up -h
```

```bash
docker compose up --help

Usage:  docker compose up [OPTIONS] [SERVICE...]

Create and start containers

Options:
      --abort-on-container-exit      Stops all containers if any container was stopped. Incompatible with -d
      --abort-on-container-failure   Stops all containers if any container exited with failure. Incompatible with -d
      --always-recreate-deps         Recreate dependent containers. Incompatible with --no-recreate.
      --attach stringArray           Restrict attaching to the specified services. Incompatible with --attach-dependencies.
      --attach-dependencies          Automatically attach to log output of dependent services
      --build                        Build images before starting containers
  -d, --detach                       Detached mode: Run containers in the background
      --dry-run                      Execute command in dry run mode
      --exit-code-from string        Return the exit code of the selected service container. Implies --abort-on-container-exit
      --force-recreate               Recreate containers even if their configuration and image haven't changed
      --menu                         Enable interactive shortcuts when running attached. Incompatible with --detach. Can also
                                     be enable/disable by setting COMPOSE_MENU environment var.
      --no-attach stringArray        Do not attach (stream logs) to the specified services
      --no-build                     Don't build an image, even if it's policy
      --no-color                     Produce monochrome output
      --no-deps                      Don't start linked services
      --no-log-prefix                Don't print prefix in logs
      --no-recreate                  If containers already exist, don't recreate them. Incompatible with --force-recreate.
      --no-start                     Don't start the services after creating them
      --pull string                  Pull image before running ("always"|"missing"|"never") (default "policy")
      --quiet-pull                   Pull without printing progress information
      --remove-orphans               Remove containers for services not defined in the Compose file
  -V, --renew-anon-volumes           Recreate anonymous volumes instead of retrieving data from the previous containers
      --scale scale                  Scale SERVICE to NUM instances. Overrides the scale setting in the Compose file if present.
  -t, --timeout int                  Use this timeout in seconds for container shutdown when attached or when containers are
                                     already running
      --timestamps                   Show timestamps
      --wait                         Wait for services to be running|healthy. Implies detached mode.
      --wait-timeout int             Maximum duration in seconds to wait for the project to be running|healthy
  -w, --watch                        Watch source code and rebuild/refresh containers when files are updated.
  -y, --y                            Assume "yes" as answer to all prompts and run non-interactively
```

```bash
docker compose -f mongo-services.yaml up --detach --timestamps
```

```bash
docker compose -f mongo-services.yaml up -d -t
```

```bash
docker compose -f mongo-services.yaml up -dt
```

*El comando `docker compose up` se utiliza para iniciar y gestionar un conjunto de servicios definidos en un fichero de configuración `docker-compose.yml` o especificado mediante la opción `-f` con un fichero alternativo (como en el ejemplo, `mongo-services.yaml`).*

## **Detalles del comando:**

1. **`up`:**  
   - *Construye las imágenes (si no están construidas) y las levanta como contenedores según la configuración del fichero especificado.*
   - *También verifica dependencias entre servicios y las ejecuta en el orden adecuado.*

2. **Opción `-d` o `--detach`:**  
   *Ejecuta los contenedores en segundo plano (modo desacoplado). Esto permite que el terminal quede libre para otros comandos mientras los servicios siguen ejecutándose.*

3. **Opción `--timestamps` o `-t`:**  
   *Muestra las marcas de tiempo en los logs que genera el comando. Esto es útil para depuración y análisis.*

4. **Ejemplo del comando completo:**  

   ```bash
   docker compose -f mongo-services.yaml up --detach --timestamps
   ```

   **Este comando:**
   - *Usa el fichero `mongo-services.yaml` para definir los servicios.*
   - *Levanta los servicios en segundo plano (`--detach`).*
   - *Genera los logs con marcas de tiempo (`--timestamps`).*

### **Salida del comando:**

- **La salida del ejemplo muestra que Docker está:**
- **Descargando las imágenes** *requeridas de Docker Hub o de un registro configurado.*
- **Creando y levantando los contenedores** *en base a las configuraciones del fichero.*
- *Cada paso indica si una capa fue descargada o reutilizada, junto con el tiempo tomado.*

- **Aplicación del comando:**
*Este flujo es ideal para entornos de desarrollo o producción donde necesitas levantar varios servicios (como una base de datos MongoDB y una interfaz como Mongo Express) con configuraciones complejas y asegurarte de que todo funciona correctamente en segundo plano.*

```bash
docker compose -f mongo-services.yaml up --detach --timestamps
[+] Running 18/18
 ✔ mongo-express Pulled                                                                                                         19.2s
   ✔ 619be1103602 Pull complete                                                                                                  2.7s
   ✔ 7e9a007eb24b Pull complete                                                                                                 13.5s
   ✔ 5189255e31c8 Pull complete                                                                                                 13.6s
   ✔ 88f4f8a6bc8d Pull complete                                                                                                 13.6s
   ✔ d8305ae32c95 Pull complete                                                                                                 13.7s
   ✔ 45b24ec126f9 Pull complete                                                                                                 13.7s
   ✔ 9f7f59574f7d Pull complete                                                                                                 17.4s
   ✔ 0bf3571b6cd7 Pull complete                                                                                                 17.4s
 ✔ mongo-demo Pulled                                                                                                            60.2s
   ✔ de44b265507a Already exists                                                                                                 0.0s
   ✔ add2cfa32b4d Pull complete                                                                                                  5.9s
   ✔ 0d3422d31c84 Pull complete                                                                                                  9.7s
   ✔ e9869afb5187 Pull complete                                                                                                 11.7s
   ✔ 9284108c06f8 Pull complete                                                                                                 11.7s
   ✔ 17351a831ef1 Pull complete                                                                                                 11.8s
   ✔ 2613644e011d Pull complete                                                                                                 58.0s
   ✔ 05cc0f1cded4 Pull complete                                                                                                 58.1s                                                                    0.7s
```

---

```bash
docker compose down -h
```

```bash
docker compose down --help
```

```bash
docker compose down --help

Usage:  docker compose down [OPTIONS] [SERVICES]

Stop and remove containers, networks

Options:
      --dry-run          Execute command in dry run mode
      --remove-orphans   Remove containers for services not defined in the Compose file
      --rmi string       Remove images used by services. "local" remove only images that don't have a custom tag ("local"|"all")
  -t, --timeout int      Specify a shutdown timeout in seconds
  -v, --volumes          Remove named volumes declared in the "volumes" section of the Compose file and anonymous volumes
                         attached to containers
```

---

### **`docker compose -f mongo-services.yaml down --timeout 10 --volumes --remove-orphans --rmi local`**

#### **Descripción general**

- *Detiene y elimina los contenedores, redes, volúmenes y otras configuraciones asociadas a los servicios definidos en el fichero `mongo-services.yaml`.*

#### **Opciones explicadas**

- **`-f mongo-services.yaml`:**
  *Especifica el fichero de configuración a usar (en este caso, `mongo-services.yaml`).*
  
- **`down`:**
  **Detiene y elimina:**
  - *Contenedores definidos en el fichero.*
  - *Redes creadas automáticamente para conectar estos servicios.*
  - *Otros recursos configurados.*

- **`--timeout 10`:**
  *Tiempo de espera (en segundos) antes de forzar la detención de los contenedores.*
  - *Predeterminado: 10 segundos.*

- **`--volumes`:**
  *Elimina también los volúmenes asociados a los servicios.*
  - *Sin esta opción, los datos persisten en los volúmenes aunque los contenedores se eliminen.*

- **`--remove-orphans`:**
  *Elimina contenedores que no están definidos en el fichero actual pero comparten la red.*

- **`--rmi local`:**
  *Borra las imágenes locales creadas por `docker compose`.*
  - **Valores posibles:**
    - **`local`:** *Borra solo las imágenes construidas localmente (no las descargadas de un registro como Docker Hub).*
    - **`all`:** *Borra todas las imágenes utilizadas en los servicios.*

#### **Ejemplo de salida**

- *Los contenedores y redes se eliminan, y las imágenes locales se eliminan como muestra la salida:*

  ```bash
  ✔ Image mongo:latest          Removed                                                                                           0.2s
  ✔ Image mongo-express:latest  Removed                                                                                           1.0s
  ```

---

### **`docker ps -a`**

- **Descripción general**

**Lista todos los contenedores (activos y detenidos).**

#### **Columnas explicadas**

- **`CONTAINER ID`:**
  *Identificador único del contenedor.*
  
- **`IMAGE`:**
  *Imagen base utilizada para crear el contenedor.*

- **`COMMAND`:**
  *Comando ejecutado dentro del contenedor al iniciarse.*

- **`CREATED`:**
  *Cuándo se creó el contenedor.*

- **`STATUS`:**
  **Estado actual:**
  - **`Up`:** *Contenedor ejecutándose.*
  - **`Exited`:** *Contenedor detenido.*

- **`PORTS`:**
  *Puertos mapeados entre el contenedor y el host.*

- **`NAMES`:**
  *Nombre asignado al contenedor (automático o manual).*

---

### **`docker images -a`**

- **Descripción general**

*Lista todas las imágenes almacenadas localmente, incluyendo las intermedias.*

- **Columnas explicadas**

- **`REPOSITORY`:**
  *Nombre del repositorio al que pertenece la imagen.*

- **`TAG`:**
  *Etiqueta de la versión de la imagen (por ejemplo, `latest`).*

- **`IMAGE ID`:**
  *Identificador único de la imagen.*

- **`CREATED`:**
  *Fecha de creación de la imagen.*

- **`SIZE`:**
  *Tamaño de la imagen en disco.*

---

### **`docker compose -f mongo-services.yaml down --timeout 10 --volumes --remove-orphans --rmi all`**

#### **Diferencia con el primer comando**

- **`--rmi all`:**
  *En lugar de eliminar solo las imágenes locales, borra **todas las imágenes utilizadas** en los servicios, incluidas las descargadas de Docker Hub o un registro.*

---

### **Ejemplo de uso en conjunto**

1. **Levantar servicios:**

   ```bash
   docker compose -f mongo-services.yaml up -d
   ```

2. **Revisar contenedores en ejecución:**

   ```bash
   docker ps
   ```

3. **Revisar imágenes disponibles:**

   ```bash
   docker images -a
   ```

4. **Eliminar servicios, imágenes y recursos asociados:**

   ```bash
   docker compose -f mongo-services.yaml down --timeout 10 --volumes --remove-orphans --rmi all
   ```

```bash
docker compose -f mongo-services.yaml down --timeout 10 --volumes --remove-orphans --rmi local
[+] Running 2/2
 ✔ Image mongo:latest          Removed                                                                                           0.2s
 ✔ Image mongo-express:latest  Removed                                                                                           1.0s
```

```bash
docker ps -a
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```

```bash
docker images -a
REPOSITORY      TAG       IMAGE ID       CREATED         SIZE
mongo           latest    f08e39122805   5 weeks ago     855MB
mongo-express   latest    870141b735e7   10 months ago   182MB
```

```bash
docker compose -f mongo-services.yaml down --timeout 10 --volumes --remove-orphans --rmi all
[+] Running 2/2
 ✔ Image mongo:latest          Removed                                                                                           0.2s
 ✔ Image mongo-express:latest  Removed                                                                                           1.0s
```

---

### **Contenedores y persistencia de datos**

1. **Contenedores como entornos efímeros:**
   - *Los contenedores son entornos ligeros y temporales que ejecutan aplicaciones de forma aislada.*
   - *Por defecto, no guardan datos permanentemente, ya que los datos se almacenan dentro del sistema de ficheros del contenedor.*

2. **Persistencia de datos con volúmenes:**
   - *Si se elimina un contenedor, **los datos almacenados en su sistema de ficheros interno se pierden**.*
   - *Para preservar datos, es necesario configurar **volúmenes**. Estos permiten:*
     - *Montar directorios del host en el contenedor.*
     - *Usar volúmenes administrados por Docker, que son independientes de los contenedores.*
   - *Cuando se detiene o reinicia un contenedor con volúmenes configurados, los datos persisten en esos volúmenes.*

---

### ***Comportamiento de los comandos***

#### **Reiniciar contenedores**

```bash
docker compose -f mongo-services.yaml up --detach --timestamps
```

- **`up`:** *Crea y/o inicia los servicios definidos en el fichero.*
- **`--detach`:** *Corre los contenedores en segundo plano.*
- **`--timestamps`:** *Incluye marcas de tiempo en los logs.*
- **Salida:** *Los servicios están configurados para usar una red (`Network`) y se levantan de forma correcta.*

---

#### **Detener contenedores**

```bash
docker compose -f mongo-services.yaml stop --timeout 10
```

- **`stop`:** *Detiene los contenedores sin eliminarlos. Estos pueden ser reiniciados posteriormente.*
- **`--timeout` o `-t`:**
  - *Especifica el tiempo en segundos para que Docker espere antes de forzar la detención de un contenedor.*
  - *Valor predeterminado: 10 segundos.*

---

#### **Revisar contenedores detenidos**

```bash
docker ps -a
```

- *Muestra **todos los contenedores** (activos y detenidos):*
  - **STATUS:** *Indica si un contenedor está activo (`Up`) o detenido (`Exited`).*
  - **En este caso:**
    - **`Exited (143)`:** *Indica que el contenedor fue detenido manualmente.*
    - **`Exited (0)`:** *Indica que el contenedor terminó normalmente.*

---

#### **Reiniciar contenedores detenidos**

```bash
docker compose -f mongo-services.yaml start
```

- **`start`:**
  - *Reinicia los contenedores que estaban detenidos previamente.*
  - *A diferencia de `up`, no recrea los contenedores ni redes.*
- **Salida:** *Los contenedores se reinician rápidamente porque no requieren configuración adicional.*

---

### **Flujo completo de ejemplo**

1. **Levantar servicios:**

   ```bash
   docker compose -f mongo-services.yaml up --detach
   ```

2. **Verificar estado de los contenedores:**

   ```bash
   docker ps
   ```

3. **Detener servicios:**

   ```bash
   docker compose -f mongo-services.yaml stop --timeout 10
   ```

4. **Revisar contenedores detenidos:**

   ```bash
   docker ps -a
   ```

5. **Reiniciar servicios detenidos:**

   ```bash
   docker compose -f mongo-services.yaml start
   ```

- *Este flujo asegura que puedes detener y reiniciar servicios sin perder datos siempre que uses volúmenes para la persistencia.*

```bash
docker compose -f mongo-services.yaml up --detach --timestamps
[+] Running 3/3
 ✔ Network version4mongoservices_default            Created                                                                      0.1s
 ✔ Container version4mongoservices-mongo-demo-1     Started                                                                      0.5s
 ✔ Container version4mongoservices-mongo-express-1  Started                                                                      0.8s
```

```bash
docker compose -f mongo-services.yaml stop --timeout 10
[+] Stopping 2/2
 ✔ Container version4mongoservices-mongo-express-1  Stopped                                                                      0.2s
 ✔ Container version4mongoservices-mongo-demo-1     Stopped                                                                      0.3s
```

```bash
docker ps -a
CONTAINER ID   IMAGE           COMMAND                  CREATED         STATUS                        PORTS     NAMES
9327c150c71a   mongo-express   "/bin/sh -c 'until n…"   5 minutes ago   Exited (143) 30 seconds ago             version4mongoservices-mongo-express-1
8c08ec298d66   mongo:latest    "docker-entrypoint.s…"   5 minutes ago   Exited (0) 30 seconds ago               version4mongoservices-mongo-demo-1
```

```bash
docker compose -f mongo-services.yaml start
[+] Running 2/2
 ✔ Container version4mongoservices-mongo-demo-1     Started                                                                      0.4s
 ✔ Container version4mongoservices-mongo-express-1  Started                                                                      0.4s
```

```bash
docker compose start --help

Usage:  docker compose start [SERVICE...]

Start services

Options:
      --dry-run   Execute command in dry run mode
```

```bash
docker compose stop --help

Usage:  docker compose stop [OPTIONS] [SERVICE...]

Stop services

Options:
      --dry-run       Execute command in dry run mode
  -t, --timeout int   Specify a shutdown timeout in seconds
```

---

```bash
docker compose logs --help

Usage:  docker compose logs [OPTIONS] [SERVICE...]

View output from containers

Options:
      --dry-run         Execute command in dry run mode
  -f, --follow          Follow log output
      --index int       index of the container if service has multiple replicas
      --no-color        Produce monochrome output
      --no-log-prefix   Don't print prefix in logs
      --since string    Show logs since timestamp (e.g. 2013-01-02T13:23:37Z) or relative (e.g. 42m for 42 minutes)
  -n, --tail string     Number of lines to show from the end of the logs for each container (default "all")
  -t, --timestamps      Show timestamps
      --until string    Show logs before a timestamp (e.g. 2013-01-02T13:23:37Z) or relative (e.g. 42m for 42 minutes)
```

### **Explicación del comando `docker compose logs`**

*El comando `docker compose logs` se utiliza para visualizar los logs generados por los servicios definidos en un fichero de configuración (`docker-compose.yml` o especificado mediante `-f`).*

- **`--tail <n>`:**
  - *Muestra las últimas `n` líneas de logs por servicio.*
  - **Valores posibles:**
    - **`all`:** *Muestra todos los logs desde el inicio.*
    - **`<n>` (un número):** *Muestra solo las últimas `n` líneas.*

- **`--follow`:**
  - **Sigue mostrando los logs en tiempo real a medida que se generan, similar a `tail -f`.**

- **`--timestamps`:**
  - **Incluye marcas de tiempo en cada línea del log, lo cual es útil para análisis cronológicos.**

- **`--since <timestamp>`:**
  - *Muestra los logs generados después de un momento específico.*
  - **Ejemplos de formato:**
    - *Duración relativa:*
      - **`10m`:** *Logs generados en los últimos 10 minutos.*
      - **`2h`:** *Logs generados en las últimas 2 horas.*
      - **`1d`:** *Logs generados en el último día.*
    - *Fecha absoluta:*
      - **`2025-01-12T15:00:00`:** *Logs desde las 3:00 PM UTC del 12 de enero de 2025.*
      - **`2025-01-12`:** *Logs desde la medianoche UTC del 12 de enero de 2025.*

- **`--until <timestamp>`:**
  - *Muestra los logs generados antes de un momento específico.*
  - **Ejemplos de formato:**
    - *Duración relativa:*
      - **`5m`:** *Logs generados hasta hace 5 minutos.*
      - **`3h`:** *Logs generados hasta hace 3 horas.*
      - **`1d`:** *Logs generados hasta hace un día.*
    - *Fecha absoluta:*
      - **`2025-01-12T18:00:00`:** *Logs hasta las 6:00 PM UTC del 12 de enero de 2025.*
      - **`2025-01-11`:** *Logs hasta el final del día (23:59:59 UTC) del 11 de enero de 2025.*

---

### **`docker compose -f mongo-services.yaml logs --tail all --follow --timestamps`**

- **Descripción:** *Muestra **todos los logs** generados por cada servicio desde el inicio y los sigue en tiempo real.*
- **Escenario útil:** *Cuando necesitas monitorear completamente la actividad de los servicios en ejecución.*

```bash
mongo-express-1  | 2025-01-13T01:39:17.850664298Z Waiting For Mongo
mongo-demo-1     | 2025-01-13T01:39:17.612192620Z about to fork child process, waiting until server is ready for connections.
mongo-demo-1     | 2025-01-13T01:39:17.615532252Z forked process: 28
mongo-demo-1     | 2025-01-13T01:39:17.616837611Z
mongo-demo-1     | 2025-01-13T01:39:17.616868778Z {"t":{"$date":"2025-01-13T01:39:17.616+00:00"},"s":"I",  "c":"CONTROL",  "id":20698,   "ctx":"main","msg":"***** SERVER RESTARTED *****"}
mongo-express-1  | 2025-01-13T01:39:18.853414342Z Waiting For Mongo
mongo-express-1  | 2025-01-13T01:39:19.856109242Z Waiting For Mongo
mongo-express-1  | 2025-01-13T01:39:20.859147655Z Waiting For Mongo
mongo-express-1  | 2025-01-13T01:39:21.862758829Z Waiting For Mongo
mongo-express-1  | 2025-01-13T01:39:22.865577957Z Waiting For Mongo
mongo-express-1  | 2025-01-13T01:39:23.878332902Z Waiting For Mongo
mongo-express-1  | 2025-01-13T01:39:24.882393472Z mongo-demo (172.18.0.2:27017) open
mongo-express-1  | 2025-01-13T01:39:24.896238037Z Waiting for mongo-demo:27017...
mongo-express-1  | 2025-01-13T01:39:26.436400465Z No custom config.js found, loading config.default.js
mongo-express-1  | 2025-01-13T01:39:26.437327923Z Welcome to mongo-express 1.0.2
mongo-express-1  | 2025-01-13T01:39:26.437349336Z ------------------------
mongo-express-1  | 2025-01-13T01:39:26.437368615Z
mongo-express-1  | 2025-01-13T01:39:26.437375463Z
mongo-express-1  | 2025-01-13T01:39:26.593021657Z Mongo Express server listening at http://0.0.0.0:8081
mongo-express-1  | 2025-01-13T01:39:26.593961947Z Server is open to allow connections from anyone (0.0.0.0)
mongo-express-1  | 2025-01-13T01:39:26.594037101Z basicAuth credentials are "admin:pass", it is recommended you change this in your config.js!
mongo-express-1  | 2025-01-13T01:47:09.776335531Z Waiting For Mongo
mongo-express-1  | 2025-01-13T01:47:10.780472429Z Waiting For Mongo
mongo-express-1  | 2025-01-13T01:47:11.782689675Z mongo-demo (172.18.0.2:27017) open
mongo-express-1  | 2025-01-13T01:47:11.785687188Z Waiting for mongo-demo:27017...
mongo-express-1  | 2025-01-13T01:47:13.205646278Z No custom config.js found, loading config.default.js
mongo-express-1  | 2025-01-13T01:47:13.207275358Z Welcome to mongo-express 1.0.2
mongo-express-1  | 2025-01-13T01:47:13.207421607Z ------------------------
mongo-express-1  | 2025-01-13T01:47:13.207502348Z
mongo-express-1  | 2025-01-13T01:47:13.207518292Z
mongo-express-1  | 2025-01-13T01:47:13.348787635Z Mongo Express server listening at http://0.0.0.0:8081
mongo-express-1  | 2025-01-13T01:47:13.349744338Z Server is open to allow connections from anyone (0.0.0.0)
mongo-express-1  | 2025-01-13T01:47:13.349798783Z basicAuth credentials are "admin:pass", it is recommended you change this in your config.js!
mongo-demo-1     | 2025-01-13T01:39:17.619068165Z {"t":{"$date":"2025-01-13T01:39:17.618+00:00"},"s":"I",  "c":"CONTROL",  "id":23285,   "ctx":"main","msg":"Automatically disabling TLS 1.0, to force-enable TLS 1.0 specify --sslDisabledProtocols 'none'"}
mongo-demo-1     | 2025-01-13T01:39:17.624968217Z {"t":{"$date":"2025-01-13T01:39:17.624+00:00"},"s":"I",  "c":"CONTROL",  "id":5945603, "ctx":"main","msg":"Multi threading initialized"}
mongo-demo-1     | 2025-01-13T01:39:17.625985044Z {"t":{"$date":"2025-01-13T01:39:17.625+00:00"},"s":"I",  "c":"NETWORK",  "id":4648601, "ctx":"main","msg":"Implicit TCP FastOpen unavailable. If TCP FastOpen is required, set at least one of the related parameters","attr":{"relatedParameters":["tcpFastOpenServer","tcpFastOpenClient","tcpFastOpenQueueSize"]}}
mongo-demo-1     | 2025-01-13T01:39:17.629633539Z {"t":{"$date":"2025-01-13T01:39:17.629+00:00"},"s":"I",  "c":"NETWORK",  "id":4915701, "ctx":"main","msg":"Initialized wire specification","attr":{"spec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":25},"outgoing":{"minWireVersion":6,"maxWireVersion":25},"isInternalClient":true}}}
mongo-demo-1     | 2025-01-13T01:39:17.630529191Z {"t":{"$date":"2025-01-13T01:39:17.630+00:00"},"s":"I",  "c":"TENANT_M", "id":7091600, "ctx":"main","msg":"Starting TenantMigrationAccessBlockerRegistry"}
mongo-demo-1     | 2025-01-13T01:39:17.630774914Z {"t":{"$date":"2025-01-13T01:39:17.630+00:00"},"s":"I",  "c":"CONTROL",  "id":4615611, "ctx":"initandlisten","msg":"MongoDB starting","attr":{"pid":28,"port":27017,"dbPath":"/data/db","architecture":"64-bit","host":"8c08ec298d66"}}
mongo-demo-1     | 2025-01-13T01:39:17.630794998Z {"t":{"$date":"2025-01-13T01:39:17.630+00:00"},"s":"I",  "c":"CONTROL",  "id":23403,   "ctx":"initandlisten","msg":"Build Info","attr":{"buildInfo":{"version":"8.0.4","gitVersion":"bc35ab4305d9920d9d0491c1c9ef9b72383d31f9","openSSLVersion":"OpenSSL 3.0.13 30 Jan 2024","modules":[],"allocator":"tcmalloc-google","environment":{"distmod":"ubuntu2404","distarch":"x86_64","target_arch":"x86_64"}}}}
mongo-demo-1     | 2025-01-13T01:39:17.630854942Z {"t":{"$date":"2025-01-13T01:39:17.630+00:00"},"s":"I",  "c":"CONTROL",  "id":51765,   "ctx":"initandlisten","msg":"Operating System","attr":{"os":{"name":"Ubuntu","version":"24.04"}}}
mongo-demo-1     | 2025-01-13T01:39:17.630864871Z {"t":{"$date":"2025-01-13T01:39:17.630+00:00"},"s":"I",  "c":"CONTROL",  "id":21951,   "ctx":"initandlisten","msg":"Options set by command line","attr":{"options":{"net":{"bindIp":"127.0.0.1","port":27017,"tls":{"mode":"disabled"}},"processManagement":{"fork":true,"pidFilePath":"/tmp/docker-entrypoint-temp-mongod.pid"},"systemLog":{"destination":"file","logAppend":true,"path":"/proc/1/fd/1"}}}}
mongo-demo-1     | 2025-01-13T01:39:17.632297676Z {"t":{"$date":"2025-01-13T01:39:17.632+00:00"},"s":"I",  "c":"STORAGE",  "id":22297,   "ctx":"initandlisten","msg":"Using the XFS filesystem is strongly recommended with the WiredTiger storage engine. See http://dochub.mongodb.org/core/prodnotes-filesystem","tags":["startupWarnings"]}
mongo-demo-1     | 2025-01-13T01:39:17.632416620Z {"t":{"$date":"2025-01-13T01:39:17.632+00:00"},"s":"I",  "c":"STORAGE",  "id":22315,   "ctx":"initandlisten","msg":"Opening WiredTiger","attr":{"config":"create,cache_size=3413M,session_max=33000,eviction=(threads_min=4,threads_max=4),config_base=false,statistics=(fast),log=(enabled=true,remove=true,path=journal,compressor=snappy),builtin_extension_config=(zstd=(compression_level=6)),file_manager=(close_idle_time=600,close_scan_interval=10,close_handle_minimum=2000),statistics_log=(wait=0),json_output=(error,message),verbose=[recovery_progress:1,checkpoint_progress:1,compact_progress:1,backup:0,checkpoint:0,compact:0,evict:0,history_store:0,recovery:0,rts:0,salvage:0,tiered:0,timestamp:0,transaction:0,verify:0,log:0],prefetch=(available=true,default=false),"}}
mongo-demo-1     | 2025-01-13T01:39:18.706517775Z {"t":{"$date":"2025-01-13T01:39:18.706+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732358,"ts_usec":705942,"thread":"28:0x7159553ad680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery log replay has successfully finished and ran for 0 milliseconds"}}}
mongo-demo-1     | 2025-01-13T01:39:18.706622386Z {"t":{"$date":"2025-01-13T01:39:18.706+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732358,"ts_usec":706194,"thread":"28:0x7159553ad680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Set global recovery timestamp: (0, 0)"}}}
mongo-demo-1     | 2025-01-13T01:39:18.706731728Z {"t":{"$date":"2025-01-13T01:39:18.706+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732358,"ts_usec":706364,"thread":"28:0x7159553ad680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Set global oldest timestamp: (0, 0)"}}}
mongo-demo-1     | 2025-01-13T01:39:18.707158559Z {"t":{"$date":"2025-01-13T01:39:18.706+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732358,"ts_usec":706628,"thread":"28:0x7159553ad680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery was completed successfully and took 1ms, including 0ms for the log replay, 0ms for the rollback to stable, and 0ms for the checkpoint."}}}
mongo-demo-1     | 2025-01-13T01:39:18.729721055Z {"t":{"$date":"2025-01-13T01:39:18.729+00:00"},"s":"I",  "c":"STORAGE",  "id":4795906, "ctx":"initandlisten","msg":"WiredTiger opened","attr":{"durationMillis":1097}}
mongo-demo-1     | 2025-01-13T01:39:18.729755635Z {"t":{"$date":"2025-01-13T01:39:18.729+00:00"},"s":"I",  "c":"RECOVERY", "id":23987,   "ctx":"initandlisten","msg":"WiredTiger recoveryTimestamp","attr":{"recoveryTimestamp":{"$timestamp":{"t":0,"i":0}}}}
mongo-demo-1     | 2025-01-13T01:39:18.761114959Z {"t":{"$date":"2025-01-13T01:39:18.760+00:00"},"s":"W",  "c":"CONTROL",  "id":22120,   "ctx":"initandlisten","msg":"Access control is not enabled for the database. Read and write access to data and configuration is unrestricted","tags":["startupWarnings"]}
mongo-demo-1     | 2025-01-13T01:39:18.761427910Z {"t":{"$date":"2025-01-13T01:39:18.761+00:00"},"s":"W",  "c":"CONTROL",  "id":9068900, "ctx":"initandlisten","msg":"For customers running the current memory allocator, we suggest changing the contents of the following sysfsFile","attr":{"allocator":"tcmalloc-google","sysfsFile":"/sys/kernel/mm/transparent_hugepage/enabled","currentValue":"never","desiredValue":"always"},"tags":["startupWarnings"]}
mongo-demo-1     | 2025-01-13T01:39:18.761631352Z {"t":{"$date":"2025-01-13T01:39:18.761+00:00"},"s":"W",  "c":"CONTROL",  "id":9068900, "ctx":"initandlisten","msg":"For customers running the current memory allocator, we suggest changing the contents of the following sysfsFile","attr":{"allocator":"tcmalloc-google","sysfsFile":"/sys/kernel/mm/transparent_hugepage/defrag","currentValue":"madvise","desiredValue":"defer+madvise"},"tags":["startupWarnings"]}
mongo-demo-1     | 2025-01-13T01:39:18.761825243Z {"t":{"$date":"2025-01-13T01:39:18.761+00:00"},"s":"W",  "c":"CONTROL",  "id":8640302, "ctx":"initandlisten","msg":"We suggest setting the contents of sysfsFile to 0.","attr":{"sysfsFile":"/sys/kernel/mm/transparent_hugepage/khugepaged/max_ptes_none","currentValue":511},"tags":["startupWarnings"]}
mongo-demo-1     | 2025-01-13T01:39:18.761998537Z {"t":{"$date":"2025-01-13T01:39:18.761+00:00"},"s":"W",  "c":"CONTROL",  "id":8718500, "ctx":"initandlisten","msg":"Your system has glibc support for rseq built in, which is not yet supported by tcmalloc-google and has critical performance implications. Please set the environment variable GLIBC_TUNABLES=glibc.pthread.rseq=0","tags":["startupWarnings"]}
mongo-demo-1     | 2025-01-13T01:39:18.763638922Z {"t":{"$date":"2025-01-13T01:39:18.762+00:00"},"s":"W",  "c":"NETWORK",  "id":5123300, "ctx":"initandlisten","msg":"vm.max_map_count is too low","attr":{"currentValue":1048576,"recommendedMinimum":1677720,"maxConns":838860},"tags":["startupWarnings"]}
mongo-demo-1     | 2025-01-13T01:39:18.765305480Z {"t":{"$date":"2025-01-13T01:39:18.762+00:00"},"s":"W",  "c":"CONTROL",  "id":8386700, "ctx":"initandlisten","msg":"We suggest setting swappiness to 0 or 1, as swapping can cause performance problems.","attr":{"sysfsFile":"/proc/sys/vm/swappiness","currentValue":60},"tags":["startupWarnings"]}
mongo-demo-1     | 2025-01-13T01:39:18.765333771Z {"t":{"$date":"2025-01-13T01:39:18.762+00:00"},"s":"I",  "c":"STORAGE",  "id":20320,   "ctx":"initandlisten","msg":"createCollection","attr":{"namespace":"admin.system.version","uuidDisposition":"provided","uuid":{"uuid":{"$uuid":"d3e23667-7b14-4a6a-a7f5-ac0c17687173"}},"options":{"uuid":{"$uuid":"d3e23667-7b14-4a6a-a7f5-ac0c17687173"}}}}
mongo-demo-1     | 2025-01-13T01:39:18.792855200Z {"t":{"$date":"2025-01-13T01:39:18.792+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"initandlisten","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"d3e23667-7b14-4a6a-a7f5-ac0c17687173"}},"namespace":"admin.system.version","index":"_id_","ident":"index-1-12399604680041414386","collectionIdent":"collection-0-12399604680041414386","commitTimestamp":null}}
mongo-demo-1     | 2025-01-13T01:39:18.793164310Z {"t":{"$date":"2025-01-13T01:39:18.792+00:00"},"s":"I",  "c":"REPL",     "id":20459,   "ctx":"initandlisten","msg":"Setting featureCompatibilityVersion","attr":{"newVersion":"8.0"}}
mongo-demo-1     | 2025-01-13T01:39:18.793191615Z {"t":{"$date":"2025-01-13T01:39:18.793+00:00"},"s":"I",  "c":"REPL",     "id":5853300, "ctx":"initandlisten","msg":"current featureCompatibilityVersion value","attr":{"featureCompatibilityVersion":"8.0","context":"setFCV"}}
mongo-demo-1     | 2025-01-13T01:39:18.793328242Z {"t":{"$date":"2025-01-13T01:39:18.793+00:00"},"s":"I",  "c":"NETWORK",  "id":4915702, "ctx":"initandlisten","msg":"Updated wire specification","attr":{"oldSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":25},"outgoing":{"minWireVersion":6,"maxWireVersion":25},"isInternalClient":true},"newSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":25,"maxWireVersion":25},"outgoing":{"minWireVersion":25,"maxWireVersion":25},"isInternalClient":true}}}
mongo-demo-1     | 2025-01-13T01:39:18.793591740Z {"t":{"$date":"2025-01-13T01:39:18.793+00:00"},"s":"I",  "c":"NETWORK",  "id":4915702, "ctx":"initandlisten","msg":"Updated wire specification","attr":{"oldSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":25,"maxWireVersion":25},"outgoing":{"minWireVersion":25,"maxWireVersion":25},"isInternalClient":true},"newSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":25,"maxWireVersion":25},"outgoing":{"minWireVersion":25,"maxWireVersion":25},"isInternalClient":true}}}
mongo-demo-1     | 2025-01-13T01:39:18.793612543Z {"t":{"$date":"2025-01-13T01:39:18.793+00:00"},"s":"I",  "c":"REPL",     "id":5853300, "ctx":"initandlisten","msg":"current featureCompatibilityVersion value","attr":{"featureCompatibilityVersion":"8.0","context":"startup"}}
mongo-demo-1     | 2025-01-13T01:39:18.793841985Z {"t":{"$date":"2025-01-13T01:39:18.793+00:00"},"s":"I",  "c":"STORAGE",  "id":5071100, "ctx":"initandlisten","msg":"Clearing temp directory"}
mongo-demo-1     | 2025-01-13T01:39:18.794152440Z {"t":{"$date":"2025-01-13T01:39:18.793+00:00"},"s":"I",  "c":"CONTROL",  "id":6608200, "ctx":"initandlisten","msg":"Initializing cluster server parameters from disk"}
mongo-demo-1     | 2025-01-13T01:39:18.794254042Z {"t":{"$date":"2025-01-13T01:39:18.794+00:00"},"s":"I",  "c":"CONTROL",  "id":20536,   "ctx":"initandlisten","msg":"Flow Control is enabled on this deployment"}
mongo-demo-1     | 2025-01-13T01:39:18.794968255Z {"t":{"$date":"2025-01-13T01:39:18.794+00:00"},"s":"I",  "c":"FTDC",     "id":20625,   "ctx":"initandlisten","msg":"Initializing full-time diagnostic data capture","attr":{"dataDirectory":"/data/db/diagnostic.data"}}
mongo-demo-1     | 2025-01-13T01:39:18.798073471Z {"t":{"$date":"2025-01-13T01:39:18.797+00:00"},"s":"I",  "c":"STORAGE",  "id":20320,   "ctx":"initandlisten","msg":"createCollection","attr":{"namespace":"local.startup_log","uuidDisposition":"generated","uuid":{"uuid":{"$uuid":"7f2b5e5f-f988-4249-88eb-6673c9676239"}},"options":{"capped":true,"size":10485760}}}
mongo-demo-1     | 2025-01-13T01:39:18.824256221Z {"t":{"$date":"2025-01-13T01:39:18.824+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"initandlisten","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"7f2b5e5f-f988-4249-88eb-6673c9676239"}},"namespace":"local.startup_log","index":"_id_","ident":"index-3-12399604680041414386","collectionIdent":"collection-2-12399604680041414386","commitTimestamp":null}}
mongo-demo-1     | 2025-01-13T01:39:18.824319233Z {"t":{"$date":"2025-01-13T01:39:18.824+00:00"},"s":"I",  "c":"REPL",     "id":6015317, "ctx":"initandlisten","msg":"Setting new configuration state","attr":{"newState":"ConfigReplicationDisabled","oldState":"ConfigPreStart"}}
mongo-demo-1     | 2025-01-13T01:39:18.824587019Z {"t":{"$date":"2025-01-13T01:39:18.824+00:00"},"s":"I",  "c":"STORAGE",  "id":22262,   "ctx":"initandlisten","msg":"Timestamp monitor starting"}
mongo-demo-1     | 2025-01-13T01:39:18.824720266Z {"t":{"$date":"2025-01-13T01:39:18.824+00:00"},"s":"I",  "c":"STORAGE",  "id":7333401, "ctx":"initandlisten","msg":"Starting the DiskSpaceMonitor"}
mongo-demo-1     | 2025-01-13T01:39:18.826303054Z {"t":{"$date":"2025-01-13T01:39:18.825+00:00"},"s":"I",  "c":"NETWORK",  "id":23015,   "ctx":"listener","msg":"Listening on","attr":{"address":"/tmp/mongodb-27017.sock"}}
mongo-demo-1     | 2025-01-13T01:39:18.826334156Z {"t":{"$date":"2025-01-13T01:39:18.826+00:00"},"s":"I",  "c":"NETWORK",  "id":23015,   "ctx":"listener","msg":"Listening on","attr":{"address":"127.0.0.1:27017"}}
mongo-demo-1     | 2025-01-13T01:39:18.826346003Z {"t":{"$date":"2025-01-13T01:39:18.826+00:00"},"s":"I",  "c":"NETWORK",  "id":23016,   "ctx":"listener","msg":"Waiting for connections","attr":{"port":27017,"ssl":"off"}}
mongo-demo-1     | 2025-01-13T01:39:18.826629995Z {"t":{"$date":"2025-01-13T01:39:18.826+00:00"},"s":"I",  "c":"CONTROL",  "id":8423403, "ctx":"initandlisten","msg":"mongod startup complete","attr":{"Summary of time elapsed":{"Startup from clean shutdown?":true,"Statistics":{"Set up periodic runner":"0 ms","Set up online certificate status protocol manager":"0 ms","Transport layer setup":"0 ms","Run initial syncer crash recovery":"0 ms","Create storage engine lock file in the data directory":"0 ms","Get metadata describing storage engine":"0 ms","Create storage engine":"1119 ms","Write current PID to file":"0 ms","Write a new metadata for storage engine":"0 ms","Initialize FCV before rebuilding indexes":"0 ms","Drop abandoned idents and get back indexes that need to be rebuilt or builds that need to be restarted":"0 ms","Rebuild indexes for collections":"0 ms","Load cluster parameters from disk for a standalone":"0 ms","Build user and roles graph":"0 ms","Set up the background thread pool responsible for waiting for opTimes to be majority committed":"0 ms","Start up the replication coordinator":"0 ms","Ensure the change stream collections on startup contain consistent data":"0 ms","Write startup options to the audit log":"0 ms","Start transport layer":"1 ms","_initAndListen total elapsed time":"1196 ms"}}}}
mongo-demo-1     | 2025-01-13T01:39:18.827883750Z child process started successfully, parent exiting
mongo-demo-1     | 2025-01-13T01:39:18.829054707Z {"t":{"$date":"2025-01-13T01:39:18.828+00:00"},"s":"I",  "c":"CONTROL",  "id":20712,   "ctx":"LogicalSessionCacheReap","msg":"Sessions collection is not set up; waiting until next sessions reap interval","attr":{"error":"NamespaceNotFound: config.system.sessions does not exist"}}
mongo-demo-1     | 2025-01-13T01:39:18.829379886Z {"t":{"$date":"2025-01-13T01:39:18.829+00:00"},"s":"I",  "c":"STORAGE",  "id":20320,   "ctx":"LogicalSessionCacheRefresh","msg":"createCollection","attr":{"namespace":"config.system.sessions","uuidDisposition":"generated","uuid":{"uuid":{"$uuid":"37979c9b-877b-44b1-9f57-685212874494"}},"options":{}}}
mongo-demo-1     | 2025-01-13T01:39:18.857896792Z {"t":{"$date":"2025-01-13T01:39:18.857+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"LogicalSessionCacheRefresh","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"37979c9b-877b-44b1-9f57-685212874494"}},"namespace":"config.system.sessions","index":"_id_","ident":"index-5-12399604680041414386","collectionIdent":"collection-4-12399604680041414386","commitTimestamp":null}}
mongo-demo-1     | 2025-01-13T01:39:18.857958958Z {"t":{"$date":"2025-01-13T01:39:18.857+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"LogicalSessionCacheRefresh","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"37979c9b-877b-44b1-9f57-685212874494"}},"namespace":"config.system.sessions","index":"lsidTTLIndex","ident":"index-6-12399604680041414386","collectionIdent":"collection-4-12399604680041414386","commitTimestamp":null}}
mongo-demo-1     | 2025-01-13T01:39:19.013482391Z {"t":{"$date":"2025-01-13T01:39:19.013+00:00"},"s":"W",  "c":"CONTROL",  "id":636300,  "ctx":"ftdc","msg":"Use of deprecated server parameter name","attr":{"deprecatedName":"internalQueryCacheSize","canonicalName":"internalQueryCacheMaxEntriesPerCollection"}}
mongo-demo-1     | 2025-01-13T01:39:19.013613048Z {"t":{"$date":"2025-01-13T01:39:19.013+00:00"},"s":"W",  "c":"CONTROL",  "id":636300,  "ctx":"ftdc","msg":"Use of deprecated server parameter name","attr":{"deprecatedName":"oplogSamplingLogIntervalSeconds","canonicalName":"collectionSamplingLogIntervalSeconds"}}
mongo-demo-1     | 2025-01-13T01:39:19.013942333Z {"t":{"$date":"2025-01-13T01:39:19.013+00:00"},"s":"W",  "c":"NETWORK",  "id":23803,   "ctx":"ftdc","msg":"Use of deprecated server parameter 'sslMode', please use 'tlsMode' instead."}
mongo-demo-1     | 2025-01-13T01:39:19.013962911Z {"t":{"$date":"2025-01-13T01:39:19.013+00:00"},"s":"W",  "c":"CONTROL",  "id":636300,  "ctx":"ftdc","msg":"Use of deprecated server parameter name","attr":{"deprecatedName":"wiredTigerConcurrentReadTransactions","canonicalName":"storageEngineConcurrentReadTransactions"}}
mongo-demo-1     | 2025-01-13T01:39:19.013974544Z {"t":{"$date":"2025-01-13T01:39:19.013+00:00"},"s":"W",  "c":"CONTROL",  "id":636300,  "ctx":"ftdc","msg":"Use of deprecated server parameter name","attr":{"deprecatedName":"wiredTigerConcurrentWriteTransactions","canonicalName":"storageEngineConcurrentWriteTransactions"}}
mongo-demo-1     | 2025-01-13T01:39:19.564406383Z {"t":{"$date":"2025-01-13T01:39:19.564+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"127.0.0.1:48600","uuid":{"uuid":{"$uuid":"ba4c43fe-ff99-4c3c-9c04-fa2278d76e0a"}},"connectionId":1,"connectionCount":1}}
mongo-demo-1     | 2025-01-13T01:39:19.572070306Z {"t":{"$date":"2025-01-13T01:39:19.571+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn1","msg":"client metadata","attr":{"remote":"127.0.0.1:48600","client":"conn1","negotiatedCompressors":[],"doc":{"application":{"name":"mongosh 2.3.4"},"driver":{"name":"nodejs|mongosh","version":"6.11.0|2.3.4"},"platform":"Node.js v20.18.1, LE","os":{"name":"linux","architecture":"x64","version":"3.10.0-327.22.2.el7.x86_64","type":"Linux"},"env":{"container":{"runtime":"docker"}}}}}
mongo-demo-1     | 2025-01-13T01:39:19.709113942Z {"t":{"$date":"2025-01-13T01:39:19.708+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn1","msg":"Connection ended","attr":{"remote":"127.0.0.1:48600","uuid":{"uuid":{"$uuid":"ba4c43fe-ff99-4c3c-9c04-fa2278d76e0a"}},"connectionId":1,"connectionCount":0}}
mongo-demo-1     | 2025-01-13T01:39:20.274696774Z {"t":{"$date":"2025-01-13T01:39:20.274+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"127.0.0.1:48604","uuid":{"uuid":{"$uuid":"ec258f83-c48f-4b3e-a389-8ea6da69af49"}},"connectionId":2,"connectionCount":1}}
mongo-demo-1     | 2025-01-13T01:39:20.281572536Z {"t":{"$date":"2025-01-13T01:39:20.281+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn2","msg":"client metadata","attr":{"remote":"127.0.0.1:48604","client":"conn2","negotiatedCompressors":[],"doc":{"application":{"name":"mongosh 2.3.4"},"driver":{"name":"nodejs|mongosh","version":"6.11.0|2.3.4"},"platform":"Node.js v20.18.1, LE","os":{"name":"linux","architecture":"x64","version":"3.10.0-327.22.2.el7.x86_64","type":"Linux"},"env":{"container":{"runtime":"docker"}}}}}
mongo-demo-1     | 2025-01-13T01:39:20.370113593Z {"t":{"$date":"2025-01-13T01:39:20.369+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"127.0.0.1:48616","uuid":{"uuid":{"$uuid":"f6b5a7ba-5936-4d11-8fb4-f87d4ba7eab2"}},"connectionId":3,"connectionCount":2}}
mongo-demo-1     | 2025-01-13T01:39:20.370460508Z {"t":{"$date":"2025-01-13T01:39:20.370+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"127.0.0.1:48626","uuid":{"uuid":{"$uuid":"931482c2-3f9e-493c-b1bb-d4188c1350f3"}},"connectionId":4,"connectionCount":3}}
mongo-demo-1     | 2025-01-13T01:39:20.373295513Z {"t":{"$date":"2025-01-13T01:39:20.372+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn3","msg":"client metadata","attr":{"remote":"127.0.0.1:48616","client":"conn3","negotiatedCompressors":[],"doc":{"application":{"name":"mongosh 2.3.4"},"driver":{"name":"nodejs|mongosh","version":"6.11.0|2.3.4"},"platform":"Node.js v20.18.1, LE","os":{"name":"linux","architecture":"x64","version":"3.10.0-327.22.2.el7.x86_64","type":"Linux"},"env":{"container":{"runtime":"docker"}}}}}
mongo-demo-1     | 2025-01-13T01:39:20.375168073Z {"t":{"$date":"2025-01-13T01:39:20.374+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn4","msg":"client metadata","attr":{"remote":"127.0.0.1:48626","client":"conn4","negotiatedCompressors":[],"doc":{"application":{"name":"mongosh 2.3.4"},"driver":{"name":"nodejs|mongosh","version":"6.11.0|2.3.4"},"platform":"Node.js v20.18.1, LE","os":{"name":"linux","architecture":"x64","version":"3.10.0-327.22.2.el7.x86_64","type":"Linux"},"env":{"container":{"runtime":"docker"}}}}}
mongo-demo-1     | 2025-01-13T01:39:20.380022688Z {"t":{"$date":"2025-01-13T01:39:20.379+00:00"},"s":"I",  "c":"NETWORK",  "id":6788700, "ctx":"conn3","msg":"Received first command on ingress connection since session start or auth handshake","attr":{"elapsedMillis":6}}
mongo-demo-1     | 2025-01-13T01:39:20.380814207Z {"t":{"$date":"2025-01-13T01:39:20.380+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"127.0.0.1:48642","uuid":{"uuid":{"$uuid":"90022798-6c88-4a4d-ad27-7a4dda15bd2b"}},"connectionId":5,"connectionCount":4}}
mongo-demo-1     | 2025-01-13T01:39:20.388309283Z {"t":{"$date":"2025-01-13T01:39:20.388+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn5","msg":"client metadata","attr":{"remote":"127.0.0.1:48642","client":"conn5","negotiatedCompressors":[],"doc":{"application":{"name":"mongosh 2.3.4"},"driver":{"name":"nodejs|mongosh","version":"6.11.0|2.3.4"},"platform":"Node.js v20.18.1, LE","os":{"name":"linux","architecture":"x64","version":"3.10.0-327.22.2.el7.x86_64","type":"Linux"},"env":{"container":{"runtime":"docker"}}}}}
mongo-demo-1     | 2025-01-13T01:39:20.394650298Z {"t":{"$date":"2025-01-13T01:39:20.394+00:00"},"s":"I",  "c":"NETWORK",  "id":6788700, "ctx":"conn5","msg":"Received first command on ingress connection since session start or auth handshake","attr":{"elapsedMillis":6}}
mongo-demo-1     | 2025-01-13T01:39:20.926321483Z admin> ... ... ... ... {"t":{"$date":"2025-01-13T01:39:20.926+00:00"},"s":"I",  "c":"STORAGE",  "id":20320,   "ctx":"conn5","msg":"createCollection","attr":{"namespace":"admin.system.users","uuidDisposition":"generated","uuid":{"uuid":{"$uuid":"db24b4ca-68a1-48cc-b5fd-5a7e2a69e8cf"}},"options":{}}}
mongo-demo-1     | 2025-01-13T01:39:20.957416553Z {"t":{"$date":"2025-01-13T01:39:20.957+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"conn5","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"db24b4ca-68a1-48cc-b5fd-5a7e2a69e8cf"}},"namespace":"admin.system.users","index":"_id_","ident":"index-8-12399604680041414386","collectionIdent":"collection-7-12399604680041414386","commitTimestamp":null}}
mongo-demo-1     | 2025-01-13T01:39:20.957463660Z {"t":{"$date":"2025-01-13T01:39:20.957+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"conn5","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"db24b4ca-68a1-48cc-b5fd-5a7e2a69e8cf"}},"namespace":"admin.system.users","index":"user_1_db_1","ident":"index-9-12399604680041414386","collectionIdent":"collection-7-12399604680041414386","commitTimestamp":null}}
mongo-demo-1     | 2025-01-13T01:39:20.969117132Z { ok: 1 }
mongo-demo-1     | 2025-01-13T01:39:20.974245422Z admin> {"t":{"$date":"2025-01-13T01:39:20.974+00:00"},"s":"I",  "c":"-",        "id":20883,   "ctx":"conn2","msg":"Interrupted operation as its client disconnected","attr":{"opId":14337}}
mongo-demo-1     | 2025-01-13T01:39:20.975706430Z {"t":{"$date":"2025-01-13T01:39:20.974+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn2","msg":"Connection ended","attr":{"remote":"127.0.0.1:48604","uuid":{"uuid":{"$uuid":"ec258f83-c48f-4b3e-a389-8ea6da69af49"}},"connectionId":2,"connectionCount":3}}
mongo-demo-1     | 2025-01-13T01:39:20.975748288Z {"t":{"$date":"2025-01-13T01:39:20.975+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn5","msg":"Connection ended","attr":{"remote":"127.0.0.1:48642","uuid":{"uuid":{"$uuid":"90022798-6c88-4a4d-ad27-7a4dda15bd2b"}},"connectionId":5,"connectionCount":2}}
mongo-demo-1     | 2025-01-13T01:39:20.975761613Z {"t":{"$date":"2025-01-13T01:39:20.975+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn4","msg":"Connection ended","attr":{"remote":"127.0.0.1:48626","uuid":{"uuid":{"$uuid":"931482c2-3f9e-493c-b1bb-d4188c1350f3"}},"connectionId":4,"connectionCount":1}}
mongo-demo-1     | 2025-01-13T01:39:20.976195490Z {"t":{"$date":"2025-01-13T01:39:20.975+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn3","msg":"Connection ended","attr":{"remote":"127.0.0.1:48616","uuid":{"uuid":{"$uuid":"f6b5a7ba-5936-4d11-8fb4-f87d4ba7eab2"}},"connectionId":3,"connectionCount":0}}
mongo-demo-1     | 2025-01-13T01:39:20.998592449Z
mongo-demo-1     | 2025-01-13T01:39:20.998808272Z /usr/local/bin/docker-entrypoint.sh: ignoring /docker-entrypoint-initdb.d/*
mongo-demo-1     | 2025-01-13T01:39:20.998821870Z
mongo-demo-1     | 2025-01-13T01:39:21.049696115Z
mongo-demo-1     | 2025-01-13T01:39:21.049731499Z {"t":{"$date":"2025-01-13T01:39:21.049+00:00"},"s":"I",  "c":"CONTROL",  "id":20698,   "ctx":"main","msg":"***** SERVER RESTARTED *****"}
mongo-demo-1     | 2025-01-13T01:39:21.051012037Z {"t":{"$date":"2025-01-13T01:39:21.050+00:00"},"s":"I",  "c":"CONTROL",  "id":23285,   "ctx":"main","msg":"Automatically disabling TLS 1.0, to force-enable TLS 1.0 specify --sslDisabledProtocols 'none'"}
mongo-demo-1     | 2025-01-13T01:39:21.053143001Z {"t":{"$date":"2025-01-13T01:39:21.052+00:00"},"s":"I",  "c":"CONTROL",  "id":5945603, "ctx":"main","msg":"Multi threading initialized"}
mongo-demo-1     | 2025-01-13T01:39:21.053572590Z {"t":{"$date":"2025-01-13T01:39:21.053+00:00"},"s":"I",  "c":"NETWORK",  "id":4648601, "ctx":"main","msg":"Implicit TCP FastOpen unavailable. If TCP FastOpen is required, set at least one of the related parameters","attr":{"relatedParameters":["tcpFastOpenServer","tcpFastOpenClient","tcpFastOpenQueueSize"]}}
mongo-demo-1     | 2025-01-13T01:39:21.053750738Z {"t":{"$date":"2025-01-13T01:39:21.053+00:00"},"s":"I",  "c":"NETWORK",  "id":4915701, "ctx":"main","msg":"Initialized wire specification","attr":{"spec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":25},"outgoing":{"minWireVersion":6,"maxWireVersion":25},"isInternalClient":true}}}
mongo-demo-1     | 2025-01-13T01:39:21.055845836Z Killing process with pid: 28
mongo-demo-1     | 2025-01-13T01:39:21.055981904Z {"t":{"$date":"2025-01-13T01:39:21.055+00:00"},"s":"I",  "c":"CONTROL",  "id":23377,   "ctx":"SignalHandler","msg":"Received signal","attr":{"signal":15,"error":"Terminated"}}
mongo-demo-1     | 2025-01-13T01:39:21.056003144Z {"t":{"$date":"2025-01-13T01:39:21.055+00:00"},"s":"I",  "c":"CONTROL",  "id":23378,   "ctx":"SignalHandler","msg":"Signal was sent by kill(2)","attr":{"pid":108,"uid":999}}
mongo-demo-1     | 2025-01-13T01:39:21.056013153Z {"t":{"$date":"2025-01-13T01:39:21.055+00:00"},"s":"I",  "c":"CONTROL",  "id":23381,   "ctx":"SignalHandler","msg":"will terminate after current cmd ends"}
mongo-demo-1     | 2025-01-13T01:39:21.056063271Z {"t":{"$date":"2025-01-13T01:39:21.056+00:00"},"s":"I",  "c":"REPL",     "id":4784900, "ctx":"SignalHandler","msg":"Stepping down the ReplicationCoordinator for shutdown","attr":{"waitTimeMillis":15000}}
mongo-demo-1     | 2025-01-13T01:39:21.056231570Z {"t":{"$date":"2025-01-13T01:39:21.056+00:00"},"s":"I",  "c":"REPL",     "id":4794602, "ctx":"SignalHandler","msg":"Attempting to enter quiesce mode"}
mongo-demo-1     | 2025-01-13T01:39:21.056248900Z {"t":{"$date":"2025-01-13T01:39:21.056+00:00"},"s":"I",  "c":"STORAGE",  "id":7333402, "ctx":"SignalHandler","msg":"Shutting down the DiskSpaceMonitor"}
mongo-demo-1     | 2025-01-13T01:39:21.056359828Z {"t":{"$date":"2025-01-13T01:39:21.056+00:00"},"s":"I",  "c":"-",        "id":6371601, "ctx":"SignalHandler","msg":"Shutting down the FLE Crud thread pool"}
mongo-demo-1     | 2025-01-13T01:39:21.056376611Z {"t":{"$date":"2025-01-13T01:39:21.056+00:00"},"s":"I",  "c":"COMMAND",  "id":4784901, "ctx":"SignalHandler","msg":"Shutting down the MirrorMaestro"}
mongo-demo-1     | 2025-01-13T01:39:21.056404716Z {"t":{"$date":"2025-01-13T01:39:21.056+00:00"},"s":"I",  "c":"SHARDING", "id":4784902, "ctx":"SignalHandler","msg":"Shutting down the WaitForMajorityService"}
mongo-demo-1     | 2025-01-13T01:39:21.056782834Z {"t":{"$date":"2025-01-13T01:39:21.056+00:00"},"s":"I",  "c":"CONTROL",  "id":4784903, "ctx":"SignalHandler","msg":"Shutting down the LogicalSessionCache"}
mongo-demo-1     | 2025-01-13T01:39:21.057051227Z {"t":{"$date":"2025-01-13T01:39:21.056+00:00"},"s":"I",  "c":"NETWORK",  "id":8314100, "ctx":"SignalHandler","msg":"Shutdown: Closing listener sockets"}
mongo-demo-1     | 2025-01-13T01:39:21.057129158Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"NETWORK",  "id":23017,   "ctx":"listener","msg":"removing socket file","attr":{"path":"/tmp/mongodb-27017.sock"}}
mongo-demo-1     | 2025-01-13T01:39:21.057273363Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"NETWORK",  "id":4784905, "ctx":"SignalHandler","msg":"Shutting down the global connection pool"}
mongo-demo-1     | 2025-01-13T01:39:21.057288258Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"CONTROL",  "id":4784906, "ctx":"SignalHandler","msg":"Shutting down the FlowControlTicketholder"}
mongo-demo-1     | 2025-01-13T01:39:21.057296288Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"-",        "id":20520,   "ctx":"SignalHandler","msg":"Stopping further Flow Control ticket acquisitions."}
mongo-demo-1     | 2025-01-13T01:39:21.057303501Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"CONTROL",  "id":4784908, "ctx":"SignalHandler","msg":"Shutting down the PeriodicThreadToAbortExpiredTransactions"}
mongo-demo-1     | 2025-01-13T01:39:21.057429133Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"REPL",     "id":4784909, "ctx":"SignalHandler","msg":"Shutting down the ReplicationCoordinator"}
mongo-demo-1     | 2025-01-13T01:39:21.057446146Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"SHARDING", "id":4784910, "ctx":"SignalHandler","msg":"Shutting down the ShardingInitializationMongoD"}
mongo-demo-1     | 2025-01-13T01:39:21.057452824Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"REPL",     "id":4784911, "ctx":"SignalHandler","msg":"Enqueuing the ReplicationStateTransitionLock for shutdown"}
mongo-demo-1     | 2025-01-13T01:39:21.057471640Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"-",        "id":4784912, "ctx":"SignalHandler","msg":"Killing all operations for shutdown"}
mongo-demo-1     | 2025-01-13T01:39:21.057485510Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"-",        "id":4695300, "ctx":"SignalHandler","msg":"Interrupted all currently running operations","attr":{"opsKilled":3}}
mongo-demo-1     | 2025-01-13T01:39:21.057493514Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"TENANT_M", "id":5093807, "ctx":"SignalHandler","msg":"Shutting down all TenantMigrationAccessBlockers on global shutdown"}
mongo-demo-1     | 2025-01-13T01:39:21.057610480Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"ASIO",     "id":22582,   "ctx":"TenantMigrationBlockerNet","msg":"Killing all outstanding egress activity."}
mongo-demo-1     | 2025-01-13T01:39:21.057686557Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"ASIO",     "id":6529201, "ctx":"SignalHandler","msg":"Network interface redundant shutdown","attr":{"state":"Stopped"}}
mongo-demo-1     | 2025-01-13T01:39:21.057720961Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"ASIO",     "id":22582,   "ctx":"SignalHandler","msg":"Killing all outstanding egress activity."}
mongo-demo-1     | 2025-01-13T01:39:21.057733832Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"COMMAND",  "id":4784913, "ctx":"SignalHandler","msg":"Shutting down all open transactions"}
mongo-demo-1     | 2025-01-13T01:39:21.057765592Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"REPL",     "id":4784914, "ctx":"SignalHandler","msg":"Acquiring the ReplicationStateTransitionLock for shutdown"}
mongo-demo-1     | 2025-01-13T01:39:21.057776955Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"INDEX",    "id":4784915, "ctx":"SignalHandler","msg":"Shutting down the IndexBuildsCoordinator"}
mongo-demo-1     | 2025-01-13T01:39:21.057811637Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"NETWORK",  "id":4784918, "ctx":"SignalHandler","msg":"Shutting down the ReplicaSetMonitor"}
mongo-demo-1     | 2025-01-13T01:39:21.057817717Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"SHARDING", "id":4784921, "ctx":"SignalHandler","msg":"Shutting down the MigrationUtilExecutor"}
mongo-demo-1     | 2025-01-13T01:39:21.057976111Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"ASIO",     "id":22582,   "ctx":"MigrationUtil-TaskExecutor","msg":"Killing all outstanding egress activity."}
mongo-demo-1     | 2025-01-13T01:39:21.058026999Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"NETWORK",  "id":20562,   "ctx":"SignalHandler","msg":"Shutdown: Closing open transport sessions"}
mongo-demo-1     | 2025-01-13T01:39:21.058047948Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"NETWORK",  "id":4784923, "ctx":"SignalHandler","msg":"Shutting down the ASIO transport SessionManager"}
mongo-demo-1     | 2025-01-13T01:39:21.058056069Z {"t":{"$date":"2025-01-13T01:39:21.058+00:00"},"s":"I",  "c":"CONTROL",  "id":4784927, "ctx":"SignalHandler","msg":"Shutting down the HealthLog"}
mongo-demo-1     | 2025-01-13T01:39:21.058099399Z {"t":{"$date":"2025-01-13T01:39:21.058+00:00"},"s":"I",  "c":"CONTROL",  "id":4784928, "ctx":"SignalHandler","msg":"Shutting down the TTL monitor"}
mongo-demo-1     | 2025-01-13T01:39:21.058117026Z {"t":{"$date":"2025-01-13T01:39:21.058+00:00"},"s":"I",  "c":"INDEX",    "id":3684100, "ctx":"SignalHandler","msg":"Shutting down TTL collection monitor thread"}
mongo-demo-1     | 2025-01-13T01:39:21.058252543Z {"t":{"$date":"2025-01-13T01:39:21.058+00:00"},"s":"I",  "c":"INDEX",    "id":3684101, "ctx":"SignalHandler","msg":"Finished shutting down TTL collection monitor thread"}
mongo-demo-1     | 2025-01-13T01:39:21.058262239Z {"t":{"$date":"2025-01-13T01:39:21.058+00:00"},"s":"I",  "c":"CONTROL",  "id":6278511, "ctx":"SignalHandler","msg":"Shutting down the Change Stream Expired Pre-images Remover"}
mongo-demo-1     | 2025-01-13T01:39:21.058266591Z {"t":{"$date":"2025-01-13T01:39:21.058+00:00"},"s":"I",  "c":"CONTROL",  "id":4784929, "ctx":"SignalHandler","msg":"Acquiring the global lock for shutdown"}
mongo-demo-1     | 2025-01-13T01:39:21.058270645Z {"t":{"$date":"2025-01-13T01:39:21.058+00:00"},"s":"I",  "c":"CONTROL",  "id":4784930, "ctx":"SignalHandler","msg":"Shutting down the storage engine"}
mongo-demo-1     | 2025-01-13T01:39:21.058286355Z {"t":{"$date":"2025-01-13T01:39:21.058+00:00"},"s":"I",  "c":"STORAGE",  "id":22320,   "ctx":"SignalHandler","msg":"Shutting down journal flusher thread"}
mongo-demo-1     | 2025-01-13T01:39:21.058346168Z {"t":{"$date":"2025-01-13T01:39:21.058+00:00"},"s":"I",  "c":"STORAGE",  "id":22321,   "ctx":"SignalHandler","msg":"Finished shutting down journal flusher thread"}
mongo-demo-1     | 2025-01-13T01:39:21.058355809Z {"t":{"$date":"2025-01-13T01:39:21.058+00:00"},"s":"I",  "c":"STORAGE",  "id":22322,   "ctx":"SignalHandler","msg":"Shutting down checkpoint thread"}
mongo-demo-1     | 2025-01-13T01:39:21.058463398Z {"t":{"$date":"2025-01-13T01:39:21.058+00:00"},"s":"I",  "c":"STORAGE",  "id":22323,   "ctx":"SignalHandler","msg":"Finished shutting down checkpoint thread"}
mongo-demo-1     | 2025-01-13T01:39:21.058476320Z {"t":{"$date":"2025-01-13T01:39:21.058+00:00"},"s":"I",  "c":"STORAGE",  "id":22261,   "ctx":"SignalHandler","msg":"Timestamp monitor shutting down"}
mongo-demo-1     | 2025-01-13T01:39:21.058626828Z {"t":{"$date":"2025-01-13T01:39:21.058+00:00"},"s":"I",  "c":"STORAGE",  "id":20282,   "ctx":"SignalHandler","msg":"Deregistering all the collections"}
mongo-demo-1     | 2025-01-13T01:39:21.058724088Z {"t":{"$date":"2025-01-13T01:39:21.058+00:00"},"s":"I",  "c":"STORAGE",  "id":22317,   "ctx":"SignalHandler","msg":"WiredTigerKVEngine shutting down"}
mongo-demo-1     | 2025-01-13T01:39:21.058736388Z {"t":{"$date":"2025-01-13T01:39:21.058+00:00"},"s":"I",  "c":"STORAGE",  "id":22318,   "ctx":"SignalHandler","msg":"Shutting down session sweeper thread"}
mongo-demo-1     | 2025-01-13T01:39:21.058842571Z {"t":{"$date":"2025-01-13T01:39:21.058+00:00"},"s":"I",  "c":"STORAGE",  "id":22319,   "ctx":"SignalHandler","msg":"Finished shutting down session sweeper thread"}
mongo-demo-1     | 2025-01-13T01:39:21.065281811Z {"t":{"$date":"2025-01-13T01:39:21.065+00:00"},"s":"I",  "c":"STORAGE",  "id":4795902, "ctx":"SignalHandler","msg":"Closing WiredTiger","attr":{"closeConfig":"leak_memory=true,use_timestamp=false,"}}
mongo-demo-1     | 2025-01-13T01:39:21.068232428Z {"t":{"$date":"2025-01-13T01:39:21.068+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"SignalHandler","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732361,"ts_usec":67972,"thread":"28:0x7159552006c0","session_name":"close_ckpt","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 46, snapshot max: 46 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 1"}}}
mongo-demo-1     | 2025-01-13T01:39:21.106726835Z {"t":{"$date":"2025-01-13T01:39:21.106+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"SignalHandler","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732361,"ts_usec":106483,"thread":"28:0x7159552006c0","session_name":"WT_CONNECTION.close","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"shutdown checkpoint has successfully finished and ran for 40 milliseconds"}}}
mongo-demo-1     | 2025-01-13T01:39:21.106906412Z {"t":{"$date":"2025-01-13T01:39:21.106+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"SignalHandler","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732361,"ts_usec":106750,"thread":"28:0x7159552006c0","session_name":"WT_CONNECTION.close","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"shutdown was completed successfully and took 41ms, including 0ms for the rollback to stable, and 40ms for the checkpoint."}}}
mongo-demo-1     | 2025-01-13T01:39:21.125029424Z {"t":{"$date":"2025-01-13T01:39:21.124+00:00"},"s":"I",  "c":"STORAGE",  "id":4795901, "ctx":"SignalHandler","msg":"WiredTiger closed","attr":{"durationMillis":59}}
mongo-demo-1     | 2025-01-13T01:39:21.125063106Z {"t":{"$date":"2025-01-13T01:39:21.124+00:00"},"s":"I",  "c":"STORAGE",  "id":22279,   "ctx":"SignalHandler","msg":"shutdown: removing fs lock..."}
mongo-demo-1     | 2025-01-13T01:39:21.125304699Z {"t":{"$date":"2025-01-13T01:39:21.125+00:00"},"s":"I",  "c":"-",        "id":4784931, "ctx":"SignalHandler","msg":"Dropping the scope cache for shutdown"}
mongo-demo-1     | 2025-01-13T01:39:21.125334021Z {"t":{"$date":"2025-01-13T01:39:21.125+00:00"},"s":"I",  "c":"FTDC",     "id":20626,   "ctx":"SignalHandler","msg":"Shutting down full-time diagnostic data capture"}
mongo-demo-1     | 2025-01-13T01:39:21.130756827Z {"t":{"$date":"2025-01-13T01:39:21.130+00:00"},"s":"I",  "c":"CONTROL",  "id":20565,   "ctx":"SignalHandler","msg":"Now exiting"}
mongo-demo-1     | 2025-01-13T01:39:21.131028990Z {"t":{"$date":"2025-01-13T01:39:21.130+00:00"},"s":"I",  "c":"CONTROL",  "id":8423404, "ctx":"SignalHandler","msg":"mongod shutdown complete","attr":{"Summary of time elapsed":{"Statistics":{"Enter terminal shutdown":"0 ms","Step down the replication coordinator for shutdown":"1 ms","Time spent in quiesce mode":"0 ms","Shut down FLE Crud subsystem":"0 ms","Shut down MirrorMaestro":"0 ms","Shut down WaitForMajorityService":"0 ms","Shut down the logical session cache":"0 ms","Shut down the global connection pool":"0 ms","Shut down the flow control ticket holder":"0 ms","Shut down the thread that aborts expired transactions":"0 ms","Kill all operations for shutdown":"0 ms","Shut down all tenant migration access blockers on global shutdown":"0 ms","Shut down all open transactions":"0 ms","Acquire the RSTL for shutdown":"0 ms","Shut down the IndexBuildsCoordinator and wait for index builds to finish":"0 ms","Shut down the replica set monitor":"0 ms","Shut down the migration util executor":"0 ms","Shut down the transport layer":"0 ms","Shut down the health log":"1 ms","Shut down the TTL monitor":"0 ms","Shut down expired pre-images and documents removers":"0 ms","Shut down the storage engine":"67 ms","Wait for the oplog cap maintainer thread to stop":"0 ms","Shut down full-time data capture":"0 ms","Shut down online certificate status protocol manager":"0 ms","shutdownTask total elapsed time":"75 ms"}}}}
mongo-demo-1     | 2025-01-13T01:39:21.131064353Z {"t":{"$date":"2025-01-13T01:39:21.130+00:00"},"s":"I",  "c":"CONTROL",  "id":23138,   "ctx":"SignalHandler","msg":"Shutting down","attr":{"exitCode":0}}
mongo-demo-1     | 2025-01-13T01:39:22.063670188Z
mongo-demo-1     | 2025-01-13T01:39:22.063725312Z MongoDB init process complete; ready for start up.
mongo-demo-1     | 2025-01-13T01:39:22.063735257Z
mongo-demo-1     | 2025-01-13T01:39:22.119894595Z {"t":{"$date":"2025-01-13T01:39:22.119+00:00"},"s":"I",  "c":"CONTROL",  "id":23285,   "ctx":"main","msg":"Automatically disabling TLS 1.0, to force-enable TLS 1.0 specify --sslDisabledProtocols 'none'"}
mongo-demo-1     | 2025-01-13T01:39:22.122603892Z {"t":{"$date":"2025-01-13T01:39:22.122+00:00"},"s":"I",  "c":"CONTROL",  "id":5945603, "ctx":"main","msg":"Multi threading initialized"}
mongo-demo-1     | 2025-01-13T01:39:22.123019684Z {"t":{"$date":"2025-01-13T01:39:22.122+00:00"},"s":"I",  "c":"NETWORK",  "id":4648601, "ctx":"main","msg":"Implicit TCP FastOpen unavailable. If TCP FastOpen is required, set at least one of the related parameters","attr":{"relatedParameters":["tcpFastOpenServer","tcpFastOpenClient","tcpFastOpenQueueSize"]}}
mongo-demo-1     | 2025-01-13T01:39:22.123167535Z {"t":{"$date":"2025-01-13T01:39:22.123+00:00"},"s":"I",  "c":"NETWORK",  "id":4915701, "ctx":"main","msg":"Initialized wire specification","attr":{"spec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":25},"outgoing":{"minWireVersion":6,"maxWireVersion":25},"isInternalClient":true}}}
mongo-demo-1     | 2025-01-13T01:39:22.125367511Z {"t":{"$date":"2025-01-13T01:39:22.125+00:00"},"s":"I",  "c":"TENANT_M", "id":7091600, "ctx":"main","msg":"Starting TenantMigrationAccessBlockerRegistry"}
mongo-demo-1     | 2025-01-13T01:39:22.125523289Z {"t":{"$date":"2025-01-13T01:39:22.125+00:00"},"s":"I",  "c":"CONTROL",  "id":4615611, "ctx":"initandlisten","msg":"MongoDB starting","attr":{"pid":1,"port":27017,"dbPath":"/data/db","architecture":"64-bit","host":"8c08ec298d66"}}
mongo-demo-1     | 2025-01-13T01:39:22.125543496Z {"t":{"$date":"2025-01-13T01:39:22.125+00:00"},"s":"I",  "c":"CONTROL",  "id":23403,   "ctx":"initandlisten","msg":"Build Info","attr":{"buildInfo":{"version":"8.0.4","gitVersion":"bc35ab4305d9920d9d0491c1c9ef9b72383d31f9","openSSLVersion":"OpenSSL 3.0.13 30 Jan 2024","modules":[],"allocator":"tcmalloc-google","environment":{"distmod":"ubuntu2404","distarch":"x86_64","target_arch":"x86_64"}}}}
mongo-demo-1     | 2025-01-13T01:39:22.125551505Z {"t":{"$date":"2025-01-13T01:39:22.125+00:00"},"s":"I",  "c":"CONTROL",  "id":51765,   "ctx":"initandlisten","msg":"Operating System","attr":{"os":{"name":"Ubuntu","version":"24.04"}}}
mongo-demo-1     | 2025-01-13T01:39:22.125556472Z {"t":{"$date":"2025-01-13T01:39:22.125+00:00"},"s":"I",  "c":"CONTROL",  "id":21951,   "ctx":"initandlisten","msg":"Options set by command line","attr":{"options":{"net":{"bindIp":"*"},"security":{"authorization":"enabled"}}}}
mongo-demo-1     | 2025-01-13T01:39:22.126870068Z {"t":{"$date":"2025-01-13T01:39:22.126+00:00"},"s":"I",  "c":"STORAGE",  "id":22270,   "ctx":"initandlisten","msg":"Storage engine to use detected by data files","attr":{"dbpath":"/data/db","storageEngine":"wiredTiger"}}
mongo-demo-1     | 2025-01-13T01:39:22.126901080Z {"t":{"$date":"2025-01-13T01:39:22.126+00:00"},"s":"I",  "c":"STORAGE",  "id":22297,   "ctx":"initandlisten","msg":"Using the XFS filesystem is strongly recommended with the WiredTiger storage engine. See http://dochub.mongodb.org/core/prodnotes-filesystem","tags":["startupWarnings"]}
mongo-demo-1     | 2025-01-13T01:39:22.126964299Z {"t":{"$date":"2025-01-13T01:39:22.126+00:00"},"s":"I",  "c":"STORAGE",  "id":22315,   "ctx":"initandlisten","msg":"Opening WiredTiger","attr":{"config":"create,cache_size=3413M,session_max=33000,eviction=(threads_min=4,threads_max=4),config_base=false,statistics=(fast),log=(enabled=true,remove=true,path=journal,compressor=snappy),builtin_extension_config=(zstd=(compression_level=6)),file_manager=(close_idle_time=600,close_scan_interval=10,close_handle_minimum=2000),statistics_log=(wait=0),json_output=(error,message),verbose=[recovery_progress:1,checkpoint_progress:1,compact_progress:1,backup:0,checkpoint:0,compact:0,evict:0,history_store:0,recovery:0,rts:0,salvage:0,tiered:0,timestamp:0,transaction:0,verify:0,log:0],prefetch=(available=true,default=false),"}}
mongo-demo-1     | 2025-01-13T01:39:23.148273662Z {"t":{"$date":"2025-01-13T01:39:23.148+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732363,"ts_usec":148065,"thread":"1:0x7778107d5680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Recovering log 1 through 2"}}}
mongo-demo-1     | 2025-01-13T01:39:23.289393865Z {"t":{"$date":"2025-01-13T01:39:23.289+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732363,"ts_usec":289153,"thread":"1:0x7778107d5680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Recovering log 2 through 2"}}}
mongo-demo-1     | 2025-01-13T01:39:23.468316785Z {"t":{"$date":"2025-01-13T01:39:23.466+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732363,"ts_usec":466489,"thread":"1:0x7778107d5680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Main recovery loop: starting at 1/32128 to 2/256"}}}
mongo-demo-1     | 2025-01-13T01:39:23.646895829Z {"t":{"$date":"2025-01-13T01:39:23.646+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732363,"ts_usec":646625,"thread":"1:0x7778107d5680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Recovering log 1 through 2"}}}
mongo-demo-1     | 2025-01-13T01:39:23.763415789Z {"t":{"$date":"2025-01-13T01:39:23.763+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732363,"ts_usec":763191,"thread":"1:0x7778107d5680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Recovering log 2 through 2"}}}
mongo-demo-1     | 2025-01-13T01:39:23.874499745Z {"t":{"$date":"2025-01-13T01:39:23.873+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732363,"ts_usec":873855,"thread":"1:0x7778107d5680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery log replay has successfully finished and ran for 726 milliseconds"}}}
mongo-demo-1     | 2025-01-13T01:39:23.874561028Z {"t":{"$date":"2025-01-13T01:39:23.874+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732363,"ts_usec":874140,"thread":"1:0x7778107d5680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Set global recovery timestamp: (0, 0)"}}}
mongo-demo-1     | 2025-01-13T01:39:23.874597206Z {"t":{"$date":"2025-01-13T01:39:23.874+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732363,"ts_usec":874284,"thread":"1:0x7778107d5680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Set global oldest timestamp: (0, 0)"}}}
mongo-demo-1     | 2025-01-13T01:39:23.879005147Z {"t":{"$date":"2025-01-13T01:39:23.878+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732363,"ts_usec":878737,"thread":"1:0x7778107d5680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery rollback to stable has successfully finished and ran for 4 milliseconds"}}}
mongo-demo-1     | 2025-01-13T01:39:23.888416253Z {"t":{"$date":"2025-01-13T01:39:23.888+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732363,"ts_usec":888171,"thread":"1:0x7778107d5680","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 1, snapshot max: 1 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 7"}}}
mongo-demo-1     | 2025-01-13T01:39:23.908699915Z {"t":{"$date":"2025-01-13T01:39:23.907+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732363,"ts_usec":907551,"thread":"1:0x7778107d5680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery checkpoint has successfully finished and ran for 27 milliseconds"}}}
mongo-demo-1     | 2025-01-13T01:39:23.908858648Z {"t":{"$date":"2025-01-13T01:39:23.908+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732363,"ts_usec":908004,"thread":"1:0x7778107d5680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery was completed successfully and took 760ms, including 726ms for the log replay, 4ms for the rollback to stable, and 27ms for the checkpoint."}}}
mongo-demo-1     | 2025-01-13T01:39:23.915465290Z {"t":{"$date":"2025-01-13T01:39:23.915+00:00"},"s":"I",  "c":"STORAGE",  "id":4795906, "ctx":"initandlisten","msg":"WiredTiger opened","attr":{"durationMillis":1789}}
mongo-demo-1     | 2025-01-13T01:39:23.915511768Z {"t":{"$date":"2025-01-13T01:39:23.915+00:00"},"s":"I",  "c":"RECOVERY", "id":23987,   "ctx":"initandlisten","msg":"WiredTiger recoveryTimestamp","attr":{"recoveryTimestamp":{"$timestamp":{"t":0,"i":0}}}}
mongo-demo-1     | 2025-01-13T01:39:23.932575610Z {"t":{"$date":"2025-01-13T01:39:23.932+00:00"},"s":"W",  "c":"CONTROL",  "id":9068900, "ctx":"initandlisten","msg":"For customers running the current memory allocator, we suggest changing the contents of the following sysfsFile","attr":{"allocator":"tcmalloc-google","sysfsFile":"/sys/kernel/mm/transparent_hugepage/enabled","currentValue":"never","desiredValue":"always"},"tags":["startupWarnings"]}
mongo-demo-1     | 2025-01-13T01:39:23.932615358Z {"t":{"$date":"2025-01-13T01:39:23.932+00:00"},"s":"W",  "c":"CONTROL",  "id":9068900, "ctx":"initandlisten","msg":"For customers running the current memory allocator, we suggest changing the contents of the following sysfsFile","attr":{"allocator":"tcmalloc-google","sysfsFile":"/sys/kernel/mm/transparent_hugepage/defrag","currentValue":"madvise","desiredValue":"defer+madvise"},"tags":["startupWarnings"]}
mongo-demo-1     | 2025-01-13T01:39:23.932678128Z {"t":{"$date":"2025-01-13T01:39:23.932+00:00"},"s":"W",  "c":"CONTROL",  "id":8640302, "ctx":"initandlisten","msg":"We suggest setting the contents of sysfsFile to 0.","attr":{"sysfsFile":"/sys/kernel/mm/transparent_hugepage/khugepaged/max_ptes_none","currentValue":511},"tags":["startupWarnings"]}
mongo-demo-1     | 2025-01-13T01:39:23.932688193Z {"t":{"$date":"2025-01-13T01:39:23.932+00:00"},"s":"W",  "c":"CONTROL",  "id":8718500, "ctx":"initandlisten","msg":"Your system has glibc support for rseq built in, which is not yet supported by tcmalloc-google and has critical performance implications. Please set the environment variable GLIBC_TUNABLES=glibc.pthread.rseq=0","tags":["startupWarnings"]}
mongo-demo-1     | 2025-01-13T01:39:23.932695600Z {"t":{"$date":"2025-01-13T01:39:23.932+00:00"},"s":"W",  "c":"NETWORK",  "id":5123300, "ctx":"initandlisten","msg":"vm.max_map_count is too low","attr":{"currentValue":1048576,"recommendedMinimum":1677720,"maxConns":838860},"tags":["startupWarnings"]}
mongo-demo-1     | 2025-01-13T01:39:23.932962709Z {"t":{"$date":"2025-01-13T01:39:23.932+00:00"},"s":"W",  "c":"CONTROL",  "id":8386700, "ctx":"initandlisten","msg":"We suggest setting swappiness to 0 or 1, as swapping can cause performance problems.","attr":{"sysfsFile":"/proc/sys/vm/swappiness","currentValue":60},"tags":["startupWarnings"]}
mongo-demo-1     | 2025-01-13T01:39:23.940939266Z {"t":{"$date":"2025-01-13T01:39:23.940+00:00"},"s":"I",  "c":"NETWORK",  "id":4915702, "ctx":"initandlisten","msg":"Updated wire specification","attr":{"oldSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":25},"outgoing":{"minWireVersion":6,"maxWireVersion":25},"isInternalClient":true},"newSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":25,"maxWireVersion":25},"outgoing":{"minWireVersion":25,"maxWireVersion":25},"isInternalClient":true}}}
mongo-demo-1     | 2025-01-13T01:39:23.940981640Z {"t":{"$date":"2025-01-13T01:39:23.940+00:00"},"s":"I",  "c":"REPL",     "id":5853300, "ctx":"initandlisten","msg":"current featureCompatibilityVersion value","attr":{"featureCompatibilityVersion":"8.0","context":"startup"}}
mongo-demo-1     | 2025-01-13T01:39:23.941113681Z {"t":{"$date":"2025-01-13T01:39:23.940+00:00"},"s":"I",  "c":"STORAGE",  "id":5071100, "ctx":"initandlisten","msg":"Clearing temp directory"}
mongo-demo-1     | 2025-01-13T01:39:23.943199266Z {"t":{"$date":"2025-01-13T01:39:23.943+00:00"},"s":"I",  "c":"CONTROL",  "id":6608200, "ctx":"initandlisten","msg":"Initializing cluster server parameters from disk"}
mongo-demo-1     | 2025-01-13T01:39:23.943370577Z {"t":{"$date":"2025-01-13T01:39:23.943+00:00"},"s":"I",  "c":"CONTROL",  "id":20536,   "ctx":"initandlisten","msg":"Flow Control is enabled on this deployment"}
mongo-demo-1     | 2025-01-13T01:39:23.943710565Z {"t":{"$date":"2025-01-13T01:39:23.943+00:00"},"s":"I",  "c":"FTDC",     "id":20625,   "ctx":"initandlisten","msg":"Initializing full-time diagnostic data capture","attr":{"dataDirectory":"/data/db/diagnostic.data"}}
mongo-demo-1     | 2025-01-13T01:39:23.947013462Z {"t":{"$date":"2025-01-13T01:39:23.946+00:00"},"s":"I",  "c":"REPL",     "id":6015317, "ctx":"initandlisten","msg":"Setting new configuration state","attr":{"newState":"ConfigReplicationDisabled","oldState":"ConfigPreStart"}}
mongo-demo-1     | 2025-01-13T01:39:23.947208629Z {"t":{"$date":"2025-01-13T01:39:23.947+00:00"},"s":"I",  "c":"STORAGE",  "id":22262,   "ctx":"initandlisten","msg":"Timestamp monitor starting"}
mongo-demo-1     | 2025-01-13T01:39:23.947443417Z {"t":{"$date":"2025-01-13T01:39:23.947+00:00"},"s":"I",  "c":"STORAGE",  "id":7333401, "ctx":"initandlisten","msg":"Starting the DiskSpaceMonitor"}
mongo-demo-1     | 2025-01-13T01:39:23.948943065Z {"t":{"$date":"2025-01-13T01:39:23.948+00:00"},"s":"I",  "c":"NETWORK",  "id":23015,   "ctx":"listener","msg":"Listening on","attr":{"address":"/tmp/mongodb-27017.sock"}}
mongo-demo-1     | 2025-01-13T01:39:23.949042448Z {"t":{"$date":"2025-01-13T01:39:23.948+00:00"},"s":"I",  "c":"NETWORK",  "id":23015,   "ctx":"listener","msg":"Listening on","attr":{"address":"0.0.0.0:27017"}}
mongo-demo-1     | 2025-01-13T01:39:23.949055295Z {"t":{"$date":"2025-01-13T01:39:23.948+00:00"},"s":"I",  "c":"NETWORK",  "id":23016,   "ctx":"listener","msg":"Waiting for connections","attr":{"port":27017,"ssl":"off"}}
mongo-demo-1     | 2025-01-13T01:39:23.949215676Z {"t":{"$date":"2025-01-13T01:39:23.949+00:00"},"s":"I",  "c":"CONTROL",  "id":8423403, "ctx":"initandlisten","msg":"mongod startup complete","attr":{"Summary of time elapsed":{"Startup from clean shutdown?":true,"Statistics":{"Set up periodic runner":"0 ms","Set up online certificate status protocol manager":"0 ms","Transport layer setup":"0 ms","Run initial syncer crash recovery":"0 ms","Create storage engine lock file in the data directory":"0 ms","Get metadata describing storage engine":"0 ms","Validate options in metadata against current startup options":"0 ms","Create storage engine":"1801 ms","Write current PID to file":"1 ms","Initialize FCV before rebuilding indexes":"7 ms","Drop abandoned idents and get back indexes that need to be rebuilt or builds that need to be restarted":"0 ms","Rebuild indexes for collections":"0 ms","Load cluster parameters from disk for a standalone":"0 ms","Build user and roles graph":"0 ms","Verify indexes for admin.system.users collection":"0 ms","Set up the background thread pool responsible for waiting for opTimes to be majority committed":"1 ms","Start up the replication coordinator":"1 ms","Ensure the change stream collections on startup contain consistent data":"0 ms","Write startup options to the audit log":"0 ms","Start transport layer":"0 ms","_initAndListen total elapsed time":"1823 ms"}}}}
mongo-demo-1     | 2025-01-13T01:39:24.010149701Z {"t":{"$date":"2025-01-13T01:39:24.009+00:00"},"s":"W",  "c":"CONTROL",  "id":636300,  "ctx":"ftdc","msg":"Use of deprecated server parameter name","attr":{"deprecatedName":"internalQueryCacheSize","canonicalName":"internalQueryCacheMaxEntriesPerCollection"}}
mongo-demo-1     | 2025-01-13T01:39:24.010344788Z {"t":{"$date":"2025-01-13T01:39:24.010+00:00"},"s":"W",  "c":"CONTROL",  "id":636300,  "ctx":"ftdc","msg":"Use of deprecated server parameter name","attr":{"deprecatedName":"oplogSamplingLogIntervalSeconds","canonicalName":"collectionSamplingLogIntervalSeconds"}}
mongo-demo-1     | 2025-01-13T01:39:24.010367563Z {"t":{"$date":"2025-01-13T01:39:24.010+00:00"},"s":"W",  "c":"NETWORK",  "id":23803,   "ctx":"ftdc","msg":"Use of deprecated server parameter 'sslMode', please use 'tlsMode' instead."}
mongo-demo-1     | 2025-01-13T01:39:24.010425185Z {"t":{"$date":"2025-01-13T01:39:24.010+00:00"},"s":"W",  "c":"CONTROL",  "id":636300,  "ctx":"ftdc","msg":"Use of deprecated server parameter name","attr":{"deprecatedName":"wiredTigerConcurrentReadTransactions","canonicalName":"storageEngineConcurrentReadTransactions"}}
mongo-demo-1     | 2025-01-13T01:39:24.010439506Z {"t":{"$date":"2025-01-13T01:39:24.010+00:00"},"s":"W",  "c":"CONTROL",  "id":636300,  "ctx":"ftdc","msg":"Use of deprecated server parameter name","attr":{"deprecatedName":"wiredTigerConcurrentWriteTransactions","canonicalName":"storageEngineConcurrentWriteTransactions"}}
mongo-demo-1     | 2025-01-13T01:39:24.882785971Z {"t":{"$date":"2025-01-13T01:39:24.882+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"172.18.0.3:42285","uuid":{"uuid":{"$uuid":"644430d2-bbb3-4419-9633-69ff3c97e546"}},"connectionId":1,"connectionCount":1}}
mongo-demo-1     | 2025-01-13T01:39:24.883261582Z {"t":{"$date":"2025-01-13T01:39:24.883+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn1","msg":"Connection ended","attr":{"remote":"172.18.0.3:42285","uuid":{"uuid":{"$uuid":"644430d2-bbb3-4419-9633-69ff3c97e546"}},"connectionId":1,"connectionCount":0}}
mongo-demo-1     | 2025-01-13T01:39:24.897484445Z {"t":{"$date":"2025-01-13T01:39:24.897+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"172.18.0.3:53300","uuid":{"uuid":{"$uuid":"6d7f923f-188d-4c90-8849-00bafdcbe604"}},"connectionId":2,"connectionCount":1}}
mongo-demo-1     | 2025-01-13T01:39:24.897800178Z {"t":{"$date":"2025-01-13T01:39:24.897+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn2","msg":"Connection ended","attr":{"remote":"172.18.0.3:53300","uuid":{"uuid":{"$uuid":"6d7f923f-188d-4c90-8849-00bafdcbe604"}},"connectionId":2,"connectionCount":0}}
mongo-demo-1     | 2025-01-13T01:39:26.478763286Z {"t":{"$date":"2025-01-13T01:39:26.477+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"172.18.0.3:53312","uuid":{"uuid":{"$uuid":"fbbe6dc6-9fc9-4827-b207-0b8644f07f3e"}},"connectionId":3,"connectionCount":1}}
mongo-demo-1     | 2025-01-13T01:39:26.494016802Z {"t":{"$date":"2025-01-13T01:39:26.493+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn3","msg":"client metadata","attr":{"remote":"172.18.0.3:53312","client":"conn3","negotiatedCompressors":[],"doc":{"driver":{"name":"nodejs","version":"4.13.0"},"os":{"type":"Linux","name":"linux","architecture":"x64","version":"6.8.0-51-generic"},"platform":"Node.js v18.20.3, LE (unified)|Node.js v18.20.3, LE (unified)"}}}
mongo-demo-1     | 2025-01-13T01:39:26.512412013Z {"t":{"$date":"2025-01-13T01:39:26.512+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"172.18.0.3:53322","uuid":{"uuid":{"$uuid":"e4081a87-d228-467a-a8f8-3aee7c2b33d1"}},"connectionId":4,"connectionCount":2}}
mongo-demo-1     | 2025-01-13T01:39:26.516572441Z {"t":{"$date":"2025-01-13T01:39:26.516+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn4","msg":"client metadata","attr":{"remote":"172.18.0.3:53322","client":"conn4","negotiatedCompressors":[],"doc":{"driver":{"name":"nodejs","version":"4.13.0"},"os":{"type":"Linux","name":"linux","architecture":"x64","version":"6.8.0-51-generic"},"platform":"Node.js v18.20.3, LE (unified)|Node.js v18.20.3, LE (unified)"}}}
mongo-demo-1     | 2025-01-13T01:39:26.520555851Z {"t":{"$date":"2025-01-13T01:39:26.520+00:00"},"s":"I",  "c":"ACCESS",   "id":6788604, "ctx":"conn4","msg":"Auth metrics report","attr":{"metric":"acquireUser","micros":0}}
mongo-demo-1     | 2025-01-13T01:39:26.552850626Z {"t":{"$date":"2025-01-13T01:39:26.552+00:00"},"s":"I",  "c":"ACCESS",   "id":5286306, "ctx":"conn4","msg":"Successfully authenticated","attr":{"client":"172.18.0.3:53322","isSpeculative":true,"isClusterMember":false,"mechanism":"SCRAM-SHA-256","user":"admin","db":"admin","result":0,"metrics":{"conversation_duration":{"micros":32187,"summary":{"0":{"step":1,"step_total":2,"duration_micros":129},"1":{"step":2,"step_total":2,"duration_micros":33}}}},"extraInfo":{}}}
mongo-demo-1     | 2025-01-13T01:39:26.557375695Z {"t":{"$date":"2025-01-13T01:39:26.557+00:00"},"s":"I",  "c":"NETWORK",  "id":6788700, "ctx":"conn4","msg":"Received first command on ingress connection since session start or auth handshake","attr":{"elapsedMillis":4}}
mongo-demo-1     | 2025-01-13T01:39:37.015942220Z {"t":{"$date":"2025-01-13T01:39:37.015+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"172.18.0.3:60778","uuid":{"uuid":{"$uuid":"7cf3366c-8ae6-4a51-a454-066f1d04dd66"}},"connectionId":5,"connectionCount":3}}
mongo-demo-1     | 2025-01-13T01:39:37.018270721Z {"t":{"$date":"2025-01-13T01:39:37.017+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn5","msg":"client metadata","attr":{"remote":"172.18.0.3:60778","client":"conn5","negotiatedCompressors":[],"doc":{"driver":{"name":"nodejs","version":"4.13.0"},"os":{"type":"Linux","name":"linux","architecture":"x64","version":"6.8.0-51-generic"},"platform":"Node.js v18.20.3, LE (unified)|Node.js v18.20.3, LE (unified)"}}}
mongo-demo-1     | 2025-01-13T01:40:23.934792911Z {"t":{"$date":"2025-01-13T01:40:23.934+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732423,"ts_usec":934312,"thread":"1:0x7777fe4006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 4, snapshot max: 4 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 7"}}}
mongo-demo-1     | 2025-01-13T01:41:23.963013958Z {"t":{"$date":"2025-01-13T01:41:23.962+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732483,"ts_usec":962788,"thread":"1:0x7777fe4006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 5, snapshot max: 5 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 7"}}}
mongo-demo-1     | 2025-01-13T01:42:23.984365816Z {"t":{"$date":"2025-01-13T01:42:23.984+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732543,"ts_usec":984020,"thread":"1:0x7777fe4006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 6, snapshot max: 6 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 7"}}}
mongo-demo-1     | 2025-01-13T01:43:24.001351330Z {"t":{"$date":"2025-01-13T01:43:24.001+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732604,"ts_usec":1140,"thread":"1:0x7777fe4006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 7, snapshot max: 7 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 7"}}}
mongo-demo-1     | 2025-01-13T01:43:54.043740217Z {"t":{"$date":"2025-01-13T01:43:54.043+00:00"},"s":"I",  "c":"-",        "id":20883,   "ctx":"conn3","msg":"Interrupted operation as its client disconnected","attr":{"opId":13339}}
mongo-demo-1     | 2025-01-13T01:43:54.043789993Z {"t":{"$date":"2025-01-13T01:43:54.043+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn5","msg":"Connection ended","attr":{"remote":"172.18.0.3:60778","uuid":{"uuid":{"$uuid":"7cf3366c-8ae6-4a51-a454-066f1d04dd66"}},"connectionId":5,"connectionCount":2}}
mongo-demo-1     | 2025-01-13T01:43:54.044135881Z {"t":{"$date":"2025-01-13T01:43:54.043+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn4","msg":"Connection ended","attr":{"remote":"172.18.0.3:53322","uuid":{"uuid":{"$uuid":"e4081a87-d228-467a-a8f8-3aee7c2b33d1"}},"connectionId":4,"connectionCount":1}}
mongo-demo-1     | 2025-01-13T01:43:54.044697928Z {"t":{"$date":"2025-01-13T01:43:54.044+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn3","msg":"Connection ended","attr":{"remote":"172.18.0.3:53312","uuid":{"uuid":{"$uuid":"fbbe6dc6-9fc9-4827-b207-0b8644f07f3e"}},"connectionId":3,"connectionCount":0}}
mongo-demo-1     | 2025-01-13T01:43:54.223419213Z {"t":{"$date":"2025-01-13T01:43:54.223+00:00"},"s":"I",  "c":"CONTROL",  "id":23377,   "ctx":"SignalHandler","msg":"Received signal","attr":{"signal":15,"error":"Terminated"}}
mongo-demo-1     | 2025-01-13T01:43:54.223467544Z {"t":{"$date":"2025-01-13T01:43:54.223+00:00"},"s":"I",  "c":"CONTROL",  "id":23378,   "ctx":"SignalHandler","msg":"Signal was sent by kill(2)","attr":{"pid":0,"uid":0}}
mongo-demo-1     | 2025-01-13T01:43:54.223626508Z {"t":{"$date":"2025-01-13T01:43:54.223+00:00"},"s":"I",  "c":"CONTROL",  "id":23381,   "ctx":"SignalHandler","msg":"will terminate after current cmd ends"}
mongo-demo-1     | 2025-01-13T01:43:54.223643794Z {"t":{"$date":"2025-01-13T01:43:54.223+00:00"},"s":"I",  "c":"REPL",     "id":4784900, "ctx":"SignalHandler","msg":"Stepping down the ReplicationCoordinator for shutdown","attr":{"waitTimeMillis":15000}}
mongo-demo-1     | 2025-01-13T01:43:54.224207734Z {"t":{"$date":"2025-01-13T01:43:54.223+00:00"},"s":"I",  "c":"REPL",     "id":4794602, "ctx":"SignalHandler","msg":"Attempting to enter quiesce mode"}
mongo-demo-1     | 2025-01-13T01:43:54.224239265Z {"t":{"$date":"2025-01-13T01:43:54.223+00:00"},"s":"I",  "c":"STORAGE",  "id":7333402, "ctx":"SignalHandler","msg":"Shutting down the DiskSpaceMonitor"}
mongo-demo-1     | 2025-01-13T01:43:54.224566489Z {"t":{"$date":"2025-01-13T01:43:54.223+00:00"},"s":"I",  "c":"-",        "id":6371601, "ctx":"SignalHandler","msg":"Shutting down the FLE Crud thread pool"}
mongo-demo-1     | 2025-01-13T01:43:54.224763422Z {"t":{"$date":"2025-01-13T01:43:54.223+00:00"},"s":"I",  "c":"COMMAND",  "id":4784901, "ctx":"SignalHandler","msg":"Shutting down the MirrorMaestro"}
mongo-demo-1     | 2025-01-13T01:43:54.224777443Z {"t":{"$date":"2025-01-13T01:43:54.223+00:00"},"s":"I",  "c":"SHARDING", "id":4784902, "ctx":"SignalHandler","msg":"Shutting down the WaitForMajorityService"}
mongo-demo-1     | 2025-01-13T01:43:54.226080546Z {"t":{"$date":"2025-01-13T01:43:54.225+00:00"},"s":"I",  "c":"CONTROL",  "id":4784903, "ctx":"SignalHandler","msg":"Shutting down the LogicalSessionCache"}
mongo-demo-1     | 2025-01-13T01:43:54.226414120Z {"t":{"$date":"2025-01-13T01:43:54.226+00:00"},"s":"I",  "c":"NETWORK",  "id":8314100, "ctx":"SignalHandler","msg":"Shutdown: Closing listener sockets"}
mongo-demo-1     | 2025-01-13T01:43:54.226562470Z {"t":{"$date":"2025-01-13T01:43:54.226+00:00"},"s":"I",  "c":"NETWORK",  "id":23017,   "ctx":"listener","msg":"removing socket file","attr":{"path":"/tmp/mongodb-27017.sock"}}
mongo-demo-1     | 2025-01-13T01:43:54.227119319Z {"t":{"$date":"2025-01-13T01:43:54.226+00:00"},"s":"I",  "c":"NETWORK",  "id":4784905, "ctx":"SignalHandler","msg":"Shutting down the global connection pool"}
mongo-demo-1     | 2025-01-13T01:43:54.227175263Z {"t":{"$date":"2025-01-13T01:43:54.226+00:00"},"s":"I",  "c":"CONTROL",  "id":4784906, "ctx":"SignalHandler","msg":"Shutting down the FlowControlTicketholder"}
mongo-demo-1     | 2025-01-13T01:43:54.227186726Z {"t":{"$date":"2025-01-13T01:43:54.226+00:00"},"s":"I",  "c":"-",        "id":20520,   "ctx":"SignalHandler","msg":"Stopping further Flow Control ticket acquisitions."}
mongo-demo-1     | 2025-01-13T01:43:54.227196529Z {"t":{"$date":"2025-01-13T01:43:54.226+00:00"},"s":"I",  "c":"CONTROL",  "id":4784908, "ctx":"SignalHandler","msg":"Shutting down the PeriodicThreadToAbortExpiredTransactions"}
mongo-demo-1     | 2025-01-13T01:43:54.227354096Z {"t":{"$date":"2025-01-13T01:43:54.227+00:00"},"s":"I",  "c":"REPL",     "id":4784909, "ctx":"SignalHandler","msg":"Shutting down the ReplicationCoordinator"}
mongo-demo-1     | 2025-01-13T01:43:54.227379196Z {"t":{"$date":"2025-01-13T01:43:54.227+00:00"},"s":"I",  "c":"SHARDING", "id":4784910, "ctx":"SignalHandler","msg":"Shutting down the ShardingInitializationMongoD"}
mongo-demo-1     | 2025-01-13T01:43:54.227390424Z {"t":{"$date":"2025-01-13T01:43:54.227+00:00"},"s":"I",  "c":"REPL",     "id":4784911, "ctx":"SignalHandler","msg":"Enqueuing the ReplicationStateTransitionLock for shutdown"}
mongo-demo-1     | 2025-01-13T01:43:54.227398160Z {"t":{"$date":"2025-01-13T01:43:54.227+00:00"},"s":"I",  "c":"-",        "id":4784912, "ctx":"SignalHandler","msg":"Killing all operations for shutdown"}
mongo-demo-1     | 2025-01-13T01:43:54.227413646Z {"t":{"$date":"2025-01-13T01:43:54.227+00:00"},"s":"I",  "c":"-",        "id":4695300, "ctx":"SignalHandler","msg":"Interrupted all currently running operations","attr":{"opsKilled":3}}
mongo-demo-1     | 2025-01-13T01:43:54.227422617Z {"t":{"$date":"2025-01-13T01:43:54.227+00:00"},"s":"I",  "c":"TENANT_M", "id":5093807, "ctx":"SignalHandler","msg":"Shutting down all TenantMigrationAccessBlockers on global shutdown"}
mongo-demo-1     | 2025-01-13T01:43:54.227583893Z {"t":{"$date":"2025-01-13T01:43:54.227+00:00"},"s":"I",  "c":"ASIO",     "id":22582,   "ctx":"TenantMigrationBlockerNet","msg":"Killing all outstanding egress activity."}
mongo-demo-1     | 2025-01-13T01:43:54.227861582Z {"t":{"$date":"2025-01-13T01:43:54.227+00:00"},"s":"I",  "c":"ASIO",     "id":6529201, "ctx":"SignalHandler","msg":"Network interface redundant shutdown","attr":{"state":"Stopped"}}
mongo-demo-1     | 2025-01-13T01:43:54.227879704Z {"t":{"$date":"2025-01-13T01:43:54.227+00:00"},"s":"I",  "c":"ASIO",     "id":22582,   "ctx":"SignalHandler","msg":"Killing all outstanding egress activity."}
mongo-demo-1     | 2025-01-13T01:43:54.227888194Z {"t":{"$date":"2025-01-13T01:43:54.227+00:00"},"s":"I",  "c":"COMMAND",  "id":4784913, "ctx":"SignalHandler","msg":"Shutting down all open transactions"}
mongo-demo-1     | 2025-01-13T01:43:54.227897940Z {"t":{"$date":"2025-01-13T01:43:54.227+00:00"},"s":"I",  "c":"REPL",     "id":4784914, "ctx":"SignalHandler","msg":"Acquiring the ReplicationStateTransitionLock for shutdown"}
mongo-demo-1     | 2025-01-13T01:43:54.227906057Z {"t":{"$date":"2025-01-13T01:43:54.227+00:00"},"s":"I",  "c":"INDEX",    "id":4784915, "ctx":"SignalHandler","msg":"Shutting down the IndexBuildsCoordinator"}
mongo-demo-1     | 2025-01-13T01:43:54.227933714Z {"t":{"$date":"2025-01-13T01:43:54.227+00:00"},"s":"I",  "c":"NETWORK",  "id":4784918, "ctx":"SignalHandler","msg":"Shutting down the ReplicaSetMonitor"}
mongo-demo-1     | 2025-01-13T01:43:54.227947371Z {"t":{"$date":"2025-01-13T01:43:54.227+00:00"},"s":"I",  "c":"SHARDING", "id":4784921, "ctx":"SignalHandler","msg":"Shutting down the MigrationUtilExecutor"}
mongo-demo-1     | 2025-01-13T01:43:54.228104778Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"ASIO",     "id":22582,   "ctx":"MigrationUtil-TaskExecutor","msg":"Killing all outstanding egress activity."}
mongo-demo-1     | 2025-01-13T01:43:54.228350833Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"NETWORK",  "id":20562,   "ctx":"SignalHandler","msg":"Shutdown: Closing open transport sessions"}
mongo-demo-1     | 2025-01-13T01:43:54.228601128Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"NETWORK",  "id":4784923, "ctx":"SignalHandler","msg":"Shutting down the ASIO transport SessionManager"}
mongo-demo-1     | 2025-01-13T01:43:54.228611468Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"CONTROL",  "id":4784927, "ctx":"SignalHandler","msg":"Shutting down the HealthLog"}
mongo-demo-1     | 2025-01-13T01:43:54.228618450Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"CONTROL",  "id":4784928, "ctx":"SignalHandler","msg":"Shutting down the TTL monitor"}
mongo-demo-1     | 2025-01-13T01:43:54.228625270Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"INDEX",    "id":3684100, "ctx":"SignalHandler","msg":"Shutting down TTL collection monitor thread"}
mongo-demo-1     | 2025-01-13T01:43:54.228631898Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"INDEX",    "id":3684101, "ctx":"SignalHandler","msg":"Finished shutting down TTL collection monitor thread"}
mongo-demo-1     | 2025-01-13T01:43:54.228639285Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"CONTROL",  "id":6278511, "ctx":"SignalHandler","msg":"Shutting down the Change Stream Expired Pre-images Remover"}
mongo-demo-1     | 2025-01-13T01:43:54.228765601Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"CONTROL",  "id":4784929, "ctx":"SignalHandler","msg":"Acquiring the global lock for shutdown"}
mongo-demo-1     | 2025-01-13T01:43:54.228797934Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"CONTROL",  "id":4784930, "ctx":"SignalHandler","msg":"Shutting down the storage engine"}
mongo-demo-1     | 2025-01-13T01:43:54.228835368Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"STORAGE",  "id":22320,   "ctx":"SignalHandler","msg":"Shutting down journal flusher thread"}
mongo-demo-1     | 2025-01-13T01:43:54.228842458Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"STORAGE",  "id":22321,   "ctx":"SignalHandler","msg":"Finished shutting down journal flusher thread"}
mongo-demo-1     | 2025-01-13T01:43:54.228848753Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"STORAGE",  "id":22322,   "ctx":"SignalHandler","msg":"Shutting down checkpoint thread"}
mongo-demo-1     | 2025-01-13T01:43:54.228855264Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"STORAGE",  "id":22323,   "ctx":"SignalHandler","msg":"Finished shutting down checkpoint thread"}
mongo-demo-1     | 2025-01-13T01:43:54.228861819Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"STORAGE",  "id":22261,   "ctx":"SignalHandler","msg":"Timestamp monitor shutting down"}
mongo-demo-1     | 2025-01-13T01:43:54.228868264Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"STORAGE",  "id":20282,   "ctx":"SignalHandler","msg":"Deregistering all the collections"}
mongo-demo-1     | 2025-01-13T01:43:54.228874914Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"STORAGE",  "id":22317,   "ctx":"SignalHandler","msg":"WiredTigerKVEngine shutting down"}
mongo-demo-1     | 2025-01-13T01:43:54.228882028Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"STORAGE",  "id":22318,   "ctx":"SignalHandler","msg":"Shutting down session sweeper thread"}
mongo-demo-1     | 2025-01-13T01:43:54.229151875Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"STORAGE",  "id":22319,   "ctx":"SignalHandler","msg":"Finished shutting down session sweeper thread"}
mongo-demo-1     | 2025-01-13T01:43:54.229174828Z {"t":{"$date":"2025-01-13T01:43:54.229+00:00"},"s":"I",  "c":"STORAGE",  "id":4795902, "ctx":"SignalHandler","msg":"Closing WiredTiger","attr":{"closeConfig":"leak_memory=true,use_timestamp=false,"}}
mongo-demo-1     | 2025-01-13T01:43:54.230547595Z {"t":{"$date":"2025-01-13T01:43:54.229+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"SignalHandler","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732634,"ts_usec":229900,"thread":"1:0x7778106006c0","session_name":"close_ckpt","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 8, snapshot max: 8 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 7"}}}
mongo-demo-1     | 2025-01-13T01:43:54.244794533Z {"t":{"$date":"2025-01-13T01:43:54.244+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"SignalHandler","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732634,"ts_usec":244550,"thread":"1:0x7778106006c0","session_name":"WT_CONNECTION.close","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"shutdown checkpoint has successfully finished and ran for 14 milliseconds"}}}
mongo-demo-1     | 2025-01-13T01:43:54.245033502Z {"t":{"$date":"2025-01-13T01:43:54.244+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"SignalHandler","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732634,"ts_usec":244794,"thread":"1:0x7778106006c0","session_name":"WT_CONNECTION.close","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"shutdown was completed successfully and took 15ms, including 0ms for the rollback to stable, and 14ms for the checkpoint."}}}
mongo-demo-1     | 2025-01-13T01:43:54.263312203Z {"t":{"$date":"2025-01-13T01:43:54.263+00:00"},"s":"I",  "c":"STORAGE",  "id":4795901, "ctx":"SignalHandler","msg":"WiredTiger closed","attr":{"durationMillis":34}}
mongo-demo-1     | 2025-01-13T01:43:54.263346387Z {"t":{"$date":"2025-01-13T01:43:54.263+00:00"},"s":"I",  "c":"STORAGE",  "id":22279,   "ctx":"SignalHandler","msg":"shutdown: removing fs lock..."}
mongo-demo-1     | 2025-01-13T01:43:54.263365776Z {"t":{"$date":"2025-01-13T01:43:54.263+00:00"},"s":"I",  "c":"-",        "id":4784931, "ctx":"SignalHandler","msg":"Dropping the scope cache for shutdown"}
mongo-demo-1     | 2025-01-13T01:43:54.263375410Z {"t":{"$date":"2025-01-13T01:43:54.263+00:00"},"s":"I",  "c":"FTDC",     "id":20626,   "ctx":"SignalHandler","msg":"Shutting down full-time diagnostic data capture"}
mongo-demo-1     | 2025-01-13T01:43:54.273778977Z {"t":{"$date":"2025-01-13T01:43:54.273+00:00"},"s":"I",  "c":"CONTROL",  "id":20565,   "ctx":"SignalHandler","msg":"Now exiting"}
mongo-demo-1     | 2025-01-13T01:43:54.274113770Z {"t":{"$date":"2025-01-13T01:43:54.273+00:00"},"s":"I",  "c":"CONTROL",  "id":8423404, "ctx":"SignalHandler","msg":"mongod shutdown complete","attr":{"Summary of time elapsed":{"Statistics":{"Enter terminal shutdown":"0 ms","Step down the replication coordinator for shutdown":"0 ms","Time spent in quiesce mode":"0 ms","Shut down FLE Crud subsystem":"0 ms","Shut down MirrorMaestro":"0 ms","Shut down WaitForMajorityService":"2 ms","Shut down the logical session cache":"0 ms","Shut down the global connection pool":"0 ms","Shut down the flow control ticket holder":"0 ms","Shut down the thread that aborts expired transactions":"0 ms","Kill all operations for shutdown":"0 ms","Shut down all tenant migration access blockers on global shutdown":"0 ms","Shut down all open transactions":"0 ms","Acquire the RSTL for shutdown":"0 ms","Shut down the IndexBuildsCoordinator and wait for index builds to finish":"0 ms","Shut down the replica set monitor":"0 ms","Shut down the migration util executor":"1 ms","Shut down the transport layer":"0 ms","Shut down the health log":"0 ms","Shut down the TTL monitor":"0 ms","Shut down expired pre-images and documents removers":"0 ms","Shut down the storage engine":"35 ms","Wait for the oplog cap maintainer thread to stop":"0 ms","Shut down full-time data capture":"10 ms","Shut down online certificate status protocol manager":"0 ms","shutdownTask total elapsed time":"50 ms"}}}}
mongo-demo-1     | 2025-01-13T01:43:54.274159006Z {"t":{"$date":"2025-01-13T01:43:54.273+00:00"},"s":"I",  "c":"CONTROL",  "id":23138,   "ctx":"SignalHandler","msg":"Shutting down","attr":{"exitCode":0}}
mongo-demo-1     | 2025-01-13T01:47:09.527776942Z {"t":{"$date":"2025-01-13T01:47:09.527+00:00"},"s":"I",  "c":"CONTROL",  "id":23285,   "ctx":"main","msg":"Automatically disabling TLS 1.0, to force-enable TLS 1.0 specify --sslDisabledProtocols 'none'"}
mongo-demo-1     | 2025-01-13T01:47:09.531698119Z {"t":{"$date":"2025-01-13T01:47:09.531+00:00"},"s":"I",  "c":"CONTROL",  "id":5945603, "ctx":"main","msg":"Multi threading initialized"}
mongo-demo-1     | 2025-01-13T01:47:09.532284399Z {"t":{"$date":"2025-01-13T01:47:09.532+00:00"},"s":"I",  "c":"NETWORK",  "id":4648601, "ctx":"main","msg":"Implicit TCP FastOpen unavailable. If TCP FastOpen is required, set at least one of the related parameters","attr":{"relatedParameters":["tcpFastOpenServer","tcpFastOpenClient","tcpFastOpenQueueSize"]}}
mongo-demo-1     | 2025-01-13T01:47:09.534229667Z {"t":{"$date":"2025-01-13T01:47:09.534+00:00"},"s":"I",  "c":"NETWORK",  "id":4915701, "ctx":"main","msg":"Initialized wire specification","attr":{"spec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":25},"outgoing":{"minWireVersion":6,"maxWireVersion":25},"isInternalClient":true}}}
mongo-demo-1     | 2025-01-13T01:47:09.534919931Z {"t":{"$date":"2025-01-13T01:47:09.534+00:00"},"s":"I",  "c":"TENANT_M", "id":7091600, "ctx":"main","msg":"Starting TenantMigrationAccessBlockerRegistry"}
mongo-demo-1     | 2025-01-13T01:47:09.535170167Z {"t":{"$date":"2025-01-13T01:47:09.534+00:00"},"s":"I",  "c":"CONTROL",  "id":4615611, "ctx":"initandlisten","msg":"MongoDB starting","attr":{"pid":1,"port":27017,"dbPath":"/data/db","architecture":"64-bit","host":"8c08ec298d66"}}
mongo-demo-1     | 2025-01-13T01:47:09.535202600Z {"t":{"$date":"2025-01-13T01:47:09.534+00:00"},"s":"I",  "c":"CONTROL",  "id":23403,   "ctx":"initandlisten","msg":"Build Info","attr":{"buildInfo":{"version":"8.0.4","gitVersion":"bc35ab4305d9920d9d0491c1c9ef9b72383d31f9","openSSLVersion":"OpenSSL 3.0.13 30 Jan 2024","modules":[],"allocator":"tcmalloc-google","environment":{"distmod":"ubuntu2404","distarch":"x86_64","target_arch":"x86_64"}}}}
mongo-demo-1     | 2025-01-13T01:47:09.535218237Z {"t":{"$date":"2025-01-13T01:47:09.534+00:00"},"s":"I",  "c":"CONTROL",  "id":51765,   "ctx":"initandlisten","msg":"Operating System","attr":{"os":{"name":"Ubuntu","version":"24.04"}}}
mongo-demo-1     | 2025-01-13T01:47:09.535227975Z {"t":{"$date":"2025-01-13T01:47:09.534+00:00"},"s":"I",  "c":"CONTROL",  "id":21951,   "ctx":"initandlisten","msg":"Options set by command line","attr":{"options":{"net":{"bindIp":"*"},"security":{"authorization":"enabled"}}}}
mongo-demo-1     | 2025-01-13T01:47:09.536455740Z {"t":{"$date":"2025-01-13T01:47:09.536+00:00"},"s":"I",  "c":"STORAGE",  "id":22270,   "ctx":"initandlisten","msg":"Storage engine to use detected by data files","attr":{"dbpath":"/data/db","storageEngine":"wiredTiger"}}
mongo-demo-1     | 2025-01-13T01:47:09.536823876Z {"t":{"$date":"2025-01-13T01:47:09.536+00:00"},"s":"I",  "c":"STORAGE",  "id":22297,   "ctx":"initandlisten","msg":"Using the XFS filesystem is strongly recommended with the WiredTiger storage engine. See http://dochub.mongodb.org/core/prodnotes-filesystem","tags":["startupWarnings"]}
mongo-demo-1     | 2025-01-13T01:47:09.536856983Z {"t":{"$date":"2025-01-13T01:47:09.536+00:00"},"s":"I",  "c":"STORAGE",  "id":22315,   "ctx":"initandlisten","msg":"Opening WiredTiger","attr":{"config":"create,cache_size=3413M,session_max=33000,eviction=(threads_min=4,threads_max=4),config_base=false,statistics=(fast),log=(enabled=true,remove=true,path=journal,compressor=snappy),builtin_extension_config=(zstd=(compression_level=6)),file_manager=(close_idle_time=600,close_scan_interval=10,close_handle_minimum=2000),statistics_log=(wait=0),json_output=(error,message),verbose=[recovery_progress:1,checkpoint_progress:1,compact_progress:1,backup:0,checkpoint:0,compact:0,evict:0,history_store:0,recovery:0,rts:0,salvage:0,tiered:0,timestamp:0,transaction:0,verify:0,log:0],prefetch=(available=true,default=false),"}}
mongo-demo-1     | 2025-01-13T01:47:10.587623547Z {"t":{"$date":"2025-01-13T01:47:10.587+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732830,"ts_usec":587417,"thread":"1:0x73de4af25680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Recovering log 2 through 3"}}}
mongo-demo-1     | 2025-01-13T01:47:10.657821628Z {"t":{"$date":"2025-01-13T01:47:10.657+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732830,"ts_usec":657565,"thread":"1:0x73de4af25680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Recovering log 3 through 3"}}}
mongo-demo-1     | 2025-01-13T01:47:10.775381611Z {"t":{"$date":"2025-01-13T01:47:10.775+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732830,"ts_usec":775202,"thread":"1:0x73de4af25680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Main recovery loop: starting at 2/8704 to 3/256"}}}
mongo-demo-1     | 2025-01-13T01:47:10.911264952Z {"t":{"$date":"2025-01-13T01:47:10.911+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732830,"ts_usec":911019,"thread":"1:0x73de4af25680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Recovering log 2 through 3"}}}
mongo-demo-1     | 2025-01-13T01:47:10.994672205Z {"t":{"$date":"2025-01-13T01:47:10.994+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732830,"ts_usec":994482,"thread":"1:0x73de4af25680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Recovering log 3 through 3"}}}
mongo-demo-1     | 2025-01-13T01:47:11.068164948Z {"t":{"$date":"2025-01-13T01:47:11.067+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732831,"ts_usec":67868,"thread":"1:0x73de4af25680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery log replay has successfully finished and ran for 480 milliseconds"}}}
mongo-demo-1     | 2025-01-13T01:47:11.068208365Z {"t":{"$date":"2025-01-13T01:47:11.068+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732831,"ts_usec":67982,"thread":"1:0x73de4af25680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Set global recovery timestamp: (0, 0)"}}}
mongo-demo-1     | 2025-01-13T01:47:11.068221568Z {"t":{"$date":"2025-01-13T01:47:11.068+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732831,"ts_usec":68029,"thread":"1:0x73de4af25680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Set global oldest timestamp: (0, 0)"}}}
mongo-demo-1     | 2025-01-13T01:47:11.069642271Z {"t":{"$date":"2025-01-13T01:47:11.069+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732831,"ts_usec":69467,"thread":"1:0x73de4af25680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery rollback to stable has successfully finished and ran for 1 milliseconds"}}}
mongo-demo-1     | 2025-01-13T01:47:11.078677085Z {"t":{"$date":"2025-01-13T01:47:11.078+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732831,"ts_usec":78386,"thread":"1:0x73de4af25680","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 1, snapshot max: 1 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
mongo-demo-1     | 2025-01-13T01:47:11.084619426Z {"t":{"$date":"2025-01-13T01:47:11.084+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732831,"ts_usec":84397,"thread":"1:0x73de4af25680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery checkpoint has successfully finished and ran for 14 milliseconds"}}}
mongo-demo-1     | 2025-01-13T01:47:11.084659140Z {"t":{"$date":"2025-01-13T01:47:11.084+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732831,"ts_usec":84501,"thread":"1:0x73de4af25680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery was completed successfully and took 497ms, including 480ms for the log replay, 1ms for the rollback to stable, and 14ms for the checkpoint."}}}
mongo-demo-1     | 2025-01-13T01:47:11.089965936Z {"t":{"$date":"2025-01-13T01:47:11.089+00:00"},"s":"I",  "c":"STORAGE",  "id":4795906, "ctx":"initandlisten","msg":"WiredTiger opened","attr":{"durationMillis":1553}}
mongo-demo-1     | 2025-01-13T01:47:11.090004203Z {"t":{"$date":"2025-01-13T01:47:11.089+00:00"},"s":"I",  "c":"RECOVERY", "id":23987,   "ctx":"initandlisten","msg":"WiredTiger recoveryTimestamp","attr":{"recoveryTimestamp":{"$timestamp":{"t":0,"i":0}}}}
mongo-demo-1     | 2025-01-13T01:47:11.101447432Z {"t":{"$date":"2025-01-13T01:47:11.101+00:00"},"s":"W",  "c":"CONTROL",  "id":9068900, "ctx":"initandlisten","msg":"For customers running the current memory allocator, we suggest changing the contents of the following sysfsFile","attr":{"allocator":"tcmalloc-google","sysfsFile":"/sys/kernel/mm/transparent_hugepage/enabled","currentValue":"never","desiredValue":"always"},"tags":["startupWarnings"]}
mongo-demo-1     | 2025-01-13T01:47:11.101654087Z {"t":{"$date":"2025-01-13T01:47:11.101+00:00"},"s":"W",  "c":"CONTROL",  "id":9068900, "ctx":"initandlisten","msg":"For customers running the current memory allocator, we suggest changing the contents of the following sysfsFile","attr":{"allocator":"tcmalloc-google","sysfsFile":"/sys/kernel/mm/transparent_hugepage/defrag","currentValue":"madvise","desiredValue":"defer+madvise"},"tags":["startupWarnings"]}
mongo-demo-1     | 2025-01-13T01:47:11.101682665Z {"t":{"$date":"2025-01-13T01:47:11.101+00:00"},"s":"W",  "c":"CONTROL",  "id":8640302, "ctx":"initandlisten","msg":"We suggest setting the contents of sysfsFile to 0.","attr":{"sysfsFile":"/sys/kernel/mm/transparent_hugepage/khugepaged/max_ptes_none","currentValue":511},"tags":["startupWarnings"]}
mongo-demo-1     | 2025-01-13T01:47:11.101690301Z {"t":{"$date":"2025-01-13T01:47:11.101+00:00"},"s":"W",  "c":"CONTROL",  "id":8718500, "ctx":"initandlisten","msg":"Your system has glibc support for rseq built in, which is not yet supported by tcmalloc-google and has critical performance implications. Please set the environment variable GLIBC_TUNABLES=glibc.pthread.rseq=0","tags":["startupWarnings"]}
mongo-demo-1     | 2025-01-13T01:47:11.102231201Z {"t":{"$date":"2025-01-13T01:47:11.101+00:00"},"s":"W",  "c":"NETWORK",  "id":5123300, "ctx":"initandlisten","msg":"vm.max_map_count is too low","attr":{"currentValue":1048576,"recommendedMinimum":1677720,"maxConns":838860},"tags":["startupWarnings"]}
mongo-demo-1     | 2025-01-13T01:47:11.102260405Z {"t":{"$date":"2025-01-13T01:47:11.101+00:00"},"s":"W",  "c":"CONTROL",  "id":8386700, "ctx":"initandlisten","msg":"We suggest setting swappiness to 0 or 1, as swapping can cause performance problems.","attr":{"sysfsFile":"/proc/sys/vm/swappiness","currentValue":60},"tags":["startupWarnings"]}
mongo-demo-1     | 2025-01-13T01:47:11.107884167Z {"t":{"$date":"2025-01-13T01:47:11.107+00:00"},"s":"I",  "c":"NETWORK",  "id":4915702, "ctx":"initandlisten","msg":"Updated wire specification","attr":{"oldSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":25},"outgoing":{"minWireVersion":6,"maxWireVersion":25},"isInternalClient":true},"newSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":25,"maxWireVersion":25},"outgoing":{"minWireVersion":25,"maxWireVersion":25},"isInternalClient":true}}}
mongo-demo-1     | 2025-01-13T01:47:11.107920450Z {"t":{"$date":"2025-01-13T01:47:11.107+00:00"},"s":"I",  "c":"REPL",     "id":5853300, "ctx":"initandlisten","msg":"current featureCompatibilityVersion value","attr":{"featureCompatibilityVersion":"8.0","context":"startup"}}
mongo-demo-1     | 2025-01-13T01:47:11.108066227Z {"t":{"$date":"2025-01-13T01:47:11.107+00:00"},"s":"I",  "c":"STORAGE",  "id":5071100, "ctx":"initandlisten","msg":"Clearing temp directory"}
mongo-demo-1     | 2025-01-13T01:47:11.110014335Z {"t":{"$date":"2025-01-13T01:47:11.109+00:00"},"s":"I",  "c":"CONTROL",  "id":6608200, "ctx":"initandlisten","msg":"Initializing cluster server parameters from disk"}
mongo-demo-1     | 2025-01-13T01:47:11.110214432Z {"t":{"$date":"2025-01-13T01:47:11.110+00:00"},"s":"I",  "c":"CONTROL",  "id":20536,   "ctx":"initandlisten","msg":"Flow Control is enabled on this deployment"}
mongo-demo-1     | 2025-01-13T01:47:11.110673969Z {"t":{"$date":"2025-01-13T01:47:11.110+00:00"},"s":"I",  "c":"FTDC",     "id":20625,   "ctx":"initandlisten","msg":"Initializing full-time diagnostic data capture","attr":{"dataDirectory":"/data/db/diagnostic.data"}}
mongo-demo-1     | 2025-01-13T01:47:11.113869400Z {"t":{"$date":"2025-01-13T01:47:11.113+00:00"},"s":"I",  "c":"REPL",     "id":6015317, "ctx":"initandlisten","msg":"Setting new configuration state","attr":{"newState":"ConfigReplicationDisabled","oldState":"ConfigPreStart"}}
mongo-demo-1     | 2025-01-13T01:47:11.113945824Z {"t":{"$date":"2025-01-13T01:47:11.113+00:00"},"s":"I",  "c":"STORAGE",  "id":22262,   "ctx":"initandlisten","msg":"Timestamp monitor starting"}
mongo-demo-1     | 2025-01-13T01:47:11.114134879Z {"t":{"$date":"2025-01-13T01:47:11.114+00:00"},"s":"I",  "c":"STORAGE",  "id":7333401, "ctx":"initandlisten","msg":"Starting the DiskSpaceMonitor"}
mongo-demo-1     | 2025-01-13T01:47:11.115340488Z {"t":{"$date":"2025-01-13T01:47:11.115+00:00"},"s":"I",  "c":"NETWORK",  "id":23015,   "ctx":"listener","msg":"Listening on","attr":{"address":"/tmp/mongodb-27017.sock"}}
mongo-demo-1     | 2025-01-13T01:47:11.115374461Z {"t":{"$date":"2025-01-13T01:47:11.115+00:00"},"s":"I",  "c":"NETWORK",  "id":23015,   "ctx":"listener","msg":"Listening on","attr":{"address":"0.0.0.0:27017"}}
mongo-demo-1     | 2025-01-13T01:47:11.115384226Z {"t":{"$date":"2025-01-13T01:47:11.115+00:00"},"s":"I",  "c":"NETWORK",  "id":23016,   "ctx":"listener","msg":"Waiting for connections","attr":{"port":27017,"ssl":"off"}}
mongo-demo-1     | 2025-01-13T01:47:11.115500765Z {"t":{"$date":"2025-01-13T01:47:11.115+00:00"},"s":"I",  "c":"CONTROL",  "id":8423403, "ctx":"initandlisten","msg":"mongod startup complete","attr":{"Summary of time elapsed":{"Startup from clean shutdown?":true,"Statistics":{"Set up periodic runner":"0 ms","Set up online certificate status protocol manager":"0 ms","Transport layer setup":"0 ms","Run initial syncer crash recovery":"0 ms","Create storage engine lock file in the data directory":"0 ms","Get metadata describing storage engine":"0 ms","Validate options in metadata against current startup options":"0 ms","Create storage engine":"1555 ms","Write current PID to file":"0 ms","Initialize FCV before rebuilding indexes":"6 ms","Drop abandoned idents and get back indexes that need to be rebuilt or builds that need to be restarted":"0 ms","Rebuild indexes for collections":"0 ms","Load cluster parameters from disk for a standalone":"0 ms","Build user and roles graph":"0 ms","Verify indexes for admin.system.users collection":"0 ms","Set up the background thread pool responsible for waiting for opTimes to be majority committed":"1 ms","Start up the replication coordinator":"1 ms","Ensure the change stream collections on startup contain consistent data":"0 ms","Write startup options to the audit log":"0 ms","Start transport layer":"1 ms","_initAndListen total elapsed time":"1581 ms"}}}}
mongo-demo-1     | 2025-01-13T01:47:11.782911781Z {"t":{"$date":"2025-01-13T01:47:11.782+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"172.18.0.3:44057","uuid":{"uuid":{"$uuid":"01217118-1875-485d-9390-1c736c8081dd"}},"connectionId":1,"connectionCount":1}}
mongo-demo-1     | 2025-01-13T01:47:11.783370813Z {"t":{"$date":"2025-01-13T01:47:11.783+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn1","msg":"Connection ended","attr":{"remote":"172.18.0.3:44057","uuid":{"uuid":{"$uuid":"01217118-1875-485d-9390-1c736c8081dd"}},"connectionId":1,"connectionCount":0}}
mongo-demo-1     | 2025-01-13T01:47:11.786438596Z {"t":{"$date":"2025-01-13T01:47:11.786+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"172.18.0.3:39516","uuid":{"uuid":{"$uuid":"5638ab51-d509-43a9-821e-455fc320a258"}},"connectionId":2,"connectionCount":1}}
mongo-demo-1     | 2025-01-13T01:47:11.786811626Z {"t":{"$date":"2025-01-13T01:47:11.786+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn2","msg":"Connection ended","attr":{"remote":"172.18.0.3:39516","uuid":{"uuid":{"$uuid":"5638ab51-d509-43a9-821e-455fc320a258"}},"connectionId":2,"connectionCount":0}}
mongo-demo-1     | 2025-01-13T01:47:12.010263974Z {"t":{"$date":"2025-01-13T01:47:12.010+00:00"},"s":"W",  "c":"CONTROL",  "id":636300,  "ctx":"ftdc","msg":"Use of deprecated server parameter name","attr":{"deprecatedName":"internalQueryCacheSize","canonicalName":"internalQueryCacheMaxEntriesPerCollection"}}
mongo-demo-1     | 2025-01-13T01:47:12.010395510Z {"t":{"$date":"2025-01-13T01:47:12.010+00:00"},"s":"W",  "c":"CONTROL",  "id":636300,  "ctx":"ftdc","msg":"Use of deprecated server parameter name","attr":{"deprecatedName":"oplogSamplingLogIntervalSeconds","canonicalName":"collectionSamplingLogIntervalSeconds"}}
mongo-demo-1     | 2025-01-13T01:47:12.010429517Z {"t":{"$date":"2025-01-13T01:47:12.010+00:00"},"s":"W",  "c":"NETWORK",  "id":23803,   "ctx":"ftdc","msg":"Use of deprecated server parameter 'sslMode', please use 'tlsMode' instead."}
mongo-demo-1     | 2025-01-13T01:47:12.010633678Z {"t":{"$date":"2025-01-13T01:47:12.010+00:00"},"s":"W",  "c":"CONTROL",  "id":636300,  "ctx":"ftdc","msg":"Use of deprecated server parameter name","attr":{"deprecatedName":"wiredTigerConcurrentReadTransactions","canonicalName":"storageEngineConcurrentReadTransactions"}}
mongo-demo-1     | 2025-01-13T01:47:12.010657219Z {"t":{"$date":"2025-01-13T01:47:12.010+00:00"},"s":"W",  "c":"CONTROL",  "id":636300,  "ctx":"ftdc","msg":"Use of deprecated server parameter name","attr":{"deprecatedName":"wiredTigerConcurrentWriteTransactions","canonicalName":"storageEngineConcurrentWriteTransactions"}}
mongo-demo-1     | 2025-01-13T01:47:13.248999747Z {"t":{"$date":"2025-01-13T01:47:13.248+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"172.18.0.3:55470","uuid":{"uuid":{"$uuid":"9d313bf7-016e-4d80-af0c-2cee259e340d"}},"connectionId":3,"connectionCount":1}}
mongo-demo-1     | 2025-01-13T01:47:13.258367245Z {"t":{"$date":"2025-01-13T01:47:13.258+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn3","msg":"client metadata","attr":{"remote":"172.18.0.3:55470","client":"conn3","negotiatedCompressors":[],"doc":{"driver":{"name":"nodejs","version":"4.13.0"},"os":{"type":"Linux","name":"linux","architecture":"x64","version":"6.8.0-51-generic"},"platform":"Node.js v18.20.3, LE (unified)|Node.js v18.20.3, LE (unified)"}}}
mongo-demo-1     | 2025-01-13T01:47:13.269868703Z {"t":{"$date":"2025-01-13T01:47:13.269+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"172.18.0.3:55476","uuid":{"uuid":{"$uuid":"61ea7100-be6b-4267-b335-0ef382464de1"}},"connectionId":4,"connectionCount":2}}
mongo-demo-1     | 2025-01-13T01:47:13.273478471Z {"t":{"$date":"2025-01-13T01:47:13.273+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn4","msg":"client metadata","attr":{"remote":"172.18.0.3:55476","client":"conn4","negotiatedCompressors":[],"doc":{"driver":{"name":"nodejs","version":"4.13.0"},"os":{"type":"Linux","name":"linux","architecture":"x64","version":"6.8.0-51-generic"},"platform":"Node.js v18.20.3, LE (unified)|Node.js v18.20.3, LE (unified)"}}}
mongo-demo-1     | 2025-01-13T01:47:13.276489753Z {"t":{"$date":"2025-01-13T01:47:13.276+00:00"},"s":"I",  "c":"ACCESS",   "id":6788604, "ctx":"conn4","msg":"Auth metrics report","attr":{"metric":"acquireUser","micros":0}}
mongo-demo-1     | 2025-01-13T01:47:13.305157143Z {"t":{"$date":"2025-01-13T01:47:13.304+00:00"},"s":"I",  "c":"ACCESS",   "id":5286306, "ctx":"conn4","msg":"Successfully authenticated","attr":{"client":"172.18.0.3:55476","isSpeculative":true,"isClusterMember":false,"mechanism":"SCRAM-SHA-256","user":"admin","db":"admin","result":0,"metrics":{"conversation_duration":{"micros":28650,"summary":{"0":{"step":1,"step_total":2,"duration_micros":122},"1":{"step":2,"step_total":2,"duration_micros":44}}}},"extraInfo":{}}}
mongo-demo-1     | 2025-01-13T01:47:13.308539045Z {"t":{"$date":"2025-01-13T01:47:13.308+00:00"},"s":"I",  "c":"NETWORK",  "id":6788700, "ctx":"conn4","msg":"Received first command on ingress connection since session start or auth handshake","attr":{"elapsedMillis":3}}
mongo-demo-1     | 2025-01-13T01:47:23.772932374Z {"t":{"$date":"2025-01-13T01:47:23.772+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"172.18.0.3:45830","uuid":{"uuid":{"$uuid":"40014527-d2a9-406e-b27c-73f630c12a9c"}},"connectionId":5,"connectionCount":3}}
mongo-demo-1     | 2025-01-13T01:47:23.774343687Z {"t":{"$date":"2025-01-13T01:47:23.774+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn5","msg":"client metadata","attr":{"remote":"172.18.0.3:45830","client":"conn5","negotiatedCompressors":[],"doc":{"driver":{"name":"nodejs","version":"4.13.0"},"os":{"type":"Linux","name":"linux","architecture":"x64","version":"6.8.0-51-generic"},"platform":"Node.js v18.20.3, LE (unified)|Node.js v18.20.3, LE (unified)"}}}
mongo-demo-1     | 2025-01-13T01:48:11.106594979Z {"t":{"$date":"2025-01-13T01:48:11.106+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732891,"ts_usec":105960,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 4, snapshot max: 4 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
mongo-demo-1     | 2025-01-13T01:49:11.119577811Z {"t":{"$date":"2025-01-13T01:49:11.119+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732951,"ts_usec":119360,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 5, snapshot max: 5 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
mongo-demo-1     | 2025-01-13T01:50:11.126950977Z {"t":{"$date":"2025-01-13T01:50:11.126+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733011,"ts_usec":126507,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 6, snapshot max: 6 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
mongo-demo-1     | 2025-01-13T01:51:11.139273826Z {"t":{"$date":"2025-01-13T01:51:11.139+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733071,"ts_usec":138996,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 7, snapshot max: 7 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
mongo-demo-1     | 2025-01-13T01:52:11.154395788Z {"t":{"$date":"2025-01-13T01:52:11.153+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733131,"ts_usec":153783,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 10, snapshot max: 10 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
mongo-demo-1     | 2025-01-13T01:53:11.168446919Z {"t":{"$date":"2025-01-13T01:53:11.168+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733191,"ts_usec":168053,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 11, snapshot max: 11 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
mongo-demo-1     | 2025-01-13T01:54:11.180380712Z {"t":{"$date":"2025-01-13T01:54:11.180+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733251,"ts_usec":180136,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 12, snapshot max: 12 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
mongo-demo-1     | 2025-01-13T01:55:11.190892570Z {"t":{"$date":"2025-01-13T01:55:11.190+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733311,"ts_usec":190688,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 13, snapshot max: 13 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
mongo-demo-1     | 2025-01-13T01:56:11.205779045Z {"t":{"$date":"2025-01-13T01:56:11.205+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733371,"ts_usec":205574,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 14, snapshot max: 14 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
mongo-demo-1     | 2025-01-13T01:57:11.216304854Z {"t":{"$date":"2025-01-13T01:57:11.215+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733431,"ts_usec":215869,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 15, snapshot max: 15 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
mongo-demo-1     | 2025-01-13T01:58:11.228482358Z {"t":{"$date":"2025-01-13T01:58:11.228+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733491,"ts_usec":228217,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 16, snapshot max: 16 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
mongo-demo-1     | 2025-01-13T01:59:11.240015805Z {"t":{"$date":"2025-01-13T01:59:11.239+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733551,"ts_usec":239584,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 17, snapshot max: 17 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
mongo-demo-1     | 2025-01-13T02:00:11.251822822Z {"t":{"$date":"2025-01-13T02:00:11.251+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733611,"ts_usec":251509,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 18, snapshot max: 18 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
mongo-demo-1     | 2025-01-13T02:01:11.263177982Z {"t":{"$date":"2025-01-13T02:01:11.262+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733671,"ts_usec":262727,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 19, snapshot max: 19 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
mongo-demo-1     | 2025-01-13T02:02:11.277210162Z {"t":{"$date":"2025-01-13T02:02:11.276+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733731,"ts_usec":276742,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 20, snapshot max: 20 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
mongo-demo-1     | 2025-01-13T02:03:11.289494582Z {"t":{"$date":"2025-01-13T02:03:11.289+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733791,"ts_usec":289021,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 21, snapshot max: 21 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
mongo-demo-1     | 2025-01-13T02:04:11.302690845Z {"t":{"$date":"2025-01-13T02:04:11.302+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733851,"ts_usec":302246,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 22, snapshot max: 22 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
mongo-demo-1     | 2025-01-13T02:05:11.314685436Z {"t":{"$date":"2025-01-13T02:05:11.314+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733911,"ts_usec":314261,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 23, snapshot max: 23 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
mongo-demo-1     | 2025-01-13T02:06:11.328647952Z {"t":{"$date":"2025-01-13T02:06:11.328+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733971,"ts_usec":328352,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 24, snapshot max: 24 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
mongo-demo-1     | 2025-01-13T02:07:11.342227911Z {"t":{"$date":"2025-01-13T02:07:11.342+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736734031,"ts_usec":341961,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 25, snapshot max: 25 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
```

---

### **`docker compose -f mongo-services.yaml logs --tail 1 --follow --timestamps`**

- **Descripción:** *Muestra solo la **última línea de logs** por servicio y sigue generando logs en tiempo real.*
- **Escenario útil:** *Cuando necesitas ver el estado más reciente de los servicios.*

```bash
mongo-demo-1     | 2025-01-13T02:09:11.370359075Z {"t":{"$date":"2025-01-13T02:09:11.370+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736734151,"ts_usec":370151,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 27, snapshot max: 27 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
mongo-express-1  | 2025-01-13T01:47:13.349798783Z basicAuth credentials are "admin:pass", it is recommended you change this in your config.js!
```

---

### **Usando `--since` y `--until`**

1. **Comando:**

   ```bash
   docker compose -f mongo-services.yaml logs --since 10m --until 5m --timestamps
   ```

2. **Descripción:**
   - *Muestra los logs generados entre **hace 10 minutos** y **hace 5 minutos** desde la hora actual.*
   - *Ideal para depurar un problema ocurrido en un intervalo específico.*

    ```bash
    mongo-demo-1  | 2025-01-13T02:00:11.251822822Z {"t":{"$date":"2025-01-13T02:00:11.251+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733611,"ts_usec":251509,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 18, snapshot max: 18 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
    mongo-demo-1  | 2025-01-13T02:01:11.263177982Z {"t":{"$date":"2025-01-13T02:01:11.262+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733671,"ts_usec":262727,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 19, snapshot max: 19 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
    mongo-demo-1  | 2025-01-13T02:02:11.277210162Z {"t":{"$date":"2025-01-13T02:02:11.276+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733731,"ts_usec":276742,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 20, snapshot max: 20 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
    mongo-demo-1  | 2025-01-13T02:03:11.289494582Z {"t":{"$date":"2025-01-13T02:03:11.289+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733791,"ts_usec":289021,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 21, snapshot max: 21 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
    mongo-demo-1  | 2025-01-13T02:04:11.302690845Z {"t":{"$date":"2025-01-13T02:04:11.302+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733851,"ts_usec":302246,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 22, snapshot max: 22 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
    ```

---

### **Logs desde una fecha específica**

1. **Comando:**

   ```bash
   docker compose -f mongo-services.yaml logs --since "2025-01-12T10:00:00" --timestamps
   ```

2. **Descripción:**
   - *Muestra todos los logs generados desde el **12 de enero de 2025 a las 10:00 AM UTC** en adelante.*

    ```bash
    mongo-express-1  | 2025-01-13T01:39:17.850664298Z Waiting For Mongo
    mongo-express-1  | 2025-01-13T01:39:18.853414342Z Waiting For Mongo
    mongo-express-1  | 2025-01-13T01:39:19.856109242Z Waiting For Mongo
    mongo-express-1  | 2025-01-13T01:39:20.859147655Z Waiting For Mongo
    mongo-express-1  | 2025-01-13T01:39:21.862758829Z Waiting For Mongo
    mongo-express-1  | 2025-01-13T01:39:22.865577957Z Waiting For Mongo
    mongo-express-1  | 2025-01-13T01:39:23.878332902Z Waiting For Mongo
    mongo-express-1  | 2025-01-13T01:39:24.882393472Z mongo-demo (172.18.0.2:27017) open
    mongo-express-1  | 2025-01-13T01:39:24.896238037Z Waiting for mongo-demo:27017...
    mongo-express-1  | 2025-01-13T01:39:26.436400465Z No custom config.js found, loading config.default.js
    mongo-express-1  | 2025-01-13T01:39:26.437327923Z Welcome to mongo-express 1.0.2
    mongo-express-1  | 2025-01-13T01:39:26.437349336Z ------------------------
    mongo-express-1  | 2025-01-13T01:39:26.437368615Z 
    mongo-express-1  | 2025-01-13T01:39:26.437375463Z 
    mongo-express-1  | 2025-01-13T01:39:26.593021657Z Mongo Express server listening at http://0.0.0.0:8081
    mongo-express-1  | 2025-01-13T01:39:26.593961947Z [31mServer is open to allow connections from anyone (0.0.0.0)[39m
    mongo-express-1  | 2025-01-13T01:39:26.594037101Z [31mbasicAuth credentials are "admin:pass", it is recommended you change this in your config.js![39m
    mongo-express-1  | 2025-01-13T01:47:09.776335531Z Waiting For Mongo
    mongo-express-1  | 2025-01-13T01:47:10.780472429Z Waiting For Mongo
    mongo-express-1  | 2025-01-13T01:47:11.782689675Z mongo-demo (172.18.0.2:27017) open
    mongo-express-1  | 2025-01-13T01:47:11.785687188Z Waiting for mongo-demo:27017...
    mongo-express-1  | 2025-01-13T01:47:13.205646278Z No custom config.js found, loading config.default.js
    mongo-express-1  | 2025-01-13T01:47:13.207275358Z Welcome to mongo-express 1.0.2
    mongo-express-1  | 2025-01-13T01:47:13.207421607Z ------------------------
    mongo-express-1  | 2025-01-13T01:47:13.207502348Z 
    mongo-express-1  | 2025-01-13T01:47:13.207518292Z 
    mongo-express-1  | 2025-01-13T01:47:13.348787635Z Mongo Express server listening at http://0.0.0.0:8081
    mongo-express-1  | 2025-01-13T01:47:13.349744338Z [31mServer is open to allow connections from anyone (0.0.0.0)[39m
    mongo-express-1  | 2025-01-13T01:47:13.349798783Z [31mbasicAuth credentials are "admin:pass", it is recommended you change this in your config.js![39m
    mongo-demo-1     | 2025-01-13T01:39:17.612192620Z about to fork child process, waiting until server is ready for connections.
    mongo-demo-1     | 2025-01-13T01:39:17.615532252Z forked process: 28
    mongo-demo-1     | 2025-01-13T01:39:17.616837611Z 
    mongo-demo-1     | 2025-01-13T01:39:17.616868778Z {"t":{"$date":"2025-01-13T01:39:17.616+00:00"},"s":"I",  "c":"CONTROL",  "id":20698,   "ctx":"main","msg":"***** SERVER RESTARTED *****"}
    mongo-demo-1     | 2025-01-13T01:39:17.619068165Z {"t":{"$date":"2025-01-13T01:39:17.618+00:00"},"s":"I",  "c":"CONTROL",  "id":23285,   "ctx":"main","msg":"Automatically disabling TLS 1.0, to force-enable TLS 1.0 specify --sslDisabledProtocols 'none'"}
    mongo-demo-1     | 2025-01-13T01:39:17.624968217Z {"t":{"$date":"2025-01-13T01:39:17.624+00:00"},"s":"I",  "c":"CONTROL",  "id":5945603, "ctx":"main","msg":"Multi threading initialized"}
    mongo-demo-1     | 2025-01-13T01:39:17.625985044Z {"t":{"$date":"2025-01-13T01:39:17.625+00:00"},"s":"I",  "c":"NETWORK",  "id":4648601, "ctx":"main","msg":"Implicit TCP FastOpen unavailable. If TCP FastOpen is required, set at least one of the related parameters","attr":{"relatedParameters":["tcpFastOpenServer","tcpFastOpenClient","tcpFastOpenQueueSize"]}}
    mongo-demo-1     | 2025-01-13T01:39:17.629633539Z {"t":{"$date":"2025-01-13T01:39:17.629+00:00"},"s":"I",  "c":"NETWORK",  "id":4915701, "ctx":"main","msg":"Initialized wire specification","attr":{"spec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":25},"outgoing":{"minWireVersion":6,"maxWireVersion":25},"isInternalClient":true}}}
    mongo-demo-1     | 2025-01-13T01:39:17.630529191Z {"t":{"$date":"2025-01-13T01:39:17.630+00:00"},"s":"I",  "c":"TENANT_M", "id":7091600, "ctx":"main","msg":"Starting TenantMigrationAccessBlockerRegistry"}
    mongo-demo-1     | 2025-01-13T01:39:17.630774914Z {"t":{"$date":"2025-01-13T01:39:17.630+00:00"},"s":"I",  "c":"CONTROL",  "id":4615611, "ctx":"initandlisten","msg":"MongoDB starting","attr":{"pid":28,"port":27017,"dbPath":"/data/db","architecture":"64-bit","host":"8c08ec298d66"}}
    mongo-demo-1     | 2025-01-13T01:39:17.630794998Z {"t":{"$date":"2025-01-13T01:39:17.630+00:00"},"s":"I",  "c":"CONTROL",  "id":23403,   "ctx":"initandlisten","msg":"Build Info","attr":{"buildInfo":{"version":"8.0.4","gitVersion":"bc35ab4305d9920d9d0491c1c9ef9b72383d31f9","openSSLVersion":"OpenSSL 3.0.13 30 Jan 2024","modules":[],"allocator":"tcmalloc-google","environment":{"distmod":"ubuntu2404","distarch":"x86_64","target_arch":"x86_64"}}}}
    mongo-demo-1     | 2025-01-13T01:39:17.630854942Z {"t":{"$date":"2025-01-13T01:39:17.630+00:00"},"s":"I",  "c":"CONTROL",  "id":51765,   "ctx":"initandlisten","msg":"Operating System","attr":{"os":{"name":"Ubuntu","version":"24.04"}}}
    mongo-demo-1     | 2025-01-13T01:39:17.630864871Z {"t":{"$date":"2025-01-13T01:39:17.630+00:00"},"s":"I",  "c":"CONTROL",  "id":21951,   "ctx":"initandlisten","msg":"Options set by command line","attr":{"options":{"net":{"bindIp":"127.0.0.1","port":27017,"tls":{"mode":"disabled"}},"processManagement":{"fork":true,"pidFilePath":"/tmp/docker-entrypoint-temp-mongod.pid"},"systemLog":{"destination":"file","logAppend":true,"path":"/proc/1/fd/1"}}}}
    mongo-demo-1     | 2025-01-13T01:39:17.632297676Z {"t":{"$date":"2025-01-13T01:39:17.632+00:00"},"s":"I",  "c":"STORAGE",  "id":22297,   "ctx":"initandlisten","msg":"Using the XFS filesystem is strongly recommended with the WiredTiger storage engine. See http://dochub.mongodb.org/core/prodnotes-filesystem","tags":["startupWarnings"]}
    mongo-demo-1     | 2025-01-13T01:39:17.632416620Z {"t":{"$date":"2025-01-13T01:39:17.632+00:00"},"s":"I",  "c":"STORAGE",  "id":22315,   "ctx":"initandlisten","msg":"Opening WiredTiger","attr":{"config":"create,cache_size=3413M,session_max=33000,eviction=(threads_min=4,threads_max=4),config_base=false,statistics=(fast),log=(enabled=true,remove=true,path=journal,compressor=snappy),builtin_extension_config=(zstd=(compression_level=6)),file_manager=(close_idle_time=600,close_scan_interval=10,close_handle_minimum=2000),statistics_log=(wait=0),json_output=(error,message),verbose=[recovery_progress:1,checkpoint_progress:1,compact_progress:1,backup:0,checkpoint:0,compact:0,evict:0,history_store:0,recovery:0,rts:0,salvage:0,tiered:0,timestamp:0,transaction:0,verify:0,log:0],prefetch=(available=true,default=false),"}}
    mongo-demo-1     | 2025-01-13T01:39:18.706517775Z {"t":{"$date":"2025-01-13T01:39:18.706+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732358,"ts_usec":705942,"thread":"28:0x7159553ad680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery log replay has successfully finished and ran for 0 milliseconds"}}}
    mongo-demo-1     | 2025-01-13T01:39:18.706622386Z {"t":{"$date":"2025-01-13T01:39:18.706+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732358,"ts_usec":706194,"thread":"28:0x7159553ad680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Set global recovery timestamp: (0, 0)"}}}
    mongo-demo-1     | 2025-01-13T01:39:18.706731728Z {"t":{"$date":"2025-01-13T01:39:18.706+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732358,"ts_usec":706364,"thread":"28:0x7159553ad680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Set global oldest timestamp: (0, 0)"}}}
    mongo-demo-1     | 2025-01-13T01:39:18.707158559Z {"t":{"$date":"2025-01-13T01:39:18.706+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732358,"ts_usec":706628,"thread":"28:0x7159553ad680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery was completed successfully and took 1ms, including 0ms for the log replay, 0ms for the rollback to stable, and 0ms for the checkpoint."}}}
    mongo-demo-1     | 2025-01-13T01:39:18.729721055Z {"t":{"$date":"2025-01-13T01:39:18.729+00:00"},"s":"I",  "c":"STORAGE",  "id":4795906, "ctx":"initandlisten","msg":"WiredTiger opened","attr":{"durationMillis":1097}}
    mongo-demo-1     | 2025-01-13T01:39:18.729755635Z {"t":{"$date":"2025-01-13T01:39:18.729+00:00"},"s":"I",  "c":"RECOVERY", "id":23987,   "ctx":"initandlisten","msg":"WiredTiger recoveryTimestamp","attr":{"recoveryTimestamp":{"$timestamp":{"t":0,"i":0}}}}
    mongo-demo-1     | 2025-01-13T01:39:18.761114959Z {"t":{"$date":"2025-01-13T01:39:18.760+00:00"},"s":"W",  "c":"CONTROL",  "id":22120,   "ctx":"initandlisten","msg":"Access control is not enabled for the database. Read and write access to data and configuration is unrestricted","tags":["startupWarnings"]}
    mongo-demo-1     | 2025-01-13T01:39:18.761427910Z {"t":{"$date":"2025-01-13T01:39:18.761+00:00"},"s":"W",  "c":"CONTROL",  "id":9068900, "ctx":"initandlisten","msg":"For customers running the current memory allocator, we suggest changing the contents of the following sysfsFile","attr":{"allocator":"tcmalloc-google","sysfsFile":"/sys/kernel/mm/transparent_hugepage/enabled","currentValue":"never","desiredValue":"always"},"tags":["startupWarnings"]}
    mongo-demo-1     | 2025-01-13T01:39:18.761631352Z {"t":{"$date":"2025-01-13T01:39:18.761+00:00"},"s":"W",  "c":"CONTROL",  "id":9068900, "ctx":"initandlisten","msg":"For customers running the current memory allocator, we suggest changing the contents of the following sysfsFile","attr":{"allocator":"tcmalloc-google","sysfsFile":"/sys/kernel/mm/transparent_hugepage/defrag","currentValue":"madvise","desiredValue":"defer+madvise"},"tags":["startupWarnings"]}
    mongo-demo-1     | 2025-01-13T01:39:18.761825243Z {"t":{"$date":"2025-01-13T01:39:18.761+00:00"},"s":"W",  "c":"CONTROL",  "id":8640302, "ctx":"initandlisten","msg":"We suggest setting the contents of sysfsFile to 0.","attr":{"sysfsFile":"/sys/kernel/mm/transparent_hugepage/khugepaged/max_ptes_none","currentValue":511},"tags":["startupWarnings"]}
    mongo-demo-1     | 2025-01-13T01:39:18.761998537Z {"t":{"$date":"2025-01-13T01:39:18.761+00:00"},"s":"W",  "c":"CONTROL",  "id":8718500, "ctx":"initandlisten","msg":"Your system has glibc support for rseq built in, which is not yet supported by tcmalloc-google and has critical performance implications. Please set the environment variable GLIBC_TUNABLES=glibc.pthread.rseq=0","tags":["startupWarnings"]}
    mongo-demo-1     | 2025-01-13T01:39:18.763638922Z {"t":{"$date":"2025-01-13T01:39:18.762+00:00"},"s":"W",  "c":"NETWORK",  "id":5123300, "ctx":"initandlisten","msg":"vm.max_map_count is too low","attr":{"currentValue":1048576,"recommendedMinimum":1677720,"maxConns":838860},"tags":["startupWarnings"]}
    mongo-demo-1     | 2025-01-13T01:39:18.765305480Z {"t":{"$date":"2025-01-13T01:39:18.762+00:00"},"s":"W",  "c":"CONTROL",  "id":8386700, "ctx":"initandlisten","msg":"We suggest setting swappiness to 0 or 1, as swapping can cause performance problems.","attr":{"sysfsFile":"/proc/sys/vm/swappiness","currentValue":60},"tags":["startupWarnings"]}
    mongo-demo-1     | 2025-01-13T01:39:18.765333771Z {"t":{"$date":"2025-01-13T01:39:18.762+00:00"},"s":"I",  "c":"STORAGE",  "id":20320,   "ctx":"initandlisten","msg":"createCollection","attr":{"namespace":"admin.system.version","uuidDisposition":"provided","uuid":{"uuid":{"$uuid":"d3e23667-7b14-4a6a-a7f5-ac0c17687173"}},"options":{"uuid":{"$uuid":"d3e23667-7b14-4a6a-a7f5-ac0c17687173"}}}}
    mongo-demo-1     | 2025-01-13T01:39:18.792855200Z {"t":{"$date":"2025-01-13T01:39:18.792+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"initandlisten","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"d3e23667-7b14-4a6a-a7f5-ac0c17687173"}},"namespace":"admin.system.version","index":"_id_","ident":"index-1-12399604680041414386","collectionIdent":"collection-0-12399604680041414386","commitTimestamp":null}}
    mongo-demo-1     | 2025-01-13T01:39:18.793164310Z {"t":{"$date":"2025-01-13T01:39:18.792+00:00"},"s":"I",  "c":"REPL",     "id":20459,   "ctx":"initandlisten","msg":"Setting featureCompatibilityVersion","attr":{"newVersion":"8.0"}}
    mongo-demo-1     | 2025-01-13T01:39:18.793191615Z {"t":{"$date":"2025-01-13T01:39:18.793+00:00"},"s":"I",  "c":"REPL",     "id":5853300, "ctx":"initandlisten","msg":"current featureCompatibilityVersion value","attr":{"featureCompatibilityVersion":"8.0","context":"setFCV"}}
    mongo-demo-1     | 2025-01-13T01:39:18.793328242Z {"t":{"$date":"2025-01-13T01:39:18.793+00:00"},"s":"I",  "c":"NETWORK",  "id":4915702, "ctx":"initandlisten","msg":"Updated wire specification","attr":{"oldSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":25},"outgoing":{"minWireVersion":6,"maxWireVersion":25},"isInternalClient":true},"newSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":25,"maxWireVersion":25},"outgoing":{"minWireVersion":25,"maxWireVersion":25},"isInternalClient":true}}}
    mongo-demo-1     | 2025-01-13T01:39:18.793591740Z {"t":{"$date":"2025-01-13T01:39:18.793+00:00"},"s":"I",  "c":"NETWORK",  "id":4915702, "ctx":"initandlisten","msg":"Updated wire specification","attr":{"oldSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":25,"maxWireVersion":25},"outgoing":{"minWireVersion":25,"maxWireVersion":25},"isInternalClient":true},"newSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":25,"maxWireVersion":25},"outgoing":{"minWireVersion":25,"maxWireVersion":25},"isInternalClient":true}}}
    mongo-demo-1     | 2025-01-13T01:39:18.793612543Z {"t":{"$date":"2025-01-13T01:39:18.793+00:00"},"s":"I",  "c":"REPL",     "id":5853300, "ctx":"initandlisten","msg":"current featureCompatibilityVersion value","attr":{"featureCompatibilityVersion":"8.0","context":"startup"}}
    mongo-demo-1     | 2025-01-13T01:39:18.793841985Z {"t":{"$date":"2025-01-13T01:39:18.793+00:00"},"s":"I",  "c":"STORAGE",  "id":5071100, "ctx":"initandlisten","msg":"Clearing temp directory"}
    mongo-demo-1     | 2025-01-13T01:39:18.794152440Z {"t":{"$date":"2025-01-13T01:39:18.793+00:00"},"s":"I",  "c":"CONTROL",  "id":6608200, "ctx":"initandlisten","msg":"Initializing cluster server parameters from disk"}
    mongo-demo-1     | 2025-01-13T01:39:18.794254042Z {"t":{"$date":"2025-01-13T01:39:18.794+00:00"},"s":"I",  "c":"CONTROL",  "id":20536,   "ctx":"initandlisten","msg":"Flow Control is enabled on this deployment"}
    mongo-demo-1     | 2025-01-13T01:39:18.794968255Z {"t":{"$date":"2025-01-13T01:39:18.794+00:00"},"s":"I",  "c":"FTDC",     "id":20625,   "ctx":"initandlisten","msg":"Initializing full-time diagnostic data capture","attr":{"dataDirectory":"/data/db/diagnostic.data"}}
    mongo-demo-1     | 2025-01-13T01:39:18.798073471Z {"t":{"$date":"2025-01-13T01:39:18.797+00:00"},"s":"I",  "c":"STORAGE",  "id":20320,   "ctx":"initandlisten","msg":"createCollection","attr":{"namespace":"local.startup_log","uuidDisposition":"generated","uuid":{"uuid":{"$uuid":"7f2b5e5f-f988-4249-88eb-6673c9676239"}},"options":{"capped":true,"size":10485760}}}
    mongo-demo-1     | 2025-01-13T01:39:18.824256221Z {"t":{"$date":"2025-01-13T01:39:18.824+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"initandlisten","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"7f2b5e5f-f988-4249-88eb-6673c9676239"}},"namespace":"local.startup_log","index":"_id_","ident":"index-3-12399604680041414386","collectionIdent":"collection-2-12399604680041414386","commitTimestamp":null}}
    mongo-demo-1     | 2025-01-13T01:39:18.824319233Z {"t":{"$date":"2025-01-13T01:39:18.824+00:00"},"s":"I",  "c":"REPL",     "id":6015317, "ctx":"initandlisten","msg":"Setting new configuration state","attr":{"newState":"ConfigReplicationDisabled","oldState":"ConfigPreStart"}}
    mongo-demo-1     | 2025-01-13T01:39:18.824587019Z {"t":{"$date":"2025-01-13T01:39:18.824+00:00"},"s":"I",  "c":"STORAGE",  "id":22262,   "ctx":"initandlisten","msg":"Timestamp monitor starting"}
    mongo-demo-1     | 2025-01-13T01:39:18.824720266Z {"t":{"$date":"2025-01-13T01:39:18.824+00:00"},"s":"I",  "c":"STORAGE",  "id":7333401, "ctx":"initandlisten","msg":"Starting the DiskSpaceMonitor"}
    mongo-demo-1     | 2025-01-13T01:39:18.826303054Z {"t":{"$date":"2025-01-13T01:39:18.825+00:00"},"s":"I",  "c":"NETWORK",  "id":23015,   "ctx":"listener","msg":"Listening on","attr":{"address":"/tmp/mongodb-27017.sock"}}
    mongo-demo-1     | 2025-01-13T01:39:18.826334156Z {"t":{"$date":"2025-01-13T01:39:18.826+00:00"},"s":"I",  "c":"NETWORK",  "id":23015,   "ctx":"listener","msg":"Listening on","attr":{"address":"127.0.0.1:27017"}}
    mongo-demo-1     | 2025-01-13T01:39:18.826346003Z {"t":{"$date":"2025-01-13T01:39:18.826+00:00"},"s":"I",  "c":"NETWORK",  "id":23016,   "ctx":"listener","msg":"Waiting for connections","attr":{"port":27017,"ssl":"off"}}
    mongo-demo-1     | 2025-01-13T01:39:18.826629995Z {"t":{"$date":"2025-01-13T01:39:18.826+00:00"},"s":"I",  "c":"CONTROL",  "id":8423403, "ctx":"initandlisten","msg":"mongod startup complete","attr":{"Summary of time elapsed":{"Startup from clean shutdown?":true,"Statistics":{"Set up periodic runner":"0 ms","Set up online certificate status protocol manager":"0 ms","Transport layer setup":"0 ms","Run initial syncer crash recovery":"0 ms","Create storage engine lock file in the data directory":"0 ms","Get metadata describing storage engine":"0 ms","Create storage engine":"1119 ms","Write current PID to file":"0 ms","Write a new metadata for storage engine":"0 ms","Initialize FCV before rebuilding indexes":"0 ms","Drop abandoned idents and get back indexes that need to be rebuilt or builds that need to be restarted":"0 ms","Rebuild indexes for collections":"0 ms","Load cluster parameters from disk for a standalone":"0 ms","Build user and roles graph":"0 ms","Set up the background thread pool responsible for waiting for opTimes to be majority committed":"0 ms","Start up the replication coordinator":"0 ms","Ensure the change stream collections on startup contain consistent data":"0 ms","Write startup options to the audit log":"0 ms","Start transport layer":"1 ms","_initAndListen total elapsed time":"1196 ms"}}}}
    mongo-demo-1     | 2025-01-13T01:39:18.827883750Z child process started successfully, parent exiting
    mongo-demo-1     | 2025-01-13T01:39:18.829054707Z {"t":{"$date":"2025-01-13T01:39:18.828+00:00"},"s":"I",  "c":"CONTROL",  "id":20712,   "ctx":"LogicalSessionCacheReap","msg":"Sessions collection is not set up; waiting until next sessions reap interval","attr":{"error":"NamespaceNotFound: config.system.sessions does not exist"}}
    mongo-demo-1     | 2025-01-13T01:39:18.829379886Z {"t":{"$date":"2025-01-13T01:39:18.829+00:00"},"s":"I",  "c":"STORAGE",  "id":20320,   "ctx":"LogicalSessionCacheRefresh","msg":"createCollection","attr":{"namespace":"config.system.sessions","uuidDisposition":"generated","uuid":{"uuid":{"$uuid":"37979c9b-877b-44b1-9f57-685212874494"}},"options":{}}}
    mongo-demo-1     | 2025-01-13T01:39:18.857896792Z {"t":{"$date":"2025-01-13T01:39:18.857+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"LogicalSessionCacheRefresh","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"37979c9b-877b-44b1-9f57-685212874494"}},"namespace":"config.system.sessions","index":"_id_","ident":"index-5-12399604680041414386","collectionIdent":"collection-4-12399604680041414386","commitTimestamp":null}}
    mongo-demo-1     | 2025-01-13T01:39:18.857958958Z {"t":{"$date":"2025-01-13T01:39:18.857+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"LogicalSessionCacheRefresh","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"37979c9b-877b-44b1-9f57-685212874494"}},"namespace":"config.system.sessions","index":"lsidTTLIndex","ident":"index-6-12399604680041414386","collectionIdent":"collection-4-12399604680041414386","commitTimestamp":null}}
    mongo-demo-1     | 2025-01-13T01:39:19.013482391Z {"t":{"$date":"2025-01-13T01:39:19.013+00:00"},"s":"W",  "c":"CONTROL",  "id":636300,  "ctx":"ftdc","msg":"Use of deprecated server parameter name","attr":{"deprecatedName":"internalQueryCacheSize","canonicalName":"internalQueryCacheMaxEntriesPerCollection"}}
    mongo-demo-1     | 2025-01-13T01:39:19.013613048Z {"t":{"$date":"2025-01-13T01:39:19.013+00:00"},"s":"W",  "c":"CONTROL",  "id":636300,  "ctx":"ftdc","msg":"Use of deprecated server parameter name","attr":{"deprecatedName":"oplogSamplingLogIntervalSeconds","canonicalName":"collectionSamplingLogIntervalSeconds"}}
    mongo-demo-1     | 2025-01-13T01:39:19.013942333Z {"t":{"$date":"2025-01-13T01:39:19.013+00:00"},"s":"W",  "c":"NETWORK",  "id":23803,   "ctx":"ftdc","msg":"Use of deprecated server parameter 'sslMode', please use 'tlsMode' instead."}
    mongo-demo-1     | 2025-01-13T01:39:19.013962911Z {"t":{"$date":"2025-01-13T01:39:19.013+00:00"},"s":"W",  "c":"CONTROL",  "id":636300,  "ctx":"ftdc","msg":"Use of deprecated server parameter name","attr":{"deprecatedName":"wiredTigerConcurrentReadTransactions","canonicalName":"storageEngineConcurrentReadTransactions"}}
    mongo-demo-1     | 2025-01-13T01:39:19.013974544Z {"t":{"$date":"2025-01-13T01:39:19.013+00:00"},"s":"W",  "c":"CONTROL",  "id":636300,  "ctx":"ftdc","msg":"Use of deprecated server parameter name","attr":{"deprecatedName":"wiredTigerConcurrentWriteTransactions","canonicalName":"storageEngineConcurrentWriteTransactions"}}
    mongo-demo-1     | 2025-01-13T01:39:19.564406383Z {"t":{"$date":"2025-01-13T01:39:19.564+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"127.0.0.1:48600","uuid":{"uuid":{"$uuid":"ba4c43fe-ff99-4c3c-9c04-fa2278d76e0a"}},"connectionId":1,"connectionCount":1}}
    mongo-demo-1     | 2025-01-13T01:39:19.572070306Z {"t":{"$date":"2025-01-13T01:39:19.571+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn1","msg":"client metadata","attr":{"remote":"127.0.0.1:48600","client":"conn1","negotiatedCompressors":[],"doc":{"application":{"name":"mongosh 2.3.4"},"driver":{"name":"nodejs|mongosh","version":"6.11.0|2.3.4"},"platform":"Node.js v20.18.1, LE","os":{"name":"linux","architecture":"x64","version":"3.10.0-327.22.2.el7.x86_64","type":"Linux"},"env":{"container":{"runtime":"docker"}}}}}
    mongo-demo-1     | 2025-01-13T01:39:19.709113942Z {"t":{"$date":"2025-01-13T01:39:19.708+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn1","msg":"Connection ended","attr":{"remote":"127.0.0.1:48600","uuid":{"uuid":{"$uuid":"ba4c43fe-ff99-4c3c-9c04-fa2278d76e0a"}},"connectionId":1,"connectionCount":0}}
    mongo-demo-1     | 2025-01-13T01:39:20.274696774Z {"t":{"$date":"2025-01-13T01:39:20.274+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"127.0.0.1:48604","uuid":{"uuid":{"$uuid":"ec258f83-c48f-4b3e-a389-8ea6da69af49"}},"connectionId":2,"connectionCount":1}}
    mongo-demo-1     | 2025-01-13T01:39:20.281572536Z {"t":{"$date":"2025-01-13T01:39:20.281+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn2","msg":"client metadata","attr":{"remote":"127.0.0.1:48604","client":"conn2","negotiatedCompressors":[],"doc":{"application":{"name":"mongosh 2.3.4"},"driver":{"name":"nodejs|mongosh","version":"6.11.0|2.3.4"},"platform":"Node.js v20.18.1, LE","os":{"name":"linux","architecture":"x64","version":"3.10.0-327.22.2.el7.x86_64","type":"Linux"},"env":{"container":{"runtime":"docker"}}}}}
    mongo-demo-1     | 2025-01-13T01:39:20.370113593Z {"t":{"$date":"2025-01-13T01:39:20.369+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"127.0.0.1:48616","uuid":{"uuid":{"$uuid":"f6b5a7ba-5936-4d11-8fb4-f87d4ba7eab2"}},"connectionId":3,"connectionCount":2}}
    mongo-demo-1     | 2025-01-13T01:39:20.370460508Z {"t":{"$date":"2025-01-13T01:39:20.370+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"127.0.0.1:48626","uuid":{"uuid":{"$uuid":"931482c2-3f9e-493c-b1bb-d4188c1350f3"}},"connectionId":4,"connectionCount":3}}
    mongo-demo-1     | 2025-01-13T01:39:20.373295513Z {"t":{"$date":"2025-01-13T01:39:20.372+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn3","msg":"client metadata","attr":{"remote":"127.0.0.1:48616","client":"conn3","negotiatedCompressors":[],"doc":{"application":{"name":"mongosh 2.3.4"},"driver":{"name":"nodejs|mongosh","version":"6.11.0|2.3.4"},"platform":"Node.js v20.18.1, LE","os":{"name":"linux","architecture":"x64","version":"3.10.0-327.22.2.el7.x86_64","type":"Linux"},"env":{"container":{"runtime":"docker"}}}}}
    mongo-demo-1     | 2025-01-13T01:39:20.375168073Z {"t":{"$date":"2025-01-13T01:39:20.374+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn4","msg":"client metadata","attr":{"remote":"127.0.0.1:48626","client":"conn4","negotiatedCompressors":[],"doc":{"application":{"name":"mongosh 2.3.4"},"driver":{"name":"nodejs|mongosh","version":"6.11.0|2.3.4"},"platform":"Node.js v20.18.1, LE","os":{"name":"linux","architecture":"x64","version":"3.10.0-327.22.2.el7.x86_64","type":"Linux"},"env":{"container":{"runtime":"docker"}}}}}
    mongo-demo-1     | 2025-01-13T01:39:20.380022688Z {"t":{"$date":"2025-01-13T01:39:20.379+00:00"},"s":"I",  "c":"NETWORK",  "id":6788700, "ctx":"conn3","msg":"Received first command on ingress connection since session start or auth handshake","attr":{"elapsedMillis":6}}
    mongo-demo-1     | 2025-01-13T01:39:20.380814207Z {"t":{"$date":"2025-01-13T01:39:20.380+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"127.0.0.1:48642","uuid":{"uuid":{"$uuid":"90022798-6c88-4a4d-ad27-7a4dda15bd2b"}},"connectionId":5,"connectionCount":4}}
    mongo-demo-1     | 2025-01-13T01:39:20.388309283Z {"t":{"$date":"2025-01-13T01:39:20.388+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn5","msg":"client metadata","attr":{"remote":"127.0.0.1:48642","client":"conn5","negotiatedCompressors":[],"doc":{"application":{"name":"mongosh 2.3.4"},"driver":{"name":"nodejs|mongosh","version":"6.11.0|2.3.4"},"platform":"Node.js v20.18.1, LE","os":{"name":"linux","architecture":"x64","version":"3.10.0-327.22.2.el7.x86_64","type":"Linux"},"env":{"container":{"runtime":"docker"}}}}}
    mongo-demo-1     | 2025-01-13T01:39:20.394650298Z {"t":{"$date":"2025-01-13T01:39:20.394+00:00"},"s":"I",  "c":"NETWORK",  "id":6788700, "ctx":"conn5","msg":"Received first command on ingress connection since session start or auth handshake","attr":{"elapsedMillis":6}}
    mongo-demo-1     | 2025-01-13T01:39:20.926321483Z admin> ... ... ... ... {"t":{"$date":"2025-01-13T01:39:20.926+00:00"},"s":"I",  "c":"STORAGE",  "id":20320,   "ctx":"conn5","msg":"createCollection","attr":{"namespace":"admin.system.users","uuidDisposition":"generated","uuid":{"uuid":{"$uuid":"db24b4ca-68a1-48cc-b5fd-5a7e2a69e8cf"}},"options":{}}}
    mongo-demo-1     | 2025-01-13T01:39:20.957416553Z {"t":{"$date":"2025-01-13T01:39:20.957+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"conn5","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"db24b4ca-68a1-48cc-b5fd-5a7e2a69e8cf"}},"namespace":"admin.system.users","index":"_id_","ident":"index-8-12399604680041414386","collectionIdent":"collection-7-12399604680041414386","commitTimestamp":null}}
    mongo-demo-1     | 2025-01-13T01:39:20.957463660Z {"t":{"$date":"2025-01-13T01:39:20.957+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"conn5","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"db24b4ca-68a1-48cc-b5fd-5a7e2a69e8cf"}},"namespace":"admin.system.users","index":"user_1_db_1","ident":"index-9-12399604680041414386","collectionIdent":"collection-7-12399604680041414386","commitTimestamp":null}}
    mongo-demo-1     | 2025-01-13T01:39:20.969117132Z { ok: 1 }
    mongo-demo-1     | 2025-01-13T01:39:20.974245422Z admin> {"t":{"$date":"2025-01-13T01:39:20.974+00:00"},"s":"I",  "c":"-",        "id":20883,   "ctx":"conn2","msg":"Interrupted operation as its client disconnected","attr":{"opId":14337}}
    mongo-demo-1     | 2025-01-13T01:39:20.975706430Z {"t":{"$date":"2025-01-13T01:39:20.974+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn2","msg":"Connection ended","attr":{"remote":"127.0.0.1:48604","uuid":{"uuid":{"$uuid":"ec258f83-c48f-4b3e-a389-8ea6da69af49"}},"connectionId":2,"connectionCount":3}}
    mongo-demo-1     | 2025-01-13T01:39:20.975748288Z {"t":{"$date":"2025-01-13T01:39:20.975+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn5","msg":"Connection ended","attr":{"remote":"127.0.0.1:48642","uuid":{"uuid":{"$uuid":"90022798-6c88-4a4d-ad27-7a4dda15bd2b"}},"connectionId":5,"connectionCount":2}}
    mongo-demo-1     | 2025-01-13T01:39:20.975761613Z {"t":{"$date":"2025-01-13T01:39:20.975+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn4","msg":"Connection ended","attr":{"remote":"127.0.0.1:48626","uuid":{"uuid":{"$uuid":"931482c2-3f9e-493c-b1bb-d4188c1350f3"}},"connectionId":4,"connectionCount":1}}
    mongo-demo-1     | 2025-01-13T01:39:20.976195490Z {"t":{"$date":"2025-01-13T01:39:20.975+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn3","msg":"Connection ended","attr":{"remote":"127.0.0.1:48616","uuid":{"uuid":{"$uuid":"f6b5a7ba-5936-4d11-8fb4-f87d4ba7eab2"}},"connectionId":3,"connectionCount":0}}
    mongo-demo-1     | 2025-01-13T01:39:20.998592449Z 
    mongo-demo-1     | 2025-01-13T01:39:20.998808272Z /usr/local/bin/docker-entrypoint.sh: ignoring /docker-entrypoint-initdb.d/*
    mongo-demo-1     | 2025-01-13T01:39:20.998821870Z 
    mongo-demo-1     | 2025-01-13T01:39:21.049696115Z 
    mongo-demo-1     | 2025-01-13T01:39:21.049731499Z {"t":{"$date":"2025-01-13T01:39:21.049+00:00"},"s":"I",  "c":"CONTROL",  "id":20698,   "ctx":"main","msg":"***** SERVER RESTARTED *****"}
    mongo-demo-1     | 2025-01-13T01:39:21.051012037Z {"t":{"$date":"2025-01-13T01:39:21.050+00:00"},"s":"I",  "c":"CONTROL",  "id":23285,   "ctx":"main","msg":"Automatically disabling TLS 1.0, to force-enable TLS 1.0 specify --sslDisabledProtocols 'none'"}
    mongo-demo-1     | 2025-01-13T01:39:21.053143001Z {"t":{"$date":"2025-01-13T01:39:21.052+00:00"},"s":"I",  "c":"CONTROL",  "id":5945603, "ctx":"main","msg":"Multi threading initialized"}
    mongo-demo-1     | 2025-01-13T01:39:21.053572590Z {"t":{"$date":"2025-01-13T01:39:21.053+00:00"},"s":"I",  "c":"NETWORK",  "id":4648601, "ctx":"main","msg":"Implicit TCP FastOpen unavailable. If TCP FastOpen is required, set at least one of the related parameters","attr":{"relatedParameters":["tcpFastOpenServer","tcpFastOpenClient","tcpFastOpenQueueSize"]}}
    mongo-demo-1     | 2025-01-13T01:39:21.053750738Z {"t":{"$date":"2025-01-13T01:39:21.053+00:00"},"s":"I",  "c":"NETWORK",  "id":4915701, "ctx":"main","msg":"Initialized wire specification","attr":{"spec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":25},"outgoing":{"minWireVersion":6,"maxWireVersion":25},"isInternalClient":true}}}
    mongo-demo-1     | 2025-01-13T01:39:21.055845836Z Killing process with pid: 28
    mongo-demo-1     | 2025-01-13T01:39:21.055981904Z {"t":{"$date":"2025-01-13T01:39:21.055+00:00"},"s":"I",  "c":"CONTROL",  "id":23377,   "ctx":"SignalHandler","msg":"Received signal","attr":{"signal":15,"error":"Terminated"}}
    mongo-demo-1     | 2025-01-13T01:39:21.056003144Z {"t":{"$date":"2025-01-13T01:39:21.055+00:00"},"s":"I",  "c":"CONTROL",  "id":23378,   "ctx":"SignalHandler","msg":"Signal was sent by kill(2)","attr":{"pid":108,"uid":999}}
    mongo-demo-1     | 2025-01-13T01:39:21.056013153Z {"t":{"$date":"2025-01-13T01:39:21.055+00:00"},"s":"I",  "c":"CONTROL",  "id":23381,   "ctx":"SignalHandler","msg":"will terminate after current cmd ends"}
    mongo-demo-1     | 2025-01-13T01:39:21.056063271Z {"t":{"$date":"2025-01-13T01:39:21.056+00:00"},"s":"I",  "c":"REPL",     "id":4784900, "ctx":"SignalHandler","msg":"Stepping down the ReplicationCoordinator for shutdown","attr":{"waitTimeMillis":15000}}
    mongo-demo-1     | 2025-01-13T01:39:21.056231570Z {"t":{"$date":"2025-01-13T01:39:21.056+00:00"},"s":"I",  "c":"REPL",     "id":4794602, "ctx":"SignalHandler","msg":"Attempting to enter quiesce mode"}
    mongo-demo-1     | 2025-01-13T01:39:21.056248900Z {"t":{"$date":"2025-01-13T01:39:21.056+00:00"},"s":"I",  "c":"STORAGE",  "id":7333402, "ctx":"SignalHandler","msg":"Shutting down the DiskSpaceMonitor"}
    mongo-demo-1     | 2025-01-13T01:39:21.056359828Z {"t":{"$date":"2025-01-13T01:39:21.056+00:00"},"s":"I",  "c":"-",        "id":6371601, "ctx":"SignalHandler","msg":"Shutting down the FLE Crud thread pool"}
    mongo-demo-1     | 2025-01-13T01:39:21.056376611Z {"t":{"$date":"2025-01-13T01:39:21.056+00:00"},"s":"I",  "c":"COMMAND",  "id":4784901, "ctx":"SignalHandler","msg":"Shutting down the MirrorMaestro"}
    mongo-demo-1     | 2025-01-13T01:39:21.056404716Z {"t":{"$date":"2025-01-13T01:39:21.056+00:00"},"s":"I",  "c":"SHARDING", "id":4784902, "ctx":"SignalHandler","msg":"Shutting down the WaitForMajorityService"}
    mongo-demo-1     | 2025-01-13T01:39:21.056782834Z {"t":{"$date":"2025-01-13T01:39:21.056+00:00"},"s":"I",  "c":"CONTROL",  "id":4784903, "ctx":"SignalHandler","msg":"Shutting down the LogicalSessionCache"}
    mongo-demo-1     | 2025-01-13T01:39:21.057051227Z {"t":{"$date":"2025-01-13T01:39:21.056+00:00"},"s":"I",  "c":"NETWORK",  "id":8314100, "ctx":"SignalHandler","msg":"Shutdown: Closing listener sockets"}
    mongo-demo-1     | 2025-01-13T01:39:21.057129158Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"NETWORK",  "id":23017,   "ctx":"listener","msg":"removing socket file","attr":{"path":"/tmp/mongodb-27017.sock"}}
    mongo-demo-1     | 2025-01-13T01:39:21.057273363Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"NETWORK",  "id":4784905, "ctx":"SignalHandler","msg":"Shutting down the global connection pool"}
    mongo-demo-1     | 2025-01-13T01:39:21.057288258Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"CONTROL",  "id":4784906, "ctx":"SignalHandler","msg":"Shutting down the FlowControlTicketholder"}
    mongo-demo-1     | 2025-01-13T01:39:21.057296288Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"-",        "id":20520,   "ctx":"SignalHandler","msg":"Stopping further Flow Control ticket acquisitions."}
    mongo-demo-1     | 2025-01-13T01:39:21.057303501Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"CONTROL",  "id":4784908, "ctx":"SignalHandler","msg":"Shutting down the PeriodicThreadToAbortExpiredTransactions"}
    mongo-demo-1     | 2025-01-13T01:39:21.057429133Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"REPL",     "id":4784909, "ctx":"SignalHandler","msg":"Shutting down the ReplicationCoordinator"}
    mongo-demo-1     | 2025-01-13T01:39:21.057446146Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"SHARDING", "id":4784910, "ctx":"SignalHandler","msg":"Shutting down the ShardingInitializationMongoD"}
    mongo-demo-1     | 2025-01-13T01:39:21.057452824Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"REPL",     "id":4784911, "ctx":"SignalHandler","msg":"Enqueuing the ReplicationStateTransitionLock for shutdown"}
    mongo-demo-1     | 2025-01-13T01:39:21.057471640Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"-",        "id":4784912, "ctx":"SignalHandler","msg":"Killing all operations for shutdown"}
    mongo-demo-1     | 2025-01-13T01:39:21.057485510Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"-",        "id":4695300, "ctx":"SignalHandler","msg":"Interrupted all currently running operations","attr":{"opsKilled":3}}
    mongo-demo-1     | 2025-01-13T01:39:21.057493514Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"TENANT_M", "id":5093807, "ctx":"SignalHandler","msg":"Shutting down all TenantMigrationAccessBlockers on global shutdown"}
    mongo-demo-1     | 2025-01-13T01:39:21.057610480Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"ASIO",     "id":22582,   "ctx":"TenantMigrationBlockerNet","msg":"Killing all outstanding egress activity."}
    mongo-demo-1     | 2025-01-13T01:39:21.057686557Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"ASIO",     "id":6529201, "ctx":"SignalHandler","msg":"Network interface redundant shutdown","attr":{"state":"Stopped"}}
    mongo-demo-1     | 2025-01-13T01:39:21.057720961Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"ASIO",     "id":22582,   "ctx":"SignalHandler","msg":"Killing all outstanding egress activity."}
    mongo-demo-1     | 2025-01-13T01:39:21.057733832Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"COMMAND",  "id":4784913, "ctx":"SignalHandler","msg":"Shutting down all open transactions"}
    mongo-demo-1     | 2025-01-13T01:39:21.057765592Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"REPL",     "id":4784914, "ctx":"SignalHandler","msg":"Acquiring the ReplicationStateTransitionLock for shutdown"}
    mongo-demo-1     | 2025-01-13T01:39:21.057776955Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"INDEX",    "id":4784915, "ctx":"SignalHandler","msg":"Shutting down the IndexBuildsCoordinator"}
    mongo-demo-1     | 2025-01-13T01:39:21.057811637Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"NETWORK",  "id":4784918, "ctx":"SignalHandler","msg":"Shutting down the ReplicaSetMonitor"}
    mongo-demo-1     | 2025-01-13T01:39:21.057817717Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"SHARDING", "id":4784921, "ctx":"SignalHandler","msg":"Shutting down the MigrationUtilExecutor"}
    mongo-demo-1     | 2025-01-13T01:39:21.057976111Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"ASIO",     "id":22582,   "ctx":"MigrationUtil-TaskExecutor","msg":"Killing all outstanding egress activity."}
    mongo-demo-1     | 2025-01-13T01:39:21.058026999Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"NETWORK",  "id":20562,   "ctx":"SignalHandler","msg":"Shutdown: Closing open transport sessions"}
    mongo-demo-1     | 2025-01-13T01:39:21.058047948Z {"t":{"$date":"2025-01-13T01:39:21.057+00:00"},"s":"I",  "c":"NETWORK",  "id":4784923, "ctx":"SignalHandler","msg":"Shutting down the ASIO transport SessionManager"}
    mongo-demo-1     | 2025-01-13T01:39:21.058056069Z {"t":{"$date":"2025-01-13T01:39:21.058+00:00"},"s":"I",  "c":"CONTROL",  "id":4784927, "ctx":"SignalHandler","msg":"Shutting down the HealthLog"}
    mongo-demo-1     | 2025-01-13T01:39:21.058099399Z {"t":{"$date":"2025-01-13T01:39:21.058+00:00"},"s":"I",  "c":"CONTROL",  "id":4784928, "ctx":"SignalHandler","msg":"Shutting down the TTL monitor"}
    mongo-demo-1     | 2025-01-13T01:39:21.058117026Z {"t":{"$date":"2025-01-13T01:39:21.058+00:00"},"s":"I",  "c":"INDEX",    "id":3684100, "ctx":"SignalHandler","msg":"Shutting down TTL collection monitor thread"}
    mongo-demo-1     | 2025-01-13T01:39:21.058252543Z {"t":{"$date":"2025-01-13T01:39:21.058+00:00"},"s":"I",  "c":"INDEX",    "id":3684101, "ctx":"SignalHandler","msg":"Finished shutting down TTL collection monitor thread"}
    mongo-demo-1     | 2025-01-13T01:39:21.058262239Z {"t":{"$date":"2025-01-13T01:39:21.058+00:00"},"s":"I",  "c":"CONTROL",  "id":6278511, "ctx":"SignalHandler","msg":"Shutting down the Change Stream Expired Pre-images Remover"}
    mongo-demo-1     | 2025-01-13T01:39:21.058266591Z {"t":{"$date":"2025-01-13T01:39:21.058+00:00"},"s":"I",  "c":"CONTROL",  "id":4784929, "ctx":"SignalHandler","msg":"Acquiring the global lock for shutdown"}
    mongo-demo-1     | 2025-01-13T01:39:21.058270645Z {"t":{"$date":"2025-01-13T01:39:21.058+00:00"},"s":"I",  "c":"CONTROL",  "id":4784930, "ctx":"SignalHandler","msg":"Shutting down the storage engine"}
    mongo-demo-1     | 2025-01-13T01:39:21.058286355Z {"t":{"$date":"2025-01-13T01:39:21.058+00:00"},"s":"I",  "c":"STORAGE",  "id":22320,   "ctx":"SignalHandler","msg":"Shutting down journal flusher thread"}
    mongo-demo-1     | 2025-01-13T01:39:21.058346168Z {"t":{"$date":"2025-01-13T01:39:21.058+00:00"},"s":"I",  "c":"STORAGE",  "id":22321,   "ctx":"SignalHandler","msg":"Finished shutting down journal flusher thread"}
    mongo-demo-1     | 2025-01-13T01:39:21.058355809Z {"t":{"$date":"2025-01-13T01:39:21.058+00:00"},"s":"I",  "c":"STORAGE",  "id":22322,   "ctx":"SignalHandler","msg":"Shutting down checkpoint thread"}
    mongo-demo-1     | 2025-01-13T01:39:21.058463398Z {"t":{"$date":"2025-01-13T01:39:21.058+00:00"},"s":"I",  "c":"STORAGE",  "id":22323,   "ctx":"SignalHandler","msg":"Finished shutting down checkpoint thread"}
    mongo-demo-1     | 2025-01-13T01:39:21.058476320Z {"t":{"$date":"2025-01-13T01:39:21.058+00:00"},"s":"I",  "c":"STORAGE",  "id":22261,   "ctx":"SignalHandler","msg":"Timestamp monitor shutting down"}
    mongo-demo-1     | 2025-01-13T01:39:21.058626828Z {"t":{"$date":"2025-01-13T01:39:21.058+00:00"},"s":"I",  "c":"STORAGE",  "id":20282,   "ctx":"SignalHandler","msg":"Deregistering all the collections"}
    mongo-demo-1     | 2025-01-13T01:39:21.058724088Z {"t":{"$date":"2025-01-13T01:39:21.058+00:00"},"s":"I",  "c":"STORAGE",  "id":22317,   "ctx":"SignalHandler","msg":"WiredTigerKVEngine shutting down"}
    mongo-demo-1     | 2025-01-13T01:39:21.058736388Z {"t":{"$date":"2025-01-13T01:39:21.058+00:00"},"s":"I",  "c":"STORAGE",  "id":22318,   "ctx":"SignalHandler","msg":"Shutting down session sweeper thread"}
    mongo-demo-1     | 2025-01-13T01:39:21.058842571Z {"t":{"$date":"2025-01-13T01:39:21.058+00:00"},"s":"I",  "c":"STORAGE",  "id":22319,   "ctx":"SignalHandler","msg":"Finished shutting down session sweeper thread"}
    mongo-demo-1     | 2025-01-13T01:39:21.065281811Z {"t":{"$date":"2025-01-13T01:39:21.065+00:00"},"s":"I",  "c":"STORAGE",  "id":4795902, "ctx":"SignalHandler","msg":"Closing WiredTiger","attr":{"closeConfig":"leak_memory=true,use_timestamp=false,"}}
    mongo-demo-1     | 2025-01-13T01:39:21.068232428Z {"t":{"$date":"2025-01-13T01:39:21.068+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"SignalHandler","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732361,"ts_usec":67972,"thread":"28:0x7159552006c0","session_name":"close_ckpt","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 46, snapshot max: 46 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 1"}}}
    mongo-demo-1     | 2025-01-13T01:39:21.106726835Z {"t":{"$date":"2025-01-13T01:39:21.106+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"SignalHandler","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732361,"ts_usec":106483,"thread":"28:0x7159552006c0","session_name":"WT_CONNECTION.close","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"shutdown checkpoint has successfully finished and ran for 40 milliseconds"}}}
    mongo-demo-1     | 2025-01-13T01:39:21.106906412Z {"t":{"$date":"2025-01-13T01:39:21.106+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"SignalHandler","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732361,"ts_usec":106750,"thread":"28:0x7159552006c0","session_name":"WT_CONNECTION.close","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"shutdown was completed successfully and took 41ms, including 0ms for the rollback to stable, and 40ms for the checkpoint."}}}
    mongo-demo-1     | 2025-01-13T01:39:21.125029424Z {"t":{"$date":"2025-01-13T01:39:21.124+00:00"},"s":"I",  "c":"STORAGE",  "id":4795901, "ctx":"SignalHandler","msg":"WiredTiger closed","attr":{"durationMillis":59}}
    mongo-demo-1     | 2025-01-13T01:39:21.125063106Z {"t":{"$date":"2025-01-13T01:39:21.124+00:00"},"s":"I",  "c":"STORAGE",  "id":22279,   "ctx":"SignalHandler","msg":"shutdown: removing fs lock..."}
    mongo-demo-1     | 2025-01-13T01:39:21.125304699Z {"t":{"$date":"2025-01-13T01:39:21.125+00:00"},"s":"I",  "c":"-",        "id":4784931, "ctx":"SignalHandler","msg":"Dropping the scope cache for shutdown"}
    mongo-demo-1     | 2025-01-13T01:39:21.125334021Z {"t":{"$date":"2025-01-13T01:39:21.125+00:00"},"s":"I",  "c":"FTDC",     "id":20626,   "ctx":"SignalHandler","msg":"Shutting down full-time diagnostic data capture"}
    mongo-demo-1     | 2025-01-13T01:39:21.130756827Z {"t":{"$date":"2025-01-13T01:39:21.130+00:00"},"s":"I",  "c":"CONTROL",  "id":20565,   "ctx":"SignalHandler","msg":"Now exiting"}
    mongo-demo-1     | 2025-01-13T01:39:21.131028990Z {"t":{"$date":"2025-01-13T01:39:21.130+00:00"},"s":"I",  "c":"CONTROL",  "id":8423404, "ctx":"SignalHandler","msg":"mongod shutdown complete","attr":{"Summary of time elapsed":{"Statistics":{"Enter terminal shutdown":"0 ms","Step down the replication coordinator for shutdown":"1 ms","Time spent in quiesce mode":"0 ms","Shut down FLE Crud subsystem":"0 ms","Shut down MirrorMaestro":"0 ms","Shut down WaitForMajorityService":"0 ms","Shut down the logical session cache":"0 ms","Shut down the global connection pool":"0 ms","Shut down the flow control ticket holder":"0 ms","Shut down the thread that aborts expired transactions":"0 ms","Kill all operations for shutdown":"0 ms","Shut down all tenant migration access blockers on global shutdown":"0 ms","Shut down all open transactions":"0 ms","Acquire the RSTL for shutdown":"0 ms","Shut down the IndexBuildsCoordinator and wait for index builds to finish":"0 ms","Shut down the replica set monitor":"0 ms","Shut down the migration util executor":"0 ms","Shut down the transport layer":"0 ms","Shut down the health log":"1 ms","Shut down the TTL monitor":"0 ms","Shut down expired pre-images and documents removers":"0 ms","Shut down the storage engine":"67 ms","Wait for the oplog cap maintainer thread to stop":"0 ms","Shut down full-time data capture":"0 ms","Shut down online certificate status protocol manager":"0 ms","shutdownTask total elapsed time":"75 ms"}}}}
    mongo-demo-1     | 2025-01-13T01:39:21.131064353Z {"t":{"$date":"2025-01-13T01:39:21.130+00:00"},"s":"I",  "c":"CONTROL",  "id":23138,   "ctx":"SignalHandler","msg":"Shutting down","attr":{"exitCode":0}}
    mongo-demo-1     | 2025-01-13T01:39:22.063670188Z 
    mongo-demo-1     | 2025-01-13T01:39:22.063725312Z MongoDB init process complete; ready for start up.
    mongo-demo-1     | 2025-01-13T01:39:22.063735257Z 
    mongo-demo-1     | 2025-01-13T01:39:22.119894595Z {"t":{"$date":"2025-01-13T01:39:22.119+00:00"},"s":"I",  "c":"CONTROL",  "id":23285,   "ctx":"main","msg":"Automatically disabling TLS 1.0, to force-enable TLS 1.0 specify --sslDisabledProtocols 'none'"}
    mongo-demo-1     | 2025-01-13T01:39:22.122603892Z {"t":{"$date":"2025-01-13T01:39:22.122+00:00"},"s":"I",  "c":"CONTROL",  "id":5945603, "ctx":"main","msg":"Multi threading initialized"}
    mongo-demo-1     | 2025-01-13T01:39:22.123019684Z {"t":{"$date":"2025-01-13T01:39:22.122+00:00"},"s":"I",  "c":"NETWORK",  "id":4648601, "ctx":"main","msg":"Implicit TCP FastOpen unavailable. If TCP FastOpen is required, set at least one of the related parameters","attr":{"relatedParameters":["tcpFastOpenServer","tcpFastOpenClient","tcpFastOpenQueueSize"]}}
    mongo-demo-1     | 2025-01-13T01:39:22.123167535Z {"t":{"$date":"2025-01-13T01:39:22.123+00:00"},"s":"I",  "c":"NETWORK",  "id":4915701, "ctx":"main","msg":"Initialized wire specification","attr":{"spec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":25},"outgoing":{"minWireVersion":6,"maxWireVersion":25},"isInternalClient":true}}}
    mongo-demo-1     | 2025-01-13T01:39:22.125367511Z {"t":{"$date":"2025-01-13T01:39:22.125+00:00"},"s":"I",  "c":"TENANT_M", "id":7091600, "ctx":"main","msg":"Starting TenantMigrationAccessBlockerRegistry"}
    mongo-demo-1     | 2025-01-13T01:39:22.125523289Z {"t":{"$date":"2025-01-13T01:39:22.125+00:00"},"s":"I",  "c":"CONTROL",  "id":4615611, "ctx":"initandlisten","msg":"MongoDB starting","attr":{"pid":1,"port":27017,"dbPath":"/data/db","architecture":"64-bit","host":"8c08ec298d66"}}
    mongo-demo-1     | 2025-01-13T01:39:22.125543496Z {"t":{"$date":"2025-01-13T01:39:22.125+00:00"},"s":"I",  "c":"CONTROL",  "id":23403,   "ctx":"initandlisten","msg":"Build Info","attr":{"buildInfo":{"version":"8.0.4","gitVersion":"bc35ab4305d9920d9d0491c1c9ef9b72383d31f9","openSSLVersion":"OpenSSL 3.0.13 30 Jan 2024","modules":[],"allocator":"tcmalloc-google","environment":{"distmod":"ubuntu2404","distarch":"x86_64","target_arch":"x86_64"}}}}
    mongo-demo-1     | 2025-01-13T01:39:22.125551505Z {"t":{"$date":"2025-01-13T01:39:22.125+00:00"},"s":"I",  "c":"CONTROL",  "id":51765,   "ctx":"initandlisten","msg":"Operating System","attr":{"os":{"name":"Ubuntu","version":"24.04"}}}
    mongo-demo-1     | 2025-01-13T01:39:22.125556472Z {"t":{"$date":"2025-01-13T01:39:22.125+00:00"},"s":"I",  "c":"CONTROL",  "id":21951,   "ctx":"initandlisten","msg":"Options set by command line","attr":{"options":{"net":{"bindIp":"*"},"security":{"authorization":"enabled"}}}}
    mongo-demo-1     | 2025-01-13T01:39:22.126870068Z {"t":{"$date":"2025-01-13T01:39:22.126+00:00"},"s":"I",  "c":"STORAGE",  "id":22270,   "ctx":"initandlisten","msg":"Storage engine to use detected by data files","attr":{"dbpath":"/data/db","storageEngine":"wiredTiger"}}
    mongo-demo-1     | 2025-01-13T01:39:22.126901080Z {"t":{"$date":"2025-01-13T01:39:22.126+00:00"},"s":"I",  "c":"STORAGE",  "id":22297,   "ctx":"initandlisten","msg":"Using the XFS filesystem is strongly recommended with the WiredTiger storage engine. See http://dochub.mongodb.org/core/prodnotes-filesystem","tags":["startupWarnings"]}
    mongo-demo-1     | 2025-01-13T01:39:22.126964299Z {"t":{"$date":"2025-01-13T01:39:22.126+00:00"},"s":"I",  "c":"STORAGE",  "id":22315,   "ctx":"initandlisten","msg":"Opening WiredTiger","attr":{"config":"create,cache_size=3413M,session_max=33000,eviction=(threads_min=4,threads_max=4),config_base=false,statistics=(fast),log=(enabled=true,remove=true,path=journal,compressor=snappy),builtin_extension_config=(zstd=(compression_level=6)),file_manager=(close_idle_time=600,close_scan_interval=10,close_handle_minimum=2000),statistics_log=(wait=0),json_output=(error,message),verbose=[recovery_progress:1,checkpoint_progress:1,compact_progress:1,backup:0,checkpoint:0,compact:0,evict:0,history_store:0,recovery:0,rts:0,salvage:0,tiered:0,timestamp:0,transaction:0,verify:0,log:0],prefetch=(available=true,default=false),"}}
    mongo-demo-1     | 2025-01-13T01:39:23.148273662Z {"t":{"$date":"2025-01-13T01:39:23.148+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732363,"ts_usec":148065,"thread":"1:0x7778107d5680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Recovering log 1 through 2"}}}
    mongo-demo-1     | 2025-01-13T01:39:23.289393865Z {"t":{"$date":"2025-01-13T01:39:23.289+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732363,"ts_usec":289153,"thread":"1:0x7778107d5680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Recovering log 2 through 2"}}}
    mongo-demo-1     | 2025-01-13T01:39:23.468316785Z {"t":{"$date":"2025-01-13T01:39:23.466+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732363,"ts_usec":466489,"thread":"1:0x7778107d5680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Main recovery loop: starting at 1/32128 to 2/256"}}}
    mongo-demo-1     | 2025-01-13T01:39:23.646895829Z {"t":{"$date":"2025-01-13T01:39:23.646+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732363,"ts_usec":646625,"thread":"1:0x7778107d5680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Recovering log 1 through 2"}}}
    mongo-demo-1     | 2025-01-13T01:39:23.763415789Z {"t":{"$date":"2025-01-13T01:39:23.763+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732363,"ts_usec":763191,"thread":"1:0x7778107d5680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Recovering log 2 through 2"}}}
    mongo-demo-1     | 2025-01-13T01:39:23.874499745Z {"t":{"$date":"2025-01-13T01:39:23.873+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732363,"ts_usec":873855,"thread":"1:0x7778107d5680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery log replay has successfully finished and ran for 726 milliseconds"}}}
    mongo-demo-1     | 2025-01-13T01:39:23.874561028Z {"t":{"$date":"2025-01-13T01:39:23.874+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732363,"ts_usec":874140,"thread":"1:0x7778107d5680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Set global recovery timestamp: (0, 0)"}}}
    mongo-demo-1     | 2025-01-13T01:39:23.874597206Z {"t":{"$date":"2025-01-13T01:39:23.874+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732363,"ts_usec":874284,"thread":"1:0x7778107d5680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Set global oldest timestamp: (0, 0)"}}}
    mongo-demo-1     | 2025-01-13T01:39:23.879005147Z {"t":{"$date":"2025-01-13T01:39:23.878+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732363,"ts_usec":878737,"thread":"1:0x7778107d5680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery rollback to stable has successfully finished and ran for 4 milliseconds"}}}
    mongo-demo-1     | 2025-01-13T01:39:23.888416253Z {"t":{"$date":"2025-01-13T01:39:23.888+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732363,"ts_usec":888171,"thread":"1:0x7778107d5680","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 1, snapshot max: 1 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 7"}}}
    mongo-demo-1     | 2025-01-13T01:39:23.908699915Z {"t":{"$date":"2025-01-13T01:39:23.907+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732363,"ts_usec":907551,"thread":"1:0x7778107d5680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery checkpoint has successfully finished and ran for 27 milliseconds"}}}
    mongo-demo-1     | 2025-01-13T01:39:23.908858648Z {"t":{"$date":"2025-01-13T01:39:23.908+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732363,"ts_usec":908004,"thread":"1:0x7778107d5680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery was completed successfully and took 760ms, including 726ms for the log replay, 4ms for the rollback to stable, and 27ms for the checkpoint."}}}
    mongo-demo-1     | 2025-01-13T01:39:23.915465290Z {"t":{"$date":"2025-01-13T01:39:23.915+00:00"},"s":"I",  "c":"STORAGE",  "id":4795906, "ctx":"initandlisten","msg":"WiredTiger opened","attr":{"durationMillis":1789}}
    mongo-demo-1     | 2025-01-13T01:39:23.915511768Z {"t":{"$date":"2025-01-13T01:39:23.915+00:00"},"s":"I",  "c":"RECOVERY", "id":23987,   "ctx":"initandlisten","msg":"WiredTiger recoveryTimestamp","attr":{"recoveryTimestamp":{"$timestamp":{"t":0,"i":0}}}}
    mongo-demo-1     | 2025-01-13T01:39:23.932575610Z {"t":{"$date":"2025-01-13T01:39:23.932+00:00"},"s":"W",  "c":"CONTROL",  "id":9068900, "ctx":"initandlisten","msg":"For customers running the current memory allocator, we suggest changing the contents of the following sysfsFile","attr":{"allocator":"tcmalloc-google","sysfsFile":"/sys/kernel/mm/transparent_hugepage/enabled","currentValue":"never","desiredValue":"always"},"tags":["startupWarnings"]}
    mongo-demo-1     | 2025-01-13T01:39:23.932615358Z {"t":{"$date":"2025-01-13T01:39:23.932+00:00"},"s":"W",  "c":"CONTROL",  "id":9068900, "ctx":"initandlisten","msg":"For customers running the current memory allocator, we suggest changing the contents of the following sysfsFile","attr":{"allocator":"tcmalloc-google","sysfsFile":"/sys/kernel/mm/transparent_hugepage/defrag","currentValue":"madvise","desiredValue":"defer+madvise"},"tags":["startupWarnings"]}
    mongo-demo-1     | 2025-01-13T01:39:23.932678128Z {"t":{"$date":"2025-01-13T01:39:23.932+00:00"},"s":"W",  "c":"CONTROL",  "id":8640302, "ctx":"initandlisten","msg":"We suggest setting the contents of sysfsFile to 0.","attr":{"sysfsFile":"/sys/kernel/mm/transparent_hugepage/khugepaged/max_ptes_none","currentValue":511},"tags":["startupWarnings"]}
    mongo-demo-1     | 2025-01-13T01:39:23.932688193Z {"t":{"$date":"2025-01-13T01:39:23.932+00:00"},"s":"W",  "c":"CONTROL",  "id":8718500, "ctx":"initandlisten","msg":"Your system has glibc support for rseq built in, which is not yet supported by tcmalloc-google and has critical performance implications. Please set the environment variable GLIBC_TUNABLES=glibc.pthread.rseq=0","tags":["startupWarnings"]}
    mongo-demo-1     | 2025-01-13T01:39:23.932695600Z {"t":{"$date":"2025-01-13T01:39:23.932+00:00"},"s":"W",  "c":"NETWORK",  "id":5123300, "ctx":"initandlisten","msg":"vm.max_map_count is too low","attr":{"currentValue":1048576,"recommendedMinimum":1677720,"maxConns":838860},"tags":["startupWarnings"]}
    mongo-demo-1     | 2025-01-13T01:39:23.932962709Z {"t":{"$date":"2025-01-13T01:39:23.932+00:00"},"s":"W",  "c":"CONTROL",  "id":8386700, "ctx":"initandlisten","msg":"We suggest setting swappiness to 0 or 1, as swapping can cause performance problems.","attr":{"sysfsFile":"/proc/sys/vm/swappiness","currentValue":60},"tags":["startupWarnings"]}
    mongo-demo-1     | 2025-01-13T01:39:23.940939266Z {"t":{"$date":"2025-01-13T01:39:23.940+00:00"},"s":"I",  "c":"NETWORK",  "id":4915702, "ctx":"initandlisten","msg":"Updated wire specification","attr":{"oldSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":25},"outgoing":{"minWireVersion":6,"maxWireVersion":25},"isInternalClient":true},"newSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":25,"maxWireVersion":25},"outgoing":{"minWireVersion":25,"maxWireVersion":25},"isInternalClient":true}}}
    mongo-demo-1     | 2025-01-13T01:39:23.940981640Z {"t":{"$date":"2025-01-13T01:39:23.940+00:00"},"s":"I",  "c":"REPL",     "id":5853300, "ctx":"initandlisten","msg":"current featureCompatibilityVersion value","attr":{"featureCompatibilityVersion":"8.0","context":"startup"}}
    mongo-demo-1     | 2025-01-13T01:39:23.941113681Z {"t":{"$date":"2025-01-13T01:39:23.940+00:00"},"s":"I",  "c":"STORAGE",  "id":5071100, "ctx":"initandlisten","msg":"Clearing temp directory"}
    mongo-demo-1     | 2025-01-13T01:39:23.943199266Z {"t":{"$date":"2025-01-13T01:39:23.943+00:00"},"s":"I",  "c":"CONTROL",  "id":6608200, "ctx":"initandlisten","msg":"Initializing cluster server parameters from disk"}
    mongo-demo-1     | 2025-01-13T01:39:23.943370577Z {"t":{"$date":"2025-01-13T01:39:23.943+00:00"},"s":"I",  "c":"CONTROL",  "id":20536,   "ctx":"initandlisten","msg":"Flow Control is enabled on this deployment"}
    mongo-demo-1     | 2025-01-13T01:39:23.943710565Z {"t":{"$date":"2025-01-13T01:39:23.943+00:00"},"s":"I",  "c":"FTDC",     "id":20625,   "ctx":"initandlisten","msg":"Initializing full-time diagnostic data capture","attr":{"dataDirectory":"/data/db/diagnostic.data"}}
    mongo-demo-1     | 2025-01-13T01:39:23.947013462Z {"t":{"$date":"2025-01-13T01:39:23.946+00:00"},"s":"I",  "c":"REPL",     "id":6015317, "ctx":"initandlisten","msg":"Setting new configuration state","attr":{"newState":"ConfigReplicationDisabled","oldState":"ConfigPreStart"}}
    mongo-demo-1     | 2025-01-13T01:39:23.947208629Z {"t":{"$date":"2025-01-13T01:39:23.947+00:00"},"s":"I",  "c":"STORAGE",  "id":22262,   "ctx":"initandlisten","msg":"Timestamp monitor starting"}
    mongo-demo-1     | 2025-01-13T01:39:23.947443417Z {"t":{"$date":"2025-01-13T01:39:23.947+00:00"},"s":"I",  "c":"STORAGE",  "id":7333401, "ctx":"initandlisten","msg":"Starting the DiskSpaceMonitor"}
    mongo-demo-1     | 2025-01-13T01:39:23.948943065Z {"t":{"$date":"2025-01-13T01:39:23.948+00:00"},"s":"I",  "c":"NETWORK",  "id":23015,   "ctx":"listener","msg":"Listening on","attr":{"address":"/tmp/mongodb-27017.sock"}}
    mongo-demo-1     | 2025-01-13T01:39:23.949042448Z {"t":{"$date":"2025-01-13T01:39:23.948+00:00"},"s":"I",  "c":"NETWORK",  "id":23015,   "ctx":"listener","msg":"Listening on","attr":{"address":"0.0.0.0:27017"}}
    mongo-demo-1     | 2025-01-13T01:39:23.949055295Z {"t":{"$date":"2025-01-13T01:39:23.948+00:00"},"s":"I",  "c":"NETWORK",  "id":23016,   "ctx":"listener","msg":"Waiting for connections","attr":{"port":27017,"ssl":"off"}}
    mongo-demo-1     | 2025-01-13T01:39:23.949215676Z {"t":{"$date":"2025-01-13T01:39:23.949+00:00"},"s":"I",  "c":"CONTROL",  "id":8423403, "ctx":"initandlisten","msg":"mongod startup complete","attr":{"Summary of time elapsed":{"Startup from clean shutdown?":true,"Statistics":{"Set up periodic runner":"0 ms","Set up online certificate status protocol manager":"0 ms","Transport layer setup":"0 ms","Run initial syncer crash recovery":"0 ms","Create storage engine lock file in the data directory":"0 ms","Get metadata describing storage engine":"0 ms","Validate options in metadata against current startup options":"0 ms","Create storage engine":"1801 ms","Write current PID to file":"1 ms","Initialize FCV before rebuilding indexes":"7 ms","Drop abandoned idents and get back indexes that need to be rebuilt or builds that need to be restarted":"0 ms","Rebuild indexes for collections":"0 ms","Load cluster parameters from disk for a standalone":"0 ms","Build user and roles graph":"0 ms","Verify indexes for admin.system.users collection":"0 ms","Set up the background thread pool responsible for waiting for opTimes to be majority committed":"1 ms","Start up the replication coordinator":"1 ms","Ensure the change stream collections on startup contain consistent data":"0 ms","Write startup options to the audit log":"0 ms","Start transport layer":"0 ms","_initAndListen total elapsed time":"1823 ms"}}}}
    mongo-demo-1     | 2025-01-13T01:39:24.010149701Z {"t":{"$date":"2025-01-13T01:39:24.009+00:00"},"s":"W",  "c":"CONTROL",  "id":636300,  "ctx":"ftdc","msg":"Use of deprecated server parameter name","attr":{"deprecatedName":"internalQueryCacheSize","canonicalName":"internalQueryCacheMaxEntriesPerCollection"}}
    mongo-demo-1     | 2025-01-13T01:39:24.010344788Z {"t":{"$date":"2025-01-13T01:39:24.010+00:00"},"s":"W",  "c":"CONTROL",  "id":636300,  "ctx":"ftdc","msg":"Use of deprecated server parameter name","attr":{"deprecatedName":"oplogSamplingLogIntervalSeconds","canonicalName":"collectionSamplingLogIntervalSeconds"}}
    mongo-demo-1     | 2025-01-13T01:39:24.010367563Z {"t":{"$date":"2025-01-13T01:39:24.010+00:00"},"s":"W",  "c":"NETWORK",  "id":23803,   "ctx":"ftdc","msg":"Use of deprecated server parameter 'sslMode', please use 'tlsMode' instead."}
    mongo-demo-1     | 2025-01-13T01:39:24.010425185Z {"t":{"$date":"2025-01-13T01:39:24.010+00:00"},"s":"W",  "c":"CONTROL",  "id":636300,  "ctx":"ftdc","msg":"Use of deprecated server parameter name","attr":{"deprecatedName":"wiredTigerConcurrentReadTransactions","canonicalName":"storageEngineConcurrentReadTransactions"}}
    mongo-demo-1     | 2025-01-13T01:39:24.010439506Z {"t":{"$date":"2025-01-13T01:39:24.010+00:00"},"s":"W",  "c":"CONTROL",  "id":636300,  "ctx":"ftdc","msg":"Use of deprecated server parameter name","attr":{"deprecatedName":"wiredTigerConcurrentWriteTransactions","canonicalName":"storageEngineConcurrentWriteTransactions"}}
    mongo-demo-1     | 2025-01-13T01:39:24.882785971Z {"t":{"$date":"2025-01-13T01:39:24.882+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"172.18.0.3:42285","uuid":{"uuid":{"$uuid":"644430d2-bbb3-4419-9633-69ff3c97e546"}},"connectionId":1,"connectionCount":1}}
    mongo-demo-1     | 2025-01-13T01:39:24.883261582Z {"t":{"$date":"2025-01-13T01:39:24.883+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn1","msg":"Connection ended","attr":{"remote":"172.18.0.3:42285","uuid":{"uuid":{"$uuid":"644430d2-bbb3-4419-9633-69ff3c97e546"}},"connectionId":1,"connectionCount":0}}
    mongo-demo-1     | 2025-01-13T01:39:24.897484445Z {"t":{"$date":"2025-01-13T01:39:24.897+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"172.18.0.3:53300","uuid":{"uuid":{"$uuid":"6d7f923f-188d-4c90-8849-00bafdcbe604"}},"connectionId":2,"connectionCount":1}}
    mongo-demo-1     | 2025-01-13T01:39:24.897800178Z {"t":{"$date":"2025-01-13T01:39:24.897+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn2","msg":"Connection ended","attr":{"remote":"172.18.0.3:53300","uuid":{"uuid":{"$uuid":"6d7f923f-188d-4c90-8849-00bafdcbe604"}},"connectionId":2,"connectionCount":0}}
    mongo-demo-1     | 2025-01-13T01:39:26.478763286Z {"t":{"$date":"2025-01-13T01:39:26.477+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"172.18.0.3:53312","uuid":{"uuid":{"$uuid":"fbbe6dc6-9fc9-4827-b207-0b8644f07f3e"}},"connectionId":3,"connectionCount":1}}
    mongo-demo-1     | 2025-01-13T01:39:26.494016802Z {"t":{"$date":"2025-01-13T01:39:26.493+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn3","msg":"client metadata","attr":{"remote":"172.18.0.3:53312","client":"conn3","negotiatedCompressors":[],"doc":{"driver":{"name":"nodejs","version":"4.13.0"},"os":{"type":"Linux","name":"linux","architecture":"x64","version":"6.8.0-51-generic"},"platform":"Node.js v18.20.3, LE (unified)|Node.js v18.20.3, LE (unified)"}}}
    mongo-demo-1     | 2025-01-13T01:39:26.512412013Z {"t":{"$date":"2025-01-13T01:39:26.512+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"172.18.0.3:53322","uuid":{"uuid":{"$uuid":"e4081a87-d228-467a-a8f8-3aee7c2b33d1"}},"connectionId":4,"connectionCount":2}}
    mongo-demo-1     | 2025-01-13T01:39:26.516572441Z {"t":{"$date":"2025-01-13T01:39:26.516+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn4","msg":"client metadata","attr":{"remote":"172.18.0.3:53322","client":"conn4","negotiatedCompressors":[],"doc":{"driver":{"name":"nodejs","version":"4.13.0"},"os":{"type":"Linux","name":"linux","architecture":"x64","version":"6.8.0-51-generic"},"platform":"Node.js v18.20.3, LE (unified)|Node.js v18.20.3, LE (unified)"}}}
    mongo-demo-1     | 2025-01-13T01:39:26.520555851Z {"t":{"$date":"2025-01-13T01:39:26.520+00:00"},"s":"I",  "c":"ACCESS",   "id":6788604, "ctx":"conn4","msg":"Auth metrics report","attr":{"metric":"acquireUser","micros":0}}
    mongo-demo-1     | 2025-01-13T01:39:26.552850626Z {"t":{"$date":"2025-01-13T01:39:26.552+00:00"},"s":"I",  "c":"ACCESS",   "id":5286306, "ctx":"conn4","msg":"Successfully authenticated","attr":{"client":"172.18.0.3:53322","isSpeculative":true,"isClusterMember":false,"mechanism":"SCRAM-SHA-256","user":"admin","db":"admin","result":0,"metrics":{"conversation_duration":{"micros":32187,"summary":{"0":{"step":1,"step_total":2,"duration_micros":129},"1":{"step":2,"step_total":2,"duration_micros":33}}}},"extraInfo":{}}}
    mongo-demo-1     | 2025-01-13T01:39:26.557375695Z {"t":{"$date":"2025-01-13T01:39:26.557+00:00"},"s":"I",  "c":"NETWORK",  "id":6788700, "ctx":"conn4","msg":"Received first command on ingress connection since session start or auth handshake","attr":{"elapsedMillis":4}}
    mongo-demo-1     | 2025-01-13T01:39:37.015942220Z {"t":{"$date":"2025-01-13T01:39:37.015+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"172.18.0.3:60778","uuid":{"uuid":{"$uuid":"7cf3366c-8ae6-4a51-a454-066f1d04dd66"}},"connectionId":5,"connectionCount":3}}
    mongo-demo-1     | 2025-01-13T01:39:37.018270721Z {"t":{"$date":"2025-01-13T01:39:37.017+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn5","msg":"client metadata","attr":{"remote":"172.18.0.3:60778","client":"conn5","negotiatedCompressors":[],"doc":{"driver":{"name":"nodejs","version":"4.13.0"},"os":{"type":"Linux","name":"linux","architecture":"x64","version":"6.8.0-51-generic"},"platform":"Node.js v18.20.3, LE (unified)|Node.js v18.20.3, LE (unified)"}}}
    mongo-demo-1     | 2025-01-13T01:40:23.934792911Z {"t":{"$date":"2025-01-13T01:40:23.934+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732423,"ts_usec":934312,"thread":"1:0x7777fe4006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 4, snapshot max: 4 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 7"}}}
    mongo-demo-1     | 2025-01-13T01:41:23.963013958Z {"t":{"$date":"2025-01-13T01:41:23.962+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732483,"ts_usec":962788,"thread":"1:0x7777fe4006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 5, snapshot max: 5 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 7"}}}
    mongo-demo-1     | 2025-01-13T01:42:23.984365816Z {"t":{"$date":"2025-01-13T01:42:23.984+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732543,"ts_usec":984020,"thread":"1:0x7777fe4006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 6, snapshot max: 6 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 7"}}}
    mongo-demo-1     | 2025-01-13T01:43:24.001351330Z {"t":{"$date":"2025-01-13T01:43:24.001+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732604,"ts_usec":1140,"thread":"1:0x7777fe4006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 7, snapshot max: 7 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 7"}}}
    mongo-demo-1     | 2025-01-13T01:43:54.043740217Z {"t":{"$date":"2025-01-13T01:43:54.043+00:00"},"s":"I",  "c":"-",        "id":20883,   "ctx":"conn3","msg":"Interrupted operation as its client disconnected","attr":{"opId":13339}}
    mongo-demo-1     | 2025-01-13T01:43:54.043789993Z {"t":{"$date":"2025-01-13T01:43:54.043+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn5","msg":"Connection ended","attr":{"remote":"172.18.0.3:60778","uuid":{"uuid":{"$uuid":"7cf3366c-8ae6-4a51-a454-066f1d04dd66"}},"connectionId":5,"connectionCount":2}}
    mongo-demo-1     | 2025-01-13T01:43:54.044135881Z {"t":{"$date":"2025-01-13T01:43:54.043+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn4","msg":"Connection ended","attr":{"remote":"172.18.0.3:53322","uuid":{"uuid":{"$uuid":"e4081a87-d228-467a-a8f8-3aee7c2b33d1"}},"connectionId":4,"connectionCount":1}}
    mongo-demo-1     | 2025-01-13T01:43:54.044697928Z {"t":{"$date":"2025-01-13T01:43:54.044+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn3","msg":"Connection ended","attr":{"remote":"172.18.0.3:53312","uuid":{"uuid":{"$uuid":"fbbe6dc6-9fc9-4827-b207-0b8644f07f3e"}},"connectionId":3,"connectionCount":0}}
    mongo-demo-1     | 2025-01-13T01:43:54.223419213Z {"t":{"$date":"2025-01-13T01:43:54.223+00:00"},"s":"I",  "c":"CONTROL",  "id":23377,   "ctx":"SignalHandler","msg":"Received signal","attr":{"signal":15,"error":"Terminated"}}
    mongo-demo-1     | 2025-01-13T01:43:54.223467544Z {"t":{"$date":"2025-01-13T01:43:54.223+00:00"},"s":"I",  "c":"CONTROL",  "id":23378,   "ctx":"SignalHandler","msg":"Signal was sent by kill(2)","attr":{"pid":0,"uid":0}}
    mongo-demo-1     | 2025-01-13T01:43:54.223626508Z {"t":{"$date":"2025-01-13T01:43:54.223+00:00"},"s":"I",  "c":"CONTROL",  "id":23381,   "ctx":"SignalHandler","msg":"will terminate after current cmd ends"}
    mongo-demo-1     | 2025-01-13T01:43:54.223643794Z {"t":{"$date":"2025-01-13T01:43:54.223+00:00"},"s":"I",  "c":"REPL",     "id":4784900, "ctx":"SignalHandler","msg":"Stepping down the ReplicationCoordinator for shutdown","attr":{"waitTimeMillis":15000}}
    mongo-demo-1     | 2025-01-13T01:43:54.224207734Z {"t":{"$date":"2025-01-13T01:43:54.223+00:00"},"s":"I",  "c":"REPL",     "id":4794602, "ctx":"SignalHandler","msg":"Attempting to enter quiesce mode"}
    mongo-demo-1     | 2025-01-13T01:43:54.224239265Z {"t":{"$date":"2025-01-13T01:43:54.223+00:00"},"s":"I",  "c":"STORAGE",  "id":7333402, "ctx":"SignalHandler","msg":"Shutting down the DiskSpaceMonitor"}
    mongo-demo-1     | 2025-01-13T01:43:54.224566489Z {"t":{"$date":"2025-01-13T01:43:54.223+00:00"},"s":"I",  "c":"-",        "id":6371601, "ctx":"SignalHandler","msg":"Shutting down the FLE Crud thread pool"}
    mongo-demo-1     | 2025-01-13T01:43:54.224763422Z {"t":{"$date":"2025-01-13T01:43:54.223+00:00"},"s":"I",  "c":"COMMAND",  "id":4784901, "ctx":"SignalHandler","msg":"Shutting down the MirrorMaestro"}
    mongo-demo-1     | 2025-01-13T01:43:54.224777443Z {"t":{"$date":"2025-01-13T01:43:54.223+00:00"},"s":"I",  "c":"SHARDING", "id":4784902, "ctx":"SignalHandler","msg":"Shutting down the WaitForMajorityService"}
    mongo-demo-1     | 2025-01-13T01:43:54.226080546Z {"t":{"$date":"2025-01-13T01:43:54.225+00:00"},"s":"I",  "c":"CONTROL",  "id":4784903, "ctx":"SignalHandler","msg":"Shutting down the LogicalSessionCache"}
    mongo-demo-1     | 2025-01-13T01:43:54.226414120Z {"t":{"$date":"2025-01-13T01:43:54.226+00:00"},"s":"I",  "c":"NETWORK",  "id":8314100, "ctx":"SignalHandler","msg":"Shutdown: Closing listener sockets"}
    mongo-demo-1     | 2025-01-13T01:43:54.226562470Z {"t":{"$date":"2025-01-13T01:43:54.226+00:00"},"s":"I",  "c":"NETWORK",  "id":23017,   "ctx":"listener","msg":"removing socket file","attr":{"path":"/tmp/mongodb-27017.sock"}}
    mongo-demo-1     | 2025-01-13T01:43:54.227119319Z {"t":{"$date":"2025-01-13T01:43:54.226+00:00"},"s":"I",  "c":"NETWORK",  "id":4784905, "ctx":"SignalHandler","msg":"Shutting down the global connection pool"}
    mongo-demo-1     | 2025-01-13T01:43:54.227175263Z {"t":{"$date":"2025-01-13T01:43:54.226+00:00"},"s":"I",  "c":"CONTROL",  "id":4784906, "ctx":"SignalHandler","msg":"Shutting down the FlowControlTicketholder"}
    mongo-demo-1     | 2025-01-13T01:43:54.227186726Z {"t":{"$date":"2025-01-13T01:43:54.226+00:00"},"s":"I",  "c":"-",        "id":20520,   "ctx":"SignalHandler","msg":"Stopping further Flow Control ticket acquisitions."}
    mongo-demo-1     | 2025-01-13T01:43:54.227196529Z {"t":{"$date":"2025-01-13T01:43:54.226+00:00"},"s":"I",  "c":"CONTROL",  "id":4784908, "ctx":"SignalHandler","msg":"Shutting down the PeriodicThreadToAbortExpiredTransactions"}
    mongo-demo-1     | 2025-01-13T01:43:54.227354096Z {"t":{"$date":"2025-01-13T01:43:54.227+00:00"},"s":"I",  "c":"REPL",     "id":4784909, "ctx":"SignalHandler","msg":"Shutting down the ReplicationCoordinator"}
    mongo-demo-1     | 2025-01-13T01:43:54.227379196Z {"t":{"$date":"2025-01-13T01:43:54.227+00:00"},"s":"I",  "c":"SHARDING", "id":4784910, "ctx":"SignalHandler","msg":"Shutting down the ShardingInitializationMongoD"}
    mongo-demo-1     | 2025-01-13T01:43:54.227390424Z {"t":{"$date":"2025-01-13T01:43:54.227+00:00"},"s":"I",  "c":"REPL",     "id":4784911, "ctx":"SignalHandler","msg":"Enqueuing the ReplicationStateTransitionLock for shutdown"}
    mongo-demo-1     | 2025-01-13T01:43:54.227398160Z {"t":{"$date":"2025-01-13T01:43:54.227+00:00"},"s":"I",  "c":"-",        "id":4784912, "ctx":"SignalHandler","msg":"Killing all operations for shutdown"}
    mongo-demo-1     | 2025-01-13T01:43:54.227413646Z {"t":{"$date":"2025-01-13T01:43:54.227+00:00"},"s":"I",  "c":"-",        "id":4695300, "ctx":"SignalHandler","msg":"Interrupted all currently running operations","attr":{"opsKilled":3}}
    mongo-demo-1     | 2025-01-13T01:43:54.227422617Z {"t":{"$date":"2025-01-13T01:43:54.227+00:00"},"s":"I",  "c":"TENANT_M", "id":5093807, "ctx":"SignalHandler","msg":"Shutting down all TenantMigrationAccessBlockers on global shutdown"}
    mongo-demo-1     | 2025-01-13T01:43:54.227583893Z {"t":{"$date":"2025-01-13T01:43:54.227+00:00"},"s":"I",  "c":"ASIO",     "id":22582,   "ctx":"TenantMigrationBlockerNet","msg":"Killing all outstanding egress activity."}
    mongo-demo-1     | 2025-01-13T01:43:54.227861582Z {"t":{"$date":"2025-01-13T01:43:54.227+00:00"},"s":"I",  "c":"ASIO",     "id":6529201, "ctx":"SignalHandler","msg":"Network interface redundant shutdown","attr":{"state":"Stopped"}}
    mongo-demo-1     | 2025-01-13T01:43:54.227879704Z {"t":{"$date":"2025-01-13T01:43:54.227+00:00"},"s":"I",  "c":"ASIO",     "id":22582,   "ctx":"SignalHandler","msg":"Killing all outstanding egress activity."}
    mongo-demo-1     | 2025-01-13T01:43:54.227888194Z {"t":{"$date":"2025-01-13T01:43:54.227+00:00"},"s":"I",  "c":"COMMAND",  "id":4784913, "ctx":"SignalHandler","msg":"Shutting down all open transactions"}
    mongo-demo-1     | 2025-01-13T01:43:54.227897940Z {"t":{"$date":"2025-01-13T01:43:54.227+00:00"},"s":"I",  "c":"REPL",     "id":4784914, "ctx":"SignalHandler","msg":"Acquiring the ReplicationStateTransitionLock for shutdown"}
    mongo-demo-1     | 2025-01-13T01:43:54.227906057Z {"t":{"$date":"2025-01-13T01:43:54.227+00:00"},"s":"I",  "c":"INDEX",    "id":4784915, "ctx":"SignalHandler","msg":"Shutting down the IndexBuildsCoordinator"}
    mongo-demo-1     | 2025-01-13T01:43:54.227933714Z {"t":{"$date":"2025-01-13T01:43:54.227+00:00"},"s":"I",  "c":"NETWORK",  "id":4784918, "ctx":"SignalHandler","msg":"Shutting down the ReplicaSetMonitor"}
    mongo-demo-1     | 2025-01-13T01:43:54.227947371Z {"t":{"$date":"2025-01-13T01:43:54.227+00:00"},"s":"I",  "c":"SHARDING", "id":4784921, "ctx":"SignalHandler","msg":"Shutting down the MigrationUtilExecutor"}
    mongo-demo-1     | 2025-01-13T01:43:54.228104778Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"ASIO",     "id":22582,   "ctx":"MigrationUtil-TaskExecutor","msg":"Killing all outstanding egress activity."}
    mongo-demo-1     | 2025-01-13T01:43:54.228350833Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"NETWORK",  "id":20562,   "ctx":"SignalHandler","msg":"Shutdown: Closing open transport sessions"}
    mongo-demo-1     | 2025-01-13T01:43:54.228601128Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"NETWORK",  "id":4784923, "ctx":"SignalHandler","msg":"Shutting down the ASIO transport SessionManager"}
    mongo-demo-1     | 2025-01-13T01:43:54.228611468Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"CONTROL",  "id":4784927, "ctx":"SignalHandler","msg":"Shutting down the HealthLog"}
    mongo-demo-1     | 2025-01-13T01:43:54.228618450Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"CONTROL",  "id":4784928, "ctx":"SignalHandler","msg":"Shutting down the TTL monitor"}
    mongo-demo-1     | 2025-01-13T01:43:54.228625270Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"INDEX",    "id":3684100, "ctx":"SignalHandler","msg":"Shutting down TTL collection monitor thread"}
    mongo-demo-1     | 2025-01-13T01:43:54.228631898Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"INDEX",    "id":3684101, "ctx":"SignalHandler","msg":"Finished shutting down TTL collection monitor thread"}
    mongo-demo-1     | 2025-01-13T01:43:54.228639285Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"CONTROL",  "id":6278511, "ctx":"SignalHandler","msg":"Shutting down the Change Stream Expired Pre-images Remover"}
    mongo-demo-1     | 2025-01-13T01:43:54.228765601Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"CONTROL",  "id":4784929, "ctx":"SignalHandler","msg":"Acquiring the global lock for shutdown"}
    mongo-demo-1     | 2025-01-13T01:43:54.228797934Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"CONTROL",  "id":4784930, "ctx":"SignalHandler","msg":"Shutting down the storage engine"}
    mongo-demo-1     | 2025-01-13T01:43:54.228835368Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"STORAGE",  "id":22320,   "ctx":"SignalHandler","msg":"Shutting down journal flusher thread"}
    mongo-demo-1     | 2025-01-13T01:43:54.228842458Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"STORAGE",  "id":22321,   "ctx":"SignalHandler","msg":"Finished shutting down journal flusher thread"}
    mongo-demo-1     | 2025-01-13T01:43:54.228848753Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"STORAGE",  "id":22322,   "ctx":"SignalHandler","msg":"Shutting down checkpoint thread"}
    mongo-demo-1     | 2025-01-13T01:43:54.228855264Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"STORAGE",  "id":22323,   "ctx":"SignalHandler","msg":"Finished shutting down checkpoint thread"}
    mongo-demo-1     | 2025-01-13T01:43:54.228861819Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"STORAGE",  "id":22261,   "ctx":"SignalHandler","msg":"Timestamp monitor shutting down"}
    mongo-demo-1     | 2025-01-13T01:43:54.228868264Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"STORAGE",  "id":20282,   "ctx":"SignalHandler","msg":"Deregistering all the collections"}
    mongo-demo-1     | 2025-01-13T01:43:54.228874914Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"STORAGE",  "id":22317,   "ctx":"SignalHandler","msg":"WiredTigerKVEngine shutting down"}
    mongo-demo-1     | 2025-01-13T01:43:54.228882028Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"STORAGE",  "id":22318,   "ctx":"SignalHandler","msg":"Shutting down session sweeper thread"}
    mongo-demo-1     | 2025-01-13T01:43:54.229151875Z {"t":{"$date":"2025-01-13T01:43:54.228+00:00"},"s":"I",  "c":"STORAGE",  "id":22319,   "ctx":"SignalHandler","msg":"Finished shutting down session sweeper thread"}
    mongo-demo-1     | 2025-01-13T01:43:54.229174828Z {"t":{"$date":"2025-01-13T01:43:54.229+00:00"},"s":"I",  "c":"STORAGE",  "id":4795902, "ctx":"SignalHandler","msg":"Closing WiredTiger","attr":{"closeConfig":"leak_memory=true,use_timestamp=false,"}}
    mongo-demo-1     | 2025-01-13T01:43:54.230547595Z {"t":{"$date":"2025-01-13T01:43:54.229+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"SignalHandler","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732634,"ts_usec":229900,"thread":"1:0x7778106006c0","session_name":"close_ckpt","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 8, snapshot max: 8 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 7"}}}
    mongo-demo-1     | 2025-01-13T01:43:54.244794533Z {"t":{"$date":"2025-01-13T01:43:54.244+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"SignalHandler","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732634,"ts_usec":244550,"thread":"1:0x7778106006c0","session_name":"WT_CONNECTION.close","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"shutdown checkpoint has successfully finished and ran for 14 milliseconds"}}}
    mongo-demo-1     | 2025-01-13T01:43:54.245033502Z {"t":{"$date":"2025-01-13T01:43:54.244+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"SignalHandler","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732634,"ts_usec":244794,"thread":"1:0x7778106006c0","session_name":"WT_CONNECTION.close","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"shutdown was completed successfully and took 15ms, including 0ms for the rollback to stable, and 14ms for the checkpoint."}}}
    mongo-demo-1     | 2025-01-13T01:43:54.263312203Z {"t":{"$date":"2025-01-13T01:43:54.263+00:00"},"s":"I",  "c":"STORAGE",  "id":4795901, "ctx":"SignalHandler","msg":"WiredTiger closed","attr":{"durationMillis":34}}
    mongo-demo-1     | 2025-01-13T01:43:54.263346387Z {"t":{"$date":"2025-01-13T01:43:54.263+00:00"},"s":"I",  "c":"STORAGE",  "id":22279,   "ctx":"SignalHandler","msg":"shutdown: removing fs lock..."}
    mongo-demo-1     | 2025-01-13T01:43:54.263365776Z {"t":{"$date":"2025-01-13T01:43:54.263+00:00"},"s":"I",  "c":"-",        "id":4784931, "ctx":"SignalHandler","msg":"Dropping the scope cache for shutdown"}
    mongo-demo-1     | 2025-01-13T01:43:54.263375410Z {"t":{"$date":"2025-01-13T01:43:54.263+00:00"},"s":"I",  "c":"FTDC",     "id":20626,   "ctx":"SignalHandler","msg":"Shutting down full-time diagnostic data capture"}
    mongo-demo-1     | 2025-01-13T01:43:54.273778977Z {"t":{"$date":"2025-01-13T01:43:54.273+00:00"},"s":"I",  "c":"CONTROL",  "id":20565,   "ctx":"SignalHandler","msg":"Now exiting"}
    mongo-demo-1     | 2025-01-13T01:43:54.274113770Z {"t":{"$date":"2025-01-13T01:43:54.273+00:00"},"s":"I",  "c":"CONTROL",  "id":8423404, "ctx":"SignalHandler","msg":"mongod shutdown complete","attr":{"Summary of time elapsed":{"Statistics":{"Enter terminal shutdown":"0 ms","Step down the replication coordinator for shutdown":"0 ms","Time spent in quiesce mode":"0 ms","Shut down FLE Crud subsystem":"0 ms","Shut down MirrorMaestro":"0 ms","Shut down WaitForMajorityService":"2 ms","Shut down the logical session cache":"0 ms","Shut down the global connection pool":"0 ms","Shut down the flow control ticket holder":"0 ms","Shut down the thread that aborts expired transactions":"0 ms","Kill all operations for shutdown":"0 ms","Shut down all tenant migration access blockers on global shutdown":"0 ms","Shut down all open transactions":"0 ms","Acquire the RSTL for shutdown":"0 ms","Shut down the IndexBuildsCoordinator and wait for index builds to finish":"0 ms","Shut down the replica set monitor":"0 ms","Shut down the migration util executor":"1 ms","Shut down the transport layer":"0 ms","Shut down the health log":"0 ms","Shut down the TTL monitor":"0 ms","Shut down expired pre-images and documents removers":"0 ms","Shut down the storage engine":"35 ms","Wait for the oplog cap maintainer thread to stop":"0 ms","Shut down full-time data capture":"10 ms","Shut down online certificate status protocol manager":"0 ms","shutdownTask total elapsed time":"50 ms"}}}}
    mongo-demo-1     | 2025-01-13T01:43:54.274159006Z {"t":{"$date":"2025-01-13T01:43:54.273+00:00"},"s":"I",  "c":"CONTROL",  "id":23138,   "ctx":"SignalHandler","msg":"Shutting down","attr":{"exitCode":0}}
    mongo-demo-1     | 2025-01-13T01:47:09.527776942Z {"t":{"$date":"2025-01-13T01:47:09.527+00:00"},"s":"I",  "c":"CONTROL",  "id":23285,   "ctx":"main","msg":"Automatically disabling TLS 1.0, to force-enable TLS 1.0 specify --sslDisabledProtocols 'none'"}
    mongo-demo-1     | 2025-01-13T01:47:09.531698119Z {"t":{"$date":"2025-01-13T01:47:09.531+00:00"},"s":"I",  "c":"CONTROL",  "id":5945603, "ctx":"main","msg":"Multi threading initialized"}
    mongo-demo-1     | 2025-01-13T01:47:09.532284399Z {"t":{"$date":"2025-01-13T01:47:09.532+00:00"},"s":"I",  "c":"NETWORK",  "id":4648601, "ctx":"main","msg":"Implicit TCP FastOpen unavailable. If TCP FastOpen is required, set at least one of the related parameters","attr":{"relatedParameters":["tcpFastOpenServer","tcpFastOpenClient","tcpFastOpenQueueSize"]}}
    mongo-demo-1     | 2025-01-13T01:47:09.534229667Z {"t":{"$date":"2025-01-13T01:47:09.534+00:00"},"s":"I",  "c":"NETWORK",  "id":4915701, "ctx":"main","msg":"Initialized wire specification","attr":{"spec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":25},"outgoing":{"minWireVersion":6,"maxWireVersion":25},"isInternalClient":true}}}
    mongo-demo-1     | 2025-01-13T01:47:09.534919931Z {"t":{"$date":"2025-01-13T01:47:09.534+00:00"},"s":"I",  "c":"TENANT_M", "id":7091600, "ctx":"main","msg":"Starting TenantMigrationAccessBlockerRegistry"}
    mongo-demo-1     | 2025-01-13T01:47:09.535170167Z {"t":{"$date":"2025-01-13T01:47:09.534+00:00"},"s":"I",  "c":"CONTROL",  "id":4615611, "ctx":"initandlisten","msg":"MongoDB starting","attr":{"pid":1,"port":27017,"dbPath":"/data/db","architecture":"64-bit","host":"8c08ec298d66"}}
    mongo-demo-1     | 2025-01-13T01:47:09.535202600Z {"t":{"$date":"2025-01-13T01:47:09.534+00:00"},"s":"I",  "c":"CONTROL",  "id":23403,   "ctx":"initandlisten","msg":"Build Info","attr":{"buildInfo":{"version":"8.0.4","gitVersion":"bc35ab4305d9920d9d0491c1c9ef9b72383d31f9","openSSLVersion":"OpenSSL 3.0.13 30 Jan 2024","modules":[],"allocator":"tcmalloc-google","environment":{"distmod":"ubuntu2404","distarch":"x86_64","target_arch":"x86_64"}}}}
    mongo-demo-1     | 2025-01-13T01:47:09.535218237Z {"t":{"$date":"2025-01-13T01:47:09.534+00:00"},"s":"I",  "c":"CONTROL",  "id":51765,   "ctx":"initandlisten","msg":"Operating System","attr":{"os":{"name":"Ubuntu","version":"24.04"}}}
    mongo-demo-1     | 2025-01-13T01:47:09.535227975Z {"t":{"$date":"2025-01-13T01:47:09.534+00:00"},"s":"I",  "c":"CONTROL",  "id":21951,   "ctx":"initandlisten","msg":"Options set by command line","attr":{"options":{"net":{"bindIp":"*"},"security":{"authorization":"enabled"}}}}
    mongo-demo-1     | 2025-01-13T01:47:09.536455740Z {"t":{"$date":"2025-01-13T01:47:09.536+00:00"},"s":"I",  "c":"STORAGE",  "id":22270,   "ctx":"initandlisten","msg":"Storage engine to use detected by data files","attr":{"dbpath":"/data/db","storageEngine":"wiredTiger"}}
    mongo-demo-1     | 2025-01-13T01:47:09.536823876Z {"t":{"$date":"2025-01-13T01:47:09.536+00:00"},"s":"I",  "c":"STORAGE",  "id":22297,   "ctx":"initandlisten","msg":"Using the XFS filesystem is strongly recommended with the WiredTiger storage engine. See http://dochub.mongodb.org/core/prodnotes-filesystem","tags":["startupWarnings"]}
    mongo-demo-1     | 2025-01-13T01:47:09.536856983Z {"t":{"$date":"2025-01-13T01:47:09.536+00:00"},"s":"I",  "c":"STORAGE",  "id":22315,   "ctx":"initandlisten","msg":"Opening WiredTiger","attr":{"config":"create,cache_size=3413M,session_max=33000,eviction=(threads_min=4,threads_max=4),config_base=false,statistics=(fast),log=(enabled=true,remove=true,path=journal,compressor=snappy),builtin_extension_config=(zstd=(compression_level=6)),file_manager=(close_idle_time=600,close_scan_interval=10,close_handle_minimum=2000),statistics_log=(wait=0),json_output=(error,message),verbose=[recovery_progress:1,checkpoint_progress:1,compact_progress:1,backup:0,checkpoint:0,compact:0,evict:0,history_store:0,recovery:0,rts:0,salvage:0,tiered:0,timestamp:0,transaction:0,verify:0,log:0],prefetch=(available=true,default=false),"}}
    mongo-demo-1     | 2025-01-13T01:47:10.587623547Z {"t":{"$date":"2025-01-13T01:47:10.587+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732830,"ts_usec":587417,"thread":"1:0x73de4af25680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Recovering log 2 through 3"}}}
    mongo-demo-1     | 2025-01-13T01:47:10.657821628Z {"t":{"$date":"2025-01-13T01:47:10.657+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732830,"ts_usec":657565,"thread":"1:0x73de4af25680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Recovering log 3 through 3"}}}
    mongo-demo-1     | 2025-01-13T01:47:10.775381611Z {"t":{"$date":"2025-01-13T01:47:10.775+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732830,"ts_usec":775202,"thread":"1:0x73de4af25680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Main recovery loop: starting at 2/8704 to 3/256"}}}
    mongo-demo-1     | 2025-01-13T01:47:10.911264952Z {"t":{"$date":"2025-01-13T01:47:10.911+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732830,"ts_usec":911019,"thread":"1:0x73de4af25680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Recovering log 2 through 3"}}}
    mongo-demo-1     | 2025-01-13T01:47:10.994672205Z {"t":{"$date":"2025-01-13T01:47:10.994+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732830,"ts_usec":994482,"thread":"1:0x73de4af25680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Recovering log 3 through 3"}}}
    mongo-demo-1     | 2025-01-13T01:47:11.068164948Z {"t":{"$date":"2025-01-13T01:47:11.067+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732831,"ts_usec":67868,"thread":"1:0x73de4af25680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery log replay has successfully finished and ran for 480 milliseconds"}}}
    mongo-demo-1     | 2025-01-13T01:47:11.068208365Z {"t":{"$date":"2025-01-13T01:47:11.068+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732831,"ts_usec":67982,"thread":"1:0x73de4af25680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Set global recovery timestamp: (0, 0)"}}}
    mongo-demo-1     | 2025-01-13T01:47:11.068221568Z {"t":{"$date":"2025-01-13T01:47:11.068+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732831,"ts_usec":68029,"thread":"1:0x73de4af25680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Set global oldest timestamp: (0, 0)"}}}
    mongo-demo-1     | 2025-01-13T01:47:11.069642271Z {"t":{"$date":"2025-01-13T01:47:11.069+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732831,"ts_usec":69467,"thread":"1:0x73de4af25680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery rollback to stable has successfully finished and ran for 1 milliseconds"}}}
    mongo-demo-1     | 2025-01-13T01:47:11.078677085Z {"t":{"$date":"2025-01-13T01:47:11.078+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732831,"ts_usec":78386,"thread":"1:0x73de4af25680","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 1, snapshot max: 1 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
    mongo-demo-1     | 2025-01-13T01:47:11.084619426Z {"t":{"$date":"2025-01-13T01:47:11.084+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732831,"ts_usec":84397,"thread":"1:0x73de4af25680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery checkpoint has successfully finished and ran for 14 milliseconds"}}}
    mongo-demo-1     | 2025-01-13T01:47:11.084659140Z {"t":{"$date":"2025-01-13T01:47:11.084+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732831,"ts_usec":84501,"thread":"1:0x73de4af25680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery was completed successfully and took 497ms, including 480ms for the log replay, 1ms for the rollback to stable, and 14ms for the checkpoint."}}}
    mongo-demo-1     | 2025-01-13T01:47:11.089965936Z {"t":{"$date":"2025-01-13T01:47:11.089+00:00"},"s":"I",  "c":"STORAGE",  "id":4795906, "ctx":"initandlisten","msg":"WiredTiger opened","attr":{"durationMillis":1553}}
    mongo-demo-1     | 2025-01-13T01:47:11.090004203Z {"t":{"$date":"2025-01-13T01:47:11.089+00:00"},"s":"I",  "c":"RECOVERY", "id":23987,   "ctx":"initandlisten","msg":"WiredTiger recoveryTimestamp","attr":{"recoveryTimestamp":{"$timestamp":{"t":0,"i":0}}}}
    mongo-demo-1     | 2025-01-13T01:47:11.101447432Z {"t":{"$date":"2025-01-13T01:47:11.101+00:00"},"s":"W",  "c":"CONTROL",  "id":9068900, "ctx":"initandlisten","msg":"For customers running the current memory allocator, we suggest changing the contents of the following sysfsFile","attr":{"allocator":"tcmalloc-google","sysfsFile":"/sys/kernel/mm/transparent_hugepage/enabled","currentValue":"never","desiredValue":"always"},"tags":["startupWarnings"]}
    mongo-demo-1     | 2025-01-13T01:47:11.101654087Z {"t":{"$date":"2025-01-13T01:47:11.101+00:00"},"s":"W",  "c":"CONTROL",  "id":9068900, "ctx":"initandlisten","msg":"For customers running the current memory allocator, we suggest changing the contents of the following sysfsFile","attr":{"allocator":"tcmalloc-google","sysfsFile":"/sys/kernel/mm/transparent_hugepage/defrag","currentValue":"madvise","desiredValue":"defer+madvise"},"tags":["startupWarnings"]}
    mongo-demo-1     | 2025-01-13T01:47:11.101682665Z {"t":{"$date":"2025-01-13T01:47:11.101+00:00"},"s":"W",  "c":"CONTROL",  "id":8640302, "ctx":"initandlisten","msg":"We suggest setting the contents of sysfsFile to 0.","attr":{"sysfsFile":"/sys/kernel/mm/transparent_hugepage/khugepaged/max_ptes_none","currentValue":511},"tags":["startupWarnings"]}
    mongo-demo-1     | 2025-01-13T01:47:11.101690301Z {"t":{"$date":"2025-01-13T01:47:11.101+00:00"},"s":"W",  "c":"CONTROL",  "id":8718500, "ctx":"initandlisten","msg":"Your system has glibc support for rseq built in, which is not yet supported by tcmalloc-google and has critical performance implications. Please set the environment variable GLIBC_TUNABLES=glibc.pthread.rseq=0","tags":["startupWarnings"]}
    mongo-demo-1     | 2025-01-13T01:47:11.102231201Z {"t":{"$date":"2025-01-13T01:47:11.101+00:00"},"s":"W",  "c":"NETWORK",  "id":5123300, "ctx":"initandlisten","msg":"vm.max_map_count is too low","attr":{"currentValue":1048576,"recommendedMinimum":1677720,"maxConns":838860},"tags":["startupWarnings"]}
    mongo-demo-1     | 2025-01-13T01:47:11.102260405Z {"t":{"$date":"2025-01-13T01:47:11.101+00:00"},"s":"W",  "c":"CONTROL",  "id":8386700, "ctx":"initandlisten","msg":"We suggest setting swappiness to 0 or 1, as swapping can cause performance problems.","attr":{"sysfsFile":"/proc/sys/vm/swappiness","currentValue":60},"tags":["startupWarnings"]}
    mongo-demo-1     | 2025-01-13T01:47:11.107884167Z {"t":{"$date":"2025-01-13T01:47:11.107+00:00"},"s":"I",  "c":"NETWORK",  "id":4915702, "ctx":"initandlisten","msg":"Updated wire specification","attr":{"oldSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":25},"outgoing":{"minWireVersion":6,"maxWireVersion":25},"isInternalClient":true},"newSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":25,"maxWireVersion":25},"outgoing":{"minWireVersion":25,"maxWireVersion":25},"isInternalClient":true}}}
    mongo-demo-1     | 2025-01-13T01:47:11.107920450Z {"t":{"$date":"2025-01-13T01:47:11.107+00:00"},"s":"I",  "c":"REPL",     "id":5853300, "ctx":"initandlisten","msg":"current featureCompatibilityVersion value","attr":{"featureCompatibilityVersion":"8.0","context":"startup"}}
    mongo-demo-1     | 2025-01-13T01:47:11.108066227Z {"t":{"$date":"2025-01-13T01:47:11.107+00:00"},"s":"I",  "c":"STORAGE",  "id":5071100, "ctx":"initandlisten","msg":"Clearing temp directory"}
    mongo-demo-1     | 2025-01-13T01:47:11.110014335Z {"t":{"$date":"2025-01-13T01:47:11.109+00:00"},"s":"I",  "c":"CONTROL",  "id":6608200, "ctx":"initandlisten","msg":"Initializing cluster server parameters from disk"}
    mongo-demo-1     | 2025-01-13T01:47:11.110214432Z {"t":{"$date":"2025-01-13T01:47:11.110+00:00"},"s":"I",  "c":"CONTROL",  "id":20536,   "ctx":"initandlisten","msg":"Flow Control is enabled on this deployment"}
    mongo-demo-1     | 2025-01-13T01:47:11.110673969Z {"t":{"$date":"2025-01-13T01:47:11.110+00:00"},"s":"I",  "c":"FTDC",     "id":20625,   "ctx":"initandlisten","msg":"Initializing full-time diagnostic data capture","attr":{"dataDirectory":"/data/db/diagnostic.data"}}
    mongo-demo-1     | 2025-01-13T01:47:11.113869400Z {"t":{"$date":"2025-01-13T01:47:11.113+00:00"},"s":"I",  "c":"REPL",     "id":6015317, "ctx":"initandlisten","msg":"Setting new configuration state","attr":{"newState":"ConfigReplicationDisabled","oldState":"ConfigPreStart"}}
    mongo-demo-1     | 2025-01-13T01:47:11.113945824Z {"t":{"$date":"2025-01-13T01:47:11.113+00:00"},"s":"I",  "c":"STORAGE",  "id":22262,   "ctx":"initandlisten","msg":"Timestamp monitor starting"}
    mongo-demo-1     | 2025-01-13T01:47:11.114134879Z {"t":{"$date":"2025-01-13T01:47:11.114+00:00"},"s":"I",  "c":"STORAGE",  "id":7333401, "ctx":"initandlisten","msg":"Starting the DiskSpaceMonitor"}
    mongo-demo-1     | 2025-01-13T01:47:11.115340488Z {"t":{"$date":"2025-01-13T01:47:11.115+00:00"},"s":"I",  "c":"NETWORK",  "id":23015,   "ctx":"listener","msg":"Listening on","attr":{"address":"/tmp/mongodb-27017.sock"}}
    mongo-demo-1     | 2025-01-13T01:47:11.115374461Z {"t":{"$date":"2025-01-13T01:47:11.115+00:00"},"s":"I",  "c":"NETWORK",  "id":23015,   "ctx":"listener","msg":"Listening on","attr":{"address":"0.0.0.0:27017"}}
    mongo-demo-1     | 2025-01-13T01:47:11.115384226Z {"t":{"$date":"2025-01-13T01:47:11.115+00:00"},"s":"I",  "c":"NETWORK",  "id":23016,   "ctx":"listener","msg":"Waiting for connections","attr":{"port":27017,"ssl":"off"}}
    mongo-demo-1     | 2025-01-13T01:47:11.115500765Z {"t":{"$date":"2025-01-13T01:47:11.115+00:00"},"s":"I",  "c":"CONTROL",  "id":8423403, "ctx":"initandlisten","msg":"mongod startup complete","attr":{"Summary of time elapsed":{"Startup from clean shutdown?":true,"Statistics":{"Set up periodic runner":"0 ms","Set up online certificate status protocol manager":"0 ms","Transport layer setup":"0 ms","Run initial syncer crash recovery":"0 ms","Create storage engine lock file in the data directory":"0 ms","Get metadata describing storage engine":"0 ms","Validate options in metadata against current startup options":"0 ms","Create storage engine":"1555 ms","Write current PID to file":"0 ms","Initialize FCV before rebuilding indexes":"6 ms","Drop abandoned idents and get back indexes that need to be rebuilt or builds that need to be restarted":"0 ms","Rebuild indexes for collections":"0 ms","Load cluster parameters from disk for a standalone":"0 ms","Build user and roles graph":"0 ms","Verify indexes for admin.system.users collection":"0 ms","Set up the background thread pool responsible for waiting for opTimes to be majority committed":"1 ms","Start up the replication coordinator":"1 ms","Ensure the change stream collections on startup contain consistent data":"0 ms","Write startup options to the audit log":"0 ms","Start transport layer":"1 ms","_initAndListen total elapsed time":"1581 ms"}}}}
    mongo-demo-1     | 2025-01-13T01:47:11.782911781Z {"t":{"$date":"2025-01-13T01:47:11.782+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"172.18.0.3:44057","uuid":{"uuid":{"$uuid":"01217118-1875-485d-9390-1c736c8081dd"}},"connectionId":1,"connectionCount":1}}
    mongo-demo-1     | 2025-01-13T01:47:11.783370813Z {"t":{"$date":"2025-01-13T01:47:11.783+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn1","msg":"Connection ended","attr":{"remote":"172.18.0.3:44057","uuid":{"uuid":{"$uuid":"01217118-1875-485d-9390-1c736c8081dd"}},"connectionId":1,"connectionCount":0}}
    mongo-demo-1     | 2025-01-13T01:47:11.786438596Z {"t":{"$date":"2025-01-13T01:47:11.786+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"172.18.0.3:39516","uuid":{"uuid":{"$uuid":"5638ab51-d509-43a9-821e-455fc320a258"}},"connectionId":2,"connectionCount":1}}
    mongo-demo-1     | 2025-01-13T01:47:11.786811626Z {"t":{"$date":"2025-01-13T01:47:11.786+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn2","msg":"Connection ended","attr":{"remote":"172.18.0.3:39516","uuid":{"uuid":{"$uuid":"5638ab51-d509-43a9-821e-455fc320a258"}},"connectionId":2,"connectionCount":0}}
    mongo-demo-1     | 2025-01-13T01:47:12.010263974Z {"t":{"$date":"2025-01-13T01:47:12.010+00:00"},"s":"W",  "c":"CONTROL",  "id":636300,  "ctx":"ftdc","msg":"Use of deprecated server parameter name","attr":{"deprecatedName":"internalQueryCacheSize","canonicalName":"internalQueryCacheMaxEntriesPerCollection"}}
    mongo-demo-1     | 2025-01-13T01:47:12.010395510Z {"t":{"$date":"2025-01-13T01:47:12.010+00:00"},"s":"W",  "c":"CONTROL",  "id":636300,  "ctx":"ftdc","msg":"Use of deprecated server parameter name","attr":{"deprecatedName":"oplogSamplingLogIntervalSeconds","canonicalName":"collectionSamplingLogIntervalSeconds"}}
    mongo-demo-1     | 2025-01-13T01:47:12.010429517Z {"t":{"$date":"2025-01-13T01:47:12.010+00:00"},"s":"W",  "c":"NETWORK",  "id":23803,   "ctx":"ftdc","msg":"Use of deprecated server parameter 'sslMode', please use 'tlsMode' instead."}
    mongo-demo-1     | 2025-01-13T01:47:12.010633678Z {"t":{"$date":"2025-01-13T01:47:12.010+00:00"},"s":"W",  "c":"CONTROL",  "id":636300,  "ctx":"ftdc","msg":"Use of deprecated server parameter name","attr":{"deprecatedName":"wiredTigerConcurrentReadTransactions","canonicalName":"storageEngineConcurrentReadTransactions"}}
    mongo-demo-1     | 2025-01-13T01:47:12.010657219Z {"t":{"$date":"2025-01-13T01:47:12.010+00:00"},"s":"W",  "c":"CONTROL",  "id":636300,  "ctx":"ftdc","msg":"Use of deprecated server parameter name","attr":{"deprecatedName":"wiredTigerConcurrentWriteTransactions","canonicalName":"storageEngineConcurrentWriteTransactions"}}
    mongo-demo-1     | 2025-01-13T01:47:13.248999747Z {"t":{"$date":"2025-01-13T01:47:13.248+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"172.18.0.3:55470","uuid":{"uuid":{"$uuid":"9d313bf7-016e-4d80-af0c-2cee259e340d"}},"connectionId":3,"connectionCount":1}}
    mongo-demo-1     | 2025-01-13T01:47:13.258367245Z {"t":{"$date":"2025-01-13T01:47:13.258+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn3","msg":"client metadata","attr":{"remote":"172.18.0.3:55470","client":"conn3","negotiatedCompressors":[],"doc":{"driver":{"name":"nodejs","version":"4.13.0"},"os":{"type":"Linux","name":"linux","architecture":"x64","version":"6.8.0-51-generic"},"platform":"Node.js v18.20.3, LE (unified)|Node.js v18.20.3, LE (unified)"}}}
    mongo-demo-1     | 2025-01-13T01:47:13.269868703Z {"t":{"$date":"2025-01-13T01:47:13.269+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"172.18.0.3:55476","uuid":{"uuid":{"$uuid":"61ea7100-be6b-4267-b335-0ef382464de1"}},"connectionId":4,"connectionCount":2}}
    mongo-demo-1     | 2025-01-13T01:47:13.273478471Z {"t":{"$date":"2025-01-13T01:47:13.273+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn4","msg":"client metadata","attr":{"remote":"172.18.0.3:55476","client":"conn4","negotiatedCompressors":[],"doc":{"driver":{"name":"nodejs","version":"4.13.0"},"os":{"type":"Linux","name":"linux","architecture":"x64","version":"6.8.0-51-generic"},"platform":"Node.js v18.20.3, LE (unified)|Node.js v18.20.3, LE (unified)"}}}
    mongo-demo-1     | 2025-01-13T01:47:13.276489753Z {"t":{"$date":"2025-01-13T01:47:13.276+00:00"},"s":"I",  "c":"ACCESS",   "id":6788604, "ctx":"conn4","msg":"Auth metrics report","attr":{"metric":"acquireUser","micros":0}}
    mongo-demo-1     | 2025-01-13T01:47:13.305157143Z {"t":{"$date":"2025-01-13T01:47:13.304+00:00"},"s":"I",  "c":"ACCESS",   "id":5286306, "ctx":"conn4","msg":"Successfully authenticated","attr":{"client":"172.18.0.3:55476","isSpeculative":true,"isClusterMember":false,"mechanism":"SCRAM-SHA-256","user":"admin","db":"admin","result":0,"metrics":{"conversation_duration":{"micros":28650,"summary":{"0":{"step":1,"step_total":2,"duration_micros":122},"1":{"step":2,"step_total":2,"duration_micros":44}}}},"extraInfo":{}}}
    mongo-demo-1     | 2025-01-13T01:47:13.308539045Z {"t":{"$date":"2025-01-13T01:47:13.308+00:00"},"s":"I",  "c":"NETWORK",  "id":6788700, "ctx":"conn4","msg":"Received first command on ingress connection since session start or auth handshake","attr":{"elapsedMillis":3}}
    mongo-demo-1     | 2025-01-13T01:47:23.772932374Z {"t":{"$date":"2025-01-13T01:47:23.772+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"172.18.0.3:45830","uuid":{"uuid":{"$uuid":"40014527-d2a9-406e-b27c-73f630c12a9c"}},"connectionId":5,"connectionCount":3}}
    mongo-demo-1     | 2025-01-13T01:47:23.774343687Z {"t":{"$date":"2025-01-13T01:47:23.774+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn5","msg":"client metadata","attr":{"remote":"172.18.0.3:45830","client":"conn5","negotiatedCompressors":[],"doc":{"driver":{"name":"nodejs","version":"4.13.0"},"os":{"type":"Linux","name":"linux","architecture":"x64","version":"6.8.0-51-generic"},"platform":"Node.js v18.20.3, LE (unified)|Node.js v18.20.3, LE (unified)"}}}
    mongo-demo-1     | 2025-01-13T01:48:11.106594979Z {"t":{"$date":"2025-01-13T01:48:11.106+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732891,"ts_usec":105960,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 4, snapshot max: 4 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
    mongo-demo-1     | 2025-01-13T01:49:11.119577811Z {"t":{"$date":"2025-01-13T01:49:11.119+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736732951,"ts_usec":119360,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 5, snapshot max: 5 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
    mongo-demo-1     | 2025-01-13T01:50:11.126950977Z {"t":{"$date":"2025-01-13T01:50:11.126+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733011,"ts_usec":126507,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 6, snapshot max: 6 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
    mongo-demo-1     | 2025-01-13T01:51:11.139273826Z {"t":{"$date":"2025-01-13T01:51:11.139+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733071,"ts_usec":138996,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 7, snapshot max: 7 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
    mongo-demo-1     | 2025-01-13T01:52:11.154395788Z {"t":{"$date":"2025-01-13T01:52:11.153+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733131,"ts_usec":153783,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 10, snapshot max: 10 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
    mongo-demo-1     | 2025-01-13T01:53:11.168446919Z {"t":{"$date":"2025-01-13T01:53:11.168+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733191,"ts_usec":168053,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 11, snapshot max: 11 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
    mongo-demo-1     | 2025-01-13T01:54:11.180380712Z {"t":{"$date":"2025-01-13T01:54:11.180+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733251,"ts_usec":180136,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 12, snapshot max: 12 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
    mongo-demo-1     | 2025-01-13T01:55:11.190892570Z {"t":{"$date":"2025-01-13T01:55:11.190+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733311,"ts_usec":190688,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 13, snapshot max: 13 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
    mongo-demo-1     | 2025-01-13T01:56:11.205779045Z {"t":{"$date":"2025-01-13T01:56:11.205+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733371,"ts_usec":205574,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 14, snapshot max: 14 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
    mongo-demo-1     | 2025-01-13T01:57:11.216304854Z {"t":{"$date":"2025-01-13T01:57:11.215+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733431,"ts_usec":215869,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 15, snapshot max: 15 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
    mongo-demo-1     | 2025-01-13T01:58:11.228482358Z {"t":{"$date":"2025-01-13T01:58:11.228+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733491,"ts_usec":228217,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 16, snapshot max: 16 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
    mongo-demo-1     | 2025-01-13T01:59:11.240015805Z {"t":{"$date":"2025-01-13T01:59:11.239+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733551,"ts_usec":239584,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 17, snapshot max: 17 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
    mongo-demo-1     | 2025-01-13T02:00:11.251822822Z {"t":{"$date":"2025-01-13T02:00:11.251+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733611,"ts_usec":251509,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 18, snapshot max: 18 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
    mongo-demo-1     | 2025-01-13T02:01:11.263177982Z {"t":{"$date":"2025-01-13T02:01:11.262+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733671,"ts_usec":262727,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 19, snapshot max: 19 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
    mongo-demo-1     | 2025-01-13T02:02:11.277210162Z {"t":{"$date":"2025-01-13T02:02:11.276+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733731,"ts_usec":276742,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 20, snapshot max: 20 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
    mongo-demo-1     | 2025-01-13T02:03:11.289494582Z {"t":{"$date":"2025-01-13T02:03:11.289+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733791,"ts_usec":289021,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 21, snapshot max: 21 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
    mongo-demo-1     | 2025-01-13T02:04:11.302690845Z {"t":{"$date":"2025-01-13T02:04:11.302+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733851,"ts_usec":302246,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 22, snapshot max: 22 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
    mongo-demo-1     | 2025-01-13T02:05:11.314685436Z {"t":{"$date":"2025-01-13T02:05:11.314+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733911,"ts_usec":314261,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 23, snapshot max: 23 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
    mongo-demo-1     | 2025-01-13T02:06:11.328647952Z {"t":{"$date":"2025-01-13T02:06:11.328+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736733971,"ts_usec":328352,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 24, snapshot max: 24 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
    mongo-demo-1     | 2025-01-13T02:07:11.342227911Z {"t":{"$date":"2025-01-13T02:07:11.342+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736734031,"ts_usec":341961,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 25, snapshot max: 25 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
    mongo-demo-1     | 2025-01-13T02:08:11.355251504Z {"t":{"$date":"2025-01-13T02:08:11.354+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736734091,"ts_usec":354945,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 26, snapshot max: 26 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
    mongo-demo-1     | 2025-01-13T02:09:11.370359075Z {"t":{"$date":"2025-01-13T02:09:11.370+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736734151,"ts_usec":370151,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 27, snapshot max: 27 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
    mongo-demo-1     | 2025-01-13T02:10:11.383115824Z {"t":{"$date":"2025-01-13T02:10:11.382+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736734211,"ts_usec":382556,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 28, snapshot max: 28 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
    mongo-demo-1     | 2025-01-13T02:11:11.397655746Z {"t":{"$date":"2025-01-13T02:11:11.397+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736734271,"ts_usec":397353,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 29, snapshot max: 29 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
    mongo-demo-1     | 2025-01-13T02:12:11.411715240Z {"t":{"$date":"2025-01-13T02:12:11.411+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736734331,"ts_usec":411269,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 30, snapshot max: 30 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
    mongo-demo-1     | 2025-01-13T02:13:11.425582169Z {"t":{"$date":"2025-01-13T02:13:11.425+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736734391,"ts_usec":425187,"thread":"1:0x73de38c006c0","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 31, snapshot max: 31 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 27"}}}
    ```

---

### **Flujo práctico con `--since` y `--until`**

1. **Monitorear logs recientes en tiempo real:**

   ```bash
   docker compose -f mongo-services.yaml logs --tail 10 --follow --timestamps
   ```

2. **Depurar un evento entre un rango de tiempo específico:**

   ```bash
   docker compose -f mongo-services.yaml logs --since "2025-01-12T09:00:00" --until "2025-01-12T09:30:00" --timestamps
   ```

3. **Revisar todo el historial:**

   ```bash
   docker compose -f mongo-services.yaml logs --tail all --timestamps
   ```
