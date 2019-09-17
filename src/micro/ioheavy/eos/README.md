# Prepare
At first, use [start_eos.sh](../../eos_script/start_eos.sh) to start nodeos client, then open another terminal to do next step

# Experiment Setup

Need to deploy the ioheavy smart contract first.
The source code of ioheavy smart contract source code in EOSIO is `blockbench/benchmark/contracts/eos/ioheavy` as a reference.

The smart contract into blockchain(eos) was deployed as account named "ioheavy".

# Run

* Write: `node write.js start_key total_key_num` write `total_key_num` key-value pairs starting with key `start_key` sequentially.
* Scan: `node scan.js star_key total_key_num` scan `total_key_num` key-value pairs starting with key `start_key` sequentially.
