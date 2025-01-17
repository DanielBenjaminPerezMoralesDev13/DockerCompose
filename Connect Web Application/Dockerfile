# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielBenjaminPerezMoralesDev13
# Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

FROM node:20-alpine

RUN mkdir -p /home/app

COPY ./app /home/app

# Set Default Dir So That Next Commands Executes In /home/app dir
WORKDIR /home/app

# Will Execute Npm Install In /home/app Because Of WORKDIR
RUN npm install

# No Need For /home/app/server.js Because Of WORKDIR
CMD ["node", "server.js"]
