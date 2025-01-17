<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# **La línea `#!/usr/bin/env bash -pl` es conocida como **shebang** y se encuentra al inicio de muchos scripts en sistemas Unix o Linux.**

## **`#!`** (Shebang)

- *El `#!` al inicio de un fichero indica que el fichero debe ejecutarse con un intérprete específico. Este es el **shebang** y permite que el sistema operativo sepa qué programa debe usar para ejecutar el script.*

- *El `#!` no es un comando por sí mismo, sino una convención que indica al sistema qué programa usar para interpretar el fichero.*

### **`/usr/bin/env`**

- **`/usr/bin/env`** *es un programa que se utiliza para encontrar y ejecutar el intérprete adecuado en función del entorno del sistema.*
- *En lugar de dar directamente la ruta al intérprete, como `/bin/bash`, `env` buscará el intérprete en los directorios que están listados en la variable de entorno `$PATH`, lo que hace el script más portable, porque no depende de una ruta absoluta específica.*
  - *Por ejemplo, en algunos sistemas, el comando `bash` podría estar en `/usr/bin/bash` o en `/bin/bash`, y usar `env` se asegura de que se encuentre sin importar la ruta.*

### **`bash`**

- **`bash`** *es el **Bourne Again SHell**, que es un intérprete de comandos de Linux/Unix. Es uno de los más populares y ampliamente utilizado en sistemas basados en Unix.*
- *Al usar `bash` en el shebang, estamos indicando que el script debe ejecutarse utilizando este intérprete de comandos.*

### **`-pl`**

- **`-p`** *y **`-l`** son **opciones** que se pasan al comando `bash` para modificar su comportamiento.*
  - **`-p`:** *La opción `-p` indica que **bash** debe iniciar con un entorno "protegido". Esto significa que ciertas variables del entorno, como `$PATH`, no se modificarán, lo que podría ser útil en algunos casos donde se necesita un entorno de ejecución más controlado.*
  - **`-l`:** *La opción `-l` le dice a `bash` que debe actuar como un **shell de login**, lo que significa que se ejecutarán ciertos ficheros de configuración del sistema (como `.bash_profile`, `.bashrc`, etc.), lo cual es típico cuando inicias sesión interactiva en un terminal. Esto es importante si el script necesita acceder a configuraciones del entorno que solo se cargan en un shell de login.*

### **Resumen completo**

- **La línea `#!/usr/bin/env bash -pl` al principio de un script:**

- *Le dice al sistema que el script debe ejecutarse usando **`bash`**.*
- **`/usr/bin/env`** *se usa para encontrar el intérprete `bash` de manera más flexible (sin depender de rutas absolutas).*
- **`-p`** *establece un entorno protegido.*
- **`-l`** *le indica a `bash` que debe comportarse como un shell de login.*
