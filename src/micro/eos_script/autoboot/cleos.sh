#!/bin/bash
################################################################################
#
# Script for IBCT private_net
# https://github.com/junep89/ibctprivate
#
###############################################################################

NODEOSBINDIR="/home/samuel/eos/build/bin" ##수정!!

WALLETHOST="127.0.0.1"
NODEHOST="127.0.0.1"
NODEPORT="8011"
WALLETPORT="3000"



$NODEOSBINDIR/cleos -u http://$NODEHOST:$NODEPORT --wallet-url http://$WALLETHOST:$WALLETPORT "$@"

