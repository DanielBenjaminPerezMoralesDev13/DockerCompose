<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# **Comparación detallada de comandos: `docker compose create` vs `docker compose up`**

## **1. `docker compose create`**

- **Propósito:**
  *El comando `docker compose create` **crea los contenedores** definidos en el archivo `docker-compose.yaml`, pero **no los inicia automáticamente**.*

- **Equivalente en Docker CLI:**
  *Similar a `docker container create`, que prepara el contenedor pero no lo pone en ejecución.*

- **Flujo de trabajo:**
  - *Docker toma las definiciones del archivo `docker-compose.yaml` y crea los contenedores necesarios con base en las imágenes especificadas.*
  - *Si la imagen no existe, Docker intenta construirla automáticamente (si se usa `--build`).*
  - *Los contenedores quedan en estado **"Created"** y pueden ser iniciados posteriormente con el comando `docker compose start`.*

- **Ventajas:**
  - *Útil si deseas crear los contenedores sin ejecutarlos inmediatamente, por ejemplo, para prepararlos y configurarlos antes de su inicio.*
  - *Permite inspeccionar el entorno o realizar ajustes antes de iniciar el contenedor.*

- **Ejemplo:**

  ```bash
  docker compose create --build
  ```

  **Resultado:**
  **Los contenedores se crean pero no se ejecutan.**

---

### **2. `docker compose up`**

- **Propósito:**
  *El comando `docker compose up` **crea y ejecuta los contenedores** definidos en el archivo `docker-compose.yaml`. Si los contenedores ya existen, los inicia en lugar de volver a crearlos.*

- **Equivalente en Docker CLI:**
  *Similar a `docker container run`, que crea un contenedor (si no existe) y lo inicia de inmediato.*

- **Flujo de trabajo:**
  - *Docker verifica si los contenedores ya existen:*
    - *Si no existen, los crea a partir de las definiciones del archivo.*
    - *Si ya existen, los inicia directamente sin recrearlos (a menos que se use la opción `--force-recreate`).*
  - *Si las imágenes necesarias no están presentes, Docker las construye automáticamente (si se usa `--build` o están definidas con `build` en el archivo).*
  - *Los contenedores comienzan a ejecutarse inmediatamente.*

- **Ventajas:**
  - *Es un flujo más directo, ya que combina los pasos de creación y ejecución en un solo comando.*
  - *Ideal para situaciones en las que deseas iniciar rápidamente un proyecto.*

- **Opciones importantes:**
  - **`--build`:** *Fuerza la construcción de las imágenes antes de iniciar los contenedores.*
  - **`--detach` (o `-d`):** *Inicia los contenedores en segundo plano.*
  - **`--force-recreate`:** *Obliga a Docker a recrear los contenedores incluso si ya existen.*

- **Ejemplo:**

  ```bash
  docker compose up --build --detach
  ```

  **Resultado:**
  *Los contenedores se crean (o reconstruyen) y se inician en segundo plano.*

---

### **Diferencias clave**

| **Aspecto**                  | **`docker compose create`**                                               | **`docker compose up`**                                 |
| ---------------------------- | ------------------------------------------------------------------------- | ------------------------------------------------------- |
| **Acción principal**         | *Crea los contenedores pero no los inicia.*                               | *Crea (si es necesario) y ejecuta los contenedores.*    |
| **Estado del contenedor**    | *"Created"*                                                               | *"Running"*                                             |
| **Construcción de imágenes** | *No construye imágenes automáticamente (a menos que se use `--build`).*   | *Construye imágenes automáticamente si son necesarias.* |
| **Flujo continuo**           | *Solo crea los contenedores; hay que iniciarlos manualmente con `start`.* | *Realiza todo en un solo paso (creación y ejecución).*  |
| **Uso típico**               | *Preparar contenedores sin ejecutarlos.*                                  | *Desplegar un proyecto completo.*                       |

---

### **Diferencia entre `create` y `pull`**

- **`docker compose create`:**
  - *Crea los contenedores a partir de las imágenes disponibles localmente.*
  - *No descarga imágenes nuevas del registro Docker (a menos que ya estén definidas y falten).*

- **`docker compose pull`:**
  - *Descarga las imágenes necesarias del registro Docker sin crear contenedores.*
  - *Útil si deseas actualizar imágenes antes de crear contenedores.*

---

### **Descripción del archivo `ubuntu-services.yaml`**

```yaml
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielBenjaminPerezMoralesDev13
# Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

services:
  app:
    image: ubuntu:noble
    labels:
      - maintainer=D4nitrix13
    container_name: app-container
    stdin_open: true 
    tty: true 
    command: bash
```

- **image:** *Define la imagen de Docker que se usará para el contenedor. En este caso, está utilizando la imagen `ubuntu:noble`, que sería una versión específica de Ubuntu.*
- **labels:** *Es una lista de etiquetas asociadas al contenedor. Aquí, se está añadiendo una etiqueta `maintainer` para indicar quién mantiene el contenedor, con un valor de `D4nitrix13`.*
- **container_name:** *Especifica el nombre del contenedor en lugar de usar uno generado aleatoriamente.*
- **stdin_open:** *Habilita la entrada estándar en el contenedor, lo que significa que puedes interactuar con él a través de un terminal.*
- **tty:** *Asigna un terminal virtual al contenedor, lo que permite que se utilicen aplicaciones que requieren una terminal, como `bash`.*
- **command:** *Define el comando que se ejecutará cuando el contenedor se inicie, en este caso, `bash` para acceder a la terminal del contenedor.*

### **Explicación del comando `docker compose --project-name project --file ubuntu-services.yaml pull --include-deps --policy always`**

**El comando ejecuta Docker Compose, que es una herramienta para definir y ejecutar aplicaciones Docker de múltiples contenedores. Aquí está lo que hace cada parte del comando:**

1. **`docker compose`:** *Indica que se utilizará Docker Compose para gestionar los contenedores.*
2. **`--project-name project`:** *Define el nombre del proyecto como `project`. Esto es útil para agrupar contenedores y recursos bajo un nombre común, especialmente cuando se manejan múltiples aplicaciones Docker en el mismo entorno.*
3. **`--file ubuntu-services.yaml`:** *Especifica el archivo YAML (`ubuntu-services.yaml`) que contiene la configuración de los servicios que Docker Compose debe utilizar. En este caso, el archivo contiene la configuración del servicio `app` basado en la imagen de Ubuntu.*
4. **`pull`:** *Este comando se usa para descargar las imágenes de Docker definidas en el archivo de configuración. En este caso, descarga la imagen de Ubuntu especificada.*
5. **`--include-deps`:** *Indica que también deben descargarse las imágenes de los contenedores dependientes, aunque en este archivo no haya dependencias explícitas, se incluiría cualquier contenedor relacionado si existiera.*
6. **`--policy always`:** *Este parámetro asegura que Docker siempre descargue la última versión disponible de la imagen, incluso si ya tienes una versión local.*

### **Salida del comando**

**La salida del comando muestra el resultado de la ejecución del `docker-compose pull`:**

```bash
[+] Pulling 2/2
 ✔ app Pulled                                                                                                       17.6s
   ✔ de44b265507a Pull complete                                                                                     13.7s
```

- **[+] Pulling 2/2:** *Indica que se están descargando 2 imágenes en total. En este caso, parece que hay 2 imágenes que Docker necesita descargar.*
- **✔ app Pulled:** *Significa que la imagen del contenedor `app` se descargó correctamente. El tiempo que tardó fue de 17.6 segundos.*
- **✔ de44b265507a Pull complete:** *Este es un identificador único de la imagen descargada, y significa que el proceso de descarga de la imagen fue completado exitosamente en 13.7 segundos.*

*Este comando asegura que las imágenes necesarias estén listas para ser utilizadas según la configuración de Docker Compose en el archivo YAML.*

---

### **`--policy always`**

- **Comportamiento:** *Con la política `always`, Docker descargará la **última versión disponible** de la imagen de contenedor, **independientemente de si ya tienes una versión local**. Es decir, siempre que ejecutes `docker-compose pull --policy always`, Docker verificará si hay una nueva versión disponible de la imagen y la descargará, incluso si ya tienes una copia local.*
- **Caso de uso:** *Esta política es útil si deseas asegurarte de estar utilizando la versión más reciente de una imagen cada vez que la descargues o ejecutes.*

### 2. **`--policy missing`**

- **Comportamiento:** *Con la política `missing`, Docker solo descargará la imagen si **no está presente en el sistema local**. Si ya tienes la imagen localmente, Docker no realizará ninguna descarga, incluso si hay una nueva versión disponible. Solo descargará la imagen si es completamente inexistente en tu máquina.*
- **Caso de uso:** *Esta política es útil si quieres evitar la descarga innecesaria de imágenes que ya tienes, pero aún así deseas descargar las imágenes que no están presentes en tu sistema.*

### **Resumen de diferencias**

| *Política*    | *Comportamiento*                                                                            | *Uso Ideal*                                                                                    |
| ------------- | ------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| **`always`**  | *Siempre descarga la última versión disponible, incluso si ya tienes la imagen localmente.* | *Cuando deseas tener siempre la última versión de la imagen, sin importar si ya la tienes.*    |
| **`missing`** | *Solo descarga la imagen si no está presente en el sistema local.*                          | *Cuando deseas evitar descargar imágenes que ya tienes, pero necesitas obtener las faltantes.* |

### **Ejemplo práctico**

**Supongamos que tienes una imagen llamada `myapp:latest` en tu sistema:**

- *Si ejecutas `docker-compose pull --policy always`, Docker descargará la última versión disponible de `myapp:latest`, incluso si ya tienes una versión local.*
- *Si ejecutas `docker-compose pull --policy missing`, Docker solo descargará la imagen si no está presente en tu máquina (es decir, si no tienes `myapp:latest` localmente).*

*En resumen, `always` asegura que tengas la versión más reciente, mientras que `missing` se asegura de que solo se descarguen imágenes nuevas que no están en tu máquina.*
