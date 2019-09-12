#include <eosio/eosio.hpp>

using namespace eosio;

class [[eosio::contract]] donothing : public contract {
  public:
      using contract::contract;

      [[eosio::action]]
      void nothing() {
      }
};
