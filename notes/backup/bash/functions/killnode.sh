#!/bin/bash

function killnode() {
    input=${1}
    echo "input: $input"

    #### SHOW ALL node PROCESSES
    all=$(ps aux | egrep -e "node\s+\S+\.js");
    echo
    echo "all node processes"
    echo $all
    echo

    #### FIND THE PROCESS IDS
    if [ "$input" != "" ]; then
	echo "killing all '$input' processes"
	array=$(ps aux | egrep -e "node\s+\S+\.js" | egrep -e "$input.js" | xargs -n 12  | cut -d " " -f 2);
    else	
	echo "killing all node processes"
	array=$(ps aux | egrep -e "node\s+\S+\.js" | xargs -n 12  | cut -d " " -f 2);
    fi

    #### KILL THE PROCESSES
    for pid in $array; do
	echo "kill -9 $pid";
	kill -9 $pid;
    done;
    echo
}