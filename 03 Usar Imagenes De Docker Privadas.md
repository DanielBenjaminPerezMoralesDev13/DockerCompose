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

### **1. Login en Docker (docker login)**

**El comando `docker login` te permite autenticarte con Docker Hub (o cualquier otro registro de imágenes Docker). Al ejecutar este comando, se te solicita que ingreses tus credenciales de usuario de Docker (usuario y contraseña). Esto te permite realizar operaciones como subir (push) imágenes a un repositorio privado.**

```bash
docker login
Authenticating with existing credentials...
WARNING! Your password will be stored unencrypted in /home/d4nitrix13/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credential-stores

Login Succeeded
```

- **`docker login`:** *Te autentica en Docker Hub.*
- **`WARNING! Your password will be stored unencrypted...`:** *Esta advertencia te informa que la contraseña está almacenada sin cifrar en un fichero local (`config.json`). Docker recomienda usar un "credential helper" para proteger las credenciales.*
- **`Login Succeeded`:** *Esto indica que la autenticación fue exitosa.*

### **2. Subir una imagen a Docker Hub (docker push)**

**El siguiente comando **`docker push`** sube una imagen local (en tu máquina) al repositorio de Docker Hub.**

```bash
docker push d4nitrix13/my-app-private:latest
```

- **`docker push d4nitrix13/my-app-private:latest`:** *Esto sube la imagen con el nombre `d4nitrix13/my-app-private` y la etiqueta `latest` a Docker Hub.*
- *El mensaje que sigue muestra el progreso de la carga de la imagen, detallando las capas de la imagen que se están subiendo y aquellas que ya están montadas desde otras imágenes.*

**El resultado incluye el "digest" y el tamaño total de la imagen subida:**

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

```bash
latest: digest: sha256:1ade139fc90af76df2711ec672bb951ae275f86a061cc8b61dde48a6f92bce6f size: 1991
```

### **3. Crear y modificar ficheros de configuración**

#### **a. Copiar el fichero `docker-compose.yaml`**

```bash
cp docker-compose.yaml mongo-services-private.yaml
```

- **Este comando copia el fichero `docker-compose.yaml` a un nuevo fichero llamado `mongo-services-private.yaml`, para hacer modificaciones específicas sin alterar el fichero original.**

#### **b. Crear ficheros de variables de entorno**

```bash
touch app.env mongo-express.env
```

- **Este comando crea dos ficheros de variables de entorno: `app.env` y `mongo-express.env`, donde puedes configurar las variables necesarias para la aplicación y **mongo-express**.**

#### **c. Modificar el fichero `app.env`**

**El fichero `app.env` contiene las credenciales para MongoDB:**

```env
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielBenjaminPerezMoralesDev13
# Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

MONGO_DB_USERNAME=admin
MONGO_DB_PWD=supersecret
```

#### **d. Modificar el fichero `mongo-express.env`**

**Este fichero configura las variables necesarias para conectar **mongo-express** con MongoDB:**

```env
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielBenjaminPerezMoralesDev13
# Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

ME_CONFIG_MONGODB_ADMINUSERNAME=admin
ME_CONFIG_MONGODB_ADMINPASSWORD=supersecret
ME_CONFIG_MONGODB_SERVER=mongo-demo
ME_CONFIG_MONGODB_URL=mongodb://admin:supersecret@mongo-demo:27017/
ME_CONFIG_MONGODB_AUTH_USERNAME=admin
ME_CONFIG_MONGODB_AUTH_PASSWORD=pass
```

### **Modificar el fichero de configuración de Docker Compose**

**El fichero `mongo-services-private.yaml` configura tres servicios en Docker Compose:**

- **`app`:** *La aplicación personalizada (`d4nitrix13/my-app-private:latest`) que depende de MongoDB.*
- **`mongo-demo`:** *El servicio de MongoDB (`mongo:latest`), configurado con credenciales de acceso a través de secretos de Docker.*
- **`mongo-express`:** *Un contenedor con **mongo-express** para gestionar MongoDB a través de una interfaz web.*

### **Detalles de los servicios:**

- **`app`**:
  - *Usa la imagen privada `d4nitrix13/my-app-private:latest`.*
  - *Mapea el puerto 3000 en el contenedor al puerto 3000 de la máquina host.*
  - *Carga las variables de entorno desde `app.env`.*

- **`mongo-demo`**:
  - *Usa la imagen oficial `mongo:latest`.*
  - *Configura las credenciales para el acceso a la base de datos usando secretos (ficheros que contienen las contraseñas, en lugar de escribirlas directamente en el fichero `docker-compose.yaml`).*
  - *Mapea el puerto 27017 del contenedor a `27017` en la máquina host.*

- **`mongo-express`**:
  - *Utiliza la imagen de `mongo-express` para ofrecer una interfaz web para administrar MongoDB.*
  - *Establece variables de entorno para configuraciones internas, como el nombre de usuario y la contraseña para MongoDB.*
  - *Usa un script en el `entrypoint` para esperar a que MongoDB esté disponible antes de iniciar el contenedor.*

### 5. **Ejecutar Docker Compose**

**El siguiente comando levanta los contenedores definidos en `mongo-services-private.yaml`:**

```bash
docker compose --project-name project-private --file mongo-services-private.yaml up --detach --timestamps --remove-orphans --build
```

**Desglosado:**

- **`--project-name project-private`:** *Establece el nombre del proyecto (que es un nombre que Docker usa para agrupar los contenedores). En este caso, se llama `project-private`.*
- **`--file mongo-services-private.yaml`:** *Le dice a Docker Compose que use el fichero `mongo-services-private.yaml` para definir los servicios.*
- **`up`:** *Levanta los servicios definidos en el fichero Docker Compose.*
- **`--detach`:** *Ejecuta los contenedores en segundo plano (modo "detached").*
- **`--timestamps`:** *Muestra las marcas de tiempo en los logs.*
- **`--remove-orphans`:** *Elimina contenedores huérfanos (contenedores de proyectos antiguos que ya no están definidos en el fichero).*
- **`--build`:** *Fuerza a Docker Compose a reconstruir las imágenes si es necesario.*

### **Resumen**

*Este flujo configura, construye y levanta una serie de contenedores que incluyen una aplicación personalizada, un servicio de MongoDB y una interfaz de administración **mongo-express**. Los contenedores están configurados para usar credenciales almacenadas de manera segura y gestionan la conexión entre los servicios mediante variables de entorno y secretos. Además, se usan puertos mapeados para acceder a la aplicación y a la base de datos desde el host.*
