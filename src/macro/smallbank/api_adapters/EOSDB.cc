#include <restclient-cpp/restclient.h>
#include <string>
#include <vector>
#include <iostream>

#include <thread> 
#include "EOSDB.h"
#include "utils/chaincode_apis.h"
#include "utils/timer.h"

using namespace RestClient;
using namespace std;
const string CHAIN_END_POINT = "/chain";
const string BLOCK_END_POINT = "/chain/blocks";


// get all tx from the start_block until latest
vector<string> EOSDB::poll_tx(int block_number) {
  return poll_txs_by_block_number(endpoint_, block_number); 
}

int EOSDB::get_tip_block_number(){
  return decode_hex(get_json_field(
      send_jsonrpc_request(endpoint_, REQUEST_HEADERS, GET_BLOCKNUMBER),
      "result"));
}

void EOSDB::add_to_queue(string json){
  double start_time = time_now();
  string txn_hash = get_json_field(json, "message"); 
  txlock_->lock(); 
  (*pendingtx_)[txn_hash] = start_time;
  txlock_->unlock();
}

// no error handler, assume always success
void EOSDB::deploy(const std::string& dbname, const std::string& endpoint) {
  endpoint_ = endpoint; 
  std::vector<std::string> args; 
  from_address_ = get_from_address(endpoint_);
  cout << "from address: " << from_address_ << endl;
  auto receipt = deploy_smart_contract(endpoint_, from_address_, "smallbank");
  int deploy_wait_sec = 20;
  while(to_address_.size() < 10) {
    std::this_thread::sleep_for(std::chrono::seconds(deploy_wait_sec));
    to_address_ = lookup_smart_contract_address_or_die(endpoint_, receipt);
    cout << "to address: " << to_address_ << endl; 
    deploy_wait_sec = 10;
  }
  //sleep(2);  
}

void EOSDB::Amalgate(unsigned acc1, unsigned acc2) {
  double start_time = time_now();
  std::string txn_hash = submit_amalgate_txn(to_string(acc1), to_string(acc2), 
      endpoint_, from_address_, to_address_);
  //std::cout << "amalgate:" << txn_hash << std::endl;
  txlock_->lock();
  (*pendingtx_)[txn_hash] = start_time;
  txlock_->unlock(); 
}

void EOSDB::GetBalance(unsigned acc) {
  double start_time = time_now();
  std::string txn_hash = submit_getBalance_txn(to_string(acc),
      endpoint_, from_address_, to_address_);
  //std::cout << "getBalance:" << txn_hash << std::endl;
  txlock_->lock();
  (*pendingtx_)[txn_hash] = start_time;
  txlock_->unlock();
}

void EOSDB::UpdateBalance(unsigned acc, unsigned amount) {
  double start_time = time_now();
  std::string txn_hash = submit_updateBalance_txn(to_string(acc), amount,
      endpoint_, from_address_, to_address_);
  //std::cout << "updateBalance:" << txn_hash << std::endl;
  txlock_->lock();
  (*pendingtx_)[txn_hash] = start_time;
  txlock_->unlock();
}

void EOSDB::UpdateSaving(unsigned acc, unsigned amount) {
  double start_time = time_now();
  std::string txn_hash = submit_updateSaving_txn(to_string(acc), amount,
      endpoint_, from_address_, to_address_);
  //std::cout << "updateSaving:" << txn_hash << std::endl;
  txlock_->lock();
  (*pendingtx_)[txn_hash] = start_time;
  txlock_->unlock();
}

void EOSDB::SendPayment(unsigned acc1, unsigned acc2, unsigned amount) {
  double start_time = time_now();
  std::string txn_hash = submit_sendPayment_txn(to_string(acc1), to_string(acc2), amount,
      endpoint_, from_address_, to_address_);
  //std::cout << "sendPayment:" << txn_hash << std::endl;
  txlock_->lock();
  (*pendingtx_)[txn_hash] = start_time;
  txlock_->unlock();
}

void EOSDB::WriteCheck(unsigned acc, unsigned amount) {
  double start_time = time_now();
  std::string txn_hash = submit_writeCheck_txn(to_string(acc), amount,
      endpoint_, from_address_, to_address_);
  //std::cout << "writeCheck:" << txn_hash << std::endl;
  txlock_->lock();
  (*pendingtx_)[txn_hash] = start_time;
  txlock_->unlock();
}
