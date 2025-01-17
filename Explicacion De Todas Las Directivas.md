<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# Explicacion

Docker Compose es una herramienta potente para definir y ejecutar aplicaciones multi-contenedor en Docker. Para lograr esta funcionalidad, **Docker Compose** utiliza un fichero de configuración en formato YAML, llamado `docker-compose.yml`, en el cual se definen diversos servicios, redes, volúmenes, y otros aspectos de la infraestructura.

A continuación, te explicaré **todas las directivas** posibles en Docker Compose, con una breve explicación de cada una, y luego te proporcionaré un ejemplo aplicando todas.

---

### **1. Directivas Principales de Docker Compose**

#### **`version`**

Especifica la versión de la sintaxis del fichero `docker-compose.yml`. La versión puede variar, dependiendo de las características que se deseen usar.

Ejemplo:

```yaml
version: "3.8"
```

#### **`services`**

Define los servicios que componen la aplicación. Cada servicio es un contenedor de Docker. Dentro de `services`, puedes especificar las configuraciones de cada contenedor (como imágenes, volúmenes, puertos, etc.).

Ejemplo:

```yaml
services:
  web:
    image: nginx
```

#### **`networks`**

Define las redes de contenedor que Docker Compose debe crear. Los contenedores pueden estar conectados a redes específicas para poder comunicarse entre sí.

Ejemplo:

```yaml
networks:
  mynetwork:
    driver: bridge
```

#### **`volumes`**

Define los volúmenes de Docker, que se usan para persistir datos entre contenedores o entre contenedores y el sistema de ficheros del host.

Ejemplo:

```yaml
volumes:
  mydata:
    driver: local
```

#### **`configs`**

Define configuraciones que se pueden inyectar en los contenedores. Se usan para pasar datos de configuración a los contenedores, como ficheros de configuración de aplicaciones.

Ejemplo:

```yaml
configs:
  my_config:
    file: ./config/my_config.cfg
```

#### **`secrets`**

Define secretos (como contraseñas) que se deben manejar de forma segura. Se usan para pasar secretos a los contenedores.

Ejemplo:

```yaml
secrets:
  my_secret:
    file: ./secrets/password.txt
```

#### **`build`**

Define cómo construir una imagen de Docker para un servicio desde un `Dockerfile`.

Ejemplo:

```yaml
build:
  context: .
  dockerfile: Dockerfile
```

#### **`image`**

Define la imagen de Docker que se utilizará para un servicio. Puede ser una imagen existente o una imagen que se cree utilizando `build`.

Ejemplo:

```yaml
image: nginx:latest
```

#### **`container_name`**

Define un nombre personalizado para el contenedor. Si no se especifica, Docker Compose generará un nombre automáticamente.

Ejemplo:

```yaml
container_name: mycontainer
```

#### **`depends_on`**

Define dependencias entre servicios. Es útil para garantizar que un servicio no se inicie hasta que otro servicio esté disponible.

Ejemplo:

```yaml
depends_on:
  - mongo
```

#### **`environment`**

Define variables de entorno que se pasan al contenedor.

Ejemplo:

```yaml
environment:
  - MONGO_URI=mongodb://mongo:27017
```

#### **`env_file`**

Especifica ficheros que contienen variables de entorno que se deben cargar en el contenedor.

Ejemplo:

```yaml
env_file:
  - .env
```

#### **`command`**

Especifica el comando que se ejecutará cuando se inicie el contenedor.

Ejemplo:

```yaml
command: ["python", "app.py"]
```

#### **`entrypoint`**

Define el punto de entrada del contenedor. Se sobrepone al valor por defecto en la imagen.

Ejemplo:

```yaml
entrypoint: /bin/sh -c "echo Hello World"
```

#### **`ports`**

Define la asignación de puertos entre el contenedor y el host.

Ejemplo:

```yaml
ports:
  - "8080:80"
```

#### **`expose`**

Expone puertos internos del contenedor, pero no realiza una asignación con el host. Es más útil para la comunicación entre contenedores dentro de una red de Docker.

Ejemplo:

```yaml
expose:
  - "8080"
```

#### **`restart`**

Define la política de reinicio del contenedor. Puede ser `no`, `always`, `unless-stopped`, o `on-failure`.

Ejemplo:

```yaml
restart: always
```

#### **`logging`**

Define cómo Docker debe manejar los logs de un contenedor.

Ejemplo:

```yaml
logging:
  driver: "json-file"
  options:
    max-size: "10m"
```

#### **`healthcheck`**

Define una prueba de salud para el contenedor, que Docker usará para determinar si el contenedor está funcionando correctamente.

Ejemplo:

```yaml
healthcheck:
  test: ["CMD", "curl", "-f", "http://localhost/health"]
  interval: 30s
  retries: 3
```

#### **`volumes`** (para un servicio)

Monta un volumen o un directorio desde el host al contenedor.

Ejemplo:

```yaml
volumes:
  - ./data:/data
```

#### **`networks`** (para un servicio)

Define a qué redes debe estar conectado el contenedor.

Ejemplo:

```yaml
networks:
  - mynetwork
```

#### **`cpus`**

Limita el uso de CPU para el contenedor.

Ejemplo:

```yaml
cpus: "1.0"
```

#### **`mem_limit`**

Limita la cantidad de memoria que el contenedor puede usar.

Ejemplo:

```yaml
mem_limit: 500m
```

#### **`ulimits`**

Define límites del sistema para un contenedor (por ejemplo, el número de ficheros que puede abrir).

Ejemplo:

```yaml
ulimits:
  nofile:
    soft: 1024
    hard: 2048
```

#### **`user`**

Especifica el usuario con el que debe ejecutarse el contenedor.

Ejemplo:

```yaml
user: "1000:1000"
```

#### **`hostname`**

Define el nombre de host del contenedor.

Ejemplo:

```yaml
hostname: myhost
```

---

### **Ejemplo Completo Aplicando Todas las Directivas**

```yaml
version: "3.8"

services:
  app:
    build:
      context: .
      dockerfile: Dockerfile
    image: my-app:latest
    container_name: my-app-container
    environment:
      - DATABASE_URL=mongodb://mongo:27017
    env_file:
      - .env
    command: /bin/sh -c "python app.py"
    entrypoint: /bin/sh -c "echo Starting App"
    depends_on:
      - mongo
    ports:
      - "8080:80"
    expose:
      - "8080"
    volumes:
      - ./app-data:/data
    networks:
      - app-network
    restart: always
    logging:
      driver: "json-file"
      options:
        max-size: "10m"
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost/health"]
      interval: 30s
      retries: 3
    cpus: "1.0"
    mem_limit: 500m
    ulimits:
      nofile:
        soft: 1024
        hard: 2048
    user: "1000:1000"
    hostname: my-app-host

  mongo:
    image: mongo:latest
    container_name: mongo-db
    environment:
      - MONGO_INITDB_ROOT_USERNAME=admin
      - MONGO_INITDB_ROOT_PASSWORD=supersecret
    volumes:
      - mongo-data:/data/db
    networks:
      - app-network

networks:
  app-network:
    driver: bridge

volumes:
  mongo-data:
    driver: local

configs:
  my_config:
    file: ./config/config.json

secrets:
  my_secret:
    file: ./secrets/password.txt
```

Este fichero `docker-compose.yml` utiliza **todas** las directivas disponibles, cubriendo todos los aspectos posibles de configuración en Docker Compose, como la creación de redes, volúmenes, servicios, manejo de dependencias, logs, variables de entorno, y mucho más.

---

Docker Compose es una herramienta potente para definir y ejecutar aplicaciones multi-contenedor en Docker. Para lograr esta funcionalidad, **Docker Compose** utiliza un fichero de configuración en formato YAML, llamado `docker-compose.yml`, en el cual se definen diversos servicios, redes, volúmenes, y otros aspectos de la infraestructura.

A continuación, te explicaré **todas las directivas** posibles en Docker Compose, con una breve explicación de cada una, y luego te proporcionaré un ejemplo aplicando todas.

---

### **1. Directivas Principales de Docker Compose**

#### **`version`**

Especifica la versión de la sintaxis del fichero `docker-compose.yml`. La versión puede variar, dependiendo de las características que se deseen usar.

Ejemplo:

```yaml
version: "3.8"
```

#### **`services`**

Define los servicios que componen la aplicación. Cada servicio es un contenedor de Docker. Dentro de `services`, puedes especificar las configuraciones de cada contenedor (como imágenes, volúmenes, puertos, etc.).

Ejemplo:

```yaml
services:
  web:
    image: nginx
```

#### **`networks`**

Define las redes de contenedor que Docker Compose debe crear. Los contenedores pueden estar conectados a redes específicas para poder comunicarse entre sí.

Ejemplo:

```yaml
networks:
  mynetwork:
    driver: bridge
```

#### **`volumes`**

Define los volúmenes de Docker, que se usan para persistir datos entre contenedores o entre contenedores y el sistema de ficheros del host.

Ejemplo:

```yaml
volumes:
  mydata:
    driver: local
```

#### **`configs`**

Define configuraciones que se pueden inyectar en los contenedores. Se usan para pasar datos de configuración a los contenedores, como ficheros de configuración de aplicaciones.

Ejemplo:

```yaml
configs:
  my_config:
    file: ./config/my_config.cfg
```

#### **`secrets`**

Define secretos (como contraseñas) que se deben manejar de forma segura. Se usan para pasar secretos a los contenedores.

Ejemplo:

```yaml
secrets:
  my_secret:
    file: ./secrets/password.txt
```

#### **`build`**

Define cómo construir una imagen de Docker para un servicio desde un `Dockerfile`.

Ejemplo:

```yaml
build:
  context: .
  dockerfile: Dockerfile
```

#### **`image`**

Define la imagen de Docker que se utilizará para un servicio. Puede ser una imagen existente o una imagen que se cree utilizando `build`.

Ejemplo:

```yaml
image: nginx:latest
```

#### **`container_name`**

Define un nombre personalizado para el contenedor. Si no se especifica, Docker Compose generará un nombre automáticamente.

Ejemplo:

```yaml
container_name: mycontainer
```

#### **`depends_on`**

Define dependencias entre servicios. Es útil para garantizar que un servicio no se inicie hasta que otro servicio esté disponible.

Ejemplo:

```yaml
depends_on:
  - mongo
```

#### **`environment`**

Define variables de entorno que se pasan al contenedor.

Ejemplo:

```yaml
environment:
  - MONGO_URI=mongodb://mongo:27017
```

#### **`env_file`**

Especifica ficheros que contienen variables de entorno que se deben cargar en el contenedor.

Ejemplo:

```yaml
env_file:
  - .env
```

#### **`command`**

Especifica el comando que se ejecutará cuando se inicie el contenedor.

Ejemplo:

```yaml
command: ["python", "app.py"]
```

#### **`entrypoint`**

Define el punto de entrada del contenedor. Se sobrepone al valor por defecto en la imagen.

Ejemplo:

```yaml
entrypoint: /bin/sh -c "echo Hello World"
```

#### **`ports`**

Define la asignación de puertos entre el contenedor y el host.

Ejemplo:

```yaml
ports:
  - "8080:80"
```

#### **`expose`**

Expone puertos internos del contenedor, pero no realiza una asignación con el host. Es más útil para la comunicación entre contenedores dentro de una red de Docker.

Ejemplo:

```yaml
expose:
  - "8080"
```

#### **`restart`**

Define la política de reinicio del contenedor. Puede ser `no`, `always`, `unless-stopped`, o `on-failure`.

Ejemplo:

```yaml
restart: always
```

#### **`logging`**

Define cómo Docker debe manejar los logs de un contenedor.

Ejemplo:

```yaml
logging:
  driver: "json-file"
  options:
    max-size: "10m"
```

#### **`healthcheck`**

Define una prueba de salud para el contenedor, que Docker usará para determinar si el contenedor está funcionando correctamente.

Ejemplo:

```yaml
healthcheck:
  test: ["CMD", "curl", "-f", "http://localhost/health"]
  interval: 30s
  retries: 3
```

#### **`volumes`** (para un servicio)

Monta un volumen o un directorio desde el host al contenedor.

Ejemplo:

```yaml
volumes:
  - ./data:/data
```

#### **`networks`** (para un servicio)

Define a qué redes debe estar conectado el contenedor.

Ejemplo:

```yaml
networks:
  - mynetwork
```

#### **`cpus`**

Limita el uso de CPU para el contenedor.

Ejemplo:

```yaml
cpus: "1.0"
```

#### **`mem_limit`**

Limita la cantidad de memoria que el contenedor puede usar.

Ejemplo:

```yaml
mem_limit: 500m
```

#### **`ulimits`**

Define límites del sistema para un contenedor (por ejemplo, el número de ficheros que puede abrir).

Ejemplo:

```yaml
ulimits:
  nofile:
    soft: 1024
    hard: 2048
```

#### **`user`**

Especifica el usuario con el que debe ejecutarse el contenedor.

Ejemplo:

```yaml
user: "1000:1000"
```

#### **`hostname`**

Define el nombre de host del contenedor.

Ejemplo:

```yaml
hostname: myhost
```

---

### **Ejemplo Completo Aplicando Todas las Directivas**

```yaml
version: "3.8"

services:
  app:
    build:
      context: .
      dockerfile: Dockerfile
    image: my-app:latest
    container_name: my-app-container
    environment:
      - DATABASE_URL=mongodb://mongo:27017
    env_file:
      - .env
    command: /bin/sh -c "python app.py"
    entrypoint: /bin/sh -c "echo Starting App"
    depends_on:
      - mongo
    ports:
      - "8080:80"
    expose:
      - "8080"
    volumes:
      - ./app-data:/data
    networks:
      - app-network
    restart: always
    logging:
      driver: "json-file"
      options:
        max-size: "10m"
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost/health"]
      interval: 30s
      retries: 3
    cpus: "1.0"
    mem_limit: 500m
    ulimits:
      nofile:
        soft: 1024
        hard: 2048
    user: "1000:1000"
    hostname: my-app-host

  mongo:
    image: mongo:latest
    container_name: mongo-db
    environment:
      - MONGO_INITDB_ROOT_USERNAME=admin
      - MONGO_INITDB_ROOT_PASSWORD=supersecret
    volumes:
      - mongo-data:/data/db
    networks:
      - app-network

networks:
  app-network:
    driver: bridge

volumes:
  mongo-data:
    driver: local

configs:
  my_config:
    file: ./config/config.json

secrets:
  my_secret:
    file: ./secrets/password.txt
```

Este fichero `docker-compose.yml` utiliza **todas** las directivas disponibles, cubriendo todos los aspectos posibles de configuración en Docker Compose, como la creación de redes, volúmenes, servicios, manejo de dependencias, logs, variables de entorno, y mucho más.

---

¡Tienes razón! Me faltaron algunas directivas. Aquí te agrego las que faltaron:

### **Directivas Faltantes:**

#### **`container_name`**

Especifica un nombre personalizado para el contenedor, en lugar de que Docker Compose genere un nombre automático.

Ejemplo:

```yaml
container_name: my-app-container
```

#### **`command`**

Este parámetro reemplaza el comando por defecto especificado en la imagen del contenedor. Permite indicar qué debe ejecutarse cuando el contenedor se inicie.

Ejemplo:

```yaml
command: /bin/sh -c "python app.py"
```

#### **`hostname`**

Define el nombre de host del contenedor, que se puede utilizar dentro de la red de Docker.

Ejemplo:

```yaml
hostname: my-app-host
```

#### **`labels`**

Permite añadir etiquetas a los contenedores para poder organizarlos o identificarlos fácilmente en Docker.

Ejemplo:

```yaml
labels:
  - "app=web"
  - "env=production"
```

#### **`platform`**

Define la plataforma en la que se debe ejecutar el contenedor. Es útil cuando se necesita especificar una arquitectura específica, como ARM o x86_64.

Ejemplo:

```yaml
platform: linux/amd64
```

#### **`tmpfs`**

Montaje temporal en el contenedor. Esto crea un sistema de ficheros temporal (en memoria) dentro del contenedor.

Ejemplo:

```yaml
tmpfs:
  - /run
  - /tmp
```

#### **`sysctls`**

Define parámetros del kernel que deben establecerse en el contenedor.

Ejemplo:

```yaml
sysctls:
  net.ipv4.ip_forward: "1"
  net.ipv6.conf.all.disable_ipv6: "0"
```

#### **`extra_hosts`**

Permite agregar entradas adicionales al fichero `/etc/hosts` del contenedor.

Ejemplo:

```yaml
extra_hosts:
  - "myhost:192.168.1.100"
```

#### **`dns`**

Define los servidores DNS a utilizar en el contenedor.

Ejemplo:

```yaml
dns:
  - 8.8.8.8
  - 8.8.4.4
```

#### **`dns_search`**

Define los dominios de búsqueda DNS para el contenedor.

Ejemplo:

```yaml
dns_search:
  - example.com
```

---

### **Ejemplo con las Directivas Faltantes**

```yaml
version: "3.8"

services:
  app:
    image: my-app:latest
    container_name: my-app-container
    build:
      context: .
      dockerfile: Dockerfile
    environment:
      - DATABASE_URL=mongodb://mongo:27017
    command: /bin/sh -c "python app.py"
    hostname: my-app-host
    labels:
      - "app=web"
      - "env=production"
    platform: linux/amd64
    tmpfs:
      - /run
      - /tmp
    sysctls:
      net.ipv4.ip_forward: "1"
      net.ipv6.conf.all.disable_ipv6: "0"
    extra_hosts:
      - "myhost:192.168.1.100"
    dns:
      - 8.8.8.8
      - 8.8.4.4
    dns_search:
      - example.com
    restart: always
    networks:
      - app-network

  mongo:
    image: mongo:latest
    container_name: mongo-db
    environment:
      - MONGO_INITDB_ROOT_USERNAME=admin
      - MONGO_INITDB_ROOT_PASSWORD=supersecret
    volumes:
      - mongo-data:/data/db
    networks:
      - app-network

networks:
  app-network:
    driver: bridge

volumes:
  mongo-data:
    driver: local
```

Ahora el fichero incluye **todas las directivas** de Docker Compose.

---

Aquí tienes las directivas que aún faltan por mencionar:

### **Directivas Faltantes**

#### **`build`**

Esta directiva se utiliza cuando se quiere construir una imagen Docker a partir de un Dockerfile, en lugar de usar una imagen existente.

Ejemplo:

```yaml
build:
  context: ./app
  dockerfile: Dockerfile.prod
```

#### **`cap_add`**

Permite añadir capacidades adicionales al contenedor.

Ejemplo:

```yaml
cap_add:
  - NET_ADMIN
```

#### **`cap_drop`**

Permite eliminar capacidades del contenedor.

Ejemplo:

```yaml
cap_drop:
  - NET_RAW
```

#### **`cgroup_parent`**

Define el grupo cgroup al que debe pertenecer el contenedor.

Ejemplo:

```yaml
cgroup_parent: /docker
```

#### **`command`**

Permite sobrescribir el comando predeterminado del contenedor.

Ejemplo:

```yaml
command: /bin/sh -c "npm start"
```

#### **`cpu_shares`**

Define la cantidad de recursos de CPU que el contenedor debería recibir en comparación con otros contenedores.

Ejemplo:

```yaml
cpu_shares: 512
```

#### **`cpu_quota`**

Establece la cantidad máxima de tiempo de CPU que un contenedor puede usar.

Ejemplo:

```yaml
cpu_quota: 50000
```

#### **`cpu_period`**

Se usa junto con `cpu_quota` para definir el período de tiempo en el que se debe medir el uso de la CPU.

Ejemplo:

```yaml
cpu_period: 100000
```

#### **`cpus`**

Define el número de CPUs que el contenedor puede utilizar.

Ejemplo:

```yaml
cpus: 1.5
```

#### **`deploy`**

Específica las configuraciones de despliegue para servicios cuando se usa Docker Swarm.

Ejemplo:

```yaml
deploy:
  replicas: 3
  resources:
    limits:
      cpus: "0.50"
      memory: 50M
```

#### **`depends_on`**

Esta directiva se usa para indicar que un servicio depende de otros servicios. Sin embargo, como ya mencioné antes, no garantiza que los servicios dependientes estén listos para la conexión.

Ejemplo:

```yaml
depends_on:
  - db
  - redis
```

#### **`devices`**

Permite asignar dispositivos del host al contenedor.

Ejemplo:

```yaml
devices:
  - "/dev/sda:/dev/xvda"
```

#### **`dns_search`**

Define dominios de búsqueda DNS a usar dentro del contenedor.

Ejemplo:

```yaml
dns_search:
  - example.com
```

#### **`entrypoint`**

Define el punto de entrada para el contenedor, es decir, el comando que se ejecutará cuando se inicie el contenedor.

Ejemplo:

```yaml
entrypoint: ["python", "app.py"]
```

#### **`environment`**

Permite definir variables de entorno para el contenedor.

Ejemplo:

```yaml
environment:
  - ENVIRONMENT=production
```

#### **`expose`**

Exponer puertos a otros contenedores sin mapearlos a puertos externos.

Ejemplo:

```yaml
expose:
  - "8080"
```

#### **`external_links`**

Permite enlazar un contenedor de Docker que está fuera de la red Docker Compose a uno dentro del fichero `docker-compose.yml`.

Ejemplo:

```yaml
external_links:
  - "some-other-container:alias"
```

#### **`extra_hosts`**

Permite agregar entradas personalizadas a `/etc/hosts` dentro del contenedor.

Ejemplo:

```yaml
extra_hosts:
  - "example.com:93.184.216.34"
```

#### **`extends`**

Permite que un servicio herede la configuración de otro servicio en un fichero externo o en el mismo fichero `docker-compose.yml`.

Ejemplo:

```yaml
extends:
  file: common.yml
  service: base-service
```

---

### **Resumen de Directivas Faltantes**

1. **build**
2. **cap_add**
3. **cap_drop**
4. **cgroup_parent**
5. **command**
6. **cpu_shares**
7. **cpu_quota**
8. **cpu_period**
9. **cpus**
10. **deploy**
11. **depends_on**
12. **devices**
13. **dns_search**
14. **entrypoint**
15. **environment**
16. **expose**
17. **external_links**
18. **extra_hosts**
19. **extends**

¡Ahora tienes una lista completa!
