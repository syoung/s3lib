#!/bin/bash

sshkey() {
    username=${1}
	homedir=$(getHomeDir);

    if [ $username != "syoung" ] && [ $username != "illuminadev" ] && [ $username != "agua" ] && [ $username != "aguadev" ] && [ $username != "annai" ]; then
        echo "doRepos    Username $username not recognised"
        return
    fi
        
    cp ~/.ssh/config-$username ~/.ssh/config ;
    ssh-add "$homedir/syoung/.ssh/$username/github/id_rsa" 2> /dev/null;
    ssh-add "$homedir/syoung/.ssh/$username/bitbucket/id_rsa" 2> /dev/null;    
}
