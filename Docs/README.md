<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# **Foros**

- *[How to clean up Docker](https://stackoverflow.com/questions/45798076/how-to-clean-up-docker "https://stackoverflow.com/questions/45798076/how-to-clean-up-docker")*
- *[.docker/config.json vs .dockercfg](https://stackoverflow.com/questions/35519072/docker-config-json-vs-dockercfg "https://stackoverflow.com/questions/35519072/docker-config-json-vs-dockercfg")*
- *['docker ps' output formatting: list only names of running containers](https://stackoverflow.com/questions/50667371/docker-ps-output-formatting-list-only-names-of-running-containers  "https://stackoverflow.com/questions/50667371/docker-ps-output-formatting-list-only-names-of-running-containers")*

*La diferencia entre `.docker/config.json` y `.dockercfg` radica en su propósito, formato y en los cambios introducidos en versiones más recientes de Docker. Aquí te explico la evolución, las diferencias clave y cómo encajan en el ecosistema de Docker:*

- *[Docker Engine Daemon](https://docs.docker.com/engine/daemon/ "https://docs.docker.com/engine/daemon/")*
- *[Docker Login](https://docs.docker.com/reference/cli/docker/login/ "https://docs.docker.com/reference/cli/docker/login/")*
- *[docker-config-json](https://man.archlinux.org/man/docker-config-json.5.en "https://man.archlinux.org/man/docker-config-json.5.en")*
- **1. .dockercfg (Formato antiguo)**

- **Introducción:** *`.dockercfg` era el fichero de configuración predeterminado en versiones más antiguas de Docker (antes de la versión 1.7.0, lanzada en abril de 2015).*
- **Ubicación:** *Este fichero residía en el directorio `~/.docker/` o directamente en el directorio del usuario como un fichero oculto.*
- **Propósito:**
  - *Almacenaba credenciales de inicio de sesión (`docker login`) para registries de Docker en formato JSON plano.*
  - *Ejemplo:*

    ```json
    {
      "https://index.docker.io/v1/": {
        "auth": "TmljYXJhZ3VhCg==",
        "email": "user@example.com"
      }
    }
    ```

- **Seguridad:** *Las credenciales estaban codificadas en Base64, pero no cifradas, lo que hacía que este formato fuera vulnerable si alguien obtenía acceso al fichero.*

- **2. .docker/config.json (Formato actual)**

- **Introducción:** *`config.json` reemplazó a `.dockercfg` a partir de Docker 1.7.0 como parte de una migración para soportar más funcionalidades y mejorar la seguridad.*
- **Ubicación:** *Por defecto, se encuentra en `~/.docker/config.json`.*
- **Propósito:**
  - *Es el fichero de configuración principal para la CLI de Docker.*
  - *Almacena no solo credenciales, sino también configuraciones avanzadas como:*
    - *Configuración de proxy.*
    - *Configuración de registro de imágenes.*
    - *Configuración de formatos personalizados (como `psFormat`).*
  - *Ejemplo:*

    ```json
    {
      "auths": {
        "https://index.docker.io/v1/": {
          "auth": "TmljYXJhZ3VhCg=="
        }
      },
      "credsStore": "osxkeychain",
      "ServerURL": "https://index.docker.io/v1",
      "Username": "DanielPerez",
      "Secret": "passw0rd123",
      "credHelpers": {
        "myregistry.example.com": "secretservice",
        "docker.internal.example": "pass",
      }

      "HttpHeaders": {
        "User-Agent": "Docker-Client/27.4.0 (linux)"
      },
      "psFormat": "table {{.ID}} \t {{.Image}} \t {{.Status}} \t {{.Names}}"
    }
    ```

- **Seguridad:**
  - *Ahora, las credenciales pueden almacenarse en un **credencial store** o un **helper nativo** de la plataforma (como Keychain en macOS, Credencial Manager en Windows o pass en Linux).*
  - *Esto elimina las credenciales codificadas en Base64 del fichero, mejorando significativamente la seguridad.*

- **Migración entre formatos**

- **Cuando Docker 1.7.0 se lanzó, se introdujo un proceso de migración:**

- *El contenido de `.dockercfg` se movió automáticamente a `~/.docker/config.json`.*
- *El fichero `.dockercfg` no se elimina automáticamente, pero ya no es utilizado por Docker.*

- **Relación con /etc/docker/daemon.json**

- *`config.json` y `daemon.json` sirven para propósitos distintos:*
  - **`~/.docker/config.json`:**
    - *Es específico para la configuración de la **CLI de Docker**.*
    - *Afecta al comportamiento de comandos como `docker pull`, `docker push`, y otros relacionados con el cliente.*
  - **`/etc/docker/daemon.json`:**
    - *Especifica configuraciones del **demonio de Docker** (`dockerd`), como ajustes de red, configuraciones de almacenamiento, y opciones globales de ejecución.*

- **Conclusión**

- **`.dockercfg`:** *Formato obsoleto, sencillo pero inseguro.*
- **`config.json`:** *Formato moderno, más seguro y con soporte para configuraciones adicionales.*
- *Ambos ficheros no son intercambiables, ya que `config.json` amplía las funcionalidades y seguridad de `.dockercfg`.*
- *La gestión moderna de credenciales ha evolucionado hacia el uso de sistemas de almacenamiento seguro integrados en el sistema operativo.*
