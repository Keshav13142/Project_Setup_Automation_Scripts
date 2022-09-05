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
            git init
            mkdir backend;
            cp E:/scripts/react-node/package.json .;
            npm create vite@latest frontend -- --template react 
            cp E:/scripts/index.js ./backend && cp E:/scripts/\.env . && cp E:/scripts/nodemon.json . && cp E:/scripts/.gitignore .;
            npm i express dotenv
            ;;
        "express")
            git init
            cp E:/scripts/react-node/package.json .;
            cp E:/scripts/index.js . && cp E:/scripts/\.env . && cp E:/scripts/nodemon.json . && cp E:/scripts/.gitignore .;
            npm i express dotenv
            ;;
        "solid")
            npx degit solidjs/templates/js $APP_NAME;
            npm i --prefix $APP_NAME;
            ;;
        "solid-node")
            git init
            mkdir backend;
            cp E:/scripts/solid-node/package.json .;
            npx degit solidjs/templates/js frontend;
            npm i --prefix frontend;
            cp E:/scripts/index.js ./backend && cp E:/scripts/\.env . && cp E:/scripts/nodemon.json . && cp E:/scripts/.gitignore .;
            npm i express dotenv
            ;;
        "vanilla")
            git init
            cp E:/scripts/vanilla/* . && cp E:/scripts/.gitignore .;
            ;;
        *) echo "invalid option $TYPE";;
esac