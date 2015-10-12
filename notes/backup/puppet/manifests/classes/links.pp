class links {

	#### GET username
	$username 	= 	hiera('username') 

	
#    file { "/mnt/software":
#    	 ensure => "link",
#	 recurse=> "false",
#        owner	=> 'syoung',
#         group	=> 'syoung',
#	 target	=> "/home/syoung/software"
#    }

#    exec { "create_software_link":
#     	  command => "/bin/ln -s /mnt/software /home/syoung/software",
#     	  creates => "/home/syoung/software"
#    }

    exec { "create_annai_link":
     	  command => "/bin/ln -s /mnt/repos/private/syoung/annai /home/syoung/annai",
     	  creates => "/home/syoung/annai"
    }

    exec { "create_notes_link":
     	  command => "/bin/ln -s /mnt/repos/private/syoung/notes /home/syoung/notes",
     	  creates => "/home/syoung/notes"
    }

    exec { "create_misc_link":
     	  command => "/bin/ln -s /mnt/repos/private/syoung/misc /home/syoung/misc",
     	  creates => "/home/syoung/misc"
    }

}