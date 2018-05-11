FROM node:latest
RUN npm install
WORKDIR /ServerSide
CMD node denkoServer.js
EXPOSE 1337