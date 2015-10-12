centos




<entry [Fri 2015:01:30 16:01:37 EST] FIX SELINUX-SET PERMISSIONS>

PROBLEM

CAN'T DO /usr/bin/updatedb ON CENTOS


DIAGNOSIS

WRONG PERMISSIONS SET BY SE-LINUX SO 
ls -lZ /etc/cron.daily/mlocate.cron /usr/bin/updatedb /etc/updatedb.conf
	-rwxr-xr-x. root root system_u:object_r:bin_t:s0       /etc/cron.daily/mlocate.cron
	-rw-r--r--. root root system_u:object_r:etc_t:s0       /etc/updatedb.conf
	-rwxr-xr-x. root root system_u:object_r:locate_exec_t:s0 /usr/bin/updatedb

COMPARED TO RIGHT PERMISSIONS:


ls -lZ /etc/cron.daily/mlocate.cron /usr/bin/updatedb /etc/updatedb.conf
	-rwxr-xr-x. root root system_u:object_r:bin_t:s0 /etc/cron.daily/mlocate.cron
	-rw-r--r--. root root unconfined_u:object_r:user_tmp_t:s0 /etc/updatedb.conf
	-rwxr-xr-x. root root system_u:object_r:locate_exec_t:s0 /usr/bin/updatedb


SOLUTION:

RESTORE PERMISSIONS

restorecon -RFv /etc

	
</entry>
<entry [Wed 2014:05:21 08:25:47 EST] INSTALL cpanm>

yum install -y perl-devel
yum install -y perl-CPAN
curl -L http://cpanmin.us | perl - --sudo App::cpanminus
cp /usr/local/bin/cpanm /usr/bin
	
</entry>
<entry [Sun 2014:04:06 11:53:32 EST] UNZIP *.rpm FILE>

extract the rpm content to the current directory

rpm2cpio file.rpm | cpio -i --extract --make-directories

	
</entry>
<entry [Sat 2014:04:05 05:39:04 EST] FIXED PROBLEM: ll ALIAS IS 'ls -l' SO DOESN'T SHOW .* FILES>
	
PROBLEM

WHEN ISSUE ll COMMAND I GET 'ls -l' OUTPUT DESPITE THE FACT THAT I HAVE 'alias ll=ls -al' IN .bash_profile


DIAGNOSIS

THE /etc/profile/colorls.sh FILE IS BEING SOURCED BY /etc/profile

	for i in /etc/profile.d/*.sh ; do
		if [ -r "$i" ]; then
			if [ "${-#*i}" != "$-" ]; then
				. "$i"
			else
				. "$i" >/dev/null 2>&1
			fi
		fi
	done

grep ll /etc/profile.d/*.sh

	/etc/profile.d/colorls.sh:alias ll='ls -l --color=auto' 2>/dev/null


SOLUTION

**** DID NOT WORK *****
SOMEWHERE, THE ALIAS alias ll='ls -l IS STILL BEING SOURCE...
****

COMMENT OUT CODE IN FILE /etc/profile.d/colorls.sh

# alias ll='ls -l --color=auto' 2>/dev/null


COMMENT OUT THE SOURCING CODE IN /etc/profile

#	for i in /etc/profile.d/*.sh ; do
#		if [ -r "$i" ]; then
#			if [ "${-#*i}" != "$-" ]; then
#				. "$i"
#			else
#				. "$i" >/dev/null 2>&1
#			fi
#		fi
#	done
#
	
</entry>
<entry [Mon 2014:03:10 14:52:15 EST] FIXED yum ERROR: 'database disk image is malformed'>

PROBLEM

ISSUED A YUM INSTALL COMMAND AND GOT THIS ERROR:


SOLUTION:

1. CLEAN ALL DATA

yum clean all;
yum clean metadata;
yum clean dbcache;


2. REMOVE CACHE

rm -fr /var/cache/yum;


3. REBUILD THE rpm DATABASE:

mv /var/lib/rpm/__db* /tmp
rpm --rebuilddb

	
</entry>
<entry [Tue 2014:02:11 15:27:43 EST] GET CENTOS VERSION>

cat /etc/centos-release
CentOS release 6.4 (Final)

	
</entry>
<entry [Wed 2014:02:05 15:32:05 EST] FIX BAD REPO ERROR>

PROBLEM

yum install SOMEAPP

	http://annai-repo.mirantis.com/annai-genome-software/repodata/repomd.xml: [Errno 14] PYCURL ERROR 22 - "The requested URL returned error: 404 Not Found"
	Trying other mirror.
	Error: Cannot retrieve repository metadata (repomd.xml) for repository: annai.
	Please verify its path and try again


SOLUTION

DELETE BAD *.repo FILE

rm -fr /etc/yum.repos.d/annai.repo



	
</entry>
<entry [Tue 2014:01:21 08:33:18 EST] SET YUM MIRRORS>

ADD myrepo.repo FILE TO 
	
/etc/yum.repos.d/
	
</entry>
<entry [Sun 2013:09:01 13:31:59 EST] INSTALL locate ON CENTOS>

CENTOS 6.3

yum install -y mlocate
sudo /etc/cron.daily/mlocate

CentOS 5.x:

sudo yum install mlocate
sudo /etc/cron.daily/mlocate.cron


</entry>