#!/bin/bash

echo "Starting...."
cd /opt/reddconomy

VERSION="`curl https://dl.bintray.com/reddconomy/Reddconomy/Reddconomy_latest.txt`"
curl  https://dl.bintray.com/reddconomy/Reddconomy/Reddconomy-$VERSION.jar -o Reddconomy.jar

if [ ! -f /data/reddconomy.json ];
then
    echo '{"bind_ip":"0.0.0.0",  "sqlite-path": "/data/db.sqlite"}' > /data/reddconomy.json
fi

/opt/java/bin/java -jar Reddconomy.jar /data/reddconomy.json
