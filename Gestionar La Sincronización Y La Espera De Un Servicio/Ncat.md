<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# *Para especificar el **puerto de origen** en el host al usar `nc` (Netcat), puedes utilizar la opción `-p` seguida del número del puerto deseado. Este puerto será utilizado como el puerto de origen en la conexión.*

## **Ejemplo**

**Supongamos que deseas conectarte al contenedor en el puerto `5757` desde el host y quieres que el puerto de origen sea, por ejemplo, `4000`.**

```bash
nc -p 4000 172.17.0.2 5757
```

### **Desglose**

- **`-p 4000`:** *Especifica el puerto de origen en el host como `4000`.*
- **`172.17.0.2`:** *Dirección IP del contenedor.*
- **`5757`:** *Puerto de destino en el contenedor.*

---

### **Notas importantes**

1. **Permisos del puerto:**
   - *Si seleccionas un puerto de origen **menor a 1024**, necesitarás permisos de administrador (root) para ejecutarlo. Esto se debe a las restricciones de los puertos privilegiados en sistemas Unix/Linux.*
   - *Por ejemplo, para usar el puerto `80` como origen:*

     ```bash
     sudo nc -p 80 172.17.0.2 5757
     ```

2. **Conflictos de puertos:**
   - *Asegúrate de que el puerto que especificas como origen no esté siendo utilizado por otro proceso en tu máquina host.*

    ```bash
    nc -p 3000 172.17.0.2 5757
    ```

    ```bash
    nc: bind failed: Address already in use
    ```

3. **Puerto disponible:**
   - *El puerto de origen debe estar disponible en el host. Si el puerto especificado está ocupado, Netcat mostrará un error y no podrá establecer la conexión.*

### **Verificación**

**Después de ejecutar el comando, deberías ver en el servidor (contenedor) que la conexión proviene del puerto que especificaste en el host. Por ejemplo:**

```bash
Ncat: Connection from 172.17.0.1.
Ncat: Connection from 172.17.0.1:4000.
```
