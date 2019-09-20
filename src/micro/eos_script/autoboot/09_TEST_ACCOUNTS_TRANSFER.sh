#!/bin/bash
################################################################################
#
# Scrip Created by http://CryptoLions.io
# For EOS Junlge testnet
#
# https://github.com/CryptoLions/
#
################################################################################

INIT_ACCOUNT="$( jq -r '.INIT_ACCOUNT' "00_CONFIG.conf" )"

./cleos.sh transfer eosio $INIT_ACCOUNT  "150000000.0000 EOS" "init"
./cleos.sh transfer eosio subnodeeos11 "150000000.0000 EOS" "init"

