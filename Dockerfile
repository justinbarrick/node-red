FROM nodered/node-red-docker:latest
RUN npm install node-red-contrib-nest
RUN npm install node-red-contrib-huemagic
