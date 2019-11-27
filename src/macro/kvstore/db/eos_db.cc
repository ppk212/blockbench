#include "db/eos_db.h"

#include <thread>
#include <chrono>

using namespace std;
using namespace BBUtils::EOSUtils;

namespace ycsbc {

EOSDB::EOSDB(const string &endpoint, const string &wl_name, unsigned deploy_wait_sec)
    : endpoint_(endpoint) {
  if (wl_name == "ycsb") {
    sctype_ = BBUtils::SmartContractType::KVStore;
  } else if (wl_name == "smallbank") {
    sctype_ = BBUtils::SmartContractType::SmallBank;
  } else {
    sctype_ = BBUtils::SmartContractType::DoNothing;
  }
  from_account_ = "kvstore";
  cout << "from account: " << from_account_ << endl;
  cout << "endpoint: " << endpoint_ << endl;
  //auto receipt = "kvstore";

  //std::this_thread::sleep_for(std::chrono::seconds(deploy_wait_sec));
  //to_address_ = lookup_smart_contract_address_or_die(endpoint_, receipt);
  //cout << "to address: " << to_address_ << endl;
  //cout << "Smart contract " + wl_name + " deploy ready" << endl;
}

/// ignore table
/// ignore field
/// read value indicated by a key
int EOSDB::Read(const string &table, const string &key,
                const vector<string> *fields, vector<KVPair> &result) {
  double start_time = utils::time_now();
  std::cout<<"READ IN?"<<std::endl;
  std::string txn_hash =
      (sctype_ == BBUtils::SmartContractType::DoNothing)
          ? submit_do_nothing_txn(endpoint_, from_account_, to_account_)
          : submit_get_txn(endpoint_, key, from_account_, to_account_);
  txlock_->lock();
  (*pendingtx_)[txn_hash] = start_time;
  txlock_->unlock();
  return DB::kOK;
}

// ignore table
// update value indicated by a key
int EOSDB::Update(const string &table, const string &key,
                  vector<KVPair> &values) {
  string val = "";
  for (auto v : values) {
    val += v.first + "=" + v.second + " ";
  }

  double start_time = utils::time_now();
  std::string txn_hash =
      (sctype_ == BBUtils::SmartContractType::DoNothing)
          ? submit_do_nothing_txn(endpoint_, from_account_, to_account_)
          : submit_set_txn(endpoint_, key, val, from_account_, to_account_);
  txlock_->lock();
  (*pendingtx_)[txn_hash] = start_time;
  txlock_->unlock();

  return DB::kOK;
}

// ignore table
// ignore field
// concate values in KVPairs into one long value
int EOSDB::Insert(const string &table, const string &key,
                  vector<KVPair> &values) {
  return Update(table, key, values);
}

// ignore table
// delete value indicated by a key
int EOSDB::Delete(const string &table, const string &key) {
  vector<KVPair> empty_val;
  return Update(table, key, empty_val);
}

// get all tx from the start_block until latest
vector<string> EOSDB::PollTxn(int block_number) {
  return poll_txs_by_block_number(endpoint_, block_number);
}

int EOSDB::GetTip() { return get_tip_block_number(endpoint_); }
}  // ycsbc
