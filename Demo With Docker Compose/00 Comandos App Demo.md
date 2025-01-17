<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# **Demo With Docker Compose**

*![Demo With Docker Compose](/Images/Demo%20Whit%20Compose.png "/Images/Demo%20Whit%20Compose.png")*

*[mongo](https://hub.docker.com/_/mongo "https://hub.docker.com/_/mongo")*

```bash
docker network create mongo-network
```

```bash
docker network create mongo-network
27b6de7cf4c69c03a727a4a568fd3c3a094733c4068bb20d0b898aa4782736c1
```

```bash
docker run -d \
    -p 27017:27017 \
    -e MONGO_INITDB_ROOT_USERNAME=admin \
    -e MONGO_INITDB_ROOT_PASSWORD=supersecret \
    --network mongo-network \
    --name mongo-demo \
    mongo
```

*[Escoger Theme](https://codemirror.net/5/demo/theme.html "https://codemirror.net/5/demo/theme.html")*

- *[Foro](https://stackoverflow.com/questions/77853996/docker-mongo-and-mongo-express-connection-issue#77854335 "https://stackoverflow.com/questions/77853996/docker-mongo-and-mongo-express-connection-issue")*
- *[Explicacion Foro](/Docs/Image%20Mongo%20Express%20Error.md "/Docs/Image%20Mongo%20Express%20Error.md")*

```bash
docker run -d \
    -p 8081:8081 \
    -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin \
    -e ME_CONFIG_MONGODB_ADMINPASSWORD=supersecret \
    -e ME_CONFIG_MONGODB_SERVER=mongo-demo \
    -e ME_CONFIG_MONGODB_URL=mongodb://admin:supersecret@mongo-demo:27017/ \
    -e ME_CONFIG_MONGODB_ENABLE_ADMIN=true \
    -e ME_CONFIG_OPTIONS_EDITORTHEME=material-darker \
    -e ME_CONFIG_REQUEST_SIZE=100kb \
    -e ME_CONFIG_SITE_BASEURL=/ \
    -e ME_CONFIG_SITE_COOKIESECRET=cookiesecret \
    -e ME_CONFIG_SITE_SESSIONSECRET=sessionsecret \
    -e ME_CONFIG_SITE_SSL_ENABLED=false \
    -e ME_CONFIG_MONGODB_AUTH_USERNAME=admin \
    -e ME_CONFIG_MONGODB_AUTH_PASSWORD=pass \
    -e ME_CONFIG_MONGODB_PORT=27017 \
    --network mongo-network \
    --name mongo-express \
    mongo-express:latest
```

- **Especificar las credenciales de autenticación para acceder a la interfaz de mongo-express (que son independientes de las credenciales de MongoDB) mediante las variables de entorno `ME_CONFIG_BASICAUTH_USERNAME` y `ME_CONFIG_BASICAUTH_PASSWORD`.**

```bash
docker run -d \
    -p 8081:8081 \
    -e ME_CONFIG_BASICAUTH_USERNAME=browser_user \
    -e ME_CONFIG_BASICAUTH_PASSWORD=browser_password \
    -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin \
    -e ME_CONFIG_MONGODB_ADMINPASSWORD=supersecret \
    -e ME_CONFIG_MONGODB_SERVER=mongo-demo \
    -e ME_CONFIG_MONGODB_URL=mongodb://admin:supersecret@mongo-demo:27017/ \
    -e ME_CONFIG_MONGODB_ENABLE_ADMIN=true \
    -e ME_CONFIG_OPTIONS_EDITORTHEME=material-darker \
    -e ME_CONFIG_REQUEST_SIZE=100kb \
    -e ME_CONFIG_SITE_BASEURL=/ \
    -e ME_CONFIG_SITE_COOKIESECRET=cookiesecret \
    -e ME_CONFIG_SITE_SESSIONSECRET=sessionsecret \
    -e ME_CONFIG_SITE_SSL_ENABLED=false \
    -e ME_CONFIG_MONGODB_AUTH_USERNAME=admin \
    -e ME_CONFIG_MONGODB_AUTH_PASSWORD=pass \
    -e ME_CONFIG_MONGODB_PORT=27017 \
    --network mongo-network \
    --name mongo-express \
    mongo-express:latest
```

- **Ver Los Logs**

```bash
watch -n 1 docker logs mongo-express
```

```bash
Cada 1.0s: docker logs mongo-express                                    d4nitrix13-Inspiron-3558: Sat Jan 11 16:23:41 2025

Waiting for mongo-demo:27017...
No custom config.js found, loading config.default.js
Welcome to mongo-express 1.0.2
------------------------


Mongo Express server listening at http://0.0.0.0:8081
Server is open to allow connections from anyone (0.0.0.0)
basicAuth credentials are "admin:pass", it is recommended you change this in your config.js!
```

```bash
docker ps --size
```

```bash
docker ps --size
CONTAINER ID   IMAGE                  COMMAND                  CREATED              STATUS              PORTS                                           NAMES           SIZE
69dce10678ec   mongo-express:latest   "/sbin/tini -- /dock…"   About a minute ago   Up About a minute   0.0.0.0:8081->8081/tcp, :::8081->8081/tcp       mongo-express   0B (virtual 182MB)
d77045edba3a   mongo-demo             "docker-entrypoint.s…"   17 minutes ago       Up 17 minutes       0.0.0.0:27017->27017/tcp, :::27017->27017/tcp   mongodb         0B (virtual 855MB)
```

- *![Problemas Micro Servicios](/Images/App%20Micro%20Services%20Containers.png "/Images/App%20Micro%20Services%20Containers.png")*

**[Siguiente](/Demo%20With%20Docker%20Compose/01%20Docker%20Compose%20Yaml%20File.md "/Demo%20With%20Docker%20Compose/01%20Docker%20Compose%20Yaml%20File.md")**
