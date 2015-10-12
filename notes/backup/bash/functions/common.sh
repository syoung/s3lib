#!/bin/bash

echo "SHELL: $SHELL"

function getHomeDir() {
	USER_HOME=$(eval echo ~${SUDO_USER})
	HOMEDIR=`expr $USER_HOME : '\([\/a-zA-Z0-9]*\)/\([^\/]*\)'`
    
	echo $HOMEDIR
}

