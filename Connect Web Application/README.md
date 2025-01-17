<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# **Connect App**

## **Eliminación de contenedores y redes innecesarios**

**El siguiente comando elimina todos los contenedores y redes específicas asociadas al proyecto, lo que ayuda a mantener un entorno limpio antes de desplegar servicios con Docker Compose:**

```bash
docker rm -f $(docker ps -aq); # Elimina Todos Los Contenedores (En Ejecución O Detenidos)
docker network rm version4mongoservices_default; # Elimina La Red Creada Automáticamente Por Docker Compose
```

### **Definición de variables de entorno en YAML**

- **Docker Compose permite definir variables de entorno en dos formatos:**

1. **Lista de strings (`- KEY=value`):**

   ```yaml
   environment:
     - MONGO_DB_USERNAME=admin
     - MONGO_DB_PWD=supersecret
   ```

2. **Mapa clave-valor (`KEY: value`):**
   **Este formato es más legible y común en ficheros YAML:**

   ```yaml
   environment:
     MONGO_DB_USERNAME: admin
     MONGO_DB_PWD: supersecret
   ```

### **Construcción de imágenes personalizadas**

*Docker Compose puede construir imágenes usando un `Dockerfile`. Cuando especificas `build: .` en la definición del servicio, Compose buscará un `Dockerfile` en el directorio actual y construirá la imagen antes de iniciar el contenedor:*

```yaml
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
      - MONGO_DB_USERNAME: admin
      - MONGO_DB_PWD: supersecret
  mongo-demo:
    image: mongo:latest
    ports:
      - 27017:27017
    environment:
      - MONGO_INITDB_ROOT_USERNAME: admin
      - MONGO_INITDB_ROOT_PASSWORD: supersecret
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
      - ME_CONFIG_MONGODB_ADMINUSERNAME: admin
      - ME_CONFIG_MONGODB_ADMINPASSWORD: supersecret
      - ME_CONFIG_MONGODB_SERVER: mongo-demo
      - ME_CONFIG_MONGODB_URL: mongodb://admin:supersecret@mongo-demo:27017/
      - ME_CONFIG_MONGODB_ENABLE_ADMIN: true
      - ME_CONFIG_OPTIONS_EDITORTHEME: material-darker
      - ME_CONFIG_REQUEST_SIZE: 100kb
      - ME_CONFIG_SITE_BASEURL: /
      - ME_CONFIG_SITE_COOKIESECRET: cookiesecret
      - ME_CONFIG_SITE_SESSIONSECRET: sessionsecret
      - ME_CONFIG_SITE_SSL_ENABLED: false
      - ME_CONFIG_MONGODB_AUTH_USERNAME: admin
      - ME_CONFIG_MONGODB_AUTH_PASSWORD: pass
      - ME_CONFIG_MONGODB_PORT: 27017
```

## **Personalización del proyecto con `--project-name`**

*Cuando usas `docker compose up`, Docker Compose genera nombres automáticos para los contenedores, redes y otros recursos. Estos nombres están basados en el nombre del directorio y del servicio. Si deseas personalizar el nombre del proyecto (y evitar el uso del nombre del directorio), utiliza la opción `--project-name`:*

```bash
docker compose --project-name project -f mongo-services.yaml up -d
```

- **Ventajas de usar `--project-name`:**
  - *Define un nombre lógico para el proyecto.*
  - *Evita conflictos de nombres entre proyectos que usen redes o contenedores con nombres similares.*

```bash
docker compose --project-name project -f mongo-services.yaml up -d
[+] Running 0/0
[+] Running 0/1 Building                                                                                                         0.1s
[+] Building 19.6s (12/12) FINISHED                                                                                    docker:default
 => [app internal] load build definition from Dockerfile                                                                         0.0s
 => => transferring dockerfile: 487B                                                                                             0.0s
 => [app internal] load metadata for docker.io/library/node:20-alpine                                                            2.1s
 => [app auth] library/node:pull token for registry-1.docker.io                                                                  0.0s
 => [app internal] load .dockerignore                                                                                            0.0s
 => => transferring context: 2B                                                                                                  0.0s
 => [app 1/5] FROM docker.io/library/node:20-alpine@sha256:24fb6aa7020d9a20b00d6da6d1714187c45ed00d1eb4adb01395843c338b9372     10.1s
 => => resolve docker.io/library/node:20-alpine@sha256:24fb6aa7020d9a20b00d6da6d1714187c45ed00d1eb4adb01395843c338b9372          0.0s
 => => sha256:24fb6aa7020d9a20b00d6da6d1714187c45ed00d1eb4adb01395843c338b9372 7.67kB / 7.67kB                                   0.0s
 => => sha256:796789f15b456fb7a2245190e89f6648ae71145b3e45c84a7bf55aa50d86ff01 1.72kB / 1.72kB                                   0.0s
 => => sha256:70ad5a57af6a37edbab480a0abcd9159740bc457d4d483f1b8847f76cdc47984 6.18kB / 6.18kB                                   0.0s
 => => sha256:1f3e46996e2966e4faa5846e56e76e3748b7315e2ded61476c24403d592134f0 3.64MB / 3.64MB                                   1.1s
 => => sha256:0f89b69dfb561de3a78f6effe42a32669471a244c2b80e7b353d1d79d03af80d 42.54MB / 42.54MB                                 7.9s
 => => sha256:234af1c47e2d280d63976d190978c38e22f1192091391002a42ab261a9ea93b5 1.26MB / 1.26MB                                   1.5s
 => => extracting sha256:1f3e46996e2966e4faa5846e56e76e3748b7315e2ded61476c24403d592134f0                                        0.2s
 => => sha256:0e3700349c8d29d4510a8a476d589d93e02ad2aa08904c867d03d60a1c915695 447B / 447B                                       1.5s
 => => extracting sha256:0f89b69dfb561de3a78f6effe42a32669471a244c2b80e7b353d1d79d03af80d                                        1.8s
 => => extracting sha256:234af1c47e2d280d63976d190978c38e22f1192091391002a42ab261a9ea93b5                                        0.1s
 => => extracting sha256:0e3700349c8d29d4510a8a476d589d93e02ad2aa08904c867d03d60a1c915695                                        0.0s
 => [app internal] load build context                                                                                            0.0s
 => => transferring context: 79.52kB                                                                                             0.0s
 => [app 2/5] RUN mkdir -p /home/app                                                                                             0.6s
 => [app 3/5] COPY ./app /home/app                                                                                               0.0s
 => [app 4/5] WORKDIR /home/app                                                                                                  0.0s
 => [app 5/5] RUN npm install                                                                                                    5.6s
 => [app] exporting to image                                                                                                     1.0s
 => => exporting layers                                                                                                          1.0s
 => => writing image sha256:c2a0ae98c657049ee35d23e7ddef610ce99665327d1995ab25ce200c9a214342                                     0.0s
[+] Running 5/5o docker.io/library/project-app                                                                                   0.0s
 ✔ Service app                        Built                                                                                     19.7s
 ✔ Network project_default            Created                                                                                    0.1s
 ✔ Container project-app-1            Started                                                                                    0.6s
 ✔ Container project-mongo-demo-1     Started                                                                                    0.5s
 ✔ Container project-mongo-express-1  Started                                                                                    0.9s
```

### **Creación de una Base De Datos Y Colección**

- **Insertamos Datos**

```json
{
    "_id": ObjectId(),
     "myid": 1,
     "data": "Daniel Benjamin Perez Morales"
}
```

#### **Prueba de la API**

**Realiza una solicitud GET a la API para comprobar que los datos están disponibles:**

- **Respuesta**

```bash
curl -X GET http://localhost:3000/
```

*Esto debería devolver la página HTML dinámica, que incluye:*

- *Datos estáticos.*
- *Datos obtenidos de MongoDB y mostrados dinámicamente.*

```html
<html lang="en">
<style>
    .container {
        margin: 40px auto;
        width: 80%;
    }

    hr {
        width: 400px;
        margin-left: 0;
    }

    h3 {
        display: inline-block;
    }

    #static {
        color: red;
    }

    #dynamic {
        color: green;
    }
</style>
<script>
    (async function init() {
        const cont = document.getElementById('container');
        const response = await fetch('http://localhost:3000/fetch-data', {
            method: "GET",
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        });
        const jsonResponse = await response.json();
        document.getElementById('dynamic').textContent = jsonResponse.data;
    })();
</script>

<body>
    <div class='container'
        id='container'>
        <h1>Welcome to this Super Sophisticated App</h1>
        <span>Some static data: </span>
        <h3 id="static">this is hard-coded in index.html</h3>
        <hr />
        <span>Data from MongoDB: </span>
        <h3 id="dynamic"></h3>
        <hr />
    </div>
</body>

</html>
```
