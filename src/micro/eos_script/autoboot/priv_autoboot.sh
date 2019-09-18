#!/bin/bash    
killall nodeos

#unlock wallet with the keys inside
#update walletpassword.txt for the new wallet!
#KEYS
#eosio pub: EOS5kiTBoD38FxXTmcPzJS3EjtcusKE2WkEfjGEPFTnnth21hQMHa
#eosio priv: 5KX9iLDRus4jevcBRPArmPRrkQFD9MBtTEdjAxnYMR5a9wcs46W
#ryangenesis1 (first bp) pub: EOS8KdvkTPgvRHfW5zzTx8UsZaHeYycqgxyvC7Q6eHbqK8LijVQro
#ryangenesis2 priv: 5Jp4CoW2tNQ8TtZeLJoZjtaT7RF4oa9NUGPP1Hj6Dp1UnFDoWgp 

#unlock wallet
./cleos.sh wallet unlock < ./walletpassword.txt &> /dev/null

#run eosio node. see datadir for logs
/home/eos/eos/build/programs/nodeos/nodeos -e -p eosio --plugin eosio::producer_plugin --max-transaction-time=300 --plugin eosio::chain_api_plugin --plugin eosio::net_api_plugin --signature-provider=EOS5kiTBoD38FxXTmcPzJS3EjtcusKE2WkEfjGEPFTnnth21hQMHa=KEY:5KX9iLDRus4jevcBRPArmPRrkQFD9MBtTEdjAxnYMR5a9wcs46W --genesis-json /home/eos/ibctprivate/genesis.json --config-dir /home/eos/ibctprivate --delete-all-blocks > /home/eos/ibctprivate/stdout.txt 2> /home/eos/ibctprivate/stderr.txt & echo $! > /home/eos/ibctprivate/nodoes.pid

#give time for the node to be initialized.
sleep 2s

#run booting sequences. sleep 1s between each sript for actions to get propagated
./02* 
./03*
./04_T*
#./04_2*
#set contract setpriv might take too long so that it sometimes gets reject.
#there fore run in three times to make sure that the contract is set properly
#changes: in order to prevent transactions taking more than 30ms and being refused, eosio::producer_plugin --max-transaction-time=300 parameter has been added to eosio node
./05*
#./05*
#./05*
##
./06*
./07*

#run ryangenesis1 node. see /home/eos/ibct_bios/starting_node_config.ini for configurations.
/home/eos/ibctprivate/node1/start.sh  &> /dev/null
#give time for the node to be initialized
sleep 2s

./cleos.sh system regproducer ryangenesis1 EOS57wGFHsp85BV2o7WBfTLibUX8ZsbwFK5THmAQ6seKbgT3fsG3X "ibctmini.io" -p ryangenesis1
./cleos.sh system delegatebw ryangenesis1 ryangenesis1  "75000000.0000 EOS" "75000000.0000 EOS" 
./cleos.sh system voteproducer prods ryangenesis1 ryangenesis1
# at this point you will see ryangensis1 as a head block producer

#resign now
./08*  &> /dev/null
sleep 2s
./cleos.sh get info
#now manually shutdown eosio nodeos
