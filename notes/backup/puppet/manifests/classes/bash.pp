class bash {

	Exec {
		path => "/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin",
	}

	define copyBash($sourcedir, $targetdir, $name) {
		notice("copyBash    \$sourcedir $sourcedir")
		notice("copyBash    \$targetdir $targetdir")
	
		# COPY BASH_PROFILE
		notice("copyBash    DOING copy_${name}_bash_profile")
		exec { "copy_${name}_profile":
			  command => "cp $sourcedir/.bash_profile $targetdir/.bash_profile",
			  creates => "$targetdir/.bash_profile"
		}
		
		notice("copyBash    DOING insert_${name}_bashrc")
		# INSERT LINE INTO BASHRC
		file { "$targetdir/.bash_profile":
			ensure => present,
		}
	
		->
		
		file_line { "insert_${name}_bashrc":
			line => "source $targetdir/.bash_profile",
			path => "$targetdir/.bashrc",
		}
		notice("copyBash    COMPLETED insert_${name}_bashrc")
	}
	
	#### COPY username BASH PROFILE
	$sourcedir	=	"/home/vagrant/notes/bash/syoung"
	$targetdir	=	"/home/vagrant"
	notice("bash    \$sourcedir $sourcedir")
	notice("bash    \$targetdir $targetdir")
	
	copyBash{ 'username':
		sourcedir	=>	$sourcedir,
		targetdir	=>	$targetdir,
		name		=>	"vagrant",
	}	
	
	#### COPY root BASH PROFILE
	$rootsourcedir	=	"/home/vagrant/notes/bash/root"
	$roottargetdir	=	"/root"
	notice("bash    \$rootsourcedir $rootsourcedir")
	notice("bash    \$roottargetdir $roottargetdir")

	copyBash{ 'root':
		sourcedir	=>	$rootsourcedir,
		targetdir	=>	$roottargetdir,
		name		=>	"root",
	}		
}

