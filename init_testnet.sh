#!/bin/bash
#Force testnet

echo "server=1
rpcuser=rpcuser
rpcpassword=rpcpassword
rpcport=45443
rpcallowip=0.0.0.0/0
keypool=1500" > "${DATA_DIR}/${CONFIG_FILE}"

if [ "$COIN" = "reddcoin" ];
then
echo "
testnet=1
addnode=110.141.192.170
" >> "${DATA_DIR}/${CONFIG_FILE}"
elif [ "$COIN" = "dogecoin" ];
then
echo "
testnet=1
addnode=testnets.chain.so
addnode=suchdig.com
addnode=testdoge.lionservers.de
addnode=senatorwhiskers.com
" >> "${DATA_DIR}/${CONFIG_FILE}"
fi

if [ "$GEN" != "" ];
then
echo "gen=1
genproclimit=1" >> "${DATA_DIR}/${CONFIG_FILE}"
fi

echo "1" > "${DATA_DIR}/bootstrapped"
/init.sh $@