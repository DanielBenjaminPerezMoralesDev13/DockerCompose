<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# **Variable In Docker Compose**

## **El problema de las credenciales en el fichero `docker-compose.yaml`**

*Cuando colocas credenciales directamente dentro del fichero `docker-compose.yaml`, estás expuesto a un riesgo de seguridad. Si el fichero se comparte o se sube a un repositorio público, las credenciales podrían ser comprometidas fácilmente. **Por lo tanto, es fundamental evitar hardcodear valores sensibles en los ficheros de configuración.***

### **Solución: Usar variables de entorno**

*Docker Compose permite hacer uso de variables de entorno para gestionar credenciales y configuraciones sensibles de manera segura. En lugar de definir valores directamente en el fichero `docker-compose.yaml`, puedes utilizar la sintaxis especial `${VARIABLE_NAME}` que hace referencia a las variables de entorno del sistema.*

**Sintaxis recomendada:**

```yaml
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielBenjaminPerezMoralesDev13
# Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielBenjaminPerezMoralesDev13
# Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

services:
  app:
    build: .
    ports:
      - 3000:3000
    environment:
      MONGO_DB_USERNAME: ${MONGO_DB_USERNAME}
      MONGO_DB_PWD: ${MONGO_DB_PWD}
  mongo-demo:
    image: mongo:latest
    ports:
      - 27017:27017
    environment:
      MONGO_INITDB_ROOT_USERNAME: ${MONGO_INITDB_ROOT_USERNAME}
      MONGO_INITDB_ROOT_PASSWORD: ${MONGO_INITDB_ROOT_PASSWORD}
  mongo-express:
    depends_on:
      - mongo-demo
    image: mongo-express
    ports:
      - 8081:8081
    entrypoint:
      - /bin/sh
      - -c
      - |
        until nc -zv mongo-demo 27017; do
          echo "Waiting For Mongo";
          sleep 1;
        done;
        exec /sbin/tini -- /docker-entrypoint.sh
    environment:
      ME_CONFIG_MONGODB_ADMINUSERNAME: ${ME_CONFIG_MONGODB_ADMINUSERNAME}
      ME_CONFIG_MONGODB_ADMINPASSWORD: ${ME_CONFIG_MONGODB_ADMINPASSWORD}
      ME_CONFIG_MONGODB_SERVER: mongo-demo
      ME_CONFIG_MONGODB_URL: ${ME_CONFIG_MONGODB_URL}
      ME_CONFIG_MONGODB_ENABLE_ADMIN: "true"
      ME_CONFIG_OPTIONS_EDITORTHEME: material-darker
      ME_CONFIG_REQUEST_SIZE: 100kb
      ME_CONFIG_SITE_BASEURL: /
      ME_CONFIG_SITE_COOKIESECRET: cookiesecret
      ME_CONFIG_SITE_SESSIONSECRET: sessionsecret
      ME_CONFIG_SITE_SSL_ENABLED: false
      ME_CONFIG_MONGODB_AUTH_USERNAME: ${ME_CONFIG_MONGODB_AUTH_USERNAME}
      ME_CONFIG_MONGODB_AUTH_PASSWORD: ${ME_CONFIG_MONGODB_AUTH_PASSWORD}
      ME_CONFIG_MONGODB_PORT: "27017"
```

- **Detenemos Los Servicios**

### **Salida esperada al no configurar las variables:**

**Si olvidas establecer alguna variable de entorno, Docker Compose mostrará advertencias similares a las siguientes:**

```bash
docker compose -f mongo-services.yaml -p projects stop -t 10
WARN[0000] The "MONGO_INITDB_ROOT_USERNAME" variable is not set. Defaulting to a blank string.
WARN[0000] The "MONGO_INITDB_ROOT_PASSWORD" variable is not set. Defaulting to a blank string.
WARN[0000] The "ME_CONFIG_MONGODB_ADMINUSERNAME" variable is not set. Defaulting to a blank string.
WARN[0000] The "ME_CONFIG_MONGODB_ADMINPASSWORD" variable is not set. Defaulting to a blank string.
WARN[0000] The "ME_CONFIG_MONGODB_URL" variable is not set. Defaulting to a blank string.
WARN[0000] The "MONGO_DB_USERNAME" variable is not set. Defaulting to a blank string.
WARN[0000] The "MONGO_DB_PWD" variable is not set. Defaulting to a blank string.
WARN[0000] The "ME_CONFIG_MONGODB_AUTH_USERNAME" variable is not set. Defaulting to a blank string.
WARN[0000] The "ME_CONFIG_MONGODB_AUTH_PASSWORD" variable is not set. Defaulting to a blank string.
```

*Esto te avisa de que las variables no están configuradas y se utilizarán valores vacíos (lo cual no es seguro).*

### **Configuración de las variables de entorno**

1. **Configura las variables de entorno en tu terminal:**

```bash
export MONGO_DB_USERNAME=admin;
export MONGO_DB_PWD=supersecret;
export MONGO_INITDB_ROOT_USERNAME=admin;
export MONGO_INITDB_ROOT_PASSWORD=supersecret;
export ME_CONFIG_MONGODB_ADMINUSERNAME=admin;
export ME_CONFIG_MONGODB_ADMINPASSWORD=supersecret;
export ME_CONFIG_MONGODB_SERVER=mongo-demo;
export ME_CONFIG_MONGODB_URL=mongodb://admin:supersecret@mongo-demo:27017/;
export ME_CONFIG_MONGODB_AUTH_USERNAME=admin;
export ME_CONFIG_MONGODB_AUTH_PASSWORD=pass;
```

**Al ejecutar Docker Compose, las variables se referenciarán automáticamente:**

```bash
docker compose --project-name project -f mongo-services.yaml up -d
```

```bash
docker compose --project-name project -f mongo-services.yaml start
[+] Running 3/3
 ✔ Container project-mongo-demo-1     Started                                                                                    0.5s
 ✔ Container project-app-1            Started                                                                                    0.5s
 ✔ Container project-mongo-express-1  Started                                                                                    0.4s
```

### **Resumen**

1. **Evita almacenar credenciales directamente en el fichero `docker-compose.yaml`.**
2. **Usa variables de entorno** *para mantener las credenciales de manera segura.*
3. **Configura las variables de entorno** *en tu terminal antes de ejecutar Docker Compose.*
4. **Verifica las advertencias** *de Docker Compose si alguna variable de entorno no está configurada.*
