# BlockBench Deployment Scripts
  
## Setup
Run the `install.sh` script inside `ethereum` , `hyperledger` , `quorum` and eos directory to install `geth` ,
hyperledger-fabric and EOS respectively. Both need `sudo` privilege.
More details in [ethereum](ethereum/README.md), [hyperledger](hyperledger/README.md) , [parity](pairty/README.md) , [quorum_raft](quorum_raft/README.md) , [quorum_vote](quorum_vote/README.md) and [EOS](eos/README.md) directories

## Source structure
+ Smart contract sources are in `contracts` directory
+ Instructions and scripts to run benchmarks for Ethereum, Hyperledger , Parity , Quorum and EOS are in [ethereum](ethereum),
[hyperledger](hyperledger) , [parity](pairty) , [quorum_raft](quorum_raft) , [quorum_vote](quorum_vote) and [EOS](eos) directories respectively

## Others
+ Notes on implementation and deployment:
    + [Smart contracts in Ethereum & Parity & quorum](ethereum/contracts.md)
    + [Chaincode in Hyperledger](hyperledger/contracts.md)
    + [Smart contracts in EOS](eos/contracts.md)
