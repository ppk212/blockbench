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
