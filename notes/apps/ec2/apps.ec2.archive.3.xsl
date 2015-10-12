apps.ec2.archive.3


<entry [Sun Feb  6 20:57:02 EST 2011] AQUARIUS-7 BASH PROFILE>

cat ~/.bash_profile
# .bash_profile
# User specific aliases and functions
#

#### STARCLUSTER
alias sc='starcluster -c /nethome/admin/.starcluster/config sshmaster smallcluster'

#### AGUA
PATH=/agua/bin/apps/logic:$PATH
alias flow='/agua/bin/apps/logic/workflow.pl'

### SGE
export SGE_EXECD_PORT=63232;
export SGE_QMASTER_PORT=63231
export SGE_ROOT=/opt/sge6
export PATH=/opt/sge6/bin/lx24-amd64:$PATH

#### ec2
export PATH=/home/ec2/bin:$PATH
export EC2_HOME=/home/ec2
export JAVA_HOME=/usr
export EC2_PRIVATE_KEY=/agua/home/admin/.keypairs/private.pem
export EC2_CERT=/agua/home/admin/.keypairs/public.pem
alias listec2='ls $EC2_HOME/bin/ec2-* | grep -v cmd'

# DATE
alias DATE='date'

# FIX DOS LINE ENDINGS
alias fle="perl -pi -e 's/\r//g' "
alias fle2="perl -pi -e 's/\r/\n/g' "

# turn on color file listing
export CLICOLOR=1

# ALIASES
alias perlenv="perl -e 'foreach my $key(sort keys(%ENV)){print qq|$key = $ENV{$key}\n|;}'"
alias pl='perl Makefile.PL'
alias tx='tar xvfz'
alias mk='make; make install'
alias perl='/usr/bin/perl'
alias q='qstat'
alias sqlite='sqlite3'
alias mod='chmod 755 *'
alias now='date "+DATE: %m/%d/%y%nTIME: %H:%M:%S"'
alias psg='ps aux | grep'
alias llhg='ls -alh | grep'
alias llg='ls -al | grep'
alias lg='ls | grep'
alias xpl='chmod 755 *.pl *.cgi *.t'
alias mq='mysql -u root -p'

alias em='emacs -nw'
alias me='emacs -nw'
alias gobash='emacs -nw ~/.bash_profile'
alias sobash='source ~/.bash_profile'
alias er='tail -f -n 100 /var/log/httpd/error_log'
alias myer='tail -100 /var/log/mysqld.log'
alias html='cd /var/www/html'
alias cgi='cd /var/www/cgi-bin'
alias cl='clear; ls; pwd'
alias apps='cd ~/base/apps'
alias updb='updatedb'

alias l='ls'
alias df='df -ah'
alias rm='rm -i'
alias mv='mv -i'
alias LL='ls -alh'
alias ll='ls -alh'
# -l = list view
# -a = all views, even hidden
# -h = human-readable sizes, e.g. 900B, 15K, 1.2MB

# keeps pico from line wrapping
alias pico="/usr/bin/pico -w"


# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

</entry>
<entry [Fri Jan 14 12:46:55 EST 2011] START AQUARIUS-7 AS GPADEMCI FROM LINODE WITH 200 GB VOLUME>

ON LINODE:

keygp

ec2-run-instances \
--key aquarius \
ami-90af5ef9 \
--instance-type t1.micro \
-z us-east-1a


ec2-75-101-214-196.compute-1.amazonaws.com

RESERVATION     r-5d707637      503401961460    default
INSTANCE        i-b54b81d9      ami-90af5ef9    ec2-50-16-99-91.compute-1.amazonaws.com ip-10-117-62-132.ec2.internal  running aquarius        0               t1.micro        2011-01-14T17:36:37+0000        us-east-1a    aki-b51cf9dc     ari-b31cf9da            monitoring-disabled     50.16.99.91     10.117.62.132                 ebs                                      paravirtual
BLOCKDEVICE     /dev/sda1       vol-ce1ea1a6    2011-01-14T17:36:48.000Z

CONNECT:

ec2-50-16-99-91.compute-1.amazonaws.com


rm -fr /root/base/apps/ec2/keypair/gpademci/keys.sh
emacs /root/base/apps/ec2/keypair/gpademci/keys.sh
export AMAZON ID=503401961460
export AWS_ACCESS_KEY_ID=AKIAILLN2EEVC7TPWX7A
export SECRET_ACCESS_KEY=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
export EC2_CERT=/root/base/apps/ec2/keypair/gpademci/cert-2NFLCRC5BLRGVAS3TRVHQNHIIZTX3KNC.pem
export EC2_PRIVATE_KEY=/root/base/apps/ec2/keypair/gpademci/pk-2NFLCRC5BLRGVAS3TRVHQNHIIZTX3KNC.pem

chmod 755 /root/base/apps/ec2/keypair/gpademci/keys.sh


PUBLIC CERTIFICATE

-----BEGIN CERTIFICATE-----
MIICdzCCAeCgAwIBAgIFfphks2kwDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMC
VVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMY
QVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTEwMTIxNDE5MjIzNloXDTExMTIx
NDE5MjIzNlowUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAV
BgNVBAsTDkFXUy1EZXZlbG9wZXJzMRYwFAYDVQQDEw0xZzh2czBucGg5NmZ0MIGf
MA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC1/Mx1npn/zgJwl5b5I6OnyEUxOAoi
mbaeg42JAJVtxbihspC+HeezthD7bbhMOLHRSGmWFFIcbFmrO95JAjy44kVoTj5B
bzKvgKxc7SREzrMYaF5X8an8GxIOFGFGCTflKSzjawJbRJEoXKDGhOoGespovsEQ
x874MX0rMPaSFwIDAQABo1cwVTAOBgNVHQ8BAf8EBAMCBaAwFgYDVR0lAQH/BAww
CgYIKwYBBQUHAwIwDAYDVR0TAQH/BAIwADAdBgNVHQ4EFgQUGu+QOa+NA1DLSvA5
hz1CIP8U3jEwDQYJKoZIhvcNAQEFBQADgYEANgsgw3V2QWD26cDcSdXp0dmlEu9/
Q86Br3J/jux5PrIsoMB+ecGy+yZcpY5EN640YrpzLR6TXLxYlbyXJIgFrpgGGXql
fIuJ4V66XlmDn6qQ2W7kFmAR/nQ+qc/AtaxoFZk/nWz+4FyB3cEB2nHk5VKmv9Bv
DTLx/UFMicX6nTA=
-----END CERTIFICATE-----


PRIVATE KEY

-----BEGIN PRIVATE KEY-----
MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBALX8zHWemf/OAnCXlvkjo6fIRTE4
CiKZtp6DjYkAlW3FuKGykL4d57O2EPttuEw4sdFIaZYUUhxsWas73kkCPLjiRWhOPkFvMq+ArFzt
JETOsxhoXlfxqfwbEg4UYUYJN+UpLONrAltEkShcoMaE6gZ6ymi+wRDHzvgxfSsw9pIXAgMBAAEC
gYAdy7gGAeOg2C/aE1eqjsU6sTVy64PtSlF1/n/r0GamxFqITt4X4nmPGN4K7FniUN38L+jpo4YW
FT9RI8ovFeiu7OWReO3cj0l/+I4V8HfG85uhzuZxebNmFynTsi4Celzbnn74Y5YQOhlwUZQP6iuu
oxjMUiXLf7iYMPY29ePlYQJBAP7Mf/2N3vnyOR+I5nqrbYByxwXIHH1NSF3yLkdbnogAyBGqLP44
iqsQmrf5n7cSSLDRQAbRu7KFOL1sx4sgUp8CQQC22G1u0GopJGw26Gzj/y1mt0oelaaTNsW27F4P
HeDyXg0G1+nZqsF4NDJWPs6qclL6/eWbNOll7VKfSSBRKsWJAkEAjun3NCmaEompPqXT2KREpBI8
zWJjkGiDmaYYDRA3iEMf9MCFwgXGyZJjpaNO0SlhOkPz7J9A7y3IGH9mIQP9MwJBAI5srWlZDKh5
h5WJnHBIb6wH78M9HKClVIL1QRsTUgpYelsvSifT25nvRpppl/+qx7pclUI9h+RuZSJQCs1OvMkC
QQD6FUZpTR67uEPvsEdstJO5+4m2BaUQreGGj5EN/s2CYjcQqC+zALeMmHRXh1qXPQMv4FDw7RPW
ePzcUBc2TCD+
-----END PRIVATE KEY-----


</entry>
<entry [Tue Dec 28 13:27:02 EST 2010] PROGRAMATICALLY GENERATE PUBLIC CERTIFICATE (FOR SSL/HTTPS)>

[
    FROM:
    Sun Nov 14 22:44:10 EST 2010
    NON-INTERACTIVE CERTIFICATE GENERATION FOR AUTOMATED HTTPS
]


ON JGILBERT AQUARIUS-7:

/root/base/apps/https


1. GENERATE PRIVATE KEY

PRIVATE_KEYFILE=/root/base/apps/https/privatekey.pem
PIPEFILE=/root/base/apps/https/pipeline.pem
CERTIFICATE_FILE=/root/base/apps/https/publiccert.pem
CONFIGFILE=/root/base/apps/https/config.txt

cd /root/base/apps/https
openssl genrsa -out privatekey.pem 1024


2. REMOVE PASS-PHRASE FROM KEY:

openssl rsa -in privatekey.pem -out private.pem

    writing RSA key



3. GET DOMAIN NAME

INSTANCE_ID=`curl -s http://169.254.169.254/latest/meta-data/instance-id`
DOMAIN_NAME=`ec2-describe-instances | grep $INSTANCE_ID | cut -f 4`
echo "DOMAIN_NAME: $DOMAIN_NAME"

    DOMAIN_NAME: ec2-75-101-214-196.compute-1.amazonaws.com



4. CREATE CONFIG FILE

cd /root/base/apps/https
emacs config.txt
# SSL server cert/key parms
# Cert extensions
subjectKeyIdentifier    = hash
authorityKeyIdentifier  = keyid:always,issuer:always
basicConstraints        = CA:false
nsCertType              = server
# openssl req
[req]
default_bits            = 1024
prompt                  = no
distinguished_name      = UMCP_SSLS_DN
# DN fields for SSL Server cert
[UMCP_SSLS_DN]
C                       = US
ST                      = Maryland
O                       = UMCP/OIT/TSS/EIS
CN                      = ec2-50-16-90-172.compute-1.amazonaws.com
emailAddress            = trash@traash.com



5. GENERATE CERTIFICATE REQUEST

openssl \
req \
-config /root/base/apps/https/config.txt \
-newkey rsa:1024 \
-key /root/base/apps/https/private.pem \
-out /root/base/apps/https/pipeline.pem


-----BEGIN CERTIFICATE REQUEST-----
MIIB0jCCATsCAQAwgZExCzAJBgNVBAYTAlVTMREwDwYDVQQIEwhNYXJ5bGFuZDEZ
MBcGA1UEChMQVU1DUC9PSVQvVFNTL0VJUzEzMDEGA1UEAxMqZWMyLTc1LTEwMS0y
MTQtMTk2LmNvbXB1dGUtMS5hbWF6b25hd3MuY29tMR8wHQYJKoZIhvcNAQkBFhB0
cmFzaEB0cmFhc2guY29tMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCsrLsV
qiBQSWm40rB/DahxbZBoQVx2GUqhB5AQIxalh0Xbw7J5CHbLHhIeLXlW4uixtGoy
4f3tyb0UCQCVx0QRM5REGXp3ds7gV+svOEn3FbhTVFxHB2nspW/XpKY29mIxldNN
bwjQQvI0cU2WCPM7U6kzbZPuVBjH65AevUNgTQIDAQABoAAwDQYJKoZIhvcNAQEF
BQADgYEANZ7KByo5HkefYQUiE6+qL599UVnxAgl4+6p7dlILNPp3E6Ydkp0KERAX
5Gn3U7K54IaMnIij3ar0LfZmKql6kSBcLl/j8Oi7/g6t8C0kLasYJgJgjl8G4yLy
h3b7vlp2rEPAOt1Sdrre6+7J2ZA31kYjSQa8JLYxWg2DokB5JIg=
-----END CERTIFICATE REQUEST-----


6. GENERATE PUBLIC CERTIFICATE

openssl x509 -req \
-extfile /root/base/apps/https/config.txt \
-days 730 \
-signkey /root/base/apps/https/private.pem \
-in /root/base/apps/https/pipeline.pem \
-out /root/base/apps/https/publiccert.pem

    OK
    
    Signature ok
    subject=/C=US/ST=Maryland/O=UMCP/OIT/TSS/EIS/CN=ec2-75-101-214-196.compute-1.amazonaws.com/emailAddress=trash@traash.com
    Getting Private key

cat publiccert.pem 
-----BEGIN CERTIFICATE-----
MIIDrjCCAxegAwIBAgIJAP5a3fuobD2rMA0GCSqGSIb3DQEBBQUAMIGRMQswCQYD
VQQGEwJVUzERMA8GA1UECBMITWFyeWxhbmQxGTAXBgNVBAoTEFVNQ1AvT0lUL1RT
Uy9FSVMxMzAxBgNVBAMTKmVjMi03NS0xMDEtMjE0LTE5Ni5jb21wdXRlLTEuYW1h
em9uYXdzLmNvbTEfMB0GCSqGSIb3DQEJARYQdHJhc2hAdHJhYXNoLmNvbTAeFw0x
MDEyMjkwNjMwMzZaFw0xMjEyMjgwNjMwMzZaMIGRMQswCQYDVQQGEwJVUzERMA8G
A1UECBMITWFyeWxhbmQxGTAXBgNVBAoTEFVNQ1AvT0lUL1RTUy9FSVMxMzAxBgNV
BAMTKmVjMi03NS0xMDEtMjE0LTE5Ni5jb21wdXRlLTEuYW1hem9uYXdzLmNvbTEf
MB0GCSqGSIb3DQEJARYQdHJhc2hAdHJhYXNoLmNvbTCBnzANBgkqhkiG9w0BAQEF
AAOBjQAwgYkCgYEArKy7FaogUElpuNKwfw2ocW2QaEFcdhlKoQeQECMWpYdF28Oy
eQh2yx4SHi15VuLosbRqMuH97cm9FAkAlcdEETOURBl6d3bO4FfrLzhJ9xW4U1Rc
Rwdp7KVv16SmNvZiMZXTTW8I0ELyNHFNlgjzO1OpM22T7lQYx+uQHr1DYE0CAwEA
AaOCAQowggEGMB0GA1UdDgQWBBQBOdV1XP5ZhawXmJxNs8vOumqMFzCBxgYDVR0j
BIG+MIG7gBQBOdV1XP5ZhawXmJxNs8vOumqMF6GBl6SBlDCBkTELMAkGA1UEBhMC
VVMxETAPBgNVBAgTCE1hcnlsYW5kMRkwFwYDVQQKExBVTUNQL09JVC9UU1MvRUlT
MTMwMQYDVQQDEyplYzItNzUtMTAxLTIxNC0xOTYuY29tcHV0ZS0xLmFtYXpvbmF3
cy5jb20xHzAdBgkqhkiG9w0BCQEWEHRyYXNoQHRyYWFzaC5jb22CCQD+Wt37qGw9
qzAJBgNVHRMEAjAAMBEGCWCGSAGG+EIBAQQEAwIGQDANBgkqhkiG9w0BAQUFAAOB
gQBd2flPWpdJoTTQelgXNQTWaQR6nUDzQ1/I3BjnP75of05m5fHPSGIJLxUIfMlL
/MIgQmU2yeDN/XAk5686Q2FiKrzKO14FasiKWf3GEoYsljrhY70NEBH2WQox9Lsg
kfeJhACdUePBVg01tkAaJUA2LXO5mr7CXiRqQjoWeOV8bw==
-----END CERTIFICATE-----

</entry>

<entry [Fri Dec 24 14:20:21 EST 2010] CREATED AQUARIUS-7 AMI TO TEST AWS.pm AND STARCLUSTER>

AQUARIUS-7 INSTANCE INFO

i-b42f3fd9
ec2-75-101-214-196.compute-1.amazonaws.com
ip-10-127-158-202.ec2.internal


STARCLUSTER COMMANDS
--------------------

START smallcluster
starcluster -c /nethome/admin/.starcluster/config start smallcluster

SHOW CLUSTER NODES:
starcluster -c /nethome/admin/.starcluster/config listclusters     

CONNECT TO MASTER:
starcluster -c /nethome/admin/.starcluster/config sshmaster smallcluster

TRANSFER FILES TO MASTER:
scp ~/.bash_profile root@10.124.245.118:

CONNECT TO NODE 1:
starcluster -c /nethome/admin/.starcluster/config sshnode -u sgeadmin smallcluster node001

STOP starcluster
starcluster -c /nethome/admin/.starcluster/config stop smallcluster
    
    


SUMMARY
-------

1. ADD AQUARIUS-7 LAUNCH PERMISSIONS

2. MOUNT EBS /data VOLUME FROM SNAPSHOT ON STARCLUSTER NODES (AWS.pm)

*** /data       APPLICATIONS AND JBROWSE REFERENCE DATA
    /agua       bin, lib, html, etc. AGUA CORE DIRECTORIES
    /nethome    USER ANALYSIS DATA, MYSQL, config FILES, REFERENCE SEQUENCE DATA

3. NFS MOUNT OF MASTER /data AT /cluster/data ON AQ-7(StarCluster.pm)

4. NFS MOUNT OF AQ-7 /data AND /nethome VOLUMES ON MASTER AND NODES (StarCluster.pm)

5. RUN JOBS ON STARCLUSTER (SGE.pm)
    
    GENERATE KEYPAIR FILE FROM PRIVATE AND PUBLIC KEYS


TO DO: CHECK LOAD LEVELLING FORK (RBANERJEE)



StarCluster.pm

    PURPOSE
    
        1. MOUNT BY DEFAULT /data AND /nethome ON STARCLUSTER NODES
    
        2. CLUSTER SHUTS DOWN WHEN ALL WORKFLOWS ARE COMPLETED
        
        3. ALLOW AQUARIUS USERS TO:
        
            1. RUN JOBS ON small, medium OR large CLUSTERS
                (ALL USERS USE admin USER'S CONFIG FILE)
        
        4. ALL WORKFLOWS USE ONE CLUSTER, SPECIFIED BY admin USER
        
    TO DO

        1. ALLOW USERS TO SPECIFY NUMBER OF NODES, AMIs, ETC.
        
            BY EDITING USER-SPECIFIC CONFIG FILES

            USE Config::INI TO PROCESS AND PRINT starcluster CONFIG FILE:
            http://search.cpan.org/~rjbs/Config-INI-0.017/lib/Config/INI.pm

            USERNAME    CONFIGFILE
            admin       /home/admin/.starcluster/config
            jgilbert    /home/jgilbert/.starcluster/config


        2. ALLOW USER TO SPECIFY A CLUSTER FOR EACH WORKFLOW
    
            (ALL STAGES IN THE SAME WORKFLOW USE THE SAME CLUSTER)
        
        3. USE EXPERIMENTAL AUTO-LEVELLING TO AUTOMATICALLY 

            INCREASE/DECREASE THE NUMBER OF NODES BASED ON
            
            THE NUMBER OF QUEUED JOBS



DETAILS
-------


1. ADD AQUARIUS-7 LAUNCH PERMISSIONS
------------------------------------

AMI ID: ami-90af5ef9
Name: aquarius-728213020069
Description: starcluster enabled with python 2.6.6
Source: 728213020069/aquarius-7
Owner: 728213020069	Visibility: Private	Product Code:
State: available	Kernel ID: aki-b51cf9dc	RAM Disk ID: ari-b31cf9da
Image Type: machine	Architecture: x86_64	Platform: Other Linux
Root Device Type: ebs	Root Device: /dev/sda1	Image Size: 10 GiB
Block Devices: /dev/sda1=snap-e1a8678c:10:true
Virtualization: paravirtual


GUNEY       503401961460
JGILBERT    558277860346
KNYUTEMANS  684733399587

DID IN AWS CONSOLE BUT CAN ALSO DO ON COMMAND LINE:

ec2-modify-image-attribute  ami-90af5ef9 --launch-permission --add 503401961460




2. MOUNT EBS /data VOLUME FROM SNAPSHOT ON STARCLUSTER NODES
------------------------------------------------------------

*** /data       APPLICATIONS AND JBROWSE REFERENCE DATA
    /agua       bin, lib, html, etc. AGUA CORE DIRECTORIES
    /nethome    USER ANALYSIS DATA, MYSQL, config FILES, REFERENCE SEQUENCE DATA

START AQUARIUS-7 AS USER jgilbert FROM LINODE:

keyjg

ec2-run-instances \
--key aquarius \
ami-90af5ef9 \
--instance-type t1.micro \
-z us-east-1a


ec2din

    RESERVATION     r-e30f5d89      558277860346    default
    INSTANCE        i-b42f3fd9      ami-90af5ef9    ec2-75-101-214-196.compute-1.amazonaws.com      ip-10-127-158-202.ec2.internal running aquarius        0               t1.micro        2010-12-24T09:51:37+0000        us-east-1a     aki-b51cf9dc    ari-b31cf9da            monitoring-disabled     75.101.214.196  10.127.158.202        ebs
    BLOCKDEVICE     /dev/sda1       vol-c6e346ae    2010-12-24T09:51:40.000Z
    BLOCKDEVICE     /dev/sdh        vol-266dc84e    2010-12-24T23:03:04.000Z
    BLOCKDEVICE     /dev/sdi        vol-fa6dc892    2010-12-24T23:05:50.000Z


CONNECT

    ssh -i /root/base/apps/ec2/keypair/jgilbert/aquarius_rsa \
    root@ec2-75-101-214-196.compute-1.amazonaws.com



RUN init.cgi SCRIPT FROM init.html

echo '{"username":"agua","mode":"init","data":{"username":"admin","amazonuserid":"558277860346","datavolume":"snap-55fe4a3f","uservolume":" New volume","datavolumesize":40,"uservolumesize":100,"datavolumecheckbox":0,"uservolumecheckbox":0,"ec2publiccert":"-----BEGIN CERTIFICATE-----\nMIICdzCCAeCgAwIBAgIFHoFGKBUwDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMC\nVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMY\nQVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTEwMTExOTE2NDMzNFoXDTExMTEx\nOTE2NDMzNFowUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAV\nBgNVBAsTDkFXUy1EZXZlbG9wZXJzMRYwFAYDVQQDEw0xd2h3enZlN21ueGNhMIGf\nMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCBAssW9lEbOI1zeh5SAoUqncF6ezQ7\nM0ZGfgPfo/bKkmxTZitcDbHlPx8i2RDsrrhjFkBPOY6cJaguUIqZrVi80mAYlkC/\nWatU0OKRMtOQsGPV7MMhMNSYD1wwN48SiDpWnF9WoSIdyXnNmywDTzPVemJWMMbC\nUrB9h+VppPPpEwIDAQABo1cwVTAOBgNVHQ8BAf8EBAMCBaAwFgYDVR0lAQH/BAww\nCgYIKwYBBQUHAwIwDAYDVR0TAQH/BAIwADAdBgNVHQ4EFgQUls+H6G2aw4Di4BAi\nw39F5NjCNZswDQYJKoZIhvcNAQEFBQADgYEAbW0DkQ9+pqJO8bxoKUGgskdkJo9p\nzvF+5qeG/ncPyEYXj0ufrBqcEBfOmIBC0af7N5uFYZ9yvMm4QI7mR9K7Gjfmwa3p\nq1zHVyfNkuAd4XVdX4x4/eYGwGPDDqqqudkI0PEjYqYism14Gy9EA49oP9CWbJzh\nkHqqiHDjsuOAN8E=\n-----END CERTIFICATE-----","ec2privatekey":"-----BEGIN PRIVATE KEY-----\nMIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAIECyxb2URs4jXN6HlIChSqdwXp7\nNDszRkZ+A9+j9sqSbFNmK1wNseU/HyLZEOyuuGMWQE85jpwlqC5QipmtWLzSYBiWQL9Zq1TQ4pEy\n05CwY9XswyEw1JgPXDA3jxKIOlacX1ahIh3Jec2bLANPM9V6YlYwxsJSsH2H5Wmk8+kTAgMBAAEC\ngYA8oGFsQwjOb/8ZO1QwWfrWkhgwROHAyFHIIsQTPuxlOfYqIyNROSZWgxlQuQ1ZDKqd9gD2uieo\nfZHRYgwgN/Qw69GuDUt9HzcNQ5yDPm3Ofa0WcD0tQa9YToHqEWVQaddc8D6DLcOwBDEropf2OIqd\n4JFusmenVBSIETihVKX8cQJBAM3Zs6W4nWtDExw7QlucgiKC0/R5exBk+BGVBAGHHcBTy+WXFryc\nUEJbj6q/PEIdGFxFvcO6GUk8x0JFGBgEB28CQQCgcNVc2Ar3kN3BAeM0xM5SVWlDYjDZwq5KId72\ng6CI/tcfjdpIHNI7yGlMNj4YPKOW2CAZebPLj3C74wclPUadAkEAgOcVju33baaX/fLBz/pGp3PD\nZHD59j8z9FabJpXEtJ4ErWWacEt2GseZRHPyOPhdO9LUTQ9pLCpqIH6B4vAK8wJAa0cnE16N7r1Z\n2Y1Wi9kwkBL2QI0uVtz6xyzgtfqLZC7qTvn9w4wp8rlt1vzKBlC9ncZDqGUdGHaADdGe3IKdbQJA\nTBQ5VR3WM0lx6BrxXtHlxmmTikQ1mTlEdkjL4xJ9iXw7cRIIVdDzAait4TwuoxWxNODHlfMxK4ul\n8zcEE5bSlw==\n-----END PRIVATE KEY-----","accesskeyid":"AKIAJWZIAB2ZZB7FHJIQ","secretaccesskey":"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"}}' | ./init.cgi
    
    OK


generateCACert
--------------

whoami: root
init.cgi    uid: 0
init.cgi    gid: 0
AWS::init    Doing restartHttpd()
AWS::untaint    string: i-b42f3fd9
AWS::untaint    string: ec2-75-101-214-196.compute-1.amazonaws.com

cat /agua/home/admin/.starcluster/config.txt

    # SSL server cert/key parms
    # Cert extensions
    subjectKeyIdentifier    = hash
    authorityKeyIdentifier  = keyid:always,issuer:always
    basicConstraints        = CA:false
    nsCertType              = server
    # openssl req
    [req]
    default_bits            = 1024
    prompt                  = no
    distinguished_name      = agua_admin_DN
    # DN fields for SSL Server cert
    [agua_admin_DN]
    C                       = US
    ST                      = Maryland
    O                       = UMCP/OIT/TSS/EIS
    CN                      = ec2-75-101-214-196.compute-1.amazonaws.com
    emailAddress            = trash@trash.com


Conf::StarCluster::generateCACert    instanceid: i-b42f3fd9
Conf::StarCluster::generateCACert    domainname: ec2-75-101-214-196.compute-1.amazonaws.com
Conf::StarCluster::generateCACert    request:

openssl \
req \
-config /agua/home/admin/.starcluster/config.txt \
-newkey rsa:1024 \
-key /agua/home/admin/.starcluster/privatekey.pem \
-out /agua/home/admin/.starcluster/pipeline.pem

Conf::StarCluster::generateCACert    certify:
openssl \
x509 -req \
-extfile /agua/home/admin/.starcluster/config.txt \
-days 730 \
-signkey /agua/home/admin/.starcluster/privatekey.pem \
-in /agua/home/admin/.starcluster/pipeline.pem \
-out /agua/home/admin/.starcluster/publiccert.pem

Conf::StarCluster::generateCACert    copyprivate:

cp /agua/home/admin/.starcluster/privatekey.pem /usr/local/apache/conf/ssl.key

Conf::StarCluster::generateCACert    copypublic:

cp /agua/home/admin/.starcluster/publiccert.pem /usr/local/apache/conf/ssl.cert



generateKeypair
---------------

INPUT FILES:

cd /nethome/admin/.starcluster
cat privatekey.pem

-----BEGIN RSA PRIVATE KEY-----
MIICXAIBAAKBgQCBAssW9lEbOI1zeh5SAoUqncF6ezQ7M0ZGfgPfo/bKkmxTZitc
DbHlPx8i2RDsrrhjFkBPOY6cJaguUIqZrVi80mAYlkC/WatU0OKRMtOQsGPV7MMh
MNSYD1wwN48SiDpWnF9WoSIdyXnNmywDTzPVemJWMMbCUrB9h+VppPPpEwIDAQAB
AoGAPKBhbEMIzm//GTtUMFn61pIYMEThwMhRyCLEEz7sZTn2KiMjUTkmVoMZULkN
WQyqnfYA9ronqH2R0WIMIDf0MOvRrg1LfR83DUOcgz5tzn2tFnA9LUGvWE6B6hFl
UGnXXPA+gy3DsAQxK6KX9jiKneCRbrJnp1QUiBE4oVSl/HECQQDN2bOluJ1rQxMc
O0JbnIIigtP0eXsQZPgRlQQBhx3AU8vllxa8nFBCW4+qvzxCHRhcRb3DuhlJPMdC
RRgYBAdvAkEAoHDVXNgK95DdwQHjNMTOUlVpQ2Iw2cKuSiHe9oOgiP7XH43aSBzS
O8hpTDY+GDyjltggGXmzy49wu+MHJT1GnQJBAIDnFY7t922ml/3ywc/6Rqdzw2Rw
+fY/M/RWmyaVxLSeBK1lmnBLdhrHmURz8jj4XTvS1E0PaSwqaiB+geLwCvMCQGtH
JxNeje69WdmNVovZMJAS9kCNLlbc+scs4LX6i2Qu6k75/cOMKfK5bdb8ygZQvZ3G
Q6hlHRh2gA3RntyCnW0CQEwUOVUd1jNJcega8V7R5cZpk4pENZk5RHZIy+MSfYl8
O3ESCFXQ8wGoreE8LqMVsTTgx5XzMSuLpfM3BBOW0pc=
-----END RSA PRIVATE KEY-----

cat publiccert.pem 
-----BEGIN CERTIFICATE-----
MIIDqzCCAxSgAwIBAgIJAPdkqBFlP+3PMA0GCSqGSIb3DQEBBQUAMIGQMQswCQYD
VQQGEwJVUzERMA8GA1UECBMITWFyeWxhbmQxGTAXBgNVBAoTEFVNQ1AvT0lUL1RT
Uy9FSVMxMzAxBgNVBAMTKmVjMi03NS0xMDEtMjE0LTE5Ni5jb21wdXRlLTEuYW1h
em9uYXdzLmNvbTEeMBwGCSqGSIb3DQEJARYPdHJhc2hAdHJhc2guY29tMB4XDTEw
MTIzMDIwNTUxMVoXDTEyMTIyOTIwNTUxMVowgZAxCzAJBgNVBAYTAlVTMREwDwYD
VQQIEwhNYXJ5bGFuZDEZMBcGA1UEChMQVU1DUC9PSVQvVFNTL0VJUzEzMDEGA1UE
AxMqZWMyLTc1LTEwMS0yMTQtMTk2LmNvbXB1dGUtMS5hbWF6b25hd3MuY29tMR4w
HAYJKoZIhvcNAQkBFg90cmFzaEB0cmFzaC5jb20wgZ8wDQYJKoZIhvcNAQEBBQAD
gY0AMIGJAoGBAIECyxb2URs4jXN6HlIChSqdwXp7NDszRkZ+A9+j9sqSbFNmK1wN
seU/HyLZEOyuuGMWQE85jpwlqC5QipmtWLzSYBiWQL9Zq1TQ4pEy05CwY9XswyEw
1JgPXDA3jxKIOlacX1ahIh3Jec2bLANPM9V6YlYwxsJSsH2H5Wmk8+kTAgMBAAGj
ggEJMIIBBTAdBgNVHQ4EFgQUls+H6G2aw4Di4BAiw39F5NjCNZswgcUGA1UdIwSB
vTCBuoAUls+H6G2aw4Di4BAiw39F5NjCNZuhgZakgZMwgZAxCzAJBgNVBAYTAlVT
MREwDwYDVQQIEwhNYXJ5bGFuZDEZMBcGA1UEChMQVU1DUC9PSVQvVFNTL0VJUzEz
MDEGA1UEAxMqZWMyLTc1LTEwMS0yMTQtMTk2LmNvbXB1dGUtMS5hbWF6b25hd3Mu
Y29tMR4wHAYJKoZIhvcNAQkBFg90cmFzaEB0cmFzaC5jb22CCQD3ZKgRZT/tzzAJ
BgNVHRMEAjAAMBEGCWCGSAGG+EIBAQQEAwIGQDANBgkqhkiG9w0BAQUFAAOBgQAQ
CiP07cZDzNLDxLlWu/3NXc6MYa83h9D+8wKd5/rvpQnCUgrSWipk8cL57wF11xgr
vnYkQwFW38F+HfWcxg3JH7FrOfnMUG1PZt/kyFJvOwoVzXfaXabgmjOOVerPQGuD
a9YcoH4+dHUOuSospbCaEg8TsQef/vk+KpYzLWuS4w==
-----END CERTIFICATE-----



/agua/bin/apps/cluster/starcluster.pl addKeypair \
--privatekey /nethome/admin/.starcluster/privatekey.pem \
--publiccert /nethome/admin/.starcluster/publiccert.pem \
--keyname starcluster-1 \
--username admin



ec2-add-keypair \
-K /nethome/admin/.keypairs/private.pem \
-C /nethome/admin/.keypairs/public.pem \
id_rsa-admin-key \
> /nethome/admin/.starcluster/id_rsa-admin-key

    StarCluster::addKeypair    keypairfile created: /nethome/admin/.starcluster/id_rsa-admin-key

ll /nethome/admin/.starcluster/id_rsa-admin-key

    -rw-r--r-- 1 root root 1.8K Dec 31 03:12 /nethome/admin/.starcluster/id_rsa-admin-key

cat /nethome/admin/.starcluster/id_rsa-admin-key

    KEYPAIR id_rsa-admin-key        c4:b0:e2:ef:3c:76:e2:f1:e9:7b:52:a1:d6:75:be:92:7a:03:fd:35
    -----BEGIN RSA PRIVATE KEY-----
    MIIEowIBAAKCAQEA8EFXjPifIuxhjoFDrzjTaedkUn1PgpTqj0+0MzWOR3onI1PoBDDEwqP681r/
    SpTn3d/30pBfjTjLKF10IxQKpU9MWwUc7N/moPbZXFKEa01HfMkkfEFBIf/umPLgFU1yB9m8VBzh
    wLcHWySAvEykjymDHkOSwPMTLJ9iP4pRv8kctCyMFJdZ5MNHHlshDnbx+QELbScDQwNQpqG3f2WS
    k4kN0X2f+JBtRB3sPetnS8Q56Nxl3RK5l/1Ac5wbtdelDhSTN9+Wdvz/x5Rq3+WxFP/yDdb+Xkh4
    oL0/EFXfY4ZrssA9YLIS4az374AjYAPwRwP9MXFFJD1bfQt9+r9s3wIDAQABAoIBACTopN6PQ0NG
    NSaDTTaZ8ECQv6S8g354CiDCCdjkHVt1tJWEylv6cf/E2USRci6u+X/obFX4v/UeCHfHA5Rv+8Kx
    j/Vbr7nkG7YWtgWs15L0aEsPS3+bNrpWav0sMqiTITV7iacSWMwWUhb6YJyM2ar0oaQAlYb20LdG
    NP217iEcJA2mfM/QAafSgHI5VQvqGhQ/sG25fi3Rkr6ML/4aszYROSzM6qjUCT5lvxxs5t/V8D3z
    eRwg4iREhnuLZl964JGVmXUT0Fkh62Kjs+O7Yw/YeCJI14qnzWXPDGdFkswpKR8uUgJqxwklPmpK
    X9cOn+gkrM0G7gLa9F2V7oqcMkECgYEA+Nj/3M93LnlpZh4YXZGNOYdPhHsiILJxAdfKzxQKoY9D
    fje+p1FdWiu+UJFKYEkzwRLqy9gWyQqoHrdl4Aqdwuq/Tx/kURsmYpKM7i2jjE3dWEgMj/bmQfbw
    KWXlJ6zXNExZ+cfILRPNQwo79IjgXOBsn+xpdDbjIjw2/2/ZNHkCgYEA9ykeyioM6M4BFKaCP4pc
    MYTfE0RaoKzaTZWa1dmj70SkX1be0duczHKdToYu06DnVDk35/AvWKwVFleTC0i9mC8thbquv/63
    rnu9YQvHt6oO+LK/GF8Pa+riFP8c9YIaLlbaLmxYavFC4irqoBtsoPWUFe3FhtaLknAQ5+YP5hcC
    gYBQX03sVHmq4f3fxJKcDfmt/fz5zgdMxjVnofnX/iIc4jerWXfTdJ0RFZXHUdXS2XHEx0ZchjN9
    xVpdaWCXBvbDUKxvct58L6erKKgp+UWceD2oWMTt7pGZ9pbE2Cs2MEXll09sNFF79axTHcgVh+vn
    M3kCAgphRaUAlrAwukBOCQKBgB+eYxH5zyz5Lao2ovL+AE1VcjREylNDyamjOeuhrBcv8NdBhb/T
    GHwPLZCeGd949h8QMta5I1V0rj3tdiI7bAXMA0bYWwK000q/Cbsghqw4VTH7q/ayMobbxZBqEopV
    2oOTGNZXhfgoZSYJ13okCAGPaSJlCJ/3UmOpcoA4LlCBAoGBAPdsMWSNGFM8jGD1qf7+ITBmezdj
    wXT9gQTtP7l21TYJkjE2TJ8iuTD65607CX8RrvdthunI9vYE0CdeqqC0v7qF2ZXA0eez1YKcdTbM
    nnVhyox2QQBcyICsAH8ccFsm2BZ2Ci3lrS/Mu/QV+vkq4+l/cuzrw7DXUcv1QDRv+Mkz
    -----END RSA PRIVATE KEY-----


/agua/bin/apps/cluster/starcluster.pl writeConfigfile \
--private /nethome/admin/.keypairs/private.pem \
--public /nethome/admin/.keypairs/public.pem \
--keyname admin-key \
--username admin \
--cluster smallcluster

</entry>

<entry [Fri Dec 24 14:20:20 EST 2010] MOUNT MASTER /data ON ON AQ-7(StarCluster.pm)>
    
(SET NFS SHARE OF CLUSTER MASTER /data WITH AQUARIUS-7)

*******
SUCCESS: DO IT USING vers=3 IN /etc/fstab
*******


1. ON MASTER, ASSIGN PERMANENT PORT NUMBER FOR mountd

ON AQ-7, GET SSH KEYFILE LOCATION FROM /nethome/admin/.starcluster/config:

cat /nethome/admin/.starcluster/config
    
    ...
    [key id_rsa-admin-key]
    KEYNAME=id_rsa-admin-key
    KEY_LOCATION=/nethome/admin/.starcluster/id_rsa-admin-key
    ...

ON AQ-7, SET FIXED mountd PORT ON MASTER USING SSH:

ssh -i /nethome/admin/.starcluster/id_rsa-admin-key root@ip-10-124-245-118 cat /etc/default/nfs-kernel-server


RPCMOUNTDOPTS="--port 32767 --manage-gids"




2. OPEN NFS PORTS FOR THE @sc-masters GROUP ON EC2

# PORTMAP
ec2-authorize @sc-smallcluster -p 111 -P tcp
ec2-authorize @sc-smallcluster -p 111 -P udp

# NFS
ec2-authorize @sc-smallcluster -p 2049 -P udp
ec2-authorize @sc-smallcluster -p 2049 -P tcp

# MOUNTD
ec2-authorize @sc-smallcluster -p 32767 -P udp
ec2-authorize @sc-smallcluster -p 32767 -P tcp


NB: DON'T NEED TO OPEN status OR nlockmgr PORTS
(CHECKED BY RESTARTING AND COULD STILL MOUNT ON AQ-7 EVEN THOUGH PORTS HAD CHANGED)


3. ON MASTER, ADDED THE FOLLOWING LINE WITH vers=3 TO /etc/fstab:

emacs /etc/fstab

<!--

    # /etc/fstab: static file system information.
    # <file system> <mount point>   <type>  <options>  <dump>  <pass>         proc          /proc           proc    defaults        0       0
    /dev/sda1     /               ext3    defaults        0       0
    /dev/sdb      /mnt            ext3    defaults        0       0
    #/dev/sdj1    /data           auto    noauto,defaults 0       0
    /dev/sdj1     /data           nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0

-->

4. ON MASTER, SET UP EXPORT IN /etc/exports 

cat /etc/exports

    /home ip-10-124-247-224.ec2.internal(async,no_root_squash,no_subtree_check,rw)
    /opt/sge6 ip-10-124-247-224.ec2.internal(async,no_root_squash,no_subtree_check,rw)
    /data ip-10-124-247-224.ec2.internal(async,no_root_squash,no_subtree_check,rw)
*** /data ip-10-127-158-202.ec2.internal(async,no_root_squash,no_subtree_check,rw)



5. RESTART portmap AND nfs

service portmap restart
service nfs restart



6. ON AQ-7, SCAN MASTER'S PORTS

nmap -P0 10.124.245.118

    Interesting ports on ip-10-124-245-118.ec2.internal (10.124.245.118):
    Not shown: 1677 filtered ports
    PORT     STATE SERVICE
    22/tcp   open  ssh
    111/tcp  open  rpcbind
    2049/tcp open  nfs


7. CHECK MOUNTS

ON MASTER, CHECK EXPORTS

showmount -a
    All mount points on ip-10-124-245-118:
    10.124.247.224:/data
    10.124.247.224:/home
    10.124.247.224:/opt/sge6
    10.127.158.202:/data


ON AQ-7, CHECK IF MASTER'S MOUNT IS SEEN

showmount -e ip-10-124-245-118

Export list for ip-10-124-245-118:
/data     ip-10-127-158-202.ec2.internal,ip-10-124-247-224.ec2.internal
/opt/sge6 ip-10-124-247-224.ec2.internal
/home     ip-10-124-247-224.ec2.internal



8. ON AQ-7, MOUNT /cluster/data FROM MASTER USING '-o nfsvers=3':

umount /cluster/data
mount -o nfsvers=3 -t nfs ip-10-124-245-118:/data /cluster/data

    OK!
    
</entry>

<entry [Fri Dec 24 14:20:19 EST 2010] MOUNT AQ-7 /data ON MASTER AND NODES>
    
(StarCluster.pm)


/data/agua/0.5/bin/apps/cluster/starcluster.pl start \
--username admin \
--cluster smallcluster \
--privatekey /nethome/admin/.keypairs/private.pem \
--publiccert /nethome/admin/.keypairs/public.pem \
--keyname admin-key


*** REMOVE /data ON MASTER AND ASSOCIATED ENTRIES IN /etc/exports ON MASTER AND /etc/fstab ON NODE001


AQUARIUS-7 MOUNT CONFIG
***********************

1. ON AQ-7, SET FIXED mountd PORT IN /etc/sysconfig/nfs
(DON'T WORRY ABOUT NFS (PORT 2049) OR PORTMAP (PORT 111))

cp /etc/sysconfig/nfs /etc/sysconfig/nfs.bkp
emacs /etc/sysconfig/nfs

    MOUNTD_PORT=32767


2. ON AQ-7, OPEN NFS PORTS FOR THE @sc-masters GROUP ON EC2

# PORTMAP
ec2-authorize default -p 111 -P tcp
ec2-authorize default -p 111 -P udp

# NFS
ec2-authorize default -p 2049 -P udp
ec2-authorize default -p 2049 -P tcp

# MOUNTD
ec2-authorize default -p 32767 -P udp
ec2-authorize default -p 32767 -P tcp


3. ON AQ-7, ADD LINES WITH vers=3 TO /etc/fstab:

/dev/sdh  /data      nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0
/dev/sdi  /nethome      nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0


EDIT /etc/fstab:

cp /etc/fstab /etc/fstab.bkp
emacs /etc/fstab

    /dev/sda1  /         ext3    defaults        1 1
    none       /dev/pts  devpts  gid=5,mode=620  0 0
    none       /proc     proc    defaults        0 0
    none       /sys      sysfs   defaults        0 0
    /swapfile  none      swap    sw              0 0
    /dev/sdh   /data     ext3    noatime 0       0
    /dev/sdi   /nethome      ext3    defaults        0 0
    /nethome/mysql/etc/mysql /etc/mysql     none bind
    /nethome/mysql/lib/mysql /var/lib/mysql none bind
    /nethome/mysql/log/mysql /var/log/mysql none bind
    ip-10-124-245-118:/data  /cluster/data nfs nfsvers=3,defaults 0 0
***    /dev/sdh  /data      nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0



####ec2-authorize @sc-masters -p 6444 -P tcp
####ec2-authorize @sc-masters -p 6444 -P udp
####ec2-authorize @sc-masters -p 6445 -P tcp
####ec2-authorize @sc-masters -p 6445 -P udp



4. ON AQ-7, SET UP EXPORT TO MASTER/NODES IN /etc/exports 

emacs /etc/exports
    
    /data ip-10-124-245-118.ec2.internal(async,no_root_squash,no_subtree_check,rw)
    /nethome ip-10-124-245-118.ec2.internal(async,no_root_squash,no_subtree_check,rw)
    /data ip-10-124-247-224.ec2.internal(async,no_root_squash,no_subtree_check,rw)
    /nethome ip-10-124-247-224.ec2.internal(async,no_root_squash,no_subtree_check,rw)


5. RESTART portmap AND nfs

service portmap restart
service nfs restart


CONFIGURE MASTER AND NODES NFS SHARES
*************************************

SCAN AQ-7'S PORTS TO CHECK 111/tcp AND 2049/tcp ARE OPEN

nmap -P0 10.127.158.202

    111/tcp  open   rpcbind ****
    2049/tcp open   nfs     ****

showmount -e ip-10-127-158-202
    
    Export list for ip-10-127-158-202:
    /data    ip-10-124-247-224.ec2.internal,ip-10-124-245-118.ec2.internal
    /nethome ip-10-124-247-224.ec2.internal,ip-10-124-245-118.ec2.internal


MOUNT /data AND /nethome

NB: USING '-o nfsvers=3'

mkdir -p /data
umount /data
mount -o nfsvers=3 -t nfs ip-10-127-158-202:/data /data

mkdir -p /nethome
umount /nethome
mount -o nfsvers=3 -t nfs ip-10-127-158-202:/nethome /nethome


ADD THESE LINES TO /etc/fstab FOR AUTOMOUNT AFTER REBOOT

    ip-10-124-245-118.ec2.internal:/data /data nfs rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0
    ip-10-124-245-118.ec2.internal:/nethome /nethome nfs rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0



CHECK IF AQ-7'S /data **AND** /nethome MOUNTS ARE VISIBLE

ON NODE:

cat /etc/fstab
    ...
    ip-10-124-245-118.ec2.internal:/home /home nfs rw,user=root,nosuid,nodev,addr=10.124.245.118 0 0
    ip-10-124-245-118.ec2.internal:/opt/sge6 /opt/sge6 nfs rw,user=root,nosuid,nodev,addr=10.124.245.118 0 0
    ip-10-127-158-202:/data /aquarius/data nfs rw,addr=10.127.158.202 0 0
    ip-10-127-158-202:/nethome /aquarius/nethome nfs rw,addr=10.127.158.202 0 0

    OK!


ON MASTER:

cat /etc/mtab
    ...
    ip-10-127-158-202:/data /aquarius/data nfs rw,nfsvers=3,addr=10.127.158.202 0 0
    ip-10-127-158-202:/nethome /aquarius/nethome nfs rw,nfsvers=3,addr=10.127.158.202 0 0
    /dev/sdj1 /data ext3 rw 0 0

    OK!



</entry>


<entry [Fri Dec 24 14:20:16 EST 2010] BENCHMARK sge JOBS ON STARCLUSTER - /tmp TWICE AS FAST>
    
1. REMOVE MASTER FROM QUEUE AS EXECUTION HOST
[
    Wed Feb  2 13:03:11 EST 2011
    EXCLUDE MASTER NODE FROM QUEUE
]


2. AUTOMATE RESTART sge MASTER AND EXECD AFTER REBOOT MASTER

ADDED TO /etc/init.d/rc.local

/etc/init.d/sgemaster.starcluster start
echo "sgemaster.starcluster started"
/etc/init.d/sgeexecd.starcluster start
echo "sgeexecd.starcluster started"


3. TEST MASTER SHARE TO AQUARIUS-7

THE TWO RUN CASES BELOW HAD THE SAME RUN TIMES AND WERE TWICE AS FAST WHEN RUN USING /tmp

CASE ONE
********
    -   REFERENCE ON /aquarius/data
    -   OUTPUT WRITTEN TO /aquarius/data
    -   APPS ON /cluster/data


CASE TWO
********
    -   REFERENCE ON /aquarius/data
    -   OUTPUT WRITTEN TO /aquarius/data
    -   APPS ON /aquarius/data

NB: CHECK FOR ERRORS

tail /opt/sge6/default/spool/exec_spool_local/ip-10-124-247-224/messages 


CASE ONE
=========


RUN BOWTIE USING 1M READS (PAIRED) ON MASTER:

/cluster/data/agua/0.5/bin/apps/aligners/BOWTIE.pl \
--inputfiles /aquarius/nethome/admin/.agua/Project1/Workflow1/yoruba1-1.reads_1.1M.sequence.txt \
--matefiles /aquarius/nethome/admin/.agua/Project1/Workflow1/yoruba1-1.reads_2.1M.sequence.txt \
--species human \
--distance 200 \
--label bowtie-1 \
--outputdir /aquarius/nethome/admin/.agua/Project1/Workflow1 \
--reference /aquarius/nethome/data/sequences/human/hg19/bowtie/chr22 \
--params "--seedlen 32" \
--reads 100000 \
--queue all.q

\
--clean
    
    Cluster::runJobs    cleanup not defined. Leaving scriptfiles.
    BOWTIE::run    After samToBam     11-02-04 17:22:26
    BOWTIE.pl    Run time: 00:10:47
    BOWTIE.pl    Completed /cluster/data/agua/0.5/bin/apps/aligners/BOWTIE.pl
    BOWTIE.pl    5:22PM, 4 February 2011
    BOWTIE.pl    ****************************************


MUCH FASTER USING /tmp (ABOUT HALF THE TIME):


/cluster/data/agua/0.5/bin/apps/aligners/BOWTIE.pl \
--inputfiles /aquarius/nethome/admin/.agua/Project1/Workflow1/yoruba1-1.reads_1.1M.sequence.txt \
--matefiles /aquarius/nethome/admin/.agua/Project1/Workflow1/yoruba1-1.reads_2.1M.sequence.txt \
--species human \
--distance 200 \
--label bowtie-1 \
--outputdir /aquarius/nethome/admin/.agua/Project1/Workflow1 \
--reference /aquarius/nethome/data/sequences/human/hg19/bowtie/chr22 \
--params "--seedlen 32" \
--reads 100000 \
--queue all.q \
--tempdir /tmp \
--clean

    **** ONLY 9.5 MINS FOR WHOLE WORKFLOW ****
    
    BOWTIE::run    After samToBam     11-02-04 17:45:58
    BOWTIE.pl    Run time: 00:09:27
    BOWTIE.pl    Completed /cluster/data/agua/0.5/bin/apps/aligners/BOWTIE.pl
    BOWTIE.pl    5:45PM, 4 February 2011
    BOWTIE.pl    ****************************************




CASE TWO
========


/aquarius/data/agua/0.5/bin/apps/aligners/BOWTIE.pl \
--inputfiles /aquarius/nethome/admin/.agua/Project1/Workflow1/yoruba1-1.reads_1.1M.sequence.txt \
--matefiles /aquarius/nethome/admin/.agua/Project1/Workflow1/yoruba1-1.reads_2.1M.sequence.txt \
--species human \
--distance 200 \
--label bowtie-1 \
--outputdir /aquarius/nethome/admin/.agua/Project1/Workflow1 \
--reference /aquarius/nethome/data/sequences/human/hg19/bowtie/chr22 \
--params "--seedlen 32" \
--reads 100000 \
--queue all.q \
--tempdir /tmp \
--clean

SAME RUN TIME:

root@ip-10-124-245-118:/aquarius/nethome/admin/.agua/Project1/Workflow1/chr22# ll scripts/bowtie-chr22.sh 
    -rwxrwxrwx 1 root root 1.4K 2011-02-04 20:24 scripts/bowtie-chr22.sh

root@ip-10-124-245-118:/aquarius/nethome/admin/.agua/Project1/Workflow1/chr22# ll hit.bam
    -rw-r--r-- 1 root root 122K 2011-02-04 20:33 hit.bam


RUN IN /cluster/nethome


mkdir -p /cluster/data/sequences/human/hg19/bowtie/chr22
cp -r /aquarius/data/sequences/human/hg19/bowtie/chr22/* /cluster/data/sequences/human/hg19/bowtie/chr22

mkdir -p /cluster/data/sequences/human/hg19/samtools
cp -r /aquarius/data/sequences/human/hg19/samtools/* /cluster/data/sequences/human/hg19/samtools 


/cluster/data/agua/0.5/bin/apps/aligners/BOWTIE.pl \
--inputfiles /cluster/nethome/admin/.agua/Project1/Workflow1/yoruba1-1.reads_1.sequence.txt \
--matefiles /cluster/nethome/admin/.agua/Project1/Workflow1/yoruba1-1.reads_2.sequence.txt \
--species human \
--distance 200 \
--label bowtie-1 \
--outputdir /cluster/nethome/admin/.agua/Project1/Workflow1 \
--reference /cluster/data/sequences/human/hg19/bowtie/chr22 \
--params "--seedlen 32" \
--reads 1000000 \
--cluster SGE

    OK!
    
    SAME TIME AS RUN IN /aquarius






NOTES
-----


StarCluster.pm DEPRECATED MASTER --> HEAD NFS SHARE
---------------------------------------------------


	#### 1. CONFIGURE NFS SHARES ON HEAD NODE (I.E., NOT MASTER)
	
		##### MASTER TO HEAD EXPORT	
		#$self->setMountdPort($username, $keypairfile, $masterip);
		#$self->addExports($username, $keypairfile, $headip, $masterip, $volume);
		#$self->restartDaemons($keypairfile, $masterip);
		#$self->mountNfs(...);



</entry>

<entry [Fri Dec 24 14:20:15 EST 2010] MOUNTS SUMMARY>
    
    
/cluster/data       (MOUNT FROM MASTER)

/aquarius/data      (MOUNT FROM AQ-7)
/aquarius/nethome   (MOUNT FROM AQ-7)

AQUARIUS-7                                      MASTER
           link                    share
/data       --> /aquarius/data      -->     /aquarius/data
/nethome    --> /aquarius/nethome   -->     /aquarius/nethome --> /nethome


MASTER                                          AQUARIUS-7
           link                    share
/data       --> /cluster/data       -->     /cluster/data


ON MASTER, THE MOUNTED VOLUME /data IS SHARED BY NFS TO THE NODES:

cat /etc/fstab
    # < file system> < mount point>   < type>  < options>   < dump>  < pass>
    proc          /proc           proc    defaults        0       0
    /dev/sda1     /               ext3    defaults        0       0
    /dev/sdb      /mnt            ext3    defaults        0       0
    /dev/sdj1     /data           nfs      rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0


NODE001 /etc/fstab HAS AUTO MOUNT OF /data FROM MASTER

cat /etc/fstab

    # /etc/fstab: static file system information.
    # < file system>                                 < mount point>   < type>  < options>       < dump>  < pass>
    proc                                            /proc           proc    defaults        0       0
    /dev/sda1                                       /               ext3    defaults        0       0
    /dev/sdb                                        /mnt            ext3    defaults        0       0
    ip-10-124-245-118.ec2.internal:/home /home nfs user,rw,exec 0 0
    ip-10-124-245-118.ec2.internal:/opt/sge6 /opt/sge6 nfs user,rw,exec 0 0
    ip-10-124-245-118.ec2.internal:/data /data nfs user,rw,exec 0 0




</entry>

<entry [Fri Dec 24 14:20:14 EST 2010] BENCHMARKING: BOWTIE.pl OUTPUT ON /aquarius>
    
    
10M READS (PAIRED), NO /tmp


/cluster/data/agua/0.5/bin/apps/aligners/BOWTIE.pl \
--inputfiles /aquarius/nethome/admin/.agua/Project1/Workflow1/yoruba1-1.reads_1.10M.sequence.txt \
--matefiles /aquarius/nethome/admin/.agua/Project1/Workflow1/yoruba1-1.reads_2.10M.sequence.txt \
--species human \
--distance 200 \
--label bowtie-1 \
--outputdir /aquarius/nethome/admin/.agua/Project1/Workflow1 \
--reference /aquarius/nethome/data/sequences/human/hg19/bowtie/chr22 \
--params "--seedlen 32" \
--reads 1000000 \
--queue all.q \
--clean


TOTAL TIME FOR RUN:

51 mins


STARTED

cd /nethome/admin/.agua/Project1/Workflow1/chr22
ll scripts/bowtie-chr22.sh

    -rwxrwxrwx 1 root root 1.2K 2011-02-04 08:22 scripts/bowtie-chr22.sh

ENDED

cd /nethome/admin/.agua/Project1/Workflow1/chr22
ll 10/out.sam

    -rw-r--r-- 1 root root 253M 2011-02-04 09:13 10/out.sam



RUNNING BOWTIE IN /aquarius/data
--------------------------------

CREATES THIS SCRIPT:

/aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/scripts/bowtie-chr22.sh

#!/bin/sh

export TASKNUM=$(expr $SGE_TASK_ID)

#$ -N bowtie-chr22              # The name of the job
#$ -l h_rt=24:00:00
#$ -q all.q

hostname -f
date > /aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/lock/$TASKNUM/bowtie-chr22-lock.txt

#echo "TASKNUM: " $TASKNUM > /aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/stdout/$TASKNUM/bowtie-chr22-stdout.txt
#date >> /aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/stdout/$TASKNUM/bowtie-chr22-stdout.txt
#sleep 3;
#exit;
mkdir -p /tmp//aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/$TASKNUM
cd /tmp//aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/$TASKNUM
time /cluster/data/apps/bowtie/0.12.2/bowtie \
--sam \
--rf \
--threads 1 \
-X 200 \
--seedlen 32 \
--al /tmp//aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/$TASKNUM/aligned.txt \
--un /tmp//aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/$TASKNUM/unaligned.txt \
/aquarius/nethome/data/sequences/human/hg19/bowtie/chr22/chr22 \
-1 /aquarius/nethome/admin/.agua/Project1/Workflow1/$TASKNUM/bowtie-1_1.$TASKNUM.txt \
-2 /aquarius/nethome/admin/.agua/Project1/Workflow1/$TASKNUM/bowtie-1_2.$TASKNUM.txt \
/tmp//aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/$TASKNUM/out.sam
mkdir -p /aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/$TASKNUM
mv /tmp//aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/$TASKNUM/* /aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/$TASKNUM
rm -fr /tmp//aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/$TASKNUM \
&> /aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/stdout/$TASKNUM/bowtie-chr22-stdout.txt

unlink /aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/lock/$TASKNUM/bowtie-chr22-lock.txt;


... AND RUNS THE SCRIPT WITH THIS COMMAND:


/opt/sge6/bin/lx24-amd64/qsub -t 1-10 -q all.q /aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/scripts/bowtie-chr22.sh




RUN BOWTIE MANUALLY
-------------------

export TASKNUM=1

mkdir -p /aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/$TASKNUM
cd /aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/$TASKNUM
time /cluster/data/apps/bowtie/0.12.2/bowtie \
--sam \
--rf \
--threads 1 \
-X 200 \
--seedlen 32 \
--al /aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/$TASKNUM/aligned.txt \
--un /aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/$TASKNUM/unaligned.txt \
/aquarius/nethome/data/sequences/human/hg19/bowtie/chr22/chr22 \
-1 /aquarius/nethome/admin/.agua/Project1/Workflow1/$TASKNUM/bowtie-1_1.$TASKNUM.txt \
-2 /aquarius/nethome/admin/.agua/Project1/Workflow1/$TASKNUM/bowtie-1_2.$TASKNUM.txt \
/aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/$TASKNUM/out.sam


ll /aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/$TASKNUM/out.sam
    
    -rw-r--r-- 1 root root 41M 2011-02-03 17:27 /aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/1/out.sam





Running Grid Engine System Programs in Debug Mode
-------------------------------------------------

For some severe error conditions, the error-logging mechanism might not yield enough information to identify the problem. To access the information that is necessary to address the problem, the Grid Engine system offers the ability to run almost all ancillary programs and the daemons in debug mode. The debug levels range from zero through 10. Level zero turns off debugging and level 10 delivers the most detailed information.

To set a debug level, the following extensions to your resource files are provided with the distribution of the Grid Engine system:

As a csh or tcsh user, include the following line in your .cshrc file:
source $SGE_ROOT/util/dl.csh
As a sh or ksh user, include the following line in your .profile file:
. $SGE_ROOT/util/dl.sh
As soon as you log out and log in again, you can use the following command to set a debug level:

% dl < level>
If level is greater than zero, Grid Engine system commands are forced to write trace output to STDOUT. The trace output can contain the following:

Warning messages
Status messages
Error messages
Names of the program modules that are called internally
Line number information, which is helpful for error reporting, depending on the debug level you specify.


TEST QSTAT INFO
---------------


mkdir -p /cluster/data/pipeline/admin/Project1/Workflow1
cd /cluster/data/pipeline/admin/Project1/Workflow1
emacs test.sh
#!/bin/sh

hostname

sleep 60;


chmod 755 test.sh 



TROUBLESHOOTING MISSING '$SGE_TASK_ID'
--------------------------------------

TRIED SPECIFYING OUT AND ERR FILES ON COMMAND LINE (***DIDN'T WORK***)

1. COMMENT OUT ERROR AND STDOUT LINES IN SCRIPT FILE:

####$ -o /aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/stdout/$TASKNUM/bowtie-chr22-stdout.txt 
####$ -e /aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/stdout/$TASKNUM/bowtie-chr22-stderr.txt 


2. RUN WITH OUT AND ERR FILES IN qsub COMMAND

/opt/sge6/bin/lx24-amd64/qsub -t 1-10 -q all.q  -o /aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/stdout/$SGE_TASK_ID/bowtie-chr22-stdout.txt  -e /aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/stdout/$SGE_TASK_ID/bowtie-chr22-stderr.txt  /aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/scripts/bowtie-chr22.sh



THIS ALSO DIDN'T WORK FOR sleep.sh ....:


#!/bin/bash

TASK_ID=$(expr $SGE_TASK_ID)
ID=${JOB_ID}
echo "TASK_ID: " $TASK_ID
echo "ID: " $ID
echo "JOB_ID: " $JOB_ID
echo "SGE_TASK_ID: " $SGE_TASK_ID

#$ -N sleep
#$ -cwd
#$ -o /root/sleep-out.$JOB_ID.$TASK_ID
#$ -e /root/sleep-err.$JOB_ID.$TASK_ID
#$ -l h_rt=0:30:00

hostname -f 
date

SLEEP=$1;
echo "Doing sleep " $SLEEP " seconds"
sleep $SLEEP;
echo "Completed"






RUN COMMAND:

/opt/sge6/bin/lx24-amd64/qsub \
-t 1-10 \
-q all.q \
-o /aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/sleep-out.$JOB_ID.$TASK_ID \
-e /aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/sleep-err.$JOB_ID.$TASK_ID \
/aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/scripts/bowtie-chr22.sh



COPIED UPDATED bin AND lib FROM AQUARIUS-7 TO MASTER /data DIR
--------------------------------------------------------------

I.E., COPIED FROM HERE:

/aquarius/data/agua/0.5

TO HERE:

/cluster/data/agua/0.5


ON AQ-7, COPY OVER apps AND lib

rm -fr /cluster/data/aqua/0.5/bin/apps/*
rm -fr /cluster/data/aqua/0.5/lib/*
cp -r /aquarius/data/agua/0.5/bin/apps/* /cluster/data/aqua/0.5/bin/apps
cp -r /aquarius/data/agua/0.5/bin/apps/* /cluster/data/aqua/0.5/bin/apps
cd /cluster/data/aqua/0.5/bin/apps
chmod -R 755 */*t
chmod -R 755 */*pl

NOTE:
scp -i /nethome/admin/.starcluster/id_rsa-admin-key -r /aquarius/data/ root@ip-10-124-245-118:/cluster/data


COPY external FROM PEGASUS 

ON PEGASUS
cd /nethome/syoung/0.5/lib/external
emacs dummy.txt

scp -i dummy.txt \
perl5-32bit-5.8.8.tar.gz \
root@ec2-75-101-214-196.compute-1.amazonaws.com:

scp -i dummy.txt \
perl5-64bit-5.8.8.tar.gz \
root@ec2-75-101-214-196.compute-1.amazonaws.com:


ON AQ-7
COPY lib FROM /aquarius/data/agua/0.5 TO /cluster/data/agua/0.5

COPY AQ-7 external MOOSE-RELATED MODULES (scp OVER FROM PEGASUS TO MASTER) TO external ON MASTER
cd ~
cp perl5-32bit-5.8.8.tar.gz /cluster/data/agua/0.5/lib/external 
cp perl5-64bit-5.8.8.tar.gz /cluster/data/agua/0.5/lib/external 

cd /cluster/data/agua/0.5/lib/external
tar xvfz 




COPIED DATA FROM PEGASUS TO AQUARIUS-7
--------------------------------------

1. COPIED BOWTIE hg19 REFERENCE (3.2 GB)

COPIED TO /nethome/jgilbert 

/nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie

    NB: REDO LATER - DID NOT UNTAR COMPLETELY PART OF CHR8 AND ALL OF CHR9 MISSING!!


2. COPIED TEST INPUT FILES FROM PEGASUS TO AQ-7

HUMAN NA18507 10M-READ SAMPLES

ON AQ-7:
mkdir -p /nethome/admin/.agua/Project1/Workflow1

29 GB OF SPACE AVAILABLE IN /nethome:
df -a
    ...
    /dev/sdi               40G  8.5G   29G  23% /nethome
    ...

ON PEGASUS:

emacs dummy.txt
< agua.pem>

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader

chopfile yoruba1-1.reads_1.sequence.txt yoruba1-1.reads_1.10M.sequence.txt 40000000
    OUTPUTFILE yoruba1-1.reads_1.10M.sequence.txt CREATED (40000000 LINES)

chopfile yoruba1-1.reads_2.sequence.txt yoruba1-1.reads_2.10M.sequence.txt 40000000
    OUTPUTFILE yoruba1-1.reads_2.10M.sequence.txt CREATED (40000000 LINES)

scp -i dummy.txt \
yoruba1-1.reads_1.10M.sequence.txt \
root@ec2-75-101-214-196.compute-1.amazonaws.com:/nethome/admin/.agua/Project1/Workflow1

scp -i dummy.txt \
yoruba1-1.reads_2.10M.sequence.txt \
root@ec2-75-101-214-196.compute-1.amazonaws.com:/nethome/admin/.agua/Project1/Workflow1


CHECK FILE LINES:

grep -cve '^\s*$' 

grep -cve '^\s*$' /aquarius/nethome/admin/.agua/Project1/Workflow1/yoruba1-1.reads_1.sequence.txt



3. COPY SAMTOOLS REFERENCE FROM PEGASUS TO AQUARIUS-7

COPIED TO HERE AQ-7:

mkdir -p /aquarius/nethome/data/sequences/human/hg19/samtools


FROM PEGASUS:

cd /nethome/bioinfo/data/sequence/chromosomes/human/hg19
scp -i dummy.txt \
samtools.tar.gz \
root@ec2-75-101-214-196.compute-1.amazonaws.com:/aquarius/nethome/data/sequences/human/hg19/samtools






TEST JOB SUBMIT FROM AQ-7
-------------------------

emacs /cluster/data/agua/0.5/bin/apps/test/test.sh

    #!/bin/sh
    
    echo `hostname`
    echo `date`
    /cluster/data/agua/0.5/bin/apps/test/test.pl \
    /cluster/data/agua/0.5/bin/apps/test/test.out \
    10


emacs /cluster/data/agua/0.5/bin/apps/test/test.pl

    #!/usr/bin/perl -w
    
    use strict;
    my $filename = $ARGV[0];
    my $times = $ARGV[1];
    my $sleep = $ARGV[2];
    $times = 5 if not defined $times;
    $sleep = 5 if not defined $sleep;
    open(OUT, ">$filename") or die "Can't open filename: $filename\n";
    print OUT `date`;
    my $counter = 0;
    while ( $counter <  $times )
    {
        print OUT "$counter:  ";
        print OUT `date`;
        $counter++;
        sleep(5);
    }
    close(OUT) or die "Can't close filename: $filename\n";
    print "Completed $0\n";



ON AQ-7, RUN JOB:

qsub /cluster/data/agua/0.5/bin/apps/test/test.sh

    Your job 7 ("test1.sh") has been submitted

    OK!!
    


ON AQ-7, CHECK JOB IS RUNNING:

qstat

  job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID 
  -----------------------------------------------------------------------------------------------------------------
        9 0.00000 test1.sh   root         qw    01/18/2011 17:49:37                                    1        


ON AQ-7, CHECK OUTPUT:

cat /cluster/data/agua/0.5/bin/apps/test/test.out

    Tue Jan 18 23:31:48 UTC 2011
    0:  Tue Jan 18 23:31:48 UTC 2011
    1:  Tue Jan 18 23:31:53 UTC 2011
    2:  Tue Jan 18 23:31:58 UTC 2011
    3:  Tue Jan 18 23:32:03 UTC 2011
    4:  Tue Jan 18 23:32:08 UTC 2011
    5:  Tue Jan 18 23:32:13 UTC 2011
    6:  Tue Jan 18 23:32:18 UTC 2011
    7:  Tue Jan 18 23:32:23 UTC 2011
    8:  Tue Jan 18 23:32:28 UTC 2011
    9:  Tue Jan 18 23:32:33 UTC 2011






NON-INTERACTIVE SSH
-------------------

USE "export SGE_ROOT=/opt/sge6; command":

ssh -o StrictHostKeyChecking=no -i /nethome/admin/.starcluster/id_rsa-admin-key root@ip-10-124-241-66.ec2.internal "export SGE_ROOT=/opt/sge6; /opt/sge6/bin/lx24-amd64/qconf -de ip-10-124-241-66.ec2.internal; "
error: commlib error: got select error (Connection refused)
ERROR: unable to send message to qmaster using port 6444 on host "ip-10-124-241-66.ec2.internal": got send error



http://www.thinkplexx.com/learn/howto/security/ssh/setting-ssh-remote-host-environment-variables-interactive-shell

There are two files ~/.profile and ~/.bashrc.
~/.profile  read by ssh in interactive shell on login
~/.bashrc  read by ssh in non-interctive shell on login


Ssh must be allowed to set the environment


Edit sshd_config
On the REMOTE_SERVER login as root user and edit

/etc/ssh/sshd_config

Add:

PermitUserEnvironment yes
Default is PermitUserEnvironment no, which means, regardless of who and how sets the environment, it just won't work.

Restart sshd
On REMOTE_SERVER for config to take effect, sshd must be restarted:

/etc/init.d/ssh restart


Validate new environment


Following will give you what you need:

ssh -i ~/.ssh/YOUR_PRIVATE_KEY YOUR_USER@REMOTE_SERVER "env"


1. Is the shell variable properly set. (SHELL=/bin/bash)?
2. Do you see your exported variables?

That's it. Have fun!


</entry>


<entry [Fri Dec 24 14:20:13 EST 2010] TEST ADD KEYPAIR>

ec2-add-keypair -v \
-K /nethome/admin/.starcluster/private.pem \
-C /nethome/admin/.starcluster/public.pem \
id_rsa-starcluster-1

    OK

KEYPAIR id_rsa-starcluster-1    70:f5:48:fa:ac:17:ec:1c:94:aa:93:26:8f:9b:2e:84:8a:10:f9:3d
-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEA6KMiT0Irn0rtjuJFZQjEmD/dqKKYjd0SYVfbvxuOwbseZB3Rm/jeDeIm4a5Q
597fJ2woRNsv+zTx9/1ZjsUWsmS/X+et/XjF5AvWiSza6gevzEcdTvtSMP5xUZsoZOEG/3nKLUjC
36rRDGqdro7aDCKjF74eeoeDxZ7krP8cu2lD9IK1pR4+FLjr5uYtojbXGX1e5RXmpScv+Y3dZCx9
KaZXSndfy4ZZTtmYNeCAEnUc3X25thj+uc4+nKeWaojT7Q01YfYkmHzOXfghbXYe867Id5yNrhBm
byEOLnPbZEnXKumfCScB7AEAIixaQwRulYtTM5fapq1Rm3KNqrfTLwIDAQABAoIBAGyp5pjG+8FI
KnaXUnrDAbFsA4mFiWSaYr99XnOB18i+Mo/pLcOBF5e8jxTTa48jF3E+oACpsVvRe0Su3mpFvThO
vuV5PlgrVaQTs34XqZmvRXpRrWr7EYU5FI1dwBx+z9n9dWZ5mi0HiOYX1td2ens4op2wfGQXcIGa
mo4EC9Otj5sw4ecBAidy+yNAu3lkjf20+7hPq/77/agWfEKEKUJDACWZFIETreMn6I3vXz/USuHW
R09gra3TvT4MSS3jzQwQIaCn3TnxJ8t+mCpjJ3XMRAz9nBww8BOhbmcd7NcWHgGF34VuvYkm1PYW
bQYj0G3JtrmYcPCotQ/zj628XiECgYEA/eOImsoAtUxszUl0asF3mes2h98pAheUCYmS8Kzd7qfL
MJK7FaqojWlz+gauFNJSr00wxSkg7+lzX22PlbfA76xztwyHu8wuAGcvUwa8AiiGXxJOk+BquCC9
klxemrRuRdABiV4nosiYzQCaM6sSWqwU59wJX7W4raAJ8TwLRLMCgYEA6pJccQbHJ4DWLvQvCYq+
kzsp9bhkJI5PkusLg3AE92wtfL+eomu6YW52v0kOHWIobS2LMqe61XVBlzdPVkf2u1fN/1BeIu/6
5SPbNQVBtQVU0a9rAIMK99OcbwEcvv09CODYWp27aHBGMidDP1et6q/gJ0ZvyNbZoZn+io8FTZUC
gYEArNRoWJ6sTr6Azlpzknyy8ydoTqP+YXs1fiyVx5qV1XGJ4z3vdzdeWC1yEsDbXjcyrD0Ktxxh
XI/5xvtpJA0bnMwzVWeFOrUql4GmeIl8EKgPmMZ4kTfSzhcTlX+lswCilImdkipzJuARDHSdhBCv
hOPhs1hZVTr6Rc9NFVe/f/sCgYEAyng6wnSPQlG6jhzG3P2dMYhH14ipJ8SOesnWzkTKhKYjPSJI
0vkZjy/B36o3PLWVH2fIVpjgc48aZmOfX2IOXfaUIGRGXPG3JkGk3EcFSDKp27QGMBLsTK2iwU28
ej4riJZLKSwsryD59iBdszcDLydP25a4tip8/zfktcRtV2ECgYA23ozulBt7qWgWe7kuQ2uo9lBz
ImO6ZzNZhp/by+ozNqn/ifxoE6BQSUHpX2KGJpjHvW1JY6tL3iAxQUqpOYVfcVRV3d7LaU99j8oO
TBkWpFtFtzrfjy+3uVUeCaGMjsmUp/QuQABw/qqUEhZelA+RwdKLBcI8pLG0zhc+wL4puQ==
-----END RSA PRIVATE KEY-----
REQUEST ID      4e204cd1-4003-4e55-9eb5-0f18f3b06534




CHECK IF CAN REMOVE PASS-PHRASE FROM PRIVATE KEY FILE:

cd /nethome/admin/.starcluster/trash
openssl rsa -in private.pem-syoung -out private.pem-syoung-nopass
head -n 20 private.pem-syoung*

    ==> private.pem-syoung < ==
    -----BEGIN PRIVATE KEY-----
    MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAIECyxb2URs4jXN6HlIChSqdwXp7
    NDszRkZ+A9+j9sqSbFNmK1wNseU/HyLZEOyuuGMWQE85jpwlqC5QipmtWLzSYBiWQL9Zq1TQ4pEy
    05CwY9XswyEw1JgPXDA3jxKIOlacX1ahIh3Jec2bLANPM9V6YlYwxsJSsH2H5Wmk8+kTAgMBAAEC
    gYA8oGFsQwjOb/8ZO1QwWfrWkhgwROHAyFHIIsQTPuxlOfYqIyNROSZWgxlQuQ1ZDKqd9gD2uieo
    fZHRYgwgN/Qw69GuDUt9HzcNQ5yDPm3Ofa0WcD0tQa9YToHqEWVQaddc8D6DLcOwBDEropf2OIqd
    4JFusmenVBSIETihVKX8cQJBAM3Zs6W4nWtDExw7QlucgiKC0/R5exBk+BGVBAGHHcBTy+WXFryc
    UEJbj6q/PEIdGFxFvcO6GUk8x0JFGBgEB28CQQCgcNVc2Ar3kN3BAeM0xM5SVWlDYjDZwq5KId72
    g6CI/tcfjdpIHNI7yGlMNj4YPKOW2CAZebPLj3C74wclPUadAkEAgOcVju33baaX/fLBz/pGp3PD
    ZHD59j8z9FabJpXEtJ4ErWWacEt2GseZRHPyOPhdO9LUTQ9pLCpqIH6B4vAK8wJAa0cnE16N7r1Z
    2Y1Wi9kwkBL2QI0uVtz6xyzgtfqLZC7qTvn9w4wp8rlt1vzKBlC9ncZDqGUdGHaADdGe3IKdbQJA
    TBQ5VR3WM0lx6BrxXtHlxmmTikQ1mTlEdkjL4xJ9iXw7cRIIVdDzAait4TwuoxWxNODHlfMxK4ul
    8zcEE5bSlw==
    -----END PRIVATE KEY-----

    ==> private.pem-syoung-nopass < ==
    -----BEGIN RSA PRIVATE KEY-----
    MIICXAIBAAKBgQCBAssW9lEbOI1zeh5SAoUqncF6ezQ7M0ZGfgPfo/bKkmxTZitc
    DbHlPx8i2RDsrrhjFkBPOY6cJaguUIqZrVi80mAYlkC/WatU0OKRMtOQsGPV7MMh
    MNSYD1wwN48SiDpWnF9WoSIdyXnNmywDTzPVemJWMMbCUrB9h+VppPPpEwIDAQAB
    AoGAPKBhbEMIzm//GTtUMFn61pIYMEThwMhRyCLEEz7sZTn2KiMjUTkmVoMZULkN
    WQyqnfYA9ronqH2R0WIMIDf0MOvRrg1LfR83DUOcgz5tzn2tFnA9LUGvWE6B6hFl
    UGnXXPA+gy3DsAQxK6KX9jiKneCRbrJnp1QUiBE4oVSl/HECQQDN2bOluJ1rQxMc
    O0JbnIIigtP0eXsQZPgRlQQBhx3AU8vllxa8nFBCW4+qvzxCHRhcRb3DuhlJPMdC
    RRgYBAdvAkEAoHDVXNgK95DdwQHjNMTOUlVpQ2Iw2cKuSiHe9oOgiP7XH43aSBzS
    O8hpTDY+GDyjltggGXmzy49wu+MHJT1GnQJBAIDnFY7t922ml/3ywc/6Rqdzw2Rw
    +fY/M/RWmyaVxLSeBK1lmnBLdhrHmURz8jj4XTvS1E0PaSwqaiB+geLwCvMCQGtH
    JxNeje69WdmNVovZMJAS9kCNLlbc+scs4LX6i2Qu6k75/cOMKfK5bdb8ygZQvZ3G
    Q6hlHRh2gA3RntyCnW0CQEwUOVUd1jNJcega8V7R5cZpk4pENZk5RHZIy+MSfYl8
    O3ESCFXQ8wGoreE8LqMVsTTgx5XzMSuLpfM3BBOW0pc=
    -----END RSA PRIVATE KEY-----

</entry>

<entry [Fri Dec 24 14:20:12 EST 2010] PROBLEM: SETUID DOESN'T WORK WITH PERL 5.12.2 AND /usr/bin/suidperl CAN'T FIND Moose:>
    
    
PROBLEM: SETUID DOESN'T WORK WITH PERL 5.12.2 AND /usr/bin/suidperl CAN'T FIND Moose:

/usr/bin/suidperl /agua/bin/apps/cluster/starcluster.pl copyConfig --username admin
Can't locate Moose/Role.pm in @INC (@INC contains: /agua/bin/apps/cluster/../../../lib/ /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi /usr/lib/perl5/site_perl/5.8.8 /usr/lib/perl5/site_perl /usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi /usr/lib/perl5/vendor_perl/5.8.8 /usr/lib/perl5/vendor_perl /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi /usr/lib/perl5/5.8.8 .) at /agua/bin/apps/cluster/../../../lib//Conf.pm line 25.


SOLUTION:

1. USE C SCRIPT AS WRAPPER:

cd /var/www/cgi-bin/agua/0.5
emacs wrap.c
#include < unistd.h>
#include < stdlib.h>
#include < stdio.h>

int main() {
	execl("/var/www/cgi-bin/agua/0.5/testsuid.pl");
	return 1;
}

gcc wrap.c -o wrap
chmod 4711 wrap

#### SET testsuid.pl SO IT WILL ONLY RUN IF CALLED BY root
chmod 700 testsuid.pl


./wrap
Content-type: text/html

< input type="button" onClick="window.open('../../../agua/0.5/init-log.html', '_blank', 'toolbar=1,location=0,directories=0,status=0,menubar=1,scrollbars=1,resizable=1,navigation=0')" value="Click to view Progress Log">< br>
RUNNING AS:root




</entry>

<entry [Fri Dec 24 14:20:11 EST 2010] MANUALLY INSTALLED LATEST PERL 5.8 AND Moose ON TOP>

FIX ERROR IN perl.c:

http://www.perlmonks.org/?node_id=731836
Re: suidperl doesn't work in newly built perl
by cmac on Dec 22, 2008 at 05:54 UTC
Found and fixed:
in perl.c in release 5.8.9, line 3727 is        if (*suidscript) {
                                      should be if (*suidscript != 1) 

INSTALL PERL 5.8.9

-Dd_dosuid=define, which made the Configure query "Do you want to do setuid/setgid emulation?" get answered "yes".

#./Configure -Dd_dosuid=define -d
./Configure -d
make
make install
perl -v


CPAN INSTALL Module::Build

    OK


MANUALLY INSTALL Moose DEPENDENCIES

cd /root/base/apps/perl/modules/
    
cd ../Data-OptList-0.106   
cd ../Exporter-5.63
cd ../Test-Simple-0.96
cd ../Try-Tiny-0.09
cd ../Test-Fatal-0.003
cd ../Sub-Uplevel-0.22T21
cd ../Test-Requires-0.06
cd ../Test-Exception-0.31
cd ../List-MoreUtils-0.30
cd ../Params-Util-1.03
cd ../Sub-Install-0.925
cd ../Package-DeprecationManager-0.10
cd ../Algorithm-C3-0.06 
cd ../Class-C3-0.23   
cd ../MRO-Compat-0.11
cd ../Scope-Guard-0.20
cd ../Sub-Exporter-0.982
cd ../Devel-GlobalDestruction-0.03

cd ../Package-Stash-0.13 (NB: LATEST VERSION IS 0.20 - INSTALLED BELOW)

cd ../Sub-Name-0.05
cd ../Task-Weaken-1.03
cd ../Class-MOP-1.11
cd ../Moose-1.21
cd ../Moose-Policy-0.05
cd ../MooseX-Params-Validate-0.15
cd ../PadWalker-1.92
cd ../Devel-Caller-2.05
cd ../YAML-0.72



cd ../Module-Load-0.18
cd ../Module-CoreList-2.42
cd ../Params-Check-0.26
cd ../version-0.88
cd ../IPC-Cmd-0.66
cd ../Locale-Maketext-Simple*
cd ../Module-Load-Conditional-0.38
# install file::spec, which is inside:
cd ../PathTools-3.33

cd ../ExtUtils-CBuilder-0.2802
cd ../ExtUtils-ParseXS-2.2206
cd ../Module-Build-0.3607

cd ../Params-Validate-0.95




MooseX::Declare
---------------

PREREQUISITES:

namespace::clean 0.11
namespace::autoclean 0.09

    B::Hooks::EndOfScope 0

    namespace::clean 0.11
        Package::Stash 0.18 We have 0.13.
            Package::Stash::XS
        Sub::Identify 0.04


    MooseX::Types 0.19
        (NB: INCLUDES ADDITIONAL MooseX::Declare DEPENDENCIES:
        
            MooseX::Types::Moose
            MooseX::Types::Util 0

        )

        Warning: prerequisite Carp::Clan 6.00 not found.

    Devel::Declare 0.005011

    ExtUtils::Depends
    B::Hooks::OP::Check
        parent
        
    MooseX::Method::Signatures 0.36
        (contains
            MooseX::Method::Signatures::Meta::Method 0
            MooseX::Method::Signatures::Types 0
        )
                
    B::Hooks::EndOfScope 0.07
         Variable::Magic
         
    Context::Preserve 0
        ok (Test-use-ok)
        
    Devel::Declare 0.005011
    MooseX::LazyRequire 0.06
        Warning: prerequisite MooseX::Types::Moose 0 not found.
        
            Warning: prerequisite Carp::Clan 6.00 not found.
        
    
    MooseX::Meta::TypeConstraint::ForceCoercion 0
    
    MooseX::Types::Structured 0.20
        Warning: prerequisite DateTime 0 not found.
        
        Warning: prerequisite Devel::PartialDump 0.13 not found.
        Warning: prerequisite MooseX::Types::DateTime 0 not found. 
    
            Warning: prerequisite DateTime::Locale 0.4001 not found.
            Warning: prerequisite DateTime::TimeZone 0.95 not found.
                Class::Load is not installed
                Class::Singleton is not installed
            
    aliased 0
    
    Parse::Method::Signatures 1.003011
        ( NB: CONTAINS THESE MODULES:        
            Parse::Method::Signatures::TypeConstraint 0
            Parse::Method::Signatures::Types 0
        )
    
        Test::Differences         ...missing.
            Text::Diff
            
        MooseX::Traits            ...missing. (would need 0.06)
        PPI                       ...missing. (would need 1.203)
    
        Warning: prerequisite Class::Inspector 1.22 not found.
        Warning: prerequisite Clone 0.30 not found.
        Warning: prerequisite File::Remove 1.42 not found.        
        Warning: prerequisite IO::String 1.07 not found.
        Warning: prerequisite Storable 2.17 not found.
        
        Warning: prerequisite Test::NoWarnings 0.084 not found.
            Test::Tester 0.107
            
        Warning: prerequisite Test::Object 0.07 not found.
        Warning: prerequisite Test::SubCalls 1.07 not found.
            Warning: prerequisite Hook::LexWrap 0.20 not found
    
    Test::Pod 0



MooseX::Role::Parameterized 0.12

Warning: prerequisite MooseX::Method::Signatures 0.36 not found.
    Parse::Method::Signatures 1.003011
    Parse::Method::Signatures::TypeConstraint 0
    Parse::Method::Signatures::Types 0

Warning: prerequisite MooseX::Method::Signatures::Meta::Method 0 not found.
Warning: prerequisite MooseX::Method::Signatures::Types 0 not found.






INSTALL Module::Builder with CPAN

perl -MCPAN -e shell

install Module::Load::Conditional
install IPC::Cmd
install ExtUtils::CBuilder
install Module::Build



INSTALL Moose ON PERL 5.8.8

perl -MCPAN -e shell

install DROLSKY/Moose-1.09.tar.gz
install MooseX::FollowPBP

install Params::Validate
install IPC::Cmd

install MooseX::Params::Validate
install Moose::Util::TypeConstraints
install Try::Tiny
install Getopt::Long::Descriptive
install MooseX::Getopt

INSTALL MOOSEX::DECLARE
-----------------------
install aliased
install Carp::Clan
install Sub::Identify
install Variable::Magic
install B::Hooks::EndOfScope

install Module::Load
install Module::Load::Conditional
install IPC::Cmd
install ExtUtils::CBuilder


install Module::Build

install Devel::PartialDump
install Test::Tester
install Hook::LexWrap
install Clone

install Text::Diff
install Test::SubCalls
install Test::Differences
install Params::Validate
install Pod::Simple
install Try::Tiny

install namespace::clean
install Pod::Escapes
install ExtUtils::Depends

install MooseX::Declare






PROBLEM: CAN'T FIND Moose WHEN USING /usr/bin/perl

FIX PERL 5.12.2 PROBLEM:

REMOVE /usr/bin/perl (WHICH WAS POINTING TO PERL 5.8.8) AND REPLACE IT WITH /usr/local/bin/perl (WHICH POINTS TO PERL 5.12.2):

mv /usr/bin/perl /usr/bin/perl-old
ln -s /usr/local/bin/perl /usr/bin/perl
ln -s /usr/local/bin/perl /usr/bin/perl5.12.2




NB: PERL 5.12.2 DOES NOT SUPPORT SETUID, THOUGH IT DOES HAVE THESE CONFIGURE OPTIONS:

make suidperl
make test
make install


http://search.cpan.org/~mschilli/Perl-Configure-0.08/lib/Perl/Configure.pm
setuid-emu      Do you want to do setuid/setgid emulation?      
setuid-secure   Does your kernel have *secure* setuid scripts?      

./Configure -Dsetuid-emu=y -d

http://search.cpan.org/~mschilli/Perl-Configure-0.08/lib/Perl/Configure.pm




PROBLEM: COULD NOT RUN starcluster AS apache

su apache
starcluster

    ..
    The following error occurred while trying to extract file(s) to the Python egg
    cache:
    
      [Errno 13] Permission denied: '/var/www/.python-eggs'
    
    The Python egg cache directory is currently set to:
    
      /var/www/.python-eggs

    Perhaps your account does not have write access to this directory?  You can
    change the cache directory by setting the PYTHON_EGG_CACHE environment
    variable to point to an accessible directory.
    ...

SOLUTION:

CHANGED OWNERSHIP OF www AND RELAXED PERMISSIONS ON /tmp/starcluster-debug.log:

cd /var
chown apache www
chmod 777 /tmp/starcluster-debug.log

THEN IT WORKED:

su apache
starcluster

    OK





PROBLEM: init.cgi RUNNING AS apache USER

SOLUTION: NEEDED TO USE ./init.cgi TO MIMIC RUNNING AS APACHE:


TESTED ON testsuid.pl AND HAD TO RUN 'chmod +xs' TO GET THIS ERROR:

SETUID DIDN'T WORK AFTER THIS:

chown root:root testsuid.pl
chmod u+s testsuid.pl
chmod g+s testsuid.pl

bash-3.2$ ./testsuid.pl

    whoami: apache


BUT WORKED AFTER THIS:

chmod +xs testsuid.pl

    ---sr-sr-x 1 root root   156 Dec 29 13:59 testsuid.pl

bash-3.2$ ./testsuid.pl

    whoami: root

</entry>

<entry [Fri Dec 24 14:20:10 EST 2010] DESCRIBE KEYPAIRS FOR JGILBERT>
    

ec2dkey

    KEYPAIR ec2-keypair1    48:18:33:d1:5a:4b:25:53:01:c6:c0:c9:d3:2a:ac:6c:0e:d1:f4:43
    KEYPAIR aquarius        03:b7:c5:f0:a6:e7:6b:af:3d:8a:68:ff:ec:f1:d6:05
    KEYPAIR agua    0d:d8:03:2c:72:81:68:36:67:41:bf:db:28:a5:f1:33:9e:97:8b:02



COPIED ec2-keypair1 KEYPAIR TO LINODE:

emacs /root/base/apps/ec2/keypair/jgilbert/id_rsa-ec2-keypair1
KEYPAIR	ec2-keypair1	48:18:33:d1:5a:4b:25:53:01:c6:c0:c9:d3:2a:ac:6c:0e:d1:f4:43
-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEA71KvDgpLRsQGS2JdsjbGIiubEZwHDzb2blt2u47K42h+4I6ExKMOnLzBK77V
MHImhShhtTk9TrRD2x+HVCGK5JrcE6b2917Hz78DwIU97FKnCbuHJ16sqidVotitRaZsEO40jV+c
qSI/dd2+AMaV6CGFL9/PpnvZGw9kGbJLg7ogeWe9v2Q6D5y8BF0i2IUuz2ihGxCImDX686nJNjyM
xzhoMh5atQRXxc/kBcMob1rJiiUQKd/Z8yUoCN3eJct1Z1MiKSJ14v+a4dw9G5l9UdOK7efQKWWl
lIb7Dk3dt0/zmiCD5Tn1w57dzbG1ToQihK0iGGzvk1KHzTUYRnUzHQIDAQABAoIBAA1Pfvb78ZXc
/zCgJu/rhfeOj1BaajYZa3lV0vO5jGU7gZsBsjaxjvV+tgu10GuiXawYQ97tcRB4jDGavk8aknwG
dOkO5zt45QoT6KSDhJ8pNasf5/Nzm4zXJTcqb/CowefrJ7cZM0Bg7ECk9ZVbdijz/FFeVFFBICEW
KQ4Y0YRg8TSwvqEIsDXVxQ1bznTwCVNPTR6Z+B5sNmOuc9Pukjnvu6Bk++rBKHhF+tGqQmW1sv5g
xhNszGwImthpZBK+SJZXnbNfccaRuvxJ3Q5uOT/14OwlQ6QzX2om8eUVyGLa88BwRyknBf8KdUbG
w9TgGNVvrC5W/eW5jn4TEsaxm00CgYEA/ca8XGy3HRxkO3XEqr2JGA32Fb6Cux6quWH+1Zvs2NpA
AKQckkakKIOtcM6hDm3wUF60EBYmWMkUzaRO+sDIgVaovWprPJ+cItVxaqGJcLfESzH/vF9ZBHpF
fv27vnrb5tD5p8Ukk/V4xLweUIhgbYji++lPINGXcnmoSzkX3T8CgYEA8WuG1iLlNlZ2LMKCAevA
3SPe0FZd/lReCgWiRvFNX8AqFw77gqNBjBOJ06ulAwqcFCs/PkoqB2RJCi9x/QUwOwbjj3KSnyuv
NiseqkhjXkUje/4NmMc9L/2BUsP4EUkAVU8nlyBIAn6K7jW+MXVyUX7zHzrnSj8iqXldr1wjrKMC
gYEA5LcNIhtU+SaSa0hbhCon+Ybzp2s4tV4RLdzU6D2MO3CPyEQf//Esl9r9ILMJUlDhCf4gOHNO
AizP0/pmt/Wxf2fT0kqr9UpAVOCbRCfsD6t/fOnF+0bPmop8QdR6NVTTBXaH2p2BttvACUcl5xzS
E0YQlEsUZpae8KwWch01lc8CgYAgC3DDXbBlDQb0nADbtmpMMCW0K7KgPpyY4fSPTBpEGmK72s5B
od/icvl5cjAd/juHZdIoN3nqr0IOqwuLVTP4scpk0QVrQUYpf4G7go5GBhFWtPsjC1cw1opi7QYx
bSoxKKeNpMhKJHfWdKXBNOCutpYY0B3BOi4kpqpry2Qk1wKBgBYN1glA5gvsZMzyBcESx+W0u142
LXztx8mYALCRNRi33PVqoDsO4jpWmdkN1sRvabFzRaSOi/ucxeat9YGnyHhjbQ1As6ElQw9d4qdG
dmFCttm6YTjpvoyCQs1DuFoH3AV1Z/tUMd5W/tBcFUnku5h8UsMoujq+7H40mpYZ7Dre
-----END RSA PRIVATE KEY-----

chmod 600 /root/base/apps/ec2/keypair/jgilbert/id_rsa-ec2-keypair1


COPIED starcluster-1 KEYPAIR TO LINODE:

emacs /root/base/apps/ec2/keypair/jgilbert/id_rsa-starcluster-1
KEYPAIR starcluster-1   12:a9:09:e0:08:4a:a5:bf:fc:45:68:bf:0e:5e:19:b6:d8:0b:dc:28
-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAkWvDJrk5HkS0Tswd/I58Ias89z4qrNbTD2UtU4cyMPoUojEqy15Le4iC5aoe
Ynr0+IieTFnT9xpvpmrVk3GXbT2tJDyjgP3qJYqS/3yM2JMjM6JvZk9q+H6pU/q8fNCdKcmDJ6To
b0PLPh72zkSVSi4g3RljIvLTQS1IT1fQU2Dnv3CAkqCjzgNDxmI2o+Zv8Y2iTYjzK2fMIZBc+Dg7
DlR9+Ot6hSvmS5IzoLW36f3Wi4nUcP46Q2k+rjg6hWb/FK4KsZWvm79i0WjhLgMkkBhKBje1sO5m
3jHNpQZqeMymS9pV9F9vQdk0pWHhaAS4LiFh2k495LMTSwfAfm5IWQIDAQABAoIBAEvhVDpfihtu
NDutrLP9UW5sIOrOSIxZqFYvMECWmi0OQTgEudTWhkKWj97xLtuqVytcdmVWthEJfVr0Ai/mpOI+
vZrb/WEwnT4rmdqwjfnwhPzLdJ+JL0MtLIQCoNnsLSYB3WsRVKvCT0pB8/zbsp67hTB5r84rsOog
i8vDAZSPgVugRPCTgM8aVAnI4twpI/a5H1JyqawthC8VY8FjsdJ6g2mZEa8b8/r9MZdkDXlJcfJd
+9/fd1cotwo0T9YwjV2qtgZ1HLVZjGsj70nZ6r/IMEaVUkEYFInnR7JdAjGaHJqc3NJhvDx4LcmL
pN8Nze2u2R9N6/Q3oDyRZpTfCcUCgYEAz2Gzem51cWw56YYxnlqdZqV+N9vSibfxVbej+6Ueb2zd
Vh26Z1miL7P4U/30TPNld3MRsuUPOKVK1PyZS6VTfMMd7AkpWWRm/2Twuviwkmn4oiJ3scAvSJI3
DuJT10BNGjbRa9P2YWjylcrJB3BT7yBPOne4aZUM9z96u/W/f98CgYEAs4NnRlH63x4kRPeTachc
W1pCtbRcYF8k7APRJ5gNIKIk6EyG1TMG1Y4MLlbuoIQNTTZ9IUF3q3idA+Y4+v+5aRL06BVb5W2Y
OyTHyFHs1rF93f4xmiyxNkg84Tqahpg8IFwzeha4IcfzCbYuiBhTGvCqGuHcz1ygFHPshBYiXscC
gYAXOe4MDEsDBQgHa4wrHCL82BQm1WvjGMLiwsqO6JNcD2lKt9GkuZk8ln99iLfP1oLKugyFaLon
sfuLly7kFgQfuQqk4PHMnT4b5IZBqpC8FTpPjmSxd8DT8+xOsnKJbR41jWYvGXJCvqpMtIWHW8FK
yueUuMvip1roZies3X0xKQKBgQCN3Ict1DVsQzaoZfpR+2u5KbBURg9GfYoBFdcg8hFVu61tAqT/
MQ7yjwnjSQHVSeX1Id1q/YCjunJjFXnsKVENz1RJYC+6NIy8GInlLZD77VIpr+rlCvKUkivCVfyt
5vqFHDf2AKRM1eWjxBwrowVx4cSb7+f+2xUKdL3xeEh7GwKBgQDAM1aw+ZqXzlTBIMGISkGDN36b
xgXA0kzF3MXT9z0Kp25hOsWlakz+T9azU/6ufvedwi5zTblfnbCBQ/Jd4+KVo06a0spGwVBbSfB0
Sj8pl2bLczSvD2GC6/BJR5M7vNBvKNFchT7HVJMBBfLomfKRAhZ+dtVxrxaaEzMIdcFC/A==
-----END RSA PRIVATE KEY-----

chmod 600 /root/base/apps/ec2/keypair/jgilbert/id_rsa-starcluster-1



REM: DEFAULT id_rsa KEY ON LINODE

cat /root/.ssh/id_rsa                                                        
-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEA71KvDgpLRsQGS2JdsjbGIiubEZwHDzb2blt2u47K42h+4I6E
xKMOnLzBK77VMHImhShhtTk9TrRD2x+HVCGK5JrcE6b2917Hz78DwIU97FKnCbuH
J16sqidVotitRaZsEO40jV+cqSI/dd2+AMaV6CGFL9/PpnvZGw9kGbJLg7ogeWe9
v2Q6D5y8BF0i2IUuz2ihGxCImDX686nJNjyMxzhoMh5atQRXxc/kBcMob1rJiiUQ
Kd/Z8yUoCN3eJct1Z1MiKSJ14v+a4dw9G5l9UdOK7efQKWWllIb7Dk3dt0/zmiCD
5Tn1w57dzbG1ToQihK0iGGzvk1KHzTUYRnUzHQIDAQABAoIBAA1Pfvb78ZXc/zCg
Ju/rhfeOj1BaajYZa3lV0vO5jGU7gZsBsjaxjvV+tgu10GuiXawYQ97tcRB4jDGa
vk8aknwGdOkO5zt45QoT6KSDhJ8pNasf5/Nzm4zXJTcqb/CowefrJ7cZM0Bg7ECk
9ZVbdijz/FFeVFFBICEWKQ4Y0YRg8TSwvqEIsDXVxQ1bznTwCVNPTR6Z+B5sNmOu
c9Pukjnvu6Bk++rBKHhF+tGqQmW1sv5gxhNszGwImthpZBK+SJZXnbNfccaRuvxJ
3Q5uOT/14OwlQ6QzX2om8eUVyGLa88BwRyknBf8KdUbGw9TgGNVvrC5W/eW5jn4T
Esaxm00CgYEA/ca8XGy3HRxkO3XEqr2JGA32Fb6Cux6quWH+1Zvs2NpAAKQckkak
KIOtcM6hDm3wUF60EBYmWMkUzaRO+sDIgVaovWprPJ+cItVxaqGJcLfESzH/vF9Z
BHpFfv27vnrb5tD5p8Ukk/V4xLweUIhgbYji++lPINGXcnmoSzkX3T8CgYEA8WuG
1iLlNlZ2LMKCAevA3SPe0FZd/lReCgWiRvFNX8AqFw77gqNBjBOJ06ulAwqcFCs/
PkoqB2RJCi9x/QUwOwbjj3KSnyuvNiseqkhjXkUje/4NmMc9L/2BUsP4EUkAVU8n
lyBIAn6K7jW+MXVyUX7zHzrnSj8iqXldr1wjrKMCgYEA5LcNIhtU+SaSa0hbhCon
+Ybzp2s4tV4RLdzU6D2MO3CPyEQf//Esl9r9ILMJUlDhCf4gOHNOAizP0/pmt/Wx
f2fT0kqr9UpAVOCbRCfsD6t/fOnF+0bPmop8QdR6NVTTBXaH2p2BttvACUcl5xzS
E0YQlEsUZpae8KwWch01lc8CgYAgC3DDXbBlDQb0nADbtmpMMCW0K7KgPpyY4fSP
TBpEGmK72s5Bod/icvl5cjAd/juHZdIoN3nqr0IOqwuLVTP4scpk0QVrQUYpf4G7
go5GBhFWtPsjC1cw1opi7QYxbSoxKKeNpMhKJHfWdKXBNOCutpYY0B3BOi4kpqpr
y2Qk1wKBgBYN1glA5gvsZMzyBcESx+W0u142LXztx8mYALCRNRi33PVqoDsO4jpW
mdkN1sRvabFzRaSOi/ucxeat9YGnyHhjbQ1As6ElQw9d4qdGdmFCttm6YTjpvoyC
Qs1DuFoH3AV1Z/tUMd5W/tBcFUnku5h8UsMoujq+7H40mpYZ7Dre
-----END RSA PRIVATE KEY-----


</entry>

<entry [Thu Dec 23 00:20:18 EST 2010] LINKS>

AMAZON DOCS
http://aws.amazon.com/documentation/

AMAZON KEYS
http://support.rightscale.com/03-Tutorials/01-RightScale/3._Upgrade_Your_Account/1.5_Sign-up_for_AWS

http://docs.amazonwebservices.com/AWSSecurityCredentials/1.0/AboutAWSCredentials.html

AMAZON ECONOMICS
http://aws.amazon.com/economics/

MPI ON EC2
http://mumrah.net/2009/05/mpi-running-on-amazon-ec2/

SMALL CLOUD COMPANY
http://cloudcarpenters.com/ideas/

AMAZON KEYS
http://docs.amazonwebservices.com/AWSSecurityCredentials/1.0/AboutAWSCredentials.html#AccessKeys


</entry>

<entry [Wed Dec 22 19:40:31 EST 2010] DOWNLOAD JBROWSE DATA TO /data EBS VOLUME USING AQUARIUS-6>

init.html:

snap-55fe4a3f

MOUNT /data, THEN DO:

mkdir /data/jbrowse
cd /data/jbrowse
wget http://jbrowse.org/releases/data/ucsc/hg19mini-2.tar.gz


echo '{"username":"agua","mode":"init","data":{"username":"admin","amazonuserid":"728213020069","datavolume":"snap-55fe4a3f","uservolume":"","datavolumesize":40,"uservolumesize":100,"datavolumecheckbox":1,"uservolumecheckbox":0,"ec2publiccert":"-----BEGIN CERTIFICATE-----\nMIICeDCCAeGgAwIBAgIGAPU26XvIMA0GCSqGSIb3DQEBBQUAMFMxCzAJBgNVBAYTAlVTMRMwEQYDVQQKEwpBbWF6b24uY29tMQwwCgYDVQQLEwNBV1MxITAfBgNVBAMTGEFXUyBMaW1pdGVkLUFzc3VyYW5jZSBDQTAeFw0xMDEwMDQxODE0MzlaFw0xMTEwMDQxODE0MzlaMFMxCzAJBgNVBAYTAlVTMRMwEQYDVQQKEwpBbWF6b24uY29tMRcwFQYDVQQLEw5BV1MtRGV2ZWxvcGVyczEWMBQGA1UEAxMNMWdjbG41ZW5qYXcxNDCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEArakx/b3BIYoal1of5iVhZTtgGkFz5InF582kyAviP2Mceou9vcc+RdXHIc4PgTU7N37t5wGP8j9SA7u5dFWxb4TRNONqX6iPskF2DfUKlfFK1mXEp8h7ucGBbY9D4BHu07zQhNczfnjsqGlrRfmBCtrTCFNPy58KuyXceZOb5xMCAwEAAaNXMFUwDgYDVR0PAQH/BAQDAgWgMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMCMAwGA1UdEwEB/wQCMAAwHQYDVR0OBBYEFA2qXsSYvwsst1nAdM9SbVpWytCWMA0GCSqGSIb3DQEBBQUAA4GBAAtHxmSUKGMxiJXy8LjYg1DAG0Z1VYh8juWAzsYLk8I19AqvDp/Z4hB3OeGCmTyY31siCdaAwhkWHX+OIS91HzUi1Uy8774I4O3Ar1wqF5keR25avv/QZREJ68k8yucb7U/+9ds3/uPd2JHq+HyADQfPQUEJwUC8PMLuYkyOikXi\n-----END CERTIFICATE-----","ec2privatekey":"-----BEGIN PRIVATE KEY-----\nMIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAK2pMf29wSGKGpdaH+YlYWU7YBpBc+SJxefNpMgL4j9jHHqLvb3HPkXVxyHOD4E1Ozd+7ecBj/I/UgO7uXRVsW+E0TTjal+oj7JBdg31CpXxStZlxKfIe7nBgW2PQ+AR7tO80ITXM3547Khpa0X5gQra0whTT8ufCrsl3HmTm+cTAgMBAAECgYBB8ilYuRE5Ik+cwA2zAOjuX1DMR6Sx2Zu8vfvgN5sQBRwQcTZ5dcrxDBBVhwGeSE+XcGz5Nz+pd2A2qLfxNIVvOSqrFHWGLylyPxfp/L3gpvXz/5N+eZ6Y9PT18NiYWmpXEXcKEDT+Msg8Io8CiivYU+cSs1yCq1becopC+EftqQJBAPI/j6T9BlFWO2e4Bu8xxKST3Xc5Q7+6Ux3v7h0bRD225dxrE/ML1/N36GwJq7joWHtscK6+jLJOgm4uBQ9sq+UCQQC3hOXiBHDRVtk8Pn6goRTPxMxAixoqbCP6DDogkigIpuJ4iEvmAYEE4XVfqC1bjay/oHU9hn8AOP0XwAJKHkeXAkAnu28W830eyBL0PwW8I6CKEcqILHdFMg1B4sFeOsOlj6MB1PovqeiggTE4zxlAObORgsa0koJHGINiCOBBmGRVAkEAhfMHw9fP7MxCVVmcHWxVf206VGXznEFAZTNlff6QH/iHVsjM9T3lyQUzIbXkHW4kR947lMPFkQkHmr04Lpc5UwJASiBGFuHXymAL3LzH1tGxZLbWvoXgkLGEJHG2Badq9ADhxHM5OVgq8mV2oG9JJDR0NXZ3GIQGUOVC4ibdjDymrg==\n-----END PRIVATE KEY-----","awsaccesskeyid":"AKIAIZXZ6S7ARZ44TTHQ","secretaccesskey":"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"}}' | perl -U init.cgi



NOTES
-----

PROBLEM: 

init.cgi RUNS MOUNT COMMAND BUT DOES NOT MOUNT:

string: mount -o nouuid /dev/sdh /data
AWS::mountData    mount_command: mount -o nouuid /dev/sdh /data



DIAGNOSIS

SETUID DOESN'T WORK PROPERLY WHEN RUNNING ON COMMAND LINE AS apache USER


SOLUTION

RUN IN BROWSER AND WORKS OK




fdisk -l

Disk /dev/sda1: 10.7 GB, 10737418240 bytes
255 heads, 63 sectors/track, 1305 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

Disk /dev/sda1 doesn't contain a valid partition table

Disk /dev/sdh: 42.9 GB, 42949672960 bytes
255 heads, 63 sectors/track, 5221 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

Disk /dev/sdh doesn't contain a valid partition table


REBOOT AND /data WILL NOT MOUNT CORRECTLY:

mount -t ext3 /dev/sdh /data
mount: wrong fs type, bad option, bad superblock on /dev/sdh,
       missing codepage or other error
       In some cases useful info is found in syslog - try
       dmesg | tail  or so
       
       


dmesg | tail
ext3_abort called.
EXT3-fs error (device sdh): ext3_journal_start_sb: Detected aborted journal
Remounting filesystem read-only
end_request: I/O error, dev sdh, sector 12360
Buffer I/O error on device sdh, logical block 1545
lost page write due to I/O error on sdh
end_request: I/O error, dev sdh, sector 2
EXT3-fs: unable to read superblock
end_request: I/O error, dev sdh, sector 2
EXT3-fs: unable to read superblock



pvdisplay

to learn about the current state of your physical volumes:


	
	#### INITIALIZE PHYSICAL VOLUME
	##	pvcreate /dev/sdb1 /dev/sdc1 /dev/sdd1 /dev/sde1
	##	pvcreate
	##  Please enter a physical volume path
	##  Run `pvcreate --help' for more information.
	##	[root@domU-12-31-38-04-26-69 ~]# pvcreate --help
	##  pvcreate: Initialize physical volume(s) for use by LVM
	

REBOOT

 df -a
Filesystem            Size  Used Avail Use% Mounted on
/dev/sda1              10G  6.0G  3.5G  64% /
none                     0     0     0   -  /proc
none                     0     0     0   -  /sys
none                     0     0     0   -  /dev/pts
none                     0     0     0   -  /proc/sys/fs/binfmt_misc
[root@domU-12-31-38-04-26-69 ~]# ll /data
total 8.0K
drwxrwxrwx  2 root root 4.0K Dec 17 15:52 .
drwxr-xr-x 27 root root 4.0K Dec 24 03:42 ..
[root@domU-12-31-38-04-26-69 ~]# udevinfo -q all -p /dev/sdh
no record for '/dev/sdh' in database
[root@domU-12-31-38-04-26-69 ~]# udevinfo -q all -p /dev/sda1
no record for '/dev/sda1' in database






</entry>



<entry [Fri Dec 17 12:13:37 EST 2010] INSTALLED EC2 AMI TOOLS ON AQUARIUS-6>




1. EC2 AMI TOOLS INTRO
http://blog.chris-read.net/2009/04/08/ec2-ami-creation-tips-part2/


2. EC2 AMI TOOLS ARE DIFFERENT TO EC2 API TOOLS

Amazon EC2 API Tools:
The API tools serve as the client interface to the Amazon EC2 web service. Use these tools to register and launch instances, manipulate security groups, and more.
http://aws.amazon.com/developertools/351?_encoding=UTF8&jiveRedirect=1

Amazon EC2 AMI Tools:
The Amazon EC2 AMI Tools are command-line utilities to help bundle an Amazon Machine Image (AMI), create an AMI from an existing machine or installed volume, and upload a bundled AMI to Amazon S3.
http://aws.amazon.com/developertools/368?_encoding=UTF8&jiveRedirect=1


3. INSTALLED EC2 AMI TOOLS ON AQUARIUS-6

DOWNLOADED FROM HERE
http://aws.amazon.com/developertools/368?_encoding=UTF8&jiveRedirect=1

INSTALLED TO HERE:

cd /home/ec2/ami

[root@domU-12-31-38-01-85-C9 bin]# ll | grep bundle | grep -v cmd
-rwxrwxr-x 1 root root  183 Dec  2  2009 ec2-bundle-image
-rwxr-xr-x 1 root root  651 Dec  8  2009 ec2-bundle-instance
-rwxrwxr-x 1 root root  181 Dec  2  2009 ec2-bundle-vol
-rwxr-xr-x 1 root root  653 Dec  8  2009 ec2-cancel-bundle-task
-rwxrwxr-x 1 root root  184 Dec  2  2009 ec2-delete-bundle
-rwxr-xr-x 1 root root  656 Dec  8  2009 ec2-describe-bundle-tasks
-rwxrwxr-x 1 root root  186 Dec  2  2009 ec2-download-bundle
-rwxrwxr-x 1 root root  185 Dec  2  2009 ec2-migrate-bundle
-rwxrwxr-x 1 root root  180 Dec  2  2009 ec2-unbundle
-rwxrwxr-x 1 root root  184 Dec  2  2009 ec2-upload-bundle
-rwxr-xr-x 1 root root  651 Dec  8  2009 ec2bundle
[root@domU-12-31-38-01-85-C9 bin]# ll ../ami/ 
1.3.57676/ archive/   
[root@domU-12-31-38-01-85-C9 bin]# ll ../ami/
1.3.57676/ archive/   
[root@domU-12-31-38-01-85-C9 bin]# ll ../ami/1.3.57676/bin
total 44K
drwxrwxr-x 2 root root 4.0K Sep 27 02:17 .
drwxrwxr-x 5 root root 4.0K Sep 27 02:17 ..
-rwxrwxr-x 1 root root  183 Sep 27 02:17 ec2-ami-tools-version
-rwxrwxr-x 1 root root  183 Sep 27 02:17 ec2-bundle-image
-rwxrwxr-x 1 root root  181 Sep 27 02:17 ec2-bundle-vol
-rwxrwxr-x 1 root root  184 Sep 27 02:17 ec2-delete-bundle
-rwxrwxr-x 1 root root  186 Sep 27 02:17 ec2-download-bundle
-rwxrwxr-x 1 root root  185 Sep 27 02:17 ec2-migrate-bundle
-rwxrwxr-x 1 root root  187 Sep 27 02:17 ec2-migrate-manifest
-rwxrwxr-x 1 root root  180 Sep 27 02:17 ec2-unbundle
-rwxrwxr-x 1 root root  184 Sep 27 02:17 ec2-upload-bundle



</entry>



<entry [Fri Dec 17 12:12:37 EST 2010] AQUARIUS-6 STARCLUSTER CONFIGURATION>




LAUNCH AQUARIUS-6
-----------------

NEW IP: ec2-50-16-93-114.compute-1.amazonaws.com


EC2 Instance: i-303c3a5d
AMI ID: ami-707e8819	Zone: us-east-1a
Security Groups: default	Type: t1.micro
Status: running	Owner: 728213020069
VPC ID: -	Subnet ID: -
Virtualization: paravirtual	Placement Group:
Reservation: r-6169250b	RAM Disk ID: ari-b31cf9da
Platform: -	Key Pair Name: agua
Kernel ID: aki-b51cf9dc	Monitoring: basic
AMI Launch Index: 0	Elastic IP: -
Root Device: /dev/sda1	Root Device Type: ebs
Block Devices: /dev/sda1=vol-da0fd2b2:attached:2010-12-17T17:09:58.000Z:true, /dev/sdi=vol-dc0fd2b4:attached:2010-12-17T17:09:58.000Z:false
Lifecycle: normal
Public DNS: ec2-174-129-58-24.compute-1.amazonaws.com
Private DNS: domU-12-31-38-01-85-C9.compute-1.internal
Private IP Address: 10.253.138.55
Launch Time: 2010-12-17 12:09 EST


CONNECT:

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-58-24.compute-1.amazonaws.com



RAN STARCLUSTER
---------------

[
    SEE Notes-apps-starcluster.txt
    Thurs Dec 23 11:41:12 EST 2010
    RAN STARCLUSTER ON AQUARIUS-6
]


1. CREATE KEYPAIR FILE
----------------------

(COPIED FROM LINODE)

ON LINODE:

/root/base/apps/ec2/keypair
[root@li182-248 keypair]# cat id_rsa-starcluster-1 
KEYPAIR starcluster-1   12:a9:09:e0:08:4a:a5:bf:fc:45:68:bf:0e:5e:19:b6:d8:0b:dc:28
-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAkWvDJrk5HkS0Tswd/I58Ias89z4qrNbTD2UtU4cyMPoUojEqy15Le4iC5aoe
Ynr0+IieTFnT9xpvpmrVk3GXbT2tJDyjgP3qJYqS/3yM2JMjM6JvZk9q+H6pU/q8fNCdKcmDJ6To
b0PLPh72zkSVSi4g3RljIvLTQS1IT1fQU2Dnv3CAkqCjzgNDxmI2o+Zv8Y2iTYjzK2fMIZBc+Dg7
DlR9+Ot6hSvmS5IzoLW36f3Wi4nUcP46Q2k+rjg6hWb/FK4KsZWvm79i0WjhLgMkkBhKBje1sO5m
3jHNpQZqeMymS9pV9F9vQdk0pWHhaAS4LiFh2k495LMTSwfAfm5IWQIDAQABAoIBAEvhVDpfihtu
NDutrLP9UW5sIOrOSIxZqFYvMECWmi0OQTgEudTWhkKWj97xLtuqVytcdmVWthEJfVr0Ai/mpOI+
vZrb/WEwnT4rmdqwjfnwhPzLdJ+JL0MtLIQCoNnsLSYB3WsRVKvCT0pB8/zbsp67hTB5r84rsOog
i8vDAZSPgVugRPCTgM8aVAnI4twpI/a5H1JyqawthC8VY8FjsdJ6g2mZEa8b8/r9MZdkDXlJcfJd
+9/fd1cotwo0T9YwjV2qtgZ1HLVZjGsj70nZ6r/IMEaVUkEYFInnR7JdAjGaHJqc3NJhvDx4LcmL
pN8Nze2u2R9N6/Q3oDyRZpTfCcUCgYEAz2Gzem51cWw56YYxnlqdZqV+N9vSibfxVbej+6Ueb2zd
Vh26Z1miL7P4U/30TPNld3MRsuUPOKVK1PyZS6VTfMMd7AkpWWRm/2Twuviwkmn4oiJ3scAvSJI3
DuJT10BNGjbRa9P2YWjylcrJB3BT7yBPOne4aZUM9z96u/W/f98CgYEAs4NnRlH63x4kRPeTachc
W1pCtbRcYF8k7APRJ5gNIKIk6EyG1TMG1Y4MLlbuoIQNTTZ9IUF3q3idA+Y4+v+5aRL06BVb5W2Y
OyTHyFHs1rF93f4xmiyxNkg84Tqahpg8IFwzeha4IcfzCbYuiBhTGvCqGuHcz1ygFHPshBYiXscC
gYAXOe4MDEsDBQgHa4wrHCL82BQm1WvjGMLiwsqO6JNcD2lKt9GkuZk8ln99iLfP1oLKugyFaLon
sfuLly7kFgQfuQqk4PHMnT4b5IZBqpC8FTpPjmSxd8DT8+xOsnKJbR41jWYvGXJCvqpMtIWHW8FK
yueUuMvip1roZies3X0xKQKBgQCN3Ict1DVsQzaoZfpR+2u5KbBURg9GfYoBFdcg8hFVu61tAqT/
MQ7yjwnjSQHVSeX1Id1q/YCjunJjFXnsKVENz1RJYC+6NIy8GInlLZD77VIpr+rlCvKUkivCVfyt
5vqFHDf2AKRM1eWjxBwrowVx4cSb7+f+2xUKdL3xeEh7GwKBgQDAM1aw+ZqXzlTBIMGISkGDN36b
xgXA0kzF3MXT9z0Kp25hOsWlakz+T9azU/6ufvedwi5zTblfnbCBQ/Jd4+KVo06a0spGwVBbSfB0
Sj8pl2bLczSvD2GC6/BJR5M7vNBvKNFchT7HVJMBBfLomfKRAhZ+dtVxrxaaEzMIdcFC/A==
-----END RSA PRIVATE KEY-----



ON AQUARIUS-6:


emacs /agua/home/admin/.keypairs/id_rsa-starcluster-1
KEYPAIR starcluster-1   12:a9:09:e0:08:4a:a5:bf:fc:45:68:bf:0e:5e:19:b6:d8:0b:dc:28
-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAkWvDJrk5HkS0Tswd/I58Ias89z4qrNbTD2UtU4cyMPoUojEqy15Le4iC5aoe
Ynr0+IieTFnT9xpvpmrVk3GXbT2tJDyjgP3qJYqS/3yM2JMjM6JvZk9q+H6pU/q8fNCdKcmDJ6To
b0PLPh72zkSVSi4g3RljIvLTQS1IT1fQU2Dnv3CAkqCjzgNDxmI2o+Zv8Y2iTYjzK2fMIZBc+Dg7
DlR9+Ot6hSvmS5IzoLW36f3Wi4nUcP46Q2k+rjg6hWb/FK4KsZWvm79i0WjhLgMkkBhKBje1sO5m
3jHNpQZqeMymS9pV9F9vQdk0pWHhaAS4LiFh2k495LMTSwfAfm5IWQIDAQABAoIBAEvhVDpfihtu
NDutrLP9UW5sIOrOSIxZqFYvMECWmi0OQTgEudTWhkKWj97xLtuqVytcdmVWthEJfVr0Ai/mpOI+
vZrb/WEwnT4rmdqwjfnwhPzLdJ+JL0MtLIQCoNnsLSYB3WsRVKvCT0pB8/zbsp67hTB5r84rsOog
i8vDAZSPgVugRPCTgM8aVAnI4twpI/a5H1JyqawthC8VY8FjsdJ6g2mZEa8b8/r9MZdkDXlJcfJd
+9/fd1cotwo0T9YwjV2qtgZ1HLVZjGsj70nZ6r/IMEaVUkEYFInnR7JdAjGaHJqc3NJhvDx4LcmL
pN8Nze2u2R9N6/Q3oDyRZpTfCcUCgYEAz2Gzem51cWw56YYxnlqdZqV+N9vSibfxVbej+6Ueb2zd
Vh26Z1miL7P4U/30TPNld3MRsuUPOKVK1PyZS6VTfMMd7AkpWWRm/2Twuviwkmn4oiJ3scAvSJI3
DuJT10BNGjbRa9P2YWjylcrJB3BT7yBPOne4aZUM9z96u/W/f98CgYEAs4NnRlH63x4kRPeTachc
W1pCtbRcYF8k7APRJ5gNIKIk6EyG1TMG1Y4MLlbuoIQNTTZ9IUF3q3idA+Y4+v+5aRL06BVb5W2Y
OyTHyFHs1rF93f4xmiyxNkg84Tqahpg8IFwzeha4IcfzCbYuiBhTGvCqGuHcz1ygFHPshBYiXscC
gYAXOe4MDEsDBQgHa4wrHCL82BQm1WvjGMLiwsqO6JNcD2lKt9GkuZk8ln99iLfP1oLKugyFaLon
sfuLly7kFgQfuQqk4PHMnT4b5IZBqpC8FTpPjmSxd8DT8+xOsnKJbR41jWYvGXJCvqpMtIWHW8FK
yueUuMvip1roZies3X0xKQKBgQCN3Ict1DVsQzaoZfpR+2u5KbBURg9GfYoBFdcg8hFVu61tAqT/
MQ7yjwnjSQHVSeX1Id1q/YCjunJjFXnsKVENz1RJYC+6NIy8GInlLZD77VIpr+rlCvKUkivCVfyt
5vqFHDf2AKRM1eWjxBwrowVx4cSb7+f+2xUKdL3xeEh7GwKBgQDAM1aw+ZqXzlTBIMGISkGDN36b
xgXA0kzF3MXT9z0Kp25hOsWlakz+T9azU/6ufvedwi5zTblfnbCBQ/Jd4+KVo06a0spGwVBbSfB0
Sj8pl2bLczSvD2GC6/BJR5M7vNBvKNFchT7HVJMBBfLomfKRAhZ+dtVxrxaaEzMIdcFC/A==
-----END RSA PRIVATE KEY-----

chmod 600 /agua/home/admin/.keypairs/id_rsa-starcluster-1





2. EDIT CONFIG FILE
-------------------


rm -fr /root/.starcluster/config
emacs /root/.starcluster/config
####################################
## StarCluster Configuration File ##
####################################

[global]
# configure the default cluster template to use when starting a cluster
# defaults to 'smallcluster' defined below. this template should be usable
# out-of-the-box provided you've configured your keypair correctly
DEFAULT_TEMPLATE=smallcluster
# enable experimental features for this release
ENABLE_EXPERIMENTAL=False

[aws info]
# This is the AWS credentials section.
# These settings apply to all clusters
# replace these with your AWS keys


# STUART (NEW ACCESS KEYS)
#AWS_USER_ID=728213020069
#AWS_ACCESS_KEY_ID=AKIAIKZHIY7T75JIF34A
#AWS_SECRET_ACCESS_KEY=TGItbOygM1uKJkDchv9z02CdoiOi5TE97hvS7Ssw


# Stuart
AWS_ACCESS_KEY_ID=AKIAIZXZ6S7ARZ44TTHQ
AWS_SECRET_ACCESS_KEY=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
AWS_USER_ID=728213020069


# johhny
#AWS_ACCESS_KEY_ID = AKIAJWZIAB2ZZB7FHJIQ
#AWS_SECRET_ACCESS_KEY = 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
#AWS_USER_ID= 558277860346




# karen
AWS_ACCESS_KEY_ID = AKIAIKR6ZDBQA3RFJRUQ
AWS_SECRET_ACCESS_KEY = VqV/AWAgcZilaRUyn9M7KUgNLArrJjC9sO3pbrzX
AWS_USER_ID=684733399587


# Sections starting with "key" define your keypairs
# (see the EC2 getting started guide tutorial on using ec2-add-keypair to learn
# how to create new keypairs)
# Section name should match your key name e.g.:
[key starcluster-1]
KEY_LOCATION=/agua/home/admin/.keypairs/id_rsa-starcluster-1

KEYNAME = starcluster-1

# You can of course have multiple keypair sections
# [key my-other-gsg-keypair]
# KEY_LOCATION=/home/myuser/.ssh/id_rsa-my-other-gsg-keypair

# Sections starting with "cluster" define your cluster templates
# Section name is the name you give to your cluster template e.g.:
[cluster smallcluster]
# change this to the name of one of the keypair sections defined above 
KEYNAME = starcluster-1

# number of ec2 instances to launch
CLUSTER_SIZE = 2

# create the following user on the cluster
CLUSTER_USER = sgeadmin

# optionally specify shell (defaults to bash)
# (options: tcsh, zsh, csh, bash, ksh)
CLUSTER_SHELL = bash

# AMI for cluster nodes.
# The base i386 StarCluster AMI is ami-d1c42db8
# The base x86_64 StarCluster AMI is ami-a5c42dcc
NODE_IMAGE_ID = ami-d1c42db8
# instance type for all cluster nodes 
# (options: m1.large, c1.xlarge, m1.small, c1.medium, m1.xlarge, m2.4xlarge, m2.2xlarge)
NODE_INSTANCE_TYPE = m1.small

# Uncomment to specify a different instance type for the master node  (OPTIONAL)
# (defaults to NODE_INSTANCE_TYPE if not specified)
#MASTER_INSTANCE_TYPE = m1.small

# Uncomment to specify a separate AMI to use for the master node. (OPTIONAL)
# (defaults to NODE_IMAGE_ID if not specified)
#MASTER_IMAGE_ID = ami-d1c42db8 (OPTIONAL)

# availability zone to launch the cluster in (OPTIONAL)
# (automatically determined based on volumes (if any) or 
# selected by Amazon if not specified)
#AVAILABILITY_ZONE = us-east-1c

# list of volumes to attach to the master node and nfs share to worker nodes (OPTIONAL)
# (see "Configuring EBS Volumes" below for an example of defining volume sections)
#VOLUMES = oceandata, biodata

# list of plugins to load after StarCluster's default setup routines (OPTIONAL)
# (see "Configuring StarCluster Plugins" below for an example of defining a plugin section)
#PLUGINS = myplugin, myplugin2

###########################################
## Defining Additional Cluster Templates ##
###########################################

# You can also define multiple cluster templates.
# You can either supply all configuration options as with smallcluster above, or
# create an EXTENDS=< cluster_name> variable in the new cluster section to use all 
# settings from < cluster_name> as defaults. Below are a couple of example
# cluster templates that use the EXTENDS feature:

# [cluster mediumcluster]
# Declares that this cluster uses smallcluster as defaults
# EXTENDS=smallcluster
# This section is the same as smallcluster except for the following settings:
# KEYNAME=my-other-gsg-keypair
# NODE_INSTANCE_TYPE = c1.xlarge
# CLUSTER_SIZE=8
# VOLUMES = biodata2

# [cluster largecluster]
# Declares that this cluster uses mediumcluster as defaults
# EXTENDS=mediumcluster
# This section is the same as mediumcluster except for the following variables:
# CLUSTER_SIZE=16

#############################
## Configuring EBS Volumes ##
#############################

# Using EBS volumes with StarCluster is relatively straight forward. You create
# a [volume] section that represents an EBS volume. The section name is a tag
# for your volume. This tag is used in the VOLUMES setting in a cluster template 
# to declare that an EBS volume is to be mounted and nfs shared on the cluster.
# (see the commented VOLUMES setting in the 'smallcluster' template above)
# Below are some examples of defining and configuring EBS volumes to be used
# with StarCluster:

# Sections starting with "volume" define your EBS volumes
# Section name tags your volume e.g.:
# [volume biodata]
# (attach 1st partition of volume vol-c9999999 to /home on master node)
# VOLUME_ID = vol-c999999
# MOUNT_PATH = /home

# Same volume as above, but mounts to different location
# [volume biodata2]
# (attach 1st partition of volume vol-c9999999 to /opt/ on master node)
# VOLUME_ID = vol-c999999
# MOUNT_PATH = /opt/

# Another volume example 
# [volume oceandata]
# (attach 1st partition of volume vol-d7777777 to /mydata on master node)
# VOLUME_ID = vol-d7777777
# MOUNT_PATH = /mydata

# Same as oceandata only uses the 2nd partition instead
# [volume oceandata]
# (attach 2nd partition of volume vol-d7777777 to /mydata on master node)
# VOLUME_ID = vol-d7777777
# MOUNT_PATH = /mydata
# PARTITION = 2

#####################################
## Configuring StarCluster Plugins ##
#####################################

# Sections starting with "plugin" define a custom python class
# which can perform additional configurations to StarCluster's default routines. These plugins 
# can be assigned to a cluster template to customize the setup procedure when
# starting a cluster from this template
# (see the commented PLUGINS setting in the 'smallcluster' template above) 
# Below is an example of defining a plugin called 'myplugin':

# [plugin myplugin]
# myplugin module either lives in ~/.starcluster/plugins or is 
# in your PYTHONPATH
# SETUP_CLASS = myplugin.SetupClass
# extra settings are passed as arguments to your plugin:
# SOME_PARAM_FOR_MY_PLUGIN = 1
# SOME_OTHER_PARAM = 2




3. START STARCLUSTER

cd /root/base/apps/starcluster/0.91.2
starcluster start physicscluster

    OK

LOGIN TO THE MASTER:

starcluster sshmaster physicscluster

    RSA key fingerprint is 1b:0c:0f:78:c0:55:1d:ba:73:b3:76:09:e6:11:37:84.
    Are you sure you want to continue connecting (yes/no)? yes
    Warning: Permanently added 'ec2-50-16-30-164.compute-1.amazonaws.com,10.254.131.130' (RSA) to the list of known hosts.
    Linux domU-12-31-39-00-7C-74 2.6.31-302-ec2 #7-Ubuntu SMP Tue Oct 13 19:06:04 UTC 2009 i686
    **********************************************************
    ** StarCluster - Ubuntu 9.10 Karmic AMI (alestic based) **
    **********************************************************
    
    mailing list: starcluster@mit.edu
    project homepage: http://web.mit.edu/starcluster
    built from alestic ami: ami-bb709dd2
    
    NOTE: Numpy/Scipy/Atlas have been custom compiled on this image.
    For now, please take care to avoid installing python-numpy, python-scipy,
    and liblapack* packages from apt-get as this will break these custom 
    installations.
    
      System information as of Wed Dec 22 21:48:41 UTC 2010
    
      System load: 0.06              Memory usage: 2%   Processes:       78
      Usage of /:  32.9% of 9.84GB   Swap usage:   0%   Users logged in: 0
    
      Graph this data and manage this system at https://landscape.canonical.com/
    
    To access official Ubuntu documentation, please visit:
     http://help.ubuntu.com/



LOGIN AS USER sgeadmin

starcluster sshmaster -u sgeadmin physicscluster

    OK

    **********************************************************
    ** StarCluster - Ubuntu 9.10 Karmic AMI (alestic based) **
    **********************************************************
    
    mailing list: starcluster@mit.edu
    project homepage: http://web.mit.edu/starcluster
    built from alestic ami: ami-bb709dd2
    
    NOTE: Numpy/Scipy/Atlas have been custom compiled on this image.
    For now, please take care to avoid installing python-numpy, python-scipy,
    and liblapack* packages from apt-get as this will break these custom 
    installations.
    
      System information as of Wed Dec 22 21:57:56 UTC 2010
    
      System load: 0.0               Memory usage: 5%   Processes:       73
      Usage of /:  37.0% of 9.84GB   Swap usage:   0%   Users logged in: 0
    
      Graph this data and manage this system at https://landscape.canonical.com/
    
    To access official Ubuntu documentation, please visit:
     http://help.ubuntu.com/
    
    
    The programs included with the Ubuntu system are free software;
    the exact distribution terms for each program are described in the
    individual files in /usr/share/doc/*/copyright.
    
    Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
    applicable law.



LOGIN TO WORKER NODES


LOGIN AS ROOT:

starcluster sshnode physicscluster node001

    The authenticity of host 'ec2-50-16-26-90.compute-1.amazonaws.com (10.254.130.179)' can't be established.
    RSA key fingerprint is 2d:5e:cb:6e:8c:c9:7a:9b:05:00:25:85:58:a2:ce:54.
    Are you sure you want to continue connecting (yes/no)? yes
    Warning: Permanently added 'ec2-50-16-26-90.compute-1.amazonaws.com,10.254.130.179' (RSA) to the list of known hosts.
    Linux domU-12-31-39-00-7D-45 2.6.31-302-ec2 #7-Ubuntu SMP Tue Oct 13 19:06:04 UTC 2009 i686
    **********************************************************
    ** StarCluster - Ubuntu 9.10 Karmic AMI (alestic based) **
    **********************************************************
    
    mailing list: starcluster@mit.edu
    project homepage: http://web.mit.edu/starcluster
    built from alestic ami: ami-bb709dd2
    
    NOTE: Numpy/Scipy/Atlas have been custom compiled on this image.
    For now, please take care to avoid installing python-numpy, python-scipy,
    and liblapack* packages from apt-get as this will break these custom 
    installations.
    
      System information as of Wed Dec 22 21:59:29 UTC 2010
    
      System load:    0.0               Memory usage: 2%   Processes:       73
      Usage of /home: 37.0% of 9.84GB   Swap usage:   0%   Users logged in: 0
    
      Graph this data and manage this system at https://landscape.canonical.com/
    
    To access official Ubuntu documentation, please visit:
     http://help.ubuntu.com/


LOGIN AS USER sgeadmin:

starcluster sshnode -u sgeadmin physicscluster node001

    OK
    
    


LOGIN MANUALLY AS USER myuser

ssh -i /agua/home/admin/.keypairs/id_rsa-starcluster-1 \
myuser@ec2-123-12-12-123.compute-1.amazonaws.com


LIST THE CURRENT CLUSTERS

starcluster listclusters






TERMINATE THE CLUSTER
(to shutdown the cluster and stop paying for service)

starcluster stop physicscluster
    
    ---------------------------------------------------
    physicscluster (security group: @sc-physicscluster)
    ---------------------------------------------------
    
    Launch time: 2010-12-22T21:44:38.000Z
    Zone: us-east-1c
    Keypair: starcluster-1

    master running i-a0f7e3cd ec2-50-16-30-164.compute-1.amazonaws.com 
    node001 running i-a2f7e3cf ec2-50-16-26-90.compute-1.amazonaws.com 



NOTES
-----


df -ah

    Filesystem            Size  Used Avail Use% Mounted on
    /dev/sda1             9.9G  3.7G  5.8G  39% /
    proc                     0     0     0   -  /proc
    none                     0     0     0   -  /sys
    none                     0     0     0   -  /sys/fs/fuse/connections
    none                     0     0     0   -  /sys/kernel/debug
    none                     0     0     0   -  /sys/kernel/security
    udev                  858M   80K  858M   1% /dev
    none                     0     0     0   -  /dev/pts
    none                  858M     0  858M   0% /dev/shm
    none                  858M   76K  858M   1% /var/run
    none                  858M     0  858M   0% /var/lock
    none                  858M     0  858M   0% /lib/init/rw
    /dev/sda2             147G  188M  140G   1% /mnt
    nfsd                     0     0     0   -  /proc/fs/nfsd
    sunrpc                   0     0     0   -  /var/lib/nfs/rpc_pipefs



perl -v

    This is perl, v5.10.0 built for i486-linux-gnu-thread-multi
    
    Copyright 1987-2007, Larry Wall
    
    Perl may be copied only under the terms of either the Artistic License or the
    GNU General Public License, which may be found in the Perl 5 source kit.
    
    Complete documentation for Perl, including FAQ lists, should be found on
    this system using "man perl" or "perldoc perl".  If you have access to the
    Internet, point your browser at http://www.perl.org/, the Perl Home Page.
    

perl -e 'use Moose'

    Can't locate Moose.pm in @INC (@INC contains: /etc/perl /usr/local/lib/perl/5.10.0 /usr/local/share/perl/5.10.0 /usr/lib/perl5 /usr/share/perl5 /usr/lib/perl/5.10 /usr/share/perl/5.10 /usr/local/lib/site_perl .) at -e line 1.
    BEGIN failed--compilation aborted at -e line 1.


qstat

    The program 'qstat' can be found in the following packages:
     * gridengine-client
     * torque-client
    Try: apt-get install < selected package>
    qstat: command not found



apt-get install gridengine-client

    INTERACTIVE SCREENS AND THEN THIS OUTPUT:

    Selecting previously deselected package postfix.                                                 
    (Reading database ... 45607 files and directories currently installed.)
    Unpacking postfix (from .../postfix_2.6.5-3_i386.deb) ...
    Selecting previously deselected package bsd-mailx.
    Unpacking bsd-mailx (from .../bsd-mailx_8.1.2-0.20081101cvs-2ubuntu1_i386.deb) ...
    Selecting previously deselected package gridengine-common.
    Unpacking gridengine-common (from .../gridengine-common_6.2-4_all.deb) ...
    Selecting previously deselected package gridengine-client.
    Unpacking gridengine-client (from .../gridengine-client_6.2-4_i386.deb) ...
    Processing triggers for ufw ...
    Processing triggers for man-db ...
    Setting up postfix (2.6.5-3) ...
    Adding group `postfix' (GID 116) ...
    Done.
    Adding system user `postfix' (UID 109) ...
    Adding new user `postfix' (UID 109) with group `postfix' ...
    Not creating home directory `/var/spool/postfix'.
    Creating /etc/postfix/dynamicmaps.cf
    Adding tcp map entry to /etc/postfix/dynamicmaps.cf
    Adding group `postdrop' (GID 117) ...
    Done.
    /etc/aliases does not exist, creating it.
    
    Postfix was not set up.  Start with 
      cp /usr/share/postfix/main.cf.debian /etc/postfix/main.cf
    .  If you need to make changes, edit
    /etc/postfix/main.cf (and others) as needed.  To view Postfix configuration
    values, see postconf(1).
    
    After modifying main.cf, be sure to run '/etc/init.d/postfix reload'.
    
    
    Setting up bsd-mailx (8.1.2-0.20081101cvs-2ubuntu1) ...
    update-alternatives: using /usr/bin/bsd-mailx to provide /usr/bin/mailx (mailx) in auto mode.
    
    Setting up gridengine-common (6.2-4) ...
    
    Creating config file /etc/default/gridengine with new version
    
    Setting up gridengine-client (6.2-4) ...
    
    Processing triggers for libc-bin ...
    ldconfig deferred processing now taking place
    /sbin/ldconfig.real: /usr/lib/libumfpack.so is not an ELF file - it has the wrong magic bytes at the start.



</entry>



<entry [Fri Dec 17 11:40:43 EST 2010] COPY PARKINSONS INPUT DATA FILES AND JBROWSE FILES TO GUNEY'S AQUARIUS-6>





COPY RSA FILE
-------------

ON AQUARIUS-6:

cat /data/base/apps/ec2/keypair/agua.pem

-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAgj50DUifAZTS3G/SP12Vty9Q+4ljc31rOkSafh9pzBmN39ORERtVcriJQA7a
P/MTMqciLSJwThrtj4NRnjqSmFzFXRrVydNLLeSBz7dYLmzDJSpIuCgmUaoSbu/pnO4o1GvOCF+O
aBB5+yhH/DOl+dp6S97ICcPhklnChCdWENQCbspI+0mgAIDKBV7xovaetdWSNZ9D7KLqZlgFYovS
i3fGWmRFsYqvzQsfzIJQSXGEhc2m4ItG5r0XQImOamIrazEWC8K9WgpOGmeaMPMJBbz1ahPiPHKY
HcpPn46P3hJ5edmlTmhxuzc1J7m95ql4SMtkKM2asVeZPA8zLqmESwIDAQABAoIBAH2W8VsZytHA
iy+q2AboHAT/KEzU50QnDS2rl3nEmsUHYyoQnVLsk5HC5f4SFFwT7VArn6X8DmUSTD7Vtu8ntdIb
quijhsFN8LF5Jb+BIRPrJqWAx4xkksaug4Xb6926PT7QEWU7l1s7gBQyfG9x8jsidEkSsrvP2YTA
7vN15uTj2o2Uq47BxasR37MYC3xHyr77gV/4NGDh9lLRSJmPz9jfPfnngP1T13HAYjUTQwOBXUAW
p7Mqmfmr+XYcXLZD9dHT1BXsRZW14Tx7PqSLerfqSxCEp4c3/IBZz5atloZBCkqhnZ+E4tss8HCA
7K+7v+C3Rou6NA5motKU2v1j45ECgYEAuzMONxkQwIHr/0JPvBjUGtKYFjU8ueBTWZvkVCBSMb2J
6JctNY0F2fWY0nDbqsBr8huDvERr41Viv9EJv67dytVgSTP3oBIpHkTDswykwg/o2YS+LQhzyphF
gfVMK7KHqiItERIAGlK3Lw44F7EsFqnxCdN+pdSFisF8eUHmLcMCgYEAshynouPPDWNq2XJgqtuh
euU8fISiUOi2tMGOwEe+sTQ2GXPoWnyGyvhxNFyc+gTRPyuZwe5PqeABpC4184df4s3RQyf12Ig5
HO5rALEpNbvocNdOtzeJrsswmbrY51UecdkJo/xLjcitvIERTassGLKKOl39miGEkasFEfmyvtkC
gYEAt4yI/Kc8ELWTM3bOfY0Os7oX23aZs1tr/mnnSEFktla1GPTaJC7BNQQlsvlruZHwhbRKx9eC
vaWkLJYHbAZGfDIZtc0ZmL8VyBL+m9ni1lEJK/aHDdrCxjvls1ZUOGhVsxDNhXZT2XuPF7lmcHyM
0TASImNYQ7sMsY+jv7VIv0cCgYARRtBH75sE7HDP2NVhnV5DgnrkhSUNfhVC4UeMhSkNHUhmHaUb
KdsVUxYAAz/CzLbTTtJiSlB15OGj4EuhbK8zW82Bmx2wvD31/XZpocWijbCVSX08Lmnvh4wWTVZ+
0fXbCzdxLabSgPXBRC++fe0QFDluQfG4gqnOS215eeQJuQKBgCzC8+zfQcSL5t4UB76DpCYwgoBn
2uZfhkN33P/YUfOa3iHedei1pVoCgeD5jg9TpUqHXKb6dVgVglCO4IiyV1YTAkco1abESl6TxZB1
Iwmdi9XFuss1e045AMbdCmjkxEGfFMFb/LSUu2kdVJOtbs1DRFkpM0RJaNw/GoxA1SRl
-----END RSA PRIVATE KEY-----


ON PEGASUS:

cd /ngs/bioinfo/syoung/base/pipeline/jvance/pdx
rm -fr gpademci
emacs gpademci
-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAgj50DUifAZTS3G/SP12Vty9Q+4ljc31rOkSafh9pzBmN39ORERtVcriJQA7a
P/MTMqciLSJwThrtj4NRnjqSmFzFXRrVydNLLeSBz7dYLmzDJSpIuCgmUaoSbu/pnO4o1GvOCF+O
aBB5+yhH/DOl+dp6S97ICcPhklnChCdWENQCbspI+0mgAIDKBV7xovaetdWSNZ9D7KLqZlgFYovS
i3fGWmRFsYqvzQsfzIJQSXGEhc2m4ItG5r0XQImOamIrazEWC8K9WgpOGmeaMPMJBbz1ahPiPHKY
HcpPn46P3hJ5edmlTmhxuzc1J7m95ql4SMtkKM2asVeZPA8zLqmESwIDAQABAoIBAH2W8VsZytHA
iy+q2AboHAT/KEzU50QnDS2rl3nEmsUHYyoQnVLsk5HC5f4SFFwT7VArn6X8DmUSTD7Vtu8ntdIb
quijhsFN8LF5Jb+BIRPrJqWAx4xkksaug4Xb6926PT7QEWU7l1s7gBQyfG9x8jsidEkSsrvP2YTA
7vN15uTj2o2Uq47BxasR37MYC3xHyr77gV/4NGDh9lLRSJmPz9jfPfnngP1T13HAYjUTQwOBXUAW
p7Mqmfmr+XYcXLZD9dHT1BXsRZW14Tx7PqSLerfqSxCEp4c3/IBZz5atloZBCkqhnZ+E4tss8HCA
7K+7v+C3Rou6NA5motKU2v1j45ECgYEAuzMONxkQwIHr/0JPvBjUGtKYFjU8ueBTWZvkVCBSMb2J
6JctNY0F2fWY0nDbqsBr8huDvERr41Viv9EJv67dytVgSTP3oBIpHkTDswykwg/o2YS+LQhzyphF
gfVMK7KHqiItERIAGlK3Lw44F7EsFqnxCdN+pdSFisF8eUHmLcMCgYEAshynouPPDWNq2XJgqtuh
euU8fISiUOi2tMGOwEe+sTQ2GXPoWnyGyvhxNFyc+gTRPyuZwe5PqeABpC4184df4s3RQyf12Ig5
HO5rALEpNbvocNdOtzeJrsswmbrY51UecdkJo/xLjcitvIERTassGLKKOl39miGEkasFEfmyvtkC
gYEAt4yI/Kc8ELWTM3bOfY0Os7oX23aZs1tr/mnnSEFktla1GPTaJC7BNQQlsvlruZHwhbRKx9eC
vaWkLJYHbAZGfDIZtc0ZmL8VyBL+m9ni1lEJK/aHDdrCxjvls1ZUOGhVsxDNhXZT2XuPF7lmcHyM
0TASImNYQ7sMsY+jv7VIv0cCgYARRtBH75sE7HDP2NVhnV5DgnrkhSUNfhVC4UeMhSkNHUhmHaUb
KdsVUxYAAz/CzLbTTtJiSlB15OGj4EuhbK8zW82Bmx2wvD31/XZpocWijbCVSX08Lmnvh4wWTVZ+
0fXbCzdxLabSgPXBRC++fe0QFDluQfG4gqnOS215eeQJuQKBgCzC8+zfQcSL5t4UB76DpCYwgoBn
2uZfhkN33P/YUfOa3iHedei1pVoCgeD5jg9TpUqHXKb6dVgVglCO4IiyV1YTAkco1abESl6TxZB1
Iwmdi9XFuss1e045AMbdCmjkxEGfFMFb/LSUu2kdVJOtbs1DRFkpM0RJaNw/GoxA1SRl
-----END RSA PRIVATE KEY-----

chmod 600 gpademci

ssh -i /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/gpademci \
root@ec2-184-72-89-249.compute-1.amazonaws.com


    OK!
    
    Last login: Fri Dec 17 11:22:15 2010 from 129.171.150.190
         ___   _        __   __   ____            __    
        / _ \ (_)___ _ / /  / /_ / __/____ ___ _ / /___ 
       / , _// // _ `// _ \/ __/_\ \ / __// _ `// // -_)
      /_/|_|/_/ \_, //_//_/\__//___/ \__/ \_,_//_/ \__/ 
               /___/                                                 
                                                  
    Welcome to a public Amazon EC2 image brought to you by RightScale!
    
    ********************************************************************
    ********************************************************************
    ***       Your EC2 Instance is now operational.                  ***
    ***       All of the configuration has completed.                ***
    ***       Please check /var/log/install for details.             ***
    ********************************************************************
    ********************************************************************


COPY INPUT DATA FILES (FASTQ ONLY)
----------------------------------

ON AQUARIUS-6:
mkdir /nethome/gpademci

ON PEGASUS:

CONTROL 1
----------
u02
screen -S copy

scp -i /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/gpademci \
s_1_1.sequence.txt \
root@ec2-184-72-89-249.compute-1.amazonaws.com:/nethome/gpademci/control/1

    s_1_1.sequence.txt                                        100% 3670MB   3.3MB/s   18:51

    OK

scp -i /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/gpademci/control/1 \
s_1_2.sequence.txt \
root@ec2-184-72-89-249.compute-1.amazonaws.com:/nethome/gpademci

    OK


CONTROL 2
---------
cd /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/control/2

scp -i /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/gpademci \
control2.sequence.txt \
root@ec2-184-72-89-249.compute-1.amazonaws.com:/nethome/gpademci/control/2



TEST 1
------
cd /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/test/1

scp -i /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/gpademci \
test1.sequence.txt \
root@ec2-184-72-89-249.compute-1.amazonaws.com:/nethome/gpademci/test/1



TEST 2
------
cd /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/test/2

scp -i /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/gpademci \
test2.sequence.txt \
root@ec2-184-72-89-249.compute-1.amazonaws.com:/nethome/gpademci/test/2





COPY JBROWSE FILES (json)
-------------------------


JBROWSE chr1 CURRENTLY STORED HERE:

TEST 2

cd /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/test/2
scp -i /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/gpademci \
test2-jbrowse.tar.gz \
root@ec2-184-72-89-249.compute-1.amazonaws.com:/nethome/gpademci/test/2


TEST 1

cd /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/test/1
scp -i /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/gpademci \
test1-jbrowse.tar.gz \
root@ec2-184-72-89-249.compute-1.amazonaws.com:/nethome/gpademci/test/1


CONTROL 2

cd /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/control/2
scp -i /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/gpademci \
control2-jbrowse.tar.gz \
root@ec2-184-72-89-249.compute-1.amazonaws.com:/nethome/gpademci/control/2


CONTROL 1

cd /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/control/1
scp -i /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/gpademci \
control1-jbrowse.tar.gz \
root@ec2-184-72-89-249.compute-1.amazonaws.com:/nethome/gpademci/control/1




ON PEGASUS:

cd /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/control/1
##### tar cvfz control2-jbrowse.tar.gz jbrowse
scp control1-jbrowse.tar.gz syoung@ngsdev.ccs.miami.edu:/data/agua/0.5/html/plugins/view/jbrowse/species/human/hg19




NOTES
-----


MUST ADD gpademci PRIVATE KEY TO authorized_hosts TO CONNECT



cat /agua/home/admin/.keypairs/private.pem 
-----BEGIN PRIVATE KEY-----
MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBALX8zHWemf/OAnCXlvkjo6fIRTE4
CiKZtp6DjYkAlW3FuKGykL4d57O2EPttuEw4sdFIaZYUUhxsWas73kkCPLjiRWhOPkFvMq+ArFzt
JETOsxhoXlfxqfwbEg4UYUYJN+UpLONrAltEkShcoMaE6gZ6ymi+wRDHzvgxfSsw9pIXAgMBAAEC
gYAdy7gGAeOg2C/aE1eqjsU6sTVy64PtSlF1/n/r0GamxFqITt4X4nmPGN4K7FniUN38L+jpo4YW
FT9RI8ovFeiu7OWReO3cj0l/+I4V8HfG85uhzuZxebNmFynTsi4Celzbnn74Y5YQOhlwUZQP6iuu
oxjMUiXLf7iYMPY29ePlYQJBAP7Mf/2N3vnyOR+I5nqrbYByxwXIHH1NSF3yLkdbnogAyBGqLP44
iqsQmrf5n7cSSLDRQAbRu7KFOL1sx4sgUp8CQQC22G1u0GopJGw26Gzj/y1mt0oelaaTNsW27F4P
HeDyXg0G1+nZqsF4NDJWPs6qclL6/eWbNOll7VKfSSBRKsWJAkEAjun3NCmaEompPqXT2KREpBI8
zWJjkGiDmaYYDRA3iEMf9MCFwgXGyZJjpaNO0SlhOkPz7J9A7y3IGH9mIQP9MwJBAI5srWlZDKh5
h5WJnHBIb6wH78M9HKClVIL1QRsTUgpYelsvSifT25nvRpppl/+qx7pclUI9h+RuZSJQCs1OvMkC
QQD6FUZpTR67uEPvsEdstJO5+4m2BaUQreGGj5EN/s2CYjcQqC+zALeMmHRXh1qXPQMv4FDw7RPW
ePzcUBc2TCD+
-----END PRIVATE KEY-----


cd /ngs/bioinfo/syoung/base/pipeline/jvance/pdx
emacs gpademci
-----BEGIN PRIVATE KEY-----
MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBALX8zHWemf/OAnCXlvkjo6fIRTE4
CiKZtp6DjYkAlW3FuKGykL4d57O2EPttuEw4sdFIaZYUUhxsWas73kkCPLjiRWhOPkFvMq+ArFzt
JETOsxhoXlfxqfwbEg4UYUYJN+UpLONrAltEkShcoMaE6gZ6ymi+wRDHzvgxfSsw9pIXAgMBAAEC
gYAdy7gGAeOg2C/aE1eqjsU6sTVy64PtSlF1/n/r0GamxFqITt4X4nmPGN4K7FniUN38L+jpo4YW
FT9RI8ovFeiu7OWReO3cj0l/+I4V8HfG85uhzuZxebNmFynTsi4Celzbnn74Y5YQOhlwUZQP6iuu
oxjMUiXLf7iYMPY29ePlYQJBAP7Mf/2N3vnyOR+I5nqrbYByxwXIHH1NSF3yLkdbnogAyBGqLP44
iqsQmrf5n7cSSLDRQAbRu7KFOL1sx4sgUp8CQQC22G1u0GopJGw26Gzj/y1mt0oelaaTNsW27F4P
HeDyXg0G1+nZqsF4NDJWPs6qclL6/eWbNOll7VKfSSBRKsWJAkEAjun3NCmaEompPqXT2KREpBI8
zWJjkGiDmaYYDRA3iEMf9MCFwgXGyZJjpaNO0SlhOkPz7J9A7y3IGH9mIQP9MwJBAI5srWlZDKh5
h5WJnHBIb6wH78M9HKClVIL1QRsTUgpYelsvSifT25nvRpppl/+qx7pclUI9h+RuZSJQCs1OvMkC
QQD6FUZpTR67uEPvsEdstJO5+4m2BaUQreGGj5EN/s2CYjcQqC+zALeMmHRXh1qXPQMv4FDw7RPW
ePzcUBc2TCD+
-----END PRIVATE KEY-----


chmod 600 gpademci



ssh -i /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/gpademci \
root@ec2-184-72-89-249.compute-1.amazonaws.com






</entry>



<entry [Wed Dec 15 21:40:30 EST 2010] TESTING ELASTIC STARCLUSTER ON GUNEY AQUARIUS-6>




RESTARTED GUNEY'S AQUARIUS-6 AND IP HAD CHANGED TO:

ec2-184-72-89-249.compute-1.amazonaws.com



cli.py:994 - ERROR - config file /root/.starcluster/config does not exist

Options:
--------
[1] Show the StarCluster config template
[2] Write config template to /root/.starcluster/config
[q] Quit
    
Plase enter your selection: 2           

>>> Config template written to /root/.starcluster/config. Please customize this file.




####################################
## StarCluster Configuration File ##
####################################

[global]
# configure the default cluster template to use when starting a cluster
# defaults to 'smallcluster' defined below. this template should be usable
# out-of-the-box provided you've configured your keypair correctly
DEFAULT_TEMPLATE=smallcluster
# enable experimental features for this release
ENABLE_EXPERIMENTAL=False

[aws info]
# This is the AWS credentials section.
# These settings apply to all clusters
# replace these with your AWS keys
AWS_ACCESS_KEY_ID = #your_aws_access_key_id
AWS_SECRET_ACCESS_KEY = #your_secret_access_key
# replace this with your account number
AWS_USER_ID= #your userid

# Sections starting with "key" define your keypairs
# (see the EC2 getting started guide tutorial on using ec2-add-keypair to learn
# how to create new keypairs)
# Section name should match your key name e.g.:
[key gsg-keypair]
KEY_LOCATION=/home/myuser/.ssh/id_rsa-gsg-keypair

# You can of course have multiple keypair sections
# [key my-other-gsg-keypair]
# KEY_LOCATION=/home/myuser/.ssh/id_rsa-my-other-gsg-keypair

# Sections starting with "cluster" define your cluster templates
# Section name is the name you give to your cluster template e.g.:
[cluster smallcluster]
# change this to the name of one of the keypair sections defined above 
KEYNAME = gsg-keypair

# number of ec2 instances to launch
CLUSTER_SIZE = 2

# create the following user on the cluster
CLUSTER_USER = sgeadmin

# optionally specify shell (defaults to bash)
# (options: tcsh, zsh, csh, bash, ksh)
CLUSTER_SHELL = bash

# AMI for cluster nodes.
# The base i386 StarCluster AMI is ami-d1c42db8
# The base x86_64 StarCluster AMI is ami-a5c42dcc
NODE_IMAGE_ID = ami-d1c42db8
# instance type for all cluster nodes 
# (options: m1.large, c1.xlarge, m1.small, c1.medium, m1.xlarge, m2.4xlarge, m2.2xlarge)
NODE_INSTANCE_TYPE = m1.small

# Uncomment to specify a different instance type for the master node  (OPTIONAL)
# (defaults to NODE_INSTANCE_TYPE if not specified)
#MASTER_INSTANCE_TYPE = m1.small

# Uncomment to specify a separate AMI to use for the master node. (OPTIONAL)
# (defaults to NODE_IMAGE_ID if not specified)
#MASTER_IMAGE_ID = ami-d1c42db8 (OPTIONAL)

# availability zone to launch the cluster in (OPTIONAL)
# (automatically determined based on volumes (if any) or 
# selected by Amazon if not specified)
#AVAILABILITY_ZONE = us-east-1c

# list of volumes to attach to the master node and nfs share to worker nodes (OPTIONAL)
# (see "Configuring EBS Volumes" below for an example of defining volume sections)
#VOLUMES = oceandata, biodata

# list of plugins to load after StarCluster's default setup routines (OPTIONAL)
# (see "Configuring StarCluster Plugins" below for an example of defining a plugin section)
#PLUGINS = myplugin, myplugin2

###########################################
## Defining Additional Cluster Templates ##
###########################################

# You can also define multiple cluster templates.
# You can either supply all configuration options as with smallcluster above, or
# create an EXTENDS=< cluster_name> variable in the new cluster section to use all 
# settings from < cluster_name> as defaults. Below are a couple of example
# cluster templates that use the EXTENDS feature:

# [cluster mediumcluster]
# Declares that this cluster uses smallcluster as defaults
# EXTENDS=smallcluster
# This section is the same as smallcluster except for the following settings:
# KEYNAME=my-other-gsg-keypair
# NODE_INSTANCE_TYPE = c1.xlarge
# CLUSTER_SIZE=8
# VOLUMES = biodata2

# [cluster largecluster]
# Declares that this cluster uses mediumcluster as defaults
# EXTENDS=mediumcluster
# This section is the same as mediumcluster except for the following variables:
# CLUSTER_SIZE=16

#############################
## Configuring EBS Volumes ##
#############################

# Using EBS volumes with StarCluster is relatively straight forward. You create
# a [volume] section that represents an EBS volume. The section name is a tag
# for your volume. This tag is used in the VOLUMES setting in a cluster template 
# to declare that an EBS volume is to be mounted and nfs shared on the cluster.
# (see the commented VOLUMES setting in the 'smallcluster' template above)
# Below are some examples of defining and configuring EBS volumes to be used
# with StarCluster:

# Sections starting with "volume" define your EBS volumes
# Section name tags your volume e.g.:
# [volume biodata]
# (attach 1st partition of volume vol-c9999999 to /home on master node)
# VOLUME_ID = vol-c999999
# MOUNT_PATH = /home

# Same volume as above, but mounts to different location
# [volume biodata2]
# (attach 1st partition of volume vol-c9999999 to /opt/ on master node)
# VOLUME_ID = vol-c999999
# MOUNT_PATH = /opt/

# Another volume example 
# [volume oceandata]
# (attach 1st partition of volume vol-d7777777 to /mydata on master node)
# VOLUME_ID = vol-d7777777
# MOUNT_PATH = /mydata

# Same as oceandata only uses the 2nd partition instead
# [volume oceandata]
# (attach 2nd partition of volume vol-d7777777 to /mydata on master node)
# VOLUME_ID = vol-d7777777
# MOUNT_PATH = /mydata
# PARTITION = 2

#####################################
## Configuring StarCluster Plugins ##
#####################################

# Sections starting with "plugin" define a custom python class
# which can perform additional configurations to StarCluster's default routines. These plugins 
# can be assigned to a cluster template to customize the setup procedure when
# starting a cluster from this template
# (see the commented PLUGINS setting in the 'smallcluster' template above) 
# Below is an example of defining a plugin called 'myplugin':

# [plugin myplugin]
# myplugin module either lives in ~/.starcluster/plugins or is 
# in your PYTHONPATH
# SETUP_CLASS = myplugin.SetupClass
# extra settings are passed as arguments to your plugin:
# SOME_PARAM_FOR_MY_PLUGIN = 1
# SOME_OTHER_PARAM = 2






++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
LAUNCH AQUARIUS-6 AS GUNEY (AWS CONSOLE)

GUNEY       503401961460
JGILBERT    558277860346
KNYUTEMANS  684733399587


AQUARIUS-6 AMI      ami-707e8819


GUNEY
-----

ON LINODE:


rm -fr /root/base/apps/ec2/keypair/gpademci/keys.sh
emacs /root/base/apps/ec2/keypair/gpademci/keys.sh
export AMAZON ID=503401961460
export AWS_ACCESS_KEY_ID=AKIAILLN2EEVC7TPWX7A
export SECRET_ACCESS_KEY=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
export EC2_CERT=/root/base/apps/ec2/keypair/gpademci/cert-2NFLCRC5BLRGVAS3TRVHQNHIIZTX3KNC.pem
export EC2_PRIVATE_KEY=/root/base/apps/ec2/keypair/gpademci/pk-2NFLCRC5BLRGVAS3TRVHQNHIIZTX3KNC.pem

chmod 755 /root/base/apps/ec2/keypair/gpademci/keys.sh


PUBLIC CERTIFICATE

-----BEGIN CERTIFICATE-----
MIICdzCCAeCgAwIBAgIFfphks2kwDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMC
VVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMY
QVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTEwMTIxNDE5MjIzNloXDTExMTIx
NDE5MjIzNlowUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAV
BgNVBAsTDkFXUy1EZXZlbG9wZXJzMRYwFAYDVQQDEw0xZzh2czBucGg5NmZ0MIGf
MA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC1/Mx1npn/zgJwl5b5I6OnyEUxOAoi
mbaeg42JAJVtxbihspC+HeezthD7bbhMOLHRSGmWFFIcbFmrO95JAjy44kVoTj5B
bzKvgKxc7SREzrMYaF5X8an8GxIOFGFGCTflKSzjawJbRJEoXKDGhOoGespovsEQ
x874MX0rMPaSFwIDAQABo1cwVTAOBgNVHQ8BAf8EBAMCBaAwFgYDVR0lAQH/BAww
CgYIKwYBBQUHAwIwDAYDVR0TAQH/BAIwADAdBgNVHQ4EFgQUGu+QOa+NA1DLSvA5
hz1CIP8U3jEwDQYJKoZIhvcNAQEFBQADgYEANgsgw3V2QWD26cDcSdXp0dmlEu9/
Q86Br3J/jux5PrIsoMB+ecGy+yZcpY5EN640YrpzLR6TXLxYlbyXJIgFrpgGGXql
fIuJ4V66XlmDn6qQ2W7kFmAR/nQ+qc/AtaxoFZk/nWz+4FyB3cEB2nHk5VKmv9Bv
DTLx/UFMicX6nTA=
-----END CERTIFICATE-----


PRIVATE KEY

-----BEGIN PRIVATE KEY-----
MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBALX8zHWemf/OAnCXlvkjo6fIRTE4
CiKZtp6DjYkAlW3FuKGykL4d57O2EPttuEw4sdFIaZYUUhxsWas73kkCPLjiRWhOPkFvMq+ArFzt
JETOsxhoXlfxqfwbEg4UYUYJN+UpLONrAltEkShcoMaE6gZ6ymi+wRDHzvgxfSsw9pIXAgMBAAEC
gYAdy7gGAeOg2C/aE1eqjsU6sTVy64PtSlF1/n/r0GamxFqITt4X4nmPGN4K7FniUN38L+jpo4YW
FT9RI8ovFeiu7OWReO3cj0l/+I4V8HfG85uhzuZxebNmFynTsi4Celzbnn74Y5YQOhlwUZQP6iuu
oxjMUiXLf7iYMPY29ePlYQJBAP7Mf/2N3vnyOR+I5nqrbYByxwXIHH1NSF3yLkdbnogAyBGqLP44
iqsQmrf5n7cSSLDRQAbRu7KFOL1sx4sgUp8CQQC22G1u0GopJGw26Gzj/y1mt0oelaaTNsW27F4P
HeDyXg0G1+nZqsF4NDJWPs6qclL6/eWbNOll7VKfSSBRKsWJAkEAjun3NCmaEompPqXT2KREpBI8
zWJjkGiDmaYYDRA3iEMf9MCFwgXGyZJjpaNO0SlhOkPz7J9A7y3IGH9mIQP9MwJBAI5srWlZDKh5
h5WJnHBIb6wH78M9HKClVIL1QRsTUgpYelsvSifT25nvRpppl/+qx7pclUI9h+RuZSJQCs1OvMkC
QQD6FUZpTR67uEPvsEdstJO5+4m2BaUQreGGj5EN/s2CYjcQqC+zALeMmHRXh1qXPQMv4FDw7RPW
ePzcUBc2TCD+
-----END PRIVATE KEY-----



ADD AQUARIUS-6 LAUNCH PERMISSION FOR GUNEY:

ec2-modify-image-attribute  ami-707e8819 --launch-permission --add 503401961460

    launchPermission        ami-707e8819    ADD     userId  503401961460


ADD AGUA SNAPSHOT PERMISSIONS FOR GUNEY:

ec2-modify-snapshot-attribute  snap-55fe4a3f --create-volume-permission --add 503401961460

    createVolumePermission  snap-55fe4a3f   ADD     userId  503401961460


CHECK WHO IS AUTHORISED TO CREATE FROM THIS SNAPSHOT:

ec2-describe-snapshot-attribute  snap-55fe4a3f --create-volume-permission

    createVolumePermission  snap-55fe4a3f   userId  503401961460
    createVolumePermission  snap-55fe4a3f   userId  983300124420
    createVolumePermission  snap-55fe4a3f   userId  684733399587
    createVolumePermission  snap-55fe4a3f   userId  558277860346



DESCRIBE KEYS:

ec2dkey
    KEYPAIR aquarius        06:48:7a:27:96:e1:db:f9:0a:a3:c3:4f:06:b3:10:d5:eb:7d:2e:a0



REMOVE EXISTING aquarius KEYPAIR:

ec2-delete-keypair aquarius

    KEYPAIR aquarius




CREATE AN rsa KEYPAIR:

cd /root/base/apps/ec2/keypair/gpademci
ssh-keygen -t rsa

    Generating public/private rsa key pair.
    Enter file in which to save the key (/root/.ssh/id_rsa): /root/base/apps/ec2/keypair/gpademci/aquarius_rsa
    Enter passphrase (empty for no passphrase): 
    Enter same passphrase again: 
    Your identification has been saved in /root/base/apps/ec2/keypair/gpademci/aquarius_rsa.
    Your public key has been saved in /root/base/apps/ec2/keypair/gpademci/aquarius_rsa.pub.
    The key fingerprint is:
    70:fa:2a:81:13:29:21:65:88:de:c6:4c:9f:76:dc:8a root@li182-248


cat /root/base/apps/ec2/keypair/gpademci/aquarius_rsa

    -----BEGIN RSA PRIVATE KEY-----
    MIIEogIBAAKCAQEAv3d8Sv9GXRH8tVXIApQDwy8w3EnwxQYwshCb+1y70vODSGJR
    Rvr4qRspCX0+BSQlcNxq9CTjYcU8yHqa4n/TBwuzkrbpHaJOfkKiunNKs5POUBZj
    fJutCVCRU87qgc38jA374Uhiip/90ewJqtLLDabFrEL5DMkKd/bwDC9x7bwmWT1D
    uAJE3OevzfI/yK34YOZ6XFQe3gYFTOWEC1UICwvKoLH9TRHJalqlN883uI7tM2Tv
    NnZkZFjDdHRu9Zb7JHV8HzxX++ISaE4MGwHUfGpdc2+bEX2XdX6zxZ1BpLm/WwkB
    aUH1XOH022c3EsVWhEDgRyzDveMdyfxC7vcqMQIBIwKCAQEAuf8LBwacH+WWZwLf
    jXnXxOwDlCqSHnsKu5sbLrHbB3A2Y5K1WuUsEf0gjOAQXMQHHS3kPaAtV6mowsA+
    sCRmmSFPW1KZT/zBR3PuiTzMOWsC7rapyYFJAbv647MPsUvCIacvMp4WlUr2kWjz
    cr4kVmd+Mk+wGwxwkctPls8A9ZCD6Au/ftRoRIO24yThlalgr4C6/D3M2NuSgC9l
    A0DtBUvWl961kcvqSz1xQ8gvwe7qcFWSQffxneKPQEWQwFWHRPT+Dpn6/VXGRRCK
    hGVRUGdusRFce5UcGfzGNH59xf1Mo2m0+HYKYT2zt14XYT2y2iwEMf01lqVMUI2q
    dKCdKwKBgQDy0zvIcYdi5obS7s/9MR552Fzidnq0sWa4ei6wUSxH+VsLV7NUsZJ2
    1lGr0tNfhgQ1bgAy8pyy/vNPlXgoMKjnOG/9BuW5u1kJmj0TcHMzJPMDwylq8vY7
    3J0dqqbVEBMh2qif8RXudZaN1kvt3sCTROr1TVtnCdNF6eQNLbfi1QKBgQDJ2uZU
    Q+uFr9lGQJppbnAxl6MxxBJEepAX5Vjcr0fME8SPjopXHAA7vw19RNryVFECrBu0
    w7TPQt4cpFpP4NJE6M0QJ2zQlhomHY8Aqcv6z/3RJyzJYxOCbxIVXWUnV+Whbr7b
    4dCh3YviuUl8bgkDmvtuL8UtEXS+BaR+waj/7QKBgQDk8wx7KTaB0goXVjHRd3SB
    gts77A1LSC2mnxYT9MNZzdl/uRbMMmWF/UWwojUCSyiKJeLuNTSoxH8B5LMelEd6
    7BHRT6Vl+cj6bNqACvBGKib06zWt+wVrpB8b+KvtdY5hv4kL1K5HO6s1RmTY9phQ
    VuwpHQ0JYQkHZ38/oCJoJwKBgGILPKyWBK6l3o/WPF8YYmE7Bh98fea/MAubSGsw
    kJZSvo7e1XrEdSRVe5SdyW5jd84ZFMWDoPb0l8TE22igZiF4Y5ohxyN8G1RXf/kC
    A/1696AaV5UEPK0RYI4IyrtWlBs1ymrMxGvgowe5FRCNN5QJcs8ehFe4BYDeK1OC
    oorvAoGAShX+0YWAWnT/GLErIMpDHo7OfCGnX+/ckBjrL0OOBTsisfrpjpwNBoBU
    FKXkTaPPAow5DXevyzuFeM7XeSbVf2oLR4Trd7SaJUdo2JtEs7tueD6fyDfxAR94
    qdRz8qQ8PPY3aeOz+S+81OOjy1xTnLbGOoijOJcYgT4o0hnFynk=
    -----END RSA PRIVATE KEY-----


cat /root/base/apps/ec2/keypair/gpademci/aquarius_rsa.pub
 
    ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAv3d8Sv9GXRH8tVXIApQDwy8w3EnwxQYwshCb+1y70vODSGJRRvr4qRspCX0+BSQlcNxq9CTjYcU8yHqa4n/TBwuzkrbpHaJOfkKiunNKs5POUBZjfJutCVCRU87qgc38jA374Uhiip/90ewJqtLLDabFrEL5DMkKd/bwDC9x7bwmWT1DuAJE3OevzfI/yK34YOZ6XFQe3gYFTOWEC1UICwvKoLH9TRHJalqlN883uI7tM2TvNnZkZFjDdHRu9Zb7JHV8HzxX++ISaE4MGwHUfGpdc2+bEX2XdX6zxZ1BpLm/WwkBaUH1XOH022c3EsVWhEDgRyzDveMdyfxC7vcqMQ== root@li182-248


PASS PUBLIC KEY TO AMAZON:

ec2-import-keypair \
--debug \
aquarius \
--public-key-file /root/base/apps/ec2/keypair/gpademci/aquarius_rsa.pub \
-U https://ec2.amazonaws.com 

    KEYPAIR aquarius        5a:c0:af:ee:84:f6:0f:03:be:60:9e:17:f7:53:7b:42


LAUNCH AQUARIUS-6 USING THIS KEYPAIR:

ec2-run-instances \
--key aquarius \
ami-707e8819 \
--instance-type t1.micro \
-z us-east-1a 

    RESERVATION     r-8dabece7      503401961460    default
    INSTANCE        i-b45e61d9      ami-707e8819                    pending aquarius        0               t1.micro    2010-12-14T21:42:56+0000        us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled                                 ebs                                     paravirtual

ec2din

    RESERVATION     r-8dabece7      503401961460    default
    INSTANCE        i-b45e61d9      ami-707e8819    ec2-72-44-56-177.compute-1.amazonaws.com        ip-10-112-55-33.ec2.internal        running aquarius        0               t1.micro        2010-12-14T21:42:56+0000   us-east-1a       aki-b51cf9dc    ari-b31cf9da            monitoring-disabled     72.44.56.177    10.112.55.3ebs                                      paravirtual
    BLOCKDEVICE     /dev/sda1       vol-1817c670    2010-12-14T21:42:59.000Z
    BLOCKDEVICE     /dev/sdi        vol-1c17c674    2010-12-14T21:42:59.000Z



CONNECT (NB: MUST WAIT A MINUTE OR TWO FOR THE INSTANCE TO BE READY):


ssh -i /root/base/apps/ec2/keypair/gpademci/aquarius_rsa \
root@ec2-72-44-56-177.compute-1.amazonaws.com

    The authenticity of host 'ec2-72-44-56-177.compute-1.amazonaws.com (72.44.56.177)' can't be established.
    RSA key fingerprint is 4f:8c:78:d2:48:fc:a1:88:da:3b:c9:ee:95:18:11:6d.
    Are you sure you want to continue connecting (yes/no)? yes
    Warning: Permanently added 'ec2-72-44-56-177.compute-1.amazonaws.com,72.44.56.177' (RSA) to the list of known hosts.
    Last login: Tue Dec 14 13:07:50 2010 from 129.171.150.190
         ___   _        __   __   ____            __    
        / _ \ (_)___ _ / /  / /_ / __/____ ___ _ / /___ 
       / , _// // _ `// _ \/ __/_\ \ / __// _ `// // -_)
      /_/|_|/_/ \_, //_//_/\__//___/ \__/ \_,_//_/ \__/ 
               /___/                                                 
                                                  
    Welcome to a public Amazon EC2 image brought to you by RightScale!
    
    ********************************************************************
    ********************************************************************
    ***       Your EC2 Instance is now operational.                  ***
    ***       All of the configuration has completed.                ***
    ***       Please check /var/log/install for details.             ***
    ********************************************************************
    ********************************************************************



GO TO SECURE INIT PAGE:

https://ec2-72-44-56-177.compute-1.amazonaws.com


FILLED IN:


AMAZON ID	        503401961460
AWS_ACCESS_KEY_ID	AKIAILLN2EEVC7TPWX7A
SECRET_ACCESS_KEY	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

PUBLIC CERTIFICATE:

-----BEGIN CERTIFICATE-----
MIICdzCCAeCgAwIBAgIFfphks2kwDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMC
VVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMY
QVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTEwMTIxNDE5MjIzNloXDTExMTIx
NDE5MjIzNlowUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAV
BgNVBAsTDkFXUy1EZXZlbG9wZXJzMRYwFAYDVQQDEw0xZzh2czBucGg5NmZ0MIGf
MA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC1/Mx1npn/zgJwl5b5I6OnyEUxOAoi
mbaeg42JAJVtxbihspC+HeezthD7bbhMOLHRSGmWFFIcbFmrO95JAjy44kVoTj5B
bzKvgKxc7SREzrMYaF5X8an8GxIOFGFGCTflKSzjawJbRJEoXKDGhOoGespovsEQ
x874MX0rMPaSFwIDAQABo1cwVTAOBgNVHQ8BAf8EBAMCBaAwFgYDVR0lAQH/BAww
CgYIKwYBBQUHAwIwDAYDVR0TAQH/BAIwADAdBgNVHQ4EFgQUGu+QOa+NA1DLSvA5
hz1CIP8U3jEwDQYJKoZIhvcNAQEFBQADgYEANgsgw3V2QWD26cDcSdXp0dmlEu9/
Q86Br3J/jux5PrIsoMB+ecGy+yZcpY5EN640YrpzLR6TXLxYlbyXJIgFrpgGGXql
fIuJ4V66XlmDn6qQ2W7kFmAR/nQ+qc/AtaxoFZk/nWz+4FyB3cEB2nHk5VKmv9Bv
DTLx/UFMicX6nTA=
-----END CERTIFICATE-----


PRIVATE KEY

-----BEGIN PRIVATE KEY-----
MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBALX8zHWemf/OAnCXlvkjo6fIRTE4
CiKZtp6DjYkAlW3FuKGykL4d57O2EPttuEw4sdFIaZYUUhxsWas73kkCPLjiRWhOPkFvMq+ArFzt
JETOsxhoXlfxqfwbEg4UYUYJN+UpLONrAltEkShcoMaE6gZ6ymi+wRDHzvgxfSsw9pIXAgMBAAEC
gYAdy7gGAeOg2C/aE1eqjsU6sTVy64PtSlF1/n/r0GamxFqITt4X4nmPGN4K7FniUN38L+jpo4YW
FT9RI8ovFeiu7OWReO3cj0l/+I4V8HfG85uhzuZxebNmFynTsi4Celzbnn74Y5YQOhlwUZQP6iuu
oxjMUiXLf7iYMPY29ePlYQJBAP7Mf/2N3vnyOR+I5nqrbYByxwXIHH1NSF3yLkdbnogAyBGqLP44
iqsQmrf5n7cSSLDRQAbRu7KFOL1sx4sgUp8CQQC22G1u0GopJGw26Gzj/y1mt0oelaaTNsW27F4P
HeDyXg0G1+nZqsF4NDJWPs6qclL6/eWbNOll7VKfSSBRKsWJAkEAjun3NCmaEompPqXT2KREpBI8
zWJjkGiDmaYYDRA3iEMf9MCFwgXGyZJjpaNO0SlhOkPz7J9A7y3IGH9mIQP9MwJBAI5srWlZDKh5
h5WJnHBIb6wH78M9HKClVIL1QRsTUgpYelsvSifT25nvRpppl/+qx7pclUI9h+RuZSJQCs1OvMkC
QQD6FUZpTR67uEPvsEdstJO5+4m2BaUQreGGj5EN/s2CYjcQqC+zALeMmHRXh1qXPQMv4FDw7RPW
ePzcUBc2TCD+
-----END PRIVATE KEY-----



TEST
----


echo '{"username":"agua","mode":"init","data":{"username":"admin","volumesize":100,"amazonuserid":"5034019614","ec2publiccert":"-----BEGIN CERTIFICATE-----\nMIICdzCCAeCgAwIBAgIFfphks2kwDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMC\nVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMY\nQVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTEwMTIxNDE5MjIzNloXDTExMTIx\nNDE5MjIzNlowUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAV\nBgNVBAsTDkFXUy1EZXZlbG9wZXJzMRYwFAYDVQQDEw0xZzh2czBucGg5NmZ0MIGf\nMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC1/Mx1npn/zgJwl5b5I6OnyEUxOAoi\nmbaeg42JAJVtxbihspC+HeezthD7bbhMOLHRSGmWFFIcbFmrO95JAjy44kVoTj5B\nbzKvgKxc7SREzrMYaF5X8an8GxIOFGFGCTflKSzjawJbRJEoXKDGhOoGespovsEQ\nx874MX0rMPaSFwIDAQABo1cwVTAOBgNVHQ8BAf8EBAMCBaAwFgYDVR0lAQH/BAww\nCgYIKwYBBQUHAwIwDAYDVR0TAQH/BAIwADAdBgNVHQ4EFgQUGu+QOa+NA1DLSvA5\nhz1CIP8U3jEwDQYJKoZIhvcNAQEFBQADgYEANgsgw3V2QWD26cDcSdXp0dmlEu9/\nQ86Br3J/jux5PrIsoMB+ecGy+yZcpY5EN640YrpzLR6TXLxYlbyXJIgFrpgGGXql\nfIuJ4V66XlmDn6qQ2W7kFmAR/nQ+qc/AtaxoFZk/nWz+4FyB3cEB2nHk5VKmv9Bv\nDTLx/UFMicX6nTA=\n-----END CERTIFICATE-----","ec2privatekey":"-----BEGIN PRIVATE KEY-----\nMIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBALX8zHWemf/OAnCXlvkjo6fIRTE4\nCiKZtp6DjYkAlW3FuKGykL4d57O2EPttuEw4sdFIaZYUUhxsWas73kkCPLjiRWhOPkFvMq+ArFzt\nJETOsxhoXlfxqfwbEg4UYUYJN+UpLONrAltEkShcoMaE6gZ6ymi+wRDHzvgxfSsw9pIXAgMBAAEC\ngYAdy7gGAeOg2C/aE1eqjsU6sTVy64PtSlF1/n/r0GamxFqITt4X4nmPGN4K7FniUN38L+jpo4YW\nFT9RI8ovFeiu7OWReO3cj0l/+I4V8HfG85uhzuZxebNmFynTsi4Celzbnn74Y5YQOhlwUZQP6iuu\noxjMUiXLf7iYMPY29ePlYQJBAP7Mf/2N3vnyOR+I5nqrbYByxwXIHH1NSF3yLkdbnogAyBGqLP44\niqsQmrf5n7cSSLDRQAbRu7KFOL1sx4sgUp8CQQC22G1u0GopJGw26Gzj/y1mt0oelaaTNsW27F4P\nHeDyXg0G1+nZqsF4NDJWPs6qclL6/eWbNOll7VKfSSBRKsWJAkEAjun3NCmaEompPqXT2KREpBI8\nzWJjkGiDmaYYDRA3iEMf9MCFwgXGyZJjpaNO0SlhOkPz7J9A7y3IGH9mIQP9MwJBAI5srWlZDKh5\nh5WJnHBIb6wH78M9HKClVIL1QRsTUgpYelsvSifT25nvRpppl/+qx7pclUI9h+RuZSJQCs1OvMkC\nQQD6FUZpTR67uEPvsEdstJO5+4m2BaUQreGGj5EN/s2CYjcQqC+zALeMmHRXh1qXPQMv4FDw7RPW\nePzcUBc2TCD+\n-----END PRIVATE KEY-----","awsaccesskeyid":"AKIAILLN2EEVC7TPWX7A","secretaccesskey":"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"}}' | ./init.cgi


    whoami: root
    init.cgi    uid: 0
    init.cgi    gid: 0
    AWS::init    Doing printKeyfiles()
    AWS::printKeyfiles    AWS::printKeyfiles()
    AWS::init    Doing setEnvironment()
    AWS::init    Doing mountData()
    Admin::AWS::mountData    whoami:	root
    AWS::mountData    create_command: ec2-create-volume --snapshot snap-55fe4a3f -s 40 -z us-east-1a -K /agua/home/admin/.keypairs/private.pem -C /agua/home/admin/.keypairs/public.pem  | grep VOLUME | cut -f2
    AWS::mountData    volumeid: vol-f665b79e
    AWS::mountData    instanceid: i-b45e61d9
    AWS::detachAttached    volumes: VOLUME	vol-4c71a324	40	snap-55fe4a3f	us-east-1a	available	2010-12-17T02:19:15+0000
     VOLUME	vol-c67caeae	40	snap-55fe4a3f	us-east-1a	available	2010-12-17T03:21:06+0000
     VOLUME	vol-1c66b474	40	snap-55fe4a3f	us-east-1a	deleting	2010-12-17T03:45:28+0000
     VOLUME	vol-1817c670	10	snap-ad23c1c0	us-east-1a	in-use	2010-12-14T21:42:58+0000
     ATTACHMENT	vol-1817c670	i-b45e61d9	/dev/sda1	attached	2010-12-16T18:17:45+0000
     VOLUME	vol-0678aa6e	100		us-east-1a	available	2010-12-17T02:57:21+0000
     VOLUME	vol-a276a4ca	100		us-east-1a	available	2010-12-17T02:29:07+0000
     VOLUME	vol-f665b79e	40	snap-55fe4a3f	us-east-1a	available	2010-12-17T04:02:33+0000
     VOLUME	vol-907caef8	100		us-east-1a	available	2010-12-17T03:22:50+0000
     VOLUME	vol-124d9f7a	40	snap-55fe4a3f	us-east-1a	available	2010-12-17T02:00:44+0000
     VOLUME	vol-5867b530	100		us-east-1a	available	2010-12-17T03:49:34+0000
    
    AWS::detachAttached    checking volumes for i-b45e61d9 and /dev/sdh
    AWS::attachVolume    attach_command: ec2-attach-volume vol-f665b79e -i i-b45e61d9 -d /dev/sdh
    AWS::attachVolume    attach_success: attaching
    ec2-describe-volumes vol-f665b79e | grep ATTACHMENT | cut -f 5
    AWS::attachVolume    counter 0 attach_success: attached
    AWS::mountData    mount_command: mount /dev/sdh /data
    AWS::mountData    mount_success: vol-f665b79e
    AWS::addToFstab    AWS::addToFstab(device, mountpoint, line)
    AWS::addToFstab    device: /dev/sdh
    AWS::addToFstab    mountpoint: /data
    AWS::addToFstab    line: /dev/sdh   /data      ext3    defaults        0 0
    
    old fstab: /dev/sda1  /         ext3    defaults        1 1
     none       /dev/pts  devpts  gid=5,mode=620  0 0
     none       /proc     proc    defaults        0 0
     none       /sys      sysfs   defaults        0 0
     /dev/sdh   /data      ext3    defaults        0 0
     /dev/sdi   /nethome      ext3    defaults        0 0
    
    backupfile: /etc/fstab.34
    new fstab: /dev/sda1  /         ext3    defaults        1 1
     none       /dev/pts  devpts  gid=5,mode=620  0 0
     none       /proc     proc    defaults        0 0
     none       /sys      sysfs   defaults        0 0
     /dev/sdi   /nethome      ext3    defaults        0 0
     /dev/sdh   /data      ext3    defaults        0 0
    
    AWS::init    Doing mountNethome()
    AWS::mountNethome    availabilityzone: us-east-1a
    AWS::mountNethome    mountpoint: /nethome
    AWS::mountNethome    size: 40
    AWS::mountNethome    device: /dev/sdi
    AWS::mountNethome    instanceid: i-b45e61d9
    AWS::mountNethome    create_command: ec2-create-volume -v --debug -s 100 -z us-east-1a | grep VOLUME | cut -f2
    AWS::mountNethome    volumeid: vol-c665b7ae
    
    AWS::detachAttached    volumes: VOLUME	vol-4c71a324	40	snap-55fe4a3f	us-east-1a	available	2010-12-17T02:19:15+0000
     VOLUME	vol-c67caeae	40	snap-55fe4a3f	us-east-1a	available	2010-12-17T03:21:06+0000
     VOLUME	vol-1c66b474	40	snap-55fe4a3f	us-east-1a	deleting	2010-12-17T03:45:28+0000
     VOLUME	vol-1817c670	10	snap-ad23c1c0	us-east-1a	in-use	2010-12-14T21:42:58+0000
     ATTACHMENT	vol-1817c670	i-b45e61d9	/dev/sda1	attached	2010-12-16T18:17:45+0000
     VOLUME	vol-0678aa6e	100		us-east-1a	available	2010-12-17T02:57:21+0000
     VOLUME	vol-c665b7ae	100		us-east-1a	available	2010-12-17T04:02:57+0000
     VOLUME	vol-a276a4ca	100		us-east-1a	available	2010-12-17T02:29:07+0000
     VOLUME	vol-f665b79e	40	snap-55fe4a3f	us-east-1a	in-use	2010-12-17T04:02:33+0000
     ATTACHMENT	vol-f665b79e	i-b45e61d9	/dev/sdh	attached	2010-12-17T04:02:44+0000
     VOLUME	vol-907caef8	100		us-east-1a	available	2010-12-17T03:22:50+0000
     VOLUME	vol-124d9f7a	40	snap-55fe4a3f	us-east-1a	available	2010-12-17T02:00:44+0000
     VOLUME	vol-5867b530	100		us-east-1a	available	2010-12-17T03:49:34+0000
    
    AWS::detachAttached    checking volumes for i-b45e61d9 and /dev/sdi
    AWS::attachVolume    attach_command: ec2-attach-volume vol-c665b7ae -i i-b45e61d9 -d /dev/sdi
    AWS::attachVolume    attach_success: attaching
    ec2-describe-volumes vol-c665b7ae | grep ATTACHMENT | cut -f 5
    AWS::attachVolume    counter 0 attach_success: attached
    AWS::mountNethome    attach_status: attached
    AWS::formatNethome    format_command: mkfs.ext3 -F /dev/sdi
    AWS::formatNethome    format_success: 
    AWS::formatNethome    mount_command: mount -t ext3 /dev/sdi /nethome
    AWS::mountNethome    mount_success: 
    AWS::addToFstab    AWS::addToFstab(device, mountpoint, line)
    AWS::addToFstab    device: /dev/sdi
    AWS::addToFstab    mountpoint: /nethome
    AWS::addToFstab    line: /dev/sdi   /nethome      ext3    defaults        0 0
    
    old fstab: /dev/sda1  /         ext3    defaults        1 1
     none       /dev/pts  devpts  gid=5,mode=620  0 0
     none       /proc     proc    defaults        0 0
     none       /sys      sysfs   defaults        0 0
     /dev/sdi   /nethome      ext3    defaults        0 0
     /dev/sdh   /data      ext3    defaults        0 0
    
    backupfile: /etc/fstab.35
    new fstab: /dev/sda1  /         ext3    defaults        1 1
     none       /dev/pts  devpts  gid=5,mode=620  0 0
     none       /proc     proc    defaults        0 0
     none       /sys      sysfs   defaults        0 0
     /dev/sdh   /data      ext3    defaults        0 0
     /dev/sdi   /nethome      ext3    defaults        0 0
    
    AWS::init    Doing mountMysql()
    AWS::mountMysql    mountpoint: /nethome
    AWS::mountMysql    device: /dev/sdi
    AWS::mountMysql    Looking for mysqldir: /nethome/mysql
    Common::copyWorkflow    copying /data/mysql to /nethome/mysql
    Common::copyWorkflow    copy result: 96
    AWS::mountMysql    stop_command: /etc/init.d/mysqld stop
    Stopping MySQL:  [  OK  ]
    AWS::addToFstab    AWS::addToFstab(device, mountpoint, line)
    AWS::addToFstab    device: /dev/sdi
    AWS::addToFstab    mountpoint: /nethome
    AWS::addToFstab    line: /dev/sdi   /nethome      ext3    defaults        0 0
    
    old fstab: /dev/sda1  /         ext3    defaults        1 1
     none       /dev/pts  devpts  gid=5,mode=620  0 0
     none       /proc     proc    defaults        0 0
     none       /sys      sysfs   defaults        0 0
     /dev/sdh   /data      ext3    defaults        0 0
     /dev/sdi   /nethome      ext3    defaults        0 0
    
    backupfile: /etc/fstab.36
    new fstab: /dev/sda1  /         ext3    defaults        1 1
     none       /dev/pts  devpts  gid=5,mode=620  0 0
     none       /proc     proc    defaults        0 0
     none       /sys      sysfs   defaults        0 0
     /dev/sdh   /data      ext3    defaults        0 0
     /dev/sdi   /nethome      ext3    defaults        0 0
    
    AWS::addToFstab    AWS::addToFstab(device, mountpoint, line)
    AWS::addToFstab    device: /dev/sdi
    AWS::addToFstab    mountpoint: /nethome/mysql/etc/mysql
    AWS::addToFstab    line: /nethome/mysql/etc/mysql /etc/mysql     none bind
    
    old fstab: /dev/sda1  /         ext3    defaults        1 1
     none       /dev/pts  devpts  gid=5,mode=620  0 0
     none       /proc     proc    defaults        0 0
     none       /sys      sysfs   defaults        0 0
     /dev/sdh   /data      ext3    defaults        0 0
     /dev/sdi   /nethome      ext3    defaults        0 0
    
    backupfile: /etc/fstab.37
    new fstab: /dev/sda1  /         ext3    defaults        1 1
     none       /dev/pts  devpts  gid=5,mode=620  0 0
     none       /proc     proc    defaults        0 0
     none       /sys      sysfs   defaults        0 0
     /dev/sdh   /data      ext3    defaults        0 0
     /nethome/mysql/etc/mysql /etc/mysql     none bind
    
    AWS::addToFstab    AWS::addToFstab(device, mountpoint, line)
    AWS::addToFstab    device: /dev/sdi
    AWS::addToFstab    mountpoint: /nethome/mysql/lib/mysql
    AWS::addToFstab    line: /nethome/mysql/lib/mysql /var/lib/mysql none bind
    
    old fstab: /dev/sda1  /         ext3    defaults        1 1
     none       /dev/pts  devpts  gid=5,mode=620  0 0
     none       /proc     proc    defaults        0 0
     none       /sys      sysfs   defaults        0 0
     /dev/sdh   /data      ext3    defaults        0 0
     /nethome/mysql/etc/mysql /etc/mysql     none bind
    
    backupfile: /etc/fstab.38
    new fstab: /dev/sda1  /         ext3    defaults        1 1
     none       /dev/pts  devpts  gid=5,mode=620  0 0
     none       /proc     proc    defaults        0 0
     none       /sys      sysfs   defaults        0 0
     /dev/sdh   /data      ext3    defaults        0 0
     /nethome/mysql/etc/mysql /etc/mysql     none bind
     /nethome/mysql/lib/mysql /var/lib/mysql none bind
    
    AWS::addToFstab    AWS::addToFstab(device, mountpoint, line)
    AWS::addToFstab    device: /dev/sdi
    AWS::addToFstab    mountpoint: /nethome/mysql/log/mysql
    AWS::addToFstab    line: /nethome/mysql/log/mysql /var/log/mysql none bind
    
    old fstab: /dev/sda1  /         ext3    defaults        1 1
     none       /dev/pts  devpts  gid=5,mode=620  0 0
     none       /proc     proc    defaults        0 0
     none       /sys      sysfs   defaults        0 0
     /dev/sdh   /data      ext3    defaults        0 0
     /nethome/mysql/etc/mysql /etc/mysql     none bind
     /nethome/mysql/lib/mysql /var/lib/mysql none bind
    
    backupfile: /etc/fstab.39
    new fstab: /dev/sda1  /         ext3    defaults        1 1
     none       /dev/pts  devpts  gid=5,mode=620  0 0
     none       /proc     proc    defaults        0 0
     none       /sys      sysfs   defaults        0 0
     /dev/sdh   /data      ext3    defaults        0 0
     /nethome/mysql/etc/mysql /etc/mysql     none bind
     /nethome/mysql/lib/mysql /var/lib/mysql none bind
     /nethome/mysql/log/mysql /var/log/mysql none bind
    
    AWS::mountMysql    mkdir /etc/mysql;
    mount /etc/mysql
    AWS::mountMysql    mkdir /var/lib/mysql;
     mount /var/lib/mysql
    AWS::mountMysql    mkdir /var/log/mysql;
    mount /var/log/mysql
    AWS::mountMysql    start_command: /etc/init.d/mysqld start
    Starting MySQL:  [  OK  ]


ec2din


RESERVATION     r-8dabece7      503401961460    default
INSTANCE        i-b45e61d9      ami-707e8819    ec2-184-72-89-249.compute-1.amazonaws.com       ip-10-117-46-135.ec2.internal   running aquarius   t1.micro 2010-12-16T18:17:35+0000        us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled     184.72.89.249   10.117.46.135                       ebs
BLOCKDEVICE     /dev/sda1       vol-1817c670    2010-12-14T21:42:59.000Z
BLOCKDEVICE     /dev/sdh        vol-f665b79e    2010-12-17T04:02:44.000Z
BLOCKDEVICE     /dev/sdi        vol-c665b7ae    2010-12-17T04:04:15.000Z



 
NOTES
-----

ORIGINAL COPY OF /etc/fstab:

/dev/sda1  /         ext3    defaults        1 1
none       /dev/pts  devpts  gid=5,mode=620  0 0
none       /proc     proc    defaults        0 0
none       /sys      sysfs   defaults        0 0
 

FINAL COPY OF /etc/fstab:

/dev/sda1  /         ext3    defaults        1 1
none       /dev/pts  devpts  gid=5,mode=620  0 0
none       /proc     proc    defaults        0 0
none       /sys      sysfs   defaults        0 0
/dev/sdh   /data      ext3    defaults       0 0
/dev/sdi   /nethome      ext3    defaults    0 0
/nethome/mysql/etc/mysql /etc/mysql     none bind
/nethome/mysql/lib/mysql /var/lib/mysql none bind
/nethome/mysql/log/mysql /var/log/mysql none bind
    




MANUAL MOUNT /data

ec2-create-volume --snapshot snap-55fe4a3f -s 40 -z us-east-1a -K /agua/home/admin/.keypairs/private.pem -C /agua/home/admin/.keypairs/public.pem  | grep VOLUME | cut -f2

vol-208c5148

ec2-attach-volume vol-208c5148 -i i-b45e61d9 -d /dev/sdh

mount /dev/sdh /data





    

STRANGE ERROR WITH CREATE VOLUME
--------------------------------

AS APACHE:

 ec2-create-volume --snapshot snap-55fe4a3f -s 40 -z us-east-1a -K /agua/home/admin/.keypairs/private.pem -C /agua/home/admin/.keypairs/public.pem
Unexpected error:
org.codehaus.xfire.fault.XFireFault: General security error; nested exception is: 
        java.security.cert.CertificateException: Unable to initialize, java.io.IOException: extra data given to DerValue constructor
        at org.codehaus.xfire.fault.XFireFault.createFault(XFireFault.java:89)
        at org.codehaus.xfire.client.Invocation.invoke(Invocation.java:83)
        at org.codehaus.xfire.client.Invocation.invoke(Invocation.java:114)
        at org.codehaus.xfire.client.Client.invoke(Client.java:336)
        at org.codehaus.xfire.client.XFireProxy.handleRequest(XFireProxy.java:77)
        at org.codehaus.xfire.client.XFireProxy.invoke(XFireProxy.java:57)
        at $Proxy12.createVolume(Unknown Source)
        at com.amazon.aes.webservices.client.Jec2.createVolume(Jec2.java:2341)
        at com.amazon.aes.webservices.client.cmd.CreateVolume.invokeOnline(CreateVolume.java:89)
        at com.amazon.aes.webservices.client.cmd.BaseCmd.invoke(BaseCmd.java:719)
        at com.amazon.aes.webservices.client.cmd.CreateVolume.main(CreateVolume.java:99)
Caused by: org.apache.ws.security.WSSecurityException: General security error; nested exception is: 
        java.security.cert.CertificateException: Unable to initialize, java.io.IOException: extra data given to DerValue constructor
        at com.amazon.aes.webservices.client.CryptoProxy.getCertificates(CryptoProxy.java:76)
        at org.apache.ws.security.message.WSSecSignature.prepare(WSSecSignature.java:286)
        at com.amazon.aes.webservices.client.Jec2.signRequest(Jec2.java:221)
        at com.amazon.aes.webservices.client.Jec2.access$000(Jec2.java:51)
        at com.amazon.aes.webservices.client.Jec2$1.invoke(Jec2.java:133)
        at org.codehaus.xfire.handler.HandlerPipeline.invoke(HandlerPipeline.java:131)
        at org.codehaus.xfire.client.Invocation.invoke(Invocation.java:79)
        ... 9 more
Caused by: java.security.cert.CertificateException: Unable to initialize, java.io.IOException: extra data given to DerValue constructor
        at sun.security.x509.X509CertImpl.< init>(X509CertImpl.java:182)
        at sun.security.provider.X509Factory.engineGenerateCertificate(X509Factory.java:101)
        at java.security.cert.CertificateFactory.generateCertificate(CertificateFactory.java:305)
        at com.amazon.aes.webservices.client.CryptoProxy.getCertByName(CryptoProxy.java:116)
        at com.amazon.aes.webservices.client.CryptoProxy.getCertificates(CryptoProxy.java:74)
        ... 15 more
Caused by: java.io.IOException: extra data given to DerValue constructor
        at sun.security.util.DerValue.init(DerValue.java:367)
        at sun.security.util.DerValue.< init>(DerValue.java:276)
        at sun.security.x509.X509CertImpl.< init>(X509CertImpl.java:179)
        ... 19 more
bash-3.2$ cat /agua/home/admin/.keypairs/public.pem
-----BEGIN CERTIFICATE-----
MIICdzCCAeCgAwIBAgIFfphks2kwDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMC
VVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMY
QVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTEwMTIxNDE5MjIzNloXDTExMTIx
NDE5MjIzNlowUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAV
BgNVBAsTDkFXUy1EZXZlbG9wZXJzMRYwFAYDVQQDEw0xZzh2czBucGg5NmZ0MIGf
MA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC1/Mx1npn/zgJwl5b5I6OnyEUxOAoi
mbaeg42JAJVtxbihspC+HeezthD7bbhMOLHRSGmWFFIcbFmrO95JAjy44kVoTj5B
bzKvgKxc7SREzrMYaF5X8an8GxIOFGFGCTflKSzjawJbRJEoXKDGhOoGespovsEQ
x874MX0rMPaSFwIDAQABo1cwVTAOBgNVHQ8BAf8EBAMCBaAwFgYDVR0lAQH/BAww
CgYIKwYBBQUHAwIwDAYDVR0TAQH/BAIwADAdBgNVHQ4EFgQUGu+QOa+NA1DLSvA5
hz1CIP8U3jEwDQYJKoZIhvcNAQEFBQADgYEANgsgw3V2QWD26cDcSdXp0dmlEu9/
Q86Br3J/jux5PrIsoMB+ecGy+yZcpY5EN640YrpzLR6TXLxYlbyXJIgFrpgGGXql
fIuJ4V66XlmDn6qQ2W7kFmAR/nQ+qc/AtaxoFZk/nWz+4FyB3cEB2nHk5VKmv9Bv
DTLx/UFMicX6nTA=-----ENDCERTIFICATE----------BEGINCERTIFICATE---
--MIICdzCCAeCgAwIBAgIFfphks2kwDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBh
MCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAx
MYQVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTEwMTIxNDE5MjIzNloXDTExMT
IxNDE5MjIzNlowUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFz
AVBgNVBAsTDkFXUy1EZXZlbG9wZXJzMRYwFAYDVQQDEw0xZzh2czBucGg5NmZ0MI
GfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC1/Mx1npn/zgJwl5b5I6OnyEUxOA
oimbaeg42JAJVtxbihspC+HeezthD7bbhMOLHRSGmWFFIcbFmrO95JAjy44kVoTj
5BbzKvgKxc7SREzrMYaF5X8an8GxIOFGFGCTflKSzjawJbRJEoXKDGhOoGespovs
EQx874MX0rMPaSFwIDAQABo1cwVTAOBgNVHQ8BAf8EBAMCBaAwFgYDVR0lAQH/BA
wwCgYIKwYBBQUHAwIwDAYDVR0TAQH/BAIwADAdBgNVHQ4EFgQUGu+QOa+NA1DLSv
A5hz1CIP8U3jEwDQYJKoZIhvcNAQEFBQADgYEANgsgw3V2QWD26cDcSdXp0dmlEu
9/Q86Br3J/jux5PrIsoMB+ecGy+yZcpY5EN640YrpzLR6TXLxYlbyXJIgFrpgGGX
qlfIuJ4V66XlmDn6qQ2W7kFmAR/nQ+qc/AtaxoFZk/nWz+4FyB3cEB2nHk5VKmv9





MUST GENERATE RSA KEY AND IMPORT
--------------------------------

ON FIRST LAUNCH OF AQUARIUS-6 WAS UNABLE TO CONNECT VIA SSH SO DID THE RSA KEY GENERATION AND import KEY ABOVE AND IT WORKED.



CONNECT AS GUNEY TO INSTANCE:


ssh -i /root/base/apps/ec2/keypair/gpademci/aquarius \
root@ec2-174-129-98-202.compute-1.amazonaws.com

    ...
    debug1: Trying private key: /root/base/apps/ec2/keypair/gpademci/aquarius
    debug1: PEM_read_PrivateKey failed
    debug1: read PEM private key done: type <  unknown>


GET INSTANCE INFO ON LINODE USING GUNEY'S KEYS:

keygp
ec2din
    RESERVATION     r-d77d3abd      503401961460    default
    INSTANCE        i-349ca059      ami-707e8819    ec2-174-129-98-202.compute-1.amazonaws.com      ip-10-202-87-178.ec2.internal       running aquarius        0               t1.micro        2010-12-14T20:04:29+0000   us-east-1a       aki-b51cf9dc    ari-b31cf9da            monitoring-disabled     174.129.98.202  10.202.87.178                       ebs                                     paravirtual
    BLOCKDEVICE     /dev/sda1       vol-40fa2b28    2010-12-14T20:04:39.000Z
    BLOCKDEVICE     /dev/sdi        vol-42fa2b2a    2010-12-14T20:04:39.000Z
    TAG     instance        i-349ca059      Name    aquarius-6




REMOVE COMMENTS IN PRIVATE KEY FILE:

---- BEGIN SSH2 ENCRYPTED PRIVATE KEY ----
Comment: "[1024-bit rsa, gbademci@BRB-629C-08, Tue Dec 14 2010 19:34:2\
8] [1024-bit rsa, gbademci@BRB-629C-08, Tue Dec 14 2010 19:34:44]"
P2/56wAAAi4AAAA3aWYtbW9kbntzaWdue3JzYS1wa2NzMS1zaGExfSxlbmNyeXB0e3JzYS
1wa2NzMXYyLW9hZXB9fQAAAARub25lAAAB3wAAAdsAAAARAQABAAAD90sno/0qJOLOhe0m
xAReFUycqIz3oZQkqXDX59xdTaBuoQNlUv+JDI7CQgUEoMdUJCyCqtoOY/GUOCuWB15EFs
bqvCDauixCj2yHFrA6GFPWhNjZCz5WiWFvV0p2spbvxsx50pD0HdUHinNV3ehE72TVRM3j
7oQx9DKFrfPoHEUAAAQAinDFAzGV3mba+XrORKoA4JsuCyb5VKAWNyOuUUjMtqoGyQDtvD
MjTTss/CqYVu9RZ8jiiWGBEwWbdCw5i538ZratJWOKBltyQetYFFi7fKuhsJCLcXCbFIUN
4djrR2e5Ib8S5ro9Zb5H5n5FmGDu1iLBIVTlXAaPWl8iiC6dfSMAAAIA8VLrcWGQE/SX8T
8rSLP/K3tKCzqe+bQkVzRUosipo52GfoWf5aF95r+RNEn92sPBs+Orf/K8YYD6HWI6n6LL
0wAAAgCDp8/Fe+NhHLLt7yUt6h9s8OEAmgb0rG+oijhURjetCnr5V/qFhzAvFiv+S5V/AH
6M+bpJWLavjSKHwU6UZe6dAAACAQENMXXGwir7ymigoHSSlyblgMCWxDSUonRRpV4tyHHP
2V/TzfegcQt+Xg/mgKWySMi6O4FUfUq27/Ovm6V3XW6/
---- END SSH2 ENCRYPTED PRIVATE KEY ----

---- BEGIN SSH2 PUBLIC KEY ----
Comment: "[1024-bit rsa, gbademci@BRB-629C-08, Tue Dec 14 2010 19:34:2\
8] [1024-bit rsa, gbademci@BRB-629C-08, Tue Dec 14 2010 19:34:44]"
AAAAB3NzaC1yc2EAAAADAQABAAAAgQCKcMUDMZXeZtr5es5EqgDgmy4LJvlUoBY3I65RSM
y2qgbJAO28MyNNOyz8KphW71FnyOKJYYETBZt0LDmLnfxmtq0lY4oGW3JB61gUWLt8q6Gw
kItxcJsUhQ3h2OtHZ7khvxLmuj1lvkfmfkWYYO7WIsEhVOVcBo9aXyKILp19Iw==
---- END SSH2 PUBLIC KEY ----

TO LOOK LIKE THIS:

---- BEGIN SSH2 ENCRYPTED PRIVATE KEY ----
P2/56wAAAi4AAAA3aWYtbW9kbntzaWdue3JzYS1wa2NzMS1zaGExfSxlbmNyeXB0e3JzYS
1wa2NzMXYyLW9hZXB9fQAAAARub25lAAAB3wAAAdsAAAARAQABAAAD90sno/0qJOLOhe0m
xAReFUycqIz3oZQkqXDX59xdTaBuoQNlUv+JDI7CQgUEoMdUJCyCqtoOY/GUOCuWB15EFs
bqvCDauixCj2yHFrA6GFPWhNjZCz5WiWFvV0p2spbvxsx50pD0HdUHinNV3ehE72TVRM3j
7oQx9DKFrfPoHEUAAAQAinDFAzGV3mba+XrORKoA4JsuCyb5VKAWNyOuUUjMtqoGyQDtvD
MjTTss/CqYVu9RZ8jiiWGBEwWbdCw5i538ZratJWOKBltyQetYFFi7fKuhsJCLcXCbFIUN
4djrR2e5Ib8S5ro9Zb5H5n5FmGDu1iLBIVTlXAaPWl8iiC6dfSMAAAIA8VLrcWGQE/SX8T
8rSLP/K3tKCzqe+bQkVzRUosipo52GfoWf5aF95r+RNEn92sPBs+Orf/K8YYD6HWI6n6LL
0wAAAgCDp8/Fe+NhHLLt7yUt6h9s8OEAmgb0rG+oijhURjetCnr5V/qFhzAvFiv+S5V/AH
6M+bpJWLavjSKHwU6UZe6dAAACAQENMXXGwir7ymigoHSSlyblgMCWxDSUonRRpV4tyHHP
2V/TzfegcQt+Xg/mgKWySMi6O4FUfUq27/Ovm6V3XW6/
---- END SSH2 ENCRYPTED PRIVATE KEY ----

---- BEGIN SSH2 PUBLIC KEY ----
AAAAB3NzaC1yc2EAAAADAQABAAAAgQCKcMUDMZXeZtr5es5EqgDgmy4LJvlUoBY3I65RSM
y2qgbJAO28MyNNOyz8KphW71FnyOKJYYETBZt0LDmLnfxmtq0lY4oGW3JB61gUWLt8q6Gw
kItxcJsUhQ3h2OtHZ7khvxLmuj1lvkfmfkWYYO7WIsEhVOVcBo9aXyKILp19Iw==
---- END SSH2 PUBLIC KEY ----

BUT STILL PROMPTED FOR PASSWORD:

ssh -i /root/base/apps/ec2/keypair/gpademci/aquarius \
root@ec2-174-129-98-202.compute-1.amazonaws.com

    Enter passphrase for key '/root/base/apps/ec2/keypair/gpademci/aquarius': 
    Permission denied (publickey,gssapi-with-mic).

ssh -i /root/base/apps/ec2/keypair/gpademci/aquarius \
root@ec2-174-129-98-202.compute-1.amazonaws.com

    
    debug1: Trying private key: /root/base/apps/ec2/keypair/gpademci/aquarius
    debug1: PEM_read_PrivateKey failed
    debug1: read PEM private key done: type <  unknown>
    Enter passphrase for key '/root/base/apps/ec2/keypair/gpademci/aquarius': 
    debug1: No more authentication methods to try.
    Permission denied (publickey,gssapi-with-mic).


SET PERMISSIONS WITH chmod 600 TO AVOID THIS ERROR:

    bad permissions: ignore key: /root/base/apps/ec2/keypair/gpademci/aquarius


cd /root/base/apps/ec2/keypair/gpademci
chmod 600 pk-2NFLCRC5BLRGVAS3TRVHQNHIIZTX3KNC.pem
chmod 600 aquarius

/root/base/apps/ec2/keypair/gpademci

    drwxr-xr-x 2 root root 4.0K Dec 14 20:48 Amazon key pairs
    -rw-r--r-- 1 root root 3.0K Dec 14 14:25 Amazon key pairs.zip
    -rw-r--r-- 1 root root  978 Dec 14 14:37 aquarius
    -rw-r--r-- 1 root root  408 Dec 14 14:37 aquarius.pub
    -rw-r--r-- 1 root root  916 Dec 14 14:22 cert-2NFLCRC5BLRGVAS3TRVHQNHIIZTX3KNC.pem
    -rwxr-xr-x 1 root root  337 Dec 14 20:54 keys.sh
    -rw-r--r-- 1 root root  926 Dec 14 14:21 pk-2NFLCRC5BLRGVAS3TRVHQNHIIZTX3KNC.pem
    -rw-r--r-- 1 root root  887 Dec 14 14:20 pk-APKAJQOAADCGJQ2E5J3A.pem
    -rw-r--r-- 1 root root  272 Dec 14 14:20 rsa-APKAJQOAADCGJQ2E5J3A.pem

</entry>

<entry [Tue Dec 14 12:55:12 EST 2010] CLOUD LINKS>

SSH KEYS xxxx
http://www.symantec.com/connect/articles/ssh-host-key-protection


CLOUD COMPUTING (AHMED KAMAL)
http://foss-boss.blogspot.com/2010/11/cloud-computing-101.html
http://foss-boss.blogspot.com/2010/11/cloud-computing-101-p2.html

UBUNTU CLOUD COMPUTING POST
http://voices.canonical.com/tag/uec/

</entry>


<entry [Tue Dec 14 00:00:05 EST 2010] TEST COMPLETED INIT SETTINGS ON AQUARIUS-5 AS SYOUNG>

INPUT AWS CREDENTIALS INTO init.html:

amazonuserid        728213020069
awsaccesskeyid	    AKIAIZXZ6S7ARZ44TTHQ
awssecretaccesskey	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

ec2publiccert
-----BEGIN CERTIFICATE-----
MIICeDCCAeGgAwIBAgIGAPU26XvIMA0GCSqGSIb3DQEBBQUAMFMxCzAJBgNVBAYTAlVTMRMwEQYDVQQKEwpBbWF6b24uY29tMQwwCgYDVQQLEwNBV1MxITAfBgNVBAMTGEFXUyBMaW1pdGVkLUFzc3VyYW5jZSBDQTAeFw0xMDEwMDQxODE0MzlaFw0xMTEwMDQxODE0MzlaMFMxCzAJBgNVBAYTAlVTMRMwEQYDVQQKEwpBbWF6b24uY29tMRcwFQYDVQQLEw5BV1MtRGV2ZWxvcGVyczEWMBQGA1UEAxMNMWdjbG41ZW5qYXcxNDCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEArakx/b3BIYoal1of5iVhZTtgGkFz5InF582kyAviP2Mceou9vcc+RdXHIc4PgTU7N37t5wGP8j9SA7u5dFWxb4TRNONqX6iPskF2DfUKlfFK1mXEp8h7ucGBbY9D4BHu07zQhNczfnjsqGlrRfmBCtrTCFNPy58KuyXceZOb5xMCAwEAAaNXMFUwDgYDVR0PAQH/BAQDAgWgMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMCMAwGA1UdEwEB/wQCMAAwHQYDVR0OBBYEFA2qXsSYvwsst1nAdM9SbVpWytCWMA0GCSqGSIb3DQEBBQUAA4GBAAtHxmSUKGMxiJXy8LjYg1DAG0Z1VYh8juWAzsYLk8I19AqvDp/Z4hB3OeGCmTyY31siCdaAwhkWHX+OIS91HzUi1Uy8774I4O3Ar1wqF5keR25avv/QZREJ68k8yucb7U/+9ds3/uPd2JHq+HyADQfPQUEJwUC8PMLuYkyOikXi
-----END CERTIFICATE-----

ec2privatekey
-----BEGIN PRIVATE KEY-----
MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAK2pMf29wSGKGpdaH+YlYWU7YBpBc+SJxefNpMgL4j9jHHqLvb3HPkXVxyHOD4E1Ozd+7ecBj/I/UgO7uXRVsW+E0TTjal+oj7JBdg31CpXxStZlxKfIe7nBgW2PQ+AR7tO80ITXM3547Khpa0X5gQra0whTT8ufCrsl3HmTm+cTAgMBAAECgYBB8ilYuRE5Ik+cwA2zAOjuX1DMR6Sx2Zu8vfvgN5sQBRwQcTZ5dcrxDBBVhwGeSE+XcGz5Nz+pd2A2qLfxNIVvOSqrFHWGLylyPxfp/L3gpvXz/5N+eZ6Y9PT18NiYWmpXEXcKEDT+Msg8Io8CiivYU+cSs1yCq1becopC+EftqQJBAPI/j6T9BlFWO2e4Bu8xxKST3Xc5Q7+6Ux3v7h0bRD225dxrE/ML1/N36GwJq7joWHtscK6+jLJOgm4uBQ9sq+UCQQC3hOXiBHDRVtk8Pn6goRTPxMxAixoqbCP6DDogkigIpuJ4iEvmAYEE4XVfqC1bjay/oHU9hn8AOP0XwAJKHkeXAkAnu28W830eyBL0PwW8I6CKEcqILHdFMg1B4sFeOsOlj6MB1PovqeiggTE4zxlAObORgsa0koJHGINiCOBBmGRVAkEAhfMHw9fP7MxCVVmcHWxVf206VGXznEFAZTNlff6QH/iHVsjM9T3lyQUzIbXkHW4kR947lMPFkQkHmr04Lpc5UwJASiBGFuHXymAL3LzH1tGxZLbWvoXgkLGEJHG2Badq9ADhxHM5OVgq8mV2oG9JJDR0NXZ3GIQGUOVC4ibdjDymrg==
-----END PRIVATE KEY-----



JSON PUT:


echo '{"username":"agua","mode":"init","data":{"username":"admin","volumesize":100,"amazonuserid":"7282130200","ec2publiccert":"-----BEGIN CERTIFICATE-----\nMIICeDCCAeGgAwIBAgIGAPU26XvIMA0GCSqGSIb3DQEBBQUAMFMxCzAJBgNVBAYTAlVTMRMwEQYDVQQKEwpBbWF6b24uY29tMQwwCgYDVQQLEwNBV1MxITAfBgNVBAMTGEFXUyBMaW1pdGVkLUFzc3VyYW5jZSBDQTAeFw0xMDEwMDQxODE0MzlaFw0xMTEwMDQxODE0MzlaMFMxCzAJBgNVBAYTAlVTMRMwEQYDVQQKEwpBbWF6b24uY29tMRcwFQYDVQQLEw5BV1MtRGV2ZWxvcGVyczEWMBQGA1UEAxMNMWdjbG41ZW5qYXcxNDCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEArakx/b3BIYoal1of5iVhZTtgGkFz5InF582kyAviP2Mceou9vcc+RdXHIc4PgTU7N37t5wGP8j9SA7u5dFWxb4TRNONqX6iPskF2DfUKlfFK1mXEp8h7ucGBbY9D4BHu07zQhNczfnjsqGlrRfmBCtrTCFNPy58KuyXceZOb5xMCAwEAAaNXMFUwDgYDVR0PAQH/BAQDAgWgMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMCMAwGA1UdEwEB/wQCMAAwHQYDVR0OBBYEFA2qXsSYvwsst1nAdM9SbVpWytCWMA0GCSqGSIb3DQEBBQUAA4GBAAtHxmSUKGMxiJXy8LjYg1DAG0Z1VYh8juWAzsYLk8I19AqvDp/Z4hB3OeGCmTyY31siCdaAwhkWHX+OIS91HzUi1Uy8774I4O3Ar1wqF5keR25avv/QZREJ68k8yucb7U/+9ds3/uPd2JHq+HyADQfPQUEJwUC8PMLuYkyOikXi\n-----END CERTIFICATE-----","ec2privatekey":"-----BEGIN PRIVATE KEY-----\nMIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAK2pMf29wSGKGpdaH+YlYWU7YBpBc+SJxefNpMgL4j9jHHqLvb3HPkXVxyHOD4E1Ozd+7ecBj/I/UgO7uXRVsW+E0TTjal+oj7JBdg31CpXxStZlxKfIe7nBgW2PQ+AR7tO80ITXM3547Khpa0X5gQra0whTT8ufCrsl3HmTm+cTAgMBAAECgYBB8ilYuRE5Ik+cwA2zAOjuX1DMR6Sx2Zu8vfvgN5sQBRwQcTZ5dcrxDBBVhwGeSE+XcGz5Nz+pd2A2qLfxNIVvOSqrFHWGLylyPxfp/L3gpvXz/5N+eZ6Y9PT18NiYWmpXEXcKEDT+Msg8Io8CiivYU+cSs1yCq1becopC+EftqQJBAPI/j6T9BlFWO2e4Bu8xxKST3Xc5Q7+6Ux3v7h0bRD225dxrE/ML1/N36GwJq7joWHtscK6+jLJOgm4uBQ9sq+UCQQC3hOXiBHDRVtk8Pn6goRTPxMxAixoqbCP6DDogkigIpuJ4iEvmAYEE4XVfqC1bjay/oHU9hn8AOP0XwAJKHkeXAkAnu28W830eyBL0PwW8I6CKEcqILHdFMg1B4sFeOsOlj6MB1PovqeiggTE4zxlAObORgsa0koJHGINiCOBBmGRVAkEAhfMHw9fP7MxCVVmcHWxVf206VGXznEFAZTNlff6QH/iHVsjM9T3lyQUzIbXkHW4kR947lMPFkQkHmr04Lpc5UwJASiBGFuHXymAL3LzH1tGxZLbWvoXgkLGEJHG2Badq9ADhxHM5OVgq8mV2oG9JJDR0NXZ3GIQGUOVC4ibdjDymrg==\n-----END PRIVATE KEY-----","awsaccesskeyid":"AKIAIZXZ6S7ARZ44TTHQ","secretaccesskey":"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"}}' | perl -U init.cgi



OUTPUT:


    
    AWS::init    Doing setEnvironment()
    AWS::init    Doing mountData()
    Admin::AWS::mountUserData    create_command: ec2-create-volume --snapshot snap-55fe4a3f -s 40 -z us-east-1a -K /agua/home/admin/.keypairs/private.pem -C /agua/home/admin/.keypairs/public.pem  | grep VOLUME | cut -f2
    Admin::AWS::mountData    volumeid: vol-e6d6078e
    
    Admin::AWS::mountData    instanceid: i-e0a3958d
    Admin::AWS::detachAttached    volumes: VOLUME   vol-e6d6078e    40      snap-55fe4a3f   us-east-1a      available       2010-12-14T18:06:32+0000
     VOLUME vol-2230e44a    10      snap-8cf6ede6   us-east-1a      in-use  2010-12-12T23:35:26+0000
     ATTACHMENT     vol-2230e44a    i-e0a3958d      /dev/sda1       attached        2010-12-12T23:35:29+0000
    
    Admin::AWS::detachAttached    checking volumes for i-e0a3958d and /dev/sdh
    Admin::AWS::attachVolume    attach_command: ec2-attach-volume vol-e6d6078e -i i-e0a3958d -d /dev/sdh
    Admin::AWS::attachVolume    attach_success: attaching
    
    Admin::AWS::attachVolume    counter 0 attach_success: attached
    Admin::AWS::attachVolume    mount_command: mount /dev/sdh /data
    Admin::AWS::attachVolume    mount_success: 
    AWS::init    Doing mountNethome()
    Admin::AWS::mountNethome    availabilityzone: us-east-1a
    Admin::AWS::mountNethome    mountpoint: /nethome
    Admin::AWS::mountNethome    size: 40
    Admin::AWS::mountNethome    device: /dev/sdi
    Admin::AWS::mountNethome    instanceid: i-e0a3958d
    Admin::AWS::mountNethome    create_command: ec2-create-volume -v --debug -s 40 -z us-east-1a | grep VOLUME | cut -f2
    Admin::AWS::mountNethome    volumeid: vol-c8d809a0
    
    Admin::AWS::detachAttached    volumes: VOLUME   vol-e6d6078e    40      snap-55fe4a3f   us-east-1a      in-use  2010-12-14T18:06:32+0000
     ATTACHMENT     vol-e6d6078e    i-e0a3958d      /dev/sdh        attached        2010-12-14T18:07:13+0000
     VOLUME vol-c8d809a0    40              us-east-1a      available       2010-12-14T18:08:14+0000
     VOLUME vol-2230e44a    10      snap-8cf6ede6   us-east-1a      in-use  2010-12-12T23:35:26+0000
     ATTACHMENT     vol-2230e44a    i-e0a3958d      /dev/sda1       attached        2010-12-12T23:35:29+0000
    
    Admin::AWS::detachAttached    checking volumes for i-e0a3958d and /dev/sdi
    Admin::AWS::attachVolume    attach_command: ec2-attach-volume vol-c8d809a0 -i i-e0a3958d -d /dev/sdi
    Admin::AWS::attachVolume    attach_success: attaching
    
    Admin::AWS::attachVolume    counter 0 attach_success: attached
    Admin::AWS::attachVolume    mount_command: mount /dev/sdi /nethome
    mount: you must specify the filesystem type
    Admin::AWS::attachVolume    mount_success: 
    mke2fs 1.39 (29-May-2006)
    Admin::AWS::formatNethome    format_success: Filesystem label=
    OS type: Linux
    Block size=4096 (log=2)
    Fragment size=4096 (log=2)
    5242880 inodes, 10485760 blocks
    524288 blocks (5.00%) reserved for the super user
    First data block=0
    Maximum filesystem blocks=4294967296
    320 block groups
    32768 blocks per group, 32768 fragments per group
    16384 inodes per group
    Superblock backups stored on blocks: 
            32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208, 
            4096000, 7962624
    
    Writing inode tables: done                            
    Creating journal (32768 blocks): done
    Writing superblocks and filesystem accounting information: done
    
    This filesystem will be automatically checked every 29 mounts or
    180 days, whichever comes first.  Use tune2fs -c or -i to override.
    
    Admin::AWS::mountNethome    mount_success: 
    fstab: /dev/sda1  /         ext3    defaults        1 1
     none       /dev/pts  devpts  gid=5,mode=620  0 0
     none       /proc     proc    defaults        0 0
     none       /sys      sysfs   defaults        0 0
     /swapfile  none      swap    sw              0 0
    
    AWS::init    Doing mountMysql()
    Admin::AWS::mountMysql    mountpoint: /nethome
    Admin::AWS::mountMysql    device: /dev/sdi
    Admin::AWS::mountMysql    Looking for mysqldir: /nethome/mysql
    Common::copyWorkflow    copying /data/mysql to /nethome/mysql
    Common::copyWorkflow    copy result: 96
    Admin::AWS::mountMysql    stop_command: /etc/init.d/mysqld stop
    Stopping MySQL:  [  OK  ]
    Admin::AWS::mountMysql    fstab: /dev/sda1  /         ext3    defaults        1 1
     none       /dev/pts  devpts  gid=5,mode=620  0 0
     none       /proc     proc    defaults        0 0
     none       /sys      sysfs   defaults        0 0
     /swapfile  none      swap    sw              0 0
    
    Admin::AWS::mountMysql    mkdir /etc/mysql;
    mount /etc/mysql
    Admin::AWS::mountMysql    mkdir /var/lib/mysql;
     mount /var/lib/mysql
    mkdir: cannot create directory `/var/lib/mysql': File exists
    Admin::AWS::mountMysql    mkdir /var/log/mysql;
    mount /var/log/mysql
    Admin::AWS::mountMysql    start_command: /etc/init.d/mysqld start
    Starting MySQL:  [  OK  ]
    [root@domU-12-31-38-04-A6-4A 0.5]# mysql -u root -p
    Enter password: 
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 2
    Server version: 5.0.77 Source distribution
    
    Type 'help;' or '\h' for help. Type '\c' to clear the buffer.
    
    mysql> use agua;
    Reading table information for completion of table and column names
    You can turn off this feature to get a quicker startup with -A
    
    Database changed
    mysql> show tables;
    +-------------------+
    | Tables_in_agua    |
    +-------------------+
    | access            | 
    | aguausers         | 
    | app               | 
    | diffs             | 
    | diffs244079       | 
    | etcgroup          | 
    | groupmember       | 
    | groups            | 
    | monitor           | 
    | parameter         | 
    | project           | 
    | report            | 
    | sessions          | 
    | source            | 
    | stage             | 
    | stagejob          | 
    | stageparameter    | 
    | users             | 
    | view              | 
    | workflow          | 
    | workflowparameter | 
    +-------------------+
    21 rows in set (0.00 sec)
    


NOTE: /data MISSING FROM /etc/fstab

cat /etc/fstab

    /dev/sda1  /         ext3    defaults        1 1
    none       /dev/pts  devpts  gid=5,mode=620  0 0
    none       /proc     proc    defaults        0 0
    none       /sys      sysfs   defaults        0 0
    /swapfile  none      swap    sw              0 0
    /dev/sdi   /nethome      ext3    defaults        0 0
    /nethome/mysql/etc/mysql /etc/mysql     none bind
    /nethome/mysql/lib/mysql /var/lib/mysql none bind
    /nethome/mysql/log/mysql /var/log/mysql none bind


ALTHOUGH SHOWN AS PROPERLY MOUNTED IN /etc/mtab

cat /etc/mtab

    /dev/sda1 / ext3 rw 0 0
    none /proc proc rw 0 0
    none /sys sysfs rw 0 0
    none /dev/pts devpts rw,gid=5,mode=620 0 0
    none /proc/sys/fs/binfmt_misc binfmt_misc rw 0 0
    /dev/sdh /data ext3 rw 0 0
    /dev/sdi /nethome ext3 rw 0 0
    /nethome/mysql/etc/mysql /etc/mysql none rw,bind 0 0
    /nethome/mysql/lib/mysql /var/lib/mysql none rw,bind 0 0
    /nethome/mysql/log/mysql /var/log/mysql none rw,bind 0 0

</entry>

<entry [Tue Dec 14 00:00:05 EST 2010] TROUBLESHOOTING INIT ON AQUARIUS-5 - JGILBERT>

1. TEST PRINTING OF KEY FILES
2. TEST MOUNT /data
3. TEST MOUNT /nethome
4. TEST MOUNT MYSQL


1. TEST PRINTING OF KEY FILES
-----------------------------


HTTPD WAS UP, SO OPENED INIT PAGE:

amazonuserid	    558277860346
awsaccesskeyid	    AKIAJWZIAB2ZZB7FHJIQ
awssecretaccesskey	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

ec2publiccert
-----BEGIN CERTIFICATE-----
MIICdzCCAeCgAwIBAgIFHoFGKBUwDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMYQVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTEwMTExOTE2NDMzNFoXDTExMTExOTE2NDMzNFowUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAVBgNVBAsTDkFXUy1EZXZlbG9wZXJzMRYwFAYDVQQDEw0xd2h3enZlN21ueGNhMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCBAssW9lEbOI1zeh5SAoUqncF6ezQ7M0ZGfgPfo/bKkmxTZitcDbHlPx8i2RDsrrhjFkBPOY6cJaguUIqZrVi80mAYlk     C/WatU0OKRMtOQsGPV7MMhMNSYD1wwN48SiDpWnF9WoSIdyXnNmywDTzPVemJWMMbCUrB9h+VppPPpEwIDAQABo1cwVTAOBgNVHQ8BAf8EBAMCBaAwFgYDVR0lAQH/BAwwCgYIKwYBBQUHAwIwDAYDVR0TAQH/BAIwADAdBgNVHQ4EFgQUls+H6G2aw4Di4BAiw39F5NjCNZswDQYJKoZIhvcNAQEFBQADgYEAbW0DkQ9+pqJO8bxoKUGgskdkJo9pzvF+5qeG/ncPyEYXj0ufrBqcEBfOmIBC0af7N5uFYZ9yvMm4QI7mR9K7Gjfmwa3pq1zHVyfNkuAd4XVdX4x4/eYGwGPDDqqqudkI0PEjYqYism14Gy9EA49oP9CWbJzhkHqqiHDjsuOAN8E=	
-----END CERTIFICATE-----

ec2privatekey

-----BEGIN PRIVATE KEY-----
MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAIECyxb2URs4jXN6HlIChSqdwXp7NDszRkZ+A9+j9sqSbFNmK1wNseU/HyLZEOyuuGMWQE85jpwlqC5QipmtWLzSYBiWQL9Zq1TQ4pEy05CwY9XswyEw1JgPXDA3jxKIOlacX1ahIh3Jec2bLANPM9V6YlYwxsJSsH2H5Wmk8+kTAgMBAAECgYA8oGFsQwjOb/8ZO1QwWfrWkhgwROHAyFHIIsQTPuxlOfYqIyNROSZWgxlQuQ1ZDKqd9gD2uieofZHRYgwgN/Qw69GuDUt9HzcNQ5yDPm3Ofa0WcD0tQa9YToHqEWVQaddc8D6DLcOwBDEropf2OIqd4JFusmenVBSIETihVKX8cQJBAM3Zs6W4nWtDExw7QlucgiKC0/R5exBk+BGVBAGHHcBTy+WXFrycUEJbj6q/PEIdGFxFvcO6GUk8x0JFGBgEB28CQQCgcNVc2Ar3kN3BAeM0xM5SVWlDYjDZwq5KId72g6CI/tcfjdpIHNI7yGlMNj4YPKOW2CAZebPLj3C74wclPUadAkEAgOcVju33baaX/fLBz/pGp3PDZHD59j8z9FabJpXEtJ4ErWWacEt2GseZRHPyOPhdO9LUTQ9pLCpqIH6B4vAK8wJAa0cnE16N7r1Z2Y1Wi9kwkBL2QI0uVtz6xyzgtfqLZC7qTvn9w4wp8rlt1vzKBlC9ncZDqGUdGHaADdGe3IKdbQJATBQ5VR3WM0lx6BrxXtHlxmmTikQ1mTlEdkjL4xJ9iXw7cRIIVdDzAait4TwuoxWxNODHlfMxK4ul8zcEE5bSlw==
-----END PRIVATE KEY-----



RAN init.cgi WITH THE FOLLOWING INPUT:

echo '{"username":"agua","mode":"init","data":{"username":"admin","volumesize":100,"amazonuserid":"5582778603","ec2publiccert":"-----BEGIN CERTIFICATE-----\nMIICdzCCAeCgAwIBAgIFHoFGKBUwDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMC\nVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMY\nQVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTEwMTExOTE2NDMzNFoXDTExMTEx\nOTE2NDMzNFowUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAV\nBgNVBAsTDkFXUy1EZXZlbG9wZXJzMRYwFAYDVQQDEw0xd2h3enZlN21ueGNhMIGf\nMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCBAssW9lEbOI1zeh5SAoUqncF6ezQ7\nM0ZGfgPfo/bKkmxTZitcDbHlPx8i2RDsrrhjFkBPOY6cJaguUIqZrVi80mAYlkC/\nWatU0OKRMtOQsGPV7MMhMNSYD1wwN48SiDpWnF9WoSIdyXnNmywDTzPVemJWMMbC\nUrB9h+VppPPpEwIDAQABo1cwVTAOBgNVHQ8BAf8EBAMCBaAwFgYDVR0lAQH/BAww\nCgYIKwYBBQUHAwIwDAYDVR0TAQH/BAIwADAdBgNVHQ4EFgQUls+H6G2aw4Di4BAi\nw39F5NjCNZswDQYJKoZIhvcNAQEFBQADgYEAbW0DkQ9+pqJO8bxoKUGgskdkJo9p\nzvF+5qeG/ncPyEYXj0ufrBqcEBfOmIBC0af7N5uFYZ9yvMm4QI7mR9K7Gjfmwa3p\nq1zHVyfNkuAd4XVdX4x4/eYGwGPDDqqqudkI0PEjYqYism14Gy9EA49oP9CWbJzh\nkHqqiHDjsuOAN8E=\n-----END CERTIFICATE-----","ec2privatekey":"-----BEGIN PRIVATE KEY-----\nMIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAIECyxb2URs4jXN6HlIChSqdwXp7\nNDszRkZ+A9+j9sqSbFNmK1wNseU/HyLZEOyuuGMWQE85jpwlqC5QipmtWLzSYBiWQL9Zq1TQ4pEy\n05CwY9XswyEw1JgPXDA3jxKIOlacX1ahIh3Jec2bLANPM9V6YlYwxsJSsH2H5Wmk8+kTAgMBAAEC\ngYA8oGFsQwjOb/8ZO1QwWfrWkhgwROHAyFHIIsQTPuxlOfYqIyNROSZWgxlQuQ1ZDKqd9gD2uieo\nfZHRYgwgN/Qw69GuDUt9HzcNQ5yDPm3Ofa0WcD0tQa9YToHqEWVQaddc8D6DLcOwBDEropf2OIqd\n4JFusmenVBSIETihVKX8cQJBAM3Zs6W4nWtDExw7QlucgiKC0/R5exBk+BGVBAGHHcBTy+WXFryc\nUEJbj6q/PEIdGFxFvcO6GUk8x0JFGBgEB28CQQCgcNVc2Ar3kN3BAeM0xM5SVWlDYjDZwq5KId72\ng6CI/tcfjdpIHNI7yGlMNj4YPKOW2CAZebPLj3C74wclPUadAkEAgOcVju33baaX/fLBz/pGp3PD\nZHD59j8z9FabJpXEtJ4ErWWacEt2GseZRHPyOPhdO9LUTQ9pLCpqIH6B4vAK8wJAa0cnE16N7r1Z\n2Y1Wi9kwkBL2QI0uVtz6xyzgtfqLZC7qTvn9w4wp8rlt1vzKBlC9ncZDqGUdGHaADdGe3IKdbQJA\nTBQ5VR3WM0lx6BrxXtHlxmmTikQ1mTlEdkjL4xJ9iXw7cRIIVdDzAait4TwuoxWxNODHlfMxK4ul\n8zcEE5bSlw==\n-----END PRIVATE KEY-----","awsaccesskeyid":"AKIAJWZIAB2ZZB7FHJIQ","secretaccesskey":"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"}}' | perl -U init.cgi


ec2-create-volume --snapshot snap-55fe4a3f -s 40 -z us-east-1a -K /agua/home/admin/.keypairs/private.pem -C /agua/home/admin/.keypairs/public.pem  | grep VOLUME | cut -f2

    vol-dc79adb4




2. TEST MOUNT /data
-------------------


AWS::init    Doing setEnvironment()
AWS::init    Doing mountData()
Admin::AWS::mountUserData    create_command: ec2-create-volume --snapshot snap-55fe4a3f -s 40 -z us-east-1a -K /agua/home/admin/.keypairs/private.pem -C /agua/home/admin/.keypairs/public.pem  | grep VOLUME | cut -f2
Admin::AWS::mountData    volumeid: vol-e67eaa8e

Admin::AWS::mountData    instanceid: i-5c90a631
Admin::AWS::detachAttached    volumes: VOLUME   vol-243aee4c    10      snap-8cf6ede6   us-east-1a      in-use  2010-12-13T00:17:38+0000
 ATTACHMENT     vol-243aee4c    i-5c90a631      /dev/sda1       attached        2010-12-13T00:17:40+0000
 VOLUME vol-4557992d    40      snap-b93276d3   us-east-1a      available       2010-12-09T14:32:51+0000
 VOLUME vol-17c30d7f    40      snap-b93276d3   us-east-1a      available       2010-12-09T06:11:21+0000
 VOLUME vol-3e449156    10      snap-7e594114   us-east-1a      in-use  2010-12-12T06:55:02+0000
 ATTACHMENT     vol-3e449156    i-6643740b      /dev/sda1       attached        2010-12-12T15:59:16+0000
 VOLUME vol-e67eaa8e    40      snap-55fe4a3f   us-east-1a      available       2010-12-13T05:00:33+0000
 VOLUME vol-4f579927    40      snap-bb3276d1   us-east-1a      available       2010-12-09T14:32:50+0000
 VOLUME vol-15c30d7d    40      snap-bb3276d1   us-east-1a      available       2010-12-09T06:11:20+0000

Admin::AWS::detachAttached    checking volumes for i-5c90a631 and /dev/sdh
Admin::AWS::detachAttached    checking volume: VOLUME   vol-243aee4c    10      snap-8cf6ede6   us-east-1a      in-use  2010-12-13T00:17:38+0000

Admin::AWS::detachAttached    checking volume: ATTACHMENT       vol-243aee4c    i-5c90a631      /dev/sda1       attached        2010-12-13T00:17:40+0000

Admin::AWS::detachAttached    checking volume: VOLUME   vol-4557992d    40      snap-b93276d3   us-east-1a      available       2010-12-09T14:32:51+0000

Admin::AWS::detachAttached    checking volume: VOLUME   vol-17c30d7f    40      snap-b93276d3   us-east-1a      available       2010-12-09T06:11:21+0000

Admin::AWS::detachAttached    checking volume: VOLUME   vol-3e449156    10      snap-7e594114   us-east-1a      in-use  2010-12-12T06:55:02+0000

Admin::AWS::detachAttached    checking volume: ATTACHMENT       vol-3e449156    i-6643740b      /dev/sda1       attached        2010-12-12T15:59:16+0000

Admin::AWS::detachAttached    checking volume: VOLUME   vol-e67eaa8e    40      snap-55fe4a3f   us-east-1a      available       2010-12-13T05:00:33+0000

Admin::AWS::detachAttached    checking volume: VOLUME   vol-4f579927    40      snap-bb3276d1   us-east-1a      available       2010-12-09T14:32:50+0000

Admin::AWS::detachAttached    checking volume: VOLUME   vol-15c30d7d    40      snap-bb3276d1   us-east-1a      available       2010-12-09T06:11:20+0000

Admin::AWS::attachVolume    attach_command: ec2-attach-volume vol-e67eaa8e -i i-5c90a631 -d /dev/sdh
Admin::AWS::attachVolume    attach_success: attaching

Admin::AWS::attachVolume    counter 0 attach_success: attached
Admin::AWS::attachVolume    mount_command: mount /dev/sdh /data
Admin::AWS::attachVolume    mount_success: 
[root@ip-10-122-217-202 0.5]# ll /data
total 48K
drwxr-xr-x  9 root root 4.0K Oct 18 23:19 .
drwxr-xr-x 28 root root 4.0K Dec 13 00:00 ..
drwxr-xr-x  3 root root 4.0K Oct 10 23:49 agua
drwxr-xr-x 53 root root 4.0K Oct 14 03:48 apps
drwxr-xr-x  3 root root 4.0K Oct 11 01:50 base
drwxr-xr-x  2 root root 4.0K Oct 18 19:56 img-mnt
drwx------  2 root root  16K Oct 10 23:43 lost+found
drwxr-xr-x  5 root root 4.0K Oct 11 01:07 mysql
drwxr-xr-x  2 root root 4.0K Oct 11 02:44 starcluster



RERAN WITH FORMATTER ADDED TO AWS.pm TO GENERATE CORRECT LINE LENGTHS BEFORE PRINTING KEYS TO FILE:

echo '{"username":"agua","mode":"init","data":{"username":"admin","volumesize":100,"amazonuserid":"5582778603","ec2publiccert":"-----BEGIN CERTIFICATE-----\nMIICdzCCAeCgAwIBAgIFHoFGKBUwDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMYQVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTEwMTExOTE2NDMzNFoXDTExMTExOTE2NDMzNFowUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAVBgNVBAsTDkFXUy1EZXZlbG9wZXJzMRYwFAYDVQQDEw0xd2h3enZlN21ueGNhMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCBAssW9lEbOI1zeh5SAoUqncF6ezQ7M0ZGfgPfo/bKkmxTZitcDbHlPx8i2RDsrrhjFkBPOY6cJaguUIqZrVi80mAYlk C/WatU0OKRMtOQsGPV7MMhMNSYD1wwN48SiDpWnF9WoSIdyXnNmywDTzPVemJWMMbCUrB9h+VppPPpEwIDAQABo1cwVTAOBgNVHQ8BAf8EBAMCBaAwFgYDVR0lAQH/BAwwCgYIKwYBBQUHAwIwDAYDVR0TAQH/BAIwADAdBgNVHQ4EFgQUls+H6G2aw4Di4BAiw39F5NjCNZswDQYJKoZIhvcNAQEFBQADgYEAbW0DkQ9+pqJO8bxoKUGgskdkJo9pzvF+5qeG/ncPyEYXj0ufrBqcEBfOmIBC0af7N5uFYZ9yvMm4QI7mR9K7Gjfmwa3pq1zHVyfNkuAd4XVdX4x4/eYGwGPDDqqqudkI0PEjYqYism14Gy9EA49oP9CWbJzhkHqqiHDjsuOAN8E=\n-----END CERTIFICATE-----","ec2privatekey":"-----BEGIN PRIVATE KEY-----\nMIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAIECyxb2URs4jXN6HlIChSqdwXp7NDszRkZ+A9+j9sqSbFNmK1wNseU/HyLZEOyuuGMWQE85jpwlqC5QipmtWLzSYBiWQL9Zq1TQ4pEy05CwY9XswyEw1JgPXDA3jxKIOlacX1ahIh3Jec2bLANPM9V6YlYwxsJSsH2H5Wmk8+kTAgMBAAECgYA8oGFsQwjOb/8ZO1QwWfrWkhgwROHAyFHIIsQTPuxlOfYqIyNROSZWgxlQuQ1ZDKqd9gD2uieofZHRYgwgN/Qw69GuDUt9HzcNQ5yDPm3Ofa0WcD0tQa9YToHqEWVQaddc8D6DLcOwBDEropf2OIqd4JFusmenVBSIETihVKX8cQJBAM3Zs6W4nWtDExw7QlucgiKC0/R5exBk+BGVBAGHHcBTy+WXFrycUEJbj6q/PEIdGFxFvcO6GUk8x0JFGBgEB28CQQCgcNVc2Ar3kN3BAeM0xM5SVWlDYjDZwq5KId72g6CI/tcfjdpIHNI7yGlMNj4YPKOW2CAZebPLj3C74wclPUadAkEAgOcVju33baaX/fLBz/pGp3PDZHD59j8z9FabJpXEtJ4ErWWacEt2GseZRHPyOPhdO9LUTQ9pLCpqIH6B4vAK8wJAa0cnE16N7r1Z2Y1Wi9kwkBL2QI0uVtz6xyzgtfqLZC7qTvn9w4wp8rlt1vzKBlC9ncZDqGUdGHaADdGe3IKdbQJATBQ5VR3WM0lx6BrxXtHlxmmTikQ1mTlEdkjL4xJ9iXw7cRIIVdDzAait4TwuoxWxNODHlfMxK4ul8zcEE5bSlw==\n-----END PRIVATE KEY-----","awsaccesskeyid":"AKIAJWZIAB2ZZB7FHJIQ","secretaccesskey":"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"}}' | perl -U init.cgi

    OK
    

3. TEST MOUNT /nethome
----------------------

    ...    
    Admin::AWS::attachVolume    counter 0 attach_success: attached
    Admin::AWS::attachVolume    mount_command: mount /dev/sdi /nethome
    mount: you must specify the filesystem type
    Admin::AWS::attachVolume    mount_success: 



mount -t ext3 /dev/sdi /nethome

        wrong fs type, bad option, bad superblock on /dev/sdi,
        missing codepage or other error
       
dmesg | tail

    hald[992]: segfault at 0000000000000000 rip 000000000041c9a5 rsp 00007fff0f2c4070 error 4
     sdh: unknown partition table
    kjournald starting.  Commit interval 5 seconds
    EXT3 FS on sdh, internal journal
    EXT3-fs: mounted filesystem with ordered data mode.
     sdi: unknown partition table
    hfs: unable to find HFS+ superblock
    hfs: unable to find HFS+ superblock
    VFS: Can't find ext3 filesystem on dev sdi.
    VFS: Can't find ext3 filesystem on dev sdi.

ADDED mkfs.ext3 CALL TO FORMAT NEW VOLUME:

ec2-attach-volume vol-026cb86a -i i-5c90a631 -d /dev/sdi

    ATTACHMENT      vol-026cb86a    i-5c90a631      /dev/sdi        attaching       2010-12-13T13:42:15+0000



REM:
INSTANCE ID: i-5c90a631


REMOVED THESE VOLUMES:

VOLUME  vol-dc79adb4    40      snap-55fe4a3f   us-east-1a      available       2010-12-13T05:15:05+0000
VOLUME  vol-026cb86a    40              us-east-1a      available       2010-12-13T05:57:56+0000
VOLUME  vol-4f579927    40      snap-bb3276d1   us-east-1a      available       2010-12-09T14:32:50+0000
VOLUME  vol-15c30d7d    40      snap-bb3276d1   us-east-1a      available       2010-12-09T06:11:20+0000

ec2-delete-volume vol-dc79adb4    
ec2-delete-volume vol-026cb86a
ec2-delete-volume vol-4f579927
ec2-delete-volume vol-15c30d7d


ec2din

RESERVATION     r-cb6813a1      558277860346    default
INSTANCE        i-5c90a631      ami-3e19ef57    ec2-67-202-12-171.compute-1.amazonaws.com       ip-10-122-217-202.ec2.internal       running aquarius        0               t1.micro        2010-12-13T00:17:30+0000        us-east-1a      aki-b51cf9dcari-b31cf9da             monitoring-disabled     67.202.12.171   10.122.217.202                  ebs
BLOCKDEVICE     /dev/sda1       vol-243aee4c    2010-12-13T00:17:38.000Z
BLOCKDEVICE     /dev/sdh        vol-e67eaa8e    2010-12-13T05:01:46.000Z
BLOCKDEVICE     /dev/sdi        vol-ce1bcda6    2010-12-14T05:29:24.000Z



CREATE AND ATTACH VOLUME:

NB: HAD TO REBOOT TO MAKE IT ATTACH (WOULD HANG AS 'ATTACHING')

ec2-create-volume -s 40 -z us-east-1a 

    VOLUME  vol-4400d62c    40              us-east-1a      creating        2010-12-14T06:06:35+0000

ec2-attach-volume vol-4400d62c -i i-5c90a631 -d /dev/sdi

    ATTACHMENT      vol-4400d62c    i-5c90a631      /dev/sdi        attaching       2010-12-14T06:07:21+0000

ec2din

ATTACHMENT      vol-4400d62c    i-5c90a631      /dev/sdi        attached        2010-12-14T06:07:21+0000



FORMAT FILESYSTEM TO AVOID ERROR: 'mount: wrong fs type, bad option, bad superblock on /dev/sdi'

mkfs.ext3 vol-026cb86a


mkfs -t ext3 /dev/sdi
    
    mke2fs 1.39 (29-May-2006)
    /dev/sdi is entire device, not just one partition!
    Proceed anyway? (y,n) y
    Filesystem label=
    OS type: Linux
    Block size=4096 (log=2)
    Fragment size=4096 (log=2)
    5242880 inodes, 10485760 blocks
    524288 blocks (5.00%) reserved for the super user
    First data block=0
    Maximum filesystem blocks=4294967296
    320 block groups
    32768 blocks per group, 32768 fragments per group
    16384 inodes per group
    Superblock backups stored on blocks: 
            32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208, 
            4096000, 7962624
    
    Writing inode tables: done      
    Creating journal (32768 blocks): done
    Writing superblocks and filesystem accounting information: done
    
    This filesystem will be automatically checked every 26 mounts or
    180 days, whichever comes first.  Use tune2fs -c or -i to override.



mount -t ext3 /dev/sdi /nethome
ll /nethome
    total 24K
    drwxr-xr-x  3 root root 4.0K Dec 14 01:18 .
    drwxr-xr-x 28 root root 4.0K Dec 14 01:02 ..
    drwx------  2 root root  16K Dec 14 01:18 lost+found

    OK!!
    
    
4. TEST MOUNT MYSQL
-------------------


AWS::init    Doing mountMysql()
Admin::AWS::mountMysql    mountpoint: /nethome
Admin::AWS::mountMysql    device: /dev/sdi
Admin::AWS::mountMysql    Looking for mysqldir: /nethome/mysql
Common::copyWorkflow    copying /data/mysql to /nethome/mysql
Common::copyWorkflow    copy result: 96
Admin::AWS::mountMysql    stop_command: /etc/init.d/mysqld stop
Stopping MySQL:  [  OK  ]
Admin::AWS::mountMysql    fstab: /dev/sda1  /         ext3    defaults        1 1
 none       /dev/pts  devpts  gid=5,mode=620  0 0
 none       /proc     proc    defaults        0 0
 none       /sys      sysfs   defaults        0 0
 /swapfile  none      swap    sw              0 0

Admin::AWS::mountMysql    mkdir /etc/mysql;
mount /etc/mysql
Admin::AWS::mountMysql    mkdir /var/lib/mysql;
 mount /var/lib/mysql
mkdir: cannot create directory `/var/lib/mysql': File exists
Admin::AWS::mountMysql    mkdir /var/log/mysql;
mount /var/log/mysql
Admin::AWS::mountMysql    start_command: /etc/init.d/mysqld start
Starting MySQL:  [  OK  ]
[root@ip-10-122-217-202 0.5]# 
[root@ip-10-122-217-202 0.5]# 
[root@ip-10-122-217-202 0.5]# mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 2
Server version: 5.0.77 Source distribution

Type 'help;' or '\h' for help. Type '\c' to clear the buffer.

mysql> use agua;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+-------------------+
| Tables_in_agua    |
+-------------------+
| access            | 
| aguausers         | 
| app               | 
| diffs             | 
| diffs244079       | 
| etcgroup          | 
| groupmember       | 
| groups            | 
| monitor           | 
| parameter         | 
| project           | 
| report            | 
| sessions          | 
| source            | 
| stage             | 
| stagejob          | 
| stageparameter    | 
| users             | 
| view              | 
| workflow          | 
| workflowparameter | 
+-------------------+
21 rows in set (0.00 sec)

    OK!

    
    
    
NOTES
------

NON-INTERACTIVE VOLUME FORMAT AND MOUNT 
---------------------------------------


1. USE mkfs.ext3 -F /dev/sdi TO FORMAT THE VOLUME (AS YET NOT MOUNTED)


JGILBERT ON AQUARIUS-5

mkfs.ext3 -F /dev/sdi

    mke2fs 1.39 (29-May-2006)
    Filesystem label=
    OS type: Linux
    Block size=4096 (log=2)
    Fragment size=4096 (log=2)
    5242880 inodes, 10485760 blocks
    524288 blocks (5.00%) reserved for the super user
    First data block=0
    Maximum filesystem blocks=4294967296
    320 block groups
    32768 blocks per group, 32768 fragments per group
    16384 inodes per group
    Superblock backups stored on blocks: 
            32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208, 
            4096000, 7962624
    
    Writing inode tables: done                            
    Creating journal (32768 blocks): done
    Writing superblocks and filesystem accounting information: done
    
    This filesystem will be automatically checked every 30 mounts or
    180 days, whichever comes first.  Use tune2fs -c or -i to override.


2. MOUNT THE VOLUME WITH mount -t ext3 /dev/sdi /nethome

cat /etc/mtab

    /dev/sda1 / ext3 rw 0 0
    none /proc proc rw 0 0
    none /sys sysfs rw 0 0
    none /dev/pts devpts rw,gid=5,mode=620 0 0
    none /proc/sys/fs/binfmt_misc binfmt_misc rw 0 0
    /dev/sdh /data ext3 rw 0 0

mount -t ext3 /dev/sdi /nethome
    OK

cat /etc/mtab

    /dev/sda1 / ext3 rw 0 0
    none /proc proc rw 0 0
    none /sys sysfs rw 0 0
    none /dev/pts devpts rw,gid=5,mode=620 0 0
    none /proc/sys/fs/binfmt_misc binfmt_misc rw 0 0
    /dev/sdh /data ext3 rw 0 0
    /dev/sdi /nethome ext3 rw 0 0






mkfs - system sees device busy & cannot force

http://forums.fedoraforum.org/showthread.php?t=210015

Fedora 10

This is a system that is in high usage and not easy to reboot.

The system sees the filesystem as busy and will not force a mkfs. How can I tell the system the filesystem is not in use?

[root@b /]# lsof /scratch
[root@b /]# sudo umount /scratch
umount: /scratch: device is busy
umount: /scratch: device is busy
[root@b /]# sudo umount -l /scratch
[root@b /]# sudo mount /scratch
[root@b /]# lsof /scratch
[root@b /]# sudo umount /scratch
[root@b /]# mkfs.xfs -f /dev/sda8
mkfs.xfs: /dev/sda8 contains a mounted filesystem
[root@b /]# mkfs -F /dev/sda8
mke2fs 1.41.3 (12-Oct-2008)
/dev/sda8 is apparently in use by the system; will not make a filesystem here!

/dev/sda8 is not in /etc/mtab. I can't figure out how to tell the system this filesystem is not mounted or in use.

This is output from "strace mkfs -F /dev/sda8" 
stat("/dev/sda8", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 8), ...}) = 0
open("/dev/sda8", O_RDONLY|O_EXCL) = -1 EBUSY (Device or resource busy)
write(2, "/dev/sda8 is apparently in use b"..., 46/dev/sda8 is apparently in use by the system; ) = 46
write(2, "will not make a filesystem here!"..., 33will not make a filesystem here!

Suggestions appreciated.





I think what you want to do is
Code:
lsof +D /scratch
and not just lsof /scratch.
And I don't think you need to use sudo when running as root.




</entry>



<entry [Tue Dec 14 00:00:04 EST 2010] USE ec2-import-keypair BEFORE RUNNING INSTANCE - SYOUNG>



SYOUNG
------


CREATE AN rsa KEYPAIR:

cd /root/base/apps/ec2/keypair/syoung

ssh-keygen -t rsa

    Generating public/private rsa key pair.
    Enter file in which to save the key (/root/.ssh/id_rsa): /root/base/apps/ec2/keypair/syoung/aquarius_rsa
    Enter passphrase (empty for no passphrase): 
    Enter same passphrase again: 
    Your identification has been saved in /root/base/apps/ec2/keypair/syoung/aquarius_rsa.
    Your public key has been saved in /root/base/apps/ec2/keypair/syoung/aquarius_rsa.pub.
    The key fingerprint is:
    31:5f:f4:ec:2a:df:78:9a:39:0a:4e:ad:26:f0:74:b3 root@li182-248


cat /root/base/apps/ec2/keypair/syoung/aquarius_rsa

    -----BEGIN RSA PRIVATE KEY-----
    MIIEoQIBAAKCAQEAwLfISpACAJLmhrcjSywBGNp8ZnV9sCBj77Vicp9yqewfv+Nl
    +Qs770N+rL6ud/P7HKDhCoalA1VToQSGGKZQKNBbPuFSpDm01eIf6pTLDDtmz17E
    UOiOYJO/2v0m6tHPfZkKTsLafXWVXkmoSjeuuxDEu/N2CTuFSKsKrTrw0h8m+a9/
    dvITARDknMaBKhoZp3TTNgKB04JafWpxHyjZd8bPkEUxR+kTafKn437bYE78MQpN
    rTaUPP2OJWyUrgev4wLPAvojFPPV+7NaLnGx/4vSX36H9RAvR7hz0im7hv4cmQkd
    OqwQgmnBdHH+p/T2xx2m9hgOqnwDqNkslVv0ewIBIwKCAQB+pKgw/4xJhRslU8a8
    Xr7kclG/rEtH2sVUYUCxuTy4zl4BwVGjqEv1AHfQmo/obSFb9LEkLJhSpck97Qep
    zGCP2WCIaC7+NIzHEPBm9BBnH7iW5oEB9+iIm5tVZIdJ2lUmpmXb/GOxh8iOauru
    8WQxyTDTSDefqsVNAq8+oxNIPza8zdi+swiqBFBCWhvoPVikZnDTyB7VVGvXi8OX
    ByEscf0t2NRxvBoyrl3syWgN/vt90fvIiVNtSSGFO5dSeTnHJiQidU2NvVbD4GLu
    P9EGK+7eBDJwHg3vkK6cHE1yWzAOLiEbW/htbZ6AzkcevRX9kzCKWLkYXU/QO+8t
    fi+LAoGBAO7xqQKaVqU767UbhW63FFnwjldtE6ZuA7O9aXA5Yidjgt649/xtEE4Z
    PC00piExUTvHNz6c9L7vCQNnW8ZAIfd6ZjuOn1EAQhjc1ZTLMmz33hjZLlCmzM0K
    rH/V8bVPewyUJ5/is8X5z7NRzfv9xi7dPRZRC0wVsKu/YHi6e7R7AoGBAM55aRGk
    Js/j0LVfEP4+ItSmdx4BF16QKrS6yCUseRBLEOoA1rnq/U+JJ5K10sLLx6XiAtKy
    kkAW9I9in90Gp65mFJ8/6xlIIk9Y954lNzN4uMh3PrLmbrE0qjgwDPSJfd0m9FYY
    E0rtNgasi4AtfliJZME2skS9oYVpz5XNTMABAoGAeuKusOGo50NjRzK5pqdMS4MH
    YCl30e9vnkQnmM0N6F8QGsWG2Zcs9PcJAU5Gzz3vQ1CCz75vPZ+A+m+riodh7P0e
    oklZP5m7l8IHcRgLTfvRTpuUKXpaspfGbaE6eoClrrKYCRWBBrr9GmSV0g173ZZZ
    7jhO8+3l1KuQsx4Tu+cCgYEAjZUU2OWW9PP81CPuZTHr/4gXKoRny9CSUAsM5kph
    pMXCdJLcYjq8U8vDXUl6lDP2naJLFCKtbcaZEd06a6zKwLsG05mLRIk8GScQMe2i
    Mexhc4T3yyGq/SttaFt2mQ3SpkaY6pQqfIVm4AFJtvqfx66rfSzSA0A0Pjntbgke
    r4sCgYBGZ9epUOdm72l80uScoNvZKWzLjEEud+dCfI8VLtSbu1pXoZZmQXq4oCBA
    42rMIiIa3vTXytjG8aZYVwvaOYC2ZZnYoBCtv0lo6NbwnWkyPkAt9akDQrbN/Lrt
    WeB5MY3CpLCHJ5NBQD692JgC6ujB/ho7ivTlKRv8wXlQGWbGOQ==
    -----END RSA PRIVATE KEY-----


cat /root/base/apps/ec2/keypair/syoung/aquarius_rsa.pub
 
    ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAwLfISpACAJLmhrcjSywBGNp8ZnV9sCBj77Vicp9yqewfv+Nl+Qs770N+rL6ud/P7HKDhCoalA1VToQSGGKZQKNBbPuFSpDm01eIf6pTLDDtmz17EUOiOYJO/2v0m6tHPfZkKTsLafXWVXkmoSjeuuxDEu/N2CTuFSKsKrTrw0h8m+a9/dvITARDknMaBKhoZp3TTNgKB04JafWpxHyjZd8bPkEUxR+kTafKn437bYE78MQpNrTaUPP2OJWyUrgev4wLPAvojFPPV+7NaLnGx/4vSX36H9RAvR7hz0im7hv4cmQkdOqwQgmnBdHH+p/T2xx2m9hgOqnwDqNkslVv0ew== root@li182-248



PASS PUBLIC KEY TO AMAZON:

ec2-import-keypair \
--debug \
aquarius \
--public-key-file /root/base/apps/ec2/keypair/syoung/aquarius_rsa.pub \
-U https://ec2.amazonaws.com 

    KEYPAIR aquarius        08:a5:8c:fc:47:e4:9a:f4:8e:1e:e9:b6:22:aa:bb:6e


LAUNCH AQUARIUS-5 USING THIS KEYPAIR:


ec2-run-instances \
--key aquarius \
ami-3e19ef57 \
--instance-type t1.micro \
-z us-east-1a 

    RESERVATION     r-eb7d0681      728213020069    default
    INSTANCE        i-e0a3958d      ami-3e19ef57                    pending aquarius        0    t1.micro 2010-12-12T23:35:18+0000        us-east-1a      aki-b51cf9dc    ari-b31cf9da         monitoring-disabled                                      ebs                                  paravirtual


ec2din

    RESERVATION     r-eb7d0681      728213020069    default
    INSTANCE        i-e0a3958d      ami-3e19ef57    ec2-174-129-160-144.compute-1.amazonaws.com    domU-12-31-38-04-A6-4A.compute-1.internal        running aquarius        0               t1.micr2010-12-12T23:35:18+0000 us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled     174.129.160.144 10.220.165.180                  ebs                                    paravirtual
    BLOCKDEVICE     /dev/sda1       vol-2230e44a    2010-12-12T23:35:26.000Z



CONNECTED:

ssh -i /root/base/apps/ec2/keypair/syoung/aquarius_rsa \
root@ec2-174-129-160-144.compute-1.amazonaws.com

    OK
    




JGILBERT 
--------



cd /root/base/apps/ec2/keypair/jgilbert

ssh-keygen -t rsa

    Generating public/private rsa key pair.
    Enter file in which to save the key (/root/.ssh/id_rsa): /root/base/apps/ec2/keypair/jgilbert/aquarius_rsa
    Enter passphrase (empty for no passphrase): 
    Enter same passphrase again: 
    Your identification has been saved in /root/base/apps/ec2/keypair/jgilbert/aquarius_rsa.
    Your public key has been saved in /root/base/apps/ec2/keypair/jgilbert/aquarius_rsa.pub.
    The key fingerprint is:
    26:a7:64:3e:c2:8e:09:22:2f:94:83:0e:94:16:95:40 root@li182-248


cat /root/base/apps/ec2/keypair/jgilbert/aquarius_rsa

    -----BEGIN RSA PRIVATE KEY-----
    MIIEogIBAAKCAQEA0ScMFs4YXrlijHyCbx9jAUKxmTix4EFCUq6qyr3H+y4aFeYG
    9x/BJob10o+tH0F2cUs/dvxctPXqUXgEEXX/ztu2ax78Ag0Pv15zSjTNWJQkUoHz
    b1X00R5SlnlxepFv/JqiFk37b1jhYGtIqd6Q7BiifBiVns24Oi/dWo9DvzdlXv8P
    0m97qnk7FVRxGlPrpAf1dUQwC17XAq4IcG/WJI6xP7ytCiwdtvrgacH8MQJMzIQs
    Nw7VFKqD3XVeWI7xVHP4Cm0494/XoFpgkFKdjQ3aXuXlkiV4lnF4UJsl4Ov5z322
    3xQVD2YPxAl9aGxJc+z7BoI70gqMZIDDDmT6dwIBIwKCAQEAoVii7QVjQcI2FJqQ
    gZveqTNzD8ymecvxVbnxd9Q7L3tV86LSLFpTLFl7zlGULg3tp9r2cbtddafDY2s2
    VpzbR84QYUPJuHB53MU0XdD2LmOm/dH2TpLELEqXe2T/xPPaDAJChjwoXTXvsMfK
    VygJZayamj7Z0kbtNDONgF/jzgTDLXfQ8gZJgxbRo9bXNDmBi/E6rSy8NRZyY02C
    F1yT6Sgdkjzif8Wvc6kcj+ORO9nQCgOhG5AP/+pZIUQQnaDVcCtFH4kgBYDPvpVV
    dnYy0XrPBiL2tzaGHlg/iJ8PVMkLbg5EmKzosZ+TZv81beExMBO0NUPt5Wq8UFaL
    lhneOwKBgQD9KcTLKZ6e8/z0nR99EEiGcEPY7cbevRapbUfRkSwQOLtp80oIaKMZ
    ImRsx+pNmDma3yXG+c3dhd+lTFixHvkNrPDACsK/qyE89sa2K/oRaBOPpV4DcmFU
    TVbbxB3rvJRn6FWKSFNcTwbMR2rT/+JHEIuC08NLe8lxDF43k+jT6QKBgQDTfwc/
    SSeG5qEQyb+kLqRn8CMcUauftCGZTY/2iBed44LVHRo8ppI9llxrDT7o2Wv5lIkZ
    IwF6hWutZf1VUM7h8C6u/LZZRUxd9OUMMxSpFW4O8/JDfh6l1eqWCst7mf2fh+ZF
    cgaBoTsSocWdCYKJvMMvx8WyeLa+7/41WRg/XwKBgA53alTAjLigOlce69tCwlDT
    NxO10NmHJd3LuvYIS6kn0DHwpSUNSyYB9xwork2Tq4UxUp2n3+DF0kP1u+zdMs2U
    2o6hh3iqsXEyrETskfJdt/mUa8Wuw7uspeCsHveHHmxWa0m6/XL9M5ak/spJIt99
    Scz2KGq2ncvyFAMtBf17AoGAGCvGUGAhxkY+Sw++IWRqj4kolYWtNtLCAuRK95qG
    Wy/xsfSyipaxoKN4Rr+vaxGIrs8lnHkHe7d6BTA6NaLV0K28MUFz7PH6GV3RCLVh
    cmjZYMtsJPh4h/swwLDGzEwc/EoLsCpJ4u3a3Y7UwX1uARzjG2dJy0D+8T//y5Un
    V7MCgYEAq9lVGi8JM3PuQMKiBSL8pNenmmxDd4vlS8HHB+68zLJfCblwa6sUYOnL
    ktGsUDJUw/67nRE2n0sGaBUyH1kn2QETz7VkyQMU6EL8ghRIkiEEUWyErYUa6P0S
    4Mm/54hYllmAcOPXD+W6RxrckTGzAve5iVaUrrBmq8DwVmzmJQ8=
    -----END RSA PRIVATE KEY-----


cat /root/base/apps/ec2/keypair/jgilbert/aquarius_rsa.pub
 
    ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA0ScMFs4YXrlijHyCbx9jAUKxmTix4EFCUq6qyr3H+y4aFeYG9x/BJob10o+tH0F2cUs/dvxctPXqUXgEEXX/ztu2ax78Ag0Pv15zSjTNWJQkUoHzb1X00R5SlnlxepFv/JqiFk37b1jhYGtIqd6Q7BiifBiVns24Oi/dWo9DvzdlXv8P0m97qnk7FVRxGlPrpAf1dUQwC17XAq4IcG/WJI6xP7ytCiwdtvrgacH8MQJMzIQsNw7VFKqD3XVeWI7xVHP4Cm0494/XoFpgkFKdjQ3aXuXlkiV4lnF4UJsl4Ov5z3223xQVD2YPxAl9aGxJc+z7BoI70gqMZIDDDmT6dw== root@li182-248 


PASS PUBLIC KEY TO AMAZON:

ec2-import-keypair \
--debug \
aquarius \
--public-key-file /root/base/apps/ec2/keypair/jgilbert/aquarius_rsa.pub \
-U https://ec2.amazonaws.com 

    KEYPAIR aquarius        03:b7:c5:f0:a6:e7:6b:af:3d:8a:68:ff:ec:f1:d6:05
    #KEYPAIR aquarius        08:a5:8c:fc:47:e4:9a:f4:8e:1e:e9:b6:22:aa:bb:6e



LAUNCH AQUARIUS-5 USING THIS KEYPAIR:

ec2-run-instances \
--key aquarius \
ami-3e19ef57 \
--instance-type t1.micro \
-z us-east-1a 

    RESERVATION     r-cb6813a1      558277860346    default
    INSTANCE        i-5c90a631      ami-3e19ef57                    pending aquarius        0      t1.micro 2010-12-13T00:17:30+0000        us-east-1a      aki-b51cf9dc    ari-b31cf9da           monitoring-disabled                                      ebs                                    paravirtual

ec2din

    RESERVATION     r-cb6813a1      558277860346    default
    INSTANCE        i-5c90a631      ami-3e19ef57    ec2-67-202-12-171.compute-1.amazonaws.com      ip-10-122-217-202.ec2.internal   running aquarius        0               t1.micro        2010-12-13T00:17:30+0000        us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled     67.202.12.171   10.122.217.202                  ebs                                    paravirtual
    BLOCKDEVICE     /dev/sda1       vol-243aee4c    2010-12-13T00:17:38.000Z


CONNECTED SUCCESFULLY:

ssh -i /root/base/apps/ec2/keypair/jgilbert/aquarius_rsa \
root@ec2-67-202-12-171.compute-1.amazonaws.com
    
    The authenticity of host 'ec2-67-202-12-171.compute-1.amazonaws.com (67.202.12.171)' can't be established.
    RSA key fingerprint is 4f:8c:78:d2:48:fc:a1:88:da:3b:c9:ee:95:18:11:6d.
    Are you sure you want to continue connecting (yes/no)? yes
    Warning: Permanently added 'ec2-67-202-12-171.compute-1.amazonaws.com,67.202.12.171' (RSA) to the list of known hosts.
    Last login: Sun Dec 12 11:16:45 2010 from 173.230.142.248
         ___   _        __   __   ____            __    
        / _ \ (_)___ _ / /  / /_ / __/____ ___ _ / /___ 
       / , _// // _ `// _ \/ __/_\ \ / __// _ `// // -_)
      /_/|_|/_/ \_, //_//_/\__//___/ \__/ \_,_//_/ \__/ 
               /___/                                                 
                                                  
    Welcome to a public Amazon EC2 image brought to you by RightScale!
    
    ********************************************************************
    ********************************************************************
    ***       Your EC2 Instance is now operational.                  ***
    ***       All of the configuration has completed.                ***
    ***       Please check /var/log/install for details.             ***
    ********************************************************************
    ********************************************************************

    OK




</entry>


