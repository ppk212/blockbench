#!/bin/bash

	if [ -f "./nodeos.pid" ]; then
		pid='cat "./nodeos.pid"'
		echo $pid
		kill $pid
		rm -r "./nodeos.pid"

		echo -ne "Stopping Nodes"

		while true; do
			[ ! -d "/proc/$pid/fd" ] && break
			echo -ne "."
			sleep 1
		done
		echo -ne "\rNodes Stopped. \n"
	fi
