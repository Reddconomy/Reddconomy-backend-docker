#!/bin/bash
source /reddconomy_updater.sh
while true;
do
    if [ "`checkForReddconomyUpdate`" != "false" ];
    then
        echo "Restart & update"
        supervisorctl restart reddconomy
    fi
    sleep 60
done