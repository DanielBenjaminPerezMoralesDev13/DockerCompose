<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Entropía en criptografía y sistemas informáticos***

*La **entropía** es una medida de la cantidad de incertidumbre o aleatoriedad en un sistema. En el contexto de la criptografía y la generación de números aleatorios en los sistemas informáticos, la entropía se refiere a la cantidad de "imprevisibilidad" de los datos que el sistema puede generar.*

## ***Conceptos Clave Relacionados con Entropía***

1. **Fuente de Entropía:**
   - *En un sistema informático, las fuentes de entropía son eventos o características impredecibles que pueden ser utilizadas para generar datos aleatorios. Estas fuentes incluyen eventos físicos como el tiempo de llegada de datos, el movimiento del mouse, el tiempo entre pulsaciones de teclas, etc.*
   - *Un sistema con **alta entropía** significa que los datos generados son muy impredecibles, mientras que un sistema con **baja entropía** significa que los datos generados siguen patrones y son más predecibles.*

2. **Generadores de Números Aleatorios:**
   - *Los generadores de números aleatorios, como los que se encuentran en `/dev/random` y `/dev/urandom`, usan entropía para producir números que no siguen un patrón predecible.*
   - ***Baja entropía** puede dar lugar a secuencias de números menos aleatorias, lo que podría comprometer la seguridad en criptografía.*

3. **Entropía de Sistema (Hardware/Software):**
   - *La **entropía del sistema** se alimenta de varias fuentes impredecibles, como la variabilidad en el tráfico de la red, la actividad de la CPU o las variaciones en la energía. En sistemas computacionales, la **entropía** se acumula y se utiliza para generar números aleatorios a través de algoritmos de **generación de números aleatorios** (RNG).*
   - *Los sistemas operativos pueden utilizar varias fuentes de entropía, como eventos temporales o interrupciones de hardware, para generar números aleatorios de alta calidad.*

### ***`/dev/random` vs `/dev/urandom`***

#### ***`/dev/random`***

- **Bloqueo por Entropía Baja:**
  *`/dev/random` proporciona números aleatorios de **alta calidad** que dependen de la cantidad de entropía disponible. Si el sistema tiene poca entropía (por ejemplo, si no hay suficientes eventos impredecibles o si las fuentes de entropía no están generando datos aleatorios), el generador de números aleatorios se "bloquea" hasta que la cantidad de entropía acumulada sea suficiente.*
  
  **¿Por qué bloquea?**
  - *Esto se debe a que un generador de alta calidad (como `/dev/random`) necesita datos impredecibles para producir números aleatorios de alta seguridad. Si no hay suficiente entropía, puede generar números que son más predecibles y, por lo tanto, inseguros.*

#### ***`/dev/urandom`***

- **No Bloquea (Uso de Algoritmo Determinista):**
  *`/dev/urandom` también genera números aleatorios, pero no depende de que haya suficiente entropía. Si el sistema tiene poca entropía, el generador usará un **algoritmo determinista** basado en el estado interno (el "semilla" de los números aleatorios), que continua generando números aleatorios sin esperar más entropía.*

  **¿Por qué no bloquea?**
  - *Aunque la aleatoriedad no es perfecta cuando la entropía es baja, el generador continúa produciendo números utilizando un algoritmo que no depende de la entrada impredecible continua.*

### ***Relación con la RAM y el Sistema Operativo***

- **Entropía y RAM:**
  *La RAM (memoria de acceso aleatorio) es importante porque es un espacio rápido y accesible para almacenar y generar datos, incluyendo los datos de entropía. En muchas implementaciones, como en la generación de números aleatorios, la RAM puede ser utilizada para almacenar los valores temporales que el sistema genera de las fuentes de entropía (interrupciones de hardware, cambios en los temporizadores, etc.).*
  
  *En sistemas Linux, por ejemplo:*
  - *`/dev/random` y `/dev/urandom` están asociados con la **entropía del sistema** y utilizan **buffers** en memoria (RAM) para almacenar las fuentes de entropía antes de generar los números aleatorios. Si el sistema se queda sin entropía (poca variabilidad en la RAM y las fuentes externas), `/dev/random` se bloqueará hasta que haya suficiente.*

- **Almacenamiento de Entropía:**
  - *Los datos de entropía no son necesariamente "almacenados" en un fichero, sino que son generados a medida que ocurren eventos impredecibles en el sistema. El sistema operativo mantiene un **pool de entropía** en memoria, el cual se va llenando con cada nuevo evento impredecible y se vacía cuando el generador de números aleatorios lo utiliza.*
  - *Los valores de entropía se almacenan en el sistema de manera temporal mientras están disponibles, pero pueden ser sobreescritos conforme el sistema sigue generando más eventos impredecibles. Este almacenamiento se encuentra típicamente en el **núcleo del sistema operativo**, a menudo gestionado por el módulo de entropía (por ejemplo, `rngd` en Linux).*

### ***Resumen***

- **Entropía** *es la cantidad de imprevisibilidad o aleatoriedad en un sistema. En informática, es crucial para generar números aleatorios seguros.*
- **`/dev/random`** *proporciona números aleatorios de alta calidad, pero se bloquea si no hay suficiente entropía.*
- **`/dev/urandom`** *proporciona números aleatorios sin bloqueo, pero la aleatoriedad puede ser menor cuando hay poca entropía.*
- *Ambos están asociados con la **memoria RAM** y utilizan las interrupciones o eventos impredecibles en el sistema para generar números aleatorios.*
