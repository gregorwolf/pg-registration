FROM node:19-buster-slim

RUN apt-get update && apt-get upgrade -y && nodejs -v && npm -v
WORKDIR /usr/src/app
COPY gen/srv/package.json .
COPY package-lock.json .
RUN npm ci
COPY gen/srv .
COPY app app/
RUN find app -name '*.cds' | xargs rm -f

EXPOSE 4004
USER node
CMD [ "npm", "start" ]