class googlechrome ($path='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/X11R6/bin', $destFile  ='jdk-7u40-linux-x64.tar.gz', $sourceURL ='http://download.oracle.com/otn-pub/java/jdk/7u40-b43/jdk-7u40-linux-x64.tar.gz') {

#  $required_packages = ['libnss3-1d',
#                        'libxss1',]


  Exec {
    path    => "${path}",
  }

#  ##Install the Required Packages for google-chrome-stable
#  package { $required_packages:
#    ensure => installed,
#    before => Exec["wget -O ${destFile} ${sourceURL}"],
#  }
#
  ## Retrieve the Destination File from the Source URL.
  exec {"wget -O ${destFile} ${sourceURL}":
    cwd     => '/tmp',
    creates => "/tmp/${destFile}",
    unless  => 'dpkg -s google-chrome-stable|grep "ok installed"',
  }
#
#  ## Install the Destination File using dpkg
#  exec {"dpkg -i ${destFile}":
#    require => Exec["wget -O ${destFile} ${sourceURL}"],
#    cwd     => '/tmp',
#    unless  => 'dpkg -s google-chrome-stable|grep "ok installed"',
#  }
}                                                                                                                                                                                                                                             
