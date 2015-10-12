agua.archive.5


<entry [Sat 2011:09:24 01:20:05 EST] FIXED 'Can't locate MooseX/Declare.pm in @INC'>

em /nethome/syoung/agua/BOWTIE/alignment/stdout/BOWTIE-6-alignment-5-stderr.txt

Can't locate MooseX/Declare.pm in @INC (@INC contains: /agua/0.6-195-aa4143f/bin/apps/jbro\
wse/../../../lib/external /agua/0.6-195-aa4143f/bin/apps/jbrowse/../../../lib /etc/perl /u\
sr/local/lib/perl/5.10.1 /usr/local/share/perl/5.10.1 /usr/lib/perl5 /usr/share/perl5 /usr\
/lib/perl/5.10 /usr/share/perl/5.10 /usr/local/lib/site_perl .) at /agua/0.6-195-aa4143f/b\
in/apps/jbrowse/../../../lib/Agua/View.pm line 1.
BEGIN failed--compilation aborted at /agua/0.6-195-aa4143f/bin/apps/jbrowse/../../../lib/A\
gua/View.pm line 1.
Compilation failed in require at /agua/0.6/bin/apps/jbrowse/jbrowseFeatures.pl line 153.
BEGIN failed--compilation aborted at /agua/0.6/bin/apps/jbrowse/jbrowseFeatures.pl line 15\
3.



    
</entry>
<entry [Wed 2011:09:14 14:06:11 EST] QMASTER FAILS TO START ON /top/sge/bin/lx24-amd/sge_qmaster COMMAND ON HEADNODE>


09/14/2011 18:05:56|  main|domU-12-31-38-04-80-08|C|qmaster on host "10.220.219\
.244" is still running - terminating
    
</entry>
<entry [Wed 2011:09:14 00:19:09 EST] FIXED getStatus ERROR DUE TO MISSING BALANCER PID>


work '{"username":"syoung","sessionId":"9999999999.9999.999","project":"BOWTIE","workflow":"alignment","mode":"getStatus"}'
Content-type: text/html

Agua::Workflow::getStatus    Workflow::getStatus()
Agua::Workflow::getStatus    project: BOWTIE
Agua::Workflow::getStatus    workflow: alignment
Agua::Workflow::getStatus    SELECT *, NOW() AS now
FROM stage
WHERE username ='syoung'
AND project = 'BOWTIE'
AND workflow = 'alignment'
ORDER BY number

Agua::Workflow::getStatus    stage 1: chopfile
Agua::Workflow::getStatus    stage 2: chopfile
Agua::Workflow::getStatus    stage 3: elandHeader
Agua::Workflow::getStatus    stage 4: ELAND
Agua::Workflow::getStatus    stage 5: jbrowseFeatures
Agua::Workflow::getStatus    cluster: syoung-microcluster
Agua::Workflow::clusterOutput    Agua::Workflow::clusterOutput()
Agua::Workflow::clusterOutput    self->cluster(): syoung-microcluster
Agua::Workflow::clusterOutput    Doing StarCluster->balancerOutput(cluster)
Agua::Workflow::clusterOutput    sge_running: 0
Agua::Common::SGE::stopSgeProcess    Common::SGE::stopSgeProcess(remote, process)
Agua::Common::SGE::stopSgeProcess    process: syoung
Use of uninitialized value $pid in concatenation (.) or string at /agua/0.6-195-aa4143f/cgi-bin/lib/Agua/Common/SGE.pm line 931.
Agua::Common::SGE::stopSgeProcess    pid: 
Use of uninitialized value $pid in concatenation (.) or string at /agua/0.6-195-aa4143f/cgi-bin/lib/Agua/Common/SGE.pm line 933.
Agua::Common::SGE::stopSgeProcess    command: kill -9 
Usage:
  kill pid ...              Send SIGTERM to every process listed.
  kill signal pid ...       Send a signal to every process listed.
  kill -s signal pid ...    Send a signal to every process listed.
  kill -l                   List all signal names.
  kill -L                   List all signal names in a nice table.
  kill -l signal            Convert between signal numbers and names.
Agua::Common::SGE::stopSgeProcess    Common::SGE::stopSgeProcess(remote, process)
Agua::Common::SGE::stopSgeProcess    process: syoung-microcluster
Use of uninitialized value $pid in concatenation (.) or string at /agua/0.6-195-aa4143f/cgi-bin/lib/Agua/Common/SGE.pm line 931.
Agua::Common::SGE::stopSgeProcess    pid: 
Use of uninitialized value $pid in concatenation (.) or string at /agua/0.6-195-aa4143f/cgi-bin/lib/Agua/Common/SGE.pm line 933.
Agua::Common::SGE::stopSgeProcess    command: kill -9 
Usage:
  kill pid ...              Send SIGTERM to every process listed.
  kill signal pid ...       Send a signal to every process listed.
  kill -s signal pid ...    Send a signal to every process listed.
  kill -l                   List all signal names.
  kill -L                   List all signal names in a nice table.
  kill -l signal            Convert between signal numbers and names.
Agua::Common::SGE::startSge    command: export SGE_QMASTER_PORT=36471; export SGE_EXECD_PORT=36472; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-microcluster; export USERNAME=syoung; export QUEUE=syoung-BOWTIE-alignment; export PROJECT=BOWTIE; export WORKFLOW=alignment; /opt/sge6/bin/lx24-amd64/sge_qmaster
Agua::Common::SGE::startSge    command: export SGE_QMASTER_PORT=36471; export SGE_EXECD_PORT=36472; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-microcluster; export USERNAME=syoung; export QUEUE=syoung-BOWTIE-alignment; export PROJECT=BOWTIE; export WORKFLOW=alignment; /opt/sge6/bin/lx24-amd64/sge_execd
error: communication error for "domU-12-31-38-04-80-08.compute-1.internal/execd/1" running on port 36472: "can't bind socket"
error: commlib error: can't bind socket (no additional information available)
^Z
[5]+  Stopped                 echo $1 | /var/www/cgi-bin/agua/0.6/workflow.cgi
www-data@domU-12-31-38-04-80-08:~/cgi-bin/agua/0.6$ critical error: abort qmaster registration due to communication errors
daemonize error: child exited before sending daemonize state

    
</entry>
<entry [Tue 2011:09:13 02:29:43 EST] FIXED SSL PROBLEM: 'Invalid method in request \x16\x03\x01'>

PROBLEM: SSL DOESN'T WORK ('SSL connection error') AND APACHE ERROR LOG SHOWS:

    [Tue Sep 13 02:03:49 2011] [error] [client 76.110.77.97] Invalid method in request \x16\x03
    [Tue Sep 13 02:03:49 2011] [error] [client 76.110.77.97] Invalid method in request \x16\x03


DIAGNOSIS:

USING _default_:443 AS SERVER IP, INSTEAD OF ACTUAL SERVER IP


telnet 107.20.162.29 443
Trying 107.20.162.29...
Connected to 107.20.162.29.
Escape character is '^]'.
GET \
    < !DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
    < html>< head>
    < title>400 Bad Request< /title>
    < /head>< body>
    < h1>Bad Request< /h1>
    < p>Your browser sent a request that this server could not understand.< br />
    < /p>
    < hr>
    < address>Apache/2.2.14 (Ubuntu) Server at domU-12-31-38-04-80-08.compute-1.internal Port 80< /address>
    < /body>< /html>
    Connection closed by foreign host.


    
SOLUTION:

CREATE LINK:

sudo ln -s /etc/apache2/sites-available/default-ssl /etc/apache2/sites-enabled/000-default-ssl

NOW TELNET WORKS:

telnet 107.20.162.29 443
Trying 107.20.162.29...
Connected to 107.20.162.29.
Escape character is '^]'.
GET /
^]
telnet> QUIT
Connection closed.


AND BROWSER WORKS:

https://ec2-107-20-162-29.compute-1.amazonaws.com/

    IT WORKS!


NOTES
-----

http://www.noah.org/wiki/Apache2_Invalid_method_in_request_%5Cx16%5Cx03%5Cx01

    Apache2 Invalid method in request \x16\x03\x01
    
    You are testing your SSL certificate on port 443 and your browser displays this message:
    Invalid method in request \x16\x03\x01
    You may also see SSL_ERROR_RX_RECORD_TOO_LONG or "www.example.com has sent an incorrect or unexpected message. Error Code: -12263".
    You can try debugging the problem by telnetting to the server on port 443 and issuing a GET command:
    # telnet 192.168.0.1 443
    Trying 192.168.0.1...
    Connected to 192.168.0.1.
    Escape character is '^]'.
    GET /
    If you get back HTML then you know your server is speaking unencrypted HTTP on port 443, which is bad.
    This error is due to a misconfiguration of VirtualHost with SSL. The server is trying to respond to a request on port 443 with unencrypted HTTP. In other words, your browser is expecting SSL, but the server is sending plain HTTP on port 443.
    Typically your conf/httpd.conf file will include conf/extra/httpd-ssl.conf:
    Include conf/extra/httpd-ssl.conf
    The default httpd-ssl.conf file will have a section like this:
    < VirtualHost _default_:443>
    ...
    < /VirtualHost>
    Almost certainly the problem is that your server is using this default or the server is not matching your virtual host's IP at all. For SSL to work you must match the virtual host by IP address not name. [Apache2_mod_vhost_alias_ssl|Named virtual host won't work with SSL].


    
</entry>
<entry [Mon 2011:09:12 02:44:18 EST] FIXED CA CERT DOESN'T SEEM TO WORK - 'UNABLE TO CONNECT' ON https>

http://www.vanemery.com/Linux/Apache/apache-SSL.html
    
PROBLEM: 

    Firefox can't establish a connection to the server at 107.20.162.29


DIAGNOSIS:

FORGOT TO ADD SSL MODULE AND ALSO HAD TO CREATE LINK TO default-ssl


SOLUTION:

1. ADD SSL MODULE TO APACHE

a2enmod ssl

    Enabling module ssl.
    See /usr/share/doc/apache2.2-common/README.Debian.gz on how to configure SSL and create self-signed certificates.
    Run '/etc/init.d/apache2 restart' to activate new configuration!


2. CREATE LINK FROM DEFAULT SSL CONFIG TO sites-enabled DIRECTORY

sudo ln -s /etc/apache2/sites-available/default-ssl /etc/apache2/sites-enabled/000-default-ssl

NB: CAN USE EXISTING DEFAULT SSL CONFIG FILE (DON'T NEED TO CREATE ssl.conf FILE):

/etc/apache2/sites-available/default-ssl


3. RESTART APACHE

AND CONFIRMED THAT APACHE IS LISTENING ON 443 NOW:

netstat -ntulp 
    Active Internet connections (only servers)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
    tcp        0      0 0.0.0.0:443             0.0.0.0:*               LISTEN      31964/apache2  
    ...


NB: EC2 COMMAND TO ENABLE SSL FOR SECURITY GROUP default:

ec2-authorize default -p 443

    GROUP           default
    PERMISSION              default ALLOWS  tcp     443     443     FROM    CIDR    0.0.0.0/0


NOTES
-----

THREE WAYS TO CHECK PORTS: nmap, lsof AND netstat

nmap -sS -O 127.0.0.1

    Starting Nmap 5.00 ( http://nmap.org ) at 2011-09-12 20:10 UTC
    Interesting ports on localhost (127.0.0.1):
    Not shown: 995 closed ports
    PORT     STATE SERVICE
    22/tcp   open  ssh
    80/tcp   open  http
    111/tcp  open  rpcbind
    2049/tcp open  nfs
    3306/tcp open  mysql
    ...
    Nmap done: 1 IP address (1 host up) scanned in 12.25 seconds

lsof -i -n -P 
    COMMAND     PID     USER   FD   TYPE  DEVICE SIZE/OFF NODE NAME
    portmap     238   daemon    4u  IPv4    3748      0t0  UDP *:111 
    portmap     238   daemon    5u  IPv4    3757      0t0  TCP *:111 (LISTEN)
    dhclient3   304     root    4u  IPv4    3807      0t0  UDP *:68 
    rpc.statd   377    statd    5u  IPv4    4041      0t0  UDP *:977 
    rpc.statd   377    statd    7u  IPv4    4049      0t0  UDP *:56650 
    rpc.statd   377    statd    8u  IPv4    4055      0t0  TCP *:33657 (LISTEN)
    sshd        440     root    3u  IPv4    4243      0t0  TCP *:22 (LISTEN)
    sshd        440     root    4u  IPv6    4245      0t0  TCP *:22 (LISTEN)
    openhpid    658     root    3u  IPv4    4841      0t0  TCP *:4743 (LISTEN)
    rpc.mount 11152     root    5u  IPv4   38900      0t0  TCP 10.220.131.246:54130->10.220.219.244:22 (ESTABLISHED)
    rpc.mount 11152     root   10u  IPv4   40401      0t0  UDP *:32767 
    rpc.mount 11152     root   11u  IPv4   40404      0t0  TCP *:32767 (LISTEN)
    mysqld    17821    mysql   10u  IPv4 1118110      0t0  TCP 127.0.0.1:3306 (LISTEN)
    sshd      24383     root    3r  IPv4 1152365      0t0  TCP 10.220.131.246:22->76.110.77.97:59853 (ESTABLISHED)
    apache2   27388     root    3u  IPv4 1164458      0t0  TCP *:80 (LISTEN)
    apache2   27390 www-data    3u  IPv4 1164458      0t0  TCP *:80 (LISTEN)
    apache2   27391 www-data    3u  IPv4 1164458      0t0  TCP *:80 (LISTEN)
    sshd      27501     root    3r  IPv4 1164807      0t0  TCP 10.220.131.246:22->76.110.77.97:47383 (ESTABLISHED)
    sshd      27651     root    3r  IPv4 1165354      0t0  TCP 10.220.131.246:22->76.110.77.97:34416 (ESTABLISHED)




init.pl INSTALL LOG
-------------------

Agua::Init::init     AWS::init()
Agua::Init::init    Doing generateCACert()
cp -f /agua/0.6/conf/admin/.keypairs/private.pem /nethome/admin/.starcluster/privatekey.pem-pass
Conf::StarCluster::generateCACert    Removing pass-phrase from key
openssl rsa -in /nethome/admin/.starcluster/privatekey.pem-pass -out /nethome/admin/.starcluster/privatekey.pem
writing RSA key
Conf::StarCluster::generateCACert    instanceid: i-3ba8c35a
Conf::StarCluster::generateCACert    domainname: ec2-107-20-162-29.compute-1.amazonaws.com
Conf::StarCluster::generateCACert    request: openssl \
req \
-config /nethome/admin/.starcluster/config.txt \
-newkey rsa:1024 \
-key /nethome/admin/.starcluster/privatekey.pem \
-out /nethome/admin/.starcluster/pipeline.pem
\nConf::StarCluster::generateCACert    certify: openssl \
x509 -req \
-extfile /nethome/admin/.starcluster/config.txt \
-days 730 \
-signkey /nethome/admin/.starcluster/privatekey.pem \
-in /nethome/admin/.starcluster/pipeline.pem \
-out /nethome/admin/.starcluster/CA-cert.pem

Signature ok
subject=/C=US/ST=Maryland/O=UMCP/OIT/TSS/EIS/CN=ec2-107-20-162-29.compute-1.amazonaws.com/emailAddress=trash@trash.com
Getting Private key
Conf::StarCluster::generateCACert    keydir: /etc/apache2/ssl.key
Conf::StarCluster::generateCACert    copyprivate: cp -f /nethome/admin/.starcluster/privatekey.pem /etc/apache2/ssl.key/server.key
Conf::StarCluster::generateCACert    copypublic: cp -f /nethome/admin/.starcluster/CA-cert.pem /etc/apache2/ssl.key/server.crt
DEBUG EXIT 

ll /etc/apache2/ssl.key/server.crt
    -rw-rw-rw- 1 root root 1.3K 2011-09-12 06:40 /etc/apache2/ssl.key/server.crt

cat /nethome/admin/.starcluster/CA-cert.pem
    -----BEGIN CERTIFICATE-----
    MIIDqDCCAxGgAwIBAgIJANIHiVyokTm+MA0GCSqGSIb3DQEBBQUAMIGPMQswCQYD
    VQQGEwJVUzERMA8GA1UECBMITWFyeWxhbmQxGTAXBgNVBAoTEFVNQ1AvT0lUL1RT
    Uy9FSVMxMjAwBgNVBAMTKWVjMi0xMDctMjAtMTYyLTI5LmNvbXB1dGUtMS5hbWF6
    b25hd3MuY29tMR4wHAYJKoZIhvcNAQkBFg90cmFzaEB0cmFzaC5jb20wHhcNMTEw
    OTEyMDY0MDA2WhcNMTMwOTExMDY0MDA2WjCBjzELMAkGA1UEBhMCVVMxETAPBgNV
    BAgTCE1hcnlsYW5kMRkwFwYDVQQKExBVTUNQL09JVC9UU1MvRUlTMTIwMAYDVQQD
    EyllYzItMTA3LTIwLTE2Mi0yOS5jb21wdXRlLTEuYW1hem9uYXdzLmNvbTEeMBwG
    CSqGSIb3DQEJARYPdHJhc2hAdHJhc2guY29tMIGfMA0GCSqGSIb3DQEBAQUAA4GN
    ADCBiQKBgQCZ+6PKDlGlIE8CONGqEV65risoWVlmSXlnC4Z2HJrIAtheH/cx0vVK
    UXnFodkK6y11ZrvsXbsNXaH1sVAE/6f+dZRjleYcq3bbDKBw0DVSLwujNhEw/rc+
    Word5OmewNWlq1fOpu8rVOeZo+wZ4o17aTLyNJ17OfVVXoOHAcP0BQIDAQABo4IB
    CDCCAQQwHQYDVR0OBBYEFJ+e8QviioowIbGVK2JlDZ0k70MYMIHEBgNVHSMEgbww
    gbmAFJ+e8QviioowIbGVK2JlDZ0k70MYoYGVpIGSMIGPMQswCQYDVQQGEwJVUzER
    MA8GA1UECBMITWFyeWxhbmQxGTAXBgNVBAoTEFVNQ1AvT0lUL1RTUy9FSVMxMjAw
    BgNVBAMTKWVjMi0xMDctMjAtMTYyLTI5LmNvbXB1dGUtMS5hbWF6b25hd3MuY29t
    MR4wHAYJKoZIhvcNAQkBFg90cmFzaEB0cmFzaC5jb22CCQDSB4lcqJE5vjAJBgNV
    HRMEAjAAMBEGCWCGSAGG+EIBAQQEAwIGQDANBgkqhkiG9w0BAQUFAAOBgQBoXC8R
    vU943ZOv06VHBw+YlX4ADzUErQ5UpD1SXKzzv428tA5f4VBI1elY4xXTkL+wefIZ
    ZcHzoyjVNZAoq+BxV6PKFXEVYKc3Ac/20xp8W4lV6Tvre+WH7PS724/k/leiU0Ir
    rv8WzTKOeMaw4hfDx4pJ7TCZDHK07E1zklWnyQ==
    -----END CERTIFICATE-----
   
   

   
</entry>
<entry [Tue 2011:09:06 23:16:04 EST] FIXED CAN'T LOCATE Getopt::Simple ON MASTER>

PROBLEM: GET THIS ERROR WHEN RUNNING ELAND.pl ON MASTER

Can't locate Getopt/Simple.pm in @INC (@INC contains:
/agua/0.6-195-aa4143f/bin/apps/aligners/../../../lib/external
/agua/0.6-195-aa4143f/bin/apps/aligners/../../../lib
/etc/perl
/usr/local/lib/perl/5.10.1
/usr/local/share/perl/5.10.1
/usr/lib/perl5
/usr/share/perl5
/usr/lib/perl/5.10
/usr/share/perl/5.10
/usr/local/lib/site_perl

.) at
/agua/0.6-195-aa4143f/bin/apps/aligners/../../../lib/Aligner/ELAND.pm line 1.



DIAGNOSIS:

locate Getopt/Simple
/usr/local/lib/perl/5.10.1/auto/Getopt/Simple
/usr/local/lib/perl/5.10.1/auto/Getopt/Simple/.packlist
/usr/local/share/perl/5.10.1/Getopt/Simple.pm

Getopt::Simple WAS INSTALLED TO

/usr/local/share/perl/5.10.1

AND A SIMILAR INSTALLATION EXISTS HERE:

/usr/share/perl/5.10


ll /usr/share/perl/5.10/Getopt/
    -rw-r--r--  1 root root  40K 2010-04-23 08:37 Long.pm
    -rw-r--r--  1 root root 8.2K 2010-04-23 08:22 Std.pm



SOLUTION:

ADD  




PROBLEM: UNKNOWN QUEUE "syoung-BOWTIE-alignment"

Agua::Cluster::Jobs::execute    scriptfile: /nethome/syoung/agua/BOWTIE/alignment//scripts/BOWTIE-6-alignment-4.sh
Agua::Stage::runOnCluster    queue: syoung-BOWTIE-alignment
Agua::Stage::runOnCluster    qsub: /opt/sge6/bin/lx24-amd64/qsub
Unable to run job: Job was rejected because job requests unknown queue "syoung-BOWTIE-alignment".

SOLUTION:




    
</entry>
<entry [Fri 2011:09:02 02:47:17 EST] BIOINFORMATICS SCRIPTS ON GITHUB>

http://develop.github.com/p/repo.html
(github DEVELOP: INFO ON API)


SEARCH GITHUB: repos/search
curl http://github.com/api/v2/json/repos/search/


REPO INFO: repos/show
curl http://github.com/api/v2/json/repos/show/schacon/grit


github PROJECT SETUP SCRIPT
https://github.com/cassj/ProjectManager/blob/master/bin/project_init.pl
    

</entry>
<entry [Thu 2011:09:01 05:52:26 EST] LOAD BALANCER'S qhost -xml CALL FAILS BECAUSE SGE IS NOT RUNNING ON MASTER>

PROBLEM: SGE IS NOT RUNNING ON MASTER, CAUSING THE LOAD BALANCER'S qhost -xml CALL TO FAIL


SOLUTION:

ADDED THE FOLLOWING TO Agua::Common::Cluster::checkSge TO RESTART SGE ON HEADNODE AND MASTER IF NOT RUNNING:

1. KILL QMASTER AND EXECD ON MASTER

2. SET HEADNODE act_qmaster TO MASTER SHORT INTERNAL IP

3. START SGE ON HEADNODE
(THIS WILL SET HEADNODE act_qmaster TO HEADNODE LONG INTERNAL IP)

4. RESET HEADNODE act_qmaster TO MASTER SHORT INTERNAL IP
    



DIAGNOSIS:

ADDING THE ENVIRONMENT VARIABLES IN THE SSH COMMAND DIDN'T FIX THIS PROBLEM:

    >>> balancers.sge.__init__.__init__    self.qmasterport: 36471
    >>> balancers.sge.__init__.__init__    self.execdport: 36472
    >>> balancers.sge.__init__.__init__    self.root: /opt/sge6
    >>> balancers.sge.__init__.__init__    self.cell: syoung-microcluster
    !!! ERROR - command 'export SGE_QMASTER_PORT=36471 &&  export SGE_EXECD_PORT=36472 && qhost -xml' failed with status 127
    !!! ERROR - command 'export SGE_QMASTER_PORT=36471 &&  export SGE_EXECD_PORT=36472 && qstat -q all.q -u "*" -xml' failed with status 127
    Traceback (most recent call last):


GOT MASTER HOSTNAME TO TRY SSH CONNECT ON HEADNODE TO MASTER (CONFIRMED HOSTNAME WITH ec2din)

cat /opt/sge6/syoung-microcluster/common/act_qmaster
    domU-12-31-38-04-80-08.compute-1.internal


SSH CONNECT USING MASTER LONG INTERNAL IP FAILS BUT WORKS USING MASTER SHORT INTERNAL IP:

ssh -i /nethome/admin/.starcluster/id_rsa-admin-key root@domU-12-31-38-04-80-08.compute-1.internal
    Warning: Permanently added 'domu-12-31-38-04-80-08.compute-1.internal,10.220.131.246' (RSA) to the list of known hosts.
    Permission denied (publickey).
    

ssh -i /nethome/admin/.starcluster/id_rsa-admin-key root@10.220.219.244
    root@master:~# 
    OK


BUT SSH qhost COMMAND FAILS ... BECAUSE SGE IS NOT RUNNING ON MASTER:

ssh -i /nethome/admin/.starcluster/id_rsa-admin-key root@10.220.219.244 "export SGE_QMASTER_PORT=36471 &&  export SGE_EXECD_PORT=36472 && export SGE_ROOT=/opt/sge6 && /opt/sge6/bin/lx24-amd64/qhost -xml"

    error: commlib error: got select error (Connection refused)
    error: unable to send message to qmaster using port 36471 on host "master": got send error


SO REMOTELY STARTED SGE:

ssh -i /nethome/admin/.starcluster/id_rsa-admin-key root@10.220.219.244 "export SGE_QMASTER_PORT=36471 &&  export SGE_EXECD_PORT=36472 && export SGE_ROOT=/opt/sge6 && /opt/sge6/bin/lx24-amd64/sge_qmaster"

ssh -i /nethome/admin/.starcluster/id_rsa-admin-key root@10.220.219.244 "export SGE_QMASTER_PORT=36471 &&  export SGE_EXECD_PORT=36472 && export SGE_ROOT=/opt/sge6 && /opt/sge6/bin/lx24-amd64/sge_execd"


AND THIS TIME qhost WORKS:

ssh -i /nethome/admin/.starcluster/id_rsa-admin-key root@10.220.219.244 "export SGE_QMASTER_PORT=36471 &&  export SGE_EXECD_PORT=36472 && export SGE_ROOT=/opt/sge6 && /opt/sge6/bin/lx24-amd64/qhost -xml"

<!--

<?xml version='1.0'?>
<qhost xmlns:xsd="http://gridengine.sunsource.net/source/browse/*checkout*/gridengine/source/dist/util/resources/schemas/qhost/qhost.xsd?revision=1.2">
 <host name='global'>
   <hostvalue name='arch_string'>-</hostvalue>
    ...

-->


NOTES
-----

PREVIOUSLY: THOUGHT THAT LOAD BALANCER WAS NOT RECEIVING ENVIRONMENT VARIABLES IN starcluster/balancers/sge/__init__.py BUT IT WAS:

cd /nethome/admin/.starcluster/plugins;
export SGE_QMASTER_PORT=36471; export SGE_EXECD_PORT=36472; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-microcluster; export USERNAME=syoung; /data/starcluster/0.92rc2/bin/starcluster -c /nethome/admin/.starcluster/syoung-microcluster.config bal syoung-microcluster -m 3 -n 0 -i 30 -w 100 -s 30

em /nethome/admin/agua/.cluster/syoung-microcluster-loadbalancer.out

    !!! ERROR - command 'qhost -xml' failed with status 127
    !!! ERROR - command 'qstat -q all.q -u "*" -xml' failed with status 127
    Traceback (most recent call last):
      File "/data/starcluster/0.92rc2/starcluster/cli.py", line 172, in main
        sc.execute(args)
      File "/data/starcluster/0.92rc2/starcluster/commands/loadbalance.py", line 96, in execute
        lb.run(cluster)
      File "/data/starcluster/0.92rc2/starcluster/balancers/sge/__init__.py", line 582, in run
        if self.get_stats() == -1:
      File "/data/starcluster/0.92rc2/starcluster/balancers/sge/__init__.py", line 537, in get_stats
        self.stat.parse_qhost(qhostxml)
      File "/data/starcluster/0.92rc2/starcluster/balancers/sge/__init__.py", line 50, in parse_qhost
        doc = xml.dom.minidom.parseString(string)

</entry>
<entry [Thu 2011:09:01 04:25:19 EST] FIXED ARGUMENTS FOR automount.py>

cd /nethome/admin/.starcluster/plugins; export SGE_QMASTER_PORT=36471; export SGE_EXECD_PORT=36472; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-microcluster; export USERNAME=syoung; /data/starcluster/0.92rc2/bin/starcluster -c /nethome/admin/.starcluster/syoung-microcluster.config bal syoung-microcluster -m 3 -n 0 -i 30 -w 100 -s 30

em /nethome/admin/agua/.cluster/syoung-microcluster-loadbalancer.out

    >> 0.92.rc2    config.__init__    self.cfg_file: /nethome/admin/.starcluster/syoung-microcluster.config
    *** WARNING - Not enough settings provided for plugin automount
    *** WARNING - An error occured while loading plugins
    *** WARNING - Not running any plugins
    *** WARNING - The recommended wait_time should be >= 300 seconds (it takes ~5 min to launch a new EC2 node)

    
</entry>
<entry [Thu 2011:09:01 03:17:51 EST] TESTED Workflow::executeWorkflow>

RUN WORKFLOW

echo '{"project":"BOWTIE","workflow":"alignment","workflownumber":"1","number":1,"stop":"","username":"syoung","sessionId":"9999999999.9999.999","mode":"executeWorkflow","cluster":"syoung-microcluster"}' | ./workflow.cgi

OR THE SAME WITH SHORTCUT:

work '{"project":"BOWTIE","workflow":"alignment","workflownumber":"1","number":"1","stop":"1","username":"syoung","sessionId":"9999999999.9999.999","mode":"executeWorkflow","cluster":"syoung-microcluster"}'




</entry>
<entry [Tue 2011:08:30 12:15:41 EST] GOOD REVIEW OF EBS-BACKED VERSUS S3 INSTANCES>

http://www.theserverlabs.com/blog/2010/07/08/ec2-persistence-strategies/

    
</entry>
<entry [Tue 2011:08:30 12:11:03 EST] RECAPTURE UNUSED EC2 MINUTES>

http://shlomoswidler.com/2011/02/recapture-unused-ec2-minutes.html

REPURPOSE INSTANCE BY REBOOTING INTO BENEFICIAL EBS-VOLUME
    
</entry>
<entry [Tue 2011:08:30 12:10:47 EST] CHANGE THE INSTANCE TYPE OF A RUNNING INSTANCE>

1. STOP THE INSTANCE


2. CHANGE THE INSTANCE TYPE OF THE STOPPED INSTANCE

ec2-modify-instance-attribute -t t1.micro i-3ba8c35a

    instanceType	i-3ba8c35a	t1.micro


3. RESTART INSTANCE


on  
http://things.zarate.org/scaling-a-single-ec2-instance-and-downsizing

However, my goal is to have one canonical volume that I can quickly boot on varying instance types. To do this, your options are two:

While the instance is stopped, use the command-line EC2 API tools (specifically, ec2-modify-instance-attribute) to change the instance type. Then restart the instance, either from the command line or via the Web console.
Boot instances of varying types from public AMIs, stop them, and detach and delete their default EBS volumes. Then attach your EBS volume and boot as needed.

    
</entry>
<entry [Tue 2011:08:30 12:04:47 EST] LOCKED aquarius2 (HEADNODE) SO CAN'T BE TERMINATED>

http://things.zarate.org/scaling-a-single-ec2-instance-and-downsizing

ec2-modify-instance-attribute --disable-api-termination true i-3ba8c35a

    disableApiTermination	i-3ba8c35a	true

    
</entry>
<entry [Tue 2011:08:30 11:50:41 EST] SCRIPT TO UPDATE HOSTNAME AFTER RESTART>

http://www.theserverlabs.com/blog/2010/07/08/ec2-persistence-strategies/
http://things.zarate.org/scaling-a-single-ec2-instance-and-downsizing


1. CALL STARTUP SCRIPT FROM /etc/rc.local TO UPDATE HOSTNAME AFTER STOP/START:

CONTENTS OF rc.local 


 cat /etc/rc.local
#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.


2. STARTUP SCRIPT UPDATES hostname

/agua/0.6/bin/scripts/aguaStartup.sh
emacs /agua/0.6/bin/scripts/aguaStartup.sh

    #!/bin/sh
    
    #### AUTOMOUNT DATA    
    mount -t ext3 /dev/sdh /data
    
    #### START LOG
    LOGFILE=/tmp/aguaStartup.log
    echo "Doing aguaStartup.sh" > $LOGFILE
    echo `date` >> $LOGFILE
    
    #### GET THE INTERNAL IP
    META=http://169.254.169.254/latest/meta-data
    HOSTNAME=`/usr/bin/curl -s $META/hostname | /bin/sed 's+\..*++g'`
    echo "hostname: " $HOSTNAME 2>> $LOGFILE 1>> $LOGFILE
    
    #### SET HOSTNAME
    hostname $HOSTNAME  2>> $LOGFILE 1>> $LOGFILE
    echo $HOSTNAME > /etc/hostname
    
    #IPV4=`/usr/bin/curl -s $META/public-ipv4`
    ### DNS API ...


chmod 755 /agua/0.6/bin/scripts/aguaStartup.sh

ec2-stop-instances $head
    INSTANCE	i-3ba8c35a	running	stopping
ec2-start-instances $head
    INSTANCE	i-3ba8c35a	stopped	pending    


TEST:

cat /tmp/aguaStartup.log 
    Doing aguaStartup.sh
    Wed Aug 31 06:07:33 UTC 2011
    hostname:  domU-12-31-38-04-94-73
    root@domU-12-31-38-04-94-73:~# hostname
    domU-12-31-38-04-94-73

cat /agua/0.6/bin/scripts/aguaStartup.sh



</entry>
<entry [Tue 2011:08:30 10:17:20 EST] SET UP REVERSE DNS ON www.aguadev.org FROM ELASTIC IP>

SUMMARY: THIS IS USEFUL FOR A FIXED PUBLIC IP BUT NOT FOR TRANSPORT INSIDE EC2 BECAUSE ITS CHARGED AND THE TRANSFER IS SLOWER

SEE PING TESTS REPORT:
http://www.cloudiquity.com/2009/02/using-amazon-ec2-public-ip-address-inside-ec2-network/

EC2 WIKIPEDIA
http://en.wikipedia.org/wiki/Amazon_Elastic_Compute_Cloud

1. SET UP ELASTIC IP

CURRENT IPs OF HEADNODE:

EXTERNAL
ec2-107-20-70-58.compute-1.amazonaws.com
107.20.70.58

INTERNAL
ip-10-86-255-99.ec2.internal
10.86.255.99



CREATE A NEW ELASTIC IP:

ec2-allocate-address
    ADDRESS	107.20.183.34  
  
ec2-describe-addresses
    ADDRESS	107.20.183.34


ASSOCIATE ELASTIC IP WITH INSTANCE:

ec2-associate-address -i i-3ba8c35a  107.20.183.34
    ADDRESS	107.20.183.34	i-3ba8c35a

ec2-describe-addresses
    ADDRESS	107.20.183.34	i-3ba8c35a

TAKES A COUPLE OF MINUTES TO PROPAGATE, THEN:

ec2din $head
    RESERVATION	r-e171f88e	728213020069	default
    INSTANCE	i-3ba8c35a	ami-76837d1f	ec2-107-20-183-34.compute-1.amazonaws.com	ip-10-86-255-99.ec2.internal	running	aquarius2	0		m1.large	2011-08-30T01:23:11+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	107.20.183.34	10.86.255.99			ebs					paravirtual
    
    
    
    
    BLOCKDEVICE	/dev/sda1	vol-dafa05b0	2011-08-30T01:23:44.000Z	
    BLOCKDEVICE	/dev/sdi	vol-d8fa05b2	2011-08-30T01:23:44.000Z	
    BLOCKDEVICE	/dev/sdh	vol-622bd108	2011-08-30T01:23:44.000Z	
    TAG	instance	i-3ba8c35a	name	aquarius-8g-LARGE
    TAG	instance	i-3ba8c35a	description	aquarius-8f2 using aquarius2 WITH LARGE INSTANCE to run cluster versions of pipelines (MAQ, BOWTIE, NOVOALIGN)



LATER: REMOVE ELASTIC IP

ec2-disassociate-address 107.20.183.34
ec2-release-address 107.20.183.34


NOTES
-----

http://aws.amazon.com/articles/1346

http://aws.amazon.com/ec2/faqs/#Why_am_I_charged_when_my_Elastic_IP_address_is_not_associated_with_an_instance

Associating an Elastic IP Address with a Different Running Instance 
You might want to remap the Elastic IP to another instance. 
In this example the account has two instances running i-b2e019da and i-b2e019db. The following example remaps Elastic IP Address 75.101.157.145 from the current instance ID i-b2e019da (completed above) to instance ID i-b2e019db.

ec2-describe-addresses
  ADDRESS 75.101.157.145   i-b2e019da
  
ec2-associate-address -i i-b2e019db  75.101.157.145
  ADDRESS 75.101.157.145   i-b2e019db


Once the system updates have completed, network traffic sent to the Elastic IP 75.101.157.145 will be 1:1 NAT'd and sent to the internal IP of the instance i-b2e019db. 

The instance i-b2e019da no longer has a Public IP Address because the Elastic IP was removed to remap it to another instance. This means that the instance is no longer reachable from the internet. However, the instance is still reachable from within the cloud via the Private IP Address. 

ec2-describe-instances
  RESERVATION      r-ae33c2c7      924417782495    default
  INSTANCE         i-b2e019da      ami-2bb65342    << BLANK >>    ip-10-251-71-165.ec2.internal   running gsg-keypair     0               m1.small        2008-03-03T23:09:09+0000       us-east-1a
  INSTANCE         i-b2e019db      ami-2bb65342    ec2-75-101-157-145.compute-1.amazonaws.com  ip-10-251-47-36.ec2.internal    running  gsg-keypair     1               m1.small        2008-03-03T23:09:09+0000       us-east-1a


In the background, a process is running that will re-configure another Public IP address for the instance. This process can take a few minutes and, when complete, the ec2-describe-instances returns the updated information and the instance will again be reachable from the internet on this newly assigned Public IP.

ec2-describe-instances
  RESERVATION      r-ae33c2c7      924417782495    default
  INSTANCE         i-b2e019da      ami-2bb65342    ec2-67-202-46-87.compute-1.amazonaws.com    ip-10-251-71-165.ec2.internal   running  gsg-keypair     0               m1.small        2008-03-03T23:09:09+0000       us-east-1a
  INSTANCE         i-b2e019db      ami-2bb65342    ec2-75-101-157-145.compute-1.amazonaws.com  ip-10-251-47-36.ec2.internal    running  gsg-keypair     1               m1.small        2008-03-03T23:09:09+0000       us-east-1a

  
Note: There is no guarantee that an instance will be configured with its original Public IP address that existed prior to being mapped. In fact, it is highly likely that you will receive a totally different Public IP address.

Terminating running Instance Having an Associated Elastic IP 
Calling ec2-terminate-instance first disassociates the Elastic IP from the instance and then completes the termination process. Upon completion of this call, the Elastic IP will be in an unmapped state and, if not associated to another instance, will be charged for each full hour not mapped to a running instance.

Disassociating an Elastic IP Address from Running Instance 
To remove the current mapping of the Elastic IP, use the ec2-disassociate-address command.
This example shows the current mapping, removes the mapping, and then confirms the mapping was removed.
ec2-describe-addresses

  ADDRESS 75.101.157.145   i-b2e019db

ec2-disassociate-address 75.101.157.145
  ADDRESS 75.101.157.145
  
ec2-describe-addresses
  ADDRESS 75.101.157.145
  
Upon completion of this call the Elastic IP will be in an unmapped state. Elastic IP addresses will accrue a charge for each full hour the address is not attached/mapped to an instance.

Releasing an Elastic IP Addresses from Account

RELEASE AN Elastic IP FROM AN ACCOUNT

ec2-release-address 75.101.157.145
  ADDRESS 75.101.157.145

ec2-describe-addresses

If the ec2-release-address command is called while an Elastic IP is mapped to an instance, the system first removes the current mapping to an instance ID, and then removes the Elastic IP from the account. After releasing an Elastic IP address, you cannot get it back.







3. FILL IN FORM FOR REVERSE DNS

https://aws-portal.amazon.com/gp/aws/html-forms-controller/contactus/ec2-email-limit-rdns-request
    
</entry>
<entry [Tue 2011:08:30 06:32:25 EST] TOSHIBA IP ADDRESS: c-76-110-77-97.hs...>

CONNECTION FROM TOSHIBA TO HEADNODE:

tcp        0      0 ip-10-86-255-99.ec2:ssh c-76-110-77-97.hs:54464 ESTABLISHED
tcp        0      0 ip-10-86-255-99.ec2:ssh c-76-110-77-97.hs:41123 ESTABLISHED
tcp      128      0 ip-10-86-255-99.ec2:ssh c-76-110-77-97.hs:40412 ESTABLISHED
tcp        0      0 ip-10-86-255-99.ec2:ssh c-76-110-77-97.hs:48070 ESTABLISHED
tcp        0      0 ip-10-86-255-99.ec2:ssh c-76-110-77-97.hs:55624 ESTABLISHED
tcp        0      0 ip-10-86-255-99.ec2:ssh c-76-110-77-97.hs:55625 ESTABLISHED
tcp      128      0 ip-10-86-255-99.ec2:ssh c-76-110-77-97.hs:40413 ESTABLISHED

        
</entry>
<entry [Tue 2011:08:30 06:25:55 EST] CAN'T SSH TO HEADNODE>

SUMMARY: REBOOT SOLVES IT

PROBLEM: headnode COMMAND WAS WORKING JUST BEFORE BUT NOW CAN'T SSH INTO HEADNODE

DIAGNOSIS:

VERBOSE SSH SHOWS AUTHENTICATION WAS SUCCESSFUL BUT 'no-more-sessions' APPEARS:

ssh -i /home/syoung/22-agua/cloud/AWS/keypair/syoung/aquarius2/id_rsa root@ec2-107-20-70-58.compute-1.amazonaws.com -v
    
    ...
    debug1: Next authentication method: publickey
    debug1: Offering RSA public key: /home/syoung/22-agua/cloud/AWS/keypair/syoung/aquarius2/id_rsa
    debug1: Server accepts key: pkalg ssh-rsa blen 279
    debug1: read PEM private key done: type RSA
    debug1: Authentication succeeded (publickey).
    Authenticated to ec2-107-20-70-58.compute-1.amazonaws.com ([107.20.70.58]:22).
    debug1: channel 0: new [client-session]
    debug1: Requesting no-more-sessions@openssh.com
    debug1: Entering interactive session.


SEARCHED:

* Added a no-more-sessions@openssh.com global request extension that is
   sent from ssh(1) to sshd(8) when the client knows that it will never
   request another session (i.e. when session multiplexing is disabled). 
   This allows a server to disallow further session requests and
   terminate the session in cases where the client has been hijacked.


SOLUTION:

REBOOTED AND WORKED FINE


</entry>
<entry [Sat 2011:08:27 02:08:42 EST] CREATED MYSQL ami TABLE AND Admin Ami PANEL>

CREATE TABLE IF NOT EXISTS ami
(
    username        VARCHAR(30) NOT NULL,
    amiid           VARCHAR(20),
    aminame         VARCHAR(30) NOT NULL,
    amitype         VARCHAR(20),
    description     TEXT,
    datetime        DATETIME NOT NULL,
    
    PRIMARY KEY (username, amiid)
);
insert into ami values ('admin','ami-ca847aa3', 'starcluster-u10.04-hadoop.2', 'EBS', 'Ubuntu 10.04 StarCluster exec node image with Hadoop installed', NOW());

    
</entry>
<entry [Fri 2011:08:26 04:26:45 EST] AGUA MAILING LIST OPTIONS - CSS STYLE>

Options --> Application --> Change appearance --> Paste in CSS

THE CSS IS SAVED IN notes/apps/confluence/css/mailinglist.css

    
</entry>
<entry [Thu 2011:08:25 06:15:53 EST] CREATED aquarius3 KEYPAIR IN EC2 CONSOLE>

NOTE: NO PUBLIC CERT WAS PRODUCED

FINGERPRINT:

aquarius3  60:22:af:66:fe:7a:f9:21:85:15:92:27:1e:58:0e:1c:fb:8e:cb:eb

DOWNLOADED KEY FILE TO:

/home/syoung/22-agua/cloud/AWS/keypair/syoung/aquarius3/aquarius3.pem

    
    -----BEGIN RSA PRIVATE KEY-----
    MIIEowIBAAKCAQEAoYE8fVWClruAJtDMHl1OYbiist2ARAAL+1uDs8EkHS9jOg3N4s62dLOUqMom
    e1untGpGmyTUWgUruLWt4JB2Pzxf4fo2p54l/DQwva2jUVvqOEn/mQm6hYwLoCbmeDakN3ZqAe6W
    3nFScxdqe68XKtKJoqAZCrfgFddRKsZIw+eVByavz6xg985T8fTpfV+ILlNC5wmiwTGlj+sRWRDI
    gSHO1rFdNdVwo/HebzSY4XAELoKNQ3pN+WtpDQtbsBt+e9jozOBucf5+WFmCHl1etPYIPAbShGsw
    /YikoPQ8TVZTv0agcWybSEVDkE18KF/HAlOxfDCqnkL9gGPU7/6imQIDAQABAoIBABsUnXzykqQN
    qo5XonJQ+Oyf1gAh7fj4/QlXrfy9HP4bzQqV9/jY6nUlC39F7i/vDW7OByrKgSTbCxq8s/wcnQc7
    a2Rr3TA772ibo7SaYfEpdVuc5NPXcsQj2GsxOqHbn6uBGoNaa0e/PrD3sy4sDLlsdhGjwK8wZ82h
    vgVrHBZlANXd1p1TsxfdFQfKrZAht282sGHzy2ZMNSvtv1jD5qVj/lDdiTU0wfiqOEuiNqFYEeXH
    mdwE/+F25DneNgvviF0/9/5v7Fs5hlOAaDxhw1/EDtbdPyywh7J4JJgFpb6S/FN+CQkihheUwzcE
    5uaRFnKLIJPyPxaNPJt8spJ/kyUCgYEA41GYbAQPDfrs6yLk44bmvRI2z2s/6UMrgNHcGV3y5VTs
    v/Xp0ZWk301mHhBAfExqYpjO6CIw3YhhqocC9ItHgmBde05lWzZzl7K7FOl8vb9QPzt+i4hAjtxm
    3CovZ/IPo8Jm165NSQ+N/fsA6hpVwtA50r/9kqxHPNw+EXj8/L8CgYEAteHZXCi+pqdtNhipWXXN
    KI1BzdV5OobcwkRWsNKrSOBXK5r2+XL/CUeJ726qoT1vmWNY8FCsnNs0Dpj8UHM6nr3w23cTFiQi
    AmpKQ6DI31t25kOBoxNgUlcutfyBdn3gg29Fwwz7Ix1Sux3hhvR70S+eSCXf2yW3X/4QJLigvqcC
    gYALf44ZMJ9eUqn3Pt2bELDNMYWqOj+SWf5yVqsucU0fAouzLgo0usALN4wJy0Knxum+sQIOReR4
    4DQofwnMOttUIfG4kf+YfImeS8Egzqqromi5uhWtkyfI0ic1zcB2Ho1h+CxhjoSERJAnH7ItJUXf
    Q88Y9PMrnyE/V9if46HQWwKBgQCMjwBid152/lapAsAFUcN9vkSHZJ0uPMDoJNX2CqiyRiU3nqeU
    uWkc67tOXPDicM8I9DzsYvwysDh3u4TqS1KXEOTNRiVq6/uYcDn6L4xtCItHgg3yT+wVVijUHVKT
    ls3l5R09ko+WYHfqATqkB9aUH7+rtBFek7Q2K+qf5krbawKBgAdLY5+3bUVRDzbV3cF6NaUxTez5
    2mUpAsZK7WbwVG6bwdGL6hvyFTW+S0WRo5TXSO1tQBcWyVPGdSwM5pk79JS9ZWFheJKJGujlBVdr
    V81hj6eQlXOymsaQkhbhAciszDv2IzFwzvmYY69q+Tj9rbkTVX/SC6Qi3SxtbFoQgvv+
    -----END RSA PRIVATE KEY-----


</entry>
<entry [Wed 2011:08:24 05:32:07 EST] GENERATED NEW x509 KEYPAIR TO TEST RunStatus.executeWorkflow WITH microcluster>


PROBLEM: STARCLUSTER FORGETS THE '-c' OPTION-GIVEN CONFIG FILE IN MID-FLOW

SOLUTION:

    1. PATCHED STARCLUSTER SOURCE CODE TO ACCEPT NON-DEFAULT CONFIG FILE

    2. CREATED AMI TABLE AND Admin Ami PANEL (SEE ABOVE).

    3. AUGMENTED aws TABLE TO CONTAIN AMAZON ID, PRIVATE KEY, ETC.

SEE FULL PROCEDURE FOR STEP 3 BELOW.    

NB: MANUALLY UPDATED AMI_ID IN MYSQL:
update cluster set amiid='ami-ca847aa3' where amiid='ami-d1c42db8';


1. GENERATED NEW x509 KEYPAIR USING AWS CONSOLE

SEE
ec2.credentials
[Thu 2011:08:25 10:31:34 EST]
GENERATED NEW x509 KEYPAIR USING AWS CONSOLE>


2. ADD AMAZONUSERID, PRIVATEKEY, ETC. TO aws TABLE

FULL LIST OF INPUTS FOR ADMIN SETTINGS PANEL:

AMAZON_USER_ID
728213020069

AWS_ACCESS_KEY_ID
AKIAIZXZ6S7ARZ44TTHQ

AWS_SECRET_ACCESS_KEY
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

export EC2_CERT
/home/syoung/22-agua/cloud/AWS/keypair/syoung/cert-KTDSDFEV2K3VDW574BC7JK3QOY3EMUZN.pem

-----BEGIN CERTIFICATE-----
MIICdjCCAd+gAwIBAgIFfadFC7owDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMC
VVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMY
QVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTExMDgyNTEwMDEwNVoXDTEyMDgy
NDEwMDEwNVowUjELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAV
BgNVBAsTDkFXUy1EZXZlbG9wZXJzMRUwEwYDVQQDEww3bnd6MHM3c2Npa28wgZ8w
DQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAJn7o8oOUaUgTwI40aoRXrmuKyhZWWZJ
eWcLhnYcmsgC2F4f9zHS9UpRecWh2QrrLXVmu+xduw1dofWxUAT/p/51lGOV5hyr
dtsMoHDQNVIvC6M2ETD+tz5ait3k6Z7A1aWrV86m7ytU55mj7BnijXtpMvI0nXs5
9VVeg4cBw/QFAgMBAAGjVzBVMA4GA1UdDwEB/wQEAwIFoDAWBgNVHSUBAf8EDDAK
BggrBgEFBQcDAjAMBgNVHRMBAf8EAjAAMB0GA1UdDgQWBBSfnvEL4oqKMCGxlSti
ZQ2dJO9DGDANBgkqhkiG9w0BAQUFAAOBgQBaDJBUbtk5CA2hJfE8QPpgBwwc3M+7
cPc0wi5cITImtvWMCDvdf6LcgByFejtAgycR2XA0YczBj2Zd6qzPDWXnFbMA35kU
bs8Jd1e9lG7Tr6YV0q3etpm6+rP77wmKAF3yniv1cJp1WwfpRVsTEliwEnI+IC4z
0626imzblXE8IA==
-----END CERTIFICATE-----


EC2_PRIVATE_KEY
/home/syoung/22-agua/cloud/AWS/keypair/syoung/pk-KTDSDFEV2K3VDW574BC7JK3QOY3EMUZN.pem

-----BEGIN PRIVATE KEY-----
MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAJn7o8oOUaUgTwI40aoRXrmuKyhZ
WWZJeWcLhnYcmsgC2F4f9zHS9UpRecWh2QrrLXVmu+xduw1dofWxUAT/p/51lGOV5hyrdtsMoHDQ
NVIvC6M2ETD+tz5ait3k6Z7A1aWrV86m7ytU55mj7BnijXtpMvI0nXs59VVeg4cBw/QFAgMBAAEC
gYBDAJlLoaFrLbzTZa/txbMnLp8+5modNRlrejtfB6FeKMbHZjdk6busQ/mtwngz5ROZw0NAXaS3
8yc3RplgI3KQeiv9utzn8xSanX/acWsuQOTtGTLlXUuvmUrD40MmnMiL20ChH6zuDZCbT5ucCEGG
M6E0chY/gJYRODxWBkkrgQJBAO4JROSapUmEXko68QuKhBKz+gQgAZM27TnBKYsMINTJb1TZpNpC
aE1bFRy1uNLcs6hFidQ6tSPTTCdjNh7CACUCQQClmoHtP0Sk5wa8iglSaPhSA9CaewO8UlZO3TXK
pzVepeBklR+SZSCDOHLAZ/+yZUB3onmlVS1Z/qZm01gNym5hAkEAlIqiPEoo9RyuPoJTo5EX5Bf9
4A8dDIINPapFw2iZIFBnsjpzPmSMdCFvpk/ce3GQh2SFozPTj/yunDG0NzN3JQJBAJxTKvzzMXBc
6X4G69/QWUDKexuorhESxIhzxziC+R1chmNMZd5C+hsEqUY5piUX8XA9fol0y3fdq+T68m8qPWEC
QQDshvJAArMe1CUpJZFqovE/iN1P+9OzavTYStK8F8AVYnZR/KAV5M5rDE3gXBKq2WxUXjT0vdIN
ukFcKuTSGIpO
-----END PRIVATE KEY-----



3. RUN init.pl TO  PRINT FILES:

/nethome/admin/.starcluster/private.pem
/nethome/admin/.starcluster/public.pem
/nethome/admin/.starcluster/id_rsa-admin-key
/nethome/admin/.starcluster/default.config


echo '{"username":"agua","mode":"init","data":{"username":"admin","amazonuserid":"728213020069","datavolume":"snap-55fe4a3f","uservolume":" New volume","datavolumesize":100,"uservolumesize":100,"datavolumecheckbox":0,"uservolumecheckbox":0,"ec2publiccert":"-----BEGIN CERTIFICATE-----\nMIICdjCCAd+gAwIBAgIFfadFC7owDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMC\nVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMY\nQVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTExMDgyNTEwMDEwNVoXDTEyMDgy\nNDEwMDEwNVowUjELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAV\nBgNVBAsTDkFXUy1EZXZlbG9wZXJzMRUwEwYDVQQDEww3bnd6MHM3c2Npa28wgZ8w\nDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAJn7o8oOUaUgTwI40aoRXrmuKyhZWWZJ\neWcLhnYcmsgC2F4f9zHS9UpRecWh2QrrLXVmu+xduw1dofWxUAT/p/51lGOV5hyr\ndtsMoHDQNVIvC6M2ETD+tz5ait3k6Z7A1aWrV86m7ytU55mj7BnijXtpMvI0nXs5\n9VVeg4cBw/QFAgMBAAGjVzBVMA4GA1UdDwEB/wQEAwIFoDAWBgNVHSUBAf8EDDAK\nBggrBgEFBQcDAjAMBgNVHRMBAf8EAjAAMB0GA1UdDgQWBBSfnvEL4oqKMCGxlSti\nZQ2dJO9DGDANBgkqhkiG9w0BAQUFAAOBgQBaDJBUbtk5CA2hJfE8QPpgBwwc3M+7\ncPc0wi5cITImtvWMCDvdf6LcgByFejtAgycR2XA0YczBj2Zd6qzPDWXnFbMA35kU\nbs8Jd1e9lG7Tr6YV0q3etpm6+rP77wmKAF3yniv1cJp1WwfpRVsTEliwEnI+IC4z\n0626imzblXE8IA==\n-----END CERTIFICATE-----","ec2privatekey":"-----BEGIN PRIVATE KEY-----\nMIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAJn7o8oOUaUgTwI40aoRXrmuKyhZ\nWWZJeWcLhnYcmsgC2F4f9zHS9UpRecWh2QrrLXVmu+xduw1dofWxUAT/p/51lGOV5hyrdtsMoHDQ\nNVIvC6M2ETD+tz5ait3k6Z7A1aWrV86m7ytU55mj7BnijXtpMvI0nXs59VVeg4cBw/QFAgMBAAEC\ngYBDAJlLoaFrLbzTZa/txbMnLp8+5modNRlrejtfB6FeKMbHZjdk6busQ/mtwngz5ROZw0NAXaS3\n8yc3RplgI3KQeiv9utzn8xSanX/acWsuQOTtGTLlXUuvmUrD40MmnMiL20ChH6zuDZCbT5ucCEGG\nM6E0chY/gJYRODxWBkkrgQJBAO4JROSapUmEXko68QuKhBKz+gQgAZM27TnBKYsMINTJb1TZpNpC\naE1bFRy1uNLcs6hFidQ6tSPTTCdjNh7CACUCQQClmoHtP0Sk5wa8iglSaPhSA9CaewO8UlZO3TXK\npzVepeBklR+SZSCDOHLAZ/+yZUB3onmlVS1Z/qZm01gNym5hAkEAlIqiPEoo9RyuPoJTo5EX5Bf9\n4A8dDIINPapFw2iZIFBnsjpzPmSMdCFvpk/ce3GQh2SFozPTj/yunDG0NzN3JQJBAJxTKvzzMXBc\n6X4G69/QWUDKexuorhESxIhzxziC+R1chmNMZd5C+hsEqUY5piUX8XA9fol0y3fdq+T68m8qPWEC\nQQDshvJAArMe1CUpJZFqovE/iN1P+9OzavTYStK8F8AVYnZR/KAV5M5rDE3gXBKq2WxUXjT0vdIN\nukFcKuTSGIpO\n-----END PRIVATE KEY-----","awsaccesskeyid":"AKIAIZXZ6S7ARZ44TTHQ","secretaccesskey":"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"}}' | ./init.cgi


WHICH CREATES THIS KEYPAIR FILE:

cat /nethome/admin/.starcluster/id_rsa-admin-key
    KEYPAIR	id_rsa-admin-key	5d:d3:1f:ee:0d:8d:bf:11:35:36:3b:db:79:d6:4c:1d:89:c2:da:01
    -----BEGIN RSA PRIVATE KEY-----
    MIIEpAIBAAKCAQEAtEYOYQxEC7dWEVbPlkaR43UBVIo2pDeKjKWTUCOdnLfJrJn6GnbtM4SEirpU
    I7vcmfiUswjlZ4nV1CiZqzkNeD6+L3YRRnjPn2veiFSMOMlpDQuHvXK1KZVklYgBIwUtV5BH45Ae
    IlxRoS0ixs6WG778NDZ99/Wkx8qQr+D1GM7MLmO+2Cy/5inwcmGPpqC7wH7mYHfd9bFjBnM1ZgEW
    R8wG451I3FbZrS8qWG7mlV8lTVbtre9axoqL5RnI0pPbEKzCO9Miw/dsvmsVj2E24VlPdNng5Vyb
    XuSXle6G8R+UwKH9WAyH0B2A2CTFlNVNDiEkzHiXB7k6SYxVKbZS7wIDAQABAoIBAEUB2DlAF8Ag
    YxrqDzaoNupJ/MNe0QHVnPyv2Q9BQvEdzV575qhAxBYHcTElmFXBcPWjmVBbZG1Y7vhyvjgz87sG
    0YibeotubZPKF/o52x9VwhfTRRe5FC4h2MoAsOa18aBmQ46RuWdPzZOUEo7lv8JJPoPCJEBJ0NUF
    7pLU2x2uTpqCBv1z8/h3kQaG+CpXPCguzzrtP1BCMZr1Mj1xcLH3R5ZGlA4XZJIfXz1YCB9rMy7F
    Al4pWYTXgR22fVGnb77NctPkjanJiPXZ/zQWnyjP80TQkKh2lXmsxEdHh/21cf+W771IVy+whQbc
    9rhr/BbVk7AO0TdDilNhIL/YwfECgYEA6gB8Ae/QuvQo878HwDkUMErJB1lYJTaKD/riZd1oTVRA
    EDHW5cejCpc8EpHjQI8bwuwyUw7D5tOn8g4iUKx++Fs5NdG8xy99xEynjzz6kuszAmEE5hXy5ji+
    xfPgv/zvAbPewWzhDCvPwBtITidZaUUwgSJofMokyaoh19p8GFkCgYEAxTiKxRtu+ZVcrftyEcjY
    L4C96HrZH+N0vK408qahw3UKvRMAaqVQ2WhM5hz8JfQbLCczL09C4ryohHWHLcboJSCbUbRaCdar
    csEvjIFDAP3NRruQmDlvYcaUib3vNkMQ5HiatWvWYgnXZNeohQv2cMMDvJ412Jq9NgeEfT0B3IcC
    gYAqPjIky108Es29yvOkQOmjGi0WVYuzFBhycBEk4IZux1HVWpn320VUqR6gH5QN2IfjdW5UTisR
    ZY5BBUoulCVLwnQegiF5N9qVcF0jX5fApBMOT+Npgfbals3hwHgHUKr4/Lau5m/uGY6kmIhCC5p5
    hZMPDN4eAQQJH9yCMiAK6QKBgQCHwLbMnGiUBbrIy3amRUCB2jVebAk+iPuW0LcDe62Hc+4TXZwA
    zJBNRh0AnFz35wI5LzZtTzq0BbZdjuSgnvS2ca5X3DPJ5+kV0WJgba1oZktBb+RE0+wWOnGOKp4Z
    FKrxCQ885+CmlS2dbVDDXAujbKkK0UAxO7oYEa6h4jeAywKBgQCkqiy7MH0WQgb92HHXkbvmY2cw
    Z3FrJfZNo5vcMzIgQ3w/H+R3/tO6W54BA9X/vlsNHYQFrmF4yyKnXjEgzY3sRSzQyM4xclx5LG2Y
    HN7jjTVz1n2l07Vm24VeuvzmerQNrl8eZk82PJdOy0fsEwLT3tL1TBamO6qCbafwU5SAvQ==
    -----END RSA PRIVATE KEY-----
    

... AND COPIES THE PRIVATE KEY AND PUBLIC CERTIFICATE TO THESE FILES:

/nethome/admin/.keypairs/private.pem
/nethome/admin/.keypairs/public.pem


... AND CREATES THIS CONFIG FILE CONTAINING THESE CREDENTIALS WHICH ARE NEEDED LATER FOR DOING Workflow.executeWorkflow():


AWS_USER_ID
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY


cat /nethome/admin/.starcluster/default.config
    
    [global]
    ENABLE_EXPERIMENTAL=True
    
    [cluster]
    CLUSTER_USER=sgeadmin
    KEYNAME=id_rsa-admin-key
    PLUGINS=automount,sge
    
    [aws info]
    AWS_ACCESS_KEY_ID=AKIAIZXZ6S7ARZ44TTHQ
    AWS_SECRET_ACCESS_KEY=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
    AWS_USER_ID=728213020069
    
    [key id_rsa-admin-key]
    KEYNAME=id_rsa-admin-key
    KEY_LOCATION=/nethome/admin/.starcluster/id_rsa-admin-key
    
    [plugin automount]
    head_ip=10.87.13.164
    head_long_ip=ip-10-87-13-164.ec2.internal
    interval=30
    mountdport=32767
    nfsport=2049
    portmapport=111
    setup_class=automount.NfsShares
    
    [plugin sge]
    execdport=36322
    head_ip=10.87.13.164
    head_long_ip=ip-10-87-13-164.ec2.internal
    qmasterport=36321
    root=/opt/sge6
    setup_class=sge.CreateCell
    slots=



4. CREATE CLUSTERS (USING aws TABLE: AMAZONUSERID, SECRETACCESSKEY, ETC.)


echo '{"cluster":"syoung-microcluster","minnodes":"0","maxnodes":"3","instancetype":"t1.micro","amiid":"ami-ca847aa3","availzone":"us-east-1a","description":"Description","username":"syoung","sessionId":"9999999999.9999.999","mode":"newCluster"}' | ./workflow.cgi

echo '{"cluster":"syoung-largecluster","minnodes":"10","maxnodes":"15","instancetype":"t1.micro","amiid":"ami-ca847aa3","availzone":"us-east-1a","description":"Description","username":"syoung","sessionId":"9999999999.9999.999","mode":"newCluster"}' | ./workflow.cgi


echo '{"cluster":"syoung-microcluster","minnodes":"0","maxnodes":"5","instancetype":"t1.micro","amiid":"ami-d1c42db8","availzone":"us-east-1a","description":"Description","username":"syoung","sessionId":"9999999999.9999.999","mode":"addCluster"}' | ./workflow.cgi

    OK

cd /nethome/admin/.starcluster
    -rw-rw-rw- 1 root     root     1004 2011-08-26 14:34 syoung-smallcluster.config
    -rw-rw-rw- 1 root     root     1005 2011-08-26 14:36 syoung-largecluster.config
    -rw-rw-rw- 1 root     root     1008 2011-08-26 14:37 syoung-mediumcluster.config
    -rw-rw-rw- 1 root     root     1000 2011-08-26 14:38 syoung-nanocluster.config
    -rw-rw-rw- 1 root     root     1004 2011-08-26 14:42 syoung-microcluster.config



</entry>
<entry [Wed 2011:08:24 02:35:14 EST] AGUA CONFLUENCE WEBSITE COLOURS>

LIGHTBLUE #7AD3E9

DARKBLUE #036


    
</entry>
<entry [Tue 2011:08:16 06:15:20 EST] CHANGED PERMISSIONS ON /data/sequence/reference TO NON-0WRITE>

cd /data/sequence/reference/human
find ./ -type d -exec chmod 0555 {} \;; find ./ -type f -exec chmod 0444 {} \;


CHANGE IT TO WRITEABLE (www-data ONLY):
find ./ -type d -exec chmod 0755 {} \;; find ./ -type f -exec chmod 0644 {} \;


    
</entry>
<entry [Tue 2011:08:16 00:40:20 EST] ERROR WHEN CLICKING TO COPY WORKFLOW IN Stages.js>

Parameters.setOutputValue Setting parameterRow.value: REFERENCE/maq15/maq
exception in animation handler for: beforeBegin
bootstrap.js (line 616)
[Exception... "Component returned failure code: 0x80004005 (NS_ERROR_FAILURE) [nsIDOMNSHTMLTextAreaElement.selectionStart]" nsresult: "0x80004005 (NS_ERROR_FAILURE)" location: "JS frame :: http://localhost/agua/0.6/builds/012-admin/dojo/admin.js.uncompressed.js :: anonymous :: line 692" data: no]

console.error(e);
fx.js (line 154)
_t.curve is undefined

</entry>
<entry [Sat 2011:08:13 01:52:40 EST] BOWTIE REFERENCE STAGE FAILED WITH STRANGE MESSAGE>

STDOUT FILE SHOWS chr4 AS LAST JOB:

em /nethome/syoung/agua/REFERENCES/bowtie/stdout/2-bowtieIndex.stdout

    Agua::Cluster::Util::listFiles    Agua::Cluster::listFiles(directory, pattern)
    Agua::Cluster::Util::listFiles    directory: /data/sequence/reference/human/hg19/bowtie/chr4
    Agua::Cluster::Util::listFiles    pattern: *.fa
    Agua::Cluster::Util::listFiles    getting files </data/sequence/reference/human/hg19/bowtie/chr4/*.fa
    Agua::Cluster::Util::listFiles    files: /data/sequence/reference/human/hg19/bowtie/chr4/chr4.fa
    command: time /data/apps/bowtie/0.12.2/bowtie-build  /data/sequence/reference/human/hg19/bowtie/chr4/chr4.fa /data/sequence/reference/human/hg19/bowtie/chr4/chr4


THE ERROR MESSAGE:

em /nethome/syoung/agua/REFERENCES/bowtie/stdout/2-bowtieIndex.stderr

181.24user 1.04system 3:58.09elapsed 76%CPU (0avgtext+0avgdata 1008912maxresident)k
229704inputs+216480outputs (0major+233943minor)pagefaults 0swaps
Command terminated by signal 9
69.71user 0.23system 2:14.01elapsed 52%CPU (0avgtext+0avgdata 1208752maxresident)k
272040inputs+69784outputs (8major+150278minor)pagefaults 0swaps
Killed


THE INCOMPLETE OUTPUT:

cd /data/sequence/reference/human/hg19/bowtie/chr4
ll
    -rw-rw-rw-  1 www-data www-data    0 2011-08-13 03:25 chr4.3.ebwt
    -rw-rw-rw-  1 www-data www-data 5.3M 2011-08-13 03:25 chr4.4.ebwt
    lrwxrwxrwx  1 www-data www-data   49 2011-08-10 09:23 chr4.fa -> /data/sequence/reference/human/hg19/fasta/chr4.fa


CHECKED IN /var/log/kern.log

    
    Aug 13 08:26:34 domU-12-31-38-07-1A-E1 kernel: [26444.360674] Total swap = 0kB
    Aug 13 08:26:34 domU-12-31-38-07-1A-E1 kernel: [26444.453074] 1968128 pages RAM
    Aug 13 08:26:34 domU-12-31-38-07-1A-E1 kernel: [26444.453077] 61087 pages reserved
    Aug 13 08:26:34 domU-12-31-38-07-1A-E1 kernel: [26444.453078] 1315 pages shared
    Aug 13 08:26:34 domU-12-31-38-07-1A-E1 kernel: [26444.453079] 1894530 pages non-shared
    Aug 13 08:26:34 domU-12-31-38-07-1A-E1 kernel: [26444.453082] Out of memory: kill process 6172 (emacs) score 59865 or a child
    Aug 13 08:26:34 domU-12-31-38-07-1A-E1 kernel: [26444.453103] Killed process 6172 (emacs)

  
    
</entry>
<entry [Sat 2011:08:13 01:51:42 EST] FIXED EXTRANEOUS MAIL ERROR DUE TO checkBalancers.pl CRON JOB>

Aug 13 05:50:01 domU-12-31-38-07-1A-E1 CRON[6093]: (root) CMD (root    MAILTO=""; /agua/0.6/bin/scripts/checkBalancers.pl > /tmp/loadbalancers.out)
Aug 13 05:50:01 domU-12-31-38-07-1A-E1 postfix/sendmail[6094]: fatal: open /etc/postfix/main.cf: No such file or directory

    
</entry>
<entry [Fri 2011:08:12 11:10:25 EST] FIXED JBROWSE PROBLEM>

[bam_parse_region] fail to determine the sequence name.
[bam_parse_region] fail to determine the sequence name.
[bam_parse_region] fail to determine the sequence name.
[bam_parse_region] fail to determine the sequence name.


CHANGE chr22.fa TO chr22 USING Agua::Cluster::Convert::removeFa

export SGE_ROOT=/opt/sge6; export SGE_CELL=; export USERNAME=syoung; export QUEUE=syoung-ELAND-alignment; export PROJECT=ELAND; export WORKFLOW=alignment; perl /agua/0.6/bin/apps/aligners/ELAND.pl --clean --inputfile /nethome/syoung/agua/ELAND/alignment/inputs/yoruba1-1.reads_1.100K.sequence.eland-1.txt --inputtype fastq --label eland-1 --matefile /nethome/syoung/agua/ELAND/alignment/inputs/yoruba1-1.reads_2.100K.sequence.eland-1.txt --outputdir /nethome/syoung/agua/ELAND/alignment/aligned --reads 10000 --referencedir /nethome/syoung/agua/ELAND/alignment --species human


export SGE_ROOT=/opt/sge6; export SGE_CELL=; export USERNAME=syoung; export QUEUE=syoung-ELAND-alignment; export PROJECT=ELAND; export WORKFLOW=alignment; /usr/bin/perl /agua/0.6/bin/apps/jbrowse/jbrowseFeatures.pl --build hg19 --filename hit.bam --filetype bam --inputdir /nethome/syoung/agua/ELAND/alignment/aligned --key eland-1 --label eland-1 --species human 



    
</entry>
<entry [Fri 2011:08:12 06:14:16 EST] RSYNC COPY WITH --copy-unsafe-links TO SKIP users AND species DIRS IN JBROWSE>
http://ss64.com/bash/rsync.html


sudo rsync -av --safe-links /agua/0.6/* /media/LaCie/u10.10/syoung/0.6

(THIS DOES NOT COPY /data/jbrowse/species AND /network/users IN plugins/view/jbrowse)


TEST 
rsync -av --safe-links /agua/0.6/html/plugins/view/jbrowse/ /tmp/jbrowse6
    OK


NB: THIS COPIES ALL species AND users FILES
sudo rsync -av --copy-unsafe-links /agua/0.6/* /media/LaCie/u10.10/syoung/0.6



</entry>
<entry [Thu 2011:08:11 00:49:00 EST] INSTALLED Stardust COMET SERVER>


1. INSTALLED STARDUST 
sudo cpan Stardust
    OK


2. RAN DEMO

stardust.pl
curl -d 'm={ "type": "TestMessage", "data": [3, 2, 1] }' \
  http://localhost:5742/comet/channel/foo

STARDUST IS RUNNING THE COMET SERVER ON PORT 5742



3. CREATED HTML PAGE: /agua/0.6/html/tests/comet/comet1.html


NB: RUN WITH :PORT/comet URL:

Running the COMET server on port 5555:

  $ stardust.pl --port=5555 --base=/comet
Making pages subscribe to channel 'foo':


Posting JSON messages to channel 'foo':

  curl -d 'm={ "type": "TestMessage", "data": [3, 2, 1] }' \
    http://localhost:5555/comet/channel/foo


LOS ANGELES PERL MONGERS TALK
-----------------------------

TITLE::Stardust COMET Server
Stardust
COMET
Server
----
HEADER::Goals
Lightweight
----
Easy to use
----
Useful to non-Perl users
----
HEADER::Concepts
Concepts
FOOTER::A few things you should understand.
----
Messages
----
Channels
----
Long Polling
----
HEADERHTTP API
[[PREGET  /
GET  /channel
GET  /channel/names
POST /channel/names
GET* /channel/names/stream/client_idPRE]]
FOOTER
----
[[PREGET /

PRE]]
This returns info about the server 
as a JSON-encoded object.
----
[[PREGET /channel

PRE]]
This returns a list of all 
the channel names in use 
as a JSON-encoded array.
----
[[PREGET /channel/names

PRE]]
This returns info 
about the specified channels
as an JSON-encoded array of objects.
----
[[PREPOST /channel/names

PRE]]
This sends messages
to the specified channels.
----
[[PREGET /channel/names/stream/client_id

PRE]]
Long polling on this URL will
let you get messages from the
specified channels as they become
available
----


Configuration

server {
  listen 80;
  server_name stardust.com.et;
  location / {
    root   /thttpd/stardust.com.et;
    index  index.html index.htm;
  }



ngingx static
----
[[PRE:upstream stardust_com_et {
  server 127.0.0.1:5742;
}

server {
  listen 80;
  server_name stardust.com.et;
  location / {
    root   /thttpd/stardust.com.et;
    index  index.html index.htm;
  }
  location /comet {
    proxy_pass http://stardust_com_et;
  }
}
ngingx static + stardust
----

APACHE2 CONFIGURATION:
    
<!--
<VirtualHost *:80>             
                                 
    ServerName stardust.com.et
    DocumentRoot /www/stardust.com.et
    CustomLog logs/stardust.com.et-access_log combined
    ErrorLog  logs/stardust.com.et-error_log

    <Directory "/www/stardust.com.et">         
      Options Indexes FollowSymLinks  
      AllowOverride All
      Order allow,deny
      Allow from all.preformatted-text.block
    </Directory>

    ProxyRequests Off
    ProxyPass        /comet http://127.0.0.1:5742/comet
    ProxyPassReverse /comet http://127.0.0.1:5742/comet

  </VirtualHost>

-->


</entry>
<entry [Wed 2011:08:10 06:14:00 EST] INSTALLED XML::Simple AND MooseX::UndefTolerant ON aquarius-8f2>

XML::Simple REQUIRED FOR:
/data/apps/casava/1.6.0/bin/ELAND_standalone.pl

MooseX::UndefTolerant REQUIRED FOR:
Aligner::ELAND
Aligner::BOWTIE
Aligner::MAQ


</entry>
<entry [Tue 2011:08:09 08:06:57 EST] ADDED apps/scripts/dumpDb.pl TO DUMP AGUA DATABASE>
    
/agua/0.6/bin/scripts/dumpDb.pl \
--db agua \
--outputdir /agua/0.6/bin/sql/dump


</entry>
<entry [Mon 2011:08:08 07:38:00 EST] ARCHIVED AGUA 0.6>

Installing Stardust:

  $ sudo cpan Stardust
Running the COMET server on port 5555:

  $ stardust.pl --port=5555 --base=/comet
Making pages subscribe to channel 'foo':

  <script>
    var uniqueId = Math.random().toString();
    $.ev.loop('/comet/channel/foo/'+uniqueId, {
      "*": function(ev) {
      }
    });
  </script>
Posting JSON messages to channel 'foo':

  curl -d 'm={ "type": "TestMessage", "data": [3, 2, 1] }' \
    http://localhost:5555/comet/channel/foo
/agua/0.6/bin/scripts/archive.pl \
--name agua \
--basedir /agua/0.6 \
--version 0.6 \
--versionfile bin/scripts/resources/VERSION \
--outputdir /home/syoung/VERSIONS
    
    
</entry>
<entry [Mon 2011:08:08 03:19:43 EST] SCROLL WORKFLOW PARAMETERS USING dojox.layout.ScrollPane>

http://localhost/agua/0.6/dojo-1.6.1/dojox/layout/tests/test_ScrollPane.html
    
</entry>
<entry [Fri 2011:08:05 01:36:55 EST] ADD HIGHLIGHTING TO DND SOURCE ON DRAG OVER>

http://www.sitepen.com/blog/2008/06/10/dojo-drag-and-drop-1/

Listening Directly to the Topics

Since I mentioned that you can subscribe to the topics yourself when it makes sense, let’s cook up an example. When you start dragging items around, it’s not completely intuitive where you’re allowed to drop them; you have to keep dragging until the avatar turns green. On top of that, there’s no immediate feedback that your drop was successful. We can create a better experience than that.

function highlightTargets(){
    var props = {
        margin: { start: '0', end: '-5', unit: 'px' },
        borderWidth: { start: '0', end: '5', unit: 'px' }
    };
    var m = dojo.dnd.manager();
    var hasZero = false;
    dojo.forEach(m.nodes, function(node){
        // check the selected item(s) to look for a zero quantity
        // so we know whether we can highlight the cart
        if(m.source.getItem(node.id).data.quantity == 0){
            hasZero = true;
        }
    });
    dojo.style("wishlistPaneNode", "borderColor", "#97e68d");
    dojo.style("cartPaneNode", "borderColor", "#97e68d");
    dojo.anim("wishlistPaneNode", props, 250);
    if(!hasZero){
        dojo.anim("cartPaneNode", props, 250);
        dojo.byId("cartPaneNode").isHighlighted = true;
    }
}
 
function unhighlightTargets(dropTarget){
    var props = {
            margin: { start: '-5', end: '0', unit: 'px' },
            borderWidth: { start: '5', end: '0', unit: 'px' }
    };
    cpn = dojo.byId("cartPaneNode");
    var cartIsHighlighted = cpn.isHighlighted;
    cpn.isHighlighted = false;
    if(dropTarget && dropTarget.node && dropTarget.node.id){
        // dropTarget lets us know which node to highlight yellow
        switch(dropTarget.node.id){
            case "wishlistPaneNode":
                if(cartIsHighlighted){
                    dojo.anim("cartPaneNode", props, 250);
                }
                dojo.style("wishlistPaneNode", "borderColor", "#ffff33");
                dojo.anim("wishlistPaneNode", props, 500, null, null, 750);
                break;
            case "cartPaneNode":
                dojo.anim("wishlistPaneNode", props, 250);
                dojo.style("cartPaneNode", "borderColor", "#ffff33");
                dojo.anim("cartPaneNode", props, 500, null, null, 750);
                break;
            default:
                dojo.anim("wishlistPaneNode", props, 250);
                if(cartIsHighlighted){
                    dojo.anim("cartPaneNode", props, 250);
                }
        }
    }else{
        dojo.anim("wishlistPaneNode", props, 250);
        if(cartIsHighlighted){
            dojo.anim("cartPaneNode", props, 250);
        }
    }
}




Then, in our initialization function:

var resetSelections = function(){
    cart.selectNone();
    wishlist.selectNone();
    junkCatalog.selectNone();
    foodCatalog.selectNone();
};
 
// highlight valid drop targets when a drag operation starts;
dojo.subscribe("/dnd/start", null, highlightTargets);
dojo.subscribe("/dnd/cancel", null, unhighlightTargets);
 
dojo.subscribe("/dnd/drop", function(){
    resetSelections();
    unhighlightTargets(dojo.dnd.manager().target);
});


Since we’re listening to the topic broadcast itself, we know these will only run once per event. Manipulating a bit of CSS with dojo.anim() helps make the drag and drop system a bit friendlier here, and that’s always a good thing.


</entry>
