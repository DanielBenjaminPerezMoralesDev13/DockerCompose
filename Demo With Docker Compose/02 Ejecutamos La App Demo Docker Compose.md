<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# **Docker Compose App**

- **La opción `--file` en `docker compose` es equivalente a `-f`. Ambas permiten especificar el fichero de configuración de Docker Compose que se desea usar.**

**Ejemplo:**

```bash
docker compose --file mongo-services.yaml up;
```

- **o Simplemente:**

```bash
docker compose -f mongo-services.yaml up;
```

```bash
docker compose -fmongo-services.yaml up;
```

*![Docker Compose Mongo Express Depends MongoDB](/Images/Docker%20Compose%20Container%20Mongo%20Express%20Depends%20MongoDB.png "/Images/Docker%20Compose%20Container%20Mongo%20Express%20Depends%20MongoDB.png")*

## ***Red `bridge` dedicada***

> [!NOTE]
> *Docker Compose crea una red de tipo `bridge` de manera predeterminada para los contenedores definidos. Esta red permite que los contenedores puedan comunicarse entre sí, pero cada contenedor tendrá una dirección IP aislada dentro de esta red.*

- **Ejecutamos**

```bash
docker compose -fmongo-services.yaml up;
```

*[Logs Mongo Services Version 1 Docker Compose](/Demo%20With%20Docker%20Compose/Version%201%20Mongo%20Services/README.md "/Demo%20With%20Docker%20Compose/Version%201%20Mongo%20Services/README.md")*

### **Problemas con los logs mezclados**

- **Si no se especifica un `container_name`, los logs de los contenedores se mezclarán, lo que puede dificultar el seguimiento y la depuración. Para evitarlo, se recomienda definir un `container_name` para cada contenedor, lo que facilita la identificación en los logs.**

### **Advertencia sobre la versión obsoleta**

**Advertencia en los logs:**

```bash
WARN[0000] /home/d4nitrix13/Escritorio/Repository/Docker Compose/Demo With Docker Compose/mongo-services.yaml: the attribute `version` is obsolete, it will be ignored, please remove it to avoid potential confusion
```

- *Para resolverla, se debe eliminar el atributo `version` del fichero `mongo-services.yaml`, ya que está **deprecated**.*

```yaml
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielBenjaminPerezMoralesDev13
# Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

services:
  mongo-demo:
    image: mongo:latest
    ports:
      - 27017:27017
    environment:
      - MONGO_INITDB_ROOT_USERNAME=admin
      - MONGO_INITDB_ROOT_PASSWORD=supersecret
  mongo-express:
    image: mongo-express
    ports:
      - 8081:8081
    environment:
      - ME_CONFIG_MONGODB_ADMINUSERNAME=admin
      - ME_CONFIG_MONGODB_ADMINPASSWORD=supersecret
      - ME_CONFIG_MONGODB_SERVER=mongo-demo
      - ME_CONFIG_MONGODB_URL=mongodb://admin:supersecret@mongo-demo:27017/
      - ME_CONFIG_MONGODB_ENABLE_ADMIN=true
      - ME_CONFIG_OPTIONS_EDITORTHEME=material-darker
      - ME_CONFIG_REQUEST_SIZE=100kb
      - ME_CONFIG_SITE_BASEURL=/
      - ME_CONFIG_SITE_COOKIESECRET=cookiesecret
      - ME_CONFIG_SITE_SESSIONSECRET=sessionsecret
      - ME_CONFIG_SITE_SSL_ENABLED=false
      - ME_CONFIG_MONGODB_AUTH_USERNAME=admin
      - ME_CONFIG_MONGODB_AUTH_PASSWORD=pass
      - ME_CONFIG_MONGODB_PORT=27017
```

- *[Logs Mongo Services Version 2 Docker Compose](/Demo%20With%20Docker%20Compose/Version%202%20Mongo%20Services/README.md "/Demo%20With%20Docker%20Compose/Version%202%20Mongo%20Services/README.md")*

### **Error de conexión entre contenedores**

- **En los logs de `mongo-express`, vemos un error de conexión con el contenedor `mongo-demo`:**

```bash
mongo-express-1  | Waiting for mongo-demo:27017...
mongo-express-1  | /docker-entrypoint.sh: connect: Connection refused
mongo-express-1  | /docker-entrypoint.sh: line 15: /dev/tcp/mongo-demo/27017: Connection refused
```

- **Este error suele ocurrir cuando el contenedor de MongoDB (`mongo-demo`) no está disponible o no está completamente iniciado antes de que `mongo-express` intente conectarse.**

### **Solución para el error de conexión**

**Es posible que el contenedor `mongo-demo` aún esté iniciando cuando `mongo-express` intenta conectarse. Una forma de resolverlo es asegurarse de que `mongo-express` espere hasta que `mongo-demo` esté completamente listo. Esto puede lograrse mediante la configuración de dependencias en el fichero `docker-compose.yml` usando `depends_on` o configurando un retraso en el inicio de `mongo-express`.**

```yaml
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielBenjaminPerezMoralesDev13
# Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

services:
  mongo-demo:
    image: mongo:latest
    ports:
      - 27017:27017
    environment:
      - MONGO_INITDB_ROOT_USERNAME=admin
      - MONGO_INITDB_ROOT_PASSWORD=supersecret
  mongo-express:
    depends_on:
      - mongo-demo
    image: mongo-express
    ports:
      - 8081:8081
    environment:
      - ME_CONFIG_MONGODB_ADMINUSERNAME=admin
      - ME_CONFIG_MONGODB_ADMINPASSWORD=supersecret
      - ME_CONFIG_MONGODB_SERVER=mongo-demo
      - ME_CONFIG_MONGODB_URL=mongodb://admin:supersecret@mongo-demo:27017/
      - ME_CONFIG_MONGODB_ENABLE_ADMIN=true
      - ME_CONFIG_OPTIONS_EDITORTHEME=material-darker
      - ME_CONFIG_REQUEST_SIZE=100kb
      - ME_CONFIG_SITE_BASEURL=/
      - ME_CONFIG_SITE_COOKIESECRET=cookiesecret
      - ME_CONFIG_SITE_SESSIONSECRET=sessionsecret
      - ME_CONFIG_SITE_SSL_ENABLED=false
      - ME_CONFIG_MONGODB_AUTH_USERNAME=admin
      - ME_CONFIG_MONGODB_AUTH_PASSWORD=pass
      - ME_CONFIG_MONGODB_PORT=27017
```

*[Logs Mongo Services Version 3 Docker Compose](/Demo%20With%20Docker%20Compose/Version%203%20Mongo%20Services/README.md "/Demo%20With%20Docker%20Compose/Version%203%20Mongo%20Services/README.md")*

## **Comando para listar redes Docker personalizadas**

- **Para listar las redes de Docker creadas por `docker-compose` o personalizadas, utiliza el siguiente comando:**

```bash
docker network ls -f type=custom -f scope=local -f driver=bridge
```

```bash
docker network ls -ftype=custom -fscope=local -fdriver=bridge
```

```bash
docker network ls --filter type=custom --filter scope=local --filter driver=bridge
```

### **Salida esperada**

```bash
NETWORK ID     NAME                            DRIVER    SCOPE
8140ecfbde0e   demowithdockercompose_default   bridge    local
```

- **Este comando filtra las redes de tipo **custom**, con **scope local** y utilizando el **driver bridge**. El nombre de la red es generado por `docker-compose` y normalmente tiene el formato `<nombre_del_directorio>_default`.**

---

## **Comando para listar contenedores filtrados por diversos criterios**

- **Si deseas listar los contenedores que están corriendo en la red definida por `docker-compose`, y que están expuestos a ciertos puertos, puedes usar un comando como el siguiente:**

```bash
docker container ps --filter status=running --filter publish=27017 --filter expose=27017 --filter ancestor=mongo --filter publish=8081 --filter expose=8081 --filter ancestor=mongo-express --filter network=$(docker network ls --filter type=custom --filter scope=local --filter driver=bridge --quiet)
```

```bash
docker container ls --filter status=running --filter publish=27017 --filter expose=27017 --filter ancestor=mongo --filter publish=8081 --filter expose=8081 --filter ancestor=mongo-express --filter network=$(docker network ls --filter type=custom --filter scope=local --filter driver=bridge --quiet)
```

```bash
docker container list --filter status=running --filter publish=27017 --filter expose=27017 --filter ancestor=mongo --filter publish=8081 --filter expose=8081 --filter ancestor=mongo-express --filter network=$(docker network ls --filter type=custom --filter scope=local --filter driver=bridge --quiet)
```

```bash
docker ps -f status=running -f publish=27017 -f expose=27017 -f ancestor=mongo -f publish=8081 -f expose=8081 -f ancestor=mongo-express -f network=$(docker network ls -f type=custom -f scope=local -f driver=bridge -q)
```

```bash
docker ps -fstatus=running -fpublish=27017 -fexpose=27017 -fancestor=mongo -fpublish=8081 -fexpose=8081 -fancestor=mongo-express -fnetwork=$(docker network ls -qftype=custom -fscope=local -fdriver=bridge)
```

```bash
docker ps --filter status=running \
    --filter publish=27017 \
    --filter expose=27017 \
    --filter ancestor=mongo \
    --filter publish=8081 \
    --filter expose=8081 \
    --filter ancestor=mongo-express \
    --filter network=$(docker network ls --filter type=custom --filter scope=local --filter driver=bridge --quiet)
```

### ***Descripción de filtros utilizados:***

- **`status=running`:** *Filtra los contenedores que están actualmente en ejecución.*
- **`publish=27017`:** *Filtra los contenedores que tienen el puerto 27017 expuesto al host.*
- **`expose=27017`:** *Filtra los contenedores que exponen el puerto 27017 dentro de la red de Docker.*
- **`ancestor=mongo`:** *Filtra los contenedores que utilizan la imagen `mongo` como base.*
- **`publish=8081`:** *Filtra los contenedores que tienen el puerto 8081 expuesto al host.*
- **`expose=8081`:** *Filtra los contenedores que exponen el puerto 8081 dentro de la red de Docker.*
- **`ancestor=mongo-express`:** *Filtra los contenedores que utilizan la imagen `mongo-express` como base.*
- **`network=<name_network>`:** *Filtra los contenedores que están conectados a la red Docker especificada por su ID o nombre.*

### **Salida esperada:**

```bash
CONTAINER ID   IMAGE           COMMAND                  CREATED          STATUS          PORTS                                           NAMES
d73dbd65efc9   mongo:latest    "docker-entrypoint.s…"   22 minutes ago   Up 16 minutes   0.0.0.0:27017->27017/tcp, :::27017->27017/tcp   demowithdockercompose-mongo-demo-1
a0ea5cd9c7c1   mongo-express   "/sbin/tini -- /dock…"   22 minutes ago   Up 16 minutes   0.0.0.0:8081->8081/tcp, :::8081->8081/tcp       demowithdockercompose-mongo-express-1
```

---

### ***Explicación de la salida:***

- **`CONTAINER ID`:** *El identificador único del contenedor.*
- **`IMAGE`:** *La imagen de Docker que está siendo utilizada por el contenedor.*
- **`COMMAND`:** *El comando que está siendo ejecutado dentro del contenedor.*
- **`CREATED`:** *El tiempo desde que el contenedor fue creado.*
- **`STATUS`:** *El estado actual del contenedor.*
- **`PORTS`:** *Los puertos que están siendo mapeados entre el contenedor y el host.*
- **`NAMES`:** *El nombre del contenedor, generado por `docker-compose` según el formato `<name_network>-<name_service>-<número>`.*

> [!IMPORTANT]
> *Cuando usamos **Docker Compose** para ejecutar servicios, al presionar `Ctrl + C` en la terminal, estamos enviando una señal **SIGINT** (interrupción) al proceso principal del contenedor. Esto detiene los servicios de manera ordenada.*

- **Gracefully stopping... (press Ctrl+C again to force)**

**uando usas Ctrl+C en la terminal mientras Docker Compose está en ejecución, lo que realmente sucede es que se envía una señal SIGINT (interrupción de teclado) a los contenedores. Esto detiene los contenedores, pero no los elimina. El entorno Docker sigue existiendo, y los contenedores permanecen en el sistema, aunque ya no estén en ejecución.**

- **Detiene los contenedores:** *La ejecución de los contenedores se detiene, pero siguen existiendo en el sistema.*
- **No elimina redes, contenedores ni volúmenes:** *Después de usar Ctrl+C, los contenedores estarán detenidos, pero las redes y volúmenes persistirán en tu entorno Docker.*

```bash
Gracefully stopping... (press Ctrl+C again to force)
[+] Stopping 2/2
 ✔ Container version1mongoservices-mongo-express-1  Stopped                                                                      0.2s
 ✔ Container version1mongoservices-mongo-demo-1     Stopped                                                                      0.3s
```

- **Docker Compose Down**

- **El comando docker compose down no solo detiene los contenedores, sino que también elimina los contenedores, redes, volúmenes y demás recursos asociados a los servicios definidos en tu fichero docker-compose.yml.**

- **Detiene y elimina los contenedores:** *Los contenedores en ejecución son detenidos y eliminados.*
- **Elimina las redes creadas por Docker Compose:** *También elimina las redes que Docker Compose crea para interconectar los servicios entre sí.*
- **Elimina los volúmenes, si se especifica:** *Si usas la opción --volumes o -v, también elimina los volúmenes asociados con los servicios.*

*Esto garantiza que tu entorno de Docker se limpie por completo, y no quedarán contenedores ni redes de la configuración anterior.*

```bash
docker compose --file mongo-services.yaml down
```

```bash
docker compose -f mongo-services.yaml down
```

```bash
docker compose -fmongo-services.yaml down
```

```bash
docker compose -fmongo-services.yaml down
[+] Running 3/3
 ✔ Container version1mongoservices-mongo-express-1  Removed                                                                     10.4s
 ✔ Container version1mongoservices-mongo-demo-1     Removed                                                                      0.3s
 ✔ Network version1mongoservices_default            Removed                                                                      0.2s
```

**Resumen:**

- **docker compose down:** *Detiene y elimina contenedores, redes y volúmenes asociados con los servicios.*
- **Ctrl+C (SIGINT):** *Detiene los contenedores pero no los elimina, manteniendo la configuración y los recursos (contenedores, redes, volúmenes) en tu sistema.*

### *¿Qué es **SIGINT**?*

- **SIGINT** *(Signal Interrupt) es una señal enviada al proceso principal de una aplicación cuando el usuario solicita la interrupción de su ejecución. En este caso, `Ctrl + C` actúa como un atajo para enviar esta señal desde la terminal.*
- *Es una forma amigable de pedir al proceso que se detenga, lo que permite que los servicios realicen tareas de limpieza antes de terminar, como cerrar conexiones o liberar recursos.*

### *¿Qué hace Docker Compose al recibir **SIGINT**?*

1. **Propaga la señal:** *Docker Compose envía la señal **SIGINT** al proceso principal de cada contenedor administrado.*
2. **Finalización ordenada:**
   - *Los contenedores ejecutan sus **scripts de parada** definidos (si existen) o finalizan los procesos activos de manera limpia.*
   - *Docker espera un tiempo de gracia (por defecto 10 segundos) antes de forzar la detención con una señal más fuerte (**SIGKILL**) si el proceso no responde.*
3. **Registra la salida:** *La terminal muestra información sobre los contenedores detenidos.*

### ***Diferencias con otras señales***

- **SIGTERM:** *Similar a **SIGINT**, se usa al ejecutar `docker-compose down` o detener contenedores individualmente con `docker stop`. También permite una finalización ordenada.*
- **SIGKILL:** *Esta señal no permite la limpieza. Mata el proceso inmediatamente. Se usa como último recurso.*

### ***Resumen***

- **`Ctrl + C` envía SIGINT:** *Detiene los contenedores de forma controlada.*
- **Proceso principal de cada contenedor:** *Debe gestionar la señal para liberar recursos correctamente.*
- *Es el método recomendado cuando estás trabajando en desarrollo o necesitas detener servicios temporalmente.*

- *Si necesitas apagar todo el stack de manera más completa (incluyendo eliminación de redes y volúmenes), usa el comando `docker-compose down`.*

### **Problema: MongoDB no está listo cuando mongo-express intenta conectarse `depends_on`**

*[Foro Depends On](https://stackoverflow.com/questions/71060072/docker-compose-depends-on-with-condition-invalid-type-should-be-an-array "https://stackoverflow.com/questions/71060072/docker-compose-depends-on-with-condition-invalid-type-should-be-an-array")*

- *Mongo-express podría estar intentando conectarse a MongoDB antes de que el servicio `mongo-demo` esté completamente disponible. Aunque hayas configurado la dependencia en el fichero YAML con `depends_on`, esto solo garantiza que Docker intente iniciar el contenedor `mongo-demo` antes de `mongo-express`, pero **no espera a que MongoDB esté realmente listo para aceptar conexiones**.*

- **Docker Compose asegura que el contenedor de `mongo-demo` inicie primero, pero no verifica si MongoDB está en funcionamiento o si está completamente listo para aceptar conexiones. Esto puede llevar a que `mongo-express` falle al intentar conectarse, ya que MongoDB aún no está escuchando en el puerto.**

### ***Solución: Mecanismo de espera en `mongo-express`***

*[Logs Mongo Services Version 3](/Demo%20With%20Docker%20Compose/Version%203%20Mongo%20Services/Logs%20Mongo%20Services%20Version%203%20Docker%20Compose.md "/Demo%20With%20Docker%20Compose/Version%203%20Mongo%20Services/Logs%20Mongo%20Services%20Version%203%20Docker%20Compose.md")*

- *Para asegurarte de que MongoDB esté completamente disponible antes de que `mongo-express` intente conectarse, puedes agregar un **mecanismo de espera**. Esto se puede lograr de varias maneras:*

1. **Usar `nc` para esperar a que MongoDB esté listo**:

   - **Puedes añadir un bucle `until` en el `entrypoint` de `mongo-express` para verificar continuamente si el puerto de MongoDB (`27017`) está abierto y accesible.**

   **Ejemplo de configuración en exec form:**

   ```yaml
   entrypoint:
     - /bin/sh
     - -c
     - |
       until nc -zv mongo-demo 27017; do
         echo "Waiting For Mongo";
         sleep 1;
       done;
       exec /sbin/tini -- /docker-entrypoint.sh
   ```

   - *En este caso, el contenedor `mongo-express` esperará hasta que el puerto `27017` en el servicio `mongo-demo` esté accesible, lo que indica que MongoDB está listo. Una vez que se establezca la conexión, se ejecutará el comando principal del contenedor (`/docker-entrypoint.sh`).*

2. **Alternativas:** *También puedes usar herramientas como **wait-for-it** o **dockerize**, que están diseñadas específicamente para este tipo de casos. Estas herramientas permiten que un contenedor espere a que otro servicio esté disponible antes de continuar con su ejecución.*

> [!TIP]
> *El símbolo **`|`** en un fichero YAML (y en general en muchos lenguajes y configuraciones) se utiliza para indicar que el valor de una clave será un **bloque de texto multilínea**. Cuando se usa en YAML, permite escribir texto que se extiende a varias líneas y se conserva la indentación en el resultado final.*

### **¿Cómo funciona?**

- **Cuando se usa `|` en YAML, el contenido que sigue en las líneas posteriores se considera parte de un bloque de texto y las nuevas líneas se preservan tal como están, incluyendo saltos de línea. La principal diferencia entre `|` y otros símbolos es que `|` **mantiene los saltos de línea**, mientras que el símbolo `>` (usado en lugar de `|`) **combina las líneas en una sola línea**.**

### **Ejemplo con `|`:**

```yaml
entrypoint:
  - /bin/sh
  - -c
  - |
    until nc -zv mongo-demo 27017; do
      echo "Waiting For Mongo";
      sleep 1;
    done;
    exec /sbin/tini -- /docker-entrypoint.sh
```

- **Aquí, el contenido después de `|` se interpreta como un bloque de texto, y las líneas de código en el `entrypoint` se mantienen con saltos de línea y formato original.**

- **¿Qué ocurre con las nuevas líneas?**

- **En el ejemplo anterior, el texto tiene saltos de línea donde corresponde:**

- *Las líneas dentro del bloque `|` se conservan con saltos de línea, por lo que el comando `until nc -zv mongo-demo 27017` y el comando `exec /sbin/tini -- /docker-entrypoint.sh` aparecerán en líneas separadas en el contenedor.*
  
**Resumen:**

- **`|`** *conserva los saltos de línea y mantiene la indentación tal cual.*
- *Se usa para declarar bloques de texto donde se necesita preservar la estructura de las líneas (por ejemplo, en comandos complejos o scripts).*

- *Si usaras `>` en lugar de `|`, las líneas se concatenarían y el resultado final sería una sola línea.*
