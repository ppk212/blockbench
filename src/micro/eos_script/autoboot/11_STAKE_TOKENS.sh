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

./cleos.sh system delegatebw $INIT_ACCOUNT $INIT_ACCOUNT "100000000.0000 EOS" "50000000.0000 EOS"

#./cleos.sh push action eosio delegatebw '{"from":"'$INIT_ACCOUNT'", "receiver":"'$INIT_ACCOUNT'", "stake_net_quantity":"1000.0000 EOS", "stake_cpu_quantity":"100.0000 EOS", "transfer": true}' -p $INIT_ACCOUNT
