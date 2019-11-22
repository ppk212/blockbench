#include <eosio/eosio.hpp>

using namespace eosio;

class [[eosio::contract("kvstore")]] kvstore : public eosio::contract {

public:
  
  kvstore(name receiver, name code,  datastream<const char*> ds): contract(receiver, code, ds), stores(receiver, code.value) {}

  [[eosio::action]]
  void set(uint64_t user, std::string value) {
      stores.emplace(get_self(), [&]( auto& row ) {
       row.key = user;
       row.value = value;
      });
  }
  [[eosio::action]]
  std::string get(uint64_t user) {
    for(auto& item:stores) {
	    if(item.key == user) {
		    return item.value;
	    }
    }
    return "No found";
  }

private:
  struct [[eosio::table]] pair {
	  uint64_t key;
    std::string value;

    uint64_t primary_key() const { return key; }

    EOSLIB_SERIALIZE( pair, (key)(value))
  };
  typedef eosio::multi_index<"pair"_n, pair> stores_index;
  stores_index stores;
};    
