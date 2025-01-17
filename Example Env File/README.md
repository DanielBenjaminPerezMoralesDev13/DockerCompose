<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# **En `docker-compose`, el uso de un archivo de variables de entorno (`env-file`) es una manera sencilla de cargar variables de entorno para los contenedores definidos en tu archivo `docker-compose.yml`.**

*El archivo `env-file` contiene pares de clave-valor, y puedes usarlo para definir variables de entorno que se utilizarán dentro de tus contenedores. Aquí te explico cómo usarlo:*

## **Pasos para usar `env-file` en `docker-compose`**

1. **Crear un archivo `.env` (o cualquier archivo de variables de entorno):**

   **Primero, crea un archivo llamado `.env` (o con otro nombre, si prefieres) donde definirás tus variables de entorno. Un ejemplo de un archivo `.env` podría ser:**

   ```bash
   DB_HOST=localhost
   DB_PORT=5432
   DB_USER=myuser
   DB_PASSWORD=mypassword
   ```

   **Las variables definidas aquí estarán disponibles para ser utilizadas por los contenedores dentro de `docker-compose.yml`.**

2. **Configurar `docker-compose.yml` para usar el `env-file`:**

   **Luego, en tu archivo `docker-compose.yml`, puedes hacer referencia a este archivo `.env` usando la opción `env_file` para cargar las variables de entorno en los contenedores.**

   **Aquí tienes un ejemplo de cómo hacerlo:**

   ```yaml
   # Autor: Daniel Benjamin Perez Morales
   # GitHub: https://github.com/DanielBenjaminPerezMoralesDev13
   # Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13
   # Correo electrónico: danielperezdev@proton.me
   version: '3.8'

   services:
     app:
       image: my-app
       env_file:
         - .env   # Name File .env
       ports:
         - "8080:8080"

     db:
       image: postgres:latest
       env_file:
         - .env   # Carga Las Mismas Variables Para El Contenedor De La Base De Datos
       environment:
         - DB_NAME=mydb
   ```

   **Explicación:**
   - **`env_file`:** *Especifica los archivos de variables de entorno que quieres usar. En este caso, se está utilizando el archivo `.env`, pero también puedes usar un archivo con otro nombre.*
   - **`environment` (opcional):** *Se usa para establecer variables de entorno adicionales directamente en el `docker-compose.yml` que no estén definidas en el archivo `env-file`. En este caso, `DB_NAME` se establece específicamente para el contenedor `db`.*

3. **Iniciar los contenedores:**

   **Una vez que tienes el archivo `docker-compose.yml` configurado con el `env_file`, puedes iniciar los contenedores utilizando `docker-compose`:**

   ```bash
   docker-compose up
   ```

   **Docker Compose cargará las variables definidas en el archivo `.env` y las usará dentro de los contenedores.**

### **Notas adicionales**

- **Ubicación del archivo `.env`:** *Si no especificas una ruta, Docker Compose buscará un archivo `.env` en el mismo directorio donde se encuentra el archivo `docker-compose.yml`. Si el archivo tiene otro nombre o está en otra ubicación, puedes especificarlo de esta manera:*

   ```yaml
   env_file:
     - ./config/.env
   ```

- **Variables de entorno en `docker-compose.yml`:** *Si usas un archivo `env-file`, puedes referenciar las variables de entorno dentro del `docker-compose.yml` usando `${VARIABLE_NAME}`. Por ejemplo:*

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

   *Esto toma las variables definidas en tu archivo `.env` y las usa dentro de la configuración del contenedor.*

### **Resumen**

- **Archivo `.env`:** *Define las variables de entorno.*
- **`env_file` en `docker-compose.yml`:** *Se usa para cargar ese archivo de variables de entorno dentro de los contenedores.*
- *Puedes usar las variables definidas en el archivo `.env` directamente dentro del archivo `docker-compose.yml` usando `${VARIABLE_NAME}`.*
