FROM node:0.10.32

ADD . /srv/wheatley

RUN useradd --shell /bin/false wheatley

WORKDIR /srv/wheatley
RUN chown -R wheatley:wheatley /srv/wheatley

RUN npm install -g hubot coffee-script

USER wheatley
RUN npm install

CMD ["node_modules/.bin/hubot", "--name", "wheatley"]
