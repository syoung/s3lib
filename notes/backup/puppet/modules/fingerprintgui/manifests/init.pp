# INSTALL FINGERPRINT READER
class fingerprintgui {

exec { "add-apt-repository":
    command => "/usr/bin/add-apt-repository ppa:fingerprint/fingerprint-gui"
}

exec { "apt-get update":
    command => "/usr/bin/apt-get update"
}

Package {
    ensure => "installed"
#  require  => Exec['apt-get update'],
}

package { "libbsapi": } 
package { "policykit-1-fingerprint-gui": }
package { "fingerprint-gui":   }



}