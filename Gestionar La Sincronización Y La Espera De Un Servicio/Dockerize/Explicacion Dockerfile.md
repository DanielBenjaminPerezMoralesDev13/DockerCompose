# **Explicación del Dockerfile**

*Este `Dockerfile` define cómo construir una imagen de Docker basada en Ubuntu. Cada línea tiene un propósito específico.*

---

## **1. Autoría y Metadatos**

```Dockerfile
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielBenjaminPerezMoralesDev13
# Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me
```

*Estos comentarios proporcionan información sobre el autor de este archivo. Son solo informativos y no tienen impacto en el comportamiento del contenedor.*

---

### **2. Base de la imagen**

```Dockerfile
FROM ubuntu:jammy
```

- **`FROM`:** *Especifica la imagen base para construir el contenedor. En este caso, es la imagen oficial de Ubuntu con la etiqueta `jammy` (versión 22.04 LTS).*

---

#### **3. Instalación de paquetes y configuración inicial**

```Dockerfile
RUN apt update && \
    apt install -y tini ncat && \
    useradd -m d4nitrix13 -s /usr/bin/bash && \
    mkdir -p /var/log/server/ && \
    touch /var/log/server/access.log /var/log/server/error.log
```

- **`RUN`:** *Ejecuta comandos durante el proceso de construcción de la imagen.*
- **`apt update`:** *Actualiza la lista de paquetes disponibles.*
- **`apt install -y tini ncat`:**
  - **`-y`:** *Acepta automáticamente las confirmaciones para la instalación.*
  - **`tini`:** *Un inicializador simple que ayuda a gestionar procesos en contenedores.*
  - **`ncat`:** *Herramienta de red utilizada para probar conexiones TCP/UDP.*
- **`useradd -m d4nitrix13 -s /usr/bin/bash`:**
  - **`useradd`:** *Crea un nuevo usuario.*
  - **`-m`:** *Crea un directorio de inicio para el usuario.*
  - **`-s /usr/bin/bash`:** *Define el shell predeterminado como `bash`.*
- **`mkdir -p /var/log/server/`:**
  - **`mkdir -p`:** *Crea el directorio especificado. Si ya existe, no genera error.*
- **`touch /var/log/server/access.log /var/log/server/error.log`:**
  - **`touch`:** *Crea archivos vacíos si no existen.*

---

#### **4. Usuario predeterminado**

```Dockerfile
USER d4nitrix13
```

- **`USER`:** *Cambia al usuario especificado para ejecutar comandos posteriores. Aquí cambia al usuario `d4nitrix13`.*

---

#### **5. Cambiar el shell por defecto**

```Dockerfile
SHELL [ "/usr/bin/bash", "-plc" ]
```

- **`SHELL`:** *Define el shell predeterminado para los comandos `RUN`.*
  - **`-p`:** *Conserva el entorno del shell.*
  - **`-l`:** *Inicia el shell como un "login shell".*
  - **`-c`:** *Ejecuta el comando proporcionado como argumento.*

---

#### **6. Copiar un binario desde otra imagen**

```Dockerfile
COPY --from=jwilder/dockerize --chown=1000:1000 /bin/dockerize /usr/bin/dockerize
```

- **`COPY --from`:** *Copia archivos desde una imagen multietapa (`jwilder/dockerize`).*
- **`--chown=1000:1000`:**
  - *Cambia el propietario del archivo copiado a `UID=1000` y `GID=1000`.*
- *Copia el binario `dockerize` desde la imagen fuente al destino `/usr/bin/dockerize`.*

---

#### **7. Verificación de salud**

```Dockerfile
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "dockerize", "-stdout", "/var/log/server/access.log", "-stderr", "/var/log/server/error.log", "-wait", "tcp4://localhost:8000", "--", "echo", "'Server Up'" ]
```

- **`HEALTHCHECK`:** *Define un comando para verificar si el contenedor está saludable.*
  - **`--interval=30s`:** *Ejecuta la verificación cada 30 segundos.*
  - **`--timeout=30s`:** *Espera un máximo de 30 segundos para que el comando termine.*
  - **`--start-period=5s`:** *Espera 5 segundos después de iniciar el contenedor antes de realizar la primera verificación.*
  - **`--retries=3`:** *Reintenta 3 veces antes de marcar el contenedor como no saludable.*
- **Comando:**
  - **`dockerize -stdout /var/log/server/access.log -stderr /var/log/server/error.log`:** *Redirige los logs a los archivos especificados.*
  - **`-wait tcp4://localhost:8000`:** *Espera a que el puerto `8000` esté disponible (protocolo TCP).*
  - **`echo 'Server Up'`:** *Mensaje de éxito.*

---

#### **8. Exponer puerto**

```Dockerfile
EXPOSE 5757/tcp
```

- **`EXPOSE`:** *Informa que el contenedor escucha en el puerto `5757` usando el protocolo TCP. Esto no abre el puerto automáticamente; debe hacerse al ejecutar el contenedor.*

---

#### **9. Señal de parada**

```Dockerfile
STOPSIGNAL 15
```

- **`STOPSIGNAL`:** *Define la señal enviada al proceso principal para detener el contenedor. Aquí, la señal `15` (SIGTERM) se usa para una terminación segura.*

---

#### **10. Metadatos del mantenedor**

```Dockerfile
MAINTAINER Daniel Benjamin Perez Morales
LABEL maintainer="Daniel Benjamin Perez Morales (D4nitrix13)"
```

- **`MAINTAINER`:** *Informa quién mantiene esta imagen. Este comando está obsoleto y debe reemplazarse por `LABEL`.*
- **`LABEL`:** *Agrega metadatos sobre la imagen. Aquí, incluye información del mantenedor.*

---

#### **11. Entrypoint y Comando**

```Dockerfile
ENTRYPOINT [ "tini", "--" ]
CMD [ "nc", "-nlvkp", "5757" ]
```

- **`ENTRYPOINT`:**
  - *Define el binario principal que se ejecutará (en este caso, `tini`).*
  - **`"--"`:** *Indica el fin de los argumentos para `tini`.*
- **`CMD`:**
  - *Define el comando predeterminado que ejecutará el contenedor.*
  - **`nc -nlvkp 5757`:**
    - **`-n`:** *No resuelve nombres DNS.*
    - **`-l`:** *Escucha conexiones entrantes.*
    - **`-v`:** *Modo detallado (verbose).*
    - **`-k`:** *Permite conexiones múltiples.*
    - **`-p 5757`:** *Usa el puerto `5757`.*

---

### **Comando adicional**

```bash
nc -zv 172.17.0.2 5757
```

- *Este comando verifica si el puerto `5757` está abierto en el contenedor con la dirección IP `172.17.0.2`.*
  - **`-z`:** *Realiza un escaneo rápido de puertos sin enviar datos.*
  - **`-v`:** *Muestra información detallada.*
