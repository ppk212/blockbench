make clean
killall nodeos keosd geth
cd ../../micro/eos_script
./start_eos.sh
cd ../../macro/kvstore
make
