#!/bin/bash
################################################################################
#
# Scrip Created by Gyurae Kim
#
###############################################################################
 
DIR="/home/samuel/blockbench/src/micro/eos_script/node1/Wallet" #수정!!

    if [ -f $DIR"/wallet.pid" ]; then
        pid=$(cat $DIR"/wallet.pid")
        echo $pid
        kill $pid
        rm -r $DIR"/wallet.pid"

        echo -ne "Stoping Wallet"

        while true; do
            [ ! -d "/proc/$pid/fd" ] && break
            echo -ne "."
            sleep 1
        done
        echo -ne "\rWallet stopped. \n"

    fi

