#!/bin/bash
################################################################################
#
# Scrip Created by http://CryptoLions.io
# For EOS Junlge testnet
#
# https://github.com/CryptoLions/
#
################################################################################

CONTRACTS_FOLDER="$( jq -r '.SMART_CONTRACT_FOLDER' "00_CONFIG.conf" )"


./cleos.sh set contract eosio.token $CONTRACTS_FOLDER/eosio.token -p eosio.token
./cleos.sh set contract eosio.msig $CONTRACTS_FOLDER/eosio.msig -p eosio.msig



