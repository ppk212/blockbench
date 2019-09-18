#!/bin/bash
################################################################################
#
# Scrip Created by http://CryptoLions.io
# For EOS Junlge testnet
#
# https://github.com/CryptoLions/
#
################################################################################

EOSIO_PRODUCER_KEY="$( jq -r '.EOSIO_PRODUCER_PUB_KEY' "00_CONFIG.conf" )"
CONTRACTS_FOLDER="$( jq -r '.SMART_CONTRACT_FOLDER' "00_CONFIG.conf" )"


./cleos.sh create account eosio hello $EOSIO_PRODUCER_KEY $EOSIO_PRODUCER_KEY -p eosio

./cleos.sh set contract hello $CONTRACTS_FOLDER/hello -p hello
