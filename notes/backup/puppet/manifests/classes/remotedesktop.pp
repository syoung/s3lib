# INSTALL REMOTE DESKTOP
class remotedesktop {

exec { "apt-get update":
    command => "/usr/bin/apt-get update"
}

Package {
    ensure => "installed"
}

#http://sourceforge.net/projects/rdesktop/files/latest/download?source=dlp

package { "libx11-dev": } 
package { "rdesktop": } 



}