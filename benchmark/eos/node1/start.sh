#!/bin/bash                                                                        

NODEOSBINDIR="../../../../eos/build/bin" #수정!
DATADIR="node1/" #수정!

./stop_wallet.sh
./start_wallet.sh
./stop.sh
echo -e "Starting Nodeos \n";
ulimit -n 65535 #맥북은 코맨트 아웃!
ulimit -s 64000 #맥북은 코맨트 아웃!

rm -rf ./data/{blocks,nodeos.pid,state,snapshots,stderr.txt}

$NODEOSBINDIR/nodeos  --delete-all-blocks --genesis-json genesis.json --data-dir ./ --config-dir ./ > stdout.txt 2> stderr.txt &  echo $! > /nodeos.pid                                                                                                                                    



