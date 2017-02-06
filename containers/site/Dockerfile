FROM node:6.9.4

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    nodejs git

RUN npm install -g bower grunt-cli

RUN git clone https://github.com/ngalayko/Syte2 site
WORKDIR /site

# setting up client
WORKDIR ./client
RUN bower install --allow-root
RUN npm install
RUN grunt clean --force
RUN grunt build --force

# setting up server
WORKDIR ./
RUN npm install

EXPOSE 3000
WORKDIR ./server

ENV NODE_ENV="production"
ENTRYPOINT ["node", "app.js"]
