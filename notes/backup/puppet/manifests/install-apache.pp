import "classes/apache.pp"

Exec {
    path => "/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin",
}

class install {

    notice("copyBash    DOING load_cgi")

    if $operatingsystem == "centos" {
        notice("copyBash    centos")
        file_line { "load_cgi":
            line => "LoadModule cgi_module modules/mod_cgi.so",
            path => "/etc/httpd/conf/httpd.conf",
        }
    }
    else {
        notice("copyBash    ubuntu")
    
    }

#    class {
#        apache:;
#    }

    class { 'apache':
        mpm_module          => prefork,
        default_mods        => false,
        default_confd_files => false,
    }
}

include install
