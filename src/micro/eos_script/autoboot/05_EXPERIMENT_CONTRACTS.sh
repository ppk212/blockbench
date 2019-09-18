#!/bin/bash
################################################################################
#
# Scrip Created by http://CryptoLions.io
# For EOS Junlge testnet
#
# https://github.com/CryptoLions/
#
################################################################################

CONTRACTS_FOLDER="$( jq -r '.EXPERIMENT_CONTRACT_FOLDER' "00_CONFIG.conf" )"


./cleos.sh set contract cpuheavy $CONTRACTS_FOLDER/cpuheavy -p cpuheavy
./cleos.sh set contract donothing $CONTRACTS_FOLDER/donothing -p donothing
./cleos.sh set contract kvstore $CONTRACTS_FOLDER/kvstore -p kvstore
./cleos.sh set contract smallbank $CONTRACTS_FOLDER/smallbank -p smallbank
./cleos.sh set contract ioheavy $CONTRACTS_FOLDER/ioheavy -p ioheavy


