import "classes/*.pp"

#$PROJ_DIR = "/home/vagrant/ltp"

Exec {
    path => "/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin",
}

class dev {

    class {
        mysql:;
#        motd:;
#        resolv:;
#        bash:;
#        bash: before => Class[links];
#        links:;
    }
}

include dev
