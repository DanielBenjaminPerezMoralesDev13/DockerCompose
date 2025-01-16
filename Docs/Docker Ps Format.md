# **El flag `--format` en el comando `docker ps` se utiliza para personalizar el formato de salida, permitiéndote definir qué campos mostrar y cómo presentarlos. Esto es útil cuando necesitas extraer información específica de los contenedores en un formato legible o compatible con scripts.**

## ***Sintaxis básica***

```bash
docker ps --format "Template"
```

### Uso de plantillas (`Template`)

- **El `Template` utiliza una sintaxis basada en Go, donde puedes especificar variables entre llaves (`{{}}`) para mostrar los campos disponibles. Algunas de las variables más comunes incluyen:**

- **`{{.ID}}`:** *ID del contenedor.*
- **`{{.Image}}`:** *Imagen utilizada por el contenedor.*
- **`{{.Command}}`:** *Comando ejecutado por el contenedor.*
- **`{{.CreatedAt}}`:** *Fecha y hora de creación.*
- **`{{.RunningFor}}`:** *Tiempo que lleva ejecutándose.*
- **`{{.Status}}`:** *Estado del contenedor.*
- **`{{.Ports}}`:** *Puertos expuestos.*
- **`{{.Names}}`:** *Nombre del contenedor.*
- **`{{.Labels}}`:** *Etiquetas asignadas al contenedor.*
- **`{{.Mounts}}`:** *Volúmenes montados.*

### **Ejemplos prácticos**

1. **Mostrar solo nombres de contenedores:**

   ```bash
   docker ps --format "{{.Names}}"
   ```

2. **Mostrar ID y nombre del contenedor:**

   ```bash
   docker ps --format "ID: {{.ID}} - Name: {{.Names}}"
   ```

3. **Listar contenedores con estado y puertos expuestos:**

   ```bash
   docker ps --format "Container: {{.Names}} | Status: {{.Status}} | Ports: {{.Ports}}"
   ```

4. **Combinar información en una tabla personalizada:**

   ```bash
   docker ps --format "table {{.ID}} \t {{.Image}} \t {{.Status}} \t {{.Names}}"
   ```

   *Esto crea una salida tabular con columnas alineadas, separadas por tabulaciones (`\t`).*

5. **Obtener contenedores filtrados para un script:**
   *Si quieres procesar datos en un script, puedes usar el `--format` para obtener información limpia, como IDs de contenedores:*

   ```bash
   docker ps --format "{{.ID}}" | while read id; do
       echo "Processing container $id"
   done
   ```

### ***Personalización con configuraciones predeterminadas***

- **Puedes definir una configuración predeterminada para el formato usando el fichero de configuración de Docker CLI (`~/.docker/config.json`):**

```json
{
  "psFormat": "table {{.ID}} \t {{.Image}} \t {{.Status}} \t {{.Names}}"
}
```

**Esto aplicará automáticamente el formato definido cada vez que ejecutes `docker ps`.**

### **Resumen**

**El flag `--format` es una herramienta poderosa para personalizar la salida de `docker ps`, ya sea para mejorar la legibilidad o para automatizar tareas. Usando plantillas adecuadas, puedes obtener solo la información relevante de manera eficiente.**

```bash
docker container ls --format='{{json .}}'
```

```bash
docker container ls --format='{{json .}}'
{"Command":"\"/sbin/tini -- /dock…\"","CreatedAt":"2025-01-10 21:17:36 -0600 CST","ID":"69dce10678ec","Image":"mongo-express:latest","Labels":"","LocalVolumes":"0","Mounts":"","Names":"mongo-express","Networks":"mongo-db","Ports":"0.0.0.0:8081-\u003e8081/tcp, :::8081-\u003e8081/tcp","RunningFor":"19 minutes ago","Size":"0B (virtual 182MB)","State":"running","Status":"Up 19 minutes"}
{"Command":"\"docker-entrypoint.s…\"","CreatedAt":"2025-01-10 21:01:39 -0600 CST","ID":"d77045edba3a","Image":"mongo","Labels":"org.opencontainers.image.ref.name=ubuntu,org.opencontainers.image.version=24.04","LocalVolumes":"2","Mounts":"7db8f504bf104f…,56356795a264f1…","Names":"mongodb","Networks":"mongo-db","Ports":"0.0.0.0:27017-\u003e27017/tcp, :::27017-\u003e27017/tcp","RunningFor":"35 minutes ago","Size":"0B (virtual 855MB)","State":"running","Status":"Up 35 minutes"}
```
