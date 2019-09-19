#!/bin/bash                                                                        

NODEOSBINDIR="../../../../eos/build/bin" #수정!
DATADIR="node1/" #수정!

$DATADIR/stop.sh
echo -e "Starting Nodeos \n";
ulimit -n 65535 #맥북은 코맨트 아웃!
ulimit -s 64000 #맥북은 코맨트 아웃!

rm -rf ./data/{blocks,nodeos.pid,state,snapshots,stderr.txt}

$NODEOSBINDIR/nodeos  --delete-all-blocks --genesis-json $DATADIR/genesis.json --data-dir $DATADIR --config-dir $DATADIR > $DATADIR/stdout.txt 2> $DATADIR/stderr.txt &  echo $! > $DATADIR/nodeos.pid                                                                                                                                    



