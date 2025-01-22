# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielBenjaminPerezMoralesDev13
# Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

FROM ubuntu:jammy
RUN apt update && \
    apt install -y tini ncat && \
    useradd -m d4nitrix13 -s /usr/bin/bash && \
    mkdir -p /var/log/server/ && \
    touch /var/log/server/access.log /var/log/server/error.log
USER d4nitrix13
SHELL [ "/usr/bin/bash", "-plc" ]
# COPY --from=jwilder/dockerize --chown=d4nitrix13:d4nitrix13 /bin/dockerize /usr/bin/dockerize
COPY --from=jwilder/dockerize --chown=1000:1000 /bin/dockerize /usr/bin/dockerize
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "dockerize", "-stdout", "/var/log/server/access.log", "-stderr", "/var/log/server/error.log", "-wait", "tcp4://localhost:8000", "--", "echo", "'Server Up'" ]
EXPOSE 5757/tcp
STOPSIGNAL 15
MAINTAINER Daniel Benjamin Perez Morales
LABEL maintainer="Daniel Benjamin Perez Morales (D4nitrix13)"
ENTRYPOINT [ "tini", "--" ]
CMD [ "nc", "-nlvkp", "5757" ]

