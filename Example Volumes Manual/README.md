<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# **Docker Volumes**

- *[Volume Create](https://docs.docker.com/reference/cli/docker/volume/create/ "https://docs.docker.com/reference/cli/docker/volume/create/")*
- *[Volume Prune](https://docker-docs.uclv.cu/engine/reference/commandline/volume_prune/ "https://docker-docs.uclv.cu/engine/reference/commandline/volume_prune/")*
- *[Create File Random File Linux Pesado](https://superuser.com/questions/470949/how-do-i-create-a-1gb-random-file-in-linux "https://superuser.com/questions/470949/how-do-i-create-a-1gb-random-file-in-linux")*
- *[Volume Options](https://stackoverflow.com/questions/63227362/docker-volumes-create-options-driver "https://stackoverflow.com/questions/63227362/docker-volumes-create-options-driver")*
- *[Volume Size](https://stackoverflow.com/questions/40494536/how-to-specify-the-size-of-a-shared-docker-volume "https://stackoverflow.com/questions/40494536/how-to-specify-the-size-of-a-shared-docker-volume")*
- *[Shell Range](https://stackoverflow.com/questions/169511/how-do-i-iterate-over-a-range-of-numbers-defined-by-variables-in-bash "https://stackoverflow.com/questions/169511/how-do-i-iterate-over-a-range-of-numbers-defined-by-variables-in-bash")*
- **[Foro Volume Rm Deprecated](https://github.com/docker/cli/issues/4028 "https://github.com/docker/cli/issues/4028")**

## **¿Qué son los volúmenes en Docker?**

> [!NOTE]
> *Los volúmenes son una forma de persistir datos en contenedores Docker. A diferencia de los sistemas de ficheros temporales que desaparecen al detener o eliminar un contenedor, los volúmenes permiten que los datos permanezcan disponibles independientemente del ciclo de vida del contenedor.*

---

### **Comandos básicos de Docker Volume**

```bash
docker volume --help

Usage:  docker volume COMMAND

Manage volumes

Commands:
  create      Create a volume
  inspect     Display detailed information on one or more volumes
  ls          List volumes
  prune       Remove unused local volumes
  rm          Remove one or more volumes

Run 'docker volume COMMAND --help' for more information on a command.
```

#### **Crear un volumen**

```bash
docker volume create --help

Usage:  docker volume create [OPTIONS] [VOLUME]

Create a volume

Options:
  -d, --driver string   Specify volume driver name (default "local")
      --label list      Set metadata for a volume
  -o, --opt map         Set driver specific options (default map[])
```

```bash
docker volume create my-volume
my-volume
```

- *Este comando crea un volumen llamado `my-volume`. Si no se especifica un nombre, Docker genera uno automáticamente.*
- **Resultado esperado:**

```bash
my-volume
```

#### **Listar volúmenes**

```bash
docker volume ls --filter name=my-volume
```

- *Muestra los volúmenes disponibles con el nombre especificado.*
- **Resultado esperado:**

```bash
docker volume ls --filter name=my-volume
DRIVER    VOLUME NAME
local     my-volume
```

##### **Filtrar por driver:**

```bash
docker volume ls --filter driver=local
```

```bash
docker volume ls --filter driver=local
DRIVER    VOLUME NAME
local     my-volume
```

- *Lista solo los volúmenes que usan el driver `local`.*

##### **Filtrar volúmenes "dangling" (sin uso):**

```bash
docker volume ls --filter dangling=true
```

- *Muestra los volúmenes que no están montados en ningún contenedor.*

```bash
docker volume ls --filter dangling=true
DRIVER    VOLUME NAME
local     my-volume
```

#### **Inspeccionar un volumen**

```bash
docker volume inspect --help

Usage:  docker volume inspect [OPTIONS] VOLUME [VOLUME...]

Display detailed information on one or more volumes

Options:
  -f, --format string   Format output using a custom template:
                        'json':             Print in JSON format
                        'TEMPLATE':         Print output using the given Go template.
                        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
```

```bash
docker volume inspect my-volume
```

- *Proporciona detalles sobre el volumen, como la ubicación en el sistema de ficheros (`Mountpoint`), el driver utilizado, y más.*

```bash
docker volume inspect my-volume
[
    {
        "CreatedAt": "2025-01-13T21:36:58-06:00",
        "Driver": "local",
        "Labels": null,
        "Mountpoint": "/var/lib/docker/volumes/my-volume/_data",
        "Name": "my-volume",
        "Options": null,
        "Scope": "local"
    }
]
```

```bash
docker volume inspect --format "{{.Mountpoint}}" my-volume
/var/lib/docker/volumes/my-volume/_data
```

#### **Eliminar un volumen**

```bash
docker volume rm my-volume
```

- *Elimina el volumen especificado, siempre que no esté en uso.*

---

### **Ubicación física de los volúmenes**

- *En el sistema de ficheros del host, los datos de un volumen se almacenan en:*

```bash
/var/lib/docker/volumes/<volume-name>/_data
```

- **Para verificar el contenido de un volumen:**

```bash
sudo lsd /var/lib/docker/volumes/my-volume/_data -lA
```

---

### **Montaje de un volumen en un contenedor**

```bash
docker run -itu root:root -w /App -v my-volume:/App --name container-one ubuntu:latest
```

**Desglose del comando:**

- **`-v my-volume:/App`:** *Monta el volumen `my-volume` en el directorio `/App` del contenedor.*
- **`-w /App`:** *Establece `/App` como el directorio de trabajo.*
- **`-itu root:root`:** *Ejecuta el contenedor con usuario `root`.*
- **`ubuntu:latest`:** *Usa la imagen base de Ubuntu.*
- **`--name container-one`:** *Asigna el nombre `container-one` al contenedor.*

---

### **Ejemplo de persistencia de datos con volúmenes**

#### **Paso 1: Crear y modificar datos en un contenedor**

- **Dentro de `container-one`, crea una estructura de carpetas y ficheros:**

```bash
mkdir -p ./python3 ./javascript ./php
echo "print('Hola Mundo')" > ./python3/main.py
echo "console.log('Hola Mundo');" > ./javascript/main.js
echo "<?php echo 'Hola Mundo'; ?>" > ./php/main.php
echo "print('Hola Mundo')" > ./main.lua
```

```bash
sudo cat --number /var/lib/docker/volumes/my-volume/_data/main.lua
1  print('Hola Mundo')
```

#### **Paso 2: Verificar los datos en el host**

```bash
sudo lsd -lA --tree /var/lib/docker/volumes/my-volume/_data
```

**Estructura esperada:**

```bash
/var/lib/docker/volumes/my-volume/_data
├── javascript
│   └── main.js
├── main.lua
├── php
│   └── main.php
└── python3
    └── main.py
```

```bash
sudo cat --number /var/lib/docker/volumes/my-volume/_data/main.lua
1  print('Hola Mundo')
```

#### **Paso 3: Montar el volumen en un segundo contenedor**

```bash
docker run -itu root:root -w /Code --mount type=volume,source=my-volume,target=/Code --name container-two ubuntu:latest
```

- **En este caso, usamos `--mount` con `type=volume` para montar el volumen.**

#### **Paso 4: Leer y modificar datos desde el segundo contenedor**

- **Dentro de `container-two`:**

```bash
cat ./php/main.php
```

```bash
cat ./php/main.php
<?php echo 'Hola Mundo'; ?>
```

```bash
rm ./main.lua
```

#### **Paso 5: Verificar cambios en el primer contenedor**

**Dentro de `container-one`:**

```bash
ls -lA
```

- **El fichero `main.lua` ya no estará presente.**

---

### **Sincronización entre contenedores y host**

- *Los volúmenes permiten compartir datos entre múltiples contenedores y con el host.*
**Ventajas:**
- *Persistencia de datos.*
- *Facilidad para compartir información entre servicios.*
- *Gestión centralizada.*

**Nota:** *Siempre verifica los permisos y usuarios dentro de los contenedores para evitar conflictos de acceso.*

### **Crear un volumen con opciones personalizadas**

- *Usando el comando docker volume create, se puede crear un volumen con parámetros personalizados.*

```bash
docker volume create \
  --driver local \
  --label environment=development \
  --label team=backend \
  --opt type=tmpfs \
  --opt device=tmpfs \
  --opt o=size=100m \
  custom-volume
```

```bash
docker volume ls --filter label=team
```

```bash
docker volume ls --filter label=team
DRIVER    VOLUME NAME
local     custom-volume
```

**Explicación de las opciones:**

- **--driver local:** *Especifica que el driver será el predeterminado local.*
- **--label environment=development:** *Asigna una etiqueta de metadatos para identificar el volumen.*
- **--opt type=tmpfs:** *Especifica que se usará un sistema de ficheros temporal (tmpfs).*
- **--opt device=tmpfs:** *Monta el dispositivo como un almacenamiento temporal.*
- **--opt o=size=100m:** *Limita el tamaño del almacenamiento temporal a 100 MB.*
- **custom-volume:** *Nombre del volumen creado.*

```bash
docker volume inspect custom-volume
[
    {
        "CreatedAt": "2025-01-14T18:43:46-06:00",
        "Driver": "local",
        "Labels": {
            "environment": "development",
            "team": "backend"
        },
        "Mountpoint": "/var/lib/docker/volumes/custom-volume/_data",
        "Name": "custom-volume",
        "Options": {
            "device": "tmpfs",
            "o": "size=100m",
            "type": "tmpfs"
        },
        "Scope": "local"
    }
]
```

## **Creacion Del Contendor**

**El comando `docker run -itu 0:0 --name container-volume-example --mount type=volume,src=custom-volume,dst=/App ubuntu:latest` permite ejecutar un contenedor con un volumen montado y configuraciones específicas.**

### **`docker run`:**

   *Este es el comando principal para ejecutar un nuevo contenedor en Docker.*

### **`-itu 0:0`:**

   *Opción combinada que especifica varias configuraciones:*

- **`-i`:** *Mantiene la entrada estándar (`stdin`) abierta, lo cual es útil para interactuar con el contenedor.*
- **`-t`:** *Asigna un pseudo-TTY, lo que permite una interacción más amigable con la terminal del contenedor.*
- **`-u 0:0`:** *Especifica el usuario y el grupo con los que se ejecutará el contenedor. En este caso:*
  - **`0:0`** *indica que se ejecuta como el usuario `root` y el grupo `root`.*

### **`--name container-volume-example`:**

   *Asigna un nombre específico al contenedor. Esto facilita su identificación y manejo en futuros comandos.*

### **`--mount type=volume,src=custom-volume,dst=/App`:**

   *Monta un volumen en el contenedor con configuraciones específicas:*

- **`type=volume`:** *Especifica que el montaje será un volumen gestionado por Docker.*
- **`src=custom-volume`:** *Nombra el volumen fuente que se montará. En este caso, `custom-volume` es un volumen previamente creado.*
- **`dst=/App`:** *Especifica el punto de montaje dentro del contenedor. Si la ruta `/App` no existe, Docker la crea automáticamente.*

### **`ubuntu:latest`:**

   *Especifica la imagen base para el contenedor. En este caso, utiliza la imagen más reciente (`latest`) de Ubuntu.*

---

## **Dentro del contenedor**

### **Verificar el directorio `/App`:**

   ```bash
   ls -ld /App/
   ```

   **Salida:**

   ```bash
   drwxrwxrwt 2 root root 40 Jan 15 01:03 /App/
   ```

- **`drwxrwxrwt`:** *Indica que `/App` es un directorio con permisos de escritura para todos los usuarios (indicado por la `t` al final).*
- **`root root`:** *El directorio pertenece al usuario y grupo `root`.*
- **`40`:** *El tamaño del directorio en bytes.*

### **Espacio disponible en el volumen `/App`:**

   **Para probar el límite de espacio, se intenta crear un fichero grande:**

   ```bash
   head -c 1G /dev/urandom > File1Gb.txt
   ```

   **Explicación:**

- **`head`:** *Muestra las primeras líneas o bytes de un fichero o flujo de datos.*
- **`-c 1G`:** *Genera 1 GiB de datos aleatorios.*
- **`/dev/urandom`:** *Es un generador de números aleatorios proporcionado por el sistema operativo.*
- **`>`:** *Redirige la salida a un fichero.*
- **`File1Gb.txt`:** *Fichero que contendrá los datos generados.*

   **Error:**

   ```bash
   head: error writing 'standard output': No space left on device
   ```

   *El error indica que el sistema de ficheros montado en `/App` no tiene espacio suficiente para almacenar el fichero.*

---

## **Verificar el uso del sistema de ficheros**

### **Comando:**

   ```bash
   df --total --human-readable --si --sync --portability --print-type
   ```

   **Opciones:**

- **`--total`:** *Muestra un resumen al final con el total de todas las entradas.*
- **`--human-readable`:** *Presenta los tamaños en un formato legible (MB, GB).*
- **`--si`:** *Usa múltiplos de 1000 en lugar de 1024.*
- **`--sync`:** *Sincroniza las estadísticas del sistema de ficheros antes de mostrarlas.*
- **`--portability`:** *Usa un formato portátil compatible con POSIX.*
- **`--print-type`:** *Muestra el tipo del sistema de ficheros.*

   **Salida:**

   ```bash
   df --total --human-readable --si --sync --portability --print-type
   Filesystem     Type     Size  Used Avail Use% Mounted on
   overlay        overlay  118G   14G   98G  13% /
   tmpfs          tmpfs     68M     0   68M   0% /dev
   shm            tmpfs     68M     0   68M   0% /dev/shm
   tmpfs          tmpfs    105M  105M     0 100% /App
   /dev/sda5      ext4     118G   14G   98G  13% /etc/hosts
   tmpfs          tmpfs    4.2G     0  4.2G   0% /proc/asound
   tmpfs          tmpfs    4.2G     0  4.2G   0% /proc/acpi
   tmpfs          tmpfs    4.2G     0  4.2G   0% /proc/scsi
   tmpfs          tmpfs    4.2G     0  4.2G   0% /sys/firmware
   tmpfs          tmpfs    4.2G     0  4.2G   0% /sys/devices/virtual/powercap
   total          -        256G   28G  217G  12% -
   ```

- **`tmpfs          tmpfs    105M  105M     0 100% /App`:** *El volumen `/App` es un sistema de ficheros temporal (`tmpfs`) con 105 MB de tamaño total, que ya está lleno.*

---

## **Verificamos el peso del fichero**

```bash
du File1Gb.txt -sh
```

### **Desglose:**

1. **`du`:**
   - *Comando utilizado para mostrar el uso del disco por ficheros o directorios.*

2. **`File1Gb.txt`:**
   - *Especifica el fichero cuyo tamaño se desea verificar.*

3. **`-s`:**
   - *Muestra únicamente el tamaño total en lugar de detallar subdirectorios (si los hubiera).*

4. **`-h`:**
   - *Formatea la salida en un formato legible para humanos (KB, MB, GB).*

### **Salida:**

```bash
100M    File1Gb.txt
```

- **`100M`:** *El fichero tiene un tamaño real de 100 MB en el sistema de ficheros.*
- *Esto indica que, aunque se intentó generar un fichero de 1 GiB, el sistema no pudo completarlo debido a la falta de espacio disponible en el volumen `/App`.*

---

## **Borramos el fichero**

```bash
rm File1Gb.txt
```

1. **`rm`:**
   - *Elimina ficheros o directorios especificados.*

2. **`File1Gb.txt`:**
   - *Fichero que se desea borrar.*

### **Resultado:**

- *El fichero `File1Gb.txt` se elimina del sistema de ficheros montado en `/App`.*
- *Esto libera el espacio que ocupaba en el volumen `tmpfs` y permite crear nuevos ficheros sin exceder los límites de espacio disponibles.*

- **Nota:** *Este proceso es crucial para gestionar eficientemente el espacio limitado en sistemas de ficheros temporales (`tmpfs`).*

---

## **Crear un fichero más pequeño:**

   ```bash
   head -c 90M /dev/urandom > File99Megabytes.txt
   ```

- *Se genera un fichero de 90 MB sin problemas.*

   **Verificar tamaño:**

   ```bash
   du File99Megabytes.txt -sh
   ```

   **Salida:**

   ```bash
   90M    File99Megabytes.txt
   ```

   **Nuevo uso del sistema de ficheros:**

   ```bash
   df --total --human-readable --si --sync --portability --print-type
   ```

   **Salida:**

   ```bash
   Filesystem     Type     Size  Used Avail Use% Mounted on
   overlay        overlay  118G   14G   98G  13% /
   tmpfs          tmpfs     68M     0   68M   0% /dev
   shm            tmpfs     68M     0   68M   0% /dev/shm
   tmpfs          tmpfs    105M   95M   11M  90% /App
   /dev/sda5      ext4     118G   14G   98G  13% /etc/hosts
   tmpfs          tmpfs    4.2G     0  4.2G   0% /proc/asound
   tmpfs          tmpfs    4.2G     0  4.2G   0% /proc/acpi
   tmpfs          tmpfs    4.2G     0  4.2G   0% /proc/scsi
   tmpfs          tmpfs    4.2G     0  4.2G   0% /sys/firmware
   tmpfs          tmpfs    4.2G     0  4.2G   0% /sys/devices/virtual/powercap
   total          -        256G   28G  217G  12% -
   ```

   ```bash
   tmpfs          tmpfs    105M   95M   11M  90% /App
   ```

   *Quedan 11 MB disponibles.*

   **Resumen**

*El volumen montado en `/App` utiliza un sistema de ficheros `tmpfs` con un límite de espacio de 105 MB. Este límite es la razón por la que el fichero de 1 GiB no pudo crearse. Al borrar ficheros o reducir el tamaño de los nuevos ficheros generados, es posible utilizar eficientemente el espacio disponible dentro del volumen.*

- **Borramos Fichero**

```bash
rm File99Megabytes.txt
```

---

## **Crear un fichero de 100 MB**

```bash
head --bytes 100M /dev/urandom > File100Megabytes.txt
```

### **Desglose del comando:**

1. **`head`:**  
   - *Comando que muestra las primeras líneas o bytes de un fichero o flujo de datos.*

2. **`--bytes 100M`:**  
   - *Especifica que se desean los primeros 100 MB de datos generados aleatoriamente.*

3. **`/dev/urandom`:**  
   - *Fichero especial que genera datos aleatorios, utilizado como fuente para la creación del fichero.*

4. **`>`:**  
   - *Redirige la salida de los datos aleatorios hacia un fichero en el sistema.*

5. **`File100Megabytes.txt`:**  
   - *Fichero de salida que contendrá los 100 MB de datos aleatorios generados.*

---

### **Verificar el tamaño del fichero**

```bash
du File100Megabytes.txt -sh
```

```bash
100M    File100Megabytes.txt
```

#### **Interpretación:**

- **`100M`:**  
  *El fichero tiene un tamaño de 100 MB, como se esperaba.*

```bash
df --total --human-readable --si --sync --portability --print-type
```

### **Opciones:**

- **`--total`:** *Muestra un resumen con el total de todas las entradas de uso de disco.*
- **`--human-readable`:** *Presenta los tamaños en un formato legible para humanos (ej., MB, GB).*
- **`--si`:** *Usa múltiplos de 1000 en lugar de 1024.*
- **`--sync`:** *Sincroniza las estadísticas del sistema de ficheros antes de mostrarlas.*
- **`--portability`:** *Muestra los resultados de manera compatible con POSIX.*
- **`--print-type`:** *Muestra el tipo del sistema de ficheros.*

```bash
Filesystem     Type     Size  Used Avail Use% Mounted on
overlay        overlay  118G   14G   98G  13% /
tmpfs          tmpfs     68M     0   68M   0% /dev
shm            tmpfs     68M     0   68M   0% /dev/shm
tmpfs          tmpfs    105M  105M     0 100% /App
/dev/sda5      ext4     118G   14G   98G  13% /etc/hosts
tmpfs          tmpfs    4.2G     0  4.2G   0% /proc/asound
tmpfs          tmpfs    4.2G     0  4.2G   0% /proc/acpi
tmpfs          tmpfs    4.2G     0  4.2G   0% /proc/scsi
tmpfs          tmpfs    4.2G     0  4.2G   0% /sys/firmware
tmpfs          tmpfs    4.2G     0  4.2G   0% /sys/devices/virtual/powercap
total          -        256G   28G  217G  12% -
```

- **`tmpfs          tmpfs    105M  105M     0 100% /App`:**  
  *El volumen `/App` está lleno al 100% con un tamaño total de 105 MB y 0 MB disponibles.*

---

## **Intentar crear un fichero de 80 MB**

```bash
head --bytes 80M /dev/urandom > File80Megabytes.txt
```

```bash
head: error writing 'standard output': No space left on device
```

- **Error:**  
  *El error indica que no hay espacio suficiente en el volumen `/App` para escribir los 80 MB del fichero.*  
  *Este error ocurre porque el sistema de ficheros en `/App` (un `tmpfs` de 105 MB) está completamente lleno, lo que impide la creación de ficheros adicionales.*

---

## **Verificar ficheros en el directorio**

```bash
ls
```

```bash
File100Megabytes.txt  File80Megabytes.txt
```

- *Aparecen los dos ficheros: `File100Megabytes.txt` (el fichero de 100 MB creado exitosamente) y `File80Megabytes.txt` (que no se pudo crear debido a la falta de espacio).*

---

## **Verificar tamaño del fichero de 80 MB**

```bash
du -sh File80Megabytes.txt
```

```bash
0       File80Megabytes.txt
```

- **`0`:**  
  *El fichero `File80Megabytes.txt` no tiene tamaño porque no pudo ser creado debido a la falta de espacio en el volumen montado en `/App`.*

- **Resumen**

- *El volumen `/App` tiene un tamaño limitado a 105 MB (como un `tmpfs`), y ya está completamente lleno. Esto impide la creación de ficheros adicionales que excedan el espacio disponible.*
- *El fichero de 100 MB se creó con éxito, pero cuando se intentó crear uno de 80 MB, el sistema arrojó un error de "No space left on device".*
- *La verificación del tamaño del fichero `File80Megabytes.txt` mostró que no se había creado ningún fichero debido al error anterior.*

### **Creación de directorios sin error**

```bash
for i in $(seq 0 1 100); do mkdir -p $i; done
```

#### **Explicación del comando:**

- **`for i in $(seq 0 1 100)`:**  
  - *El comando `seq 0 1 100` genera una secuencia de números del 0 al 100, incrementando de uno en uno.*
  - *El bucle `for` recorre esta secuencia, y para cada valor de `i`, ejecuta el comando siguiente.*

- **`mkdir -p $i`:**  
  - *Crea un directorio llamado con el valor de `i` (por ejemplo, `0`, `1`, `2`, ..., `100`).*
  - **`-p`:** *Asegura que si los directorios ya existen, no se genera un error. Además, crea directorios de manera recursiva si es necesario.*

### **Comportamiento observado:**

- *Aunque el espacio en `/App` está completamente lleno, podemos crear directorios sin que el sistema devuelva un error. Esto se debe a que la creación de directorios no consume espacio en disco de la misma manera que los ficheros (que requieren almacenamiento físico de datos).*
- *Cada directorio creado tiene un tamaño mínimo en el sistema de ficheros, pero en este caso, es solo una estructura de metadatos (el espacio usado por cada directorio es muy pequeño).*

```bash
ls -lAh
total 100M
drwxr-xr-x 2 root root   40 Jan 15 03:03 0
drwxr-xr-x 2 root root   40 Jan 15 03:03 1
drwxr-xr-x 2 root root   40 Jan 15 03:03 10
drwxr-xr-x 2 root root   40 Jan 15 03:03 100
drwxr-xr-x 2 root root   40 Jan 15 03:03 11
drwxr-xr-x 2 root root   40 Jan 15 03:03 12
drwxr-xr-x 2 root root   40 Jan 15 03:03 13
drwxr-xr-x 2 root root   40 Jan 15 03:03 14
drwxr-xr-x 2 root root   40 Jan 15 03:03 15
drwxr-xr-x 2 root root   40 Jan 15 03:03 16
drwxr-xr-x 2 root root   40 Jan 15 03:03 17
drwxr-xr-x 2 root root   40 Jan 15 03:03 18
drwxr-xr-x 2 root root   40 Jan 15 03:03 19
drwxr-xr-x 2 root root   40 Jan 15 03:03 2
drwxr-xr-x 2 root root   40 Jan 15 03:03 20
drwxr-xr-x 2 root root   40 Jan 15 03:03 21
drwxr-xr-x 2 root root   40 Jan 15 03:03 22
drwxr-xr-x 2 root root   40 Jan 15 03:03 23
drwxr-xr-x 2 root root   40 Jan 15 03:03 24
drwxr-xr-x 2 root root   40 Jan 15 03:03 25
drwxr-xr-x 2 root root   40 Jan 15 03:03 26
drwxr-xr-x 2 root root   40 Jan 15 03:03 27
drwxr-xr-x 2 root root   40 Jan 15 03:03 28
drwxr-xr-x 2 root root   40 Jan 15 03:03 29
drwxr-xr-x 2 root root   40 Jan 15 03:03 3
drwxr-xr-x 2 root root   40 Jan 15 03:03 30
drwxr-xr-x 2 root root   40 Jan 15 03:03 31
drwxr-xr-x 2 root root   40 Jan 15 03:03 32
drwxr-xr-x 2 root root   40 Jan 15 03:03 33
drwxr-xr-x 2 root root   40 Jan 15 03:03 34
drwxr-xr-x 2 root root   40 Jan 15 03:03 35
drwxr-xr-x 2 root root   40 Jan 15 03:03 36
drwxr-xr-x 2 root root   40 Jan 15 03:03 37
drwxr-xr-x 2 root root   40 Jan 15 03:03 38
drwxr-xr-x 2 root root   40 Jan 15 03:03 39
drwxr-xr-x 2 root root   40 Jan 15 03:03 4
drwxr-xr-x 2 root root   40 Jan 15 03:03 40
drwxr-xr-x 2 root root   40 Jan 15 03:03 41
drwxr-xr-x 2 root root   40 Jan 15 03:03 42
drwxr-xr-x 2 root root   40 Jan 15 03:03 43
drwxr-xr-x 2 root root   40 Jan 15 03:03 44
drwxr-xr-x 2 root root   40 Jan 15 03:03 45
drwxr-xr-x 2 root root   40 Jan 15 03:03 46
drwxr-xr-x 2 root root   40 Jan 15 03:03 47
drwxr-xr-x 2 root root   40 Jan 15 03:03 48
drwxr-xr-x 2 root root   40 Jan 15 03:03 49
drwxr-xr-x 2 root root   40 Jan 15 03:03 5
drwxr-xr-x 2 root root   40 Jan 15 03:03 50
drwxr-xr-x 2 root root   40 Jan 15 03:03 51
drwxr-xr-x 2 root root   40 Jan 15 03:03 52
drwxr-xr-x 2 root root   40 Jan 15 03:03 53
drwxr-xr-x 2 root root   40 Jan 15 03:03 54
drwxr-xr-x 2 root root   40 Jan 15 03:03 55
drwxr-xr-x 2 root root   40 Jan 15 03:03 56
drwxr-xr-x 2 root root   40 Jan 15 03:03 57
drwxr-xr-x 2 root root   40 Jan 15 03:03 58
drwxr-xr-x 2 root root   40 Jan 15 03:03 59
drwxr-xr-x 2 root root   40 Jan 15 03:03 6
drwxr-xr-x 2 root root   40 Jan 15 03:03 60
drwxr-xr-x 2 root root   40 Jan 15 03:03 61
drwxr-xr-x 2 root root   40 Jan 15 03:03 62
drwxr-xr-x 2 root root   40 Jan 15 03:03 63
drwxr-xr-x 2 root root   40 Jan 15 03:03 64
drwxr-xr-x 2 root root   40 Jan 15 03:03 65
drwxr-xr-x 2 root root   40 Jan 15 03:03 66
drwxr-xr-x 2 root root   40 Jan 15 03:03 67
drwxr-xr-x 2 root root   40 Jan 15 03:03 68
drwxr-xr-x 2 root root   40 Jan 15 03:03 69
drwxr-xr-x 2 root root   40 Jan 15 03:03 7
drwxr-xr-x 2 root root   40 Jan 15 03:03 70
drwxr-xr-x 2 root root   40 Jan 15 03:03 71
drwxr-xr-x 2 root root   40 Jan 15 03:03 72
drwxr-xr-x 2 root root   40 Jan 15 03:03 73
drwxr-xr-x 2 root root   40 Jan 15 03:03 74
drwxr-xr-x 2 root root   40 Jan 15 03:03 75
drwxr-xr-x 2 root root   40 Jan 15 03:03 76
drwxr-xr-x 2 root root   40 Jan 15 03:03 77
drwxr-xr-x 2 root root   40 Jan 15 03:03 78
drwxr-xr-x 2 root root   40 Jan 15 03:03 79
drwxr-xr-x 2 root root   40 Jan 15 03:03 8
drwxr-xr-x 2 root root   40 Jan 15 03:03 80
drwxr-xr-x 2 root root   40 Jan 15 03:03 81
drwxr-xr-x 2 root root   40 Jan 15 03:03 82
drwxr-xr-x 2 root root   40 Jan 15 03:03 83
drwxr-xr-x 2 root root   40 Jan 15 03:03 84
drwxr-xr-x 2 root root   40 Jan 15 03:03 85
drwxr-xr-x 2 root root   40 Jan 15 03:03 86
drwxr-xr-x 2 root root   40 Jan 15 03:03 87
drwxr-xr-x 2 root root   40 Jan 15 03:03 88
drwxr-xr-x 2 root root   40 Jan 15 03:03 89
drwxr-xr-x 2 root root   40 Jan 15 03:03 9
drwxr-xr-x 2 root root   40 Jan 15 03:03 90
drwxr-xr-x 2 root root   40 Jan 15 03:03 91
drwxr-xr-x 2 root root   40 Jan 15 03:03 92
drwxr-xr-x 2 root root   40 Jan 15 03:03 93
drwxr-xr-x 2 root root   40 Jan 15 03:03 94
drwxr-xr-x 2 root root   40 Jan 15 03:03 95
drwxr-xr-x 2 root root   40 Jan 15 03:03 96
drwxr-xr-x 2 root root   40 Jan 15 03:03 97
drwxr-xr-x 2 root root   40 Jan 15 03:03 98
drwxr-xr-x 2 root root   40 Jan 15 03:03 99
-rw-r--r-- 1 root root 100M Jan 15 02:59 File100Megabytes.txt
-rw-r--r-- 1 root root    0 Jan 15 03:00 File80Megabytes.txt
```

---

### **Eliminar los directorios creados**

```bash
for i in $(seq 0 1 100); do rmdir $i; done
```

- **`rmdir $i`:**  
  - *El comando `rmdir` elimina un directorio vacío. Este comando solo tiene efecto si el directorio está vacío; si contiene ficheros o subdirectorios, el comando falla.*

- *Los directorios creados anteriormente (del `0` al `100`) se eliminan correctamente con el comando `rmdir`, ya que están vacíos.*

---

### **Verificación de espacio en el host**

```bash
docker volume inspect --format "{{.Mountpoint}}" custom-volume
```

- **`docker volume inspect --format "{{.Mountpoint}}" custom-volume`:**  
  - *Este comando se usa para inspeccionar un volumen Docker específico (`custom-volume`) y extraer la información del punto de montaje del volumen.*
  - **`--format "{{.Mountpoint}}"`:** *Indica que solo se debe devolver la ubicación del punto de montaje del volumen, lo cual es útil para luego operar con este directorio.*

### **Comando adicional para listar ficheros:**

```bash
docker volume inspect -f"{{.Mountpoint}}" custom-volume | xargs sudo lsd -lA
```

- **`xargs`:**  
  - *`xargs` es una utilidad en Linux que toma la salida de un comando y la pasa como argumento a otro comando.*
  - *En este caso, `xargs` recibe la ruta del punto de montaje del volumen y la pasa como argumento a `sudo lsd -lA`.*

- **`sudo lsd -lA`:**  
  - *`lsd` es un comando similar a `ls` pero con una interfaz más avanzada y colores, que se usa para listar los ficheros y directorios.*
  - *`-l` muestra los detalles de los ficheros (como permisos, propietario, tamaño y fecha).*
  - *`-A` muestra todos los ficheros, incluyendo los ocultos, excepto `.` y `..`.*

### **¿Por qué usamos `xargs`?**

- **Uso de `xargs`:**  
  *- El comando `docker volume inspect` devuelve el punto de montaje como una cadena, pero `lsd -lA` requiere que se le pase esta cadena como un argumento para indicar en qué directorio listar los ficheros.*
  - **`xargs`** *es necesario para transformar esta salida de una línea en un argumento para el siguiente comando.*

### **¿Qué pasa si no usamos `xargs`?**

- *Si no usamos `xargs`, el comando **`lsd -lA`** no recibirá la ruta como argumento y probablemente producirá un error o no funcionará como se espera. Esto se debe a que `lsd` esperaría recibir el directorio a listar directamente, pero sin `xargs`, solo recibiría la cadena de texto (el punto de montaje) sin saber qué hacer con ella.*
  
  **Ejemplo sin `xargs`:**

  ```bash
  docker volume inspect -f"{{.Mountpoint}}" custom-volume | sudo lsd -lA
  ```

  - *Este comando no tendría un argumento para `lsd` y no listaría el contenido correctamente.*
  
  ```bash
  .rw------- d4nitrix13 d4nitrix13 264 KB Tue Jan 14 21:12:29 2025  .bash_history
  .rw-r--r-- d4nitrix13 d4nitrix13 220 B  Sun Mar 31 02:41:03 2024  .bash_logout
  .rw-r--r-- d4nitrix13 d4nitrix13 5.5 KB Thu Dec 26 17:48:48 2024  .bashrc
  drwxrwxr-x d4nitrix13 d4nitrix13 4.0 KB Tue Jan 14 20:17:15 2025  .cache
  drwxrwxr-x d4nitrix13 d4nitrix13 4.0 KB Sun Nov 17 20:28:02 2024  .cargo
  drwxr-xr-x d4nitrix13 d4nitrix13 4.0 KB Mon Nov 18 17:10:04 2024  .config
  .rw-r--r-- d4nitrix13 d4nitrix13  41 B  Sat Nov 16 12:33:08 2024  .dmrc
  drwx------ d4nitrix13 d4nitrix13 4.0 KB Fri Jan 10 17:12:41 2025  .docker
  drwxrwxr-x d4nitrix13 d4nitrix13 4.0 KB Sat Nov 16 14:18:19 2024  .dotnet
  .rwxr-xr-x d4nitrix13 d4nitrix13 1.9 KB Sat Nov 16 15:28:58 2024  .gitconfig
  drwx------ d4nitrix13 d4nitrix13 4.0 KB Wed Dec 11 12:04:24 2024  .gnupg
  .rw------- d4nitrix13 d4nitrix13   0 B  Sat Nov 16 12:33:10 2024  .ICEauthority
  .rw------- d4nitrix13 d4nitrix13  20 B  Sun Jan 12 18:08:56 2025  .lesshst
  drwx------ d4nitrix13 d4nitrix13 4.0 KB Sat Nov 16 16:06:07 2024  .local
  drwxrwxr-x d4nitrix13 d4nitrix13 4.0 KB Sat Nov 16 15:32:41 2024  .luaenv
  .rwxr-xr-x d4nitrix13 d4nitrix13 3.4 KB Sat Nov 16 15:28:58 2024  .nanorc
  drwxrwxr-x d4nitrix13 d4nitrix13 4.0 KB Sat Nov 16 16:06:43 2024  .npm
  drwxrwxr-x d4nitrix13 d4nitrix13 4.0 KB Sun Nov 17 20:00:17 2024  .oh-my-bash
  drwxrwxr-x d4nitrix13 d4nitrix13 4.0 KB Sun Nov 17 20:00:10 2024  .oh-my-zsh
  .rw-rw-r-- d4nitrix13 d4nitrix13  17 B  Sat Jan 11 19:43:08 2025  .osh-update
  .rwxr-xr-x d4nitrix13 d4nitrix13  89 KB Sat Nov 16 15:28:58 2024  .p10k.zsh
  .rw-r--r-- d4nitrix13 d4nitrix13 321 B  Sat Nov 16 12:33:08 2024  .pam_environment
  .rw-rw-r-- d4nitrix13 d4nitrix13 116 B  Sat Nov 16 14:49:00 2024  .pearrc
  .rw------- d4nitrix13 d4nitrix13 2.0 KB Thu Jan  9 14:33:27 2025  .php_history
  drwxr-xr-x d4nitrix13 d4nitrix13 4.0 KB Sat Nov 16 14:52:51 2024  .phpbrew
  drwx------ d4nitrix13 d4nitrix13 4.0 KB Sat Nov 16 13:56:02 2024  .pki
  .rw-r--r-- d4nitrix13 d4nitrix13 829 B  Sat Nov 16 15:28:58 2024  .profile
  .rwxr-xr-x d4nitrix13 d4nitrix13 360 B  Sat Nov 16 15:28:58 2024  .pypirc
  .rw------- d4nitrix13 d4nitrix13 1.0 KB Sun Jan 12 18:44:11 2025  .python_history
  drwxrwxr-x d4nitrix13 d4nitrix13 4.0 KB Sat Nov 16 14:20:46 2024  .rustup
  .rw-rw-r-- d4nitrix13 d4nitrix13   0 B  Sat Nov 16 15:29:10 2024  .sdirs
  drwxrwxr-x d4nitrix13 d4nitrix13 4.0 KB Sat Nov 16 15:15:39 2024  .sdkman
  drwxrwxr-x d4nitrix13 d4nitrix13 4.0 KB Mon Nov 18 15:10:34 2024  .sqlsecrets
  drwx------ d4nitrix13 d4nitrix13 4.0 KB Mon Nov 25 18:02:16 2024  .ssh
  .rw-r--r-- d4nitrix13 d4nitrix13   0 B  Sat Nov 16 12:42:04 2024  .sudo_as_admin_successful
  drwxrwxr-x d4nitrix13 d4nitrix13 4.0 KB Sat Nov 16 18:30:53 2024  .tmux
  drwxrwxr-x d4nitrix13 d4nitrix13 4.0 KB Sat Nov 16 13:56:09 2024  .vscode
  .rw-rw-r-- d4nitrix13 d4nitrix13 271 B  Sun Jan 12 17:30:15 2025  .wget-hsts
  .rw------- d4nitrix13 d4nitrix13  69 B  Tue Jan 14 15:18:13 2025  .Xauthority
  .rw-r--r-- d4nitrix13 d4nitrix13 1.6 KB Fri Feb 23 06:17:45 2024  .Xdefaults
  .rw-r--r-- d4nitrix13 d4nitrix13  14 B  Fri Feb 23 06:17:45 2024  .xscreensaver
  .rw------- d4nitrix13 d4nitrix13 7.0 KB Tue Jan 14 18:29:04 2025  .xsession-errors
  .rw------- d4nitrix13 d4nitrix13 5.1 KB Tue Jan 14 09:16:30 2025 󰁯 .xsession-errors.old
  .rw-rw-r-- d4nitrix13 d4nitrix13  48 KB Mon Nov 18 14:34:18 2024  .zcompdump
  .rwxr-xr-x d4nitrix13 d4nitrix13 2.0 KB Sat Dec  7 22:26:22 2024  .zoxide.nu
  .rw------- d4nitrix13 d4nitrix13 207 KB Tue Jan 14 20:57:16 2025  .zsh_history
  .rw-rw-r-- d4nitrix13 d4nitrix13 6.7 KB Thu Jan  9 12:01:54 2025  .zshrc
  drwxrwxr-x d4nitrix13 d4nitrix13 4.0 KB Sat Jan 11 19:18:31 2025  BackupPassword
  drwxrwxr-x d4nitrix13 d4nitrix13 4.0 KB Sat Dec 21 12:39:48 2024  Code
  drwxr-xr-x d4nitrix13 d4nitrix13 4.0 KB Fri Jan 10 20:43:36 2025  Descargas
  drwxr-xr-x d4nitrix13 d4nitrix13 4.0 KB Tue Dec 24 21:25:59 2024  Documentos
  drwxr-xr-x d4nitrix13 d4nitrix13 4.0 KB Sat Jan 11 19:18:34 2025  Escritorio
  drwxr-xr-x d4nitrix13 d4nitrix13 4.0 KB Fri Jan 10 20:46:45 2025  Imágenes
  drw-r-xr-x d4nitrix13 d4nitrix13 4.0 KB Sat Nov 16 12:33:10 2024  Música
  drwxrwxr-x d4nitrix13 d4nitrix13 4.0 KB Sat Nov 16 16:02:10 2024  Notes
  drwxr-xr-x d4nitrix13 d4nitrix13 4.0 KB Sat Nov 16 12:33:12 2024  Plantillas
  drwxr-xr-x d4nitrix13 d4nitrix13 4.0 KB Sat Nov 16 12:33:10 2024  Público
  .rw-rw-r-- d4nitrix13 d4nitrix13 266 B  Tue Nov 26 19:10:30 2024  script.sh
  drwxrwxr-x d4nitrix13 d4nitrix13 4.0 KB Mon Dec  2 12:02:41 2024  Scripts
  .rwxrw-r-- d4nitrix13 d4nitrix13 786 B  Thu Dec  5 15:28:37 2024  server.sh
  drwx------ d4nitrix13 d4nitrix13 4.0 KB Mon Dec  2 21:59:18 2024  snap
  drwxr-xr-x d4nitrix13 d4nitrix13 4.0 KB Sat Nov 16 12:33:10 2024  Vídeos
  .rwxrw-r-- d4nitrix13 d4nitrix13 169 B  Fri Nov 22 21:52:10 2024  while.sh
  ```

- **Resumen**

1. **Creación de directorios:**  
   *Aunque el espacio en el volumen `/App` está lleno, la creación de directorios no falla porque no consume espacio significativo.*

2. **Eliminación de directorios:**  
   *Los directorios creados se pueden eliminar con `rmdir` sin problemas.*

3. **Uso de `xargs`:**  
   *`xargs` es necesario para pasar la salida del comando `docker volume inspect` como argumento a `lsd`. Sin `xargs`, el comando `lsd` no tendría el argumento correcto y fallaría.*

### **Explicación técnica del flujo de comandos**

#### **Pasos previos:**

1. **Comando:**

   ```bash
   echo "$(docker volume inspect -f"{{.Mountpoint}}" custom-volume)"
   ```

   - **`docker volume inspect -f"{{.Mountpoint}}" custom-volume`:**  
     - *Este comando obtiene la ubicación del volumen `custom-volume`. La opción `-f "{{.Mountpoint}}"` extrae solo el punto de montaje del volumen.*
   - **`echo "$( ... )"`:**  
     - *La salida del comando anterior se pasa a `echo`, que la imprime en la consola.*  
     **Resultado: `/var/lib/docker/volumes/custom-volume/_data`.**

2. **Cambio de usuario a `root`:**

   ```bash
   su -
   ```

   - **`su`:**  
     - *El comando `su` cambia el usuario en la terminal a otro usuario. En este caso, `-` se usa para iniciar una sesión de `root` de manera completamente nueva, lo que también cambia el entorno (como las variables de entorno y el directorio de trabajo).*

3. **Comando para navegar al directorio del volumen:**

   ```bash
   cd /var/lib/docker/volumes/custom-volume/_data/
   ```

   - **`cd`:**  
     - *Este comando cambia el directorio de trabajo a la ruta del volumen que contiene los ficheros. Al ejecutar esto, nos situamos en el directorio de datos donde están los ficheros que hemos creado previamente.*

   - **Listamos**

   ```bash
   ls -lh
   total 100M
   -rw-r--r-- 1 root root 100M ene 14 19:24 File100Megabytes.txt
   -rw-r--r-- 1 root root    0 ene 14 19:36 File1Gigabyte.txt
   -rw-r--r-- 1 root root    0 ene 14 19:26 File80Megabytes.txt
   ```

---

### **Problema con la creación de ficheros**

- **Comando:**

   ```bash
   head -c 1G /dev/urandom > File1Gigabyte.txt
   ```

   ```bash
   head: error al escribir en 'standard output': No queda espacio en el dispositivo
   ```

  - **`head -c 1G /dev/urandom`:**  
    - *Este comando lee 1 GB de datos aleatorios de `/dev/urandom` (una fuente de datos aleatorios generada por el sistema) y los escribe en el fichero `File1Gigabyte.txt`.*
  - **Error recibido:**  
    - *El error "No queda espacio en el dispositivo" ocurre porque el sistema de ficheros de `docker` que está montado en `/var/lib/docker/volumes/custom-volume/_data` tiene un espacio limitado y ya está completamente lleno (100% de uso).*

---

### **Comando para revisar el espacio de disco**

- **Comando:**

   ```bash
   df --total --human-readable --si --sync --portability --print-type
   ```

  - **`df`:**  
    - *Muestra el uso del espacio en disco de los sistemas de ficheros montados en el sistema.*
  - **Opciones utilizadas:**
    - `--total`: *Muestra el total al final del informe.*
    - `--human-readable`: *Muestra las unidades de tamaño en formato legible para el humano (por ejemplo, GB, MB).*
    - `--si`: *Usa potencias de 1000 (como 1K = 1000 bytes en lugar de 1024 bytes).*
    - `--sync`: *Realiza un sincronizado previo del sistema de ficheros antes de mostrar el uso.*
    - `--portability`: *Asegura que la salida sea compatible entre diferentes sistemas.*
    - `--print-type`: *Muestra el tipo de cada sistema de ficheros.*

   **Resultado de `df`:**

   ```bash
   S.ficheros     Tipo     Tamaño Usados  Disp Uso% Montado en
   tmpfs          tmpfs      824M   2,3M  822M   1% /run
   /dev/sda5      ext4       118G    14G   98G  13% /
   tmpfs          tmpfs      4,2G    25M  4,1G   1% /dev/shm
   tmpfs          tmpfs      5,3M    13k  5,3M   1% /run/lock
   efivarfs       efivarfs   132k    72k   55k  57% /sys/firmware/efi/efivars
   /dev/sda1      vfat       101M    33M   68M  33% /boot/efi
   /dev/sda6      ext4       114G    24G   85G  22% /home
   tmpfs          tmpfs      824M   2,7M  821M   1% /run/user/1000
   overlay        overlay    118G    14G   98G  13% /var/lib/docker/overlay2/7bf5658ea49df3d7332533c70b9b66c1b14548850eabb7c4e108b26fa7e5131f/merged
   overlay        overlay    118G    14G   98G  13% /var/lib/docker/overlay2/a7c4831ec61e5073ae4f1021b3cfa024e89e0973772d318a6f5f0e6027e85c89/merged
   tmpfs          tmpfs      105M   105M     0 100% /var/lib/docker/volumes/custom-volume/_data
   total          -          473G    66G  384G  15% -
   ```

   ```bash
   tmpfs          tmpfs      105M   105M     0 100% /var/lib/docker/volumes/custom-volume/_data
   ```

  - **`tmpfs`:**  
    - *`tmpfs` es un sistema de ficheros temporal que se monta en memoria. Es volátil, lo que significa que su contenido se pierde al reiniciar.*
    - *En este caso, `tmpfs` se usa como un sistema de ficheros temporal montado en `/var/lib/docker/volumes/custom-volume/_data`. Aunque se está usando 105 MB del espacio, este espacio es volátil y se pierde si se reinicia el contenedor o el host. El `100%` indica que todo el espacio de `tmpfs` está ocupado y no se puede escribir más datos.*

---

### **Explicación técnica sobre el uso de `tmpfs` por Docker**

- **Docker y `tmpfs`:**
  - *Cuando Docker monta un volumen, puede usar diferentes tipos de sistemas de ficheros, y uno de ellos es `tmpfs`. El uso de `tmpfs` es común cuando el volumen necesita ser utilizado como un espacio en memoria para datos temporales y de corta duración.*
  - *En este caso, **`tmpfs`** se monta en el directorio **`/var/lib/docker/volumes/custom-volume/_data`** y tiene un tamaño de **105 MB**.*
  - ***`tmpfs` se llena rápidamente** porque se usa como almacenamiento en memoria y es volátil. Si se intentan agregar más datos una vez que está lleno, se obtiene el error de "No queda espacio en el dispositivo". Esto explica por qué no se puede crear el fichero de 1 GB, ya que el espacio ya está lleno y no se puede usar más memoria temporal.*
  
- **La naturaleza volátil de `tmpfs`:**
  - *Los sistemas de ficheros de tipo `tmpfs` no almacenan datos de manera persistente. El contenido de este tipo de sistema de ficheros se pierde al reiniciar el contenedor o el sistema, lo que lo hace adecuado solo para almacenamiento temporal o cachés, pero no para datos persistentes.*

---

### **Resumen del problema y la solución**

- **Problema:**  
  - *Docker utiliza `tmpfs` para almacenar los datos del volumen en memoria. El volumen está completamente lleno, por lo que se genera el error "No queda espacio en el dispositivo".*
  
- **Solución:**  
  - *Para resolver este problema, sería necesario liberar espacio dentro del volumen `tmpfs` o aumentar el tamaño del mismo. También puede ser necesario revisar si el uso de `tmpfs` es adecuado para los datos que se están manejando, ya que no es un sistema persistente.*

#### **Crear directorios en el host**

1. **Comando para crear directorios:**

   ```bash
   for i in $(seq 0 1 100); do mkdir -p $i; done;
   ```

   - **`for i in $(seq 0 1 100)`:**  
     - *Genera una secuencia de números del 0 al 100 utilizando `seq` y los recorre con el bucle `for`.*  
   - **`mkdir -p $i`:**  
     - *Crea un directorio para cada número en la secuencia, usando la opción `-p` para crear directorios padres si es necesario (en este caso, crea directorios vacíos sin generar errores si ya existen).*
  
   **Resultado:**
   *Se crean 101 directorios numerados del `0` al `100`.*

2. **Verificación de directorios creados:**

   ```bash
   ls -lAh
   ```

   - **`ls -lAh`:**  
     - *Muestra los ficheros y directorios en el directorio actual con detalles, como permisos, propietario, tamaño, etc.*
   - **Resultado:**
     *Se observa la lista de directorios creados y algunos ficheros adicionales.*

   ```bash
   ls -lAh
   total 100M
   drwxr-xr-x 2 root root   40 Jan 15 03:03 0
   drwxr-xr-x 2 root root   40 Jan 15 03:03 1
   drwxr-xr-x 2 root root   40 Jan 15 03:03 10
   drwxr-xr-x 2 root root   40 Jan 15 03:03 100
   drwxr-xr-x 2 root root   40 Jan 15 03:03 11
   drwxr-xr-x 2 root root   40 Jan 15 03:03 12
   drwxr-xr-x 2 root root   40 Jan 15 03:03 13
   drwxr-xr-x 2 root root   40 Jan 15 03:03 14
   drwxr-xr-x 2 root root   40 Jan 15 03:03 15
   drwxr-xr-x 2 root root   40 Jan 15 03:03 16
   drwxr-xr-x 2 root root   40 Jan 15 03:03 17
   drwxr-xr-x 2 root root   40 Jan 15 03:03 18
   drwxr-xr-x 2 root root   40 Jan 15 03:03 19
   drwxr-xr-x 2 root root   40 Jan 15 03:03 2
   drwxr-xr-x 2 root root   40 Jan 15 03:03 20
   drwxr-xr-x 2 root root   40 Jan 15 03:03 21
   drwxr-xr-x 2 root root   40 Jan 15 03:03 22
   drwxr-xr-x 2 root root   40 Jan 15 03:03 23
   drwxr-xr-x 2 root root   40 Jan 15 03:03 24
   drwxr-xr-x 2 root root   40 Jan 15 03:03 25
   drwxr-xr-x 2 root root   40 Jan 15 03:03 26
   drwxr-xr-x 2 root root   40 Jan 15 03:03 27
   drwxr-xr-x 2 root root   40 Jan 15 03:03 28
   drwxr-xr-x 2 root root   40 Jan 15 03:03 29
   drwxr-xr-x 2 root root   40 Jan 15 03:03 3
   drwxr-xr-x 2 root root   40 Jan 15 03:03 30
   drwxr-xr-x 2 root root   40 Jan 15 03:03 31
   drwxr-xr-x 2 root root   40 Jan 15 03:03 32
   drwxr-xr-x 2 root root   40 Jan 15 03:03 33
   drwxr-xr-x 2 root root   40 Jan 15 03:03 34
   drwxr-xr-x 2 root root   40 Jan 15 03:03 35
   drwxr-xr-x 2 root root   40 Jan 15 03:03 36
   drwxr-xr-x 2 root root   40 Jan 15 03:03 37
   drwxr-xr-x 2 root root   40 Jan 15 03:03 38
   drwxr-xr-x 2 root root   40 Jan 15 03:03 39
   drwxr-xr-x 2 root root   40 Jan 15 03:03 4
   drwxr-xr-x 2 root root   40 Jan 15 03:03 40
   drwxr-xr-x 2 root root   40 Jan 15 03:03 41
   drwxr-xr-x 2 root root   40 Jan 15 03:03 42
   drwxr-xr-x 2 root root   40 Jan 15 03:03 43
   drwxr-xr-x 2 root root   40 Jan 15 03:03 44
   drwxr-xr-x 2 root root   40 Jan 15 03:03 45
   drwxr-xr-x 2 root root   40 Jan 15 03:03 46
   drwxr-xr-x 2 root root   40 Jan 15 03:03 47
   drwxr-xr-x 2 root root   40 Jan 15 03:03 48
   drwxr-xr-x 2 root root   40 Jan 15 03:03 49
   drwxr-xr-x 2 root root   40 Jan 15 03:03 5
   drwxr-xr-x 2 root root   40 Jan 15 03:03 50
   drwxr-xr-x 2 root root   40 Jan 15 03:03 51
   drwxr-xr-x 2 root root   40 Jan 15 03:03 52
   drwxr-xr-x 2 root root   40 Jan 15 03:03 53
   drwxr-xr-x 2 root root   40 Jan 15 03:03 54
   drwxr-xr-x 2 root root   40 Jan 15 03:03 55
   drwxr-xr-x 2 root root   40 Jan 15 03:03 56
   drwxr-xr-x 2 root root   40 Jan 15 03:03 57
   drwxr-xr-x 2 root root   40 Jan 15 03:03 58
   drwxr-xr-x 2 root root   40 Jan 15 03:03 59
   drwxr-xr-x 2 root root   40 Jan 15 03:03 6
   drwxr-xr-x 2 root root   40 Jan 15 03:03 60
   drwxr-xr-x 2 root root   40 Jan 15 03:03 61
   drwxr-xr-x 2 root root   40 Jan 15 03:03 62
   drwxr-xr-x 2 root root   40 Jan 15 03:03 63
   drwxr-xr-x 2 root root   40 Jan 15 03:03 64
   drwxr-xr-x 2 root root   40 Jan 15 03:03 65
   drwxr-xr-x 2 root root   40 Jan 15 03:03 66
   drwxr-xr-x 2 root root   40 Jan 15 03:03 67
   drwxr-xr-x 2 root root   40 Jan 15 03:03 68
   drwxr-xr-x 2 root root   40 Jan 15 03:03 69
   drwxr-xr-x 2 root root   40 Jan 15 03:03 7
   drwxr-xr-x 2 root root   40 Jan 15 03:03 70
   drwxr-xr-x 2 root root   40 Jan 15 03:03 71
   drwxr-xr-x 2 root root   40 Jan 15 03:03 72
   drwxr-xr-x 2 root root   40 Jan 15 03:03 73
   drwxr-xr-x 2 root root   40 Jan 15 03:03 74
   drwxr-xr-x 2 root root   40 Jan 15 03:03 75
   drwxr-xr-x 2 root root   40 Jan 15 03:03 76
   drwxr-xr-x 2 root root   40 Jan 15 03:03 77
   drwxr-xr-x 2 root root   40 Jan 15 03:03 78
   drwxr-xr-x 2 root root   40 Jan 15 03:03 79
   drwxr-xr-x 2 root root   40 Jan 15 03:03 8
   drwxr-xr-x 2 root root   40 Jan 15 03:03 80
   drwxr-xr-x 2 root root   40 Jan 15 03:03 81
   drwxr-xr-x 2 root root   40 Jan 15 03:03 82
   drwxr-xr-x 2 root root   40 Jan 15 03:03 83
   drwxr-xr-x 2 root root   40 Jan 15 03:03 84
   drwxr-xr-x 2 root root   40 Jan 15 03:03 85
   drwxr-xr-x 2 root root   40 Jan 15 03:03 86
   drwxr-xr-x 2 root root   40 Jan 15 03:03 87
   drwxr-xr-x 2 root root   40 Jan 15 03:03 88
   drwxr-xr-x 2 root root   40 Jan 15 03:03 89
   drwxr-xr-x 2 root root   40 Jan 15 03:03 9
   drwxr-xr-x 2 root root   40 Jan 15 03:03 90
   drwxr-xr-x 2 root root   40 Jan 15 03:03 91
   drwxr-xr-x 2 root root   40 Jan 15 03:03 92
   drwxr-xr-x 2 root root   40 Jan 15 03:03 93
   drwxr-xr-x 2 root root   40 Jan 15 03:03 94
   drwxr-xr-x 2 root root   40 Jan 15 03:03 95
   drwxr-xr-x 2 root root   40 Jan 15 03:03 96
   drwxr-xr-x 2 root root   40 Jan 15 03:03 97
   drwxr-xr-x 2 root root   40 Jan 15 03:03 98
   drwxr-xr-x 2 root root   40 Jan 15 03:03 99
   -rw-r--r-- 1 root root 100M Jan 15 02:59 File100Megabytes.txt
   -rw-r--r-- 1 root root    0 Jan 15 03:00 File80Megabytes.txt
   ```

- **Eliminar los directorios creados**

- **Comando para eliminar los directorios:**

   ```bash
   for i in $(seq 0 1 100); do rmdir $i; done;
   ```

  - **`rmdir $i`:**  
    - *Elimina los directorios vacíos creados anteriormente. Si algún directorio contiene ficheros o subdirectorios, no será eliminado y generará un error.*

---

#### **Uso de volúmenes temporales en Docker**

- **El volumen creado en Docker es temporal:**

  - **`tmpfs`:**  
    - *Cuando se crea un volumen de Docker usando `tmpfs`, se indica que el volumen está almacenado en memoria y es volátil. Esto significa que los datos almacenados en este volumen no persisten cuando el contenedor se detiene o se reinicia.*
    - *Esto explica que, si se detiene el contenedor, el contenido del volumen se perderá.*

---

#### **Uso de `tmux` para monitorear en tiempo real**

- **Monitorización de cambios en el volumen con `tmux`:**

  - **Panel 1:**

     ```bash
     watch -n 1 sudo lsd -lAh "$(docker volume inspect -f"{{.Mountpoint}}" custom-volume)"
     ```

    - **`watch -n 1`:**  
      - *Ejecuta el comando proporcionado cada 1 segundo.*
    - **`sudo lsd -lAh "$(docker volume inspect -f"{{.Mountpoint}}" custom-volume)"`:**  
      - *El comando `lsd` (una versión extendida de `ls`) muestra los detalles del volumen montado en el directorio especificado.*  
      - *La salida de `docker volume inspect -f "{{.Mountpoint}}" custom-volume` obtiene la ruta del volumen montado.*
    - **Resultado:**
       *Se empieza a monitorear la directorio donde está montado el volumen `custom-volume`.*

  - **Panel 2:**

     ```bash
     docker container stop --signal SIGTERM --time 10 container-volume-example
     ```

    - **`docker container stop --signal SIGTERM --time 10 container-volume-example`:**  
      - *Envía una señal `SIGTERM` al contenedor `container-volume-example` para detenerlo de manera ordenada, permitiendo 10 segundos antes de que Docker lo fuerce a detenerse si no responde a la señal.*  

  - **Monitoreo posterior al detener el contenedor:**

     *Al observar ambos paneles, en el panel 1, donde se monitorea el volumen de Docker con `watch`, se puede ver que **el volumen temporal se borra** o pierde su contenido al detener el contenedor, ya que el almacenamiento es volátil y depende de la memoria, no de un disco persistente.*

- **Resumen**

- **Volúmenes de Docker `tmpfs`:**  
  - *Usados principalmente para almacenar datos temporales en memoria, **no son persistentes** y se pierden cuando el contenedor se detiene o se reinicia.*
  
- **Uso de `tmux` y `watch`:**  
  - *Usados para monitorear en tiempo real los cambios en el volumen montado y comprobar cómo se pierde el contenido del volumen al detener el contenedor.*
  
- **Resultado esperado:**  
  - *Después de detener el contenedor, se observa que el volumen se vacía o desaparece, lo que demuestra su naturaleza temporal cuando se utiliza `tmpfs`.*

*Cuando Docker reinicia un contenedor, **por defecto**, envía una señal de terminación **`SIGTERM`** al contenedor para solicitar que termine su ejecución de manera ordenada. Después de enviar esta señal, Docker espera 10 segundos para que el contenedor se apague correctamente antes de enviar una señal de **`SIGKILL`**, que fuerza la terminación del contenedor si no responde a la primera señal.*

### ***Proceso por defecto durante el reinicio de un contenedor:***

```bash
docker container restart --help

Usage:  docker container restart [OPTIONS] CONTAINER [CONTAINER...]

Restart one or more containers

Aliases:
  docker container restart, docker restart

Options:
  -s, --signal string   Signal to send to the container
  -t, --time int        Seconds to wait before killing the container
```

1. **`SIGTERM`** *(señal de terminación):*
   - *Docker envía esta señal al contenedor para pedirle que cierre sus procesos de manera ordenada. El contenedor tiene un tiempo predeterminado para manejar esta señal y apagar todos sus servicios y procesos.*

2. **Tiempo de espera:**  
   - *Por defecto, Docker espera **10 segundos** después de enviar la señal `SIGTERM` antes de pasar al siguiente paso.*

3. **`SIGKILL`** *(señal de matar):*
   - *Si el contenedor no ha terminado su ejecución después de los 10 segundos, Docker envía la señal `SIGKILL`, que termina inmediatamente todos los procesos del contenedor de manera abrupta, sin darle oportunidad de realizar una desconexión ordenada.*

*El comportamiento predeterminado se puede modificar a través de las opciones `--stop-signal` y `--stop-timeout` cuando se crea o ejecuta un contenedor. Ejemplo:*

```bash
docker run --stop-signal SIGINT --stop-timeout 20 my-container
```

*En este ejemplo, el contenedor respondería con una señal `SIGINT` en lugar de `SIGTERM`, y Docker esperaría **20 segundos** en lugar de 10 antes de enviar el `SIGKILL`.*

- **Resumen**
- **Señal por defecto:** *`SIGTERM`.*
- **Tiempo de espera por defecto:** **10 segundos**.

### **Pasos para la prueba**

1. **Matamos el contenedor:**

   ```bash
   docker kill container-volume-example
   ```

   *Esto termina inmediatamente el contenedor, enviando una señal `SIGKILL`.*

2. **Iniciamos el contenedor nuevamente:**

   ```bash
   docker start -i container-volume-example
   ```

3. **Nos dirigimos a `/App`** *y en el panel donde tenemos el siguiente comando:*

   ```bash
   watch -n 1 sudo lsd -lAh "$(docker volume inspect -f"{{.Mountpoint}}" custom-volume)"
   ```

4. **Diferencia entre `/dev/random` y `/dev/urandom`:**

   - **`/dev/random`:**
     - *Este es un generador de números aleatorios basado en entropía del sistema. Cuando no hay suficiente entropía disponible, la lectura de `/dev/random` se bloquea hasta que haya suficiente.*
     - **Almacena:** *datos de alta calidad aleatoria.*
     - **Mejor para:** *situaciones que requieren un alto nivel de seguridad, como generación de claves criptográficas.*

   - **`/dev/urandom`:**
     *- Es similar a `/dev/random`, pero no se bloquea cuando la entropía es baja, usando un algoritmo determinista para generar números aleatorios.*
     - **Almacena:** *igualmente datos aleatorios, pero con un algoritmo de menor calidad en comparación con `/dev/random`.*
     - **Mejor para:** *usos generales donde la velocidad es más importante que la calidad de la aleatoriedad, como en procesos no criptográficos.*

   **Diferencia clave:**  
   - **`/dev/random`** *puede ser más seguro pero más lento, mientras que **`/dev/urandom`** es más rápido pero no garantiza la misma calidad de aleatoriedad en circunstancias de baja entropía.*

5. **Ejecutamos el siguiente comando para generar un fichero aleatorio:**

   ```bash
   head --bytes 100M /dev/random > File1Megabytes.txt
   ```

   **En el panel veremos la salida:**

   ```bash
   Cada 1.0s: sudo lsd -lAh /var/lib/docker/volumes/custom-volume/_data                               d4nitrix13-Inspiron-3558: Tue Jan 14 21:32:30 2025
   
   .rw-r--r-- root root 100 MB Tue Jan 14 21:31:28 2025 File1Megabytes.txt
   ```

6. **Reiniciamos el contenedor:**

   ```bash
   docker container restart --signal SIGTERM --time 10 container-volume-example
   ```

   **Esto es equivalente a:**

   ```bash
   docker restart -s SIGTERM -t 10 container-volume-example
   ```

   **También se puede escribir sin espacio:**

   ```bash
   docker restart -sSIGTERM -t10 container-volume-example
   ```

7. **Comprobamos que los datos se borraron** *en el panel, como se observa con la eliminación de los ficheros generados.*

- **Resumen:**
- *Al reiniciar el contenedor, el volumen se borra si es de tipo `tmpfs` o está configurado como un volumen temporal.*
- *Los ficheros que se habían generado previamente ya no están presentes tras el reinicio del contenedor, indicando que los datos en el volumen se han perdido.*

*Este comportamiento es esperado para volúmenes temporales (como los de tipo `tmpfs`).*

### **Eliminar volúmenes no utilizados**

```bash
docker volume prune
```

### **Si ejecutamos `docker volume prune` sin el parámetro `--force`, nos pedirá confirmación para proceder:**

```bash
docker volume prune

WARNING! This will remove anonymous local volumes not used by at least one container.
Are you sure you want to continue? [y/N]
```

```bash
docker volume prune --force

WARNING! This will remove anonymous local volumes not used by at least one container.
Are you sure you want to continue? [y/N]
```

- *Si queremos evitar la confirmación y proceder automáticamente, usamos el parámetro `--force`.*

- *Limpia todos los volúmenes "dangling" que no están asociados a contenedores.*

> [!WARNING]
> *El comando `docker volume prune` está diseñado para eliminar volúmenes que no están siendo utilizados por ningún contenedor. Sin embargo, en versiones recientes de Docker, como la 23.0, se ha observado que este comando no elimina volúmenes que no están en uso, lo que puede llevar a la acumulación de volúmenes no deseados y al llenado del espacio en disco.*

**Posibles soluciones:**

1. **Eliminar volúmenes manualmente:**
   - *Utiliza el comando `docker volume ls` para listar todos los volúmenes existentes.*
   - *Identifica los volúmenes que deseas eliminar.*
   - *Elimina los volúmenes específicos con `docker volume rm <name_volumen>`.*

2. **Actualizar Docker:**
   - *Verifica si hay actualizaciones disponibles para Docker que puedan haber solucionado este problema.*
   - *Consulta la documentación oficial o los registros de cambios para obtener información sobre correcciones relacionadas con la eliminación de volúmenes.*

3. **Revertir a una versión anterior de Docker:**
   - *Si el problema persiste y no hay una solución inmediata, considera revertir a una versión anterior de Docker donde `docker volume prune` funcione correctamente.*
   - *Ten en cuenta que esta acción puede implicar la pérdida de nuevas características o mejoras de seguridad introducidas en versiones posteriores.*

*Es importante estar al tanto de los problemas conocidos y las actualizaciones de Docker para mantener un entorno limpio y eficiente.*

### **Borramos todo para asegurarnos de que los volúmenes no tengan contenedores asociados:**

```bash
docker rm -f $(docker ps -aq)
```

### **Ahora ejecutamos el comando `docker volume prune` para eliminar los volúmenes no utilizados:**

```bash
docker volume prune --filter all=1 --force
```

**Salida esperada:**

```bash
Deleted Volumes:
my-volume

Total reclaimed space: 75B
```

### **Resumen del Problema**

- *En Docker `23.0.0`, los volúmenes **nombrados** ya no se consideran para la eliminación con `docker volume prune` o `docker system prune --volumes`, a menos que se especifique explícitamente el filtro `--all`.*
- *El comando `docker volume prune --filter all=1` se utiliza para forzar la eliminación de volúmenes **anónimos** y **nombrados** no utilizados.*
- *El cambio se introdujo para hacer que la eliminación de volúmenes sea más segura, ya que los volúmenes nombrados generalmente tienen un propósito más explícito y no se deben eliminar sin una confirmación clara.*

### **Explicación del Filtro `--filter all=1`**

- *El parámetro `--filter all=1` es utilizado para eliminar **todos** los volúmenes, incluyendo los **volúmenes nombrados**. Sin este filtro, `docker volume prune` solo elimina los volúmenes **anónimos** (es decir, aquellos que no tienen un nombre asignado).*

**En resumen:**

- **`docker volume prune`** *elimina **volúmenes anónimos** no utilizados.*
- **`docker volume prune --filter all=1`** *elimina **volúmenes nombrados y anónimos** no utilizados.*

### **Comportamiento del Comando `docker volume prune` y `docker system prune`**

- **Antes de Docker 23.0.0:** *Tanto `docker volume prune` como `docker system prune --volumes` eliminaban todos los volúmenes no utilizados, incluidos los volúmenes nombrados.*
- **En Docker 23.0.0 y versiones posteriores:** *Por defecto, `docker volume prune` solo elimina volúmenes anónimos y no considera los volúmenes nombrados para su eliminación. Esto se cambió para hacer que la operación sea más segura y menos destructiva.*

### **Razón detrás del cambio**

1. **Diferenciación entre volúmenes anónimos y nombrados:** *Los volúmenes nombrados son más fáciles de identificar y generalmente se crean con un propósito específico, lo que hace que eliminarlos accidentalmente podría causar problemas.*
2. **Seguridad:** *Hacer que `docker volume prune` elimine solo volúmenes anónimos, de forma predeterminada, evita que los usuarios borren accidentalmente volúmenes importantes que pueden estar en uso.*

### **Problema con el Volumen "custom-volume"**

*El volumen `custom-volume` no se borra porque es un **volumen nombrado**. Según el comportamiento predeterminado de Docker 23, solo los volúmenes anónimos se eliminan con `docker volume prune` sin un filtro adicional. Para eliminar volúmenes nombrados, debes usar el filtro `--filter all=1` o el comando adecuado para forzar la eliminación.*

- **El flag `all=1`:** *Este flag indica que **todos** los volúmenes, tanto anónimos como nombrados, deben ser considerados para la eliminación.*
- **Por qué no se borra `custom-volume`:** *Debido al cambio en Docker 23, los volúmenes nombrados no se eliminan por defecto con `docker volume prune`. Necesitas usar el filtro `--filter all=1` para que se eliminen.*

#### **Soluciones posibles**

1. **Para borrar el volumen `custom-volume`, puedes usar:**

   ```bash
   docker volume prune --filter all=1 --force
   ```

2. **O también puedes eliminarlo manualmente:**

   ```bash
   docker volume rm custom-volume
   ```

---

### **Conclusión**

*Docker Volumes son esenciales para gestionar datos persistentes en aplicaciones modernas. Proporcionan una solución confiable, aislada del sistema anfitrión, y flexible para diversos casos de uso.*
