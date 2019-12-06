#include <eosio/eosio.hpp>

using namespace eosio;

class [[eosio::contract("smallbank")]] smallbank : public eosio::contract {
public:
  smallbank(name receiver, name code,  datastream<const char*> ds): contract(receiver, code, ds) {}

  [[eosio::action]]
  void almagate(std::string arg0, std::string arg1) {
	  uint64_t bal1 = savingStore[arg0];
	  uint64_t bal2 = checkingStore[arg1];

	  checkingStore[arg0] = 0;
	  savingStore[arg1] = bal1 + bal2;
  }

  [[eosio::action]]
  uint64_t getbalance(std::string arg0) {
	  uint64_t bal1 = savingStore[arg0];
	  uint64_t bal2 = checkingStore[arg0];

	  return bal1 + bal2;
  }

  [[eosio::action]]
  void updatebalance(std::string arg0, uint64_t arg1) {
	  uint64_t bal1 = checkingStore[arg0];
	  uint64_t bal2 = arg1;

	  checkingStore[arg0] = bal1 + bal2;
  }

  [[eosio::action]]
  void updatesaving(std::string arg0, uint64_t arg1) {
	  uint64_t bal1 = savingStore[arg0];
	  uint64_t bal2 = arg1;

	  savingStore[arg0] = bal1 + bal2;
  }

  [[eosio::action]]
  void sendpayment(std::string arg0, std::string arg1, uint64_t arg2) {
	  uint64_t bal1 = checkingStore[arg0];
	  uint64_t bal2 = checkingStore[arg1];
	  uint64_t amount = arg2;

	  bal1 -= amount;
	  bal2 += amount;

	  checkingStore[arg0] = bal1;
	  checkingStore[arg1] = bal2;
  }

  [[eosio::action]]
  void writecheck(std::string arg0, uint64_t arg1) {
	  uint64_t bal1 = checkingStore[arg0];
	  uint64_t bal2 = savingStore[arg0];
	  uint64_t amount = arg1;

	  if(amount < bal1 + bal2) {
		  checkingStore[arg0] = bal1 - amount - 1;
	  }
	  else {
		  checkingStore[arg0] = bal1 - amount;
	  }
  }

private:
  std::map<std::string, uint64_t> savingStore;
  std::map<std::string, uint64_t> checkingStore;
};
