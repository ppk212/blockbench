#!/bin/bash

################################################################################
#
#
###############################################################################

NODEOSBINDIR="../../../../eos/build/bin" #수정!
DATADIR="Wallet" # 수정!
WALLET_HOST="127.0.0.1"
WALLET_POSRT="3000"


./stop_wallet.sh
$NODEOSBINDIR/keosd --data-dir $DATADIR --http-server-address $WALLET_HOST:$WALLET_POSRT $@ & echo $! > $DATADIR/wallet.pid
