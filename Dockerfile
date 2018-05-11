FROM node:latest
RUN mkdir -p /home/nodejs/app
WORKDIR /home/nodejs/app
COPY . /home/nodejs/app
RUN npm install
WORKDIR /ServerSide
CMD node denkoServer.js
EXPOSE 1337