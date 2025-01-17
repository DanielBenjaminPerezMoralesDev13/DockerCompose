<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# *El problema principal mencionado en esta publicación está relacionado con la conexión entre los contenedores **MongoDB** y **Mongo-Express** al usar Docker Compose. Este problema puede deberse a cambios en la configuración del entorno, versiones de imágenes incompatibles o la necesidad de coordinar el inicio de los servicios.*

---

## **Problema Principal**

```bash
2024-01-21 13:15:53 /docker-entrypoint.sh: line 15: mongo: Try again
2024-01-21 13:15:53 /docker-entrypoint.sh: line 15: /dev/tcp/mongo/27017: Invalid argument
2024-01-21 13:15:59 /docker-entrypoint.sh: line 15: mongo: Try again
2024-01-21 13:15:59 /docker-entrypoint.sh: line 15: /dev/tcp/mongo/27017: Invalid argument
2024-01-21 13:16:05 /docker-entrypoint.sh: line 15: mongo: Try again
2024-01-21 13:16:05 /docker-entrypoint.sh: line 15: /dev/tcp/mongo/27017: Invalid argument
2024-01-21 13:15:48 Waiting for mongo:27017...
2024-01-21 13:15:54 Sun Jan 21 07:45:54 UTC 2024 retrying to connect to mongo:27017 (2/10)
2024-01-21 13:16:00 Sun Jan 21 07:46:00 UTC 2024 retrying to connect to mongo:27017 (3/10)
2024-01-21 13:16:06 Sun Jan 21 07:46:06 UTC 2024 retrying to connect to mongo:27017 (4/10)
2024-01-21 13:16:11 /docker-entrypoint.sh: line 15: mongo: Try again
2024-01-21 13:16:11 /docker-entrypoint.sh: line 15: /dev/tcp/mongo/27017: Invalid argument
2024-01-21 13:16:12 Sun Jan 21 07:46:12 UTC 2024 retrying to connect to mongo:27017 (5/10)
2024-01-21 13:16:17 /docker-entrypoint.sh: line 15: mongo: Try again
2024-01-21 13:16:17 /docker-entrypoint.sh: line 15: /dev/tcp/mongo/27017: Invalid argument
2024-01-21 13:16:18 Sun Jan 21 07:46:18 UTC 2024 retrying to connect to mongo:27017 (6/10)
2024-01-21 13:16:23 /docker-entrypoint.sh: line 15: mongo: Try again
2024-01-21 13:16:23 /docker-entrypoint.sh: line 15: /dev/tcp/mongo/27017: Invalid argument
2024-01-21 13:16:24 Sun Jan 21 07:46:24 UTC 2024 retrying to connect to mongo:27017 (7/10)
2024-01-21 13:16:29 /docker-entrypoint.sh: line 15: mongo: Try again
2024-01-21 13:16:29 /docker-entrypoint.sh: line 15: /dev/tcp/mongo/27017: Invalid argument
2024-01-21 13:16:30 Sun Jan 21 07:46:30 UTC 2024 retrying to connect to mongo:27017 (8/10)
2024-01-21 13:16:35 /docker-entrypoint.sh: line 15: mongo: Try again
2024-01-21 13:16:35 /docker-entrypoint.sh: line 15: /dev/tcp/mongo/27017: Invalid argument
2024-01-21 13:16:36 Sun Jan 21 07:46:36 UTC 2024 retrying to connect to mongo:27017 (9/10)
2024-01-21 13:16:41 /docker-entrypoint.sh: line 15: mongo: Try again
2024-01-21 13:16:41 /docker-entrypoint.sh: line 15: /dev/tcp/mongo/27017: Invalid argument
2024-01-21 13:16:42 Sun Jan 21 07:46:42 UTC 2024 retrying to connect to mongo:27017 (10/10)
2024-01-21 13:16:47 /docker-entrypoint.sh: line 15: mongo: Try again
2024-01-21 13:16:47 /docker-entrypoint.sh: line 15: /dev/tcp/mongo/27017: Invalid argument
2024-01-21 13:16:48 No custom config.js found, loading config.default.js
2024-01-21 13:16:48 Welcome to mongo-express 1.0.2
2024-01-21 13:16:48 ------------------------
2024-01-21 13:16:48 
2024-01-21 13:16:48 
2024-01-21 13:16:49 Server is open to allow connections from anyone (0.0.0.0)
2024-01-21 13:16:49 basicAuth credentials are "admin:pass", it is recommended you change this in your config.js!
2024-01-21 13:16:49 Mongo Express server listening at http://0.0.0.0:8081
```

1. **Mensajes de error:**
   - *`/dev/tcp/mongo/27017: Invalid argument`*
   - *`mongo: Try again`*

   - *Esto ocurre porque el contenedor de **mongo-express** no puede conectarse al servicio de MongoDB debido a:*
   - *Configuración incorrecta de la variable `ME_CONFIG_MONGODB_SERVER`.*
   - *MongoDB aún no está completamente operativo al momento en que **mongo-express** intenta conectarse.*

2. **Retraso en la carga:**
   - *La interfaz de **mongo-express** eventualmente se carga, pero los errores iniciales sugieren que hay problemas con la configuración.*

---

### **Soluciones**

#### **Actualizar la clave de configuración**

- *En versiones recientes de **mongo-express** version `0.54.0`, la variable `ME_CONFIG_MONGODB_SERVER` fue reemplazada por `ME_CONFIG_MONGODB_URL`. Por lo tanto:*

- *Cambia `ME_CONFIG_MONGODB_SERVER=mongodb` por `ME_CONFIG_MONGODB_URL=mongodb://admin:password@mongodb:27017/`.*

- **Ejemplo en el fichero `docker-compose.yaml`:**

```yaml
mongo-express:
  image: mongo-express
  environment:
    ME_CONFIG_MONGODB_URL: mongodb://admin:password@mongodb:27017/
```

---

#### **Especificar nombres de contenedor**

- **Asegúrate de que los servicios estén correctamente identificados en la red interna de Docker:**

- *Añade `container_name` en el servicio de MongoDB:*

  ```yaml
  mongodb:
    container_name: mongo
  ```

- *Actualiza `ME_CONFIG_MONGODB_SERVER` a `mongo` (el nombre del contenedor).*

**Ejemplo:**

```yaml
mongodb:
  container_name: mongo
  image: mongo
  environment:
    MONGO_INITDB_ROOT_USERNAME: admin
    MONGO_INITDB_ROOT_PASSWORD: password
mongo-express:
  image: mongo-express
  environment:
    ME_CONFIG_MONGODB_SERVER: mongo
    ME_CONFIG_MONGODB_ADMINUSERNAME: admin
    ME_CONFIG_MONGODB_ADMINPASSWORD: password
```

---

#### **Añadir `depends_on` para gestionar dependencias**

- *El problema podría ser que **mongo-express** se inicia antes de que MongoDB esté listo. Usa la clave `depends_on` para asegurarte de que **mongo-express** espere a que MongoDB comience.*

**Ejemplo:**

```yaml
mongo-express:
  depends_on:
    - mongodb
```

**Nota:** *Aunque `depends_on` ayuda con el orden de inicio, no garantiza que el servicio MongoDB esté completamente operativo. Si el problema persiste, podrías agregar un script de espera personalizado en el contenedor de **mongo-express**.*

---

#### **Usar una versión específica de la imagen**

- *Si estás enfrentando problemas con versiones más recientes, considera usar una versión estable de la imagen `mongo-express`, como `mongo-express:0.54.0`.*

**Ejemplo:**

```yaml
mongo-express:
  image: mongo-express:0.54.0
```

---

### **Resumen de configuración recomendada**

- *Este fichero `docker-compose.yaml` debería funcionar correctamente:*

```yaml
version: "3"
services:
  mongodb:
    container_name: mongo
    image: mongo
    ports:
      - "27017:27017"
    environment:
      MONGO_INITDB_ROOT_USERNAME: admin
      MONGO_INITDB_ROOT_PASSWORD: password

  mongo-express:
    image: mongo-express:0.54.0
    depends_on:
      - mongodb
    ports:
      - "8081:8081"
    environment:
      ME_CONFIG_MONGODB_URL: mongodb://admin:password@mongo:27017/
      ME_CONFIG_BASICAUTH_USERNAME: admin
      ME_CONFIG_BASICAUTH_PASSWORD: pass
```

---

### **Notas finales**

- **MongoDB URL vs Server:** *Usa `ME_CONFIG_MONGODB_URL` si necesitas incluir credenciales en la conexión. Usa `ME_CONFIG_MONGODB_SERVER` para configuraciones básicas donde las credenciales se especifican por separado.*
- **Tiempo de espera:** *Si los errores persisten, verifica los registros de MongoDB para asegurarte de que esté funcionando correctamente (`docker logs mongo`).*

*Esta configuración debería resolver tanto los errores de conexión como los retrasos iniciales.*
