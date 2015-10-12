# INSTALL FINGERPRINT READER
#sudo add-apt-repository ppa:fingerprint/fingerprint-gui
#sudo apt-get update
#sudo apt-get install libbsapi policykit-1-fingerprint-gui fingerprint-gui

class fingerprintgui {

exec { "add-apt-repository":
    command => "/usr/bin/add-apt-repository ppa:fingerprint/fingerprint-gui"
}

#The easiest/cleanest approach is to use the require parameter which is available for all resource types.
#package { "zend-server-ce-php-5.2":
#  ensure  => latest,
#  require  => Exec['apt-get update'],
#}

exec { "apt-get update":
    command => "/usr/bin/apt-get update"
}

exec { "apt-get install":
    command => "/usr/bin/apt-get install -y libbsapi policykit-1-fingerprint-gui fingerprint-gui"
}


}