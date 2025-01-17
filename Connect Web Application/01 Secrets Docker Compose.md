<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# **Docker Compose Secrets: Ejemplos y Casos de Uso**

- **[How to use secrets in Docker Compose](https://docs.docker.com/compose/how-tos/use-secrets/ "https://docs.docker.com/compose/how-tos/use-secrets/")**
- **[How Do You Manage Secret Values With Docker-Compose V3.1?](https://stackoverflow.com/questions/42139605/how-do-you-manage-secret-values-with-docker-compose-v3-1 "https://stackoverflow.com/questions/42139605/how-do-you-manage-secret-values-with-docker-compose-v3-1")**

## **¿Qué son los secrets en Docker Compose?**

- *Los **secrets** son una funcionalidad en Docker Compose diseñada para manejar información sensible, como contraseñas, claves API, certificados o cualquier dato que no debería estar expuesto en el fichero `docker-compose.yaml` o dentro de los contenedores de manera insegura.*

- *Los **secrets** son más seguros que las variables de entorno porque se gestionan de forma aislada en el contenedor y solo son accesibles para los servicios que los necesitan.*

---

### **Ventajas de usar secrets**

1. **Seguridad:** *Los secrets no se almacenan en texto plano dentro de los contenedores.*
2. **Restricción de acceso:** *Solo los servicios configurados tienen acceso a los secrets.*
3. **No aparecen en los logs:** *A diferencia de las variables de entorno, los secrets no se exponen en logs o procesos del sistema.*

---

#### **Cómo usar secrets en Docker Compose**

### **Mejor explicación sobre variables de entorno que terminan con _FILE**

- *En Docker, cuando usamos variables de entorno que terminan en `_FILE`, estas son utilizadas para hacer referencia a ficheros de secretos dentro del contenedor en lugar de almacenar directamente valores sensibles como contraseñas o claves en las variables de entorno.*

#### **¿Por qué usar las variables que terminan en `_FILE`?**

- *Algunas imágenes de Docker, como las de bases de datos (por ejemplo, `mongo`), soportan esta convención para evitar exponer credenciales de manera directa dentro de las variables de entorno. La imagen puede leer el contenido del fichero en la ruta especificada (`/run/secrets/filename`) y usarlo como si fuera el valor de la variable de entorno.*

- *Por ejemplo, en el caso de MongoDB, la variable de entorno `MONGO_INITDB_ROOT_PASSWORD_FILE` indicará a la imagen que lea el fichero `/run/secrets/MONGO_INITDB_ROOT_PASSWORD` para obtener la contraseña del usuario raíz, en lugar de almacenar la contraseña directamente en la variable.*

#### **Ventajas**

- **Seguridad:** *Al mantener los secretos fuera de las variables de entorno, se reduce la posibilidad de exposición accidental.*
- **Facilidad de manejo:** *Usar ficheros de secretos permite una mejor gestión de credenciales y otros valores sensibles en entornos de producción.*

### **Ejemplo técnico con Docker Compose**

*Al usar la directiva `secrets` en un fichero `docker-compose.yaml`, se puede definir el origen de los secretos y su correspondiente referencia en las variables de entorno. Cuando se utiliza la convención de `_FILE`, las aplicaciones como MongoDB pueden leer automáticamente los valores de los ficheros secretos.*

*Aquí tienes una explicación más detallada y una corrección del ejemplo original que incluye este uso adecuado de las variables de entorno y los secretos:*

---

### **Paso 1: Crear ficheros para los secrets**

**Primero, crea los ficheros que contendrán los secretos:**

```bash
mkdir -p ./secrets
echo "admin" > ./secrets/MONGO_DB_USERNAME.txt
echo "supersecret" > ./secrets/MONGO_DB_PWD.txt
echo "admin" > ./secrets/MONGO_INITDB_ROOT_USERNAME.txt
echo "supersecret" > ./secrets/MONGO_INITDB_ROOT_PASSWORD.txt
echo "admin" > ./secrets/ME_CONFIG_MONGODB_ADMINUSERNAME.txt
echo "supersecret" > ./secrets/ME_CONFIG_MONGODB_ADMINPASSWORD.txt
echo "mongo-demo" > ./secrets/ME_CONFIG_MONGODB_SERVER.txt
echo "mongodb://admin:supersecret@mongo-demo:27017/" > ./secrets/ME_CONFIG_MONGODB_URL.txt
echo "admin" > ./secrets/ME_CONFIG_MONGODB_AUTH_USERNAME.txt
echo "pass" > ./secrets/ME_CONFIG_MONGODB_AUTH_PASSWORD.txt
```

---

### **Paso 2: Definir los secrets en `docker-compose.yaml`**

*En el fichero `docker-compose.yaml`, define los secretos y su origen (en este caso, desde los ficheros creados previamente):*

```yaml
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielBenjaminPerezMoralesDev13
# Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

secrets:
  MONGO_DB_USERNAME:
    file: ./secrets/MONGO_DB_USERNAME.txt
  MONGO_DB_PWD:
    file: ./secrets/MONGO_DB_PWD.txt
  MONGO_INITDB_ROOT_USERNAME:
    file: ./secrets/MONGO_INITDB_ROOT_USERNAME.txt
  MONGO_INITDB_ROOT_PASSWORD:
    file: ./secrets/MONGO_INITDB_ROOT_PASSWORD.txt
  ME_CONFIG_MONGODB_ADMINUSERNAME:
    file: ./secrets/ME_CONFIG_MONGODB_ADMINUSERNAME.txt
  ME_CONFIG_MONGODB_ADMINPASSWORD:
    file: ./secrets/ME_CONFIG_MONGODB_ADMINPASSWORD.txt
  ME_CONFIG_MONGODB_SERVER:
    file: ./secrets/ME_CONFIG_MONGODB_SERVER.txt
  ME_CONFIG_MONGODB_URL:
    file: ./secrets/ME_CONFIG_MONGODB_URL.txt
  ME_CONFIG_MONGODB_AUTH_USERNAME:
    file: ./secrets/ME_CONFIG_MONGODB_AUTH_USERNAME.txt
  ME_CONFIG_MONGODB_AUTH_PASSWORD:
    file: ./secrets/ME_CONFIG_MONGODB_AUTH_PASSWORD.txt

services:
  app:
    build: .
    ports:
      - 3000:3000
    secrets:
      - MONGO_DB_USERNAME
      - MONGO_DB_PWD
    environment:
      MONGO_DB_USERNAME_FILE: /run/secrets/MONGO_DB_USERNAME
      MONGO_DB_PWD_FILE: /run/secrets/MONGO_DB_PWD

  mongo-demo:
    image: mongo:latest
    ports:
      - 27017:27017
    secrets:
      - MONGO_INITDB_ROOT_USERNAME
      - MONGO_INITDB_ROOT_PASSWORD
    environment:
      MONGO_INITDB_ROOT_USERNAME_FILE: /run/secrets/MONGO_INITDB_ROOT_USERNAME
      MONGO_INITDB_ROOT_PASSWORD_FILE: /run/secrets/MONGO_INITDB_ROOT_PASSWORD

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
    secrets:
      - ME_CONFIG_MONGODB_ADMINUSERNAME
      - ME_CONFIG_MONGODB_ADMINPASSWORD
      - ME_CONFIG_MONGODB_SERVER
      - ME_CONFIG_MONGODB_URL
      - ME_CONFIG_MONGODB_AUTH_USERNAME
      - ME_CONFIG_MONGODB_AUTH_PASSWORD
    environment:
      ME_CONFIG_MONGODB_ADMINUSERNAME_FILE: /run/secrets/ME_CONFIG_MONGODB_ADMINUSERNAME
      ME_CONFIG_MONGODB_ADMINPASSWORD_FILE: /run/secrets/ME_CONFIG_MONGODB_ADMINPASSWORD
      ME_CONFIG_MONGODB_SERVER_FILE: /run/secrets/ME_CONFIG_MONGODB_SERVER
      ME_CONFIG_MONGODB_URL_FILE: /run/secrets/ME_CONFIG_MONGODB_URL
      ME_CONFIG_MONGODB_AUTH_USERNAME_FILE: /run/secrets/ME_CONFIG_MONGODB_AUTH_USERNAME
      ME_CONFIG_MONGODB_AUTH_PASSWORD_FILE: /run/secrets/ME_CONFIG_MONGODB_AUTH_PASSWORD
      ME_CONFIG_MONGODB_ENABLE_ADMIN: "true"
      ME_CONFIG_OPTIONS_EDITORTHEME: material-darker
      ME_CONFIG_REQUEST_SIZE: 100kb
      ME_CONFIG_SITE_BASEURL: /
      ME_CONFIG_SITE_COOKIESECRET: cookiesecret
      ME_CONFIG_SITE_SESSIONSECRET: sessionsecret
      ME_CONFIG_SITE_SSL_ENABLED: false
      ME_CONFIG_MONGODB_PORT: "27017"
```

---

### **Paso 3: Explicación técnica sobre el uso de `_FILE`**

1. **Variables de entorno `_FILE`:** *Al utilizar variables como `MONGO_INITDB_ROOT_PASSWORD_FILE`, Docker lee el fichero de secreto en la ubicación `/run/secrets/<name_secret>` en lugar de pasar el valor directamente en la variable de entorno. Esto es útil para mantener los secretos (como contraseñas y claves) fuera de las variables de entorno, lo que mejora la seguridad.*

2. **Cómo funciona:** *En el servicio de `mongo-demo`, las variables de entorno como `MONGO_INITDB_ROOT_USERNAME_FILE` y `MONGO_INITDB_ROOT_PASSWORD_FILE` están apuntando a ficheros dentro de `/run/secrets/`, donde Docker almacena los secretos de manera segura. Las imágenes que soportan esta convención (como la de `mongo` y `mongo-express`) serán capaces de leer el contenido de estos ficheros y utilizarlos para configurar el contenedor de manera automática.*

---

### **Resumen:**

*Usar variables de entorno que terminan en `_FILE` es una práctica recomendada cuando se manejan secretos en Docker, especialmente para bases de datos y otros servicios que soportan este patrón. Esta práctica ayuda a mantener los secretos más seguros al no exponerlos directamente en las variables de entorno, sino que se leen de ficheros secretos montados en el contenedor.*

---

#### **Casos de uso de secrets**

1. **Contraseñas de bases de datos:**
   - *Evita almacenar contraseñas como texto plano en las variables de entorno.*
   - *El fichero de secrets asegura que las contraseñas estén protegidas y no expuestas en el contenedor.*

2. **Claves API:**
   - *Protege las claves de acceso a servicios externos (por ejemplo, AWS, Google Cloud).*

3. **Certificados y claves privadas:**
   - *Útil para configurar conexiones TLS/SSL de manera segura.*

4. **Cifrado de datos sensibles:**
   - *Almacena claves de cifrado o datos confidenciales de aplicaciones.*

---

#### **Ejemplo de despliegue**

1. **Subir los servicios con Docker Compose:**

   ```bash
   docker compose up -d
   ```

2. **Verificar los secrets en el contenedor:**
   *Conéctate al contenedor y verifica la presencia de los secrets montados:*

   ```bash
   docker exec -it <container_id> sh
   cat /run/secrets/mongo_root_password
   ```

---

#### **Mejores prácticas al usar secrets**

1. **Mantén los ficheros de secrets fuera del control de versiones:**
   - *Agrega los ficheros de secrets a `.gitignore` para evitar comprometerlos.*

2. **Usa permisos adecuados:**
   - *Asegúrate de que los ficheros de secrets tengan permisos restringidos:*

     ```bash
     chmod 600 mongo_root_password.txt mongo_admin_password.txt
     ```

3. **Combina secrets con gestores de secretos externos:**
   - *Usa servicios como AWS Secrets Manager o HashiCorp Vault para gestionar y sincronizar secretos automáticamente.*

---

#### **Resumen**

*El uso de secrets en Docker Compose permite manejar información sensible de forma segura y profesional. Es especialmente útil en entornos de producción donde la seguridad es crítica, como bases de datos, aplicaciones web y servicios con requisitos estrictos de cumplimiento normativo.*
