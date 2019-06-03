FROM node:12.3.1 as node

FROM ruby:2.5.1 as base
ENV LANG C.UTF-8
ENV APP_ROOT=/app
ENV NODE_VERSION 11.13.0

COPY --from=node /usr/local/bin/node /usr/local/bin/
COPY --from=node /usr/local/lib/node_modules /usr/local/lib/node_modules

RUN ln -s /usr/local/bin/node /usr/local/bin/nodejs \
  && ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm \
  && ln -s /usr/local/lib/node_modules/npm/bin/npx-cli.js /usr/local/bin/npx

RUN apt-get update -qq \
    &&  apt-get install -y --no-install-recommends \
        build-essential \
        mysql-client \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT
