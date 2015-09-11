#!/bin/bash

# DEFINE FUNCTIONS

start_prod(){
  ./node_modules/.bin/link-package ./.srv app
  node ./.srv/index.js
}

start_dev(){
  ./node_modules/.bin/link-package ./app app
  ./node_modules/.bin/nodemon --exec ./node_modules/.bin/babel-node ./app/index.js & webpack-dev-server
}


# RUN NOW
case "$NODE_ENV" in
  production)   start_prod   ;;
           *)   start_dev    ;;
esac

