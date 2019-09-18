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
CONTRACT_ACCOUNT=($( jq -r '.CONTRACT_ACCOUNT' "00_CONFIG.conf" ))

# creatin eosio.msig, eosio.token, etc
for sa in "${CONTRACT_ACCOUNT[@]}"
do
    ./cleos.sh create account eosio $sa $EOSIO_PRODUCER_KEY $EOSIO_PRODUCER_KEY -p eosio
done
