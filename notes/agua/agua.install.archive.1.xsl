agua.install.archive.1

<entry [Fri 2011:04:29 16:59:00 EST] CREATED archive.pl TO ARCHIVE Agua>

./archive.pl \
--name agua \
--basedir /home/syoung/0.6 \
--version 0.6 \
--versionfile bin/scripts/resources/VERSION \
--outputdir /home/syoung

WHICH RUNS:

git archive --format=tar --prefix=0.6-48-35e0670/ HEAD | gzip > /home/syoung/RELEASE/0.6/agua.0.6-48-35e0670.tar.gz

1. GET THE COMMIT COUNT
git log --pretty=format:'' | wc -l
    46

2. GET THE SHORT SHA KEY:
git rev-parse --short HEAD
    121f106 

3. CHANGE VERSION FILE

4. CREATE PACKAGE

mkdir -p /home/syoung/RELEASE/0.6
git archive --format=tar --prefix=0.6-46-121f106/ HEAD | gzip > /home/syoung/RELEASE/0.6/agua.0.6-46-121f106.tar.gz  

</entry>
<entry [Fri 2011:04:29 03:39:00 EST] RE-TESTING INIT>

mountData METHOD
----------------

PROBLEM:

HOW TO FULLY DETACH AN EXISTING VOLUME FROM /data
	
#### INITIALIZE PHYSICAL VOLUME
##	pvcreate /dev/sdb1 /dev/sdc1 /dev/sdd1 /dev/sde1
##	pvcreate
##  Please enter a physical volume path
##  Run `pvcreate --help' for more information.
##	[root@domU-12-31-38-04-26-69 ~]# pvcreate --help
##  pvcreate: Initialize physical volume(s) for use by LVM


SOLUTION:

https://forums.aws.amazon.com/message.jspa?messageID=126446

1. UNMOUNT DEVICE
2. DETACH AND WAIT
3. USE FORCE IF NOT 'available'
4. CHECK WITH fsck /dev/sdX IF USED FORCE
5. RETURN 1 IF 'available'
6. REBOOT IF NOT 'available'



FAILURE ON AQ8B
---------------

Client.AuthFailure: Not authorized for instances: [i-408fd02f]

whoami: root
AWS::init     AWS::init()
AWS::init    Doing printKeyfiles()
AWS::printKeyfiles    AWS::printKeyfiles()
AWS::get_publicfile    AWS::get_publicfile()
AWS:printKeyfiles       publicfile: /agua/0.6/conf/admin/.keypairs/public.pem
AWS:printKeyfiles       privatefile: /agua/0.6/conf/admin/.keypairs/private.pem 
AWS::createKeydir    AWS::createKeydir()
AWS::createKeydir    keydir: /agua/0.6/conf/admin/.keypairs
AWS::init    Doing setEnvironment()
AWS::get_publicfile    AWS::get_publicfile()
AWS::init    Doing mountData()
Admin::AWS::mountData    snapshot: snap-55fe4a3f	Admin::AWS::mountData    using custom datavolumesize: 	40
Admin::AWS::mountData    size: 40	Admin::AWS::mountData    printenv:
MANPATH=/opt/sge6/man
TERM=xterm
SHELL=/bin/bash
CLICOLOR=1
XDG_SESSION_COOKIE=90ae74bd0a3b9783f3f23f0c4c6d35df-1304041866.961761-871726365
SSH_CLIENT=129.171.150.136 39023 22
SGE_CELL=default
SSH_TTY=/dev/pts/3
USER=root
LS_COLORS=rs=0:di=01;34:ln=01;36:hl=44;37:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:
EC2_HOME=/usr
MAIL=/var/mail/root
PATH=/usr/bin:/usr/bin:/opt/sge6/bin/lx24-amd64:/agua/bin/apps/logic:/usr/bin:/opt/sge6/bin/lx24-amd64:/agua/bin/apps/logic:/usr/bin:/opt/sge6/bin/lx24-amd64:/agua/bin/apps/logic:/usr/bin:/opt/sge6/bin/lx24AWS::mountData    volumeid: vol-974683fc
AWS::untaint    string: i-408fd02f
AWS::mountData    instanceid: i-408fd02f
AWS::detachAttached    volumes: VOLUME	vol-05ae6b6e	40	snap-55fe4a3f	us-east-1a	available	2011-04-28T18:58:36+0000
 VOLUME	vol-adae6bc6	40	snap-55fe4a3f	us-east-1a	available	2011-04-28T18:59:16+0000
 VOLUME	vol-cdb376a6	40	snap-55fe4a3f	us-east-1a	available	2011-04-28T19:26:57+0000
 VOLUME	vol-f9478292	40	snap-55fe4a3f	us-east-1a	available	2011-04-29T02:08:41+0000
 VOLUME	vol-dc72e1b4	10	snap-97dee7fa	us-east-1a	in-use	2011-02-02T18:21:17+0000
 ATTACHMENT	vol-dc72e1b4	i-e9af3b85	/dev/sda1	attached	2011-02-02T18:21:19+0000
 VOLUME	vol-0141846a	40	snap-55fe4a3f	us-east-1a	available	2011-04-29T02:14:48+0000
 VOLUME	vol-d072e1b8	40	snap-93dee7fe	us-east-1a	in-use	2011-02-02T18:21:18+0000
 ATTACHMENT	vol-d072e1b8	i-e9af3b85	/dev/sdi	attached	2011-02-02T18:21:19+0000
 VOLUME	vol-974683fc	40	snap-55fe4a3f	us-east-1a	available	2011-04-29T02:13:21+0000
 VOLUME	vol-de72e1b6	40	snap-91dee7fc	us-east-1a	in-use	2011-02-02T18:21:18+0000
 ATTACHMENT	vol-de72e1b6	i-e9af3b85	/dev/sdh	attached	2011-02-02T18:21:19+0000
 VOLUME	vol-7665bf1e	40	snap-55fe4a3f	us-east-1a	in-use	2010-12-24T09:14:47+0000
 VOLUME	vol-83af6ae8	40	snap-55fe4a3f	us-east-1a	available	2011-04-28T18:57:12+0000
 VOLUME	vol-f5f20f9e	15	snap-c54ef9aa	us-east-1a	in-use	2011-04-22T21:21:49+0000
 ATTACHMENT	vol-f5f20f9e	i-004d1c6f	/dev/sda1	attached	2011-04-22T21:22:08+0000
 VOLUME	vol-81b673ea	40	snap-55fe4a3f	us-east-1a	available	2011-04-28T19:20:29+0000

AWS::detachAttached    checking volumes for i-408fd02f and /dev/sdh
AWS::untaint    string: ec2-attach-volume vol-974683fc -i i-408fd02f -d /dev/sdh
AWS::attachVolume    attach_command: ec2-attach-volume vol-974683fc -i i-408fd02f -d /dev/sdh
AWS::attachVolume    attach_success: /dev/sdh
AWS::untaint    string: ec2-describe-volumes vol-974683fc | grep ATTACHMENT | cut -f 5
ec2-describe-volumes vol-974683fc | grep ATTACHMENT | cut -f 5
AWS::attachVolume    counter 0 attach_success: /dev/sdh
AWS::untaint    string: ec2-describe-volumes vol-974683fc | grep ATTACHMENT | cut -f 5
ec2-describe-volumes vol-974683fc | grep ATTACHMENT | cut -f 5
AWS::attachVolume    counter 1 attach_success: /dev/sdh
AWS::untaint    string: ec2-describe-volumes vol-974683fc | grep ATTACHMENT | cut -f 5
ec2-describe-volumes vol-974683fc | grep ATTACHMENT | cut -f 5
AWS::attachVolume    counter 2 attach_success: /dev/sdh
AWS::untaint    string: ec2-describe-volumes vol-974683fc | grep ATTACHMENT | cut -f 5
ec2-describe-volumes vol-974683fc | grep ATTACHMENT | cut -f 5
AWS::attachVolume    counter 3 attach_success: /dev/sdh
AWS::untaint    string: ec2-describe-volumes vol-974683fc | grep ATTACHMENT | cut -f 5
ec2-describe-volumes vol-974683fc | grep ATTACHMENT | cut -f 5
AWS::attachVolume    counter 4 attach_success: /dev/sdh
AWS::untaint    string: ec2-describe-volumes vol-974683fc | grep ATTACHMENT | cut -f 5
ec2-describe-volumes vol-974683fc | grep ATTACHMENT | cut -f 5
AWS::attachVolume    counter 5 attach_success: /dev/sdh
AWS::untaint    string: ec2-describe-volumes vol-974683fc | grep ATTACHMENT | cut -f 5
ec2-describe-volumes vol-974683fc | grep ATTACHMENT | cut -f 5
AWS::attachVolume    counter 6 attach_success: /dev/sdh
AWS::untaint    string: ec2-describe-volumes vol-974683fc | grep ATTACHMENT | cut -f 5
ec2-describe-volumes vol-974683fc | grep ATTACHMENT | cut -f 5
AWS::attachVolume    counter 7 attach_success: /dev/sdh
AWS::addToFstab    AWS::addToFstab(device, mountpoint, line)
AWS::addToFstab    device: /dev/sdh
AWS::addToFstab    mountpoint: /data
AWS::addToFstab    line: /dev/sdh	/data	ext3	noatime	0	0

AWS::addToFstab    backupfile: /etc/fstab.2
AWS::addToFstab    splicing line 6: /dev/sdh	/data	ext3	noatime	0	0
AWS::mountData    whoami: root
AWS::mountData    device not ready: /dev/sdh
AWS::mountData    device not ready: /dev/sdh
AWS::mountData    device not ready: /dev/sdh
AWS::mountData    device not ready: /dev/sdh
AWS::mountData    device not ready: /dev/sdh
AWS::mountData    device not ready: /dev/sdh




FAILURE ON AQ8
--------------
Client.AuthFailure: Not authorized for instances: [i-669fc009]

whoami: root
AWS::init     AWS::init()
AWS::init    Doing printKeyfiles()
AWS::printKeyfiles    AWS::printKeyfiles()
AWS::get_publicfile    AWS::get_publicfile()
AWS:printKeyfiles       publicfile: /agua/0.6/conf/admin/.keypairs/public.pem
AWS:printKeyfiles       privatefile: /agua/0.6/conf/admin/.keypairs/private.pem 
AWS::createKeydir    AWS::createKeydir()
AWS::createKeydir    keydir: /agua/0.6/conf/admin/.keypairs
AWS::init    Doing setEnvironment()
AWS::get_publicfile    AWS::get_publicfile()
AWS::init    Doing mountData()
Admin::AWS::mountData    snapshot: snap-55fe4a3f	Admin::AWS::mountData    using custom datavolumesize: 	40
Admin::AWS::mountData    size: 40	Admin::AWS::mountData    self:	$VAR1 = bless( {
                 '_datavolumesize' => 40,
                 '_uservolume' => ' New volume',
                 '_ec2publiccert' => '-----BEGIN CERTIFICATE-----
MIICeDCCAeGgAwIBAgIGAPU26XvIMA0GCSqGSIb3DQEBBQUAMFMxCzAJBgNVBAYTAlVTMRMwEQYDVQQKEwpBbWF6b24uY29tMQwwCgYDVQQLEwNBV1MxITAfBgNVBAMTGEFXUyBMaW1pdGVkLUFzc3VyYW5jZSBDQTAeFw0xMDEwMDQxODE0MzlaFw0xMTEwMDQxODE0MzlaMFMxCzAJBgNVBAYTAlVTMRMwEQYDVQQKEwpBbWF6b24uY29tMRcwFQYDVQQLEw5BV1MtRGV2ZWxvcGVyczEWMBQGA1UEAxMNMWdjbG41ZW5qYXcxNDCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEArakx/b3BIYoal1of5iVhZTtgGkFz5InF582kyAviP2Mceou9vcc+RdXHIc4PgTU7N37t5wGP8j9SA7u5dFWxb4TRNONqX6iPskF2DfUKlfFK1mXEp8h7ucGBbY9D4BHu07zQhNczfnjsqGlrRfmBCtrTCFNPy58KuyXceZOb5xMCAwEAAaNXMFUwDgYDVR0PAQH/BAQDAgWgMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMCMAwGA1UdEwEB/wQCMAAwHQYDVR0OBBYEFA2qXsSYvwsst1nAdM9SbVpWytCWMA0GCSqGSIb3DQEBBQUAA4GBAAtHxmSUKGMxiJXy8LjYg1DAG0Z1VYh8juWAzsYLk8I19AqvDp/Z4hB3OeGCmTyY31siCdaAwhkWHX+OIS91HzUi1Uy8774I4O3Ar1wqF5keR25avv/QZREJ68k8yucb7U/+9ds3/uPd2JHq+HyADQfPQUEJwUC8PMLuYkyOikXi
-----END CERTIFICATE-----',
                 '_uservolumecheckbox' => 0,
                 '_conf' => {
                              'SGEEXECDPORT' => '702',
                              'HTMLURL' => 'http://ngsdev.ccs.miami.edu',
                              'NOVOALIGN' => '/data/apps/novoalign/2.05.33',
                              'SAMTOOLSHUMAN' => '/data/sequence/human/hg19/samtools',
                              'PYTHON' => '/data/apps/python/2.6.1/bin/python',
                              'USERDIR' => '/nethome',
                              'ADMINUSER' => 'admin',
                              'DBTYPE' => 'MySQL',
                              'DATASNAPSHOT' => 'snap-55fe4a3f',
                              '####' => 'JBROWSE',
                              'DATADIR' => '/data',
                              'JBROWSE' => '/data/apps/jbrowse/1.2.6/bin',
                              'NFSPORT' => '2049',
                              'QSUB' => '/usr/bin/qsub',
                              '[starcluster' => 'nfs]',
                              '#DBFILE' => '/data/agua/0.6/bin/db/data.dbl',
                              'RATLATESTBUILD' => 'rn4',
                              'CASAVA' => '/data/apps/casava/1.6.0/bin',
                              'REMOTEDIR' => '/data',
                              'SQUASH' => '/data/apps/GAPipeline/1.5.1/bin/squashGenome',
                              'LOCALDIR' => '/scvolumes',
                              'CLUSTER' => 'SGE',
                              'AGUAHOME' => '/nethome',
                              'MIRA' => '/data/apps/mira/bin/mira',
                              'MOUSELATESTBUILD' => 'mm9',
                              '#BACCT' => '/share/apps/lsf/7.0/linux2.6-glibc2.3-x86_64/bin/bacct',
                              'PASSWORD' => 'open4agua',
                              'EC2HOME' => '/usr/share/ec2/1.4.2.4',
                              'VOLUMESIZE' => '100',
                              'CANCELJOB' => '/usr/bin/canceljob',
                              'HTMLROOT' => '/var/www/html/agua/0.6',
                              'TANDEMREPEATSFINDER' => '/data/apps/tandemrepeats/4.04/trf',
                              'VELVET' => '/data/apps/velvet/velvet',
                              'HTMLDIR' => '/var/www/html/agua/0.6',
                              'SLEEP' => '5',
                              'TEMPDIR' => '/tmp',
                              'AGUADIR' => 'agua',
                              'AGUAUSER' => 'agua',
                              'VCAKE' => '/data/apps/vcake/VCAKE_1.0.pl',
                              'JAVAHOME' => '/usr',
                              'GATK' => '/data/apps/gatk/1.0.4705',
                              'JAVA' => '/usr/java',
                              'DEVICE' => '/dev/sdj',
                              'CROSSMATCH' => '/data/apps/crossmatch/0.990329/cross_match',
                              '[scvolume' => 'data]',
                              'IAM' => '/usr/share/iam/1.2.0/bin',
                              'NUCMER' => '/data/apps/mummer/nucmer',
                              'DATADEVICE' => '/dev/sdh',
                              'INSTALLDIR' => '/agua/0.6',
                              'DELTAFILTER' => '/data/apps/mummer/delta-filter',
                              'ERANGE' => '/data/pipeline/erange2',
                              'SAMTOOLSRAT' => '/data/sequence/rat/rn4/samtools',
                              'SAMTOOLSMOUSE' => '/data/sequence/mouse/mm9/samtools',
                              'EXECUTION_TEMPDIR' => '/tmp',
                              'RAT' => '/data/sequence/rat',
                              'SHOWCOORDS' => '/data/apps/mummer/show-coords',
                              'STARCLUSTER' => '/data/apps/starcluster/0.91-316',
                              'TOPHAT' => '/data/apps/tophat/1.0.12/bin',
                              'USER' => 'agua',
                              'SGEQMASTERPORT' => '701',
                              'JBROWSEDATA' => '/data/jbrowse/ucsc',
                              'MYSQLDATA' => '/usr/local/mysql/data',
                              'DEFAULT32BIT' => 'ami-1e4dbf77',
                              'BOWTIE' => '/data/apps/bowtie/0.12.2',
                              'CHECKJOB' => '/usr/bin/checkjob',
                              'USERVOLUMESIZE' => '40',
                              'AVAILZONE' => 'us-east-1a',
                              'RUNMAPPING' => '/data/apps/454/2.0.00.20-64/bin/runMapping',
                              'SNAPSHOT' => 'snap-4b4fcf26',
                              'CLUSTER_MYSQLDATA' => '/private/var/mysql',
                              'CUFFLINKS' => '/data/apps/cufflinks/0.8.2',
                              '#MSUB' => '/usr/bin/msub',
                              'LDAP_SERVER' => 'ldap.ccs.miami.edu',
                              'HUMANLATESTBUILD' => 'hg19',
                              'REPMASK' => '/data/apps/erange2/data/repMask/rmask.db',
                              'STARCLUSTERDEFAULT' => '/data/apps/starcluster/110202bal/bin/starcluster',
                              'DATABASE' => 'agua',
                              'SAMTOOLS' => '/data/apps/samtools/0.1.6',
                              'CGIROOT' => '/var/www/cgi-bin/agua/0.6',
                              'USERDEVICE' => '/dev/sdi',
                              'HUMAN' => '/data/sequence/human',
                              'MOUSE' => '/data/sequence/mouse',
                              'MAQ' => '/data/apps/maq/0.7.1',
                              'APACHECONF' => '/etc/apache2/apache2.conf',
                              'PORTMAPPORT' => '111',
                              'CGIDIR' => '/var/www/cgi-bin/agua/0.6',
                              'ADMINS' => 'admin,syoung,jgilbert',
                              'QSTAT' => '/usr/bin/qstat',
                              'DATAVOLUMESIZE' => '40',
                              'DEFAULT64BIT' => 'ami-12b6477b',
                              'EC2' => '/usr/share/ec2/1.4.2.4/bin',
                              'APACHE_USER' => 'www-data',
                              'DUMPFILE' => 'bin/sql/dump/agua.0.6.dump',
                              'MOUNTDPORT' => '32767',
                              'SGEROOT' => '/var/lib/gridengine'
                            },
                 '_username' => 'admin',
                 '_ec2privatekey' => '-----BEGIN PRIVATE KEY-----
MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAK2pMf29wSGKGpdaH+YlYWU7YBpBc+SJxefNpMgL4j9jHHqLvb3HPkXVxyHOD4E1Ozd+7ecBj/I/UgO7uXRVsW+E0TTjal+oj7JBdg31CpXxStZlxKfIe7nBgW2PQ+AR7tO80ITXM3547Khpa0X5gQra0whTT8ufCrsl3HmTm+cTAgMBAAECgYBB8ilYuRE5Ik+cwA2zAOjuX1DMR6Sx2Zu8vfvgN5sQBRwQcTZ5dcrxDBBVhwGeSE+XcGz5Nz+pd2A2qLfxNIVvOSqrFHWGLylyPxfp/L3gpvXz/5N+eZ6Y9PT18NiYWmpXEXcKEDT+Msg8Io8CiivYU+cSs1yCq1becopC+EftqQJBAPI/j6T9BlFWO2e4Bu8xxKST3Xc5Q7+6Ux3v7h0bRD225dxrE/ML1/N36GwJq7joWHtscK6+jLJOgm4uBQ9sq+UCQQC3hOXiBHDRVtk8Pn6goRTPxMxAixoqbCP6DDogkigIpuJ4iEvmAYEE4XVfqC1bjay/oHU9hn8AOP0XwAJKHkeXAkAnu28W830eyBL0PwW8I6CKEcqILHdFMg1B4sFeOsOlj6MB1PovqeiggTE4zxlAObORgsa0koJHGINiCOBBmGRVAkEAhfMHw9fP7MxCVVmcHWxVf206VGXznEFAZTNlff6QH/iHVsjM9T3lyQUzIbXkHW4kR947lMPFkQkHmr04Lpc5UwJASiBGFuHXymAL3LzH1tGxZLbWvoXgkLGEJHG2Badq9ADhxHM5OVgq8mV2oG9JJDR0NXZ3GIQGUOVC4ibdjDymrg==
-----END PRIVATE KEY-----',
                 '_datavolume' => 'snap-55fe4a3f',
                 '_awsaccesskeyid' => 'AKIAIZXZ6S7ARZ44TTHQ',
                 '_uservolumesize' => 100,
                 '_secretaccesskey' => '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',
                 '_amazonuserid' => '728213020069',
                 '_datavolumecheckbox' => 0
               }, 'AWS' );
AWS::get_publicfile    AWS::get_publicfile()
AWS::mountData    create_command: ec2-create-volume --snapshot snap-55fe4a3f -s 40 -z us-east-1a -K /agua/0.6/conf/admin/.keypairs/private.pem -C /agua/0.6/conf/admin/.keypairs/public.pem  | grep VOLUME | cut -f2
AWS::mountData    volumeid: vol-adae6bc6
AWS::untaint    string: i-669fc009
AWS::mountData    instanceid: i-669fc009
AWS::detachAttached    volumes: VOLUME	vol-adae6bc6	40	snap-55fe4a3f	us-east-1a	available	2011-04-28T18:59:16+0000
 VOLUME	vol-05ae6b6e	40	snap-55fe4a3f	us-east-1a	available	2011-04-28T18:58:36+0000
 VOLUME	vol-7665bf1e	40	snap-55fe4a3f	us-east-1a	in-use	2010-12-24T09:14:47+0000
 VOLUME	vol-de72e1b6	40	snap-91dee7fc	us-east-1a	in-use	2011-02-02T18:21:18+0000
 ATTACHMENT	vol-de72e1b6	i-e9af3b85	/dev/sdh	attached	2011-02-02T18:21:19+0000
 VOLUME	vol-83af6ae8	40	snap-55fe4a3f	us-east-1a	available	2011-04-28T18:57:12+0000
 VOLUME	vol-dc72e1b4	10	snap-97dee7fa	us-east-1a	in-use	2011-02-02T18:21:17+0000
 ATTACHMENT	vol-dc72e1b4	i-e9af3b85	/dev/sda1	attached	2011-02-02T18:21:19+0000
 VOLUME	vol-f5f20f9e	15	snap-c54ef9aa	us-east-1a	in-use	2011-04-22T21:21:49+0000
 ATTACHMENT	vol-f5f20f9e	i-004d1c6f	/dev/sda1	attached	2011-04-22T21:22:08+0000
 VOLUME	vol-d072e1b8	40	snap-93dee7fe	us-east-1a	in-use	2011-02-02T18:21:18+0000
 ATTACHMENT	vol-d072e1b8	i-e9af3b85	/dev/sdi	attached	2011-02-02T18:21:19+0000

AWS::detachAttached    checking volumes for i-669fc009 and /dev/sdh
AWS::untaint    string: ec2-attach-volume vol-adae6bc6 -i i-669fc009 -d /dev/sdh
AWS::attachVolume    attach_command: ec2-attach-volume vol-adae6bc6 -i i-669fc009 -d /dev/sdh
AWS::attachVolume    attach_success: /dev/sdh
AWS::untaint    string: ec2-describe-volumes vol-adae6bc6 | grep ATTACHMENT | cut -f 5
ec2-describe-volumes vol-adae6bc6 | grep ATTACHMENT | cut -f 5
AWS::attachVolume    counter 0 attach_success: /dev/sdh
AWS::untaint    string: ec2-describe-volumes vol-adae6bc6 | grep ATTACHMENT | cut -f 5
ec2-describe-volumes vol-adae6bc6 | grep ATTACHMENT | cut -f 5
AWS::attachVolume    counter 1 attach_success: /dev/sdh
AWS::untaint    string: ec2-describe-volumes vol-adae6bc6 | grep ATTACHMENT | cut -f 5
ec2-describe-volumes vol-adae6bc6 | grep ATTACHMENT | cut -f 5

    
</entry>



<entry [Thu 2011:04:28 23:03:12 EST] TESTED install.pl AND config.pl ON AQUARIUS-8C (LARGE)>

1. EXPORT LATEST BUILD
http://www.kernel.org/pub/software/scm/git/docs/user-manual.html

GET THE COMMIT COUNT
git log --pretty=format:'' | wc -l
    46

AND THE SHORT SHA KEY:
git rev-parse --short HEAD
    121f106 

rm -fr /home/syoung/RELEASE/0.6
mkdir -p /home/syoung/RELEASE/0.6
git archive --format=tar --prefix=0.6-46-121f106/ HEAD | gzip > /home/syoung/RELEASE/0.6/agua.0.6-46-121f106.tar.gz  

    -rw-r--r-- 1 syoung syoung 58M 2011-04-28 23:52 /home/syoung/RELEASE/0.6/agua.0.6-46-121f106.tar.gz


2. RAN install.pl


3. RAN config.pl




</entry>


<entry [Thu 2011:04:28 00:41:30 EST] COMPLETED config.pl SET ROOT PASSWORD>

PROCEDURE
---------

1. RESTART MYSQL WITH  --skip-grant-tables
/etc/init.d/mysql stop
sudo mysqld --skip-grant-tables &
sleep 1;

2. SET root USER PASSWORD USING FILE

	my $sqlfile = "$Bin/../sql/setRootPassword.sql";
    print "Root::Configure::setRootPassword    sqlfile: $sqlfile\n";
	my $create = qq{
UPDATE mysql.user SET Password=PASSWORD('$rootpassword') WHERE User='root'; 
FLUSH PRIVILEGES;
};
	$self->printFile($sqlfile, $create);

mysql -u root < $sqlfile


USEFUL
------

#### SET EMPTY ROOT PASSWORD FILE
cat setroot
    UPDATE mysql.user SET Password=PASSWORD('') WHERE User='root'; 
    FLUSH PRIVILEGES;


#### REMOVE ROOT PASSWORD
/etc/init.d/mysql stop; sudo mysqld --skip-grant-tables & 
mysql -u root < setroot
kill `cat /var/lib/mysql/*pid`
px mysql


#### RUN config.pl TO SET ROOT PASSWORD
sudo ./config.pl --mode mysql
    
    

</entry>

<entry [Wed 2011:04:27 17:03:04 EST] MAKE MYSQL START AUTOMATICALLY AT BOOT>

START MYSQL AUTOMATICALLY AT BOOT

chkconfig --level 345 mysql on

</entry>

<entry [Wed 2011:04:27 14:07:23 EST] SET MYSQL ROOT PASSWORD SECURELY>

USED THIS PAIR OF COMMANDS:

apt-get install debconf
apt-get install debconf-utils

echo mysql-server mysql-server/root_password select PASSWORD | debconf-set-selections
echo mysql-server mysql-server/root_password_again select PASSWORD | debconf-set-selections


SET debconf VARIABLES ON CONFIGURED SYSTEM
------------------------------------------
http://man.he.net/man1/debconf-set-selections

1. CHECK INITIAL CONFIGURATION

debconf-get-selections | grep mysql
    
    mysql-cluster-server-5.1	mysql-server/root_password	password	
    mysql-cluster-server-5.1	mysql-server/error_setting_password	error


2. SET MYSQL ROOT PASSWORD

echo mysql-server mysql-server/root_password select o*t | debconf-set-selections
echo mysql-server mysql-server/root_password_again select o*t | debconf-set-selections


3. CHECK CHANGED CONFIGURATION

debconf-get-selections | grep mysql
    
    mysql-cluster-server-5.1	mysql-server/root_password	select	o*t
    mysql-server	mysql-server/root_password	select	o*t
    mysql-server	mysql-server/root_password_again	select	o*t
    mysql-cluster-server-5.1	mysql-server/error_setting_password	error	


4. PRINT DEBCONF CONFIGS TO FILE

debconf-get-selections | grep "^mysql-server" > mysql-server-sel.txt

emacs mysql-server-sel.txt
    mysql-server    mysql-server/root_password      select  o*t
    mysql-server    mysql-server/root_password_again        select  o*t


5. COPY mysql-server-sel.txt TO NEW SYSTEM AND DO:

debconf-set-selections mysql-server-sel.txt
apt-get install mysql-server



NOTES
-----


NB: MOST SECURE OPTION FOR PROVIDING ROOT PASSWORD (AFTER IT IS SET)

emacs /root/my.cnf

    [client]
    password=your_password

chmod 600 /root/.my.cnf



http://serverfault.com/questions/109304/how-do-i-specify-the-mysql-root-password-non-interactively-when-installing-via-ap

Have a look at the debconf-set-selections manpage - it should do exactly what you're after.

You should be able to go onto a box with MySQL installed already, and do:-

debconf-get-selections | grep "^mysql-server" >mysql-server-sel.txt
Then copy it to your target box, and run:-

debconf-set-selections mysql-server-sel.txt
apt-get install mysql-server



http://serverfault.com/questions/19367/scripted-install-of-mysql-on-ubuntu

You need to preseed the debconf database. debconf needs to be installed first before you try this.

The version of mysql and ubuntu could change the line:

echo mysql-server mysql-server/root_password select PASSWORD | debconf-set-selections
echo mysql-server mysql-server/root_password_again select PASSWORD | debconf-set-selections

For example you made need this instead:

echo mysql-server-5.0 mysql-server/root_password password PASSWORD | debconf-set-selections
echo mysql-server-5.0 mysql-server/root_password_again password PASSWORD | debconf





http://news.softpedia.com/news/How-To-Secure-your-password-for-MySQL-66567.shtml

To prevent that, use the following options: -pyour_pass or --password=your_pass . So, your sql statement will look like this: shell> mysql -u root -ppass db_name. You may use this statement because it is very easy to remember, but is relatively insecure. Users can see the password if they have access to system status programs. Almost all MySQL clients overwrite the command-line password argument with zeros during their initialization sequence, but there is a fraction of second when the password is visible. 

A solution for this is to use the following statement: shell>mysql -u root -p db_name. This way you will be asked to enter separately the password and the characters from the password will be changed with "*" so nobody can decipher your password. The problem with this method is that it is suitable with interactive programs. If you want to invoke a program from a non-interactive script, there is no way to enter the password.

Another way to keep your password secure is to enter the my.cnf file. You will have to enter it in [client] section of the file: 
[client]
password=your_password

In Unix environment chmod the file to access mode 400 or 600. 

The last method you can use is to store your password in the MYSQL_PWD environment variable. But this method is the most insecure one. Again, users that have access to system status programs can see the password. 


</entry>

<entry [Wed 2011:04:27 21:36:04 EST] FIXED MYSQL INSTALLATION ON AQUARIUS-8b>


PROBLEM:

sudo /etc/init.d/mysql start
 * Starting MySQL database server mysqld
 [fail]


DIAGNOSIS:

CHECK ERROR LOGS IN /var/lib/mysql

emacs /var/lib/mysql/ip-10-126-38-6.err

    110427 20:59:30  InnoDB: Started; log sequence number 0 44233
    110427 20:59:30 [Note] Event Scheduler: Loaded 0 events
    110427 20:59:30 [Note] /usr/sbin/mysqld: ready for connections.
    Version: '5.1.39-ndb-7.0.9-1ubuntu7'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306 \
     (Ubuntu)
    110427 21:05:56 mysqld_safe A mysqld process already exists
    


SOLUTION:

SUMMARY

sudo apt-get remove mysql-server libmysqlclient-dev mysql-server-5.1 mysql-cluster-server-5.1 libmysqlclient16-dev mysql-cluster-server libaprutil1-dev apache2-prefork-dev

apt-get remove libmysqlclient-dev mysql-cluster-client mysql-cluster-client-5.1 mysql-cluster-server-5.1  mysql-common

sudo apt-get remove mysql-server libmysqlclient-dev mysql-server-5.1 mysql-cluster-server-5.1 libmysqlclient16-dev mysql-cluster-server libaprutil1-dev apache2-prefork-dev


THREE STEPS
------------

1. TOTALLY ERADICATE MYSQL-SERVER FROM THE SYSTEM
(TO AVOID THIS KIND OF ERROR:
    The following packages have unmet dependencies:
      mysql-server: Depends: mysql-server-5.1 but it is not going to be installed
)

apt-get remove libmysqlclient16 libmysqlclient-dev libmysqlclient16-dev  mysql-cluster-server-5.1 libaprutil1-dev apache2-prefork-dev mysql-cluster-server mysql-client-core-5.1 

OR ON AQUARIUS-8b (EXTRA MODULE mysql-client-core-5.1 TO BE REMOVED):

apt-get remove libmysqlclient16 libmysqlclient-dev libmysqlclient16-dev  mysql-cluster-server-5.1 libaprutil1-dev apache2-prefork-dev mysql-client-core-5.1


THE ABOVE DIDN'T WORK ON AQUARIUS-8c, BUT THIS DID:

sudo apt-get remove mysql-server libmysqlclient-dev mysql-server-5.1 mysql-cluster-server-5.1 libmysqlclient16-dev mysql-cluster-server libaprutil1-dev apache2-prefork-dev

    Reading package lists... Done
    Building dependency tree       
    Reading state information... Done
    Package mysql-server is not installed, so not removed
    Package mysql-server-5.1 is not installed, so not removed
    The following packages will be REMOVED:
      apache2-prefork-dev libaprutil1-dev libmysqlclient-dev libmysqlclient16-dev mysql-cluster-server mysql-cluster-server-5.1
    0 upgraded, 0 newly installed, 6 to remove and 165 not upgraded.
    5 not fully installed or removed.
    After this operation, 85.5MB disk space will be freed.
    Do you want to continue [Y/n]? y
    (Reading database ... 89102 files and directories currently installed.)
    Removing apache2-prefork-dev ...
    Removing libaprutil1-dev ...
    Removing libmysqlclient16-dev ...
    Removing libmysqlclient-dev ...
    Removing mysql-cluster-server ...
    Removing mysql-cluster-server-5.1 ...
     * Stopping MySQL database server mysqld                                                                                                                                                      [ OK ] 
    Processing triggers for man-db ...
    Processing triggers for libc-bin ...
    ldconfig deferred processing now taking place
    /sbin/ldconfig.real: /usr/lib/libumfpack.so is not an ELF file - it has the wrong magic bytes at the start.
    
    Processing triggers for install-info ...
    Processing triggers for ureadahead ...
    


2. UNISTALL REMAINING mysql-cluster-client MODULE

sudo dpkg -l | grep mysql

apt-get remove libmysqlclient-dev mysql-cluster-client mysql-cluster-client-5.1 mysql-cluster-server-5.1  mysql-common


Reading package lists... Done
Building dependency tree       
Reading state information... Done
Package libmysqlclient-dev is not installed, so not removed
Package mysql-cluster-server-5.1 is not installed, so not removed
The following packages will be REMOVED:
  mysql-cluster-client mysql-cluster-client-5.1 mysql-common
0 upgraded, 0 newly installed, 3 to remove and 165 not upgraded.
After this operation, 10.7MB disk space will be freed.
Do you want to continue [Y/n]? 
(Reading database ... 88486 files and directories currently installed.)
Removing mysql-cluster-client ...
Removing mysql-cluster-client-5.1 ...
Removing mysql-common ...
Processing triggers for man-db ...
Processing triggers for libc-bin ...
ldconfig deferred processing now taking place
/sbin/ldconfig.real: /usr/lib/libumfpack.so is not an ELF file - it has the wrong magic bytes at the start.


3. INSTALL MYSQL WITH MYSQL PERL LIBS:

apt-get install mysql-server mysql-server-5.1

WHICH CREATES mysql_config:

updatedb
locate mysql_config
    /usr/bin/mysql_config
    /usr/share/man/man1/mysql_config.1.gz



INSTALL DBD::mysql FAILS DUE TO LACK OF mysql_config PROVIDED BY MYSQL:

cpanm install DBD::mysql

    Working on DBD::mysql
    Fetching http://search.cpan.org/CPAN/authors/id/C/CA/CAPTTOFU/DBD-mysql-4.018.tar.gz ... OK
    Configuring DBD-mysql-4.018 ... OK
    Building and testing DBD-mysql-4.018 ... OK
    Successfully installed DBD-mysql-4.018 (upgraded from 4.012)
    1 distribution installed


IF DON'T HAVE THE MYSQL PERL LIBRARIES, GET THE FOLLOWING ERROR:

cpanm install DBD::mysql

install is up to date. (0.01)
--> Working on DBD::mysql
Fetching http://search.cpan.org/CPAN/authors/id/C/CA/CAPTTOFU/DBD-mysql-4.018.tar.gz ... OK
Configuring DBD-mysql-4.018 ... N/A
! Configure failed for DBD-mysql-4.018. See /root/.cpanm/build.log for details.


emacs /root/.cpanm/build.log

    ...
    Running Makefile.PL
    Can't exec "mysql_config": No such file or directory at Makefile.PL line 82.
    
    Cannot find the file 'mysql_config'! Your execution PATH doesn't seem
    not contain the path to mysql_config. Resorting to guessed values!
    Can't exec "mysql_config": No such file or directory at Makefile.PL line 464.
    Can't find mysql_config. Use --mysql_config option to specify where mysql_config is located
    Can't exec "mysql_config": No such file or directory at Makefile.PL line 464.
    Can't find mysql_config. Use --mysql_config option to specify where mysql_config is located
    Can't exec "mysql_config": No such file or directory at Makefile.PL line 464.
    Can't find mysql_config. Use --mysql_config option to specify where mysql_config is located
    
    PLEASE NOTE:
    
    For 'make test' to run properly, you must ensure that the
    database user 'root' can connect to your MySQL server
    and has the proper privileges that these tests require such
    as 'drop table', 'create table', 'drop procedure', 'create procedure'
    as well as others.





THEN INSTALL mysql-server AND THEN THE APACHE AND PERL MODULES:

sudo apt-get install mysql-server
sudo apt-get install apache2-prefork-dev

GIVES SAME OLD ERROR ABOUT ELF FILE BUT NOT IMPORTANT:

    ...
    The following extra packages will be installed:
      libdbd-mysql-perl libmysqlclient16 mysql-client-5.1 mysql-client-core-5.1 mysql-server-5.1
    ....    
    /sbin/ldconfig.real: /usr/lib/libumfpack.so is not an ELF file - it has the wrong magic bytes at the start.


BUT MYSQL IS NOW RUNNING AND ACCEPTING THE ROOT PASSWORD:

ON AQUARIUS8:

mysql -u root -po*t
    OK

ON AQUARIUS8b:

mysql
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 39
    Server version: 5.1.41-3ubuntu12.10 (Ubuntu)
    
    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
    
    mysql>
    

AND RESTARTS NORMALLY:

/etc/init.d/mysql restart

    Rather than invoking init scripts through /etc/init.d, use the service(8)
    utility, e.g. service mysql restart
    
    Since the script you are attempting to invoke has been converted to an
    Upstart job, you may also use the restart(8) utility, e.g. restart mysql
    mysql start/running, process 12712




NOTES
-----

DELETING THE IBDATA FILES AND RESTARTING DIDN'T WORK
----------------------------------------------------

1. KILL ALL MYSQL PIDS

2. DELETE/RENAME ibdata1 AND ib_logfile* FILES IN /var/lib/mysql

3. RESTART WITH mysqld_safe &

NB: RETURNED TO INSTALLATION AND FOUND mysql-cluster-client IS NOT NECESSARY IF mysql-cluster-server IS INSTALLED, SO FORCED REMOVAL OF mysql-cluster-client:


dpkg --purge --force-depends mysql-cluster-client-5.1

    dpkg: mysql-cluster-client-5.1: dependency problems, but removing anyway as you requested:
     mysql-cluster-server-5.1 depends on mysql-cluster-client-5.1.
    (Reading database ... 108250 files and directories currently installed.)
    Removing mysql-cluster-client-5.1 ...
    Purging configuration files for mysql-cluster-client-5.1 ...



... AND DELETED IBDATA FILES, THEN RESTARTED WITH mysld_safe &

NOW CAN LOG IN WITH mysql -u root -p AND NO PASSWORD:


NB: GOT HOSTS FROM mysql.user TABLE:

localhost
domU-12-31-39-18-15-1D
127.0.0.1
::1 


TOOLS
-----

sudo netstat -anp | grep LISTEN  | grep mysql
lsof -i @localhost:3306
apt-cache show PACKAGENAME
apt-get clear cache
apt-get clean


for i in mysql-server-5.0 mysql-client-5.0 libdbi-perl libdbd-mysql-perl; do echo "XXXXX $i"; apt-cache show $i; done

    XXXXX mysql-server-5.0
    XXXXX mysql-client-5.0
    XXXXX libdbi-perl
    Package: libdbi-perl
    Priority: optional
    Section: perl
    ...
    
    
dpkg --configure -a DIDN'T WORK EITHER
--------------------------------------

The mysql-server-5.1 package tries to start MySQL after the package is installed, which fails. The first thing you need to do is finish the installation process cleanly. There are several ways to do this:

either fix your MySQL configuration, check that /etc/init.d/mysql-server works, and launch dpkg --configure -a to finish the installation process ; or edit /var/lib/dpkg/info/mysql-server-5.1.postinst and remove the part where it starts the server (probably calling /etc/init.d/mysql-server start or so), then launch dpkg --configure -a to finish the installation process and then fix your configuration. http://www.openg.info/entry/sudo-apt-install-mysql-server-fails



CHECK MYSQL IS INSTALLED:

ll /etc/init.d/mysql*

    -rwxr-xr-x 1 root root 5.3K 2010-04-16 00:36 /etc/init.d/mysql
    -rwxr-xr-x 1 root root 2.5K 2010-04-16 00:36 /etc/init.d/mysql-ndb
    -rwxr-xr-x 1 root root 1.9K 2010-04-16 00:36 /etc/init.d/mysql-ndb-mgm

FINISH THE INSTALLATION PROCESS:

dpkg --configure -a 
 
    OK
    


REMOVE CALL TO START SERVER IN *postinst FILE

ll /var/lib/dpkg/info/* | grep mysql | grep postinst

    -rwxr-xr-x 1 root root  381 2011-02-10 09:30 /var/lib/dpkg/info/libmysqlclient16.postinst
    -rwxr-xr-x 1 root root  135 2011-02-10 09:30 /var/lib/dpkg/info/libmysqlclient-dev.postinst
    -rwxr-xr-x 1 root root  135 2010-04-16 00:50 /var/lib/dpkg/info/mysql-cluster-client-5.1.postinst
    -rwxr-xr-x 1 root root  12K 2010-04-16 00:50 /var/lib/dpkg/info/mysql-cluster-server-5.1.postinst


**** DIDN'T COMPLETE ****


</entry>

<entry [Tue 2011:04:26 13:21:58 EST] FIXED ERROR: Invalid command 'Order' IN apache2.conf>

PROBLEM:

/etc/init.d/apache2 restart
    * Restarting web server apache2                                                                Syntax error on line 14 of /etc/apache2/apache2.conf:
   Invalid command 'Order', perhaps misspelled or defined by a module not included in the server configuration

DIAGNOSIS

ACCIDENTALLY COPIED OVER apache2.conf TO sites-available/default


SOLUTION

COPY CORRECT sites-available/default AND RESTART APACHE



NOTES
-----

ON FEDORA, IT MIGHT HAVE BEEN DUE TO SE LINUX:
https://bugzilla.redhat.com/show_bug.cgi?id=180056

Seeing as some people seem to have problems, I will reproduce what has just
worked for me.

1) download file "system-config-httpd.patch" from message #1 above. You can save
it anywhere on your system. (the text below assumes "/var/tmp/")

2) run "system-config-security-level". Choose "SELinux" tab and "Modify SELinux
Policy" drop-down. Expand the "HTTPD Service" group. Enable "Allow HTTPD scripts
and modules to connect to the network."

3) "cd /usr/share/system-config-httpd"

4) "patch < /var/tmp/system-config-httpd.patch". shell will respond with
"patching file httpd.conf.xsl" and then return to a command prompt.

5) run "system-config-httpd". If you have previously setup your required options
you can just click "ok" and then say yes to "save and exit".

6) restart the httpd with "apachectl restart". You should not get any error
messages at this stage!

7) open a web browser and point it at "localhost". You should see a blue banner
saying "Fedora Core Test Page". If you see a "server not responding" page,
something has gone wrong. Look for error messages to the above steps.

8) run "system-config-security-level". Choose "SELinux" tab and "Modify SELinux
Policy" drop-down. Expand the "HTTPD Service" group. Disable "Allow HTTPD
scripts and modules to connect to the network." (I'm just assuming that it is
best to set this back to it's default state - I presume there are possible
security holes if you leave it enabled).

If anyone still can't get it to work, i'm afraid I can't help you further as I
too am pretty new to linux.

    
</entry>

<entry [Tue 2011:04:26 11:52:38 EST] >

PROBLEM:

libmysqlclient-dev depends on libmysqlclient16 (= 5.1.41-3ubuntu12.10); however:
  Package libmysqlclient16 is not installed.


DIAGNOSIS

https://lists.ubuntu.com/archives/ubuntu-server-bugs/2010-September/043692.html

I added the conflict to the right package, the reason why mysql-
cluster-5.1 basically its a fork of mysql with a newer version of the
ndb cluster option. Basically it needs its own copy of this library.

chuck


SOLUTION:

aptitude update
aptitude upgrade


NOTES
-----

TRIED THIS BUT DIDN'T WORK:

rm -fr /var/cache/apt/archives/libmysqlclient*
apt-get install mysql-server-5.1 mysql-client-5.1 mysql-server

BUT NOW GET THIS ERROR:

ldconfig deferred processing now taking place
/sbin/ldconfig.real: /usr/lib/libumfpack.so is not an ELF file - it has the wrong magic bytes at the start.


SOLUTION:

MOVE /usr/lib/libumfpack.so TO SOMEWHERE ELSE


    
</entry>

<entry [Mon 2011:04:25 17:28:26 EST] NON-INTERACTIVE INSTALL OF PERL MODULES WITH cpanminus>

http://search.cpan.org/~miyagawa/App-cpanminus-1.4004/lib/App/cpanminus.pm

1. INSTALL curl

apt-get install curl


2. INSTALL cpanminus

curl -L http://cpanmin.us | perl - App::cpanminus


3. RUN cpanminus ON ALL MODULES

cpanm ModuleName



Usage: cpanm [options] Module [...]

Options:
  -v,--verbose              Turns on chatty output
  -q,--quiet                Turns off the most output
  --interactive             Turns on interactive configure (required for Task:: modules)
  -f,--force                force install
  -n,--notest               Do not run unit tests
  -S,--sudo                 sudo to run install commands
  --installdeps             Only install dependencies
  --reinstall               Reinstall the distribution even if you already have the latest version installed
  --mirror                  Specify the base URL for the mirror (e.g. http://cpan.cpantesters.org/)
  --mirror-only             Use the mirror's index file instead of the CPAN Meta DB
  --prompt                  Prompt when configure/build/test fails
  -l,--local-lib            Specify the install base to install modules
  -L,--local-lib-contained  Specify the install base to install all non-core modules
  --auto-cleanup            Number of days that cpanm's work directories expire in. Defaults to 7

Commands:
  --self-upgrade            upgrades itself
  --info                    Displays distribution info on CPAN
  --look                    Opens the distribution with your SHELL
  -V,--version              Displays software version

Examples:

  cpanm Test::More                                          # install Test::More
  cpanm MIYAGAWA/Plack-0.99_05.tar.gz                       # full distribution path
  cpanm http://example.org/LDS/CGI.pm-3.20.tar.gz           # install from URL
  cpanm ~/dists/MyCompany-Enterprise-1.00.tar.gz            # install from a local file
  cpanm --interactive Task::Kensho                          # Configure interactively
  cpanm .                                                   # install from local directory
  cpanm --installdeps .                                     # install all the deps for the current directory
  cpanm -L extlib Plack                                     # install Plack and all non-core deps into extlib
  cpanm --mirror http://cpan.cpantesters.org/ DBI           # use the fast-syncing mirror

You can also specify the default options in PERL_CPANM_OPT environment variable in the shell rc:

  export PERL_CPANM_OPT="--prompt --reinstall -l ~/perl --mirror http://cpan.cpantesters.org"

Type `man cpanm` or `perldoc cpanm` for the more detailed explanation of the options.



Zero-conf? How does this module get/parse/update the CPAN index?

It queries the CPAN Meta DB site running on Google AppEngine at http://cpanmetadb.appspot.com/. The site is updated every hour to reflect the latest changes from fast syncing mirrors. The script then also falls back to scrape the site http://search.cpan.org/.

Fetched files are unpacked in ~/.cpanm and automatically cleaned up periodically. You can configure the location of this with the PERL_CPANM_HOME environment variable.

Where does this install modules to? Do I need root access?

It installs to wherever ExtUtils::MakeMaker and Module::Build are configured to (via PERL_MM_OPT and PERL_MB_OPT). So if you're using local::lib, then it installs to your local perl5 directory. Otherwise it installs to the site_perl directory that belongs to your perl.

cpanminus at a boot time checks whether you have configured local::lib, or have the permission to install modules to the site_perl directory. If neither, it automatically sets up local::lib compatible installation path in a perl5 directory under your home directory. To avoid this, run the script as the root user, with --sudo option or with --local-lib option.

cpanminus can't install the module XYZ. Is it a bug?

It is more likely a problem with the distribution itself. cpanminus doesn't support or is known to have issues with distributions like as follows:

Tests that require input from STDIN.
Tests that might fail when AUTOMATED_TESTING is enabled.
Modules that have invalid numeric values as VERSION (such as 1.1a)
These failures can be reported back to the author of the module so that they can fix it accordingly, rather than me.

Does cpanm support the feature XYZ of CPAN and CPANPLUS?

Most likely not. Here are the things that cpanm doesn't do by itself. And it's a feature - you got that from the name minus, right?




UNINSTALL WITH pm-uninstall
---------------------------
http://search.cpan.org/~xaicron/App-pmuninstall-0.16/bin/pm-uninstall

  pm-uninstall - Uninstall modules
SYNOPSIS 

  pm-uninstall [options] Module ...

  options:
      -v,--verbose                  Turns on chatty output
      -f,--force                    Uninstalls without prompts
      -c,--checkdeps                Check dependencies ( default on )
      -n,--no-checkdeps             Not check dependencies
      -h,--help                     This help message
      -V,--version                  Show version
      -l,--local-lib                Additional module path
      -L,--local-lib-contained      Additional module path (don't include non-core modules)
      


LIST CHANGES WITH cpan-listchanges
----------------------------------
SHOW CHANGES BETWEEN YOUR VERSION AND THE LATEST
http://search.cpan.org/~miyagawa/cpan-listchanges-0.05/bin/cpan-listchanges

cpan-listchanges - List changes for CPAN modules

SYNOPSIS 

  # See what's changed in Plack between your local and the latest on CPAN
  cpan-listchanges Plack

  # See what's changed for URI between 1.56 and 1.58 (Use @ and ..)
  cpan-listchanges URI@1.56..1.58

  # See what's changed for Plack 0.9965 and CPAN current (Use HEAD for the latest)
  cpan-listchanges Plack@0.9965..HEAD

  # See the whole changelog for Catalyst::Runtime
  cpan-listchanges --all Catalyst::Runtime

  # See what's changed for modules that require upgrades
  cpan-listchanges `cpan-outdated -p`
  
NOTES
-----

CPAN::Shell DIDN'T WORK
-----------------------

use CPAN::Shell;
for $mod (qw(version Term::ReadKey)){
	my $obj = CPAN::Shell->expand('Module',$mod);
	$obj->install;
}
  

dh-make-perl DID NOT WORK
-------------------------

dh-make-perl very helpful, as it allows CPAN modules to be easily converted into .debs

On my system, with the package "clamav-daemon" (not just "clamav") installed, the command dh-make-perl --cpan File::Scan::ClamAV --build successfully builds a .deb, which then installs fine with dpkg -i

    
</entry>

<entry [Sun 2011:04:24 22:56:31 EST] HOW TO INSTALL Agua>

BEFORE YOU INSTALL
------------------

If you are using an Agua AMI, you can skip this installation procedure as the proper environment has already been set up for you.

If you have downloaded Agua and want to install it locally, the whole process should only take a few minutes using the 'install.pl' script. Before you install Agua, please be sure to do the following:

1. MAKE A BACKUP OF YOUR mysql DATABASE (IF ALREADY INSTALLED)

2. MAKE A BACKUP OF YOUR apache2 DATABASE (IF ALREADY INSTALLED)

3. BACK UP ALL IRREPLACEABLE DATA ON YOUR SYSTEM

4. CHECK THE LIST OF REQUIREMENTS:

    Perl v5.10 or later* 
    Perl modules:
        DBI
        DBD
        DBD::mysql

    Mysql version 5.1 or later*
    
    * Earlier versions may work but are not supported
    

ec2-version
1.3-46266 2009-11-30
    

INSTALL AGUA
------------

Installing Agua requires root permissions. If you don't have root permissions, ask you system administrator to run the installation for you. There are two scripts to run: 'install.pl' (installs dependencies and sets up directory hierarchy) and 'config.pl' (configures Agua database). To install Aqua, please follow these steps:

1. Move the downloaded agua-<**VERSION**>.tar.gz file to the directory in which you want to install Agua. The following steps assume the installation location is '/agua' (the location used in the Agua AMI images):

Place your Agua download here:

/agua/agua-<**VERSION**>.tar.gz

Unzip the download:

cd /agua
tar xfvz agua-<**VERSION**>.tar.gz

2. Move to the 'scripts' directory and run install.pl 

cd agua-<**VERSION**>/bin/scripts
sudo ./install.pl



3. Run config.pl



    
</entry>


<entry [Wed 2011:04:20 17:19:39 EST] INSTALL LIST>


PERL MODULES
------------

#### FOR Conf::StarCluster
Getopt/Simple.pm

2. INSTALL APACHE
apt-get install apache2

3. REPLACE mpm-worker WITH mpm-prefork (Non-threaded) CGI DAEMON TO AVOID THIS:
    'unable to connect to cgi daemon'

apt-get install apache2-mpm-prefork
apt-get install apache2-prefork-dev


4. REPLACE /etc/apache2/apache2.conf WITH EDITED VERSION

bin/scripts/resources/apache2.conf


5. CREATE DIRS:

mkdir -p /var/www/html
mkdir -p /var/www/cgi-bin


5. LINK DIRECTORIES


ln -s /home/syoung/0.6/html /var/www/html/agua/0.6
ln -s /home/syoung/0.6/cgi-bin /var/www/cgi-bin/agua/0.6
ln -s /home/syoung/0.6/lib /var/www/cgi-bin/agua/0.6/lib
ln -s /home/syoung/0.6/conf /var/www/cgi-bin/agua/0.6/conf
ln -s /home/syoung/0.6/bin/sql /var/www/cgi-bin/agua/0.6/s  

3. SET PERMISSIONS

MAKE SURE THAT ALL THE LINKED DIRECTORIES ARE ACCESSIBLE TO www-data:

cd /home/syoung/0.6
find ./html -type d -exec chown syoung:www-data {} \;;
find ./html -type d -exec chmod 0775 {} \;;
find ./html -type f -exec chmod 0664 {} \;
find ./cgi-bin -type d -exec c
chown syoung:www-data {} \;;
find ./cgi-bin -type d -exec chmod 0775 {} \;;
find ./cgi-bin -type f -exec chmod 0664 {} \;
find ./cgi-bin -type f -name *cgi -exec chmod 0775 {} \;
find ./cgi-bin -type f -name *pl -exec chmod 0775 {} \;
find ./cgi-bin -type f -name agua -exec chmod 5775 {} \;

OPEN UP lib AND OTHER DIRS:

cd /home/syoung/0.6
find ./lib -type d -exec chmod 0775 {} \;;
find ./lib -type f -exec chmod 0644 {} \;

4. REPLACE apache2/sites-available/default (SEE NEW VERSION ABOVE) TO:
	SET HTML ROOT
	ENABLE CGI-BIN
	ALLOW FOLLOW SYMLINKS IN CGI-BIN (AVOID ERROR: 'method PUT not allowed')
		
5. SET UMASK AND SGE IN /etc/apache2/envvars

#### DEFAULT 775/664 FOR NEW FILES/DIRS
umask 0002 0002

#### GRID ENGINE ENV VARIABLES
export SGE_ROOT=/var/lib/gridengine
export SGE_QMASTER_PORT=701
export SGE_EXECD_PORT=702


6. RESTART APACHE:

/etc/init.d/apache2 restart


config.pl
---------

1. INSTALL MYSQL

if ( not -f /usr/bin/mysql )


apt-get install mysql-server
mysqladmin -u root password NEWPASSWORD
mysql -u root -p < /home/syoung/0.6/bin/sql/createDb.sql
mysql -u root -p < /home/syoung/0.6/bin/sql/createAguaUser.sql
mysql -u root -p agua < /home/syoung/0.6/bin/sql/dump/agua-110230.dump



EC2
----

IF NOT -f /usr/bin/ec2din
export DEBIAN_FRONTEND=noninteractive
apt-get -q -y install ec2-api-tools

WILL BE INSTALLED IN /usr/bin:

/usr/bin/ec2din


OR LATER:

mkdir -p /usr/share/ec2/archive
cd /usr/share/ec2
wget http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip
unzip *zip
mv ec2-api-tools-1.4.2.4/ 1.4.2.4
ll 1.4.2.4
    drwxr-xr-x 2 root root 20480 2011-04-06 03:03 bin/
    drwxr-xr-x 2 root root  4096 2011-04-06 03:03 lib/
    -rw-r--r-- 1 root root  4852 2011-04-06 03:00 license.txt
    -rw-r--r-- 1 root root   539 2011-04-06 03:00 notice.txt
    -rw-r--r-- 1 root root 46468 2011-04-06 03:00 THIRDPARTYLICENSE.TXT

2. GET THE JAVA VERSION

java -version
    java version "1.6.0_24"
    Java(TM) SE Runtime Environment (build 1.6.0_24-b07)
    Java HotSpot(TM) 64-Bit Server VM (build 19.1-b02, mixed mode)

ll /usr/java/jre1.6.0_24/bin
    OK


NFS SERVER
----------
SEE apps.starcluster.xsl
[Fri 2011:04:22 00:49:28 EST] MOUNT /data ON CLUSTER MASTER>

export DEBIAN_FRONTEND=noninteractive
apt-get  -q -y install nfs-kernel-server
apt-get  -q -y install nfs-common




</entry>

