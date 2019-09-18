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
INIT_PUB_KEY="$( jq -r '.INIT_PUB_KEY' "00_CONFIG.conf" )"

./cleos.sh system newaccount --stake-net "150000000.0000 EOS" --stake-cpu "150000000.0000 EOS" --buy-ram "10000.0000 EOS" eosio $INIT_ACCOUNT $INIT_PUB_KEY $INIT_PUB_KEY -p eosio


