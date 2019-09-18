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

./cleos.sh set contract eosio $CONTRACTS_FOLDER/eosio.system -p eosio

./cleos.sh push action eosio setpriv '["eosio.msig",1]' -p eosio

