class mods {

	notice("mods    DOING insert_${name}_bashrc")

	Exec {
		path => "/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin",
	}

	package { "ruby-hiera":
		ensure	=>	absent,
	}

	->

	exec {"gem install hiera hiera-puppet": }

#   ->
#	package { "puppetlabs-stdlib":
#		ensure	=>	installed,
#	}
##	exec {"puppet module install puppetlabs/stdlib": }

}

#include mods
