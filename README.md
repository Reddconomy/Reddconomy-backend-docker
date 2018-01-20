# Use latest master snapshot
```bash
docker run --name=reddconomy_test -d -p 8099:8099  -v /srv/reddconomy_testnet:/data --restart=always riccardoblb/reddconomy_test:amd64
```

# Use custom version
```bash
docker run --name=reddconomy_test \
-eREDDCONOMY_VERSION_URL="https://dl.bintray.com/reddconomy/Reddconomy/Reddconomy_latest.txt" \
-eREDDCONOMY_DOWNLOAD_URL="https://dl.bintray.com/reddconomy/Reddconomy/Reddconomy-{VERSION}.jar" \
 -d -p 8099:8099  -v /srv/reddconomy_testnet:/data --restart=always riccardoblb/reddconomy_test:amd64
```


# Use custom encrypted version 
```bash
docker run --name=reddconomy_test \
-eREDDCONOMY_VERSION_URL="https://ci_deploy.frk.wf/Reddconomy-rblb_latest.txt" \
-eREDDCONOMY_DOWNLOAD_URL="https://ci_deploy.frk.wf/Reddconomy.jar-{VERSION}.aes256" \
-eREDDCONOMY_DOWNLOAD_PASSWORD="XYZWTF" \
 -d -p 8099:8099  -v /srv/reddconomy_testnet:/data --restart=always riccardoblb/reddconomy_test:amd64
```