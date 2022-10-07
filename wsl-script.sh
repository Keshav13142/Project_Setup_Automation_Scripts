#!/bin/bash  

TYPE=$1
APP_NAME=$2
OPEN=$3
scriptDir=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")


if [ "$TYPE" == "" ] ; then    
    echo 'Specify the type (e.g React,React-node,node,vanilla)'
    exit;
fi

if [ "$APP_NAME" == "" ] & [ "$TYPE" == "" ]; then    
    mkdir $APP_NAME;
    cd $APP_NAME;
    exit;
fi

if [ "$APP_NAME" != "." ] & [ "$APP_NAME" != "" ]; then    
    mkdir $APP_NAME;
    cd $APP_NAME;
fi

if [ "$OPEN" == "open" ]; then
    code .;
fi

case $TYPE in
        "react")
            npm create vite@latest -- --template react .;
            npm i;
            cp $scriptDir/.gitignore .;
            touch .env;
            ;;
        "react-node")
            mkdir frontend;
            cd frontend;
            npm create vite@latest -- --template react .;
            npm i;
            cd ..;
            mkdir backend;
            cd backend;
            cp -r $scriptDir/node/* .;
            npm i express dotenv express-async-handler;
            cd ..;
            cp $scriptDir/.gitignore .;
            ;;
        "node")
            cp -r $scriptDir/node/* .;
            cp $scriptDir/.gitignore  .;
            npm i express dotenv express-async-handler;
            ;;
        "vanilla")
            cp -r $scriptDir/vanilla/* . && cp $scriptDir/.gitignore .;            
            ;;
        *) 
            echo "Invalid option $TYPE"
            exit;
            ;;
esac

git init;