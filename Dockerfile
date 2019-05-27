FROM node:12.2.0-alpine

RUN mkdir -p /src/app/node-server
WORKDIR /srv/app/node-server

COPY package.json /srv/app/node-server
COPY package-lock.json /srv/app/node-server

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base 

RUN apk fetch openjdk8
RUN apk add openjdk8
RUN apk update

RUN npm install bcrypt --save
RUN npm rebuild
RUN npm install

EXPOSE 4000

COPY . /srv/app/node-server

CMD ["npm", "run", "dev"]

