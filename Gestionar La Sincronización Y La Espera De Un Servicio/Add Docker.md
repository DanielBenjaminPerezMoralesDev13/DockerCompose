<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# **Explicación del comando `ADD` en Docker:**

- *Cuando usamos el comando `ADD src dest`, este permite copiar archivos o directorios desde un origen (`src`) a un destino (`dest`) dentro de una imagen de Docker.*
- *El comportamiento del comando varía dependiendo de si `src` es una URL o un archivo comprimido local.*

> [!WARNING]
> *El Comando Add En Docker No Descomprime Automáticamente Los Archivos .zip.*

**Aunque Add Puede Descomprimir Automáticamente Archivos .tar, .tar.gz, .tar.bz2, Etc., No Hace Lo Mismo Con Archivos .zip.**

## ***Caso 1: `src` es una URL hacia un recurso comprimido***

- *Si `src` es una URL que apunta a un recurso comprimido (por ejemplo, un archivo `.tar`), el comando `ADD` descargará y descomprimirá automáticamente el contenido del archivo en el destino especificado.*
- **Ejemplo:**

  ```dockerfile
  ADD http://192.168.1.17:3000/project.tar /App/server.sh
  ```

  **En este caso:**
  - *El archivo `project.tar` será descargado desde la URL `http://192.168.1.17:3000`.*
  - *Su contenido será descomprimido automáticamente.*
  - *El contenido del archivo comprimido se ubicará en el directorio `/App`, y el nombre del destino puede especificarse como `server.sh`.*

### ***Caso 2: `src` es un archivo comprimido local***

- *Si `src` es un archivo comprimido local ubicado en el host, el comando `ADD` copiará el archivo al destino (`dest`) tal como está, sin descomprimirlo.*
- **Ejemplo:**

  ```dockerfile
  ADD ./project.tar /App/project
  ```

  **En este caso:**
  - *El archivo local `project.tar` será copiado a la ruta `/App` en la imagen de Docker.*
  - *Se mantendrá comprimido con el nombre especificado, es decir, `project`.*

**Nota importante:**

- **Para descomprimir un archivo local en el contenedor, sería necesario usar herramientas adicionales como `tar` después de copiarlo con `ADD` o `COPY`.**
