# INSTALL COMPIZ CONFIG SETTINGS MANAGER
class ccsm {

exec { "apt-get update":
    command => "/usr/bin/apt-get update",
}

package { "compizconfig-settings-manager":
  ensure  => latest
}

}

