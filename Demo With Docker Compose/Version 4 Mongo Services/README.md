<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# **El comando `until` en bash se utiliza para ejecutar un bloque de comandos repetidamente hasta que una condición sea verdadera. Es una estructura de control de bucle que sigue ejecutando los comandos en su interior mientras la condición sea falsa.**

**La sintaxis básica de `until` es la siguiente:**

```bash
until [condición]
do
  # Comandos A Ejecutar
done
```

- *El bucle sigue ejecutándose **hasta que** la condición sea verdadera.*
- *Cuando la condición se evalúa como verdadera, el bucle se detiene.*

**En el contexto del comando que sugerí:**

```bash
until nc -zv mongo-demo 27017; do
  echo Waiting For Mongo;
  sleep 1;
done;
```

- *`nc -z mongo-demo 27017`: Este comando verifica si el puerto `27017` en el host `mongo-demo` está abierto y accesible.*
- *La condición es `nc -z mongo-demo 27017`, que verifica si la conexión al puerto `27017` es exitosa (si el puerto está abierto y escuchando).*
- *Si la conexión falla (es decir, el puerto no está listo), el bucle sigue ejecutándose, mostrando `waiting for mongo` y esperando 3 segundos antes de volver a intentarlo.*
- *El bucle se detiene una vez que la conexión a `mongo-demo:27017` se establece correctamente, lo que indica que MongoDB está listo para aceptar conexiones.*

*En resumen, el `until` asegura que `mongo-express` no intente conectarse a MongoDB hasta que esté completamente disponible.*

---

## *El comando `nc -z` (que es una abreviación de **Netcat**) se utiliza para realizar pruebas de puertos de red, es decir, verifica si un puerto específico está abierto y accesible en un host dado.*

*La opción `-z` en `nc` tiene el siguiente propósito:*

- **`-z`:** *Realiza una **"escaneo de puertos"**. No envía ningún dato de comunicación al puerto, solo verifica si el puerto está abierto (escuchando) o cerrado.*

**La sintaxis básica de `nc -z` es la siguiente:**

```bash
nc -z <host> <port>
```

**Por ejemplo:**

```bash
nc -zv mongo-demo 27017
```

*Este comando verifica si el puerto `27017` en el host `mongo-demo` está abierto y listo para aceptar conexiones. Si el puerto está abierto, `nc` devuelve un código de salida `0` (lo que indica éxito). Si el puerto está cerrado o no se puede acceder, `nc` devuelve un código de salida distinto de `0`.*

```bash
until nc -zv mongo-demo 27017; do
  echo Waiting For Mongo;
  sleep 1;
done;
```

- *`nc -z mongo-demo 27017` intenta conectarse al puerto `27017` del servicio `mongo-demo`.*
- *Si el puerto está abierto (MongoDB está listo), `nc` tiene un código de salida `0` y el bucle `until` se detiene.*
- *Si el puerto no está abierto (es decir, MongoDB aún no está listo), el bucle sigue esperando, mostrando `waiting for mongo` y durmiendo por 3 segundos antes de intentar nuevamente.*

*De este modo, `nc -z` se utiliza como una herramienta de comprobación para asegurarse de que un servicio esté disponible en un puerto específico antes de proceder.*
