<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# **Explicacion Docker Compose**

```yaml
# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielBenjaminPerezMoralesDev13
# Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

services:
  base_image:
    build:
      context: ./
      dockerfile: Dockerfile.onbuild
    image: d4nitrix13/base:latest

  app:
    build:
      context: ./
      dockerfile: Dockerfile
    image: d4nitrix13/my-app:1.0.0
    depends_on:
      - base_image
    labels:
      - maintainer=D4nitrix13
    container_name: app-container
    volumes:
      - myvolume:/App:ro
    healthcheck:
      test: ["CMD", "wait-for-it", "--host=0.0.0.0", "--port=8080", "--strict", "--timeout=5", "--", "echo", "'Server Up'"]
      interval: 1m30s
      timeout: 30s
      retries: 5
      start_period: 30s
    stdin_open: true
    tty: true
    command: bash server.sh

volumes:
  myvolume:
```
