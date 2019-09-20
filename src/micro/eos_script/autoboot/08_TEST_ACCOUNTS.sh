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

./cleos.sh system newaccount --stake-net "150000000.0000 EOS" --stake-cpu "150000000.0000 EOS" --buy-ram "10000.0000 EOS" eosio subnodeeos11 EOS514Z9asT9DJbdwwdbh4uEyFM8s9xyVi8jzBHKHL8UZPgznaku9 EOS514Z9asT9DJbdwwdbh4uEyFM8s9xyVi8jzBHKHL8UZPgznaku9 -p eosio
