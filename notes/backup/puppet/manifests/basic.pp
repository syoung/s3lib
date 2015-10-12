class basic{

notice("OPERATINGSYSTEM: $operatingsystem")
#case $operatingsystem {
#    "ubuntu" : {
#        notice("basic    UBUNTU")
#        # run apt-get update before anything else runs
#        class {'basic::update_aptget': stage => first} ->
#        class {"basic::users":} ->
#        class {"basic::packages":} ->
#        class {"basic::helpers":}
#        notice("basic    UBUNTU COMPLETED")
#    }
#    "centos" : {
#        notice("basic    CENTOS")
#        # run apt-get update before anything else runs
#        class {'basic::update_yum': stage => first} ->
#        class {"basic::users":} ->
#        class {"basic::packages":} ->
#        class {"basic::helpers":}
#        notice("basic    CENTOS COMPLETED")
#    }
#}
#

notice("basic    RUNNING")
class {"basic::users": stage => first} ->
class {"basic::packages":} ->
class {"basic::helpers":}
notice("basic    COMPLETED")

class basic::users{
    notice("basic::users")

    group { "puppet":
      ensure => "present",
    }
}

# just some packages
class basic::packages{
    notice("basic::packages")

    package{"tmux": ensure => installed}
    package{"curl": ensure => installed}
#    package{"vim":  ensure => installed}
}

class basic::helpers{
    notice("basic::helpers")

    $puppet_dir = "/vagrant/puppet"
    # script to run puppet
    file{"/usr/local/bin/runpuppet":
      content => " \
      sudo puppet apply -vv  --modulepath=$puppet_dir/modules/ $puppet_dir/manifests/main.pp\n",
      mode    => 0755
    }
    
    # script to run librarian-puppet
    file{"/usr/local/bin/runlibrarian":
      content => "cd $puppet_dir && sudo librarian-puppet update \n",
      mode    => 0755
    }
}

# brings the system up-to-date after importing it with Vagrant
# runs only once after booting (checks /tmp/apt-get-update existence)
class basic::update_aptget{
    notice("basic::update_aptget")

    exec{"apt-get update && touch /tmp/apt-get-updated":
      unless      =>  "test -e /tmp/apt-get-updated",
      logoutput   =>  on_failure
    }
}

# runs only once after booting (checks /tmp/yum-update existence)
class basic::update_yum{
    notice("basic::update_yum")

    Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

    exec{"yum check-update && touch /tmp/yum-updated":
        unless      =>  "test -e /tmp/yum-updated",
        logoutput   =>  on_failure
    }
}


}