# INSTALL FINGERPRINT READER
class skype {

#exec { "add-apt-repository":
#    command => "/usr/bin/add-apt-repository deb http://archive.canonical.com/ $(lsb_release -sc) partner"
#}
#
exec { "apt-get update":
    command => "/usr/bin/apt-get update"
}

Package {
    ensure => "installed"
}

package { "skype": } 



}