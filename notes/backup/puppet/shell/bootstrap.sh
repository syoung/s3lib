#!/bin/sh

if [ ! -d /vagrant/puppet ]; then mkdir /vagrant/puppet; fi
if [ ! -L /vagrant/puppet/hiera ]; then ln -s /home/vagrant/notes/backup/puppet/hiera /vagrant/puppet/hiera; fi
if [ ! -L /vagrant/puppet/manifests ]; then ln -s /home/vagrant/notes/backup/puppet/manifests /vagrant/puppet/manifests; fi
if [ ! -L /vagrant/puppet/hiera.yaml ]; then ln -s /home/vagrant/notes/backup/puppet/hiera.yaml /vagrant/puppet/hiera.yaml; fi
if [ ! -L /vagrant/puppet/puppet.conf ]; then ln -s /home/vagrant/notes/backup/puppet/puppet.conf /vagrant/puppet/puppet.conf; fi
if [ ! -L /vagrant/puppet/Puppetfile ]; then ln -s /home/vagrant/notes/backup/puppet/Puppetfile /vagrant/puppet/Puppetfile; fi

# Directory in which librarian-puppet should manage its modules directory
PUPPET_DIR='/vagrant/puppet'

## INSTALL git FOR USE BY librarian-puppet
GIT=/usr/bin/git
APT_GET=/usr/bin/apt-get
YUM=/usr/bin/yum
if [ ! -x $GIT ]; then
    if [ -x $YUM ]; then
        yum -q -y install git-core
    elif [ -x $APT_GET ]; then
        apt-get -q -y install git-core
    else
        echo "No package installer available. You may need to install git manually."
    fi
fi

#### INSTALL librarian-puppet
if [ `gem query --local | grep librarian-puppet | wc -l` -eq 0 ]; then
  gem install librarian-puppet
fi

##### UPDATE MODULES USING librarian-puppet
#  cd $PUPPET_DIR && librarian-puppet install --clean
#else
#  cd $PUPPET_DIR && librarian-puppet update
#fi

#### UPDATE apt-get OR yum
YUMFLAG=/tmp/yum-updated
APT_FLAG=/tmp/apt-updated
if [ -x $APT_GET ]; then
    if [ ! -x $APT_FLAG ]; then
        echo "DOING apt-get UPDATE"
        $APT_GET update;
        touch $APT_FLAG;
    fi;
fi;
if [ -x $YUM ]; then
    if [ ! -x $YUMFLAG ]; then
        echo "DOING yum UPDATE"
        $YUM check-update && touch $YUMFLAG;
    fi;
fi;


# now we run puppet
puppet apply -vv  --modulepath=$PUPPET_DIR/modules/ $PUPPET_DIR/manifests/main.pp
#puppet apply -vv  --modulepath=$PUPPET_DIR/modules/ $PUPPET_DIR/manifests/site.pp


