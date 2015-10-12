

<entry [Tue Jan 18 17:32:26 EST 2011] INSTALL sge_master ON AQ-7 - IN THE END WAS NOT NECESSARY>

NB: INSTEAD OF THIS, WHAT WORKED WAS SIMPLY TO OPEN THE PORTS ON MASTER TO ALLOW AQ-7 TO SUBMIT TO IT


cd /opt/sge6

./install_qmaster



    

    Choosing Grid Engine admin user account

    ---------------------------------------

    

    You may install Grid Engine that all files are created with the user id of an

    unprivileged user.

    

    This will make it possible to install and run Grid Engine in directories

    where user >root< has no permissions to create and write files and directories.

    

       - Grid Engine still has to be started by user >root<

    

       - this directory should be owned by the Grid Engine administrator

    

    Do you want to install Grid Engine

    under an user id other than >root< (y/n) [y] >> n

    

    

    Installing Grid Engine as user >root<

    

    

    

    Checking $SGE_ROOT directory

    ----------------------------

    

    The Grid Engine root directory is:

    

       $SGE_ROOT = /opt/sge6

    

    If this directory is not correct (e.g. it may contain an automounter

    prefix) enter the correct path to this directory or hit < RETURN >

    to use default [/opt/sge6] >> 

    

    Your $SGE_ROOT directory: /opt/sge6

    

    Hit < RETURN > to continue >>





    Grid Engine TCP/IP communication service

    ----------------------------------------

    

    The port for sge_qmaster is currently set as service.

    

       sge_qmaster service set to port 3308

    

    Now you have the possibility to set/change the communication ports by using the

    >shell environment< or you may configure it via a network service, configured

    in local >/etc/service<, >NIS< or >NIS+<, adding an entry in the form

    

        sge_qmaster < port_number >/tcp

    

    to your services database and make sure to use an unused port number.

    

    How do you want to configure the Grid Engine communication ports?

    

    Using the >shell environment<:                           [1]

    

    Using a network service like >/etc/service<, >NIS/NIS+<: [2]

    

    (default: 2) >> 





Grid Engine TCP/IP service >sge_qmaster<

----------------------------------------



Using the service



   sge_qmaster



for communication with Grid Engine.







Grid Engine TCP/IP communication service

----------------------------------------



The port for sge_execd is currently set as service.



   sge_execd service set to port 4325



Now you have the possibility to set/change the communication ports by using the

>shell environment< or you may configure it via a network service, configured

in local >/etc/service<, >NIS< or >NIS+<, adding an entry in the form



    sge_execd < port_number >/tcp



to your services database and make sure to use an unused port number.



How do you want to configure the Grid Engine communication ports?



Using the >shell environment<:                           [1]



Using a network service like >/etc/service<, >NIS/NIS+<: [2]



(default: 2) >> 









Grid Engine TCP/IP communication service 

-----------------------------------------



Using the service



   sge_execd



for communication with Grid Engine.



Hit < RETURN > to continue >>









Grid Engine cells

-----------------



Grid Engine supports multiple cells.



If you are not planning to run multiple Grid Engine clusters or if you don't

know yet what is a Grid Engine cell it is safe to keep the default cell name



   default



If you want to install multiple cells you can enter a cell name now.



The environment variable



   $SGE_CELL=<your_cell_name>



will be set for all further Grid Engine commands.



Enter cell name [default] >>











The "common" directory in cell >default< already exists!

Do you want to select another cell name? (y/n) [y] >> n







The "common" directory in cell >default< already exists!

Do you want to select another cell name? (y/n) [y] >> n



You can overwrite or delete this directory. If you choose overwrite

(YES option) only the "bootstrap" and "cluster_name" files will be deleted).

Delete (NO option) - will delete the whole directory!



Do you want to overwrite [y] or delete [n] the directory? (y/n) [y] >> y



Deleting bootstrap and cluster_name files!



Using cell >default<





NB: CHECKED CONTENTS OF DELETED cluster_name AND bootstrap FILES:



    /opt/sge6/default/common

    [root@ip-10-127-158-202 common]# cat cluster_name 

    starcluster

    [root@ip-10-127-158-202 common]# cat bootstrap

    # Version: 6.2u5

    #

    admin_user             sgeadmin

    default_domain          none

    ignore_fqdn             true

    spooling_method         classic

    spooling_lib            libspoolc

    spooling_params         /opt/sge6/default/common;/opt/sge6/default/spool/qmaster

    binary_path             /opt/sge6/bin

    qmaster_spool_dir       /opt/sge6/default/spool/qmaster

    security_mode           none

    listener_threads        2

    worker_threads          2

    scheduler_threads       1

    jvm_threads             0

    







Unique cluster name

-------------------



The cluster name uniquely identifies a specific Sun Grid Engine cluster.

The cluster name must be unique throughout your organization. The name 

is not related to the SGE cell.



The cluster name must start with a letter ([A-Za-z]), followed by letters, 

digits ([0-9]), dashes (-) or underscores (_).



Enter new cluster name or hit < RETURN >

to use default [starcluster] >> starcluster





Grid Engine qmaster spool directory

-----------------------------------



The qmaster spool directory is the place where the qmaster daemon stores

the configuration and the state of the queuing system.



User >root< on this host must have read/write access to the qmaster

spool directory.



If you will install shadow master hosts or if you want to be able to start

the qmaster daemon on other hosts (see the corresponding section in the

Grid Engine Installation and Administration Manual for details) the account

on the shadow master hosts also needs read/write access to this directory.



Enter a qmaster spool directory [/opt/sge6/default/spool/qmaster] >> 

Specified qmaster spool directory is not empty!

Do you want to select another qmaster spool directory (y/n) [y] >> n





Using qmaster spool directory >/opt/sge6/default/spool/qmaster<.





Windows Execution Host Support

------------------------------



Are you going to install Windows Execution Hosts? (y/n) [n] >> n







Verifying and setting file permissions

--------------------------------------



Did you install this version with >pkgadd< or did you already verify

and set the file permissions of your distribution (enter: y) (y/n) [y] >> n







Verifying and setting file permissions

--------------------------------------



We may now verify and set the file permissions of your Grid Engine

distribution.



This may be useful since due to unpacking and copying of your distribution

your files may be unaccessible to other users.



We will set the permissions of directories and binaries to



   755 - that means executable are accessible for the world



and for ordinary files to



   644 - that means readable for the world



Do you want to verify and set your file permissions (y/n) [y] >>





Verifying and setting file permissions and owner in >3rd_party<

Verifying and setting file permissions and owner in >bin<

Verifying and setting file permissions and owner in >ckpt<

Verifying and setting file permissions and owner in >dtrace<

Verifying and setting file permissions and owner in >examples<

Verifying and setting file permissions and owner in >inst_sge<

Verifying and setting file permissions and owner in >install_execd<

Verifying and setting file permissions and owner in >install_qmaster<

Verifying and setting file permissions and owner in >lib<

Verifying and setting file permissions and owner in >mpi<

Verifying and setting file permissions and owner in >pvm<

Verifying and setting file permissions and owner in >qmon<

Verifying and setting file permissions and owner in >util<

Verifying and setting file permissions and owner in >utilbin<

Verifying and setting file permissions and owner in >start_gui_installer<

Verifying and setting file permissions and owner in >catman<

Verifying and setting file permissions and owner in >doc<

Verifying and setting file permissions and owner in >include<

Verifying and setting file permissions and owner in >man<



Your file permissions were set







Select default Grid Engine hostname resolving method

----------------------------------------------------



Are all hosts of your cluster in one DNS domain? If this is

the case the hostnames



   >hostA< and >hostA.foo.com<



would be treated as equal, because the DNS domain name >foo.com<

is ignored when comparing hostnames.



Are all hosts of your cluster in a single DNS domain (y/n) [y] >> y



Ignoring domain name when comparing hostnames.









Grid Engine JMX MBean server

----------------------------



In order to use the SGE Inspect or the Service Domain Manager (SDM)

SGE adapter you need to configure a JMX server in qmaster. Qmaster 

will then load a Java Virtual Machine through a shared library.

NOTE: Java 1.5 or later is required for the JMX MBean server.



Do you want to enable the JMX MBean server (y/n) [y] >> y



Please give some basic parameters for JMX MBean server

We will ask for

   - JAVA_HOME

   - additional JVM arguments (optional)

   - JMX MBean server port

   - JMX ssl authentication

   - JMX ssl client authentication

   - JMX ssl server keystore path

   - JMX ssl server keystore password



Detecting suitable JAVA ...



Enter JAVA_HOME (use "none" when none available) [/usr] >> 

Please enter additional JVM arguments (optional, default is [-Xmx256m]) >> 

Please enter an unused port number for the JMX MBean server [3310] >> 

Enable JMX SSL server authentication (y/n) [y] >> 



Enable JMX SSL client authentication (y/n) [y] >> 



Enter JMX SSL server keystore path [/var/sgeCA/sge_qmaster/default/private/keystore] >> 

Enter JMX SSL server keystore pw (at least 6 characters) >> a***

Using the following JMX MBean server settings.

   libjvm_path              >/usr/java/jdk1.6.0_14/jre/lib/amd64/server/libjvm.so<

   Additional JVM arguments >-Xmx256m<

   JMX port                 >3310<

   JMX ssl                  >true<

   JMX client ssl           >true<

   JMX server keystore      >/var/sgeCA/sge_qmaster/default/private/keystore<

   JMX server keystore pw   >*********<



Do you want to use these data (y/n) [y] >> y



want to enable the JMX MBean server (y/n) [y] >> y







Making directories

------------------



Hit < RETURN > to continue >>





Setup spooling

--------------

Your SGE binaries are compiled to link the spooling libraries

during runtime (dynamically). So you can choose between Berkeley DB 

spooling and Classic spooling method.

Please choose a spooling method (berkeleydb|classic) [berkeleydb] >>











The Berkeley DB spooling method provides two configurations!



Local spooling:

The Berkeley DB spools into a local directory on this host (qmaster host)

This setup is faster, but you can't setup a shadow master host



Berkeley DB Spooling Server:

If you want to setup a shadow master host, you need to use

Berkeley DB Spooling Server!

In this case you have to choose a host with a configured RPC service.

The qmaster host connects via RPC to the Berkeley DB. This setup is more

failsafe, but results in a clear potential security hole. RPC communication

(as used by Berkeley DB) can be easily compromised. Please only use this

alternative if your site is secure or if you are not concerned about

security. Check the installation guide for further advice on how to achieve

failsafety without compromising security.



Do you want to use a Berkeley DB Spooling Server? (y/n) [n] >>







Berkeley Database spooling parameters

-------------------------------------



Please enter the database directory now, even if you want to spool locally,

it is necessary to enter this database directory. 



Default: [/opt/sge6/default/spool/spooldb] >> 



creating directory: /opt/sge6/default/spool/spooldb

Dumping bootstrapping information

Initializing spooling database







Grid Engine group id range

--------------------------



When jobs are started under the control of Grid Engine an additional group id

is set on platforms which do not support jobs. This is done to provide maximum

control for Grid Engine jobs.



This additional UNIX group id range must be unused group id's in your system.

Each job will be assigned a unique id during the time it is running.

Therefore you need to provide a range of id's which will be assigned

dynamically for jobs.



The range must be big enough to provide enough numbers for the maximum number

of Grid Engine jobs running at a single moment on a single host. E.g. a range

like >20000-20100< means, that Grid Engine will use the group ids from

20000-20100 and provides a range for 100 Grid Engine jobs at the same time

on a single host.



You can change at any time the group id range in your cluster configuration.



Please enter a range [20000-20100] >> 



Using >20000-20100< as gid range.







Grid Engine cluster configuration

---------------------------------



Please give the basic configuration parameters of your Grid Engine

installation:



   <execd_spool_dir>



The pathname of the spool directory of the execution hosts. User >root<

must have the right to create this directory and to write into it.



Default: [/opt/sge6/default/spool] >> 





Grid Engine cluster configuration (continued)

---------------------------------------------



<administrator_mail>



The email address of the administrator to whom problem reports are sent.



It is recommended to configure this parameter. You may use >none<

if you do not wish to receive administrator mail.



Please enter an email address in the form >user@foo.com<.



Default: [none] >> stuartpyoung@gmail.com







The following parameters for the cluster configuration were configured:



   execd_spool_dir        /opt/sge6/default/spool

   administrator_mail     stuartpyoung@gmail.com



Do you want to change the configuration parameters (y/n) [n] >>







Creating local configuration

----------------------------

Creating >act_qmaster< file

Adding default complex attributes

Adding default parallel environments (PE)

Adding SGE default usersets

Adding >sge_aliases< path aliases file

Adding >qtask< qtcsh sample default request file

Adding >sge_request< default submit options file

Adding >jmx/jmxremote.access< jmx remote access file

Adding >jmx/jmxremote.password< jmx remote password file

Adding >jmx/logging.properties< jmx logging configuration

Adding >jmx/java.policy< java policies configuration

Adding >jmx/jaas.config< jaas configuration

Adding >jmx/management.properties< jmx configuration

Creating >sgemaster< script

Creating >sgeexecd< script

Creating settings files for >.profile/.cshrc<







Initializing Certificate Authority (CA) for OpenSSL security framework

----------------------------------------------------------------------

Creating /opt/sge6/default/common/sgeCA

Creating /var/sgeCA/sge_qmaster/default

Creating /opt/sge6/default/common/sgeCA/certs

Creating /opt/sge6/default/common/sgeCA/crl

Creating /opt/sge6/default/common/sgeCA/newcerts

Creating /opt/sge6/default/common/sgeCA/serial

Creating /opt/sge6/default/common/sgeCA/index.txt

Creating /opt/sge6/default/common/sgeCA/usercerts

Creating /var/sgeCA/sge_qmaster/default/userkeys

Creating /var/sgeCA/sge_qmaster/default/private







You selected the following basic data for the distinguished name of

your certificates:



Country code:         C=US

State:                ST=fl

Location:             L=miami

Organization:         O=miami

Organizational unit:  OU=stuart

CA email address:     emailAddress=stuartpyoung@gmail.com



Do you want to use these data (y/n) [y] >> y







Creating CA certificate and private key

Generating a 1024 bit RSA private key

.....++++++

.....................................................++++++

writing new private key to '/var/sgeCA/sge_qmaster/default/private/cakey.pem'

-----





Creating 'daemon' certificate and key for SGE Daemon

----------------------------------------------------

Generating a 1024 bit RSA private key

....................++++++

.........................++++++

writing new private key to '/var/sgeCA/sge_qmaster/default/private/key.pem'

-----

Using configuration from /tmp/sge_ca110742.tmp

Check that the request matches the signature

Signature ok

The Subject's Distinguished Name is as follows

countryName           :PRINTABLE:'US'

stateOrProvinceName   :PRINTABLE:'fl'

localityName          :PRINTABLE:'miami'

organizationName      :PRINTABLE:'miami'

organizationalUnitName:PRINTABLE:'stuart'

userId                :PRINTABLE:'root'

commonName            :PRINTABLE:'SGE Daemon'

emailAddress          :IA5STRING:'none'

Certificate is to be certified until Jan 10 06:13:18 2012 GMT (365 days)



Write out database with 1 new entries

Data Base Updated

created and signed certificate for SGE daemons



Creating 'user' certificate and key for SGE install user

--------------------------------------------------------

Generating a 1024 bit RSA private key

.....++++++

.................................................................++++++

writing new private key to '/var/sgeCA/sge_qmaster/default/userkeys/root/key.pem'

-----

Using configuration from /tmp/sge_ca110742.tmp

Check that the request matches the signature

Signature ok

The Subject's Distinguished Name is as follows

countryName           :PRINTABLE:'US'

stateOrProvinceName   :PRINTABLE:'fl'

localityName          :PRINTABLE:'miami'

organizationName      :PRINTABLE:'miami'

organizationalUnitName:PRINTABLE:'stuart'

userId                :PRINTABLE:'root'

commonName            :PRINTABLE:'SGE install user'

emailAddress          :IA5STRING:'none'

Certificate is to be certified until Jan 10 06:13:19 2012 GMT (365 days)



Write out database with 1 new entries

Data Base Updated

created and signed certificate for user 'root' in '/var/sgeCA/sge_qmaster/default/userkeys/root'

chown: `default': invalid user





qmaster startup script

----------------------



We can install the startup script that will

start qmaster at machine boot (y/n) [y] >> y





cp /opt/sge6/default/common/sgemaster /etc/init.d/sgemaster.starcluster

/usr/lib/lsb/install_initd /etc/init.d/sgemaster.starcluster





Grid Engine qmaster startup

---------------------------



Starting qmaster daemon. Please wait ...

   starting sge_qmaster

   

   



Adding admin and submit hosts

-----------------------------



Please enter a blank seperated list of hosts.



Stop by entering < RETURN >. You may repeat this step until you are

entering an empty list. You will see messages from Grid Engine

when the hosts are added.



Host(s): ip-10-124-247-224.ec2.internal

ip-10-124-247-224.ec2.internal added to administrative host list

ip-10-124-247-224.ec2.internal added to submit host list

Hit < RETURN > to continue >> ip-10-124-245-118.ec2.internal





MASTER      ip-10-124-245-118.ec2.internal 

NODE 001    ip-10-124-247-224.ec2.internal







Adding admin and submit hosts

-----------------------------



Please enter a blank seperated list of hosts.



Stop by entering < RETURN >. You may repeat this step until you are

entering an empty list. You will see messages from Grid Engine

when the hosts are added.



Host(s): ip-10-124-245-118.ec2.internal ip-10-124-247-224.ec2.internal

ip-10-124-245-118.ec2.internal added to administrative host list

ip-10-124-245-118.ec2.internal added to submit host list

adminhost "ip-10-124-247-224.ec2.internal" already exists

submithost "ip-10-124-247-224.ec2.internal" already exists

Hit < RETURN > to continue >> 





Adding admin and submit hosts

-----------------------------



Please enter a blank seperated list of hosts.



Stop by entering < RETURN >. You may repeat this step until you are

entering an empty list. You will see messages from Grid Engine

when the hosts are added.



Host(s): 

Finished adding hosts.





If you want to use a shadow host, it is recommended to add this host

to the list of administrative hosts.



If you are not sure, it is also possible to add or remove hosts after the

installation with <qconf -ah hostname> for adding and <qconf -dh hostname>

for removing this host



Attention: This is not the shadow host installation

procedure.

You still have to install the shadow host separately



Do you want to add your shadow host(s) now? (y/n) [y] >> n









Creating the default <all.q> queue and <allhosts> hostgroup

-----------------------------------------------------------



root@ip-10-127-158-202.ec2.internal added "@allhosts" to host group list

root@ip-10-127-158-202.ec2.internal added "all.q" to cluster queue list



Hit < RETURN > to continue >>







Choosing password for the administrative user of SGE daemons

------------------------------------------------------------

Enter pw for default's keystore (at least 6 characters) >> 

Generating keystore for default ...







Scheduler Tuning

----------------



The details on the different options are described in the manual. 



Configurations

--------------

1) Normal

          Fixed interval scheduling, report limited scheduling information,

          actual + assumed load



2) High

          Fixed interval scheduling, report limited scheduling information,

          actual load



3) Max

          Immediate Scheduling, report no scheduling information,

          actual load



Enter the number of your preferred configuration and hit < RETURN >! 

Default configuration is [1] >>







Using Grid Engine

-----------------



You should now enter the command:



   source /opt/sge6/default/common/settings.csh



if you are a csh/tcsh user or



   # . /opt/sge6/default/common/settings.sh



if you are a sh/ksh user.



This will set or expand the following environment variables:



   - $SGE_ROOT         (always necessary)

   - $SGE_CELL         (if you are using a cell other than >default<)

   - $SGE_CLUSTER_NAME (always necessary)

   - $SGE_QMASTER_PORT (if you haven't added the service >sge_qmaster<)

   - $SGE_EXECD_PORT   (if you haven't added the service >sge_execd<)

   - $PATH/$path       (to find the Grid Engine binaries)

   - $MANPATH          (to access the manual pages)



Hit < RETURN > to see where Grid Engine logs messages >> 









Grid Engine messages

--------------------



Grid Engine messages can be found at:



   /tmp/qmaster_messages (during qmaster startup)

   /tmp/execd_messages   (during execution daemon startup)



After startup the daemons log their messages in their spool directories.



   Qmaster:     /opt/sge6/default/spool/qmaster/messages

   Exec daemon: <execd_spool_dir>/< hostname >/messages





Grid Engine startup scripts

---------------------------



Grid Engine startup scripts can be found at:



   /opt/sge6/default/common/sgemaster (qmaster)

   /opt/sge6/default/common/sgeexecd (execd)



Do you want to see previous screen about using Grid Engine again (y/n) [n] >>









Your Grid Engine qmaster installation is now completed

------------------------------------------------------



Please now login to all hosts where you want to run an execution daemon

and start the execution host installation procedure.



If you want to run an execution daemon on this host, please do not forget

to make the execution host installation in this host as well.



All execution hosts must be administrative hosts during the installation.

All hosts which you added to the list of administrative hosts during this

installation procedure can now be installed.



You may verify your administrative hosts with the command



   # qconf -sh



and you may add new administrative hosts with the command



   # qconf -ah < hostname >



Please hit < RETURN > >> 





CONFIRM THAT SGE IS RUNNING:



ps aux | grep sge



    root      9273  0.0  0.4  10252  2716 pts/1    T    00:37   0:00 /bin/sh /opt/sge6/inst_sge -x

    root     11251  0.0  5.0 605076 32392 ?        Sl   01:14   0:00 /opt/sge6/bin/lx24-amd64/sge_qmaster

    root     11547  0.0  0.0   6020   592 pts/1    R+   01:24   0:00 grep sge







ADD TO PATH:



###export SGE_QMASTER_PORT=3308

export PATH=/opt/sge6/bin/lx24-amd64:$PATH





/opt/sge6/bin/lx24-amd64/qconf -sh



    ip-10-124-245-118.ec2.internal

    ip-10-124-247-224.ec2.internal

    ip-10-127-158-202.ec2.internal



qconf -ae ip-10-124-247-224.ec2.internal



qconf -se ip-10-124-245-118.ec2.internal

qconf -se ip-10-124-247-224.ec2.internal

qconf -se ip-10-127-158-202.ec2.internal




</entry>



