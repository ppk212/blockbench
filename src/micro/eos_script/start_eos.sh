#!/bin/bash
NODEOSBINDIR="../../../../eos/build/bin/"
EOS_DATA=./data

./stop_eos.sh
mkdir data
killall nodeos

rm -rf ./data/{blocks,nodoes.pid,state,snapshots,stderr.txt}

$NODEOSBINDIR/nodeos -e -p eosio --delete-all-blocks --genesis-json ./genesis.json --data-dir $EOS_DATA --config-dir $EOS_DATA  2> $EOS_DATA/stderr.txt & echo $! > $EOS_DATA/nodeos.pid

cat data/nodeos.pid

echo "Node is running."

./node1/start.sh

echo "New node is running."

./node1/start_wallet.sh

echo "Keosd is running in 3000 Port."

#$DATADIR/stop_wallet.sh
#$NODEOSBINDIR/keosd --data-dir $DATADIR --http-server-address $WALLET_HOST:$WALLET_POST

