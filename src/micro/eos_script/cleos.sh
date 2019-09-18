#!/bin/bash
###############

NODEOSBINDIR="/home/samuel/eos/build/bin/"

WALLETHOST="127.0.0.1"
NODEHOST="127.0.0.1"
NODEPORT="8011"
WALLETPORT="3000"

$NODEOSBINDIR/cleos -u http://$NODEHOST:$NODEPORT --wallet-url http://$WALLETHOST:$WALLETPORT "$@"
