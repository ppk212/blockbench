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
    
./cleos.sh create account eosio experiment11 $EOSIO_PRODUCER_KEY $EOSIO_PRODUCER_KEY -p eosio
./cleos.sh create account eosio experiment12 $EOSIO_PRODUCER_KEY $EOSIO_PRODUCER_KEY -p eosio
./cleos.sh create account eosio experiment13 $EOSIO_PRODUCER_KEY $EOSIO_PRODUCER_KEY -p eosio
./cleos.sh create account eosio experiment14 $EOSIO_PRODUCER_KEY $EOSIO_PRODUCER_KEY -p eosio
./cleos.sh create account eosio experiment15 $EOSIO_PRODUCER_KEY $EOSIO_PRODUCER_KEY -p eosio
./cleos.sh create account eosio experiment21 $EOSIO_PRODUCER_KEY $EOSIO_PRODUCER_KEY -p eosio
./cleos.sh create account eosio experiment22 $EOSIO_PRODUCER_KEY $EOSIO_PRODUCER_KEY -p eosio
./cleos.sh create account eosio experiment23 $EOSIO_PRODUCER_KEY $EOSIO_PRODUCER_KEY -p eosio
./cleos.sh create account eosio experiment24 $EOSIO_PRODUCER_KEY $EOSIO_PRODUCER_KEY -p eosio
./cleos.sh create account eosio experiment25 $EOSIO_PRODUCER_KEY $EOSIO_PRODUCER_KEY -p eosio
