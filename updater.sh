#!/bin/bash
source /reddconomy_updater.sh
while true;
do
    if [ "`checkForReddconomyUpdate`" == "true" ];
    then
        echo "Restart & update"
        supervisorctl restart reddconomy
    fi
    sleep 2m
done