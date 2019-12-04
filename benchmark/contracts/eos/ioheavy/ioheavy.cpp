#include <eosio/eosio.hpp>

using namespace eosio;

class [[eosio::contract("ioheavy")]] ioheavy : public eosio::contract {

public:
  ioheavy(name receiver, name code,  datastream<const char*> ds):
                                     contract(receiver, code, ds) {}

  [[eosio::action]]
  void scan(uint64_t start_key, uint64_t size) {
    for(uint64_t i = 0; i < size; i++) {
	    store.find(getKey(start_key+i));
    }
  }

  [[eosio::action]]
  void write(uint64_t start_key, uint64_t size) {
    for(uint64_t i = 0; i < size; i++) {
	    store.insert(make_pair(getKey(start_key+i), getVal(start_key+i)));
    }
  }

private:
  const char* ALPHABET = "abcdefghijklmnopqrstuvwxy#$%^&*()_+[]{}|;:,./<>?"
                         "`~abcdefghijklmnopqrstuvwxy#$%^&*()_+[]{}|;:,./<>"
                         "?`~abcdefghijklmnopqrstuvwxy#$%^&*()_+[]{}|;:,./<>?`~";

  std::map<std::string, std::string> store;
 
  std::string getVal(uint64_t k) {
    std::string str;

    for(uint64_t i = 0; i < 100; i++) {
	    str += ALPHABET[k%50+i];
    }

    return str;
  }
  
  std::string getKey(uint64_t k) {
    std::string str;

    for(uint64_t i = 0; i < 20; i++) {
            str += ALPHABET[k%50+i];
    }

    return str;
  }
  
};    
