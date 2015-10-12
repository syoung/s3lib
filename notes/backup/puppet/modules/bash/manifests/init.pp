class bash {

    # COPY BASH_PROFILE
    exec { "copy_syoung_bash_profile":
     	  command => "/bin/cp /mnt/repos/private/syoung/notes/bash/syoung/.bash_profile /home/syoung/.bash_profile",
     	  creates => "/home/syoung/.bash_profile"
    }
    
    # INSERT LINE INTO BASHRC
    file { '/home/syoung/.bash_profile':
	ensure => present
    }
    -> file_line { 'source_syoung_bash_profile':
	line => 'source ~/.bash_profile',
	path => '/home/syoung/.bashrc',
    }
    
    # COPY BASH_PROFILE
    exec { "copy_root_bash_profile":
     	  command => "/bin/cp /mnt/repos/private/syoung/notes/bash/root/.bash_profile /root/.bash_profile",
     	  creates => "/root/.bash_profile"
    }
    
    # INSERT LINE INTO BASHRC
    file { '/root/.bash_profile':
	ensure => present
    }
    -> file_line { 'source_root_bash_profile':
	line => 'source ~/.bash_profile',
	path => '/root/.bashrc',
    }
}