#ifndef BLOCKBENCH_EOSDB_H_
#define BLOCKBENCH_EOSDB_H_

#include <iostream>
#include <string>
#include <unordered_map>

#include "../core/eos_utils.h"
#include "../core/properties.h"
#include "../core/utils.h"
#include "../core/timer.h"
#include "../core/db.h"

namespace ycsbc {

class EOSDB : public DB {
 public:
  EOSDB(const std::string &endpoint,
        const std::string &wl_name, unsigned deploy_wait_sec);

  void Init(std::unordered_map<std::string, double> *pendingtx,
            SpinLock *lock) {
    pendingtx_ = pendingtx;
    txlock_ = lock;
  }

  int Read(const std::string &table, const std::string &key,
           const std::vector<std::string> *fields, std::vector<KVPair> &result);

  // no scan operation support
  int Scan(const std::string &table, const std::string &key, int len,
           const std::vector<std::string> *fields,
           std::vector<std::vector<KVPair>> &result) {
    return DB::kOK;
  }

  int Update(const std::string &table, const std::string &key,
             std::vector<KVPair> &values);

  int Insert(const std::string &table, const std::string &key,
             std::vector<KVPair> &values);

  int Delete(const std::string &table, const std::string &key);

  int GetTip();

  std::vector<std::string> PollTxn(int block_number);

 private:
  std::unordered_map<std::string, double> *pendingtx_;
  SpinLock *txlock_;

  std::string from_account_, to_account_, endpoint_;
  std::vector<std::string> poll_tx_by_hash(std::string block_hash);

  BBUtils::SmartContractType sctype_;
};

}  // ycsbc

#endif  // BLOCKBENCH_EOSDB_H_
