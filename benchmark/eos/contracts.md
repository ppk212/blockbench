# EOS smart contracts
This article explains how we write, deploy, and invoke EOS smart contracts used in the benchmark. 

## Writing smart contracts
Use EOSIO to. For example, the key-value smart contract is written as follows:

```
#include <eosio/eosio.hpp>
using namespace eosio;
class [[eosio::contract("kvstore")]] kvstore : public eosio::contract {
public:
  kvstore(name receiver, name code,  datastream<const char*> ds): contract(receiver, code, ds) {}
  [[eosio::action]]
  void set(name user, std::string value) {
    stores_index stores( get_self(), get_first_receiver().value );
      stores.emplace(user, [&]( auto& row ) {
       row.key = user;
       row.value = value;
      });
  }
  [[eosio::action]]
  std::string get(name user) {
    stores_index stores( get_self(), get_first_receiver().value );
    auto user_value = stores.get(user.value);
    return user_value.value;
  }
private:
  struct [[eosio::table]] pair {
    name key;
    std::string value;
    uint64_t primary_key() const { return key.value; }
  };
  typedef eosio::multi_index<"pairs"_n, pair> stores_index;

};
```

## Deploying the contract
The contract must first be compiled into EOSIO bytecode and send to the blockchain as *data* of a transaction.
Before deploying, accounts for experiments should be generated  because each account can deploy one smart contract in EOS.
At the end, a unique `contractAddress` is generated, which is a hash of the following:

+ The account which deploy smart contract, i.e. eosio.
+ The transaction about deployment.
+ The bytecode of contract's abi. 

Thus, the same contract (bytecode) uploaded from two different account results in two distinct
`account`. In other words, two independent contracts are deployed. This is an [important distinction
to Hyperledger](../hyperledger/contracts.md): in this example, only one Hyperledger will be deployed. 


## Invoking contract methods
Once the contract is deploy at `account`, its method is invoked by sending transactions to it. Content of the transaction, its `data` field contains encoded input: a string of the following format:

    `

For instance, the encoding for the method call `set("hello", "world")` is as follows:
+ Method signature, generated by the same Solidity browser during compilation, i.e. `0x0xe942b516`
+ Off-set to the encoded first parameter (excluding the signature), padded to 32 bytes. Say this is X
+ Off-set to the encoded second parameter (excluding the signature), padded to 32 bytes. Say this is Y
+ Encoded first parameter, padded to 32-byte units. In this case, the encoding is 64 bytes (32 byte for
length, and 32 bytes for "hello")
+ Encoded second parameter, padded to 32-byte units. In this case, the encoding is 64 bytes (32 bytes for
length, and 32 bytes for "world")

Thus, `X=00..040` because the encoded first parameter starts at byte 64 after the signature. `Y=00..80`
because the encoded second parameter starts at byte 128 after the signature. Suppose the first string is
longer than 32 bytes, say it's 48 bytes (padded to 64), then `Y=00..a0` because the encoded second parameter
now starts at byte 160. 

Finally, the transaction is sent via RPC
    `curl -X POST <endpoint> {"jsonrpc": "2.0", "method": "eth_sendTransaction", "params": [{"gas": <gas>,
    "from": "<from_address>", "to": "<contractAddress>", "data": "<encodedMethod>"}], "id": 1}`
