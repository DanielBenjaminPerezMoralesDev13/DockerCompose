<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# **En `docker-compose`, el uso de un fichero de variables de entorno (`env-file`) es una manera sencilla de cargar variables de entorno para los contenedores definidos en tu fichero `docker-compose.yml`.**

*[Foro](https://www.pgadmin.org/docs/pgadmin4/latest/container_deployment.html "https://www.pgadmin.org/docs/pgadmin4/latest/container_deployment.html")*
*[Foro Stack Overflow](https://stackoverflow.com/questions/25540711/docker-postgres-pgadmin-local-connection "https://stackoverflow.com/questions/25540711/docker-postgres-pgadmin-local-connection")*

*El fichero `env-file` contiene pares de clave-valor, y puedes usarlo para definir variables de entorno que se utilizarán dentro de tus contenedores. Aquí te explico cómo usarlo:*

## **Pasos para usar `env-file` en `docker-compose`**

1. **Crear un fichero `.env` (o cualquier fichero de variables de entorno):**

   **Primero, crea un fichero llamado `.env` (o con otro nombre, si prefieres) donde definirás tus variables de entorno. Un ejemplo de un fichero `.env` podría ser:**

   ```bash
   # Autor: Daniel Benjamin Perez Morales
   # GitHub: https://github.com/DanielBenjaminPerezMoralesDev13
   # Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13
   # Correo electrónico: danielperezdev@proton.me

   # Variables para PostgreSQL
   POSTGRES_USER=myuser
   POSTGRES_PASSWORD=mypassword
   POSTGRES_DB=postgres

   # Variables para pgAdmin4
   PGADMIN_DEFAULT_EMAIL=admin@admin.com
   PGADMIN_DEFAULT_PASSWORD=admin123

   # Variables de configuración de la conexión a PostgreSQL desde pgAdmin
   PGADMIN_DEFAULT_EMAIL=pgadmin4@pgadmin.org
   PGADMIN_DEFAULT_PASSWORD=admin
   PGADMIN_LISTEN_PORT=5454
   ```

   **Las variables definidas aquí estarán disponibles para ser utilizadas por los contenedores dentro de `docker-compose.yml`.**

2. **Configurar `docker-compose.yml` para usar el `env-file`:**

   **Luego, en tu fichero `docker-compose.yml`, puedes hacer referencia a este fichero `.env` usando la opción `env_file` para cargar las variables de entorno en los contenedores.**

   **Aquí tienes un ejemplo de cómo hacerlo:**

   ```yaml
   # Autor: Daniel Benjamin Perez Morales
   # GitHub: https://github.com/DanielBenjaminPerezMoralesDev13
   # Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13
   # Correo electrónico: danielperezdev@proton.me
 
   version: '3.8'
 
   services:
     app:
       container_name: container-app
       image: dpage/pgadmin4
       env_file:
         - .env  # Carga Las Variables De Entorno Desde El Archivo .env
       ports:
         - "8080:80/tcp"  # Expone El Puerto 8080 En La Máquina Host, Mapeado Al Puerto 80 Del Contenedor
       environment:
         - PGADMIN_LISTEN_PORT=80  # Puerto En El Que Pgadmin Escuchará
         - PGADMIN_CONFIG_SERVER_MODE=False  # Desactiva El Modo Servidor Para Usar Pgadmin Localmente
 
     db:
       container_name: container-db
       image: postgres:latest
       env_file:
         - .env   # Carga Las Mismas Variables Para El Contenedor De La Base De Datos
       environment:
         - DB_NAME=mydb
   ```

   **Explicación:**
   - **`env_file`:** *Especifica los ficheros de variables de entorno que quieres usar. En este caso, se está utilizando el fichero `.env`, pero también puedes usar un fichero con otro nombre.*
   - **`environment` (opcional):** *Se usa para establecer variables de entorno adicionales directamente en el `docker-compose.yml` que no estén definidas en el fichero `env-file`. En este caso, `DB_NAME` se establece específicamente para el contenedor `db`.*

3. **Iniciar los contenedores:**

   **Una vez que tienes el fichero `docker-compose.yml` configurado con el `env_file`, puedes iniciar los contenedores utilizando `docker-compose`:**

   ```bash
   docker-compose up
   ```

   **Docker Compose cargará las variables definidas en el fichero `.env` y las usará dentro de los contenedores.**

### **Notas adicionales**

- **Ubicación del fichero `.env`:** *Si no especificas una ruta, Docker Compose buscará un fichero `.env` en el mismo directorio donde se encuentra el fichero `docker-compose.yml`. Si el fichero tiene otro nombre o está en otra ubicación, puedes especificarlo de esta manera:*

   ```yaml
   env_file:
     - ./config/.env
   ```

- **Variables de entorno en `docker-compose.yml`:** *Si usas un fichero `env-file`, puedes referenciar las variables de entorno dentro del `docker-compose.yml` usando `${VARIABLE_NAME}`. Por ejemplo:*

   ```yaml
   services:
     app:
       image: my-app
       environment:
         - DB_HOST=${DB_HOST}
         - DB_PORT=${DB_PORT}
   ```

   ```yaml
   services:
     app:
       image: my-app
       environment:
          DB_HOST: ${DB_HOST}
          DB_PORT: ${DB_PORT}
   ```

   *Esto toma las variables definidas en tu fichero `.env` y las usa dentro de la configuración del contenedor.*

### **Resumen**

- **Archivo `.env`:** *Define las variables de entorno.*
- **`env_file` en `docker-compose.yml`:** *Se usa para cargar ese fichero de variables de entorno dentro de los contenedores.*
- *Puedes usar las variables definidas en el fichero `.env` directamente dentro del fichero `docker-compose.yml` usando `${VARIABLE_NAME}`.*

*La sintaxis `"8080:80/tcp"` es una forma de especificar cómo se deben mapear los puertos entre el contenedor y la máquina host en Docker.*

### **Desglosado:**

- **`8080:80`:** *Esto indica el mapeo de puertos. El número a la izquierda (`8080`) es el puerto en la máquina **host** (tu computadora o servidor que ejecuta Docker), mientras que el número a la derecha (`80`) es el puerto dentro del contenedor.*
  - **`8080`:** *Este es el puerto que estará disponible en tu máquina local (host) y al que puedes acceder.*
  - **`80`:** *Este es el puerto que está siendo expuesto dentro del contenedor. Es el puerto que el servicio dentro del contenedor está utilizando para escuchar las solicitudes, en este caso el puerto estándar de HTTP.*

- **`/tcp`:** *Especifica que el protocolo que se está utilizando para el mapeo de puertos es **TCP** (Transmission Control Protocol). Este es el protocolo predeterminado para la mayoría de las aplicaciones de red, como servidores web (HTTP) y bases de datos.*

### **Ejemplo:**

**Si tienes un contenedor ejecutando una aplicación web que escucha en el puerto `80` (por ejemplo, un servidor HTTP), y quieres acceder a esta aplicación desde tu máquina host en el puerto `8080`, debes usar el mapeo `"8080:80/tcp"`. Esto hará que las solicitudes a `localhost:8080` en tu máquina sean redirigidas al puerto `80` dentro del contenedor.**

- **Resumen:**

- **`8080`:** *Puerto de la máquina host (accesible desde fuera del contenedor).*
- **`80`:** *Puerto dentro del contenedor donde el servicio está escuchando.*
- **`/tcp`:** *Indica que el protocolo es TCP, que es el más común para la mayoría de las aplicaciones.*

*Este mapeo permite que puedas acceder a un servicio dentro del contenedor desde el puerto `8080` de tu máquina local.*
