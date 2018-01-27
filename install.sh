#!/bin/bash
ls /opt
set -e
chmod +x /init_testnet.sh 
chmod +x /init_reddconomy.sh 
chmod +x /reddconomy_updater.sh 
chmod +x /updater.sh 

apt-get update -y 
apt-get -y install supervisor curl


# Install java
JDK_VERSION="`curl -L -s https://ci-deploy.frk.wf/jdk8_latest.txt`" 
echo "Download java $JDK_VERSION" 
curl -L "https://ci-deploy.frk.wf/jdk8_lin64-$JDK_VERSION.tar.gz" -o /tmp/jdk8.tar.gz 
mkdir -p /opt/java
tar -xzf /tmp/jdk8.tar.gz -C /opt/java
ls /opt/java

ls /opt

mkdir /opt/reddconomy   
mkdir -p /data/