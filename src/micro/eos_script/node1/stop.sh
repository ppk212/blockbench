#!/bin/bash


DIR="node1" #수정!


    if [ -f $DIR"/nodeos.pid" ]; then
        pid=`cat $DIR"/nodeos.pid"`
        echo $pid
        kill $pid
        rm -r $DIR"/nodeos.pid"

        echo -ne "Stoping Nodeos"

        while true; do
            [ ! -d "/proc/$pid/fd" ] && break
            echo -ne "."
            sleep 1
        done
        echo -ne "\rNodeos Stopped.    \n"
    fi
