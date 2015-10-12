puppet


<entry [Wed 2014:02:26 21:47:35 EST] INSTALL PUPPET ON CENTOS AND UBUNTU>

# TODO : better checking of supported platform down to platform releases                                                    
#install puppet and git                                                                                                     
if [[ $LINUX_DISTRO == 'CentOS' ]]; then
    rpm -ivh http://yum.puppetlabs.com/el/6/products/i386/puppetlabs-release-6-7.noarch.rpm
    yum install -y git puppet puppet-server augeas hiera facter
    chkconfig puppetmaster on

elif [[ $LINUX_DISTRO == 'Ubuntu' ]]; then
    DEB_CODENAME=`grep CODENAME /etc/lsb-release | awk -F= '{print $2}'`
    PUPPET_REPO_PKG="puppetlabs-release-${DEB_CODENAME}.deb"
    curl -o $PUPPET_REPO_PKG http://apt.puppetlabs.com/${PUPPET_REPO_PKG}
    sudo dpkg -i $PUPPET_REPO_PKG
    rm $PUPPET_REPO_PKG
    apt-get update
    apt-get -y install git puppet puppetmaster augeas-tools hiera facter

else
    echo "Unsupported platform...  Only CentOS and Ubuntu are supported at this time"
    exit -1
fi

	
</entry>

<entry [Tue 2014:02:25 01:14:50 EST] AGUA - REPLACED librarian-puppet WITH puppet module install>

REPLACED THIS:

#
#echo "Installing librarian-puppet"
#PUPPET_DIR='/etc/puppet'
#if [ `gem query --local | grep librarian-puppet | wc -l` -eq 0 ]; then
#  gem install librarian-puppet
#	echo "DOING librarian-puppet install --clean"
#  cd $PUPPET_DIR && librarian-puppet install --clean
#else
#	echo "DOING librarian-puppet update"
#  cd $PUPPET_DIR && librarian-puppet update
#fi
#echo "Completed librarian-puppet installation"

WHERE Puppetfile IS:

forge "http://forge.puppetlabs.com"

mod "stdlib",
   :git => "git://github.com/puppetlabs/puppetlabs-stdlib.git"

mod "mysql", "2.1.0",
   :git => "git://github.com/puppetlabs/puppetlabs-mysql.git"

mod "apache", "0.10.0",
   :git => "git://github.com/puppetlabs/puppetlabs-apache.git"

mod "puppet-module-epel",
   :git => "git://github.com/stahnma/puppet-module-epel.git"

mod "rabbitmq",
   :git => "git://github.com/puppetlabs/puppetlabs-rabbitmq.git"

mod "nodejs",
   :git => "git://github.com/puppetlabs/puppetlabs-nodejs.git"

mod "java",
   :git => "git://github.com/puppetlabs/puppetlabs-java.git"
   

WITH THIS:

#### INSTALL MODULES
echo "Installing stahnma-epel"
puppet module install stahnma/epel --force
echo "Installing puppetlabs-stdlib"
puppet module install puppetlabs-stdlib --force
echo "Installing puppetlabs-mysql"
puppet module install puppetlabs-mysql --force
echo "Installing puppetlabs-apache"
puppet module install puppetlabs-apache --force
echo "Installing puppetlabs-rabbitmq"
puppet module install puppetlabs-rabbitmq --force
echo "Installing puppetlabs-nodejs"
puppet module install puppetlabs-nodejs --force
echo "Installing puppetlabs-java"
puppet module install puppetlabs-java --force


	
</entry>
<entry [Sun 2014:01:12 10:57:38 EST] FIXED ERROR FOR MISSING puppet-module: Unknown Puppet subcommand 'module'>

PROBLEM

puppet module install apache
	
	Error: Unknown Puppet subcommand 'module'


SOLUTION

gem install puppet-module
	
</entry>
<entry [Sun 2014:01:05 14:44:59 EST] FIXED wget FAILURE: 'certificate common name X doesn’t match requested host name Y'>

PROBLEM GET 

wget https://s3-us-west-1.amazonaws.com/aguadev/ec2-api-tools-1.6.9.0.zip
--2014-01-05 22:43:53--  https://s3-us-west-1.amazonaws.com/aguadev/ec2-api-tools-1.6.9.0.zip
	...
	ERROR: certificate common name “*.s3-us-west-1.amazonaws.com” doesn’t match requested host name “s3-us-west-1.amazonaws.com”.


SOLUTION

USE OPTION --no-check-certificate

wget --no-check-certificate https://s3-us-west-1.amazonaws.com/aguadev/ec2-api-tools-1.6.9.0.zip

	OK

	
</entry>
<entry [Sat 2014:01:04 22:07:10 EST] FIXED ERROR RUNNING yum install: 'Nothing to do' >

PROBLEM

YUM RETURNS AN ERROR MESSAGE WHICH PUPPET INTERPRETS AS NOT 'ZERO' AND FAILS OUT

puppet apply /aguadev/bin/install/resources/puppet/manifests/install-awscli.pp 

	...
	Error: Execution of '/usr/bin/yum -d 0 -e 0 -y install python2.7' returned 1: Error: Nothing to do
	...	
	Warning: /Stage[main]/Awscli/Exec[pip install awscli]: Skipping because of failed dependencies
	Notice: Finished catalog run in 65.94 seconds


MANUAL RUN OF YUM SHOWS ERROR OUTPUT:

/usr/bin/yum -d 0 -e 0 -y install python2.7
Error: Nothing to do


SOLUTION

SEPARATE OUT TROUBLESOME YUM INSTALL INTO ANOTHER *.pp FILE AND CALL THIS FIRST

puppet apply /aguadev/bin/install/resources/puppet/manifests/install-python27.pp


</entry>
<entry [Sat 2014:01:04 22:06:10 EST] SPECIFY OS-DEPENDENT PACKAGE NAME>

package {"openjdk-6-jdk":
	ensure => installed,
	name => $operatingsystem ? {
		Ubuntu => "openjdk-6-jdk",
		CentOS => "java-1.6.0-openjdk",
	}
}

</entry>
<entry [Thu 2013:12:19 08:41:34 EST] PUPPET OPENSTACK PROVISIONER>

https://forge.puppetlabs.com/puppetlabs/node_openstack
	
</entry>
<entry [Thu 2013:12:19 08:40:18 EST] PUPPET AND CLOUDFORMATION>

http://puppetlabs.com/blog/using-cloudformation-to-build-out-fully-functional-stacks-of-puppet-enterprise

http://puppetlabs.com/solutions/ec2
	
</entry>
<entry [Sun 2013:12:15 14:33:31 EST] FIXED ERROR: 'returns 100' ON exec>

SUMMARY: DON'T USE yum check-update BECAUSE IT RETURNS 100


PROBLEM

RUNNING EXEC

    exec{"yum check-update && touch /tmp/yum-updated":
		unless      =>  "test -e /tmp/yum-updated",
		logoutput   =>  on_failure
    }

GET THIS ERROR:
	
	returned 100 instead of one of [0] at...


DIAGNOSIS	

RUN COMMAND MANUALLY THEN CHECK FOR EXIT CODE USING echo $?

yum check-update && touch /tmp/yum-updated

echo $?
	
	100


SOLUTION


DON'T USE CHECK-UPDATE



</entry>
<entry [Sun 2013:12:15 14:32:15 EST] BOXEN github SITE>

https://github.com/boxen
	
</entry>
<entry [Sun 2013:12:15 10:26:35 EST] PUPPETLABS-STDLIBS DOWNLOAD URL>

https://forge.puppetlabs.com/puppetlabs/stdlib/4.1.0.tar.gz

OR INSTALL

puppet module install puppetlabs-stdlib

	
</entry>
<entry [Sun 2013:12:15 06:23:26 EST] VAGRANT-PUPPET-LIBRARIAN>

SUMMARY: BOOTSTRAP PUPPET, puppet-librarianAND REQUIRED MODULES

NB: INSTALLS puppet-librarian TO:

/home/vagrant/.puppet/modules
└── puppetlabs-stdlib (v4.1.0)


1. DOWNLOAD vagrant-puppet-librarian SCRIPTS

cd ~/software/vagrant
git clone https://github.com/mindreframer/vagrant-puppet-librarian.git


2. COPY OVER TO ~/notes/backup/puppet

cd ~/software/vagrant/vagrant-puppet-librarian/puppet
#cp manifests/main.pp ~/notes/backup/puppet/manifests
cp manifests/basic.pp ~/notes/backup/puppet/manifests
cp manifests/nodes.pp ~/notes/backup/puppet/manifests
cp manifests/nodes.pp ~/notes/backup/puppet/manifests
cp -r shell ~/notes/backup/puppet
cp Puppetfile ~/notes/backup/puppet


3. EDIT FILES TO 

emacs -nw ~/notes/backup/puppet/shell/bootstrap.sh

CREATE LINKS FROM /home/vagrant/notes/backup/puppet TO /vagrant/puppet


emacs -nw ~/notes/backup/puppet/manifests/main.pp

RUN site.pp AFTER COMPLETING basic.pp TO SETUP emacs, bash, ETC.



NOTES
-----

https://github.com/mindreframer/vagrant-puppet-librarian

Vagrant-puppet-librarian
this repository combines in a simple and effective way Librarian-Puppet + Puppet for Vagrant

Problem

I assume you know, what pain points Librarian-puppet solves, Librarian-puppet can help by managing the Puppet modules used by your Vagrant box. But you can not use puppet provisioner like intended, because modules are not all installed your first run (it's Librarian-Puppet's responsibility).

Solution

I have looked at similar solutions:

https://github.com/aggressivex/vagrant-startup-environment
https://github.com/purple52/librarian-puppet-vagrant
https://github.com/garethr/riemann-vagrant

I did not quite like them, because they force me to install librarian-puppet on my system. So I took the example from purple52 and changed it a bit (from two provisioners (shell + puppet) to just one) + some minor stuff.

The simple solution implemented here uses a shell provisioner in your Vagrant configuration to install and run Librarian-puppet and also run puppet.

Like this:

`puppet apply -vv  --modulepath=$PUPPET_DIR/modules/ $PUPPET_DIR/manifests/main.pp`
It also installs two scripts for you:

runpuppet
runlibrarian
So, you don't have to vagrant reload, which restarts your VM.... (duh???) Just execute runpuppet, if you changed your code... If you updated the Puppetfile, execute runlibrarian. Simple.

How to use

This repository is really just a template; copy the relevant files into your own project. Here's a breakdown of what's required:

Vagrantfile with simple shell provisioner definition
shell/bootstrap.sh - a simple shell provisioner to install and run Librarian-puppet and also Puppet
puppet/Puppetfile - configuration describing what Puppet modules to install. See the Librarian-puppet project for details.
puppet/manifests/main.pp - your main Puppet manifest.
puppet/.gitignore - configured to ignore temporary directories and files created by Librarian-puppet.


</entry>
<entry [Sun 2013:12:15 06:20:08 EST] PUPPET module COMMAND>

SEARCH FOR MODULES

puppet module search apache

INSTALL
puppet module install XXX

UNINSTALL
puppet module uninstall XXX

	
</entry>
<entry [Sun 2013:12:08 22:58:11 EST] USE librarian-puppet TO INSTALL PUPPET MODULES>

https://github.com/rodjek/librarian-puppet

1. INSTALL LIBRARIAN

gem install librarian-puppet

	Successfully installed thor-0.18.1
	Successfully installed librarian-puppet-0.9.10
	2 gems installed
	Installing ri documentation for thor-0.18.1...
	Installing ri documentation for librarian-puppet-0.9.10...
	Installing RDoc documentation for thor-0.18.1...
	Installing RDoc documentation for librarian-puppet-0.9.10...


2. USE LIBRARIAN TO INSTALL MODULES

CREATE Puppetfile IN PUPPET DIR, E.G.:

/etc/puppet/Puppetfile

	forge "http://forge.puppetlabs.com"
	
	mod "puppetlabs/razor"
	mod "puppetlabs/ntp", "0.0.3"
	
	mod "apt",
	  :git => "git://github.com/puppetlabs/puppetlabs-apt.git"
	
	mod "stdlib",
	  :git => "git://github.com/puppetlabs/puppetlabs-stdlib.git"


3. RUN LIBRARIAN

PUPPET_DIR=/etc/puppet
cd $PUPPET_DIR
librarian-puppet install --clean

OR UPDATE

PUPPET_DIR=/etc/puppet
cd $PUPPET_DIR
librarian-puppet update --verbose



	
</entry>
<entry [Sat 2013:12:07 16:35:42 EST] FIXED: INSTALL APACHE prefork MODULE>

PROBLEM

USING puppetlabs/apache CAN'T GET prefork MODULE INSTALLED:

class { 'apache':
    default_mods        => prefork,
    default_confd_files => false,
}


aptitude search apache2-mpm-

	p   apache2-mpm-event                    - transitional event MPM package for apache2     
	p   apache2-mpm-itk                      - transitional itk MPM package for apache2       
	p   apache2-mpm-prefork                  - transitional prefork MPM package for apache2   
	i   apache2-mpm-worker                   - transitional worker MPM package for apache2


SOLUTION

apt-get purge apache2-mpm-worker

THEN



	
</entry>
<entry [Sat 2013:12:07 13:53:50 EST] ADD NAMES TO SUDOERS>

http://serverfault.com/questions/314847/appending-a-line-to-a-file-if-it-doesnt-exist-using-puppet

Sudoers includes

As of sudo version 1.7.2, it supports an includedir directive which allows you to specify a directory to extend sudoers. Files in that directory must contain snippets of valid sudoers code, and sudo will read and use them exactly as though they'd been included in the original file. I make use of this in Puppet with a custom resource:

define sudo-include( content ) {
    file { "/etc/sudoers.d/$name":
        content => $content,
        mode => 0440,
        user => root,
        group => root,
    }
}

[...]

sudo-include { "moreusers":
    content => "\
joe   ALL=(ALL)  ALL
mike  ALL=(ALL)  NOPASSWD:ALL
"
}

When you use the sudo-include resource, it automatically creates the file in the right place with the right permissions, and all you need to do is give it a name and content.

	
</entry>
<entry [Fri 2013:12:06 00:21:01 EST] SEPARATE REPOS FOR HIERA AND PUPPET>

https://puppetlabs.com/blog/first-look-installing-and-using-hiera

Version control your Hiera data directory separately from your Puppet repository

The benefit of the :datadir: parameter in hiera.yaml is that you can use Facter fact values to determine the path of your Hiera data directory. For example, a site using two Puppet environments called 'development' and 'production' that has implemented the ssh module we outlined above might have the following directory tree at /etc/puppetlabs/puppet/environments

environments/
    |-- development
    |   |-- hieradata
    |   |   |-- Debian.yaml
    |   |   |-- RedHat.yaml
    |   |   `-- common.yaml
    |   |-- manifests
    |   |   `-- site.pp
    |   `-- modules
    |       `-- ssh
    `-- production
        |-- hieradata
        |   |-- Debian.yaml
        |   |-- RedHat.yaml
        |   `-- common.yaml
        |-- manifests
        |   `-- site.pp
        `-- modules
            `-- ssh
This site's hiera.yaml configuration file would look like the following:

---
:hierarchy:
    - %{operatingsystem}
    - common
:backends:
    - yaml
:yaml:
    :datadir: '/etc/puppetlabs/puppet/environments/%{environment}/hieradata'
	
	
Hiera automatically substitues the value of the current environment for %{environment} in hiera.yaml and allows for a Hiera data directory that's completely separate from Puppet manifests/modules.
	
</entry>
<entry [Wed 2013:12:04 15:00:53 EST] FILES AND CUSTOM FUNCTIONS>

http://docs.puppetlabs.com/guides/custom_functions.html

http://docs.puppetlabs.com/references/latest/type.html

LINK FILE

file { "/etc/inetd.conf":
  ensure => link,
  target => "/etc/inet/inetd.conf",
}


FILE PARAMETERS

file { 'resource title':
  path                    => # (namevar) The path to the file to manage.  Must be fully...
  ensure                  => # Whether the file should exist, and if so what...
  backup                  => # Whether (and how) file content should be backed...
  checksum                => # The checksum type to use when determining...
  content                 => # The desired contents of a file, as a string...
  ctime                   => # A read-only state to check the file ctime. On...
  force                   => # Perform the file operation even if it will...
  group                   => # Which group should own the file.  Argument can...
  ignore                  => # A parameter which omits action on files matching 
  links                   => # How to handle links during file actions.  During 
  mode                    => # The desired permissions mode for the file, in...
  mtime                   => # A read-only state to check the file mtime. On...
  owner                   => # The user to whom the file should belong....
  provider                => # The specific backend to use for this `file...
  purge                   => # Whether unmanaged files should be purged. This...
  recurse                 => # Whether and how to do recursive file management. 
  recurselimit            => # How deeply to do recursive management.  Values...
  replace                 => # Whether to replace a file or symlink that...
  selinux_ignore_defaults => # If this is set then Puppet will not ask SELinux...
  selrange                => # What the SELinux range component of the context...
  selrole                 => # What the SELinux role component of the context...
  seltype                 => # What the SELinux type component of the context...
  seluser                 => # What the SELinux user component of the context...
  show_diff               => # Whether to display differences when the file...
  source                  => # A source file, which will be copied into place...
  source_permissions      => # Whether (and how) Puppet should copy owner...
  sourceselect            => # Whether to copy all valid sources, or just the...
  target                  => # The target for creating a link.  Currently...
  type                    => # A read-only state to check the file...
  # ...plus any applicable metaparameters.
}

</entry>
<entry [Wed 2013:12:04 13:55:21 EST] GENERATE RANDOM PASSWORD WITH mkpasswd>

apt-get install whois
date | mkpasswd -s -
	
</entry>
<entry [Wed 2013:12:04 13:07:56 EST] USE blueprint TO GENERATE PUPPET SCRIPTS FROM EXISTING SERVER CONFIGS>

OVERVIEW OF blueprint
http://devstructure.com/blueprint/

GENERATE PUPPET SCRIPTS
http://devstructure.com/blueprint/#puppet-chef
	
</entry>
<entry [Wed 2013:12:04 09:12:54 EST] USE puppet-perl TO LOAD PERL MODULES>

https://github.com/example42/puppet-perl

	
</entry>
<entry [Wed 2013:12:04 05:06:38 EST] USE puppet-bootstrap TO INSTALL PUPPET>

A collection of single-file scripts to bootstrap your machines with Puppet.

https://github.com/hashicorp/puppet-bootstrap.git


	
</entry>
<entry [Wed 2013:12:04 04:37:51 EST] CONDITIONAL LOGIC: if, case, selectors>

http://docs.puppetlabs.com/learning/variables.html

If

    if str2bool("$is_virtual") {
      service {'ntpd':
        ensure => stopped,
        enable => false,
      }
    }
    else {
      service { 'ntpd':
        name       => 'ntpd',
        ensure     => running,
        enable     => true,
        hasrestart => true,
        require => Package['ntp'],
      }
    }


Case

    case $operatingsystem {
      centos: { $apache = "httpd" }
      # Note that these matches are case-insensitive.
      redhat: { $apache = "httpd" }
      debian: { $apache = "apache2" }
      ubuntu: { $apache = "apache2" }
      default: { fail("Unrecognized operating system for webserver") }
    }
    package {'apache':
      name   => $apache,
      ensure => latest,
    }

default is a special value, which does exactly what it sounds like.

Unlike the str2bool function above, fail doesn’t resolve to a value; instead, it fails compilation immediately with an error message.


Case matching

Case matches can be simple strings (like above), regular expressions, or comma-separated lists of either.

Here’s the example from above, rewritten to use comma-separated lists of strings:

    case $operatingsystem {
      centos, redhat: { $apache = "httpd" }
      debian, ubuntu: { $apache = "apache2" }
      default: { fail("Unrecognized operating system for webserver") }
    }

And here’s a regex example:

    case $ipaddress_eth0 {
      /^127[\d.]+$/: {
        notify {'misconfig':
          message => "Possible network misconfiguration: IP address of $0",
        }
      }
    }

String matching is case-insensitive, like the == comparison operator.

Regular expressions are denoted with the slash-quoting used by Perl and Ruby; they’re case-sensitive by default, but you can use the (?i) and (?-i) switches to turn case-insensitivity on and off inside the pattern.

Regex matches also assign captured subpatterns to $1, $2, etc. inside the associated code block, with $0 containing the whole matching string.



Selectors

    $apache = $operatingsystem ? {
      centos                => 'httpd',
      redhat                => 'httpd',
      /(?i)(ubuntu|debian)/ => 'apache2',
      default               => undef,
    }


Selectors can also be used directly as values for a resource attribute, but try not to do that, because it gets ugly fast.
	
</entry>
<entry [Wed 2013:12:04 04:34:39 EST] USE '$::ipaddress' FOR COMPATIBILITY WITH PUPPET 2.*>

http://docs.puppetlabs.com/learning/variables.html

People who write manifests to share with the public often adopt the habit of always using the $::variable notation when referring to facts.

As mentioned above, the double-colon prefix specifies that a given variable should be found at top scope. This isn’t actually necessary, since variable lookup will always reach top scope anyway. (See the scope chapter of the Puppet reference manual.)

However, explicitly asking for top scope helps work around two issues that can make public code behave unpredictably. One issue affects all versions of Puppet 2.x, and the other affected earlier versions of Puppet 2.7.x:

In Puppet 2.x: if a user declares a class from a public module inside one of their own classes, and their personal class sets a variable whose name matches the name of a fact that the public class is trying to access, the public class will get the local variable instead of the fact. This will generally cause the public class to fail or do something really strange.
In earlier versions of Puppet 2.7.x: the dynamic scope deprecation warnings would sometimes be improperly triggered when manifests accessed top scopes variables without the double-colon prefix. This was fixed in later versions, but was very annoying for a while.
Neither of these issues are relevant as of Puppet 3, but not everyone is using Puppet 3 yet, and a Puppet 3-based version of Puppet Enterprise is still forthcoming later this year. Since a lot of people are still writing public code meant to be used with Puppet 2.7, you still see this idiom a lot.
	
</entry>
<entry [Wed 2013:12:04 04:16:30 EST] INSTALL POSTGRESQL AND RESTART APACHE>

http://net.tutsplus.com/tutorials/php/vagrant-what-why-and-how/

This chunk of manifest will install the PHP extensions we need, then the notify option will let Apache know that you have installed new configuration, meaning it will restart.

	include postgresql
	 
	class {'postgresql::server': }
	 
	postgresql::db { 'pyrocms':
		owner     => 'pyrocms',
		password => 'password',
	}
This will set up a postgres server, create a database, called "pyrocms" and make sure a user, called "pyrocms" exists with the password provided.
Nearly finished! The last step is to ensure that you have writable files and folders set correctly:

	file { $docroot:
		ensure  => 'directory',
	}
	 
	file { "${docroot}system/cms/config/config.php":
		ensure  => "present",
		mode    => "0666",
		require => File[$docroot],
	}
	 
	$writeable_dirs = ["${docroot}system/cms/cache/", "${docroot}system/cms/config/", "${docroot}addons/", "${docroot}assets/cache/", "${docroot}uploads/"]
	 
	file { $writeable_dirs:
		ensure => "directory",
		mode   => '0777',
		require => File[$docroot],
	}

This will ensure that the Apache document root is there, the config file is set to 0666, and a few writable folders are set to 777.
There we have it!

To run all of this, simply reboot your vagrant instance, or run:

vagrant provision

If everything has worked correctly, you should see lots of blue text signaling that everything is being installed, but, if something goes wrong, you will see red. Google those errors and try again.
The modules used here are: Apache, Postgres, PHP and you can see the whole thing in action by cloning the PyroCMS Vagrant repo:

git clone --recursive git://github.com/pyrocms/devops-vagrant.git ~/vagrant/pyrocms
cd ~/vagrant/pyrocms
vagrant up


Point your browser to http://localhost:8089/ and you should see the installer. Easy stuff, huh?
	
</entry>
<entry [Wed 2013:12:04 03:34:54 EST] SET IP ADDRESS>

config.vm.network :hostonly, "198.18.0.11"

NB: choose a different one if it's aleady taken by another VM

	
</entry>
<entry [Wed 2013:12:04 03:12:14 EST] GENERATE A RANDOM NUMBER FOR hostname>

config.vm.hostname = "devops#{rand(01..99)}.vagrant.vm}"
	
</entry>
<entry [Wed 2013:12:04 02:57:59 EST] PUPPET IRC CHANNEL>

HOMEPAGE
www.freenode.net

HOW TO USE
http://freenode.net/using_the_network.shtml

PUPPET
http://en.irc2go.com/webchat/?net=freenode&room=openstack&nick=stuart

OPENSTACK
http://en.irc2go.com/webchat/?net=freenode&room=openstack&nick=stuart

	
</entry>
<entry [Wed 2013:12:04 02:57:41 EST] HOW TO CHANGE A FACTER fact>

http://www.puppetcookbook.com/posts/override-a-facter-fact.html

SET FACTER_* ENVIRONMENT VARIABLES, E.G.:

export FACTER_fqdn=box.example.com

OR

facter -p | grep ^basedir
env FACTER_basedir=/tmp
facter -p | grep ^basedir
	basedir => /tmp

	
</entry>
<entry [Sat 2013:11:30 00:57:22 EST] FIXED ERROR: 'Invalid resource type file_line'>

PROBLEM

GET THIS ERROR WHEN RUNNING PUPPET FILE WITH file_line:

Invalid resource type file_line


SOLUTION

INSTALL puppetlabs-stdlib MODULE

rm -fr  /etc/puppet/modules/stdlib
puppet module install puppetlabs-stdlib
	Notice: Preparing to install into /etc/puppet/modules ...
	Notice: Downloading from https://forge.puppetlabs.com ...
	Notice: Installing -- do not interrupt ...
	/etc/puppet/modules
	└── puppetlabs-stdlib (v4.1.0)

	OK

OR:

ADD CONFIGURATION PARAMETER ON PUPPET AGENT:

[main]
pluginsync=true


</entry>
<entry [Sat 2013:11:30 00:38:25 EST] INSTALL PUPPET DASHBOARD>

INSTALLATION INSTRUCTIONS
http://docs.puppetlabs.com/dashboard/manual/1.2

DOWNLOAD
cd 
wget http://downloads.puppetlabs.com/dashboard/puppet-dashboard-1.2.23.tar.gz




</entry>
<entry [Fri 2013:11:29 23:51:40 EST] FIXED ERROR: 'Unknown function hiera'>

SUMMARY: UPGRADE PUPPET TO 3.3.2


PROBLEM

WHEN RUN PUPPET APPLY USING hiera INSIDE PUPPET CLASS, GET THIS ERROR:

	Unknown function hiera


SOLUTION
	
UPGRADE PUPPET TO 3.3.2

1. UNINSTALL OLD PUPPETLABS VERSION

apt-get remove puppet puppet-common


2. INSTALL LATEST VERSION

INSTALL FACTER
wget http://downloads.puppetlabs.com/facter/facter-1.7.1.tar.gz
tar xvfz fact*.tar.gz
cd facter-1.7.1
ruby install.rb

INSTALL PUPPET
wget http://www.puppetlabs.com/downloads/puppet/puppet-3.2.2.tar.gz
tar xvfz puppet-3*tar.gz
cd ../puppet-3*
ruby install.rb

VERIFY

puppet --version

	3.2.2


	
</entry>
<entry [Fri 2013:11:29 23:48:10 EST] UBUNTU 12.10 PRE-INSTALLED PUPPET>

dpkg -s puppet

<!--
Package: puppet
Status: deinstall ok config-files
Priority: optional
Section: admin
Installed-Size: 110
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Architecture: all
Version: 2.7.18-4ubuntu1.2
Config-Version: 2.7.18-4ubuntu1.2
Depends: puppet-common (= 2.7.18-4ubuntu1.2), ruby1.8
Pre-Depends: dpkg (>= 1.15.7.2)
Recommends: rdoc
Suggests: puppet-el, vim-puppet, etckeeper
Conffiles:
 /etc/default/puppet 9e5a0cf174ccff1af10342297b8b1bdb
 /etc/init.d/puppet ce320d74aec94666accc8a29f25a9f48
Description: Centralized configuration management - agent startup and compatibility scripts
 This package contains the startup script and compatbility scripts for the
 puppet agent, which is the process responsible for configuring the local node.
 .
 Puppet lets you centrally manage every important aspect of your system
 using a cross-platform specification language that manages all the
 separate elements normally aggregated in different files, like users,
 cron jobs, and hosts, along with obviously discrete elements like
 packages, services, and files.
 .
 Puppet's simple declarative specification language provides powerful
 classing abilities for drawing out the similarities between hosts while
 allowing them to be as specific as necessary, and it handles dependency
 and prerequisite relationships between objects clearly and explicitly.
Homepage: http://projects.puppetlabs.com/projects/puppet
Original-Maintainer: Puppet Package Maintainers <pkg-puppet-devel@lists.alioth.debian.org>
-->
	
</entry>
<entry [Fri 2013:11:29 11:59:54 EST] FIXED ERROR: 'Cannot load backend json: cannot load such file -- hiera/backend/json_backend'>

PROBLEM

GET ERROR WHEN RUN HIERA
	
hiera username ::fqdn=

	WARN: 2013-11-29 11:52:01 -0800: Cannot load backend json: cannot load such file -- hiera/backend/json_backend
::fqdn=


DIAGNOSIS

NEED hiera-puppet TO CONNECT FROM PUPPET TO HIERA


SOLUTION

1. UNINSTALL IF INSTALLED WITH APT-GET 
apt-get remove ruby-hiera


2. INSTALL USING gem

gem install hiera hiera-puppet



</entry>
<entry [Fri 2013:11:29 11:39:04 EST] CONFIGURED HIERA TO PROVIDE username>

0. INSTALL HIERA

gem install hiera hiera-puppet

1. CREATE hiera.yaml FILE IN /etc/puppet


emacs -nw /etc/puppet/hiera.yaml

---
:backends:
  - yaml
:yaml:
  :datadir: /etc/puppet/hiera
:hierarchy:
  - "node/%{::fqdn}"
  - common
  

You can interpolate variables into the datadir using %{variable} interpolation tokens. This allows you to, for example, point it at "/etc/puppet/hieradata/%{::environment}" to keep your production and development data entirely separate.
  
NB: FOR JSON BACKEND IT WOULD BE

  :backends:
  - json
:json:
  :datadir: /etc/puppet/hiera

2. LINK /etc/puppet/hiera.yaml TO /etc/hiera.yaml
  
ln -s /etc/puppet/hiera.yaml /etc/hiera.yaml
	

3. CREATE HIERA DIRS

mkdir -p /etc/puppet/hiera/node


4. CREATE COMMON FILE

emacs -nw /etc/puppet/hiera/common.yaml

---
username: syoung

FOR JSON BACKEND

emacs -nw /etc/puppet/hiera/common.json

	{
		"username": "syoung"
	}


5. CREATE NODE FILES

emacs -nw /etc/puppet/hiera/node/vagrant-ubuntu-saucy-32.example.com.yaml

---
username: vagrant

emacs -nw /etc/puppet/hiera/node/vagrant-ubuntu-saucy-32.example.com.json

	{
		"username": "vagrant"
	}


6. TEST HIERA ON COMMAND LINE

hiera username ::fqdn=vagrant-ubuntu-saucy-32.example.com

	vagrant
	
7. TEST HIERA ON VAGRANT VM

puppet apply manifests/startup.pp 

	warning: Could not retrieve fact fqdn
	Unknown function hiera at /mnt/repos/private/syoung/notes/backup/puppet/manifests/classes/bash.pp:3 on node comp2

 


</entry>
<entry [Thu 2013:11:28 23:57:14 EST] FIXED ERROR: 'Could not retrieve fact fqdn'>
	
cd /etc/puppet/manifests
puppet apply startup.pp 

	Warning: Could not retrieve fact fqdn

SOLUTION

EDIT 

/etc/resolv.conf

ADD

domain example.com


OR

hostname foo.example.com 
	

	
	Error: Duplicate declaration: Exec[add-apt-repository] is already declared in file /home/vagrant/notes/backup/puppet/manifests/classes/fingerprintguid.pp:6; cannot redeclare at /home/vagrant/notes/backup/puppet/manifests/classes/fingerprintgui.pp:6 on node vagrant-ubuntu-saucy-32
	Error: Duplicate declaration: Exec[add-apt-repository] is already declared in file /home/vagrant/notes/backup/puppet/manifests/classes/fingerprintguid.pp:6; cannot redeclare at /home/vagrant/notes/backup/puppet/manifests/classes/fingerprintgui.pp:6 on node vagrant-ubuntu-saucy-32


	
</entry>
<entry [Thu 2013:11:28 13:07:55 EST] BOXEN + FUN WITH PUPPET PROVIDERS>


http://garylarizza.com/

	
</entry>
<entry [Thu 2013:11:21 21:07:04 EST] PUPPET SCRIPT FOR ATLASSIAN JIRA, CONFLUENCE AND BAMBOO INSTALL>

1. INSTALL PUPPET

apt-get install puppet
	* Starting puppet agent                                                                        
   puppet not configured to start, please edit /etc/default/puppet to enable


2. DOWNLOAD PUPPET JIRA MODULE

https://github.com/brycejohnson/puppet-jira.git

OR ROLL OWN

# profile for spaces, our public Confluence instance.

include basehost
include web_backend

class { confluence:
  installdir => '/opt/atlassian',
  datadir    => '/var/lib/confluence/confluence.home',
  context    => '/',
}

file { '/var/lib/confluence':
  ensure  => directory,
}

mount { '/var/lib/confluence':
  require => File['/var/lib/confluence'],
  ensure  => mounted,
  device  => "vfiler1.seas.harvard.edu:/vol/ircs_spaces/$fqdn",
  fstype  => nfs,
  options => 'defaults,tcp,hard,rsize=32768,wsize=32768,intr',
}

file { '/var/lib/confluence/confluence.home':
  ensure  => directory,
  owner   => tomcat,
  group   => tomcat,
  require => Package['tomcat6'],
}

file { '/opt/atlassian':
  ensure => directory,
}
	
	
</entry>
<entry [Wed 2013:09:18 11:59:36 EST] AUTOMATICALLY UPDATE apt-get BEFORE INSTALL PACKAGE>

http://stackoverflow.com/questions/10845864/puppet-trick-run-apt-get-update-before-installing-other-packages

Since Puppet 2.6.0 a new feature "relationship syntax" was introduced.

An example in Puppet 2.6.0 and above would look like this:

exec { "apt-update":
    command => "/usr/bin/apt-get update"
}

Exec["apt-update"] -> Package <| |>


    
</entry>
<entry [Sun 2013:09:15 22:25:04 EST] SET DNS IN UBUNTU WITHOUT EDITING /etc/resolv.conf>

1. VERIFY THAT /etc/resolv.conf HAS ONLY ONE DATA LINE

cat /etc/resolv.conf

    # Dynamic resolv.conf(5) file for glibc resolver(3) generated by resolvconf(8)
    #     DO NOT EDIT THIS FILE BY HAND -- YOUR CHANGES WILL BE OVERWRITTEN
    nameserver 127.0.1.1


2. CREATE FILE

/etc/resolvconf/resolv.conf.d/tail 

WITH CONTENTS

domain example.com


2. RESTART resolvconf TO UPDATE /etc/resolv.conf

service resolvconf restart

OR SIMPLE MAKE resolvconf REWRITE /etc/resolv.conf

resolvconf -u

    OK

    
</entry>
<entry [Sun 2013:09:15 00:02:16 EST] COMMON ERRORS>

http://www.linuxplanet.org/blogs/?cat=1627

Puppet And Common Errors
without comments

Installing Puppet can be a nightmare at times especially if you are doing it for the first time. Error messages are not always obvious and would require some experience to understand. So this is my attempt to explain the errors and suggest the solutions.

Needless to say that step one would always be to ensure that the names are resolving and the puppet client and master can communicate. Also make sure that port 8140 is white listed. 

Error 1: err: Could not request certificate: getaddrinfo: Name or service not known
Probable Solution: Puppet client is not able to reach the puppet master. This usually happens when you are setting up a new environment and puppet master's name is not resolvable. If you can, put a relevant entry in your DNS and add a server variable in [agent] section in puppet.conf. Alternatively you can use /etc/hosts to point the client to the master but you'll have to add appropriate entries on the /etc/hosts of both the puppet master and client.

Error 2: Starting puppetmaster: Could not prepare for execution: Could not find a default provider for user
Probable Solution: This happens because of SELinux restrictions. You can fix this by running a "setenforce 0" which will turn off the SELinux. This is required for CA creation only. So you can turn on SELinux after the puppet master creates CA successfully.

Error 3: err: Could not request certificate: Retrieved certificate does not match private key; please remove certificate from server and regenerate it with the current key
Probable Solution: Looks like your certificates have gone bad. You should remove /var/lib/puppet/ssl directory and request for new certs signed by puppet master.

Error 4: err: Could not retrieve catalog from remote server: hostname was not match with the server certificate
Probable Solution: This may happen if you are referring to the puppet master by a wrong name. In other words, the CA is not built to use this name. You can check out the correct CA name in the file /var/lib/puppet/ssl/ca/inventory.txt. You should put this name in the [agent] section assigned to server variable.

Error 5: err: Could not retrieve catalog from remote server: Connection refused - connect(2)
Probable Solution: This is happening because your puppet client is not able to connect to puppet master. One reason might be firewall which is rejecting the packets and the other reason might be that puppet master has died. So you either need to relax your firewall or make sure that your puppet master is always up and running. You may want to use daemontools or god or a similar application.

Error 6: Exiting; no certificate found and waitforcert is disabled
Probable Solution: This usually happens when a new node is introduced in the infrastructure. Issue is that this node do not have the certificate yet and since "--waitforcert" flag was not enabled, it exited immediately. If your puppet master has autosign enabled that just add the flag "--waitforcert X" with X replaced with time in seconds like 60. If autosign is not enabled then you have to sign the cert for the client manually at your puppet master.

I'll add more as I encounter them. Please let me know in comments if I am wrong anywhere. Have fun with Puppet :)
Written by Aditya Patawari
February 18th, 2012 at 11:37 am
Posted in Configuration,error,puppet,system admin,System Administration,troubleshooting
    
</entry>
<entry [Sat 2013:09:14 23:58:49 EST] FIXED ERROR: 'Could not request certificate: getaddrinfo: System error'>

PROBLEM

puppet agent --test --noop

    err: Could not request certificate: getaddrinfo: System error
    Exiting; failed to retrieve certificate and waitforcert is disabled


DIAGNOSIS

    1. PUPPET AGENT OR CLIENT IS NOT RUNNING
    
    2. PUPPET CLIENT CAN'T REACH PUPPET MASTER 
    
    
SOLUTION

put a relevant entry in your DNS and add a server variable in [agent] section in puppet.conf

Alternatively you can use /etc/hosts to point the client to the master but you'll have to add appropriate entries on the /etc/hosts of both the puppet master and client.
 


    
</entry>
<entry [Sat 2013:09:14 23:52:11 EST] USE SYSTEM VARIABLES>

$::variable_name

    
</entry>
<entry [Sat 2013:09:14 23:49:26 EST] GET SYSTEM VARIABLES WITH facter>

facter -p

architecture => amd64
augeasversion => 1.0.0
boardmanufacturer => Dell Inc.
boardproductname => 023HTX
boardserialnumber => .5S1MDT1.CN4864326K0367.023HTX
domain => example.com
facterversion => 1.6.9
fqdn => computer.example.com
hardwareisa => x86_64
hardwaremodel => x86_64
hostname => computer
id => root
interfaces => eth0,lo,wlan0
ipaddress => 192.168.1.2
ipaddress_lo => 127.0.0.1
ipaddress_wlan0 => 192.168.1.2
is_virtual => false
kernel => Linux
kernelmajversion => 3.8
kernelrelease => 3.8.0-19-generic
kernelversion => 3.8.0
lsbdistcodename => raring
lsbdistdescription => Ubuntu 13.04
lsbdistid => Ubuntu
lsbdistrelease => 13.04
lsbmajdistrelease => 13
macaddress => 5c:f9:dd:3f:74:1f
macaddress_eth0 => 5c:f9:dd:3f:74:1f
macaddress_wlan0 => 68:5d:43:56:0a:e0
manufacturer => Dell Inc.
memoryfree => 5.54 GB
memorysize => 7.67 GB
memorytotal => 7.67 GB
netmask => 255.255.255.0
netmask_lo => 255.0.0.0
netmask_wlan0 => 255.255.255.0
network_lo => 127.0.0.0
network_wlan0 => 192.168.1.0
operatingsystem => Ubuntu
operatingsystemrelease => 13.04
osfamily => Debian
path => /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
physicalprocessorcount => 1
processor0 => Intel(R) Core(TM) i7-3612QM CPU @ 2.10GHz
processor1 => Intel(R) Core(TM) i7-3612QM CPU @ 2.10GHz
processor2 => Intel(R) Core(TM) i7-3612QM CPU @ 2.10GHz
processor3 => Intel(R) Core(TM) i7-3612QM CPU @ 2.10GHz
processor4 => Intel(R) Core(TM) i7-3612QM CPU @ 2.10GHz
processor5 => Intel(R) Core(TM) i7-3612QM CPU @ 2.10GHz
processor6 => Intel(R) Core(TM) i7-3612QM CPU @ 2.10GHz
processor7 => Intel(R) Core(TM) i7-3612QM CPU @ 2.10GHz
processorcount => 8
productname => Inspiron 5720
ps => ps -ef
puppetversion => 2.7.18
rubysitedir => /usr/local/lib/site_ruby/1.8
rubyversion => 1.8.7
selinux => false
serialnumber => 5S1MDT1
swapfree => 14.90 GB
swapsize => 14.90 GB
timezone => PDT
type => Portable
uniqueid => 007f0101
uptime => 22:31 hours
uptime_days => 0
uptime_hours => 22
uptime_seconds => 81078
virtual => physical
    
</entry>
<entry [Sat 2013:09:14 23:43:05 EST] INSTALLED puppetlabs/stdlib>

*** NOT NECESSARY?? - ALREADY INSTALLED BY DEFAULT ***

INSTALL

cd /etc/puppet/modules
git clone https://github.com/puppetlabs/puppetlabs-stdlib.git stdlib


TEST

cd /etc/puppet/modules/stdlib
puppet apply tests/init.pp --noop

USAGE

http://forge.puppetlabs.com/puppetlabs/stdlib


    
</entry>
<entry [Sat 2013:09:14 22:56:03 EST] INSTALL MODULES WITH puppet module>

http://docs.puppetlabs.com/puppet/latest/reference/modules_installing.html

Using the Module Tool

The puppet module subcommand has several actions. The main actions used for managing modules are:

install
    Install a module from the Forge or a release archive.

    # puppet module install puppetlabs-apache --version 0.0.2

list
    List installed modules.

    # puppet module list

search
    Search the Forge for a module.

    # puppet module search apache

uninstall
    Uninstall a puppet module.

    # puppet module uninstall puppetlabs-apache

upgrade
    Upgrade a puppet module.

    # puppet module upgrade puppetlabs-apache --version 0.0.3


    
</entry>
<entry [Thu 2013:09:19 12:28:19 EST] PUPPET SCRIPTS TO INSTALL BASIC APPS>


COPY OF ALL SCRIPTS:

==> modules/bash/manifests/init.pp <==
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
==> modules/ccsm/manifests/init.pp <==
# INSTALL COMPIZ CONFIG SETTINGS MANAGER
class ccsm {

exec { "apt-get update":
    command => "/usr/bin/apt-get update",
}

package { "compizconfig-settings-manager":
  ensure  => latest
}

}


==> modules/ec2api/manifests/init.pp <==
# INSTALL EC2 API
class ec2api {

package { "ec2-api-tools":
  ensure  => latest,
  require  => Exec['apt-get update'],
}

}


==> modules/fingerprintgui/manifests/init.pp <==
# INSTALL FINGERPRINT READER
class fingerprintgui {

exec { "add-apt-repository":
    command => "/usr/bin/add-apt-repository ppa:fingerprint/fingerprint-gui"
}

exec { "apt-get update":
    command => "/usr/bin/apt-get update"
}

Package {
    ensure => "installed"
#  require  => Exec['apt-get update'],
}

package { "libbsapi": } 
package { "policykit-1-fingerprint-gui": }
package { "fingerprint-gui":   }



}
==> modules/googlechrome/manifests/init.pp <==
class googlechrome ($path='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/X11R6/bin', $destFile  ='google-chrome-stable_current_amd64.deb', $sourceURL ='https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb') {

  $required_packages = ['libnss3-1d',
                        'libxss1',]

  Exec {
    path    => "${path}",
  }

  ##Install the Required Packages for google-chrome-stable
  package { $required_packages:
    ensure => installed,
    before => Exec["wget -O ${destFile} ${sourceURL}"],
  }

  ## Retrieve the Destination File from the Source URL.
  exec {"wget -O ${destFile} ${sourceURL}":
    cwd     => '/tmp',
    creates => "/tmp/${destFile}",
    unless  => 'dpkg -s google-chrome-stable|grep "ok installed"',
  }

  ## Install the Destination File using dpkg
  exec {"dpkg -i ${destFile}":
    require => Exec["wget -O ${destFile} ${sourceURL}"],
    cwd     => '/tmp',
    unless  => 'dpkg -s google-chrome-stable|grep "ok installed"',
  }
}                                                                                                                                                                                                                                             

==> modules/googlechrome.old/manifests/init.pp <==
# == Class: googlechrome
#
# Install the Google Chrome browser from Google's official Linux repositories.
#
# Supported operating systems are:
#   - Fedora Linux
#   - Debian Linux
#   - Ubuntu Linux
#
# === Authors
#
# Jochen Schalanda < j.schalanda@smarchive.de>
#
# === Copyright
#
# Copyright 2012, 2013 smarchive GmbH
#
class googlechrome(
  $package         = 'UNSET',
  $version         = 'UNSET',
  $repo_name       = 'UNSET',
  $repo_baseurl    = 'UNSET',
  $repo_key        = 'UNSET',
  $repo_key_source = 'UNSET',
  $repo_gpgcheck   = 'UNSET',
  $repo_enabled    = 'UNSET',
  $repo_repos      = 'UNSET',
  $repo_release    = 'UNSET',
  $repo_pin        = 'UNSET',
) {

  include googlechrome::params

  $package_real = $package ? {
    'UNSET' => $::googlechrome::params::package,
    default => $package,
  }

  $version_real = $version ? {
    'UNSET' => $::googlechrome::params::version,
    default => $version,
  }

  $repo_name_real = $repo_name ? {
    'UNSET' => $::googlechrome::params::repo_name,
    default => $repo_name,
  }

  $repo_baseurl_real = $repo_baseurl ? {
    'UNSET' => $::googlechrome::params::repo_baseurl,
    default => $repo_baseurl,
  }

  $repo_key_real = $repo_key ? {
    'UNSET' => $::googlechrome::params::repo_key,
    default => $repo_key,
  }

  $repo_key_source_real = $repo_key_source ? {
    'UNSET' => $::googlechrome::params::repo_key_source,
    default => $repo_key_source,
  }

  $repo_repos_real = $repo_repos ? {
    'UNSET' => $::googlechrome::params::repo_repos,
    default => $repo_repos,
  }

  $repo_release_real = $repo_release ? {
    'UNSET' => $::googlechrome::params::repo_release,
    default => $repo_release,
  }

  $repo_pin_real = $repo_pin ? {
    'UNSET' => $::googlechrome::params::repo_pin,
    default => $repo_pin,
  }

  $repo_gpgcheck_real = $repo_gpgcheck ? {
    'UNSET' => $::googlechrome::params::repo_gpgcheck,
    default => $repo_gpgcheck,
  }
  $repo_enabled_real = $repo_enabled ? {
    'UNSET' => $::googlechrome::params::repo_enabled,
    default => $repo_enabled,
  }

  class { 'googlechrome::repo':
    repo_name  => $repo_name_real,
    baseurl    => $repo_baseurl_real,
    key        => $repo_key_real,
    key_source => $repo_key_source_real,
    repos      => $repo_repos_real,
    release    => $repo_release_real,
    pin        => $repo_pin_real,
    gpgcheck   => $repo_gpgcheck_real,
    enabled    => $repo_enabled_real,
  }

  package { $package_real:

==> modules/links/manifests/init.pp <==
class links {
    file { "/mnt/software":
    	 ensure => "link",
	 recurse=> "false",
        owner	=> 'syoung',
         group	=> 'syoung',
	 target	=> "/home/syoung/software"
    }

    exec { "create_software_link":
     	  command => "/bin/ln -s /mnt/software /home/syoung/software",
     	  creates => "/home/syoung/software"
    }

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
==> modules/puppetlabs-apt/manifests/init.pp <==
# Class: apt
#
# This module manages the initial configuration of apt.
#
# Parameters:
#   The parameters listed here are not required in general and were
#     added for use cases related to development environments.
#   disable_keys - disables the requirement for all packages to be signed
#   always_apt_update - rather apt should be updated on every run (intended
#     for development environments where package updates are frequent)
#   purge_sources_list - Accepts true or false. Defaults to false If set to
#     true, Puppet will purge all unmanaged entries from sources.list
#   purge_sources_list_d - Accepts true or false. Defaults to false. If set
#     to true, Puppet will purge all unmanaged entries from sources.list.d
#
# Actions:
#
# Requires:
#   puppetlabs/stdlib
# Sample Usage:
#  class { 'apt': }

class apt(
  $always_apt_update    = false,
  $disable_keys         = undef,
  $proxy_host           = false,
  $proxy_port           = '8080',
  $purge_sources_list   = false,
  $purge_sources_list_d = false,
  $purge_preferences_d  = false
) {

  include apt::params
  include apt::update

  validate_bool($purge_sources_list, $purge_sources_list_d, $purge_preferences_d)

  $sources_list_content = $purge_sources_list ? {
    false => undef,
    true  => "# Repos managed by puppet.\n",
  }

  if $always_apt_update == true {
    Exec <| title=='apt_update' |> {
      refreshonly => false,
    }
  }

  $root           = $apt::params::root
  $apt_conf_d     = $apt::params::apt_conf_d
  $sources_list_d = $apt::params::sources_list_d
  $preferences_d  = $apt::params::preferences_d
  $provider       = $apt::params::provider

  file { 'sources.list':
    ensure  => present,
    path    => "${root}/sources.list",
    owner   => root,
    group   => root,
    mode    => '0644',
    content => $sources_list_content,
    notify  => Exec['apt_update'],
  }

  file { 'sources.list.d':
    ensure  => directory,
    path    => $sources_list_d,
    owner   => root,
    group   => root,
    purge   => $purge_sources_list_d,
    recurse => $purge_sources_list_d,
    notify  => Exec['apt_update'],
  }

  file { 'preferences.d':
    ensure  => directory,
    path    => $preferences_d,
    owner   => root,
    group   => root,
    purge   => $purge_preferences_d,
    recurse => $purge_preferences_d,
  }

  case $disable_keys {
    true: {
      file { '99unauth':
        ensure  => present,
        content => "APT::Get::AllowUnauthenticated 1;\n",
        path    => "${apt_conf_d}/99unauth",
      }
    }
    false: {
      file { '99unauth':
        ensure => absent,
        path   => "${apt_conf_d}/99unauth",
      }
    }
    undef:   { } # do nothing
    default: { fail('Valid values for disable_keys are true or false') }
  }

==> modules/stdlib/manifests/init.pp <==
# Class: stdlib
#
# This module manages stdlib. Most of stdlib's features are automatically
# loaded by Puppet, but this class should be declared in order to use the
# standardized run stages.
#
# Parameters: none
#
# Actions:
#
#   Declares all other classes in the stdlib module. Currently, this consists
#   of stdlib::stages.
#
# Requires: nothing
#
class stdlib {

  class { 'stdlib::stages': }

}

==> modules/sudo/manifests/init.pp <==
class sudo {
    file { "/etc/sudoers":
        owner => 'root',
        group => 'root',
        mode  => '0440',
    }
}
==> modules/virtualbox/manifests/init.pp <==
class virtualbox {

  case $operatingsystem {
    "Ubuntu", "Debian": {
      include debianvirtualbox
    }
    default: {
      notice("Currently only debian like systems are supported. Skipping...")
    }
  }
  
  class debianvirtualbox {

    exec { '/usr/bin/apt-get -q update':
      before   => Exec['install-virtualbox-repo'],
    }
    
    exec { 'install-virtualbox-repo':
      command  => '/usr/bin/wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | apt-key add -',
      before   => Package['virtualbox'],
    }
    
    package {"virtualbox": ensure => installed,}
  }
}

    
</entry>
<entry [Sat 2013:09:14 18:55:50 EST] ENABLED MANIFESTS: googlechrome, links, virtualbox, fingerprint-gui, cssm, skype, rdesktop>

INSTALLED CHROME

/etc/puppet# puppet apply  modules/googlechrome/tests/init.pp -v 

    info: Applying configuration version '1379202549'
    notice: /Stage[main]/Googlechrome/Package[libnss3-1d]/ensure: ensure changed 'purged' to 'present'
    notice: /Stage[main]/Googlechrome/Package[libxss1]/ensure: ensure changed 'purged' to 'present'
    notice: /Stage[main]/Googlechrome/Exec[wget -O google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb]/returns: executed successfully
    notice: /Stage[main]/Googlechrome/Exec[dpkg -i google-chrome-stable_current_amd64.deb]/returns: executed successfully
    notice: Finished catalog run in 222.62 seconds


CREATED LINKS

/etc/puppet# puppet apply  modules/links/tests/init.pp -v

    info: Applying configuration version '1379182843'
    notice: /Stage[main]/Links/Exec[create_annai_link]/returns: executed successfully
    notice: /Stage[main]/Links/Exec[create_misc_link]/returns: executed successfully
    notice: /Stage[main]/Links/Exec[create_notes_link]/returns: executed successfully
    notice: Finished catalog run in 0.23 seconds


INSTALLED VIRTUALBOX

/etc/puppet$ sudo puppet apply modules/virtualbox/tests/init.pp --noop

    notice: /Stage[main]/Virtualbox::Debianvirtualbox/Exec[/usr/bin/apt-get -q update]/returns: current_value notrun, should be 0 (noop)
    notice: /Stage[main]/Virtualbox::Debianvirtualbox/Exec[install-virtualbox-repo]/returns: current_value notrun, should be 0 (noop)
    notice: /Stage[main]/Virtualbox::Debianvirtualbox/Package[virtualbox]/ensure: current_value purged, should be present (noop)
    notice: Class[Virtualbox::Debianvirtualbox]: Would have triggered 'refresh' from 3 events
    notice: Stage[main]: Would have triggered 'refresh' from 1 events
    notice: Finished catalog run in 0.14 seconds
    syoung@computer:/etc/puppet$ sudo puppet apply modules/virtualbox/tests/init.pp 
    notice: /Stage[main]/Virtualbox::Debianvirtualbox/Exec[/usr/bin/apt-get -q update]/returns: executed successfully
    notice: /Stage[main]/Virtualbox::Debianvirtualbox/Exec[install-virtualbox-repo]/returns: executed successfully
    notice: /Stage[main]/Virtualbox::Debianvirtualbox/Package[virtualbox]/ensure: ensure changed 'purged' to 'present'
    notice: Finished catalog run in 184.00 seconds


INSTALLED FINGERPRINT-GUI

sudo puppet apply modules/fingerprintgui/tests/init.pp 

    notice: /Stage[main]/Fingerprintgui/Package[fingerprint-gui]/ensure: ensure changed 'purged' to 'present'
    notice: /Stage[main]/Fingerprintgui/Exec[add-apt-repository]/returns: executed successfully
    notice: /Stage[main]/Fingerprintgui/Exec[apt-get update]/returns: executed successfully
    notice: /Stage[main]/Fingerprintgui/Package[libbsapi]/ensure: ensure changed 'purged' to 'present'
    notice: Finished catalog run in 96.92 seconds


INSTALLED REMOTE DESKTOP

root@computer:/etc/puppet# puppet apply modules/remotedesktop/tests/init.pp 

    notice: /Stage[main]/Remotedesktop/Exec[apt-get update]/returns: executed successfully
    notice: /Stage[main]/Remotedesktop/Package[rdesktop]/ensure: ensure changed 'purged' to 'present'
    notice: Finished catalog run in 10.28 seconds

    
</entry>
<entry [Thu 2013:09:12 22:55:02 EST] CREATE OR DELETE A FILE>
    
CREATE A FILE
file { 'bash-agent-key' :
    ensure  => file,
    path => "/home/${user}/.bash_keyautoload.tmp", 
    content => template('ssh_agent_add/bash_keyautoload.erb'),
    mode => 0700,
    owner => $user,
    group => $user,
}


DELETE A FILE

file { 'bash-agent-key' :
    ensure => absent,
}
  

</entry>
<entry [Thu 2013:09:12 22:53:07 EST] GET USER INFO OR CREATE USER>

GET USER INFO

puppet resource User syoung
user { 'syoung':
  ensure           => 'present',
  comment          => 'syoung,,,',
  gid              => '1000',
  groups           => ['adm', 'cdrom', 'sudo', 'dip', 'plugdev', 'lpadmin', 'sambashare', 'vboxusers'],
  home             => '/home/syoung',
  password         => '$6$vxZdT3XG$XCYiQ1lbELVOWKqTZOyhRmY1Aqa9WLGGlvoI.BW11yWKD/2Gb1mFBBX/ZOx1hI2dp8x1zQbL94sslSRqwpqgz1',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
  uid              => '1000',
}

CREATE A USER

puppet resource User "admin" ensure=present group=admin

puppet resource User "aguadev" ensure=present group=aguadev

    
</entry>
<entry [Thu 2013:09:12 22:29:54 EST] INSTALL EC2 API TOOLS>

1. CREATE FILES FOR ec2-api

/etc/puppet/modules/manifest/ec2api/init.pp

    # INSTALL EC2 API
    class ec2api {
    
    #The easiest/cleanest approach is to use the require parameter which is available for all resource types.
    #package { "zend-server-ce-php-5.2":
    #  ensure  => latest,
    #  require  => Exec['apt-get update'],
    #}
    
    exec { "apt-get update":
        command => "/usr/bin/apt-get update"
    }
    
    exec { "apt-get install":
        command => "/usr/bin/apt-get install -y ec2-api-tools"
    }    
    
    }

/etc/puppet/modules/ec2api/tests/init.pp
    
    # include ec2api
    class { 'ec2api': }

2. TEST PUPPET

/etc/puppet/modules/ec2api# puppet apply tests/init.pp --noop


    
</entry>
<entry [Thu 2013:09:12 12:55:27 EST] FIXED ERROR: 'apt-get install -y ... returned 100 instead of one of [0]'>

PROBLEM

GET THIS ERROR WHEN RUN PUPPET

cd /etc/puppet/modules/fingerprintgui
puppet apply tests/init.pp

    notice: /Stage[main]/Fingerprintgui/Exec[add-apt-repository]/returns: executed successfully
    err: /Stage[main]/Fingerprintgui/Exec[apt-get install]/returns: change from notrun to 0 failed: /usr/bin/apt-get install -y libbsapi policykit-1-fingerprint-gui fingerprint-gui returned 100 instead of one of [0] at /etc/puppet/modules/fingerprintgui/manifests/init.pp:24
    notice: /Stage[main]/Fingerprintgui/Exec[apt-get update]/returns: executed successfully
    notice: Finished catalog run in 12.78 seconds


DIAGNOSIS

I'm trying to install a deb from a local apt repository and getting an error: err: /Stage[main]/Myapp/Exec[myapp-package]/returns: change from notrun to 0 failed: /usr/bin/apt-get install -y -q --allow-unauthenticated myapp returned 100 instead of one of [0]
[2011/05/26 09:30:35] @ Quit: Corren: Quit: Computer has gone to sleep.
[2011/05/26 09:30:36] |fdorner| what's the best way to assure a given directory structure exists? Create one file{} for the root of the structure and set recurse to true? or one file{} per sub(directory)?
[2011/05/26 09:30:42] |bencc| how can I see the actual output of apt-get ?
[2011/05/26 09:30:55] |kesor| bencc: try and install it from the console with "sudo apt-get -s install ....." the -s is like --noop
[2011/05/26 09:31:21] |the_ramink| bencc: do it from the command line. However I'm betting your packages/repo are unsigned



SOLUTION

RUN ON COMMAND LINE WITH -s OPTION (NOOP)

/usr/bin/apt-get -s install libbsapi policykit-1-fingerprint-gui fingerprint-gui

    Reading package lists... Done
    Building dependency tree       
    Reading state information... Done
    fingerprint-gui is already the newest version.
    policykit-1-fingerprint-gui is already the newest version.
    The following packages will be upgraded:
      libbsapi
    1 upgraded, 0 newly installed, 0 to remove and 183 not upgraded.
    Inst libbsapi [4.0~rc1+build4.0.0218+dfsg1-0ppa3] (4.3~rc1+build4.3.291+dfsg2-0ppa1 Fingerprint GUI:13.04/raring [amd64])
    Conf libbsapi (4.3~rc1+build4.3.291+dfsg2-0ppa1 Fingerprint GUI:13.04/raring [amd64])


    
</entry>
<entry [Thu 2013:09:12 00:50:39 EST] FIXED ERROR: 'warning: Could not retrieve fact fqdn'>

PROBLEM

GET ERROR MESSAGE WHEN TRY TO RUN PUPPET

cd /etc/puppet/modules/fingerprintgui
puppet apply init.pp --noop

    warning: Could not retrieve fact fqdn
    notice: Finished catalog run in 0.01 seconds

SOLUTION

EDIT FILE

/etc/resolv.conf

ADD:

domain example.com


SO THAT THE FULL HOSTNAME BECOMES:

comp2.example.com



</entry>
<entry [Thu 2013:09:12 00:48:28 EST] INSTALL AND TEST PUPPET>

1. INSTALL PUPPET STANDALONE

apt-get install puppet


OR PUPPET SERVER

apt-get install puppet-server


2. CREATE FILES FOR fingerprint-gui

/etc/puppet/modules/manifest/fingerprintgui/init.pp

    # INSTALL FINGERPRINT READER
    class fingerprintgui {
    
    exec { "add-apt-repository":
        command => "/usr/bin/add-apt-repository ppa:fingerprint/fingerprint-gui"
    }
    
    #The easiest/cleanest approach is to use the require parameter which is available for all resource types.
    #package { "zend-server-ce-php-5.2":
    #  ensure  => latest,
    #  require  => Exec['apt-get update'],
    #}
    
    exec { "apt-get update":
        command => "/usr/bin/apt-get update"
    }
    
    exec { "apt-get install":
        command => "/usr/bin/apt-get install -y libbsapi policykit-1-fingerprint-gui fingerprint-gui"
    }    
    
    }

/etc/puppet/modules/fingerprintgui/tests/init.pp
    
    # include fingerprintgui
    class { 'fingerprintgui': }

3. TEST PUPPET

/etc/puppet/modules/fingerprintgui# puppet apply tests/init.pp --noop

    notice: /Stage[main]/Fingerprintgui/Exec[add-apt-repository]/returns: current_value notrun, should be 0 (noop)
    notice: /Stage[main]/Fingerprintgui/Exec[apt-get install]/returns: current_value notrun, should be 0 (noop)
    notice: /Stage[main]/Fingerprintgui/Exec[apt-get update]/returns: current_value notrun, should be 0 (noop)
    notice: Class[Fingerprintgui]: Would have triggered 'refresh' from 3 events
    notice: Stage[main]: Would have triggered 'refresh' from 1 events
    notice: Finished catalog run in 0.02 seconds



</entry>