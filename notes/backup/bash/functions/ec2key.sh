#!/bin/bash

ec2key() {

    username=${1}
	homedir=$(getHomeDir);
	
    if [ $username == "syoung" ] || [ $username == "invasionmoo" ]; then 
        source $homedir/syoung/notes/agua/keypair/$username/ec2/exports.sh;
        return
    elif [ $username == "annai" ]; then
 		echo "source $homedir/syoung/annai/aws/keypair/exports.sh"
        source $homedir/syoung/annai/aws/keypair/exports.sh;
    else
        echo "doRepos    Username $username not recognised"
    fi
        
}
