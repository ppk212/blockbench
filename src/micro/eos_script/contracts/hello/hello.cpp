#include <eosio/eosio.hpp>

using namespace eosio;

class [[eosio::contract]] hello : public contract {
  public:
      using contract::contract;

      [[eosio::action]]
      void hi(int num) {
         print( "Hello, ", num);
      }
};

EOSIO_DISPATCH( hello, (hi) )
