class mysql {

Package {
    ensure => "latest",
}

$packages = $operatingsystem ? {
    ubuntu =>
    [
        "mysql-common",
        "mysql-server",
        "mysql-client-core-5.5",
        "libmysqlclient-dev",
###  "libmysqlclient16-dev",
##  "libmysqlclient-dev",
### "mysql-config",
    ],
    centos =>
    [
        "mysql-server",
    ],
}
notice("mysql    packages: $packages")

notice("mysql     BEFORE INSTALL PACKAGES")
package {
    $packages:
        ensure => installed;
}
notice("mysql     AFTER INSTALL PACKAGES")

$mysql  =   hiera("mysql")
notice("mysql    mysql: $mysql")
service {
    $mysql["daemon"]:
        ensure => running,
        hasrestart => true,
        hasstatus => true;
}

}


##
##  exec { "Set MySQL server root password":
##    subscribe => [ Package["MySQL-server"], Package["MySQL-client"], Package["MySQL-shared"] ],
##    refreshonly => true,
##    unless => "mysqladmin -uroot -p$password status",
##    path => "/bin:/usr/bin",
##    command => "mysqladmin -uroot password $password",
##  }
