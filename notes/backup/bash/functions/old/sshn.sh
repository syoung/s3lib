#!/bin/bash

sshn() {
    sshkey annai;
    if [[ $2 ]]; then
		ssh -o StrictHostKeyChecking=no -t syoung@23.252.245.$1 "$2";
    elif [[ $1 ]]; then
		ssh -o StrictHostKeyChecking=no -t syoung@23.252.245.$1;	
	fi
}
