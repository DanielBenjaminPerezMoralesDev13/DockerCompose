<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# **Docker Compose**

*[Docker Compose](https://docs.docker.com/reference/cli/docker/compose/ "https://docs.docker.com/reference/cli/docker/compose/")*
*![PartsAplication](/Images/PartsAplication.png "/Images/PartsAplication.png")*
*![Micro Servicio](/Images/Micro%20Servicios%20App.png "/Images/Micro%20Servicios%20App.png")*
*![Compose Micro Servicio](/Images/Docker%20Compose%20Micro%20Servicios.png "/Images/Docker%20Compose%20Micro%20Servicios.png")*
*![Multi Container Docker](/Images/Multi%20Container%20Docker%20Aplicacion.png "/Images/Multi%20Container%20Docker%20Aplicacion.png")*

- *Docker Compose es una herramienta de Docker que permite definir y ejecutar aplicaciones con múltiples contenedores usando un fichero YAML. Su función principal es simplificar la orquestación de contenedores, gestionando su ciclo de vida (creación, configuración, inicialización y destrucción) y las relaciones entre ellos.*

> [!TIP]
> **El comando `docker system prune --all --force --volumes` realiza una limpieza exhaustiva en Docker, eliminando varios elementos que no están en uso.**

- **`docker system prune`:** *Este comando elimina objetos no utilizados en Docker, como contenedores detenidos, imágenes no referenciadas, redes no utilizadas y volúmenes no utilizados.*

- **`--all`:** *Con esta opción, Docker también elimina todas las imágenes no utilizadas, no solo aquellas que no tienen contenedores asociados. Esto incluye imágenes que están disponibles pero no están siendo usadas por ningún contenedor.*

- **`--force`:** *Esta opción omite la confirmación interactiva, lo que significa que Docker procederá a eliminar los objetos sin pedir confirmación del usuario.*

- **`--volumes`:** *Esta opción incluye la eliminación de volúmenes que no están en uso. Los volúmenes son utilizados por Docker para almacenar datos persistentes, y esta opción asegura que se eliminen los volúmenes que no están siendo utilizados por ningún contenedor.*

- **En resumen**

*El comando `docker system prune --all --force --volumes` elimina de manera forzada todos los recursos no utilizados en Docker, incluyendo:*

- *Contenedores detenidos*
- *Imágenes no usadas*
- *Redes no utilizadas*
- *Volúmenes no asociados a contenedores*

*Es una forma de liberar espacio y limpiar el entorno de Docker, pero debes tener cuidado, ya que eliminará también volúmenes con datos importantes si no están siendo utilizados por contenedores activos.*

## **Explicación técnica a bajo nivel**

1. **Definición de servicios:**
   - *En el fichero `docker-compose.yml`, defines los servicios, que son contenedores individuales con configuraciones específicas. Cada servicio está respaldado por una imagen de Docker y puede tener configuraciones como variables de entorno, volúmenes, redes, puertos expuestos, dependencias y límites de recursos.*

2. **Formato del YAML:**
   - *Docker Compose utiliza un formato YAML estructurado para definir:*
     - **Servicios:** *Contenedores específicos y sus configuraciones.*
     - **Redes:** *Configuración de redes virtuales para permitir la comunicación entre servicios.*
     - **Volúmenes:** *Persistencia de datos compartidos entre servicios o con el host.*

3. **Componentes principales:**
   - **CLI de Docker Compose:**
     - *Al ejecutar `docker-compose` (o `docker compose` en versiones modernas), la herramienta utiliza las APIs de Docker para orquestar contenedores.*
   - **Modo de ejecución:**
     - *`docker-compose up` crea y arranca los contenedores.*
     - *`docker-compose down` detiene y elimina contenedores, redes y volúmenes definidos.*
   - **Escenarios multi-stage:**
     - *Puedes definir configuraciones específicas por entorno usando múltiples ficheros YAML (`-f` flag) o variables de entorno.*

4. **Orquestación y dependencias:**
   - *Gestiona la relación entre contenedores usando directivas como `depends_on`, asegurando que ciertos contenedores inicien antes que otros. Sin embargo, no gestiona órdenes precisas de inicialización, dejando esto a estrategias adicionales.*

5. **Volúmenes y redes:**
   - **Volúmenes:** *Permite compartir datos entre contenedores o entre el host y el contenedor. Docker Compose se asegura de que estos se creen y asignen correctamente.*
   - **Redes:** *Crea redes virtuales (generalmente en modo bridge) para permitir comunicación aislada entre contenedores de la misma aplicación.*

6. **Ciclo de vida:**
   - *Docker Compose invoca las APIs del Docker Engine para crear contenedores, asignarles redes, montar volúmenes y configurar las conexiones según el fichero YAML.*

7. **Compatibilidad:**
   - *Docker Compose está diseñado para escenarios de desarrollo, pruebas y entornos de staging, pero no reemplaza a herramientas de orquestación como Kubernetes para entornos de producción.*

*En esencia, Docker Compose traduce configuraciones declarativas en un YAML a llamadas concretas a las APIs de Docker, permitiendo manejar múltiples contenedores con un solo comando y manteniendo su interoperabilidad y persistencia entre ejecuciones.*

---

### ***Detalles técnicos de la orquestación***

- **La orquestación en Docker se refiere a la gestión automatizada del ciclo de vida de múltiples contenedores, asegurando que funcionen juntos de manera eficiente y coordinada. Incluye tareas como despliegue, escalado, comunicación, monitoreo, recuperación ante fallos, y actualización de servicios distribuidos en clústeres o máquinas individuales.**

1. **Despliegue de servicios:**
   - *La orquestación asegura que los contenedores necesarios se inicien con las configuraciones adecuadas (volúmenes, redes, variables de entorno, etc.) y estén en estado "healthy" (saludable) antes de ser considerados listos.*

2. **Escalabilidad:**
   - *Permite escalar servicios horizontalmente añadiendo o eliminando instancias de contenedores según la demanda. Por ejemplo, pasar de 2 a 10 réplicas de un contenedor para manejar más tráfico.*

3. **Distribución de carga:**
   - *En un clúster, un orquestador asigna contenedores a nodos basándose en recursos disponibles (CPU, memoria) y balancea las peticiones entre las instancias activas.*

4. **Gestión de redes:**
   - *La orquestación configura redes virtuales que permiten a los contenedores comunicarse entre sí, definiendo dominios aislados, subredes o configuraciones específicas de IP.*

5. **Monitoreo y recuperación ante fallos:**
   - *Si un contenedor falla, el orquestador lo reinicia automáticamente o lo reemplaza con una nueva instancia. Esto garantiza alta disponibilidad y continuidad del servicio.*

6. **Actualizaciones y despliegues continuos:**
   - *Permite implementar actualizaciones sin interrupciones mediante estrategias como despliegues rolling (despliegues progresivos) o canary (actualización de una pequeña porción antes del despliegue total).*

7. **Herramientas comunes de orquestación:**
   - **Docker Compose:**
     - *Diseñado para orquestar servicios en una máquina local o para entornos de desarrollo.*
     - *Se enfoca en coordinar múltiples contenedores definidos en un fichero `docker-compose.yml`.*
   - **Docker Swarm:**
     - *Orquestador nativo de Docker para manejar clústeres distribuidos. Permite convertir múltiples nodos en un único clúster lógico.*
   - **Kubernetes:**
     - *Una herramienta avanzada para la orquestación de contenedores en clústeres distribuidos, con funcionalidades más robustas y complejas que Docker Swarm.*

### ***Flujo de orquestación típico***

1. *El orquestador recibe un fichero de configuración (como un `docker-compose.yml` o manifiestos YAML de Kubernetes).*
2. *Evalúa las necesidades de recursos, redes, volúmenes y dependencias.*
3. *Inicia y distribuye los contenedores en los nodos adecuados (si hay un clúster).*
4. *Monitorea la salud de los contenedores y realiza ajustes dinámicos (escalado o reinicio).*
5. *Coordina las actualizaciones y despliegues para minimizar interrupciones.*

*En resumen, la orquestación en Docker es el proceso de administrar contenedores a gran escala, optimizando su disponibilidad, rendimiento y escalabilidad en aplicaciones distribuidas.*
