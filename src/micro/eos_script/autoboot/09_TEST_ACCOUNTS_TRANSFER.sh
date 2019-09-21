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
EXP1_ACCOUNT="$( jq -r '.EXP1_ACCOUNT' "00_CONFIG.conf" )"
EXP2_ACCOUNT="$( jq -r '.EXP2_ACCOUNT' "00_CONFIG.conf" )"
EXP3_ACCOUNT="$( jq -r '.EXP3_ACCOUNT' "00_CONFIG.conf" )"
EXP4_ACCOUNT="$( jq -r '.EXP4_ACCOUNT' "00_CONFIG.conf" )"
EXP5_ACCOUNT="$( jq -r '.EXP5_ACCOUNT' "00_CONFIG.conf" )"
EXP6_ACCOUNT="$( jq -r '.EXP6_ACCOUNT' "00_CONFIG.conf" )"
EXP7_ACCOUNT="$( jq -r '.EXP7_ACCOUNT' "00_CONFIG.conf" )"

./cleos.sh transfer eosio $INIT_ACCOUNT  "150000000.0000 EOS" "init"
./cleos.sh transfer eosio $EXP1_ACCOUNT "150000000.0000 EOS" "init"
./cleos.sh transfer eosio $EXP2_ACCOUNT "150000000.0000 EOS" "init"
./cleos.sh transfer eosio $EXP3_ACCOUNT "150000000.0000 EOS" "init"
./cleos.sh transfer eosio $EXP4_ACCOUNT "150000000.0000 EOS" "init"
./cleos.sh transfer eosio $EXP5_ACCOUNT "150000000.0000 EOS" "init"
./cleos.sh transfer eosio $EXP6_ACCOUNT "150000000.0000 EOS" "init"
./cleos.sh transfer eosio $EXP7_ACCOUNT "150000000.0000 EOS" "init"

