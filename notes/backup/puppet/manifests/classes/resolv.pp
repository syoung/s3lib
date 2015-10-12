class resolv {	
	notice("resolv    hostname: $hostname")

	file {'motd':
		ensure  => file,
		path    => '/etc/motd',
		mode    => 0644,
	
			content => "This VM's facts:
			
ipaddress              : ${ipaddress}
fqdn                   : ${fqdn}
operatingsystem        : ${operatingsystem}
operatingsystemrelease : ${operatingsystemrelease}
puppetversion          : ${puppetversion}

Web login:
URL: https://${ipaddress_eth0}
User: puppet@example.com
Password: learningpuppet

",
	
	}

	file { "/etc/resolv.conf":
		ensure => present
	}
	
	-> file_line { "insert_${hostname}_resolv":
		line => "$hostname example.com",
		path => "/etc/resolv.conf",
	}
}

