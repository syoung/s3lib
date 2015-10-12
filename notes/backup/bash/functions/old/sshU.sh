#!/bin/bash

sshU() {
    sshkey syoung;
    if [[ $2 ]]; then
		ssh -o StrictHostKeyChecking=no ubuntu@132.249.227.$1 "$2";
    elif [[ $1 ]]; then
		ssh -o StrictHostKeyChecking=no ubuntu@132.249.227.$1;	
	fi
}
