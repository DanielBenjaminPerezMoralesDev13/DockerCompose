# **Wait For It**

```bash
docker image pull debian:bullseye
```

```bash
docker image pull debian:bullseye
bullseye: Pulling from library/debian
de97e8062e06: Pull complete
Digest: sha256:e5bfb7364038fd100c2faebdd674145bd1bc758a57f3c67023cced99d0eff0f7
Status: Downloaded newer image for debian:bullseye
docker.io/library/debian:bullseye
```

```bash
docker container create --interactive --tty --init --user 0:0 --privileged --stop-signal SIGTERM --stop-timeout 10 --platform linux/amd64 --network bridge --attach STDOUT --attach STDERR --attach STDIN --dns 8.8.8.8 --label manteiner="D4nitrix13" --name container-wait-for-it debian:bullseye
```

```bash
b058cad473b92d907c663de0d7a97fd985090085bf9fc64c7442999be65e28bd
```

```bash
docker container start -i container-wait-for-it
```

```bash
root@cb88f6ed536f:/# apt search wait-for-it
Sorting... Done
Full Text Search... Done
ruby-wait-for-it/oldstable 0.2.1-2 all
  Stop sleeping in your tests, instead wait for it

wait-for-it/oldstable 0.0~git20180723-1 all
  script that will wait on the availability of a host and TCP port
```

```bash
apt install -y wait-for-it
```

```bash
root@cb88f6ed536f:/# wait-for-it --help
Usage:
    wait-for-it host:port [-s] [-t timeout] [-- command args]
    -h HOST | --host=HOST       Host or IP under test
    -p PORT | --port=PORT       TCP port under test
                                Alternatively, you specify the host and port as host:port
    -s | --strict               Only execute subcommand if the test succeeds
    -q | --quiet                Don't output any status messages
    -t TIMEOUT | --timeout=TIMEOUT
                                Timeout in seconds, zero for no timeout
    -- COMMAND ARGS             Execute command with args after the test finishes
```

apt install -y wget

```bash
root@cb88f6ed536f:/tmp/tmp.AaeFMYSpP8# wget https://raw.githubusercontent.com/vishnubob/wait-for-it/refs/heads/master/wait-for-it.sh
--2025-01-18 18:23:31--  https://raw.githubusercontent.com/vishnubob/wait-for-it/refs/heads/master/wait-for-it.sh
Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 185.199.111.133, 185.199.110.133, 185.199.109.133, ...
Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|185.199.111.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 5227 (5.1K) [text/plain]
Saving to: 'wait-for-it.sh'

wait-for-it.sh                 100%[==================================================>]   5.10K  --.-KB/s    in 0s

2025-01-18 18:23:32 (13.8 MB/s) - 'wait-for-it.sh' saved [5227/5227]
```

```bash
root@cb88f6ed536f:/tmp/tmp.AaeFMYSpP8# wget https://raw.githubusercontent.com/vishnubob/wait-for-it/refs/heads/master/wait-for-it.sh -O wait-for-it.sh
--2025-01-18 18:24:23--  https://raw.githubusercontent.com/vishnubob/wait-for-it/refs/heads/master/wait-for-it.sh
Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 185.199.111.133, 185.199.108.133, 185.199.109.133, ...
Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|185.199.111.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 5227 (5.1K) [text/plain]
Saving to: 'wait-for-it.sh'

wait-for-it.sh                 100%[==================================================>]   5.10K  --.-KB/s    in 0.001s

2025-01-18 18:24:24 (6.91 MB/s) - 'wait-for-it.sh' saved [5227/5227]
```

chmod u+x wait-for-it.sh

```bash
root@cb88f6ed536f:/tmp/tmp.AaeFMYSpP8# ./wait-for-it.sh --help
Usage:
    wait-for-it.sh host:port [-s] [-t timeout] [-- command args]
    -h HOST | --host=HOST       Host or IP under test
    -p PORT | --port=PORT       TCP port under test
                                Alternatively, you specify the host and port as host:port
    -s | --strict               Only execute subcommand if the test succeeds
    -q | --quiet                Don't output any status messages
    -t TIMEOUT | --timeout=TIMEOUT
                                Timeout in seconds, zero for no timeout
    -- COMMAND ARGS             Execute command with args after the test finishes
```

apt install -y curl

```bash
curl https://raw.githubusercontent.com/vishnubob/wait-for-it/refs/heads/master/wait-for-it.sh -o wait-for-it.sh
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  5227  100  5227    0     0  14559      0 --:--:-- --:--:-- --:--:-- 14559
```

```bash
root@cb88f6ed536f:/tmp/tmp.AaeFMYSpP8# ./wait-for-it.sh --help
Usage:
    wait-for-it.sh host:port [-s] [-t timeout] [-- command args]
    -h HOST | --host=HOST       Host or IP under test
    -p PORT | --port=PORT       TCP port under test
                                Alternatively, you specify the host and port as host:port
    -s | --strict               Only execute subcommand if the test succeeds
    -q | --quiet                Don't output any status messages
    -t TIMEOUT | --timeout=TIMEOUT
                                Timeout in seconds, zero for no timeout
    -- COMMAND ARGS             Execute command with args after the test finishes
```

**Forma shell:**

- *Es más flexible y adecuada para comandos complejos porque permite usar operadores de shell (`&&, ||, ;,` etc.).*
- *Docker traduce `RUN apt update && apt install -y wait-for-it` en un comando que se ejecuta con `/bin/sh -c`.*

**Forma exec:**

- *Más estricta, ya que no usa un intérprete de comandos y ejecuta directamente los binarios especificados.*
- *No soporta operadores como `&&`, `||`, `>`, `<`.*
