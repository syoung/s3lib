verification


<entry [Sat 2013:09:14 23:10:28 EST] INSTALL GRAPHITE (GRAPHING APP SIMILAR TO CACTI)>

http://www.linuxsysadmintutorials.com/

Install graphite on a CentOS/RHEL server
AUGUST 4, 2013
Graphite is highly scalable real-time graphing system. It is seen as a replacement for more traditional graphing systems such as cacti and munin.

To install graphite, first you will need to enable the EPEL repository first. Once enabled pull in the required RPMS.

# yum install graphite-web graphite-web-selinux mysql mysql-server MySQL-python
Start up mysql and setup a root password.

# service mysqld start
# /usr/bin/mysql_secure_installation
Configure graphite to use the MySQL database within the /etc/graphite-web/local_settings.py config file.

/etc/graphite-web/local_settings.py

DATABASES = {
  'default': {
    'NAME': 'graphite',
    'ENGINE': 'django.db.backends.mysql',
    'USER': 'graphite',
    'PASSWORD': 'complexpassw0rd',
    'HOST': 'localhost',
    'PORT': '3306',
  }
}
Create the graphite account and database within MySQL.

# mysql -e "CREATE USER 'graphite'@'localhost' IDENTIFIED BY 'complexpassw0rd';" -u root -p 
# mysql -e "GRANT ALL PRIVILEGES ON graphite.* TO 'graphite'@'localhost';" -u root -p
# mysql -e "CREATE DATABASE graphite;" -u root -p
# mysql -e 'FLUSH PRIVILEGES;' -u root -p
Setup the graphite database with what is required by graphite.

# /usr/lib/python2.6/site-packages/graphite/manage.py syncdb
You should now have a working graphite installation.

http://localhost/graphite
    
</entry>
<entry [Sat 2013:09:14 23:10:01 EST] INSTALL NAGIOS AND MONITOR A SERVER>

http://www.linuxsysadmintutorials.com/


Install nagios and monitor a server
AUGUST 5, 2013
Nagios is a powerful open source monitoring system that is used by many IT organisations to monitor IT infrastructure. Without a doubt, Nagios is the most widely used monitoring application that Linux System Administrators deploy today.

There are some configuration objects that nagios uses which we will cover today. These objects are contacts, hosts, services and commands.

To install and setup your first server within nagios, start by enabling the EPEL repository if you haven’t already.

Install the nagios RPM and it’s ping plugin.

# yum install nagios nagios-plugins-icmp
This will install the nagios web interface which you can access at http://server/nagios which has a username and password of nagiosadmin. There is still some further configuration that needs to be done before any servers show up within the web interface.

Nagios contacts are used to send notifications of alerts and recoveries. Create the first nagios contact in the file /etc/nagios/conf.d/contacts.cfg

/etc/nagios/conf.d/contacts.cfg
1
2
3
4
5
6
define contact{
  contact_name    john
  alias           John Example (sysadmin)
  use             generic-contact
  email           john@exmaple.com
}
Nagios hosts define servers, routers, switches and other devices which nagios monitors. Create the first nagios host in the file /etc/nagios/conf.d/hosts.cfg

/etc/nagios/conf.d/hosts.cfg
1
2
3
4
5
6
define host{
  use                   generic-host
  host_name             server.example.com
  address               server.example.com
  max_check_attempts    5
}
Nagios services objects are services that nagios monitors on the remote server. Create the first nagios service in the file /etc/nagios/conf.d/services.cfg

/etc/nagios/conf.d/services.cfg
1
2
3
4
5
6
define service{
  use                   generic-service
  host_name             server.example.com
  service_description   PING
  check_command         check_icmp!500.0,80%!1000.0,100%
}
Nagios service objects call nagios commands which are a defined set of objects that run commands which return OK, WARNING, CRITICAL or UNKNOWN. The first Nagios command that we will setup is a simple ping command.

/etc/nagios/conf.d/commands.cfg
1
2
3
4
define command{
  command_name    check_icmp
  command_line    $USER1$/check_icmp -H $HOSTADDRESS$ -w $ARG1$ -c $ARG2$
}
Restart the nagios service.

# service nagios restart
Bring up the nagios web interface again and go to “Services” where you will find the server you are now monitoring. It will take up to 5 minutes for nagios to run the service check “PING” which hopefully returns an OK.

Linux Sysadmin Protip

You can force Nagios to execute a service check and not have to wait 5 minutes by going to the “Service Information” page for a particular service and choosing “Re-schedule the next check for this service”.
    
</entry>
<entry [Sat 2013:09:14 23:08:57 EST] SET UP NAGIOS nrpe ON SERVER TO MONITOR LOAD ON SYSTEM>

http://www.linuxsysadmintutorials.com/

Setup a Nagios NRPE to monitor the load on a system
SEPTEMBER 12, 2013
Nagios Remote Plugin Executor (NRPE), is used by nagios to run commands remotely on linux servers.

For example, to discover the load, a measure of computional work, on a linux server you would run uptime which provides you with the load average.

$ uptime
 22:41:02 up 14 min,  1 user,  load average: 0.00, 1.02, 2.40
Without NRPE, nagios is unable to run this command remotely.

NRPE works by running as a daemon on the remote linux server listening on a port. Nagios connects to the NRPE daemon and runs a NRPE command which typically calls a nagios plugin such as check_load, returning some info aswell as a status of OK, WARNING, CRITICAL or UNKNOWN.

First, install and start the NRPE server on the remote linux server.

$ sudo yum install nrpe
$ sudo service nrpe start
NRPE by default listens on port 5666/tcp which you will need to allow through if your remote linux server is running a firewall. Be sure to only expose the NRPE service to your nagios server by specifying the IP address of your nagios server with -s in your iptables rules.

/etc/sysconfig/iptables
1
-A INPUT -m state --state NEW -m tcp -p tcp --dport 5666 -s 10.0.0.1 -j ACCEPT
$ service iptables restart
On the nagios server, install the check_nrpe plugin.

$ sudo yum install nagios-plugins-nrpe
check_nrpe is the executable that nagios will use to query the remote linux server.

$ /usr/lib64/nagios/plugins/check_nrpe -H 10.0.1.254
CHECK_NRPE: Error - Could not complete SSL handshake.
NRPE will only allow certain hosts to connect which is configured by the allowed_hosts option in /etc/nagios/nrpe.cfg. Let’s add our nagios server and restart the NRPE service.

/etc/nagios/nrpe.cfg
1
allowed_hosts=127.0.0.1,10.0.0.1
$ sudo service nrpe restart
Again, let’s run check_nrpe from our nagios server.

$ /usr/lib64/nagios/plugins/check_nrpe -H 10.0.1.254
NRPE v2.14
By default, NRPE should be configured with a check_load command.

/etc/nagios/nrpe.cfg
1
command[check_load]=/usr/lib64/nagios/plugins/check_load -w 15,10,5 -c 30,25,20
Call this command from the nagios server via NRPE using the check_nrpe plugin.

$ /usr/lib64/nagios/plugins/check_nrpe -H 10.0.1.254 -c check_load
OK - load average: 0.00, 0.00, 0.00|load1=0.000;15.000;30.000;0; load5=0.000;10.000;25.000;0; load15=0.000;5.000;20.000;0;
Once we’ve confirmed that the nagios server is able to communicate with the remote linux server over NRPE we can configure nagios and reload.

/etc/nagios/conf.d/service_nrpe-load-web-server.cfg

define service {
  use                            generic-service
  host_name                      webserver.example.org
  service_description            NRPE - Load
  check_command                  check_nrpe!check_load
}
$ sudo service nagios reload

    
</entry>
<entry [Tue 2013:06:04 12:41:01 EST] NAGIOS>

http://www.nagios.org/download

    
</entry>
<entry [Tue 2013:06:04 12:38:48 EST] ZABBIX TUTORIAL>

http://workaround.org/try-zabbix

http://workaround.org/zabbix/screencasts/1


</entry>