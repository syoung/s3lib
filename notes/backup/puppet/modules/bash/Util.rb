module Bash::Util
	newfunction(:copyBash) do |args|
	#class copyBash ($sourcedir, $targetdir) {
		sourcedir 	=	args[0]
		targetdir	=	args[1]
		notify {"bash    \$sourcedir $sourcedir":}
		notify {"bash    \$targetdir $targetdir":}
	
		# COPY BASH_PROFILE
		exec { "copy_bash_profile":
			  command => "cp $sourcedir/.bash_profile $targetdir/.bash_profile2",
			  creates => "/home/syoung/.bash_profile2"
		}
		
		# INSERT LINE INTO BASHRC
		file { "$targetdir/.bash_profile2":
			ensure => present
		}
	
		-> file_line { "source_bash_profile":
			line => "source $targetdir/.bash_profile2",
			path => "$targetdir/.bashrc",
		}
	end
#}
end


