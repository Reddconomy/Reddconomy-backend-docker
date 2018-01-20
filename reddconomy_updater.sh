#!/bin/bash
if [ "$REDDCONOMY_VERSION_URL" == "" ];
then
    export REDDCONOMY_VERSION_URL="https://dl.bintray.com/reddconomy/Reddconomy/Reddconomy_latest.txt"
fi

if [ "$REDDCONOMY_DOWNLOAD_URL" == "" ];
then
    export REDDCONOMY_DOWNLOAD_URL="https://dl.bintray.com/reddconomy/Reddconomy/Reddconomy-{VERSION}.jar"
    export REDDCONOMY_DOWNLOAD_PASSWORD=""
fi

function getReddconomyVersion(){
    version="`curl  -L \"$REDDCONOMY_VERSION_URL\"`"
    echo $version
}

function downloadReddconomy {
    version="`curl  -L \"$REDDCONOMY_VERSION_URL\"`"
    dest=$1
    if [ -f $dest ]; then 
        rm $dest
    fi
    dl="`echo \"$REDDCONOMY_DOWNLOAD_URL\" | sed s/\{VERSION\}/$version/g`"

    if [ "$REDDCONOMY_DOWNLOAD_PASSWORD" == "" ];
    then
        curl -L "$dl" -o "$dest"
    else
        curl -L "$dl" | openssl aes-256-cbc  -md sha256 -d -out "$dest" -k $REDDCONOMY_DOWNLOAD_PASSWORD
    fi
}

export REDDCONOMY_VERSION="`getReddconomyVersion`"

function checkForReddconomyUpdate {
    new_version="`getReddconomyVersion`"
    if [ "$REDDCONOMY_VERSION" != "$new_version" ];
    then
        echo "Restart & update"
        export REDDCONOMY_VERSION=$new_version
        echo "true"
    fi
    echo "false"
}