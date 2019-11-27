make clean
killall geth
killall nodeos keosd
cd ../../micro/ethereum_script
./start_ethereum.sh
cd ../../macro/kvstore
make
