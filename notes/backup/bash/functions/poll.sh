#!/bin/bash

poll() {
    delay=${1}
    command=${2}
	echo "delay: $delay"
	echo "command: $command"
	
    if [[ -z $delay ]]; then
		echo "USAGE1: poll <delay> <command>";
    elif [[ -z $command ]]; then
		echo "USAGE2: poll <delay> <command>";
	else
		while :
		do
			echo "$command";
			$command;
			sleep $delay;
		done
	fi;
}
