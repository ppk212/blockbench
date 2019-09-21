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

EXP1_ACCOUNT="$( jq -r '.EXP1_ACCOUNT' "00_CONFIG.conf" )"
EXP1_PUB_KEY="$( jq -r '.EXP1_PUB_KEY' "00_CONFIG.conf" )"
EXP2_ACCOUNT="$( jq -r '.EXP2_ACCOUNT' "00_CONFIG.conf" )"
EXP2_PUB_KEY="$( jq -r '.EXP2_PUB_KEY' "00_CONFIG.conf" )"
EXP3_ACCOUNT="$( jq -r '.EXP3_ACCOUNT' "00_CONFIG.conf" )"
EXP3_PUB_KEY="$( jq -r '.EXP3_PUB_KEY' "00_CONFIG.conf" )"
EXP4_ACCOUNT="$( jq -r '.EXP4_ACCOUNT' "00_CONFIG.conf" )"
EXP4_PUB_KEY="$( jq -r '.EXP4_PUB_KEY' "00_CONFIG.conf" )"
EXP5_ACCOUNT="$( jq -r '.EXP5_ACCOUNT' "00_CONFIG.conf" )"
EXP5_PUB_KEY="$( jq -r '.EXP5_PUB_KEY' "00_CONFIG.conf" )"
EXP6_ACCOUNT="$( jq -r '.EXP6_ACCOUNT' "00_CONFIG.conf" )"
EXP6_PUB_KEY="$( jq -r '.EXP6_PUB_KEY' "00_CONFIG.conf" )"
EXP7_ACCOUNT="$( jq -r '.EXP7_ACCOUNT' "00_CONFIG.conf" )"
EXP7_PUB_KEY="$( jq -r '.EXP7_PUB_KEY' "00_CONFIG.conf" )"

./cleos.sh system newaccount --stake-net "150000000.0000 EOS" --stake-cpu "150000000.0000 EOS" --buy-ram "10000.0000 EOS" eosio $INIT_ACCOUNT $INIT_PUB_KEY $INIT_PUB_KEY -p eosio

./cleos.sh system newaccount --stake-net "150000000.0000 EOS" --stake-cpu "150000000.0000 EOS" --buy-ram "10000.0000 EOS" eosio $EXP1_ACCOUNT $EXP1_PUB_KEY $EXP1_PUB_KEY -p eosio

./cleos.sh system newaccount --stake-net "150000000.0000 EOS" --stake-cpu "150000000.0000 EOS" --buy-ram "10000.0000 EOS" eosio $EXP2_ACCOUNT $EXP2_PUB_KEY $EXP2_PUB_KEY -p eosio

./cleos.sh system newaccount --stake-net "150000000.0000 EOS" --stake-cpu "150000000.0000 EOS" --buy-ram "10000.0000 EOS" eosio $EXP3_ACCOUNT $EXP3_PUB_KEY $EXP3_PUB_KEY -p eosio

./cleos.sh system newaccount --stake-net "150000000.0000 EOS" --stake-cpu "150000000.0000 EOS" --buy-ram "10000.0000 EOS" eosio $EXP4_ACCOUNT $EXP4_PUB_KEY $EXP4_PUB_KEY -p eosio

./cleos.sh system newaccount --stake-net "150000000.0000 EOS" --stake-cpu "150000000.0000 EOS" --buy-ram "10000.0000 EOS" eosio $EXP5_ACCOUNT $EXP5_PUB_KEY $EXP5_PUB_KEY -p eosio

./cleos.sh system newaccount --stake-net "150000000.0000 EOS" --stake-cpu "150000000.0000 EOS" --buy-ram "10000.0000 EOS" eosio $EXP6_ACCOUNT $EXP6_PUB_KEY $EXP6_PUB_KEY -p eosio

./cleos.sh system newaccount --stake-net "150000000.0000 EOS" --stake-cpu "150000000.0000 EOS" --buy-ram "10000.0000 EOS" eosio $EXP7_ACCOUNT $EXP7_PUB_KEY $EXP7_PUB_KEY -p eosio
