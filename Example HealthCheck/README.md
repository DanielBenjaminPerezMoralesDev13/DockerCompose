<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# **Docker Build**

*[Docker Build Flag -f](https://stackoverflow.com/questions/32235987/docker-build-with-f-option-cannot-find-dockerfile "https://stackoverflow.com/questions/32235987/docker-build-with-f-option-cannot-find-dockerfile")*
*[How can I correctly specify the platform for my dockerfile?](https://stackoverflow.com/questions/70754255/how-can-i-correctly-specify-the-platform-for-my-dockerfile "https://stackoverflow.com/questions/70754255/how-can-i-correctly-specify-the-platform-for-my-dockerfile")*
*[Docker: Label Image on Build (Dockerfile) – Example](https://www.shellhacks.com/docker-label-image-build-dockerfile-example/ "https://www.shellhacks.com/docker-label-image-build-dockerfile-example/")*
*[Kill Process Linux](https://phoenixnap.com/kb/how-to-kill-a-process-in-linux "https://phoenixnap.com/kb/how-to-kill-a-process-in-linux")*
*[Docker Tini](https://dev.to/joeyb908/docker-dockerizing-a-simple-nodejs-app-1pjp "https://dev.to/joeyb908/docker-dockerizing-a-simple-nodejs-app-1pjp")*
*[Is there a best practice on setting up glibc on docker alpine linux base image?](https://stackoverflow.com/questions/37818831/is-there-a-best-practice-on-setting-up-glibc-on-docker-alpine-linux-base-image "https://stackoverflow.com/questions/37818831/is-there-a-best-practice-on-setting-up-glibc-on-docker-alpine-linux-base-image")*

```bash
docker image build --platform=linux/amd64 --label version="0.1" --label maintainer="Daniel Perez" --tag d4nitrix13/python-healthcheck --file ./Dockerfile.dev --no-cache .
```

```bash
docker build --platform=linux/amd64 --label version="0.1" --label maintainer="Daniel Perez" -t d4nitrix13/python-healthcheck -f ./Dockerfile.dev --no-cache .
```

```bash
docker build --platform=linux/amd64 --label version="0.1" --label maintainer="Daniel Perez" -td4nitrix13/python-healthcheck -f./Dockerfile.dev --no-cache .
```

```bash
docker build --platform=linux/amd64 --label version="0.1" --label maintainer="Daniel Perez" -td4nitrix13/python-healthcheck -f./Dockerfile.dev --no-cache .
[+] Building 5.1s (7/7) FINISHED                                                                                                                         docker:default
 => [internal] load build definition from Dockerfile.dev                                                                                                           0.0s
 => => transferring dockerfile: 619B                                                                                                                               0.0s
 => [internal] load metadata for docker.io/library/python:alpine                                                                                                   0.9s
 => [auth] library/python:pull token for registry-1.docker.io                                                                                                      0.0s
 => [internal] load .dockerignore                                                                                                                                  0.0s
 => => transferring context: 2B                                                                                                                                    0.0s
 => CACHED [1/2] FROM docker.io/library/python:alpine@sha256:b6f01a01e34091438a29b6dda4664199e34731fb2581ebb6fe255a2ebf441099                                      0.0s
 => [2/2] RUN apk --no-cache add curl && apk add --no-cache tini                                                                                                   4.0s
 => exporting to image                                                                                                                                             0.1s
 => => exporting layers                                                                                                                                            0.1s
 => => writing image sha256:8131f58c64c8fbd694113ffabbd2da75e2bc8e30e86823292eccd7f266209eae                                                                       0.0s
 => => naming to docker.io/d4nitrix13/python-healthcheck                                                                                                           0.0s

 1 warning found (use docker --debug to expand):
 - JSONArgsRecommended: JSON arguments recommended for CMD to prevent unintended behavior related to OS signals (line 18)
```

creamos el contenedor
docker run -d --name python-container d4nitrix13/python-healthcheck

listatmos
docker ps
CONTAINER ID   IMAGE                          COMMAND                  CREATED         STATUS                            PORTS     NAMES
46c134fa0413   d4nitrix13/python-healthcheck   "python3 -m http.ser…"   2 seconds ago   Up 2 seconds (health: starting)   80/tcp    python-container

Host Ejecutamos
docker exec -itu0:0 python-container sh

pgrep -f 'python3 -m http.server 80'

salida

1
Container Ejecutamos

top

salida
Mem: 6250020K used, 1789844K free, 429964K shrd, 187536K buff, 3037492K cached
CPU:   2% usr   0% sys   0% nic  97% idle   0% io   0% irq   0% sirq
Load average: 0.84 1.10 1.01 2/1016 55
  PID  PPID USER     STAT   VSZ %VSZ CPU %CPU COMMAND
    1     0 root     S    24992   0%   2   0% python3 -m http.server 80
   49     0 root     S     1708   0%   2   0% sh
   55    49 root     R     1636   0%   0   0% top

o en el host

docker top python-container
UID                 PID                 PPID                C                   STIME               TTY                 TIME                CMD
root                279186              279165              0                   14:30               ?                   00:00:00            python3 -m http.server 80

por que el process id del docker top no coincide con el del contenedor

sudo pwdx 279186
279186: /

esto se debe a

ps aux | rg 279165
root      279165  0.0  0.1 1238196 14400 ?       Sl   14:30   0:00 /usr/bin/containerd-shim-runc-v2 -namespace moby -id 050be68d83138ff73416a6c9aa3049809181640796f5fac9c0bd904752993d3d -address /run/containerd/containerd.sock
d4nitri+  294498  0.0  0.0   8652  3200 pts/3    D+   14:37   0:00 rg 279165

filtramos por esto que es la

ps aux | rg 279165 | head -n 1 | awk '{print $15}'
050be68d83138ff73416a6c9aa3049809181640796f5fac9c0bd904752993d3d

docker ps --filter id=050be68d83138ff73416a6c9aa3049809181640796f5fac9c0bd904752993d3d --size
CONTAINER ID   IMAGE                           COMMAND                  CREATED         STATUS                     PORTS     NAMES              SIZE
050be68d8313   d4nitrix13/python-healthcheck   "python3 -m http.ser…"   8 minutes ago   Up 8 minutes (unhealthy)   80/tcp    python-container   1.71MB (virtual 46.6MB)

verificamos en el host

```bash
curl -X GET http://172.17.0.2/
```

```html
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Directory listing for /</title>
</head>
<body>
<h1>Directory listing for /</h1>
<hr>
<ul>
<li><a href=".dockerenv">.dockerenv</a></li>
<li><a href="bin/">bin/</a></li>
<li><a href="dev/">dev/</a></li>
<li><a href="etc/">etc/</a></li>
<li><a href="home/">home/</a></li>
<li><a href="lib/">lib/</a></li>
<li><a href="media/">media/</a></li>
<li><a href="mnt/">mnt/</a></li>
<li><a href="opt/">opt/</a></li>
<li><a href="proc/">proc/</a></li>
<li><a href="root/">root/</a></li>
<li><a href="run/">run/</a></li>
<li><a href="sbin/">sbin/</a></li>
<li><a href="srv/">srv/</a></li>
<li><a href="sys/">sys/</a></li>
<li><a href="tmp/">tmp/</a></li>
<li><a href="usr/">usr/</a></li>
<li><a href="var/">var/</a></li>
</ul>
<hr>
</body>
</html>
```

Intentamo Detener proceso

kill -9 1

/ # kill -9 1
/ # top
Mem: 6277996K used, 1761868K free, 454440K shrd, 199068K buff, 3148276K cached
CPU:   2% usr   0% sys   0% nic  95% idle   2% io   0% irq   0% sirq
Load average: 1.49 1.42 0.98 2/1008 443
  PID  PPID USER     STAT   VSZ %VSZ CPU %CPU COMMAND
    1     0 root     S    24992   0%   1   0% python3 -m http.server 80
   69     0 root     S     1708   0%   1   0% sh
  443    69 root     R     1636   0%   1   0% top

vemos que no se elimina por que
si vemos despues

Cada 1.0s: docker ps                                                                                                  d4nitrix13-Inspiron-3558: Wed Jan 15 14:16:24 2025

CONTAINER ID   IMAGE                          COMMAND                  CREATED              STATUS                          PORTS     NAMES
8d01af26bbee   d4nitrix13/python-healthcheck   "python3 -m http.ser…"   About a minute ago   Up About a minute (unhealthy)   80/tcp    python-container

borramos

docker rm -f $(docker ps -aq)

```bash
docker run -d \
  --name python-healthcheck \
  --health-cmd="curl --silent --fail http://localhost/ || exit 1" \
  --health-interval=30s \
 --health-start-period=30s \
  --health-timeout=5s \
  --health-retries=3 \
  -p 80:80 \
  python:alpine
```

```bash
docker run -d \
  --name python-healthcheck \
  --health-cmd="curl --silent --fail http://localhost/ || exit 1" \
  --health-interval=30s \
  --health-timeout=5s \
  --health-retries=3 \
  -p 80:80 \
  python:alpine
Unable to find image 'python:alpine' locally
alpine: Pulling from library/python
66a3d608f3fa: Already exists
58290db888fa: Already exists
5d777e0071f6: Already exists
dbcfe8732ee6: Already exists
37d775ecfbb9: Already exists
e0350d1fd4dd: Already exists
1f4aa363b71a: Already exists
e74fff0a393a: Already exists
Digest: sha256:814a8e88df978ade80e584cc5b333144b9372a8e3c98872d07137dbf3b44d0e4
Status: Downloaded newer image for python:alpine
b96d6493c8a68525143cec099b302d689c3d80cb117a9c8f853074483f018e12
```

```bash
Cada 1.0s: docker ps                                                                                                  d4nitrix13-Inspiron-3558: Wed Jan 15 14:18:46 2025

CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS                             PORTS                               NAMES
b96d6493c8a6   python:alpine   "python3 -m http.ser…"   25 seconds ago   Up 23 seconds (health: starting)   0.0.0.0:80->80/tcp, :::80->80/tcp   python-healthcheck
```

Cada 1.0s: docker ps                                                                                                  d4nitrix13-Inspiron-3558: Wed Jan 15 14:20:24 2025

CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS                   PORTS                               NAMES
b96d6493c8a6   python:alpine   "python3 -m http.ser…"   2 minutes ago   Up 2 minutes (healthy)   0.0.0.0:80->80/tcp, :::80->80/tcp   python-healthcheck
