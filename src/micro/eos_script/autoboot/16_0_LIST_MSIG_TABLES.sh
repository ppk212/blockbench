#!/bin/bash
################################################################################
#
# Scrip Created by http://CryptoLions.io
# For EOS Junlge testnet
#
# https://github.com/CryptoLions/
#
################################################################################

ACCOUNT="ryangenesis1"

echo "Proposals: "
./cleos.sh get table eosio.msig $ACCOUNT proposal
echo "Approvals: "
./cleos.sh get table eosio.msig $ACCOUNT approvals
