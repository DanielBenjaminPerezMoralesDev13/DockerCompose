<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# **El comando `docker compose --project-name project --file mongo-services.yaml up --detach --timestamps --build` se utiliza para ejecutar un conjunto de servicios definidos en un fichero `docker-compose.yaml` con varias opciones adicionales.**

## **Desglose del comando**

1. **`docker compose`:**
   *Este es el comando principal para interactuar con Docker Compose, una herramienta que te permite definir y ejecutar aplicaciones multicontenedor en Docker usando ficheros YAML.*

2. **`--project-name project`:**
   *Establece un nombre específico para el proyecto que se va a ejecutar. En este caso, el proyecto se llama `project`. Esto se usa para agrupar y distinguir los contenedores, redes y volúmenes creados por este proyecto. Si no se especifica, Docker Compose usará el nombre del directorio donde se ejecuta el comando.*

3. **`--file mongo-services.yaml`:**
   *Especifica el fichero YAML que define los servicios de Docker Compose. En este caso, el fichero es `mongo-services.yaml`. Este fichero debe contener la configuración de los contenedores, redes y volúmenes que Docker Compose debe crear y gestionar.*

4. **`up`:**
   *Inicia y ejecuta los servicios definidos en el fichero de configuración de Docker Compose. Si los contenedores ya existen, Docker Compose intentará recrearlos si es necesario (por ejemplo, si se hicieron cambios en las configuraciones).*

5. **`--detach`:**
   *Inicia los contenedores en segundo plano (modo "detached"). Esto significa que el terminal no se quedará bloqueado con los logs de los contenedores, y podrás continuar usando el terminal para otros comandos. Si no se usa esta opción, Docker Compose ejecutaría los contenedores en primer plano, mostrando los logs directamente en la terminal.*

6. **`--timestamps`:**
   *Añade marcas de tiempo a los logs de los contenedores cuando los contenedores se ejecutan. Esto te permite ver exactamente cuándo ocurren los eventos dentro de los contenedores.*

7. **`--build`:**
   *Fuerza la reconstrucción de las imágenes de los servicios antes de iniciar los contenedores. Esto es útil si has hecho cambios en los ficheros de Docker o en el contexto de construcción de las imágenes y quieres asegurarte de que los contenedores utilicen las versiones más recientes de las imágenes.*

### **Resumen**

*El comando `docker compose --project-name project --file mongo-services.yaml up --detach --timestamps --build` realiza lo siguiente:*

- *Usa el fichero `mongo-services.yaml` para definir los servicios.*
- *Establece el nombre del proyecto como `project`.*
- *Inicia los servicios definidos en segundo plano (sin bloquear la terminal).*
- *Muestra los logs con marcas de tiempo.*
- *Reconstruye las imágenes de los servicios antes de iniciar los contenedores.*

*Este comando es útil cuando deseas iniciar un entorno con Docker Compose, asegurarte de que las imágenes se construyan correctamente y mantener el control sobre los contenedores en segundo plano.*
