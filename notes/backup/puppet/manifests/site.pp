#node default {
#    include sudo
#}

class site {

import "classes/mods.pp"
import "classes/bash.pp"

case $operatingsystem {
    "ubuntu" : {
        notice("site    INSTALLING ubuntu emacs23")
        package { emacs23: ensure => installed }
        notice("site    COMPLETED ubuntu emacs23")
    }
    "centos" : {
        notice("site    INSTALLING centos emacs")
        package { emacs: ensure => installed }
        notice("site    COMPLETED centos emacs")
    }
}


file { "/etc/puppet/hiera.yaml":
    ensure => link,
    target => "/home/vagrant/notes/backup/puppet/hiera.yaml",
}

->

file { "/etc/puppet/hiera":
    ensure    => link,
    target    => "/home/vagrant/notes/backup/puppet/hiera",
    force     =>  true,
}


->

class {
#    mods: before => Class[bash];
    bash:;
}


notice("site    DOING FLAGFILE")

file { "/tmp/FLAGFILE":
    ensure      =>  present,
    content     =>  "FLAG FILE"
}


}

