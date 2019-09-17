#include <eosio/eosio.hpp>

using namespace eosio;

class [[eosio::contract("smallbank")]] smallbank : public eosio::contract {

public:
  
  smallbank(name receiver, name code,  datastream<const char*> ds): contract(receiver, code, ds) {}

  [[eosio::action]]
  void almagate(name arg0, name arg1) {
	 savingStore saving( get_self(), get_first_receiver().value );
	 checkingStore checking( get_self(), get_first_receiver().value );

	 uint64_t bal1, bal2;

	 auto temp = saving.get(arg0.value);
         bal1 = temp.value;

	 temp = checking.get(arg1.value);
	 bal2 = temp.value;

	 auto iterator = checking.find(arg0.value);
	 if( iterator == checking.end() )
	 {
		 checking.emplace(arg0, [&]( auto& row) {
			 row.key = arg0;
			 row.value = 0;
		 });
	 }
	 else {
		 checking.modify(iterator, arg0, [&]( auto& row ) {
			 row.key = arg0;
			 row.value = 0;
		 });
	 }

	 iterator = saving.find(arg1.value);
         if( iterator == saving.end() )
         {
                 saving.emplace(arg1, [&]( auto& row) {
                         row.key = arg1;
                         row.value = bal1 + bal2;
                 });
         }
         else {
                 saving.modify(iterator, arg1, [&]( auto& row ) {
                         row.key = arg1;
                         row.value = bal1 + bal2;
                 });
         }	 

  }
  [[eosio::action]]
  uint64_t getbalance(name arg0) {
	  savingStore saving( get_self(), get_first_receiver().value );
          checkingStore checking( get_self(), get_first_receiver().value );

          uint64_t balance = saving.get(arg0.value).value + checking.get(arg0.value).value;

	  return balance;
  }
  [[eosio::action]]
  void updatebalance(name arg0, uint64_t arg1) {
	  checkingStore checking( get_self(), get_first_receiver().value );

	  uint64_t bal1 = checking.get(arg0.value).value;
	  uint64_t bal2 = arg1;

	  auto iterator = checking.find(arg0.value);
          if( iterator == checking.end() )
          {
                  checking.emplace(arg0, [&]( auto& row) {
                          row.key = arg0;
                          row.value = bal1 + bal2;
                  });
          }
          else {
                  checking.modify(iterator, arg0, [&]( auto& row ) {
                          row.key = arg0;
                          row.value = bal1 + bal2;
                  });
          }
  }
  [[eosio::action]]
  void updatesaving(name arg0, uint64_t arg1) {
	  savingStore saving( get_self(), get_first_receiver().value );

          uint64_t bal1 = saving.get(arg0.value).value;
          uint64_t bal2 = arg1;

          auto iterator = saving.find(arg0.value);
          if( iterator == saving.end() )
          {
                  saving.emplace(arg0, [&]( auto& row) {
                          row.key = arg0;
                          row.value = bal1 + bal2;
                  });
          }
          else {
                  saving.modify(iterator, arg0, [&]( auto& row ) {
                          row.key = arg0;
                          row.value = bal1 + bal2;
                  });
          }
  }
  [[eosio::action]]
  void sendpayment(name arg0, name arg1, uint64_t arg2) {
	  checkingStore checking( get_self(), get_first_receiver().value );

          uint64_t bal1 = checking.get(arg0.value).value;
          uint64_t bal2 = checking.get(arg1.value).value;
	  uint64_t amount = arg2;

	  bal1 -= amount;
	  bal2 += amount;

          auto iterator = checking.find(arg0.value);
          if( iterator == checking.end() )
          {
                  checking.emplace(arg0, [&]( auto& row) {
                          row.key = arg0;
                          row.value = bal1;
                  });
          }
          else {
                  checking.modify(iterator, arg0, [&]( auto& row ) {
                          row.key = arg0;
                          row.value = bal1;
                  });
          }

	  iterator = checking.find(arg1.value);
          if( iterator == checking.end() )
          {
                  checking.emplace(arg1, [&]( auto& row) {
                          row.key = arg1;
                          row.value = bal2;
                  });
          }
          else {
                  checking.modify(iterator, arg1, [&]( auto& row ) {
                          row.key = arg1;
                          row.value = bal2;
                  });
          }
  }
  [[eosio::action]]
  void writecheck(name arg0, uint64_t arg1) {
	  checkingStore checking( get_self(), get_first_receiver().value );
	  savingStore saving( get_self(), get_first_receiver().value );

          uint64_t bal1 = checking.get(arg0.value).value;
          uint64_t bal2 = saving.get(arg0.value).value;
          uint64_t amount = arg1;

          auto iterator = checking.find(arg0.value);

	  uint64_t result;

	  if( amount < bal1 + bal2 ) {
		  result = bal1 - amount - 1;
	  }
	  else {
		  result = bal1 - amount;
	  }

          if( iterator == checking.end() )
          {
                  checking.emplace(arg0, [&]( auto& row) {
                          row.key = arg0;
                          row.value = result;
                  });
          }
          else {
                  checking.modify(iterator, arg0, [&]( auto& row ) {
                          row.key = arg0;
                          row.value = result;
                  });
          }
  }

private:
  struct [[eosio::table]] pair {
    name key;
    uint64_t value;
    uint64_t primary_key() const { return key.value; }
  };

  typedef eosio::multi_index<"pairs"_n, pair> savingStore;
  typedef eosio::multi_index<"pairs"_n, pair> checkingStore;
};    
