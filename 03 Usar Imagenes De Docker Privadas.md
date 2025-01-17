<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# **Usar Imagenes Privadas**

```bash
docker build --tag d4nitrix13/my-app-private:latest --file Dockerfile --no-cache --network default --pull --squash --label manteiner="Daniel Perez Morales Dev 13" --memory 512m --memory-swap 1g --platform linux/amd64 --compress .
```

```bash
docker build --tag d4nitrix13/my-app-private:latest --file Dockerfile --no-cache --network default --pull --squash --label manteiner="Daniel Perez Morales Dev 13" --memory 512m --memory-swap 1g --platform linux/amd64 --compress .
WARNING: experimental flag squash is removed with BuildKit. You should squash inside build using a multi-stage Dockerfile for efficiency.
[+] Building 17.7s (10/10) FINISHED                                                                                                     docker:default
 => [internal] load build definition from Dockerfile                                                                                              0.0s
 => => transferring dockerfile: 495B                                                                                                              0.0s
 => [internal] load metadata for docker.io/library/node:20-alpine                                                                                 0.9s
 => [internal] load .dockerignore                                                                                                                 0.0s
 => => transferring context: 2B                                                                                                                   0.0s
 => [1/5] FROM docker.io/library/node:20-alpine@sha256:24fb6aa7020d9a20b00d6da6d1714187c45ed00d1eb4adb01395843c338b9372                           7.4s
 => => resolve docker.io/library/node:20-alpine@sha256:24fb6aa7020d9a20b00d6da6d1714187c45ed00d1eb4adb01395843c338b9372                           0.0s
 => => sha256:796789f15b456fb7a2245190e89f6648ae71145b3e45c84a7bf55aa50d86ff01 1.72kB / 1.72kB                                                    0.0s
 => => sha256:70ad5a57af6a37edbab480a0abcd9159740bc457d4d483f1b8847f76cdc47984 6.18kB / 6.18kB                                                    0.0s
 => => sha256:0f89b69dfb561de3a78f6effe42a32669471a244c2b80e7b353d1d79d03af80d 42.54MB / 42.54MB                                                  4.5s
 => => sha256:234af1c47e2d280d63976d190978c38e22f1192091391002a42ab261a9ea93b5 1.26MB / 1.26MB                                                    0.4s
 => => sha256:0e3700349c8d29d4510a8a476d589d93e02ad2aa08904c867d03d60a1c915695 447B / 447B                                                        0.4s
 => => sha256:24fb6aa7020d9a20b00d6da6d1714187c45ed00d1eb4adb01395843c338b9372 7.67kB / 7.67kB                                                    0.0s
 => => extracting sha256:0f89b69dfb561de3a78f6effe42a32669471a244c2b80e7b353d1d79d03af80d                                                         2.5s
 => => extracting sha256:234af1c47e2d280d63976d190978c38e22f1192091391002a42ab261a9ea93b5                                                         0.1s
 => => extracting sha256:0e3700349c8d29d4510a8a476d589d93e02ad2aa08904c867d03d60a1c915695                                                         0.0s
 => [internal] load build context                                                                                                                 0.0s
 => => transferring context: 79.52kB                                                                                                              0.0s
 => [2/5] RUN mkdir -p /home/app                                                                                                                  0.7s
 => [3/5] COPY ./app /home/app                                                                                                                    0.1s
 => [4/5] WORKDIR /home/app                                                                                                                       0.1s
 => [5/5] RUN npm install                                                                                                                         7.5s
 => exporting to image                                                                                                                            0.9s
 => => exporting layers                                                                                                                           0.8s
 => => writing image sha256:10ae0eb2d21cb09a5c8455ca2f685b5d8ec85dbba5b915132077430b263271a7                                                      0.0s
 => => naming to docker.io/d4nitrix13/my-app-private:latest                                                                                       0.0s
```

## **Explicación de cada flag en el comando**

1. **`docker build`:** *Inicia la construcción de una imagen Docker a partir de un `Dockerfile`.*

2. **`--tag d4nitrix13/my-app-private:latest`:**
   - *Asigna el nombre `d4nitrix13/my-app-private` a la imagen con la etiqueta `latest`. Esta etiqueta es un marcador de versión y es útil para referirse a la imagen construida.*

3. **`--file Dockerfile`:**
   - *Especifica el fichero `Dockerfile` que se debe usar para construir la imagen. Si no se especifica, Docker busca por defecto un fichero llamado `Dockerfile`.*

4. **`--no-cache`:**
   - *Evita usar las capas de caché almacenadas de construcciones anteriores. Esto garantiza que todas las etapas del Dockerfile se vuelvan a construir desde cero. Esto puede hacer que la construcción sea más lenta, pero asegura que siempre se utilicen los cambios más recientes.*

5. **`--network default`:**
   - *Configura la red utilizada durante la construcción del contenedor. El valor `default` hace que el contenedor utilice la red por defecto de Docker, lo que permite la conectividad de red sin configuraciones adicionales.*

6. **`--pull`:**
   - *Fuerza a Docker a descargar las últimas versiones de las imágenes base especificadas en el Dockerfile (siempre que sea necesario) antes de realizar la construcción. Esto asegura que las imágenes no estén desactualizadas.*

7. **`--squash`:**
   - *Este flag intenta "aplastar" las capas de la imagen para reducir el tamaño final combinando todas las capas generadas durante la construcción en una sola. Sin embargo, este flag ha sido **eliminado con BuildKit**, lo que genera el siguiente mensaje de advertencia:*

     **Advertencia:**

     ```bash
     WARNING: experimental flag squash is removed with BuildKit. You should squash inside build using a multi-stage Dockerfile for efficiency.
     ```

     - *Esto significa que la opción `--squash` ya no es válida en Docker cuando se usa **BuildKit** (el motor de construcción moderno de Docker). En lugar de usar este flag, deberías usar **Dockerfiles de múltiples etapas** para manejar la construcción eficiente de imágenes (es decir, separar la compilación en varias fases y solo copiar lo necesario a la imagen final).*

8. **`--label maintainer="Daniel Perez Morales Dev 13"`:**
   - *Añade metadatos a la imagen en forma de etiquetas clave-valor. En este caso, se asigna la etiqueta `maintainer="Daniel Perez Morales Dev 13"` para identificar al responsable de la imagen.*

9. **`--memory 512m`:**
   - *Establece un límite de memoria para el contenedor en 512 MB. Esto ayuda a controlar el uso de recursos durante la construcción.*

10. **`--memory-swap 1g`:**
    - *Establece el límite combinado de memoria y swap en 1 GB. El swap es una extensión de la memoria física en disco, que se usa cuando la memoria RAM está llena.*

11. **`--platform linux/amd64`:**
    - *Especifica la plataforma para la que se construye la imagen. En este caso, se construye para una arquitectura `amd64` (una arquitectura de 64 bits común en la mayoría de las máquinas).*

12. **`--compress`:**
    - *Comprime el contexto de la construcción (el conjunto de ficheros que se envían al daemon de Docker), lo cual puede ser útil cuando se maneja una gran cantidad de ficheros, ya que reduce el uso de ancho de banda.*

13. **`.` (punto final):**
    - *Indica el directorio actual como el contexto de construcción, es decir, donde se encuentran los ficheros necesarios (como el `Dockerfile` y otros ficheros requeridos).*

- **Resumen:**
- *Este comando crea una imagen Docker utilizando un fichero `Dockerfile` específico, sin usar la caché de Docker, configurando límites de recursos (memoria), y utilizando la red predeterminada. También está etiquetando la imagen con información sobre el mantenedor y buscando las últimas versiones de las imágenes base. Además, la opción `--squash` genera una advertencia debido a que está descontinuada con el motor BuildKit de Docker, sugiriendo que debes usar **Dockerfiles multi-etapas** para realizar la optimización de la imagen.*

si tenemos las credenciales configuradas

docker login

```bash
docker login
Authenticating with existing credentials...
WARNING! Your password will be stored unencrypted in /home/d4nitrix13/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credential-stores

Login Succeeded
```

```bash
docker push d4nitrix13/my-app-private:latest
```

```bash
docker push d4nitrix13/my-app-private:latest
The push refers to repository [docker.io/d4nitrix13/my-app-private]
1eac25a42979: Pushed
5f70bf18a086: Mounted from d4nitrix13/contacts-app-xampp
f043776f767d: Pushed
ec852aad8155: Pushed
a63b27d40558: Mounted from library/node
2cc32dc37aa3: Mounted from library/node
cf526f148e10: Mounted from library/node
a0904247e36a: Mounted from library/node
latest: digest: sha256:1ade139fc90af76df2711ec672bb951ae275f86a061cc8b61dde48a6f92bce6b size: 1991
```

cp docker-compose.yaml mongo-services-private.yaml
editamos el ficheor mongo-servcies-private

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
    healthcheck:
      test: ["CMD", "wget", "-SqO-", "localhost:3000"]
      interval: 1m30s
      timeout: 30s
      retries: 5
      start_period: 30s
    container_name: container-app
    image: d4nitrix13/my-app-private:latest
    ports:
      - 3000:3000
    secrets:
      - MONGO_DB_USERNAME
      - MONGO_DB_PWD
    environment:
      MONGO_DB_USERNAME: ${MONGO_DB_USERNAME}
      MONGO_DB_PWD: ${MONGO_DB_PWD}
  mongo-demo:
    container_name: container-mongo-demo
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
    container_name: container-mongo-express
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
      ME_CONFIG_MONGODB_ADMINUSERNAME: ${ME_CONFIG_MONGODB_ADMINUSERNAME}
      ME_CONFIG_MONGODB_ADMINPASSWORD: ${ME_CONFIG_MONGODB_ADMINPASSWORD}
      ME_CONFIG_MONGODB_SERVER: ${ME_CONFIG_MONGODB_SERVER}
      ME_CONFIG_MONGODB_URL: ${ME_CONFIG_MONGODB_URL}
      ME_CONFIG_MONGODB_AUTH_USERNAME: ${ME_CONFIG_MONGODB_AUTH_USERNAME}
      ME_CONFIG_MONGODB_AUTH_PASSWORD: ${ME_CONFIG_MONGODB_AUTH_PASSWORD}
      ME_CONFIG_MONGODB_ENABLE_ADMIN: "true"
      ME_CONFIG_OPTIONS_EDITORTHEME: material-darker
      ME_CONFIG_REQUEST_SIZE: 100kb
      ME_CONFIG_SITE_BASEURL: /
      ME_CONFIG_SITE_COOKIESECRET: cookiesecret
      ME_CONFIG_SITE_SESSIONSECRET: sessionsecret
      ME_CONFIG_SITE_SSL_ENABLED: false
      ME_CONFIG_MONGODB_PORT: "27017"
```
