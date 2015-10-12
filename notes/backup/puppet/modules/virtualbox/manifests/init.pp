class virtualbox {

  case $operatingsystem {
    "Ubuntu", "Debian": {
      include debianvirtualbox
    }
    default: {
      notice("Currently only debian like systems are supported. Skipping...")
    }
  }
  
  class debianvirtualbox {

    exec { '/usr/bin/apt-get -q update':
      before   => Exec['install-virtualbox-repo'],
    }
    
    exec { 'install-virtualbox-repo':
      command  => '/usr/bin/wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | apt-key add -',
      before   => Package['virtualbox'],
    }
    
    package {"virtualbox": ensure => installed,}
  }
}
