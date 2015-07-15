FROM node:0.12
MAINTAINER Ash Wilson <smashwilson@gmail.com>

RUN npm install -g coffee-script

RUN useradd wheatley
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json /usr/src/app/
RUN npm install
COPY . /usr/src/app

RUN chown -R wheatley:wheatley /usr/src/app
USER wheatley

ENTRYPOINT ["node_modules/.bin/hubot", "--name", "wheatley"]
CMD ["--adapter", "slack"]
