#!/bin/bash
################################################################################
#
# Scrip Created by http://CryptoLions.io
# For EOS Junlge testnet
#
# https://github.com/CryptoLions/
#
# Updated by https://ppk212.github.io/
#
################################################################################

WALLET_PASS="$( jq -r '.WALLET_PASSWD' "00_CONFIG.conf" )"
EOSIO_PRIV="$( jq -r '.EOSIO_PRODUCER_PRIV_KEY' "00_CONFIG.conf" )"
NODE1_PRIV="$( jq -r '.NODE1_PRIV_KEY' "00_CONFIG.conf" )"

CLEOS="/home/samuel/blockbench/src/micro/eos_script/node1" #!수정

$CLEOS/cleos.sh wallet unlock <<< $WALLET_PASS

$CLEOS/cleos.sh wallet import <<< $EOSIO_PRIV
$CLEOS/cleos.sh wallet import <<< $NODE1_PRIV
