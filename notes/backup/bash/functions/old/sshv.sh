#!/bin/bash

sshv() {
    sshkey annai;
    if [[ $2 ]]; then
		ssh -o StrictHostKeyChecking=no centos@132.249.227.$1 "$2";
    elif [[ $1 ]]; then
		ssh -o StrictHostKeyChecking=no centos@132.249.227.$1;	
	fi
}
