#!/bin/bash  

CURR_DIR=$(pwd)
PARENT_DIR=$(basename $PWD)
APP_NAME=$2
TYPE=$1

case $TYPE in
        "react")
            npm create vite@latest $APP_NAME -- --template react;
            ;;
        "svelte")
            npm create vite@latest $APP_NAME -- --template svelte;
            npm i --prefix $APP_NAME;
            ;;
        "react-node")
            mkdir backend;
            cp E:/scripts/react-node/package.json .;
            npm create vite@latest frontend -- --template react 
            cp E:/scripts/index.js ./backend && cp E:/scripts/\.env . && cp E:/scripts/nodemon.json .;
            npm i express dotenv
            ;;
        "solid")
            npx degit solidjs/templates/js $APP_NAME;
            npm i --prefix $APP_NAME;
            ;;
        "solid-node")
            mkdir backend;
            cp E:/scripts/solid-node/package.json .;
            npx degit solidjs/templates/js frontend;
            npm i --prefix frontend;
            cp E:/scripts/index.js ./backend && cp E:/scripts/\.env . && cp E:/scripts/nodemon.json .;
            npm i express dotenv
            ;;
        "vanilla")
            cp E:/scripts/vanilla/* .;
            ;;
        *) echo "invalid option $TYPE";;
esac