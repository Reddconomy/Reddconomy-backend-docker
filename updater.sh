#!/bin/bash
source /reddconomy_updater.sh
while true;
do
    if [ "`checkForReddconomyUpdate`" = "true" ];
    then
        echo "Restart & update to $REDDCONOMY_VERSION"
        supervisorctl restart reddconomy
    fi
    sleep 2m
done