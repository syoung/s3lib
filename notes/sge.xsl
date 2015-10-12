sge


<entry [Thu 2014:07:24 05:25:15 EST] SHARE /home/syoung/agua/ FROM annaisystems01 TO annaisystems02>


1. EDIT ON annaisystems01

emacs /etc/exports

ADD

/home/syoung/agua	23.252.245.126(async,no_root_squash,no_subtree_check,rw)


2. RESTART NFS

sudo service nfs-kernel-server restart
 * Stopping NFS kernel daemon                                                                                                                       [ OK ] 
 * Unexporting directories for NFS kernel daemon...                                                                                                 [ OK ] 
 * Exporting directories for NFS kernel daemon...                                                                                                   [ OK ] 
 * Starting NFS kernel daemon                                                                                                                       [ OK ] 

VERIFY:

showmount -e
	Export list for annaisystems01:
	/home/syoung/agua   23.252.245.126
	/data               23.252.245.126
	/agua               23.252.245.126
	/var/lib/gridengine 23.252.245.126


3. EDIT ON annaisystems02

emacs /etc/fstab

ADD

23.252.245.125:/home/syoung/agua   /home/syoung/agua	   nfs defaults 0 1


4. MOUNT

mkdir -p /home/syoung/agua
mount /home/syoung/agua

	OK

	
</entry>
<entry [Fri 2014:07:11 16:01:57 EST] FIXED ERROR: host "..." is neither submit nor admin host>

PROBLEM

qstat -f
	
	error: denied: host "annaisystems02" is neither submit nor admin host


SOLUTION

EITHER:

1. ON MASTER, ADD EXEC HOST AS SUBMIT HOST

qconf -as annaisystems02

TEST qstat ON EXEC HOST

qstat -f

	OK

OR:

2. ON MASTER, ADD EXEC HOST AS ADMIN HOST

REMOVE HOST FROM SUBMIT HOSTS AND ADD AS ADMIN HOST

qconf -ds annaisystems02
qconf -ah annaisystems02

TEST qstat ON EXEC HOST

qstat -f

	OK


	
</entry>
<entry [Fri 2014:07:11 15:52:08 EST] FIXED ERROR ON qstat -f: commlib error: access denied (server host resolves destination host "annaisystems01" as "localhost")>

PROBLEM

GOT THIS ERROR WITH qstat -f ON EXEC HOST:

root@annaisystems02:/home/syoung# qstat -f
error: commlib error: access denied (server host resolves destination host "annaisystems01" as "localhost")
error: unable to contact qmaster using port 6444 on host "annaisystems01"

... AND SIMILAR ERROR WITH qstat -f ON MASTER:


... AND WITH qconf:

qconf -sconf
error: commlib error: access denied (client IP resolved to host name "localhost". This is not identical to clients host name "annaisystems01")
ERROR: unable to contact qmaster using port 6444 on host "annaisystems01"


DIAGNOSIS

ON MASTER /etc/hosts FILE CONTAINS 'localhost' ENTRY, EITHER:

127.0.0.1	localhost
127.0.1.1	annaisystems01
::1	localhost6

23.252.245.125	annaisystems01
23.252.245.126	annaisystems02


OR:

127.0.0.1	localhost	annaisystems01
127.0.1.1	annaisystems01
::1	localhost6

23.252.245.125	annaisystems01
23.252.245.126	annaisystems02


SOLUTION

1. REMOVE localhost* LINES IN /etc/hosts ON MASTER

emacs /etc/hosts

	#127.0.0.1	localhost
	127.0.1.1	annaisystems01
	#::1	localhost6
	::1	annaisystems01
	
	23.252.245.125	annaisystems01
	23.252.245.126	annaisystems02


2. RESTART SGE ON MASTER

/etc/init.d/gridengine-master restart


3. TEST WITH qstat

qstat -f

	OK
	

4. DO THE SAME WITH /etc/hosts ON THE EXEC HOST

cat /etc/hosts

	#127.0.0.1	localhost
	127.0.1.1	annaisystems02
	#::1	localhost6
	::1	annaisystems02
	
	23.252.245.126	annaisystems02
	23.252.245.125	annaisystems01


	
</entry>
<entry [Fri 2014:07:11 14:36:48 EST] START/STOP SGE ON UBUNTU>

START EXECD

sge_execd


STOP/START EXECD

/etc/init.d/gridengine-exec stop
/etc/init.d/gridengine-exec start


START QMASTER

sge_qmaster


STOP/START QMASTER

/etc/init.d/gridengine-qmaster stop
/etc/init.d/gridengine-qmaster start

	
</entry>
<entry [Fri 2014:07:11 14:34:57 EST] FIXED ERROR ON COMMAND sge_execd: "error: can't find connection">

PROBLEM

GET THIS ERROR ON RUN sge_execd

	error: can't find connection
	error: can't get configuration from qmaster -- backgrounding


DIAGNOSIS


	
	
</entry>
<entry [Fri 2014:07:11 14:12:08 EST] FIXED ERROR: 'commlib error: got select error (Connection refused)'>

PROBLEM

GET THIS ERROR ON qstat -f:

	error: commlib error: got select error (Connection refused)
	error: unable to send message to qmaster using port 6444 on host "annaisystems01.nephoscale.com": got send error

	

DIAGNOSIS

CHECKED SPOOL MESSAGES ON MASTER:

emacs -nw /var/spool/gridengine/qmaster/messages

	07/11/2014 14:01:39| timer|localhost|W|act_qmaster file has been changed by another qmaster
	07/11/2014 14:01:39|  main|localhost|E|jvm thread is not running
	07/11/2014 14:01:46|  main|localhost|I|controlled shutdown 6.2u5 (exit state = 100)
	07/11/2014 14:09:28|  main|localhost|E|can't open "/var/lib/gridengine/default/common/act_qmaster" for writing qmaster hostname: Resource temporarily unavailable


 hostname -I
23.252.245.125 10.134.137.5 192.168.122.1 
root@annaisystems01:/# host 23.252.245.125
125.245.252.23.in-addr.arpa domain name pointer 125.245.252.23.svwh.net.

	
SOLUTION



	
</entry>
<entry [Fri 2014:07:11 14:02:54 EST] FIXED ERROR: 'commlib error: access denied (server host resolves rdata host "annaisystems02" as "(HOST_NOT_RESOLVABLE)")>

PROBLEM

GET ERROR ON qstat -f:

	error: commlib error: access denied (server host resolves rdata host "annaisystems02" as "(HOST_NOT_RESOLVABLE)")
	error: unable to contact qmaster using port 6444 on host "annaisystems01.nephoscale.com"


SOLUTION

ADD ENTRY FOR annaisystems02 IN /etc/hosts ON annaisystems01

cat /etc/hosts
	127.0.0.1	localhost annaisystems01
	127.0.1.1	annaisystems01
	::1	localhost6
	
	23.252.245.125	annaisystems01.nephoscale.com	annaisystems01
	23.252.245.126	annaisystems02.nephoscale.com	annaisystems02


RERAN qstat -f AND ERROR WAS FIXED BUT GOT NEW ERROR (SEE ABOVE):

	error: commlib error: got select error (Connection refused)
	error: unable to send message to qmaster using port 6444 on host "annaisystems01.nephoscale.com": got send error

	
</entry>
<entry [Fri 2014:07:11 13:47:10 EST] SHARE MOUNT /var/lib/gridengine FROM MASTER TO EXEC HOSTS ON UBUNTU>

**** NB: OPEN NFS PORTS 111, 2049 

1. INSTALL NFS SERVER

sudo apt-get update
sudo apt-get install -y nfs-kernel-server


2. EDIT /etc/exports

ADD:

/var/lib/gridengine	23.252.245.126(async,no_root_squash,no_subtree_check,rw)

# CREATE NFS TABLE (holds the exports of shares)
sudo exportfs -a

# START NFS SERVER
sudo service nfs-kernel-server restart

# VERIFY EXPORT
showmount -e
	
	Export list for annaisystems01:
	/var/lib/gridengine 23.252.245.126


3. INSTALL NFS CLIENT ON VM

sudo apt-get update
sudo apt-get install -y nfs-common


4. CREATE DIRECTORY ON VM

mkdir -p /var/lib/gridengine

# ADD TO /etc/fstab

emacs -nw /etc/fstab

23.252.245.125:/var/lib/gridengine	/var/lib/gridengine	nfs defaults 0 1

# MOUNT
mount /var/lib/gridengine

# VERIFY
ll /var/lib/gridengine
	drwxr-xr-x  3 root root  4096 Jun  5 17:09 ./
	drwxr-xr-x 29 root root  4096 Jun  6 00:50 ../
	drwx------  2 root root 16384 Jun  5 17:09 lost+found/

	OK



	
</entry>
<entry [Wed 2014:07:02 08:02:35 EST] SAVED annaisystems01 IPTABLES RULES>

sudo iptables-save > ~/iptables.rules

cat ~/iptables.rules 

	# Generated by iptables-save v1.4.21 on Wed Jul  2 08:01:50 2014
	*nat
	:PREROUTING ACCEPT [3737:305129]
	:INPUT ACCEPT [3737:305129]
	:OUTPUT ACCEPT [1073:75132]
	:POSTROUTING ACCEPT [1073:75132]
	-A POSTROUTING -s 192.168.122.0/24 -d 224.0.0.0/24 -j RETURN
	-A POSTROUTING -s 192.168.122.0/24 -d 255.255.255.255/32 -j RETURN
	-A POSTROUTING -s 192.168.122.0/24 ! -d 192.168.122.0/24 -p tcp -j MASQUERADE --to-ports 1024-65535
	-A POSTROUTING -s 192.168.122.0/24 ! -d 192.168.122.0/24 -p udp -j MASQUERADE --to-ports 1024-65535
	-A POSTROUTING -s 192.168.122.0/24 ! -d 192.168.122.0/24 -j MASQUERADE
	COMMIT
	# Completed on Wed Jul  2 08:01:50 2014
	# Generated by iptables-save v1.4.21 on Wed Jul  2 08:01:50 2014
	*mangle
	:PREROUTING ACCEPT [62619:22627574]
	:INPUT ACCEPT [62619:22627574]
	:FORWARD ACCEPT [0:0]
	:OUTPUT ACCEPT [38956:4512563]
	:POSTROUTING ACCEPT [38956:4512563]
	-A POSTROUTING -o virbr0 -p udp -m udp --dport 68 -j CHECKSUM --checksum-fill
	COMMIT
	# Completed on Wed Jul  2 08:01:50 2014
	# Generated by iptables-save v1.4.21 on Wed Jul  2 08:01:50 2014
	*filter
	:INPUT ACCEPT [572:46789]
	:FORWARD ACCEPT [0:0]
	:OUTPUT ACCEPT [340:33400]
	-A INPUT -i virbr0 -p udp -m udp --dport 53 -j ACCEPT
	-A INPUT -i virbr0 -p tcp -m tcp --dport 53 -j ACCEPT
	-A INPUT -i virbr0 -p udp -m udp --dport 67 -j ACCEPT
	-A INPUT -i virbr0 -p tcp -m tcp --dport 67 -j ACCEPT
	-A FORWARD -d 192.168.122.0/24 -o virbr0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
	-A FORWARD -s 192.168.122.0/24 -i virbr0 -j ACCEPT
	-A FORWARD -i virbr0 -o virbr0 -j ACCEPT
	-A FORWARD -o virbr0 -j REJECT --reject-with icmp-port-unreachable
	-A FORWARD -i virbr0 -j REJECT --reject-with icmp-port-unreachable
	-A OUTPUT -o virbr0 -p udp -m udp --dport 68 -j ACCEPT
	COMMIT
	# Completed on Wed Jul  2 08:01:50 2014

	
</entry>
<entry [Tue 2014:07:01 13:06:38 EST] INSTALLED SGE ON UBUNTU (NEPHOSCALE)>

1. SSH TO NEPHOSCALE annaisystems01 (23.252.245.125 IS master)

sshn 125


2. SET HOSTNAME ON MASTER

emacs /etc/hosts

	23.252.245.125	annaisystems.01


??  EDIT /etc/services FILE
sge_qmaster	536/tcp
sge_execd  	537/tcp


3. INSTALL MASTER

apt-get install gridengine-client gridengine-common gridengine-master gridengine-qmon gridengine-exec

	Initializing cluster with the following parameters:
	=> SGE_ROOT: /var/lib/gridengine
	=> SGE_CELL: default
	=> Spool directory: /var/spool/gridengine/spooldb
	=> Initial manager user: sgeadmin
	Initializing spool (/var/spool/gridengine/spooldb)
	...
	Setting up gridengine-exec (6.2u5-7.3) ...
	error: can't find connection
	error: can't get configuration from qmaster -- backgrounding
	Setting up gridengine-master (6.2u5-7.3) ...


4. DISABLE iptables 

sudo ufw disable

	Firewall stopped and disabled on system startup

SAVE IPTABLES (SEE [Wed 2014:07:02 08:02:35 EST] SAVED annaisystems01 IPTABLES RULES)

DISABLE IPTABLES

iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -F

TO OPEN PORTS

6444
111
36361
36362


hostname -I
#this gives you an IP, then type
host thisIP


5. EDIT act_qmaster

em /var/lib/gridengine/default/common/act_qmaster 

	annaisystems01.nephoscale.com

6. START UP ON MASTER

sge_qmaster
sge_execd

CONFIRM RUNNING WITH TELNET

telnet annaisystems01 6444
	Trying 127.0.0.1...
	Connected to localhost.
	Escape character is '^]'.
	^]

CONFIRM WITH netstat:

netstat -ntulp | grep sge

	tcp        0      0 0.0.0.0:63232           0.0.0.0:*               LISTEN      20103/sge_execd 
	tcp        0      0 0.0.0.0:6444            0.0.0.0:*               LISTEN      20707/sge_qmaster



6. INSTALL CLIENT ON WORKERS

LOGIN TO 23.252.245.126

sshn 126


COPY MASTER IP INFO AND OWN INFO TO /etc/hosts

23.252.245.126  annaisystems02.nephoscale.com   annaisystems02
23.252.245.125  annaisystems01.nephoscale.com   annaisystems01



sudo apt-get install gridengine-exec gridengine-client

	OK

	PROVIDED MASTER FQDN:
	
	annaisystems01.nephoscale.com
	
	

7. ENABLE SHARE /var/lib/gridengine FROM MASTER TO EXEC HOST



	
</entry>
<entry [Wed 2014:06:25 11:57:52 EST] FIXED SGE ERROR: queue instance "xxx" dropped because it is temporarily not available>
	
PROBLEM

GET THIS ERROR WHEN DO qstat -f:

	script_file:                /home/hcarter/agua/UnmappedReads/RunExtraction//scripts/sample-462aeda7-5e8d-4e58-90f2-717d071584a1.UnmappedReads-3-RunExtraction-1.sh
	error reason    1:          06/25/2014 12:40:33 [0:11765]: error: can't open output file "/home/hcarter/agua/UnmappedReads/RunEx
	scheduling info:            queue instance "all.q@sy-sgehost-1.bcf.net" dropped because it is temporarily not available
								queue instance "hcarter-UnmappedReads-RunExtraction@sy-sgehost-1.bcf.net" dropped because it is temporarily not available
								Job is in error state


DIAGNOSIS

qconf -sq hcarter-UnmappedReads-RunExtraction

@sy-sgehost-1.bcf.net

qconf -sq hcarter-UnmappedReads-RunExtraction@sy-sgehost-1.bcf.net

</entry>
<entry [Sat 2014:06:14 04:40:59 EST] MAXED OUT JOBS ON MASTER AND TWO EXECUTION HOST>


qstat

	job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID 
	-----------------------------------------------------------------------------------------------------------------
		 19 0.55500 test.sh    root         r     06/14/2014 11:41:37 all.q@10-2-24-85.bcf.net           1        
		 20 0.55500 test.sh    root         r     06/14/2014 11:41:37 all.q@sy-sgehost-1.bcf.net         1        
		 21 0.55500 test.sh    root         r     06/14/2014 11:41:37 all.q@sy-sgehost-2.bcf.net         1        
		 22 0.55500 test.sh    root         r     06/14/2014 11:41:37 all.q@10-2-24-85.bcf.net           1        
		 23 0.55500 test.sh    root         r     06/14/2014 11:41:52 all.q@10-2-24-85.bcf.net           1        
		 24 0.55500 test.sh    root         r     06/14/2014 11:41:52 all.q@sy-sgehost-1.bcf.net         1        
		 25 0.55500 test.sh    root         r     06/14/2014 11:41:52 all.q@sy-sgehost-2.bcf.net         1        
		 26 0.55500 test.sh    root         r     06/14/2014 11:41:52 all.q@10-2-24-85.bcf.net           1        
		 27 0.55500 test.sh    root         r     06/14/2014 11:41:52 all.q@10-2-24-85.bcf.net           1        
		 28 0.55500 test.sh    root         r     06/14/2014 11:41:52 all.q@sy-sgehost-1.bcf.net         1        
		 29 0.55500 test.sh    root         r     06/14/2014 11:41:52 all.q@sy-sgehost-2.bcf.net         1        
		 30 0.55500 test.sh    root         r     06/14/2014 11:41:52 all.q@10-2-24-85.bcf.net           1        
		 31 0.55500 test.sh    root         r     06/14/2014 11:41:52 all.q@10-2-24-85.bcf.net           1        
		 32 0.55500 test.sh    root         r     06/14/2014 11:41:52 all.q@sy-sgehost-1.bcf.net         1        
		 33 0.55500 test.sh    root         r     06/14/2014 11:41:52 all.q@sy-sgehost-2.bcf.net         1        
		 34 0.55500 test.sh    root         r     06/14/2014 11:41:52 all.q@10-2-24-85.bcf.net           1        
		 35 0.55500 test.sh    root         r     06/14/2014 11:41:52 all.q@10-2-24-85.bcf.net           1        
		 36 0.55500 test.sh    root         r     06/14/2014 11:41:52 all.q@sy-sgehost-1.bcf.net         1        
		 37 0.55500 test.sh    root         r     06/14/2014 11:41:52 all.q@sy-sgehost-2.bcf.net         1        
		 38 0.55500 test.sh    root         r     06/14/2014 11:41:52 all.q@10-2-24-85.bcf.net           1        
		 39 0.55500 test.sh    root         r     06/14/2014 11:41:52 all.q@10-2-24-85.bcf.net           1        
		 40 0.55500 test.sh    root         r     06/14/2014 11:41:52 all.q@sy-sgehost-1.bcf.net         1        
		 41 0.55500 test.sh    root         r     06/14/2014 11:41:52 all.q@sy-sgehost-2.bcf.net         1        
		 42 0.55500 test.sh    root         r     06/14/2014 11:41:52 all.q@10-2-24-85.bcf.net           1        
		 43 0.55500 test.sh    root         r     06/14/2014 11:42:22 all.q@10-2-24-85.bcf.net           1        
		 44 0.55500 test.sh    root         r     06/14/2014 11:42:52 all.q@sy-sgehost-1.bcf.net         1        
		 45 0.55500 test.sh    root         r     06/14/2014 11:42:52 all.q@sy-sgehost-2.bcf.net         1 

qstat -f
	queuename                      qtype resv/used/tot. load_avg arch          states
	---------------------------------------------------------------------------------
	all.q@10-2-24-85.bcf.net       BIP   0/16/16        0.06     lx26-amd64    
		 11 0.55500 test.sh    root         r     06/14/2014 11:40:37     1        
		 14 0.55500 test.sh    root         r     06/14/2014 11:41:07     1        
		 15 0.55500 test.sh    root         r     06/14/2014 11:41:07     1        
		 18 0.55500 test.sh    root         r     06/14/2014 11:41:07     1        
		 19 0.55500 test.sh    root         r     06/14/2014 11:41:37     1        
		 22 0.55500 test.sh    root         r     06/14/2014 11:41:37     1        
		 23 0.55500 test.sh    root         r     06/14/2014 11:41:52     1        
		 26 0.55500 test.sh    root         r     06/14/2014 11:41:52     1        
		 27 0.55500 test.sh    root         r     06/14/2014 11:41:52     1        
		 30 0.55500 test.sh    root         r     06/14/2014 11:41:52     1        
		 31 0.55500 test.sh    root         r     06/14/2014 11:41:52     1        
		 34 0.55500 test.sh    root         r     06/14/2014 11:41:52     1        
		 35 0.55500 test.sh    root         r     06/14/2014 11:41:52     1        
		 38 0.55500 test.sh    root         r     06/14/2014 11:41:52     1        
		 39 0.55500 test.sh    root         r     06/14/2014 11:41:52     1        
		 42 0.55500 test.sh    root         r     06/14/2014 11:41:52     1        
	---------------------------------------------------------------------------------
	all.q@sy-sgehost-1.bcf.net     BIP   0/8/8          0.08     lx26-amd64    
		 12 0.55500 test.sh    root         r     06/14/2014 11:41:07     1        
		 16 0.55500 test.sh    root         r     06/14/2014 11:41:07     1        
		 20 0.55500 test.sh    root         r     06/14/2014 11:41:37     1        
		 24 0.55500 test.sh    root         r     06/14/2014 11:41:52     1        
		 28 0.55500 test.sh    root         r     06/14/2014 11:41:52     1        
		 32 0.55500 test.sh    root         r     06/14/2014 11:41:52     1        
		 36 0.55500 test.sh    root         r     06/14/2014 11:41:52     1        
		 40 0.55500 test.sh    root         r     06/14/2014 11:41:52     1        
	---------------------------------------------------------------------------------
	all.q@sy-sgehost-2.bcf.net     BIP   0/8/8          0.23     lx26-amd64    
		 13 0.55500 test.sh    root         r     06/14/2014 11:41:07     1        
		 17 0.55500 test.sh    root         r     06/14/2014 11:41:07     1        
	
		 21 0.55500 test.sh    root         r     06/14/2014 11:41:37     1        
		 25 0.55500 test.sh    root         r     06/14/2014 11:41:52     1        
		 29 0.55500 test.sh    root         r     06/14/2014 11:41:52     1        
		 33 0.55500 test.sh    root         r     06/14/2014 11:41:52     1        
		 37 0.55500 test.sh    root         r     06/14/2014 11:41:52     1        
		 41 0.55500 test.sh    root         r     06/14/2014 11:41:52     1        
	
	############################################################################
	 - PENDING JOBS - PENDING JOBS - PENDING JOBS - PENDING JOBS - PENDING JOBS
	############################################################################
		 43 0.55500 test.sh    root         qw    06/14/2014 11:41:41     1        
		 44 0.55500 test.sh    root         qw    06/14/2014 11:41:41     1        
		 45 0.55500 test.sh    root         qw    06/14/2014 11:41:41     1

for i in ()
	

</entry>
<entry [Sat 2014:06:14 03:56:36 EST] RUN JOBS ON BOTH MASTER AND EXECUTION HOST>

NB: BY DEFAULT, OUTPUT FILES ARE IN /root


1. CREATE TEST QSUB FILE

emacs /root/sge/test.sh

#!/bin/sh

#$ -N my-job-name
#$ -cwd
#$ -j y
#$ -l s_rt=25:00:00
#$ -S /bin/bash

echo `env`
date
hostname

echo "Sleeping for 100 seconds"
sleep 100
echo "Completed"

# The following is for reporting only. It is not really needed
# to run the job. It will show up in your output file.
echo "Got $NSLOTS processors."
echo "Machines:"
cat $TMPDIR/machines


2. RUN JOBS

SUBMIT FROM EXECUTION HOST

[root@sy-sgehost-1 gridengine]# qsub /root/sge/test.sh
Your job 7 ("my-job-name") has been submitted

[root@sy-sgehost-1 gridengine]# qsub /root/sge/test.sh
Your job 8 ("my-job-name") has been submitted


3. CONFIRMED RUNNING ON BOTH MASTER AND EXECUTION HOST

qstat

	job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID 
	-----------------------------------------------------------------------------------------------------------------
		  7 0.55500 my-job-nam root         r     06/14/2014 11:00:51 all.q@10-2-24-85.bcf.net           1        
	[root@10-2-24-85 gridengine]# qstat
	job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID 
	-----------------------------------------------------------------------------------------------------------------
		  7 0.55500 my-job-nam root         r     06/14/2014 11:00:51 all.q@10-2-24-85.bcf.net           1        
		  8 0.55500 my-job-nam root         r     06/14/2014 11:01:06 all.q@sy-sgehost-1.bcf.net         1  


4. CHECK OUTPUT FILE

cat my-job-name.o8 

	HOSTNAME=sy-sgehost-1.bcf.net SGE_TASK_STEPSIZE=undefined SHELL=/bin/bash TERM=xterm NHOSTS=1 SGE_O_WORKDIR=/usr/share/gridengine TMPDIR=/tmp/8.1.all.q SGE_O_HOME=/root SGE_ARCH=lx26-amd64 SGE_CELL=default RESTARTED=0 ARC=lx26-amd64 USER=root SGE_TASK_LAST=undefined QUEUE=all.q SGE_TASK_ID=undefined SGE_BINARY_PATH=/usr/share/gridengine/bin/lx26-amd64 PATH=/tmp/8.1.all.q:/usr/local/bin:/bin:/usr/bin _=/bin/env SGE_STDERR_PATH=/usr/share/gridengine/my-job-name.o8 PWD=/usr/share/gridengine SGE_STDOUT_PATH=/usr/share/gridengine/my-job-name.o8 SGE_ACCOUNT=sge LANG=en_US.UTF-8 JOB_SCRIPT=/var/spool/gridengine/default/sy-sgehost-1/job_scripts/8 JOB_NAME=my-job-name SGE_ROOT=/usr/share/gridengine REQNAME=my-job-name SGE_JOB_SPOOL_DIR=/var/spool/gridengine/default/sy-sgehost-1/active_jobs/8.1 ENVIRONMENT=BATCH HOME=/root SHLVL=3 SGE_CWD_PATH=/usr/share/gridengine NQUEUES=1 SGE_O_LOGNAME=root SGE_O_MAIL=/var/spool/mail/centos TMP=/tmp/8.1.all.q JOB_ID=8 LOGNAME=root SGE_TASK_FIRST=undefined SGE_O_PATH=/sbin:/bin:/usr/sbin:/usr/bin SGE_O_HOST=sy-sgehost-1 SGE_O_SHELL=/bin/bash REQUEST=my-job-name NSLOTS=1 SGE_STDIN_PATH=/dev/null
	Sat Jun 14 10:59:43 UTC 2014
	sy-sgehost-1
	Sleeping for 100 seconds
	Completed
	Got 1 processors.
	Machines:
	cat: /tmp/8.1.all.q/machines: No such file or directory



</entry>
<entry [Sat 2014:06:14 03:38:52 EST] sge LOGGING>

STARTUP

/tmp/qmaster_messages (during qmaster startup)
/tmp/execd_messages   (during execution daemon startup)

SUBMIT JOBS

tail -f /var/spool/gridengine/default/spool/qmaster/messages

	
</entry>
<entry [Sat 2014:06:14 02:05:41 EST] FIXED FAILURE TO INSTALL EXECUTION HOST ON VM>

PROBLEM

cd /usr/share/gridengine
./inst_sge.sh -x

<!--
	Grid Engine cells
	-----------------
	
	Please enter cell name which you used for the qmaster
	installation or press <RETURN> to use [default] >> 
	
	Obviously there was no qmaster installation yet!
	Call >install_qmaster<
	on the machine which shall run the Grid Engine qmaster
-->


DIAGNOSIS

SGE EXPECTS AN NFS SHARED DIRECTORY SO THE default DIRECTORY SHOULD ALREADY HAVE BEEN CREATED WHEN THE QMASTER WAS INSTALLED

	export SGE_ROOT=/usr/share/gridengine
	cd $SGE_ROOT
	test -f default/common/act_qmaster
	echo $?
	ls default/common/act_qmaster


SOLUTION

1. SWITCH OFF IPTABLES TO ALLOW CONNECTION ON PORT 6444
service iptables stop
chkconfig iptables off

VERIFY EXECUTION HOST CAN SEE MASTER ON PORT 6444

telnet 10.2.24.85 6444

	Trying 10.2.24.85...
	Connected to 10.2.24.85.
	Escape character is '^]'.
	^]
	
	telnet> quit


2. COPY OVER default DIRECTORY

cd /usr/share/gridengine
scp -r centos@10.2.24.85:/usr/share/gridengine/default .


3. INSTALL EXECUTION HOST


cd /usr/share/gridengine
./inst_sge -x

	
</entry>
<entry [Sat 2014:06:14 01:51:05 EST] FIXED qsub FAIL TO RUN JOB>

SUMMARY: HOSTNAME SHOULD BE SHORT NAME


PROBLEM

JOB SUBMITS BUT HANGS IN qw STATE

qsub test.sh

	Your job 5 ("test.sh") has been submitted

qstat

	job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID 
	-----------------------------------------------------------------------------------------------------------------
		  5 0.00000 test.sh    root         qw    06/14/2014 10:27:41                                    1        
	[root@10-2-24-85 sge]# qstat -j 5
	==============================================================
	job_number:                 5
	exec_file:                  job_scripts/5
	submission_time:            Sat Jun 14 10:27:41 2014
	owner:                      root
	uid:                        0
	group:                      root
	gid:                        0
	sge_o_home:                 /root
	sge_o_log_name:             root
	sge_o_path:                 /usr/share/gridengine/bin/lx26-amd64:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin
	sge_o_shell:                /bin/bash
	sge_o_workdir:              /root/sge
	sge_o_host:                 10-2-24-85
	account:                    sge
	mail_list:                  root@10-2-24-85.bcf.net
	notify:                     FALSE
	job_name:                   test.sh
	jobshare:                   0
	env_list:                   
	script_file:                test.sh
	scheduling info:            There are no messages available

tail -f /var/spool/gridengine/default/spool/qmaster/messages

	06/14/2014 10:19:36|worker|10-2-24-85|E|got max. unheard timeout for target "execd" on host "10-2-24-85.bcf.net", can't deliver job "3"
	06/14/2014 10:19:36|worker|10-2-24-85|W|rescheduling job 3.1
	06/14/2014 10:19:36|worker|10-2-24-85|E|failed delivering job 3.1
	06/14/2014 10:19:36|worker|10-2-24-85|W|Skipping remaining 0 orders
	06/14/2014 10:19:36|schedu|10-2-24-85|E|failed delivering job 3.1
	06/14/2014 10:22:51|worker|10-2-24-85|E|got max. unheard timeout for target "execd" on host "10-2-24-85.bcf.net", can't deliver job "4"
	06/14/2014 10:22:51|worker|10-2-24-85|W|rescheduling job 4.1
	06/14/2014 10:22:51|worker|10-2-24-85|E|failed delivering job 4.1
	06/14/2014 10:22:51|worker|10-2-24-85|W|Skipping remaining 0 orders
	06/14/2014 10:22:51|schedu|10-2-24-85|E|failed delivering job 4.1


DIAGNOSIS


WRONG HOSTNAME

hostname

	10-2-24-85.bcf.net


SOLUTION

SET HOSTNAME TO SHORT NAME

hostname 10-2-24-85


NOW JOB RUNS OK:

qsub /root/sge/test.sh

	Your job 6 ("test.sh") has been submitted

qstat -f

	queuename                      qtype resv/used/tot. load_avg arch          states
	---------------------------------------------------------------------------------
	all.q@10-2-24-85.bcf.net       BIP   0/1/16         0.01     lx26-amd64    
		  6 0.55500 test.sh    root         r     06/14/2014 10:37:51     1
	  
	06/14/2014 10:22:51|worker|10-2-24-85|W|rescheduling job 4.1
	06/14/2014 10:22:51|worker|10-2-24-85|E|failed delivering job 4.1
	06/14/2014 10:22:51|worker|10-2-24-85|W|Skipping remaining 0 orders
	06/14/2014 10:22:51|schedu|10-2-24-85|E|failed delivering job 4.1
	06/14/2014 10:25:19| timer|10-2-24-85|E|error opening file "/usr/share/gridengine/default/common/accounting" for writing: Is a directory

	
qacct -j 5
	==============================================================
	qname        all.q               
	hostname     10-2-24-85.bcf.net  
	group        root                
	owner        root                
	project      NONE                
	department   defaultdepartment   
	jobname      test.sh             
	jobnumber    5                   
	taskid       undefined
	account      sge                 
	priority     0                   
	qsub_time    Sat Jun 14 10:27:41 2014
	start_time   Sat Jun 14 10:27:51 2014
	end_time     Sat Jun 14 10:29:31 2014
	granted_pe   NONE                
	slots        1                   
	failed       0    
	exit_status  0                   
	ru_wallclock 100          
	ru_utime     0.028        
	ru_stime     0.095        
	ru_maxrss    5448                
	ru_ixrss     0                   
	ru_ismrss    0                   
	ru_idrss     0                   
	ru_isrss     0                   
	ru_minflt    4011                
	ru_majflt    0                   
	ru_nswap     0                   
	ru_inblock   0                   
	ru_oublock   16                  
	ru_msgsnd    0                   
	ru_msgrcv    0                   
	ru_nsignals  0                   
	ru_nvcsw     24                  
	ru_nivcsw    19                  
	cpu          0.123        
	mem          0.003             
	io           0.000             
	iow          0.000             
	maxvmem      208.566M
	arid         undefined

	
	
SOLUTION

rm -fr /usr/share/gridengine/default/common/accounting



	
</entry>
<entry [Sat 2014:06:14 01:14:12 EST] FIXED ERROR DURING SGE INSTALLATION: 'Unsupported local hostname'>	

PROBLEM

./inst_sge -x -m 

The current hostname is resolved as follows:
	
	Hostname: host-10-2-24-85
	Aliases:  
	Host Address(es): 127.0.0.1 
	
	It is not supported for a Grid Engine installation that the local hostname
	contains the hostname "localhost" and/or the IP address "127.0.x.x" of the
	loopback interface.
	The "localhost" hostname should be reserved for the loopback interface
	("127.0.0.1") and the real hostname should be assigned to one of the
	physical or logical network interfaces of this machine

SOLUTION

EDIT /etc/hosts, USE IP WITH DASHES INSTEAD OF DOTS FOR HOSTNAME 

ALSO, ADD EXECUTION HOSTS:

emacs /etc/hosts

	127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
	::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
	
	10.2.24.85   10-2-24-85
	10.2.24.132  sy-sgehost-1
	10.2.24.133  sy-sgehost-2

</entry>
<entry [Sat 2014:06:14 01:13:55 EST] CONFIGURE SGE MASTER TO START ON BOOT>

source /usr/share/gridengine/default/common/settings.sh

chkconfig --level 35 sge_execd on
chkconfig --level 35 sgemaster on 
qconf -as `hostname`

	10-2-24-85 added to submit host list

qconf -msconf

	schedd_job_info                   true	

SHOW SUBMIT HOSTS

qconf -sh

	10-2-24-85
	sy-sgehost-1
	sy-sgehost-2
	

</entry>
<entry [Sat 2014:06:14 01:09:41 EST] INSTALL SGE ON VM EXECUTION HOSTS>

http://wiki.eri.ucsb.edu/sysadm/Sun_Grid_Engine


1. LAUNCH HOSTS

internal 	external
10.2.24.132	132.249.227.82
10.2.24.133	132.249.227.83

2. EDIT /etc/hosts

	127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
	::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
	
	10.2.24.85   10-2-24-85
	10.2.24.132  sy-sgehost-1
	10.2.24.133  sy-sgehost-2


3. OPEN PORTS

6444
6445
6446


4. COPY default DIRECTORY FROM QMASTER TO EXECUTION HOST

cd /usr/share/gridengine
scp -r centos@10.2.24.85:/usr/share/gridengine/default .



3. INSTALL AS EXECUTION HOST

yum -y install binutils csh java ksh libXpm openmotif22 tcl glibc
yum --enablerepo=epel install gridengine gridengine-qmaster gridengine-execd gridengine-qmon gridengine-devel
cd /usr/share/gridengine/

./inst_sge -x


FIRST EXECUTION HOST (10.2.24.132)

<!--

Welcome to the Grid Engine execution host installation
------------------------------------------------------

If you haven't installed the Grid Engine qmaster host yet, you must execute
this step (with >install_qmaster<) prior the execution host installation.

For a sucessfull installation you need a running Grid Engine qmaster. It is
also neccesary that this host is an administrative host.

You can verify your current list of administrative hosts with
the command:

   # qconf -sh

You can add an administrative host with the command:

   # qconf -ah <hostname>

The execution host installation will take approximately 5 minutes.

Hit <RETURN> to continue >>





Grid Engine TCP/IP communication service
----------------------------------------

The port for sge_execd is currently set as service.

   sge_execd service set to port 6445

Hit <RETURN> to continue >>



Checking hostname resolving
---------------------------

This hostname is known at qmaster as an administrative host.

Hit <RETURN> to continue >>



Execd spool directory configuration
-----------------------------------

You defined a global spool directory when you installed the master host.
You can use that directory for spooling jobs from this execution host
or you can define a different spool directory for this execution host.

ATTENTION: For most operating systems, the spool directory does not have to
be located on a local disk. The spool directory can be located on a 
network-accessible drive. However, using a local spool directory provides 
better performance.

FOR WINDOWS USERS: On Windows systems, the spool directory MUST be located
on a local disk. If you install an execution daemon on a Windows system
without a local spool directory, the execution host is unusable.

The spool directory is currently set to:
<</var/spool/gridengine/default/sy-sgehost-1>>

Do you want to configure a different spool directory
for this host (y/n) [n] >>
	
	
	
Creating local configuration
----------------------------
sgeadmin@sy-sgehost-1.bcf.net added "sy-sgehost-1.bcf.net" to configuration list
Local configuration for host >sy-sgehost-1.bcf.net< created.

Hit <RETURN> to continue >>



Grid Engine execution daemon startup
------------------------------------

Starting execution daemon. Please wait ...
Starting sge_execd:                                        [  OK  ]

Hit <RETURN> to continue >>



Adding a queue for this host
----------------------------

We can now add a queue instance for this host:

   - it is added to the >allhosts< hostgroup
   - the queue provides 8 slot(s) for jobs in all queues
     referencing the >allhosts< hostgroup

You do not need to add this host now, but before running jobs on this host
it must be added to at least one queue.

Do you want to add a default queue instance for this host (y/n) [y] >>

								
root@sy-sgehost-1.bcf.net modified "@allhosts" in host group list
root@sy-sgehost-1.bcf.net modified "all.q" in cluster queue list

Hit <RETURN> to continue >>




Using Grid Engine
-----------------

You should now enter the command:

   source /usr/share/gridengine/default/common/settings.csh

if you are a csh/tcsh user or

   # . /usr/share/gridengine/default/common/settings.sh

if you are a sh/ksh user.

This will set or expand the following environment variables:

   - $SGE_ROOT         (always necessary)
   - $SGE_CELL         (if you are using a cell other than >default<)
   - $SGE_CLUSTER_NAME (always necessary)
   - $SGE_QMASTER_PORT (if you haven't added the service >sge_qmaster<)
   - $SGE_EXECD_PORT   (if you haven't added the service >sge_execd<)
   - $PATH/$path       (to find the Grid Engine binaries)
   - $MANPATH          (to access the manual pages)

Hit <RETURN> to see where Grid Engine logs messages >>



Grid Engine messages
--------------------

Grid Engine messages can be found at:

   /tmp/qmaster_messages (during qmaster startup)
   /tmp/execd_messages   (during execution daemon startup)

After startup the daemons log their messages in their spool directories.

   Qmaster:     /var/spool/gridengine/default/spool/qmaster/messages
   Exec daemon: <execd_spool_dir>/<hostname>/messages


Grid Engine startup scripts
---------------------------

Grid Engine startup scripts can be found at:

   /usr/share/gridengine/default/common/sgemaster (qmaster)
   /usr/share/gridengine/default/common/sgeexecd (execd)

Do you want to see previous screen about using Grid Engine again (y/n) [n] >>
									
									
Your execution daemon installation is now completed.


-->


SECOND EXECUTION HOST (10.2.24.83):

<!--

Creating local configuration
----------------------------
sgeadmin@sy-sgehost-2.bcf.net added "sy-sgehost-2.bcf.net" to configuration list
Local configuration for host >sy-sgehost-2< created.

Hit <RETURN> to continue >> 


Grid Engine execution daemon startup
------------------------------------

Starting execution daemon. Please wait ...
Starting sge_execd:                                        [  OK  ]

Hit <RETURN> to continue >>


Adding a queue for this host
----------------------------

We can now add a queue instance for this host:

   - it is added to the >allhosts< hostgroup
   - the queue provides 8 slot(s) for jobs in all queues
     referencing the >allhosts< hostgroup

You do not need to add this host now, but before running jobs on this host
it must be added to at least one queue.

Do you want to add a default queue instance for this host (y/n) [y] >> 

root@sy-sgehost-2.bcf.net modified "@allhosts" in host group list
root@sy-sgehost-2.bcf.net modified "all.q" in cluster queue list

Hit <RETURN> to continue >>



Grid Engine messages
--------------------

Grid Engine messages can be found at:

   /tmp/qmaster_messages (during qmaster startup)
   /tmp/execd_messages   (during execution daemon startup)

After startup the daemons log their messages in their spool directories.

   Qmaster:     /var/spool/gridengine/default/spool/qmaster/messages
   Exec daemon: <execd_spool_dir>/<hostname>/messages


Using Grid Engine
-----------------

You should now enter the command:

   source /usr/share/gridengine/default/common/settings.csh

if you are a csh/tcsh user or

   # . /usr/share/gridengine/default/common/settings.sh

if you are a sh/ksh user.

This will set or expand the following environment variables:

   - $SGE_ROOT         (always necessary)
   - $SGE_CELL         (if you are using a cell other than >default<)
   - $SGE_CLUSTER_NAME (always necessary)
   - $SGE_QMASTER_PORT (if you haven't added the service >sge_qmaster<)
   - $SGE_EXECD_PORT   (if you haven't added the service >sge_execd<)
   - $PATH/$path       (to find the Grid Engine binaries)
   - $MANPATH          (to access the manual pages)

Hit <RETURN> to see where Grid Engine logs messages >>


Grid Engine startup scripts
---------------------------

Grid Engine startup scripts can be found at:

   /usr/share/gridengine/default/common/sgemaster (qmaster)
   /usr/share/gridengine/default/common/sgeexecd (execd)

Do you want to see previous screen about using Grid Engine again (y/n) [n] >>

Your execution daemon installation is now completed.

-->
	
</entry>
<entry [Fri 2014:06:13 18:34:04 EST] INSTALLED SGE MASTER AND EXECUTION HOST ON CENTOS (MOORES VM)>

<!--
1. yum INSTALL

yum -y install binutils csh java ksh libXpm openmotif22 tcl glibc
yum --enablerepo=epel install gridengine gridengine-qmaster gridengine-execd gridengine-qmon gridengine-devel
cd /usr/share/gridengine/

2. SET HOSTNAME

emacs /etc/hosts

	10.2.24.85	10-2-24-85

hostname 10.2.24.85


3. OPEN PORTS

6444
111
36361
36362


4. INSTALL

cd /usr/share/gridengine/
./inst_sge -x -m


SGE ROOT DIR

/usr/share/gridengine


Grid Engine TCP/IP communication service
----------------------------------------

The port for sge_qmaster is currently set as service.

   sge_qmaster service set to port 6444

Now you have the possibility to set/change the communication ports by using the
>shell environment< or you may configure it via a network service, configured
in local >/etc/service<, >NIS< or >NIS+<, adding an entry in the form

    sge_qmaster <port_number>/tcp

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

Hit <RETURN> to continue >>



Grid Engine TCP/IP communication service
----------------------------------------

The port for sge_execd is currently set as service.

   sge_execd service set to port 6445

Now you have the possibility to set/change the communication ports by using the
>shell environment< or you may configure it via a network service, configured
in local >/etc/service<, >NIS< or >NIS+<, adding an entry in the form

    sge_execd <port_number>/tcp

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

Hit <RETURN> to continue >>




Grid Engine qmaster spool directory
-----------------------------------

The qmaster spool directory is the place where the qmaster daemon stores
the configuration and the state of the queuing system.

The admin user >sgeadmin< must have read/write access
to the qmaster spool directory.

If you will install shadow master hosts or if you want to be able to start
the qmaster daemon on other hosts (see the corresponding section in the
Grid Engine Installation and Administration Manual for details) the account
on the shadow master hosts also needs read/write access to this directory.

Enter a qmaster spool directory [/var/spool/gridengine/default/spool/qmaster] >>



Using qmaster spool directory >/var/spool/gridengine/default/spool/qmaster<. 
Hit <RETURN> to continue >> 






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




Unique cluster name
-------------------

The cluster name uniquely identifies a specific Sun Grid Engine cluster.
The cluster name must be unique throughout your organization. The name 
is not related to the SGE cell.

The cluster name must start with a letter ([A-Za-z]), followed by letters, 
digits ([0-9]), dashes (-) or underscores (_).

Enter new cluster name or hit <RETURN>
to use default [p6444] >> sgecluster



creating directory: /usr/share/gridengine/default/common

Your $SGE_CLUSTER_NAME: sgecluster

Hit <RETURN> to continue >>



Windows Execution Host Support
------------------------------

Are you going to install Windows Execution Hosts? (y/n) [n] >> n



Verifying and setting file permissions
--------------------------------------

Did you install this version with >pkgadd< or did you already verify
and set the file permissions of your distribution (enter: y) (y/n) [y] >>


Select default Grid Engine hostname resolving method
----------------------------------------------------

Are all hosts of your cluster in one DNS domain? If this is
the case the hostnames

   >hostA< and >hostA.foo.com<

would be treated as equal, because the DNS domain name >foo.com<
is ignored when comparing hostnames.

Are all hosts of your cluster in a single DNS domain (y/n) [y] >> n

The domain name is not ignored when comparing hostnames.

Hit <RETURN> to continue >>



Default domain for hostnames
----------------------------

Sometimes the primary hostname of machines returns the short hostname
without a domain suffix like >foo.com<.

This can cause problems with getting load values of your execution hosts.
If you are using DNS or you are using domains in your >/etc/hosts< file or
your NIS configuration it is usually safe to define a default domain
because it is only used if your execution hosts return the short hostname
as their primary name.

If your execution hosts reside in more than one domain, the default domain
parameter must be set on all execution hosts individually.

Do you want to configure a default domain (y/n) [y] >> y


Please enter your default domain >> bcf.net



Grid Engine JMX MBean server
----------------------------

In order to use the SGE Inspect or the Service Domain Manager (SDM)
SGE adapter you need to configure a JMX server in qmaster. Qmaster 
will then load a Java Virtual Machine through a shared library.
NOTE: Java 1.5 or later is required for the JMX MBean server.

Do you want to enable the JMX MBean server (y/n) [y] >>


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

Enter JAVA_HOME (use "none" when none available) [/etc/alternatives/jre] >> 
Please enter additional JVM arguments (optional, default is [-Xmx256m]) >>
Please enter an unused port number for the JMX MBean server [6446] >> 
Enable JMX SSL server authentication (y/n) [y] >> 

Enable JMX SSL client authentication (y/n) [y] >> 

Enter JMX SSL server keystore path [/var/sgeCA/sge_qmaster/default/private/keystore] >> 
Enter JMX SSL server keystore pw (at least 6 characters) >>

PASSWORD
mooresUCSDsge

Using the following JMX MBean server settings.
   libjvm_path              >/etc/alternatives/jre/lib/amd64/server/libjvm.so<
   Additional JVM arguments >-Xmx256m<
   JMX port                 >6446<
   JMX ssl                  >true<
   JMX client ssl           >true<
   JMX server keystore      >/var/sgeCA/sge_qmaster/default/private/keystore<
   JMX server keystore pw   >*************<

Do you want to use these data (y/n) [y] >>


Making directories
------------------

creating directory: /var/spool/gridengine/default/spool/qmaster
creating directory: /var/spool/gridengine/default/spool/qmaster/job_scripts
Hit <RETURN> to continue >>


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

Default: [/var/spool/gridengine/default/spool/spooldb] >>


creating directory: /var/spool/gridengine/default/spool/spooldb
Dumping bootstrapping information
Initializing spooling database

Hit <RETURN> to continue >>



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



Grid Engine cluster configuration
---------------------------------

Please give the basic configuration parameters of your Grid Engine
installation:

   <execd_spool_dir>

The pathname of the spool directory of the execution hosts. User >sgeadmin<
must have the right to create this directory and to write into it.

Default: [/var/spool/gridengine/default] >>




Grid Engine cluster configuration (continued)
---------------------------------------------

<administrator_mail>

The email address of the administrator to whom problem reports are sent.

It is recommended to configure this parameter. You may use >none<
if you do not wish to receive administrator mail.

Please enter an email address in the form >user@foo.com<.

Default: [none] >> stuarty@annaisystems.com



The following parameters for the cluster configuration were configured:

   execd_spool_dir        /var/spool/gridengine/default
   administrator_mail     stuarty@annaisystems.com

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
Creating settings files for >.profile/.cshrc<

Hit <RETURN> to continue >>



Initializing Certificate Authority (CA) for OpenSSL security framework
----------------------------------------------------------------------
Creating /usr/share/gridengine/default/common/sgeCA
Creating /var/sgeCA/sge_qmaster/default
Creating /usr/share/gridengine/default/common/sgeCA/certs
Creating /usr/share/gridengine/default/common/sgeCA/crl
Creating /usr/share/gridengine/default/common/sgeCA/newcerts
Creating /usr/share/gridengine/default/common/sgeCA/serial
Creating /usr/share/gridengine/default/common/sgeCA/index.txt
Creating /usr/share/gridengine/default/common/sgeCA/usercerts
Creating /var/sgeCA/sge_qmaster/default/userkeys
Creating /var/sgeCA/sge_qmaster/default/private

Hit <RETURN> to continue >>




Creating CA certificate and private key
---------------------------------------
Please give some basic parameters to create the distinguished name (DN)
for the certificates.

We will ask for
   - the two letter country code
   - the state
   - the location, e.g city or your buildingcode
   - the organization (e.g. your company name)
   - the organizational unit, e.g. your department
   - the email address of the CA administrator (you!)


Hit <RETURN> to continue >> 

Please enter your two letter country code, e.g. 'US' >> US
Please enter your state >> CA
Please enter your location, e.g city or buildingcode >> San Diego
Please enter the name of your organization >> Moores Cancer Center
Please enter your organizational unit, e.g. your department >> Moores
Please enter the email address of the CA administrator >> stuarty@annaisystems.com



You selected the following basic data for the distinguished name of
your certificates:

Country code:         C=US
State:                ST=CA
Location:             L=San Diego
Organization:         O=Moores Cancer Center
Organizational unit:  OU=Moores
CA email address:     emailAddress=stuarty@annaisystems.com

Do you want to use these data (y/n) [y] >>


Creating CA certificate and private key
Generating a 1024 bit RSA private key
....++++++
.......................++++++
writing new private key to '/var/sgeCA/sge_qmaster/default/private/cakey.pem'
-----




Creating 'daemon' certificate and key for SGE Daemon
----------------------------------------------------
Generating a 1024 bit RSA private key
........++++++
...........................................++++++
writing new private key to '/var/sgeCA/sge_qmaster/default/private/key.pem'
-----
Using configuration from /tmp/sge_ca130420.tmp
Check that the request matches the signature
Signature ok
The Subject's Distinguished Name is as follows
countryName           :PRINTABLE:'US'
stateOrProvinceName   :PRINTABLE:'CA'
localityName          :PRINTABLE:'San Diego'
organizationName      :PRINTABLE:'Moores Cancer Center'
organizationalUnitName:PRINTABLE:'Moores'
userId                :PRINTABLE:'root'
commonName            :PRINTABLE:'SGE Daemon'
emailAddress          :IA5STRING:'none'
Certificate is to be certified until Jun 14 02:24:32 2015 GMT (365 days)

Write out database with 1 new entries
Data Base Updated
created and signed certificate for SGE daemons

Creating 'user' certificate and key for SGE install user
--------------------------------------------------------
Generating a 1024 bit RSA private key
.........................++++++
....................................++++++
writing new private key to '/var/sgeCA/sge_qmaster/default/userkeys/root/key.pem'
-----
Using configuration from /tmp/sge_ca130420.tmp
Check that the request matches the signature
Signature ok
The Subject's Distinguished Name is as follows
countryName           :PRINTABLE:'US'
stateOrProvinceName   :PRINTABLE:'CA'
localityName          :PRINTABLE:'San Diego'
organizationName      :PRINTABLE:'Moores Cancer Center'
organizationalUnitName:PRINTABLE:'Moores'
userId                :PRINTABLE:'root'
commonName            :PRINTABLE:'SGE install user'
emailAddress          :IA5STRING:'none'
Certificate is to be certified until Jun 14 02:24:32 2015 GMT (365 days)

Write out database with 1 new entries
Data Base Updated
created and signed certificate for user 'root' in '/var/sgeCA/sge_qmaster/default/userkeys/root'

Creating 'user' certificate and key for SGE admin user
------------------------------------------------------
Generating a 1024 bit RSA private key
.........++++++
................................................................++++++
writing new private key to '/var/sgeCA/sge_qmaster/default/userkeys/sgeadmin/key.pem'
-----
Using configuration from /tmp/sge_ca130420.tmp
Check that the request matches the signature
Signature ok
The Subject's Distinguished Name is as follows
countryName           :PRINTABLE:'US'
stateOrProvinceName   :PRINTABLE:'CA'
localityName          :PRINTABLE:'San Diego'
organizationName      :PRINTABLE:'Moores Cancer Center'
organizationalUnitName:PRINTABLE:'Moores'
userId                :PRINTABLE:'sgeadmin'
commonName            :PRINTABLE:'SGE admin user'
emailAddress          :IA5STRING:'none'
Certificate is to be certified until Jun 14 02:24:33 2015 GMT (365 days)

Write out database with 1 new entries
Data Base Updated
created and signed certificate for user 'sgeadmin' in '/var/sgeCA/sge_qmaster/default/userkeys/sgeadmin'
Hit <RETURN> to continue >>




Grid Engine qmaster startup
---------------------------

Starting qmaster daemon. Please wait ...
Starting sge_qmaster:                                      [  OK  ]
Hit <RETURN> to continue >>



Adding admin and submit hosts
-----------------------------

Please enter a blank seperated list of hosts.

Stop by entering <RETURN>. You may repeat this step until you are
entering an empty list. You will see messages from Grid Engine
when the hosts are added.

Host(s): 10.2.24.132
can't resolve hostname "10.2.24.132"
can't resolve hostname "10.2.24.132"
Hit <RETURN> to continue >>



EDITED /etc/hosts

10.2.24.132	sy-sgehost-1
10.2.24.133	sy-sgehost-2


Adding admin and submit hosts
-----------------------------

Please enter a blank seperated list of hosts.

Stop by entering <RETURN>. You may repeat this step until you are
entering an empty list. You will see messages from Grid Engine
when the hosts are added.

Host(s): 10.2.24.132
sy-sgehost-1 added to administrative host list
sy-sgehost-1 added to submit host list
Hit <RETURN> to continue >>




Creating the default <all.q> queue and <allhosts> hostgroup
-----------------------------------------------------------

root@10-2-24-85 added "@allhosts" to host group list
root@10-2-24-85 added "all.q" to cluster queue list

Hit <RETURN> to continue >>



Choosing password for the administrative user of SGE daemons
------------------------------------------------------------
Enter pw for sgeadmin's keystore (at least 6 characters) >> 
Generating keystore for sgeadmin ...

mooresUCSDsge



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

Enter the number of your preferred configuration and hit <RETURN>! 
Default configuration is [1] >> 


	Lets see if the formatting stays intact ...
	
	Scheduler tuning profile
	-----------------------------------------------------------
	Param			Normal		High		Max
	-----------------------------------------------------------
	job_load_adjustments	np_load_avg=0.5	none	none	
	load_adjustment_decay	7:30		0	0
	schedd_job_info		TRUE		FALSE	FALSE
	schedule_interval	00:15		00:15	02:00
	flush_submit_sec	0		0	4
	flush_finish_sec	0		0	4
	report_pjob_tickets	TRUE		TRUE	FALSE


Using Grid Engine
-----------------

You should now enter the command:

   source /usr/share/gridengine/default/common/settings.csh

if you are a csh/tcsh user or

   # . /usr/share/gridengine/default/common/settings.sh

if you are a sh/ksh user.

This will set or expand the following environment variables:

   - $SGE_ROOT         (always necessary)
   - $SGE_CELL         (if you are using a cell other than >default<)
   - $SGE_CLUSTER_NAME (always necessary)
   - $SGE_QMASTER_PORT (if you haven't added the service >sge_qmaster<)
   - $SGE_EXECD_PORT   (if you haven't added the service >sge_execd<)
   - $PATH/$path       (to find the Grid Engine binaries)
   - $MANPATH          (to access the manual pages)

Hit <RETURN> to see where Grid Engine logs messages >>



Grid Engine messages
--------------------

Grid Engine messages can be found at:

   /tmp/qmaster_messages (during qmaster startup)
   /tmp/execd_messages   (during execution daemon startup)

After startup the daemons log their messages in their spool directories.

   Qmaster:     /var/spool/gridengine/default/spool/qmaster/messages
   Exec daemon: <execd_spool_dir>/<hostname>/messages


Grid Engine startup scripts
---------------------------

Grid Engine startup scripts can be found at:

   /usr/share/gridengine/default/common/sgemaster (qmaster)
   /usr/share/gridengine/default/common/sgeexecd (execd)

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

   # qconf -ah <hostname>

Please hit <RETURN> >>


sge_qmaster successfully installed!



INSTALL EXECUTION HOST ON sshm



Welcome to the Grid Engine execution host installation
------------------------------------------------------

If you haven't installed the Grid Engine qmaster host yet, you must execute
this step (with >install_qmaster<) prior the execution host installation.

For a sucessfull installation you need a running Grid Engine qmaster. It is
also neccesary that this host is an administrative host.

You can verify your current list of administrative hosts with
the command:

   # qconf -sh

You can add an administrative host with the command:

   # qconf -ah <hostname>

The execution host installation will take approximately 5 minutes.

Hit <RETURN> to continue >> 



Checking $SGE_ROOT directory
----------------------------

The Grid Engine root directory is:

   $SGE_ROOT = /usr/share/gridengine

If this directory is not correct (e.g. it may contain an automounter
prefix) enter the correct path to this directory or hit <RETURN>
to use default [/usr/share/gridengine] >> 
Your $SGE_ROOT directory: /usr/share/gridengine

Hit <RETURN> to continue >>


Creating local configuration
----------------------------
sgeadmin@10-2-24-85 modified "10-2-24-85" in configuration list
Local configuration for host >10-2-24-85< created.

Hit <RETURN> to continue >> 

Grid Engine execution daemon startup
------------------------------------

Starting execution daemon. Please wait ...
Starting sge_execd:                                        [  OK  ]

Hit <RETURN> to continue >>



Adding a queue for this host
----------------------------

We can now add a queue instance for this host:

   - it is added to the >allhosts< hostgroup
   - the queue provides 16 slot(s) for jobs in all queues
     referencing the >allhosts< hostgroup

You do not need to add this host now, but before running jobs on this host
it must be added to at least one queue.

Do you want to add a default queue instance for this host (y/n) [y] >>



root@10-2-24-85 modified "@allhosts" in host group list
root@10-2-24-85 modified "all.q" in cluster queue list

Hit <RETURN> to continue >>



Using Grid Engine
-----------------

You should now enter the command:

   source /usr/share/gridengine/default/common/settings.csh

if you are a csh/tcsh user or

   # . /usr/share/gridengine/default/common/settings.sh

if you are a sh/ksh user.

This will set or expand the following environment variables:

   - $SGE_ROOT         (always necessary)
   - $SGE_CELL         (if you are using a cell other than >default<)
   - $SGE_CLUSTER_NAME (always necessary)
   - $SGE_QMASTER_PORT (if you haven't added the service >sge_qmaster<)
   - $SGE_EXECD_PORT   (if you haven't added the service >sge_execd<)
   - $PATH/$path       (to find the Grid Engine binaries)
   - $MANPATH          (to access the manual pages)

Hit <RETURN> to see where Grid Engine logs messages >>


Grid Engine messages
--------------------

Grid Engine messages can be found at:

   /tmp/qmaster_messages (during qmaster startup)
   /tmp/execd_messages   (during execution daemon startup)

After startup the daemons log their messages in their spool directories.

   Qmaster:     /var/spool/gridengine/default/spool/qmaster/messages
   Exec daemon: <execd_spool_dir>/<hostname>/messages


Grid Engine startup scripts
---------------------------

Grid Engine startup scripts can be found at:

   /usr/share/gridengine/default/common/sgemaster (qmaster)
   /usr/share/gridengine/default/common/sgeexecd (execd)

Do you want to see previous screen about using Grid Engine again (y/n) [n] >>

Your execution daemon installation is now completed.

-->




	
</entry>
<entry [Thu 2012:09:13 03:19:59 EST] FIXED ERROR: abort qmaster registration due to communication errors>

1. SET MASTER HOSTNAME TO master.private_dns_name IN sge.py

2. DELETED /opt/sge6/admin-microcluster ON HEAD AND MASTER

3. RERAN sge.py

    OK!!!!
    


/tmp/execd_messages.3022 
09/13/2012 06:24:59|  main|ip-10-220-103-126|C|abort qmaster registration due to communication errors
09/13/2012 06:25:01|  main|ip-10-220-103-126|W|daemonize error: child exited before sending daemonize state


    
</entry>
<entry [Fri 2012:03:16 14:01:40 EST] RAN automount.py TO MOUNT /nethome ETC ON MASTER>

cd /nethome/admin/.starcluster/plugins
/data/starcluster/0.92rc2/bin/starcluster \
-c /nethome/admin/.starcluster/admin-smallcluster.config \
shell

cfg.get_plugin('automount')
import automount; clus = cluster.ClusterManager(cfg); cluster.ClusterManager.run_plugin(clus, 'automount', 'admin-smallcluster')

reload(automount); cluster.ClusterManager.run_plugin(clus, 'automount', 'admin-smallcluster')

    
</entry>
<entry [Fri 2012:03:16 05:37:21 EST] FIXED ERROR 'can't open output file "/nethome/admin/agua/Project1/Workflow1/"'>

export SGE_QMASTER_PORT=36331; export SGE_EXECD_PORT=36332; export SGE_ROOT=/opt/sge6; export SGE_CELL=admin-smallcluster; export USERNAME=admin; export QUEUE=admin-Project1-Workflow1; export PROJECT=Project1; export WORKFLOW=Workflow1; /opt/sge6/bin/lx24-amd64/qsub -q admin-Project1-Workflow1 -V -l h_rt=24:00:00 -r y /nethome/admin/agua/Project1/Workflow1//scripts/Project1-1-Workflow1-1.sh

qstat -j 17
    ...S
    error reason    1:          03/16/2012 09:36:52 [0:9207]: error: can't open output file "/nethome/admin/agua/Project1/Workflow1/
    scheduling info:            queue instance "admin-Project1-Workflow1@ip-10-220-113-204" dropped because it is full

    
</entry>
<entry [Fri 2012:03:16 05:27:17 EST] FIXED ERROR: 'dropped because it is full'>

SEE [Sat 2011:09:24 02:10:46 EST] REVISITED 'dropped because it is full' AND FIXED BY CHANGING avg_load


THE THRESHOLD IS SET IN THE default QUEUE BY qconf:

qconf -sq default  |grep np_load_avg
    load_thresholds       np_load_avg=4


EDITED MANUALLY qconf FOR DEFAULT:

qconf -mq admin-Project1-Workflow1

AND CHANGED FROM: 

TO THIS:
load_thresholds       np_load_avg=24


    
</entry>
<entry [Mon 2012:03:12 23:10:08 EST] FIXED startup.py ERRORS>

cd /nethome/admin/.starcluster/plugins
/data/starcluster/0.92rc2/bin/starcluster \
-c /nethome/admin/.starcluster/admin-smallcluster.config \
shell

cfg.get_plugin('startup')
import startup; clus = cluster.ClusterManager(cfg); cluster.ClusterManager.run_plugin(clus, 'startup', 'admin-smallcluster')

reload(startup); cluster.ClusterManager.run_plugin(clus, 'startup', 'admin-smallcluster')

PROBLEM

>>> Running plugin startup
>>> Running plugin: startup.StartUp
>>> Copying key files to master
!!! ERROR - Error occured while running plugin 'startup':
Traceback (most recent call last):
  File "/data/starcluster/0.92rc2/starcluster/cluster.py", line 1301, in run_plugin
    func(*args)
  File "startup.py", line 82, in run
    self.copyScript(master)
  File "startup.py", line 130, in copyScript
    self.uploadToMaster(master, sourcefile, targetfile)
  File "startup.py", line 157, in uploadToMaster
    outfilehandle = master.ssh.remote_file(targetfile, 'w')
  File "/data/starcluster/0.92rc2/starcluster/ssh.py", line 266, in remote_file
    rfile = self.sftp.open(file, mode)
  File "/usr/local/lib/python2.6/dist-packages/paramiko-1.7.7.1-py2.6.egg/paramiko/sftp_client.py", line 245, in open
    t, msg = self._request(CMD_OPEN, filename, imode, attrblock)
  File "/usr/local/lib/python2.6/dist-packages/paramiko-1.7.7.1-py2.6.egg/paramiko/sftp_client.py", line 635, in _request
    return self._read_response(num)
  File "/usr/local/lib/python2.6/dist-packages/paramiko-1.7.7.1-py2.6.egg/paramiko/sftp_client.py", line 682, in _read_response
    self._convert_status(msg)
  File "/usr/local/lib/python2.6/dist-packages/paramiko-1.7.7.1-py2.6.egg/paramiko/sftp_client.py", line 708, in _convert_status
    raise IOError(errno.ENOENT, text)
IOError: [Errno 2] No such file


DIAGNOSIS

TARGET DIRECTORY /reset WAS NOT CREATED


SOLUTION


ADD TO METHOD copyScript CALL TO CREATE TARGET DIRECTORY /reset


target directory /reset was not created

add to method copyscript call to create target directory /reset
  
</entry>
<entry [Wed 2012:03:14 02:38:51 EST] FIXED 'deprecated' FOR RESTART NETWORKING>
    
PROBLEM

/etc/init.d/networking restart 
    Running /etc/init.d/networking restart is deprecated because it may not enable again some interfaces

SOLUTION:

service networking start
    networking stop/waiting

OR

start networking
    networking stop/waiting

OR

sudo nohup sh -c 'invoke-rc.d networking stop; date; echo sleeping; sleep 2; echo waking; date; invoke-rc.d networking start'
    nohup: ignoring input and appending output to `nohup.out'


OR PUT THIS IN BASH PROFILE

alias netrestart="sudo nohup sh -c 'invoke-rc.d networking stop; date; echo sleeping; sleep 2; echo waking; date; invoke-rc.d networking start'"




</entry>
<entry [Tue 2012:03:13 23:03:51 EST] FIXED QMASTER 'reresolve hostname failed: can't resolve host name'>

SUMMARY

USE 'DASHED' HOSTNAME (FROM INTERNAL IP) 


PROBLEM

CAN'T START QMASTER AND GET THIS ERROR IN /tmp/sge_messages

03/14/2012 03:32:38|  main|10|C|abort qmaster startup due to communication errors
03/14/2012 03:44:24|  main|10|C|abort qmaster startup due to communication errors
03/14/2012 03:45:42|  main|10|C|abort qmaster startup due to communication errors


DIAGNOSIS

SEEMS TO BE HOST NAME PROBLEM.

ENABLED DEBUGGING:

SEE [Tue 2011:08:30 02:11:14 EST] RUN SGE IN DEBUG TRACE MODE

source /opt/sge6/util/dl.sh
dl 2

START SGE:

/opt/sge6/bin/lx24-amd64/sge_qmaster


GOT THIS ERROR REPEATEDLY:

reresolve hostname failed: can't resolve host name


   336   8385         main --> gdi2_reresolve_qualified_hostname() {
   337   8385         main < -- gdi2_reresolve_qualified_hostname() ../libs/gdi/sge_gdi_ctx.c 2004 }
   338   8385         main --> sge_gdi_ctx_class_error() {
   339   8385         main --> sge_error_verror() {
   340   8385         main     error: reresolve hostname failed: can't resolve host name
   341   8385         main < -- sge_error_verror() ../libs/uti/sge_error_class.c 293 }
   342   8385         main < -- sge_gdi_ctx_class_error() ../libs/gdi/sge_gdi_ctx.c 520 }
   343   8385         main < -- sge_gdi_ctx_class_prepare_enroll() ../libs/gdi/sge_gdi_ctx.c 968 }
   344   8385         main --> sge_gdi_ctx_class_prepare_enroll() {
   345   8385         main --> gdi2_reresolve_qualified_hostname() {
   346   8385         main < -- gdi2_reresolve_qualified_hostname() ../libs/gdi/sge_gdi_ctx.c 2004 }
   347   8385         main --> sge_gdi_ctx_class_error() {
   348   8385         main --> sge_error_verror() {
   349   8385         main     error: reresolve hostname failed: can't resolve host name
   350   8385         main < -- sge_error_verror() ../libs/uti/sge_error_class.c 293 }
   351   8385         main < -- sge_gdi_ctx_class_error() ../libs/gdi/sge_gdi_ctx.c 520 }
   352   8385         main < -- sge_gdi_ctx_class_prepare_enroll() ../libs/gdi/sge_gdi_ctx.c 968 }
   353   8385         main --> sge_security_exit() {
   354   8385         main < -- sge_security_exit() ../libs/gdi/sge_security.c 618 }


THE ERROR MESSAGE IS GENERATED AT LINE 964 OF FILE sge_gdi_ctx.c:


   /*
   ** reresolve qualified hostname with use of host aliases 
   ** (corresponds to reresolve_me_qualified_hostname)
   */
   cl_ret = thiz->reresolve_qualified_hostname(thiz);
   if (cl_ret != CL_RETVAL_OK && cl_ret != ctx_get_last_commlib_error(thiz)) { 
      sge_gdi_ctx_class_error(thiz, STATUS_EUNKNOWN, ANSWER_QUALITY_WARNING, 
                         "reresolve hostname failed: %s", cl_get_error_text(cl_ret));
      DRETURN(cl_ret);
   } 

THE HOST NAME RETRIEVAL BINARIES APPEAR TO BE WORKING OK:

root@10:/opt/sge6/utilbin/linux-x64# ./gethostbyname -all 10.220.113.204
Hostname: 10.220.113.204
SGE name: 10.220.113.204
Aliases:  
Host Address(es): 10.220.113.204 


SOLUTION

1. CHANGED /etc/hosts HOSTNAME TO ip-10-220-113-204 'DASHED' HOSTNAME (NO DOTS) 

cat /etc/hosts

CHANGED THIS:

    127.0.0.1 ubuntu
    
    # The following lines are desirable for IPv6 capable hosts
    ::1 ip6-localhost ip6-loopback
    fe00::0 ip6-localnet
    ff00::0 ip6-mcastprefix
    ff02::1 ip6-allnodes
    ff02::2 ip6-allrouters
    ff02::3 ip6-allhosts
    # Added by cloud-init
    127.0.1.1	domU-12-31-38-04-72-22.compute-1.internal domU-12-31-38-04-72-22
    10.220.113.204 master

TO THIS:
    
    #### LOCALHOST
    127.0.0.1	localhost
    
    # The following lines are desirable for IPv6 capable hosts
    ::1 ip6-localhost ip6-loopback
    fe00::0 ip6-localnet
    ff00::0 ip6-mcastprefix
    ff02::1 ip6-allnodes
    ff02::2 ip6-allrouters
    ff02::3 ip6-allhosts
    
    #### EXTERNAL IP
    23.20.42.177   ec2-23-20-42-177.compute-1.amazonaws.com	
    #### INTERNAL IP
    10.220.113.204 ip-10-220-113-204 localhost


2. SET DASHED HOSTNAME IN /etc/hostname USING hostname COMMAND

root@10:/opt/sge6# hostname ip-10-220-113-204


3. SET DASHED HOSTNAME IN act_qmaster 

root@10:/opt/sge6# echo 'ip-10-220-113-204' > admin-smallcluster/common/act_qmaster


4. RESTARTED THE NETWORK ON MASTER

/etc/init.d/networking restart

    * Running /etc/init.d/networking restart is deprecated because it may not enable again some interfaces
    * Reconfiguring network interfaces...                                                                      RTNETLINK answers: File exists
   ssh stop/waiting
   ssh start/running, process 7832





THEN QMASTER STARTED SUCCESSFULLY:

root@10:~# p | grep sge
root      4458  0.0  0.1   7964   888 pts/2    S+   23:21   0:00      \_ grep sge
sgeadmin  4404  0.0  0.6 131820  4212 ?        Sl   23:18   0:00 /opt/sge6/bin/linux-x64/sge_qmaster
root@10:~# netstat -ntulp | grep sge
tcp        0      0 0.0.0.0:36331           0.0.0.0:*               LISTEN   


AND EXECD STARTED OK

netstat -ntulp | grep sge
tcp        0      0 0.0.0.0:36331           0.0.0.0:*               LISTEN      4404/sge_qmaster
tcp        0      0 0.0.0.0:36332           0.0.0.0:*               LISTEN      4463/sge_execd  


ALSO QSTAT OK

qstat -f
queuename                      qtype resv/used/tot. load_avg arch          states
---------------------------------------------------------------------------------
all.q@master                   BIP   0/0/1          -NA-     linux-x64     au


NOTES
=====

http://www.faqs.org/docs/securing/chap9sec95.html

9.7. The /etc/hosts file

 As your machine gets started, it will need to know the mapping of some hostnames to IP addresses before DNS can be referenced. This mapping is kept in the /etc/hosts file. In the absence of a name server, any network program on your system consults this file to determine the IP address that corresponds to a host name.

 Following is a sample /etc/hosts file:

           IPAddress     Hostname    		 Alias
           127.0.0.1			localhost	 	 deep.openna.com
           208.164.186.1		deep.openna.com		 deep
           208.164.186.2		mail.openna.com		 mail
           208.164.186.3		web.openna.com		 web
           
The leftmost column is the IP address to be resolved. The next column is that host's name. Any subsequent columns are alias for that host. In the second line, for example, the IP address 208.164.186.1 is for the host deep.openna.com. Another name for deep.openna.com is deep.


 After you are finished configuring your networking files, don't forget to restart your network for the changes to take effect.
           
           [root@deep] /# /etc/rc.d/init.d/network restart
           

             
           Setting network parameters		 [  OK  ]
           Bringing up interface lo		 [  OK  ]
           Bringing up interface eth0	         [  OK  ]
           Bringing up interface eth1	         [  OK  ]
           
           
act_qmaster FILE AND /etc/hosts MUST CONCUR:
           

Compare the contents of $SGE_ROOT/$SGE_CELL/act_qmaster to what you have 
in /etc/hosts -- the act_qmaster file contains the hostname for what SGE 
believes is the qmaster. That hostname needs to resolve perfectly in DNS 
or in your /etc/hosts file.

You can also experiment with the $SGE_ROOT/utilbin/gethostname and 
gethostbyname etc. commands to see how SGE resolves the local naming 
environment

And finally make sure that you have ports 6444 and 6445 open on your 
firewall!


SEE [Wed 2011:09:07 09:00:13 EST] USE qping TO QUERY STATUS OF SGE DAEMON
    
http://gridscheduler.sourceforge.net/htmlman/htmlman1/qping.html?pathrev=V62u5_TAG

qping -info master 36331 qmaster 1df 


    
</entry>
<entry [Tue 2012:03:13 00:58:07 EST] FIXED ERROR - CAN'T CONNECT TO MASTER>
  
ERROR:

CAN'T CONNECT TO MASTER


sc sshmaster admin-smallcluster

StarCluster - (http://web.mit.edu/starcluster) (v. 0.92rc2)
Software Tools for Academics and Researchers (STAR)
Please submit bug reports to starcluster@mit.edu

!!! ERROR - AuthFailure: AWS was not able to validate the provided access credentials



ABLE TO CONNECT WHEN USE INTERNAL IP:

ssh root@domU-12-31-38-04-72-22.compute-1.internal -v -i /nethome/admin/.starcluster/id_rsa-admin-key

  OK


CONFIRMED THAT MASTER HOSTNAME IS INTERNAL IP:

hostname
  domU-12-31-38-04-72-22.compute-1.internal


  
</entry>

<entry [Tue 2012:03:13 00:57:59 EST] CAN'T qstat ON MASTER BECAUSE HOSTNAME IS 'ubuntu'>


PROBLEM

SGE IS RUNNING BUT CAN'T FIND HOST 'UBUNTU'

root@domU-12-31-38-04-72-22:/# netstat -ntulp | grep sge
tcp        0      0 0.0.0.0:36331           0.0.0.0:*               LISTEN      6029/sge_qmaster
tcp        0      0 0.0.0.0:36332           0.0.0.0:*               LISTEN      6034/sge_execd  

root@domU-12-31-38-04-72-22:/# qstat
error: commlib error: access denied (client IP resolved to host name "ubuntu". This is not identical to clients host name "domU-12-31-38-04-72-22.compute-1.internal")
error: unable to send message to qmaster using port 36331 on host "domU-12-31-38-04-72-22.compute-1.internal": got send error
root@domU-12-31-38-04-72-22:/# hostname
domU-12-31-38-04-72-22.compute-1.internal  


DIAGNOSIS

THIS IS DUE TO THE /etc/hosts ENTRY

127.0.0.1 ubuntu


SOLUTION

CHANGE /etc/hosts LINE TO:

127.0.0.1 localhost

  



</entry>
<entry [Mon 2012:03:12 22:24:25 EST] FIXED WRONG QMASTER BINARY FILEPATH ERROR 'failed with status 127'>

cd /nethome/admin/.starcluster/plugins
/data/starcluster/0.92rc2/bin/starcluster \
-c /nethome/admin/.starcluster/admin-smallcluster.config \
shell

cfg.get_plugin('sge')
import sge; clus = cluster.ClusterManager(cfg); cluster.ClusterManager.run_plugin(clus, 'sge', 'admin-smallcluster')

reload(sge); cluster.ClusterManager.run_plugin(clus, 'sge', 'admin-smallcluster')



PROBLEM:

COMMAND TO START QMASTER AND EXECD ON MASTER FAILS

LOADING sge.py

  >>> Setting master hostname
  >>> Restarting SGE qmaster and execd daemons
  >>> /bin/ps aux | grep sgeadmin | cut -c9-14 | xargs -n1 -iPID /bin/kill -9 PID &> /dev/null
  >>> /bin/ps aux | grep root | grep sge | cut -c9-14 | xargs -n1 -iPID /bin/kill -9 PID &> /dev/null
  !!! ERROR - command 'export SGE_ROOT=/opt/sge6; export SGE_CELL=admin-smallcluster; export SGE_QMASTER_PORT=36331; export SGE_EXECD_PORT=36332; /opt/sge6/bin/lx24-amd64/sge_qmaster' failed with status 127
  !!! ERROR - command 'export SGE_ROOT=/opt/sge6; export SGE_CELL=admin-smallcluster; export SGE_QMASTER_PORT=36331; export SGE_EXECD_PORT=36332; /opt/sge6/bin/lx24-amd64/sge_execd' failed with status 127


DIAGNOSIS:

THE PATH TO THE BINARIES HAS CHANGED FROM

/opt/sge6/bin/lx24-amd64/sge_execd

TO

/opt/sge6/bin/linux-64/sge_execd



SOLUTION

USE $ROOTPATH ENVIRONMENT VARIABLE IN /etc/profile.d/sge.sh



NOTES
=====

>>> Setting master hostname
!!! ERROR - command 'echo 'domU-12-31-38-04-72-22.compute-1.internal' > /opt/sge6/admin-smallcluster/common/act_qmaster' failed with status 1
>>> CreateCell.setMasterInfo    instanceid: ['i-1d3fb179']
>>> CreateCell.setMasterInfo    cmd: echo 'domU-12-31-38-04-72-22.compute-1.internal	10.220.113.204	i-1d3fb179' > /opt/sge6/admin-smallcluster/qmaster_info
>>> Adding environment variables to /etc/profile
>>> Copying cell directory on head node
>>> Copying cell directory on master
>>> mkdir /opt/sge6/admin-smallcluster &> /dev/null
!!! ERROR - command 'cd /opt/sge6/admin-smallcluster/common; export SGE_ROOT=/opt/sge6; export SGE_CELL=admin-smallcluster; export SGE_QMASTER_PORT=36331; export SGE_EXECD_PORT=36332; /opt/sge6/util/create_settings.sh /opt/sge6/admin-smallcluster/common' failed with status 2
>>> rsync -a /opt/sge6/default/* /opt/sge6/admin-smallcluster --exclude *tar.gz
>>> chown -R sgeadmin:sgeadmin /opt/sge6/admin-smallcluster
>>> Updating act_qmaster file
>>> sge.CreateCell.editAllhosts    Replacing 'master' with master long internal IP in @allhosts
reresolve hostname failed: can't resolve host name
reresolve hostname failed: can't resolve host name
>>> Restarting SGE qmaster and execd daemons
>>> /bin/ps aux | grep sgeadmin | cut -c9-14 | xargs -n1 -iPID /bin/kill -9 PID &> /dev/null
>>> /bin/ps aux | grep root | grep sge | cut -c9-14 | xargs -n1 -iPID /bin/kill -9 PID &> /dev/null
!!! ERROR - command 'export SGE_ROOT=/opt/sge6; export SGE_CELL=admin-smallcluster; export SGE_QMASTER_PORT=36331; export SGE_EXECD_PORT=36332; /opt/sge6/bin/lx24-amd64/sge_qmaster' failed with status 127
!!! ERROR - command 'export SGE_ROOT=/opt/sge6; export SGE_CELL=admin-smallcluster; export SGE_QMASTER_PORT=36331; export SGE_EXECD_PORT=36332; /opt/sge6/bin/lx24-amd64/sge_execd' failed with status 127
>>> Enabling job scheduling info
reresolve hostname failed: can't resolve host name
reresolve hostname failed: can't resolve host name
>>> Adding 'threaded' parallel environment
!!! ERROR - command 'export SGE_ROOT=/opt/sge6; export SGE_CELL=admin-smallcluster; export SGE_QMASTER_PORT=36331; export SGE_EXECD_PORT=36332; /opt/sge6/bin/lx24-amd64/qconf -Ap /tmp/pe.txt &> /tmp/pe.out' failed with status 127
!!! ERROR - command 'export SGE_ROOT=/opt/sge6; export SGE_CELL=admin-smallcluster; export SGE_QMASTER_PORT=36331; export SGE_EXECD_PORT=36332; /opt/sge6/bin/lx24-amd64/qconf -mattr queue pe_list "threaded" all.q &> /tmp/pe2q.out' failed with status 127
>>> Adding head node to submit hosts and admin hosts lists
>>> sge.CreateCell.getHeadIp    Getting headnode internal IP
>>> sge.CreateCell.getHeadIp    self.head_ip: 10.253.221.12
!!! ERROR - command 'export SGE_ROOT=/opt/sge6; export SGE_CELL=admin-smallcluster; export SGE_QMASTER_PORT=36331; export SGE_EXECD_PORT=36332; /opt/sge6/bin/lx24-amd64/qconf -as 10.253.221.12' failed with status 127
!!! ERROR - command 'export SGE_ROOT=/opt/sge6; export SGE_CELL=admin-smallcluster; export SGE_QMASTER_PORT=36331; export SGE_EXECD_PORT=36332; /opt/sge6/bin/lx24-amd64/qconf -ah 10.253.221.12' failed with status 127
>>> Add master to @allhosts group
>>> sge.addToAllhosts    command: /opt/sge6/bin/lx24-amd64/qconf -aattr hostgroup hostlist master @allhosts >> /tmp/allhosts.out; 
!!! ERROR - command 'export SGE_ROOT=/opt/sge6; export SGE_CELL=admin-smallcluster; export SGE_QMASTER_PORT=36331; export SGE_EXECD_PORT=36332; /opt/sge6/bin/lx24-amd64/qconf -aattr hostgroup hostlist master @allhosts >> /tmp/allhosts.out; ' failed with status 127
>>> Restarting SGE qmaster and execd daemons
>>> /bin/ps aux | grep sgeadmin | cut -c9-14 | xargs -n1 -iPID /bin/kill -9 PID &> /dev/null
>>> /bin/ps aux | grep root | grep sge | cut -c9-14 | xargs -n1 -iPID /bin/kill -9 PID &> /dev/null
!!! ERROR - command 'export SGE_ROOT=/opt/sge6; export SGE_CELL=admin-smallcluster; export SGE_QMASTER_PORT=36331; export SGE_EXECD_PORT=36332; /opt/sge6/bin/lx24-amd64/sge_qmaster' failed with status 127
!!! ERROR - command 'export SGE_ROOT=/opt/sge6; export SGE_CELL=admin-smallcluster; export SGE_QMASTER_PORT=36331; export SGE_EXECD_PORT=36332; /opt/sge6/bin/lx24-amd64/sge_execd' failed with status 127
>>> sge.CreateCell.removeAllq    Removing the default 'all.q' queue
reresolve hostname failed: can't resolve host name
>>> sge.CreateCell.run    Completed

  
</entry>
<entry [Sat 2011:09:24 02:10:46 EST] REVISITED 'dropped because it is full' AND FIXED BY CHANGING avg_load>


THE THRESHOLD IS SET IN THE default QUEUE BY qconf:

qconf -sq default  |grep np_load_avg
    load_thresholds       np_load_avg=4


EDITED MANUALLY qconf FOR DEFAULT:

qconf -mq default

AND CHANGED FROM: 

TO THIS:
load_thresholds       np_load_avg=24



    
</entry>
<entry [Fri 2011:09:09 13:43:04 EST] FIXED QUEUE INSTANCE "dropped because it is full">

PROBLEM: GET "dropped because it is full" AFTER SUBMITTING JOB

qsub -r y -q syoung-BOWTIE-alignment test.sh

qstat -j 46
    (FULL OUTPUT BELOW)
    queue instance "syoung-BOWTIE-alignment@domU-12-31-38-04-D8-06.compute-1.internal" dropped because it is full
    queue instance "all.q@domU-12-31-38-04-D8-06.compute-1.internal" dropped because it is overloaded: np_load_avg=1.850000 (= 1.350000 + 0.50 * 1.000000 with nproc=1) >= 1.75


DIAGNOSIS:

NORMAL OUTPUT. JOB WILL RUN AFTER SOME TIME IN PENDING QUEUE:

qstat -f 
queuename                      qtype resv/used/tot. load_avg arch          states
---------------------------------------------------------------------------------
all.q@domU-12-31-38-04-D8-06.c BIP   0/0/1          0.87     lx24-amd64    
---------------------------------------------------------------------------------
syoung-BOWTIE-alignment@domU-1 BIP   0/1/1          0.87     lx24-amd64    
     50 0.55500 test       root         r     09/09/2011 18:11:23     1        

############################################################################
 - PENDING JOBS - PENDING JOBS - PENDING JOBS - PENDING JOBS - PENDING JOBS
############################################################################
     51 0.55500 test       root         qw    09/09/2011 18:10:23     1        
     52 0.55500 test       root         qw    09/09/2011 18:10:23     1        


SOLUTION:

DO NOTHING


NOTES
-----

http://wikis.sun.com/display/GridEngine/Troubleshooting+and+Error+Messages
Problem: Pending Jobs Not Being Dispatched
Description: Sometimes a pending job is obviously capable of being run, but the job does not get dispatched. 
Solution: To diagnose the reason, the Grid Engine system offers the following utilities and options:

qstat -j job-id – When enabled, qstat -j job-id provides a list of reasons why a certain job was not dispatched in the last scheduling run. By default, this monitoring is disabled because it can consume large amounts of memory, especially when there are many jobs. See schedd_job_info in the sched_conf(5) man page. The following example shows output for a job with the ID 242059:
% qstat -j 242059
scheduling info: queue "fangorn.q" dropped because it is temporarily not available
queue "lolek.q" dropped because it is temporarily not available
queue "balrog.q" dropped because it is temporarily not available
queue "saruman.q" dropped because it is full
cannot run in queue "bilbur.q" because it is not contained in its hard queuelist (-q)

cannot run in queue "dwain.q" because it is not contained in its hard queue list (-q)
has no permission for host "ori"

This information is generated directly by the qmaster daemon. The generating of this information takes the current usage of the cluster into account. Sometimes this information does not provide what you are looking for. For example, if all queue slots are already occupied by jobs of other users, no detailed message is generated for the job you are interested in.
qalter -w v job-id – This command lists the reasons why a job is not dispatchable in principle. For this purpose, a dry scheduling run is performed. All consumable resources, as well as all slots, are considered to be fully available for this job. Similarly, all load values are ignored because these values vary.




FULL OUTPUT:

qstat -j 46
==============================================================
job_number:                 46
exec_file:                  job_scripts/46
submission_time:            Fri Sep  9 17:42:23 2011
owner:                      root
uid:                        0
group:                      root
gid:                        0
sge_o_home:                 /root
sge_o_log_name:             root
sge_o_path:                 /usr/bin:/opt/sge6/bin/lx24-amd64:/opt/sge6/utilbin/lx24-amd64:/agua/bin/apps/logic:/opt/sge6/bin/lx24-amd64/:/opt/sge6/util:/opt/sge6/utilbin/lx24-amd64:/root/.pythonbrew/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/sge6/bin/lx24-amd64
sge_o_shell:                /bin/bash
sge_o_workdir:              /nethome/syoung/agua/Project1/test
sge_o_host:                 domU-12-31-38-04-80-08
account:                    sge
stderr_path_list:           NONE:NONE:/nethome/syoung/agua/Project1/test/test.err
hard resource_list:         h_rt=3600
mail_list:                  root@domU-12-31-38-04-80-08.compute-1.internal
notify:                     FALSE
job_name:                   test
stdout_path_list:           NONE:NONE:/nethome/syoung/agua/Project1/test/test.out
jobshare:                   0
hard_queue_list:            syoung-BOWTIE-alignment
env_list:                   
script_file:                test.sh
usage    1:                 cpu=00:00:00, mem=0.00000 GBs, io=0.00000, vmem=N/A, maxvmem=N/A
scheduling info:            queue instance "syoung-BOWTIE-alignment@domU-12-31-38-04-D8-06.compute-1.internal" dropped because it is full
                            queue instance "all.q@domU-12-31-38-04-D8-06.compute-1.internal" dropped because it is overloaded: np_load_avg=1.850000 (= 1.350000 + 0.50 * 1.000000 with nproc=1) >= 1.75


</entry>
<entry [Wed 2011:09:07 14:13:38 EST] FIXED RECURRING qstat, qconf AND qhost FAILURES ON HEADNODE>

PROBLEM: qstat, qhost AND qconf FAILING ON FIRST POLLS OF balancer/sge/__init__.py


DIAGNOSIS:

THIS PROBLEM HAD MULTIPLE CAUSES:

1. QUEUE NAME WAS MISSING SO qstat WAS USING THE DEFAULT all.q WHICH WAS EMPTY

2. EMPTY RETURN FROM qstat WAS KILLING Expat PARSER (HENCE THE ExpatError)

3. EMPTY RETURN WAS DUE TO @allhosts CONTAINING 'master' AND NOT MASTER LONG INTERNAL IP

(FOR DETAILS, SEE BELOW)



SOLUTION:
SOLUTION 3:

1. ADD updateActQmaster METHOD TO sge.py TO SET MASTER'S IP ADDRESS IN act_qmaster FILE ON HEADNODE

2. ADD edtiAllHosts METHOD TO sge.py TO MODIFY ON HEADNODE THE @allhosts GROUP BY REPLACING master WITH MASTER LONG INTERNAL IP

qconf -shgrp @allhosts > /tmp/SGE_CELL-allhosts.q

    group_name @allhosts
    hostlist master

EDIT TO READ:
    
    group_name @allhosts
    hostlist domU-12-31-38-04-D8-06

qconf -Mhgrp /tmp/syoung-BOWTIE-alignment-allhosts.q

    root@domU-12-31-38-04-80-08.compute-1.internal modified "@allhosts" in host group list


... NOW CAN SUBMIT JOBS!!:

export SGE_QMASTER_PORT=36471; export SGE_EXECD_PORT=36472; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-microcluster; export USERNAME=syoung; export QUEUE=syoung-BOWTIE-alignment; export PROJECT=BOWTIE; export WORKFLOW=alignment; /opt/sge6/bin/lx24-amd64/qsub -q syoung-BOWTIE-alignment -V /tmp/BOWTIE-6-alignment-4.sh

    Your job 45 ("BOWTIE-6-alignment-4") has been submitted



DIAGNOSIS DETAILS
-----------------

www-data STARCLUSTER DEBUG LOG:

em /tmp/starcluster-debug-www-data.log


AND balancers/sge/__init__.py, LINE 574:

        log.info("qhost: %s" % qhostxml)
        log.info("qstat: %s" % qstatxml)
        log.info("qacct: %s" % qacct)

        self.stat.parse_qhost(qhostxml)
        if ( qstatxml != None ):
            self.stat.parse_qstat(qstatxml)
        self.stat.parse_qacct(qacct, now)


CHECKED www-data USER STARCLUSTER DEBUG LOG:

em /tmp/starcluster-debug-www-data.log

    PID: 10341 ssh.py:399 - ERROR - command 'export SGE_QMASTER_PORT=36471 &&  export SGE_EXECD_PORT=36472 &&  export SGE_ROOT=/opt/sge6 &&  export SGE_CELL=syoung-microcluster && /opt/sge6/bin/lx24-amd64/qhost -xml' failed with status 1
    PID: 10341 ssh.py:405 - DEBUG - error: unable to send message to qmaster using port 36471 on host "master": got send error
    PID: 10341 ssh.py:405 - DEBUG - error: commlib error: got select error (Connection refused)

    PID: 10341 ssh.py:399 - ERROR - command 'export SGE_QMASTER_PORT=36471 &&  export SGE_EXECD_PORT=36472 &&  export SGE_ROOT=/opt/sge6 &&  export SGE_CELL=syoung-microcluster && /opt/sge6/bin/lx24-amd64/qstat -q all.q -u "*" -xml' failed with status 1
    PID: 10341 ssh.py:405 - DEBUG - error: commlib error: got select error (Connection refused)
    PID: 10341 ssh.py:405 - DEBUG - error: unable to send message to qmaster using port 36471 on host "master": got send error


NO RESPONSE WHEN TEST MANUALLY WITH '-q all.q':

export SGE_QMASTER_PORT=36471 &&  export SGE_EXECD_PORT=36472 &&  export SGE_ROOT=/opt/sge6 &&  export SGE_CELL=syoung-microcluster && /opt/sge6/bin/lx24-amd64/qstat  -q all.q -u "*" -xml


BUT WORKS NORMALLY WHEN EXCLUDE '-q all.q':    

/opt/sge6/bin/lx24-amd64/qstat  -u "*" -xml

<!--

<?xml version='1.0'?>
<job_info  xmlns:xsd="http://gridengine.sunsource.net/source/browse/*checkout*/gridengine/source/dist/util/resources/schemas/qstat/qstat.xsd?revision=1.11">
  <queue_info>
  </queue_info>
  <job_info>
  </job_info>
</job_info>

-->


LIST QUEUES ON HEADNODE:

qconf -sql
    
    all.q
    syoung-BOWTIE-alignment


LIST DETAILS FOR syoung-BOWTIE-alignment QUEUE:

qconf -sq syoung-BOWTIE-alignment | grep -v NONE | grep -v INFINITY

    qname                 syoung-BOWTIE-alignment
    hostlist              @allhosts
    seq_no                0
    load_thresholds       np_load_avg=1.75
    nsuspend              1
    suspend_interval      00:05:00
    priority              0
    min_cpu_interval      00:05:00
    processors            UNDEFINED
    qtype                 BATCH INTERACTIVE
    pe_list               make
    rerun                 FALSE
    slots                 1
    tmpdir                /tmp
    shell                 /bin/csh
    shell_start_mode      posix_compliant
    notify                00:00:60
    initial_state         default



FIXED balancers/sge/__init__.py TO NOT FAIL ON EMPTY qstat OF QUEUE syoung-BOWTIE-alignment AND CONFIRMED THAT THE BALANCER IS RUNNING:


AND NOW GET THIS ERROR WHEN TRY TO SUBMIT JOB:


export SGE_QMASTER_PORT=36471; export SGE_EXECD_PORT=36472; export SGE_ROOT=/opt/sge6; exportSGE_CELL=syoung-microcluster; export USERNAME=syoung; export QUEUE=syoung-BOWTIE-alignment; export PROJECT=BOWTIE; export WORKFLOW=alignment; /opt/sge6/bin/lx24-amd64/qsub  -q syoung-BOWTIE-alignment -V /nethome/syoung/agua/BOWTIE/alignment//scripts/BOWTIE-6-alignment-4.sh

    Unable to run job: Job was rejected because job requests unknown queue "syoung-BOWTIE-alignment".
    Exiting.

... EVEN THOUGH QUEUE APPEARS IN LIST:

qconf -sql
    all.q
    syoung-BOWTIE-alignment

... BECAUSE NO USERS ADDED TO users_list:

qconf -sq syoung-BOWTIE-alignment

    qname                 syoung-BOWTIE-alignment
    hostlist              @allhosts
    seq_no                0
    load_thresholds       np_load_avg=1.75
    suspend_thresholds    NONE
    nsuspend              1
    suspend_interval      00:05:00
    priority              0
    min_cpu_interval      00:05:00
    processors            UNDEFINED
    qtype                 BATCH INTERACTIVE
    ckpt_list             NONE
    pe_list               make
    rerun                 FALSE
    slots                 1
    tmpdir                /tmp
    shell                 /bin/csh
    prolog                NONE
    epilog                NONE
    shell_start_mode      posix_compliant
    starter_method        NONE
    suspend_method        NONE
    resume_method         NONE
    terminate_method      NONE
    notify                00:00:60
    owner_list            NONE
    user_lists            NONE
    xuser_lists           NONE
    subordinate_list      NONE
    complex_values        NONE
    projects              NONE
    xprojects             NONE
    calendar              NONE
    initial_state         default
    s_rt                  INFINITY
    h_rt                  INFINITY
    s_cpu                 INFINITY
    h_cpu                 INFINITY
    s_fsize               INFINITY
    h_fsize               INFINITY
    s_data                INFINITY
    h_data                INFINITY
    s_stack               INFINITY
    h_stack               INFINITY
    s_core                INFINITY
    h_core                INFINITY
    s_rss                 INFINITY
    h_rss                 INFINITY
    s_vmem                INFINITY
    h_vmem                INFINITY


SO ADDED USERS TO user_list:

SHOW CURRENT USER LISTS:
qconf -suserl
    no user list defined


ADD THE sgeusers GROUP:
   [-am user_list]                          add user to manager list
   [-ao user_list]                          add user to operator list

qconf -am sgeusers
    root@domU-12-31-38-04-80-08.compute-1.internal added "sgeusers" to manager list

qconf -ao sgeusers
    root@domU-12-31-38-04-80-08.compute-1.internal added "sgeusers" to operator list


ADD sgeadmin TO sgeusers GROUP:
qconf -au sgeadmin sgeusers


ALTHOUGH sgeusers DOES NOT SHOW CURRENT USER LISTS:
qconf -suserl
    no user list defined



AND JOB IS STILL REJECTED:

export SGE_QMASTER_PORT=36471; export SGE_EXECD_PORT=36472; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-microcluster; export USERNAME=syoung; export QUEUE=syoung-BOWTIE-alignment; export PROJECT=BOWTIE; export WORKFLOW=alignment; /opt/sge6/bin/lx24-amd64/qsub  -q syoung-BOWTIE-alignment -V /nethome/syoung/agua/BOWTIE/alignment//scripts/BOWTIE-6-alignment-4.sh

    Unable to run job: Job was rejected because job requests unknown queue "syoung-BOWTIE-alignment".
    Exiting.


QUEUE all.q IS ALSO REJECTED:

export SGE_QMASTER_PORT=36471; export SGE_EXECD_PORT=36472; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-microcluster; export USERNAME=syoung; export QUEUE=syoung-BOWTIE-alignment; export PROJECT=BOWTIE; export WORKFLOW=alignment; /opt/sge6/bin/lx24-amd64/qsub  -q all.q -V /nethome/syoung/agua/BOWTIE/alignment//scripts/BOWTIE-6-alignment-4.sh

    Unable to run job: Job was rejected because job requests unknown queue "all.q".
    Exiting.


CHECKED GROUP @allhosts AND IT ONLY SHOWS 'master' HOST:

qconf -shgrpl
    @allhosts

qconf -shgrp @allhosts
    group_name @allhosts
    hostlist master


qsub 実行ファイル
というコマンドを入力すると，
Unable to run job: Job was rejected because job requests unknown queue "all.q"
と出てきた．all.qという名前が定義されてないらしい．
そこで，
sudo qmon
で出てくるGUIで，上段左から2番目のボタンを押して設定した．
設定内容はよく分からなかったが，all.qの名前と，利用できるCPUの数を登録したら使えるようになった．


CHECKED HOSTS (NOTE: NO QUEUE INFO):

qhost -q
    HOSTNAME                ARCH         NCPU  LOAD  MEMTOT  MEMUSE  SWAPTO  SWAPUS
    -------------------------------------------------------------------------------
    global                  -               -     -       -       -       -       -
    domU-12-31-38-04-80-08  lx24-amd64      1  1.31  615.2M  247.1M     0.0     0.0
    domU-12-31-38-04-D8-06  lx24-amd64      1  0.95  615.2M   82.6M     0.0     0.0


GOT CLUSTER QUEUE SUMMARY:

qstat -g c

    CLUSTER QUEUE                   CQLOAD   USED    RES  AVAIL  TOTAL aoACDS  cdsuE  
    --------------------------------------------------------------------------------
    all.q                             -NA-      0      0      0      0      0      0 
    syoung-BOWTIE-alignment           -NA-      0      0      0      0      0      0



SUBMITTING AS ROOT ALONE IS ALSO BLOCKED:

export SGE_QMASTER_PORT=36471; export SGE_EXECD_PORT=36472; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-microcluster; export USERNAME=syoung; export QUEUE=syoung-BOWTIE-alignment; export PROJECT=BOWTIE; export WORKFLOW=alignment; /opt/sge6/bin/lx24-amd64/qsub -V /nethome/syoung/agua/BOWTIE/alignment//scripts/BOWTIE-6-alignment-4.sh


Unable to run job: warning: root your job is not allowed to run in any queue
Your job 37 ("BOWTIE-6-alignment-4") has been submitted.
Exiting.


DIAGNOSIS:

AFTER CHANGING THE act_qmaster ENTRY TO MASTER'S LONG INTERNAL IP (INSTEAD OF 'master'), THE ENTRY FOR master IN THE @allhosts HOST LIST IS NOT RECOGNISED, AND SGE GIVES THE RATHER OBTUSE ERROR 'Unable to run job: Job was rejected because job requests unknown queue "syoung-BOWTIE-alignment"'


SOLUTION 1: EDITED QUEUE AND CHANGED @allhosts TO LIST OF HOSTS

qconf -mq syoung-BOWTIE-alignment

    qname                 syoung-BOWTIE-alignment
    #hostlist              @allhosts
    hostlist              domU-12-31-38-04-80-08.compute-1.internal \
                          domU-12-31-38-04-D8-06.compute-1.internal

AND NOW CAN SUBMIT JOBS TO QUEUE:

export SGE_QMASTER_PORT=36471; export SGE_EXECD_PORT=36472; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-microcluster; export USERNAME=syoung; export QUEUE=syoung-BOWTIE-alignment; export PROJECT=BOWTIE; export WORKFLOW=alignment; /opt/sge6/bin/lx24-amd64/qsub -q syoung-BOWTIE-alignment -V /tmp/BOWTIE-6-alignment-4.sh

    Your job 41 ("BOWTIE-6-alignment-4") has been submitted


    root@domU-12-31-38-04-80-08:~# qstat
    job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID 
    -----------------------------------------------------------------------------------------------------------------
         41 0.00000 BOWTIE-6-a root         qw    09/08/2011 17:32:45                                    1        
    root@domU-12-31-38-04-80-08:~# qstat -f
    queuename                      qtype resv/used/tot. load_avg arch          states
    ---------------------------------------------------------------------------------
    syoung-BOWTIE-alignment@domU-1 BIP   0/0/1          1.02     lx24-amd64    
    ---------------------------------------------------------------------------------
    syoung-BOWTIE-alignment@domU-1 BIP   0/0/1          1.31     lx24-amd64    
    
    ############################################################################
     - PENDING JOBS - PENDING JOBS - PENDING JOBS - PENDING JOBS - PENDING JOBS
    ############################################################################
         41 0.00000 BOWTIE-6-a root         qw    09/08/2011 17:32:45     1        
    root@domU-12-31-38-04-80-08:~# qstat -f
    queuename                      qtype resv/used/tot. load_avg arch          states
    ---------------------------------------------------------------------------------
    syoung-BOWTIE-alignment@domU-1 BIP   0/0/1          1.02     lx24-amd64    
    ---------------------------------------------------------------------------------
    syoung-BOWTIE-alignment@domU-1 BIP   0/0/1          1.31     lx24-amd64    
    
    ############################################################################
     - PENDING JOBS - PENDING JOBS - PENDING JOBS - PENDING JOBS - PENDING JOBS
    ############################################################################
         41 0.00000 BOWTIE-6-a root         qw    09/08/2011 17:32:45     1        
    root@domU-12-31-38-04-80-08:~# qstat -f
    queuename                      qtype resv/used/tot. load_avg arch          states
    ---------------------------------------------------------------------------------
    syoung-BOWTIE-alignment@domU-1 BIP   0/1/1          1.02     lx24-amd64    
         41 0.55500 BOWTIE-6-a root         r     09/08/2011 17:32:53     1        
    ---------------------------------------------------------------------------------
    syoung-BOWTIE-alignment@domU-1 BIP   0/0/1          1.31     lx24-amd64    
    root@domU-12-31-38-04-80-08:~# qstat -f
    queuename                      qtype resv/used/tot. load_avg arch          states
    ---------------------------------------------------------------------------------
    syoung-BOWTIE-alignment@domU-1 BIP   0/1/1          1.02     lx24-amd64    
         41 0.55500 BOWTIE-6-a root         r     09/08/2011 17:32:53     1        
    ---------------------------------------------------------------------------------
    syoung-BOWTIE-alignment@domU-1 BIP   0/0/1          1.31     lx24-amd64    
    root@domU-12-31-38-04-80-08:~# qstat -f
    queuename                      qtype resv/used/tot. load_avg arch          states
    ---------------------------------------------------------------------------------
    syoung-BOWTIE-alignment@domU-1 BIP   0/0/1          1.02     lx24-amd64    
    ---------------------------------------------------------------------------------
    syoung-BOWTIE-alignment@domU-1 BIP   0/0/1          1.31     lx24-amd64    



SOLUTION 2 (DIDN'T WORK): USE host_aliases FILE


CHANGE BACK QUEUE INFO:

qconf -mq syoung-BOWTIE-alignment

    qname                 syoung-BOWTIE-alignment
    #hostlist              domU-12-31-38-04-80-08.compute-1.internal \
    #                      domU-12-31-38-04-D8-06.compute-1.internal
    hostlist              @allhosts


CREATE host_aliases FILE:

em /opt/sge6/syoung-microcluster/common/host_aliases

    master      domU-12-31-38-04-D8-06
    headnode    domU-12-31-38-04-80-08


... BUT REJECTED JOB:

export SGE_QMASTER_PORT=36471; export SGE_EXECD_PORT=36472; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-microcluster; export USERNAME=syoung; export QUEUE=syoung-BOWTIE-alignment; export PROJECT=BOWTIE; export WORKFLOW=alignment; /opt/sge6/bin/lx24-amd64/qsub -q syoung-BOWTIE-alignment -V /tmp/BOWTIE-6-alignment-4.sh

    Unable to run job: Job was rejected because job requests unknown queue "syoung-BOWTIE-alignment".
    Exiting.



SOLUTION 3 (USED THIS): MODIFY THE @allhosts GROUP BY REPLACING master WITH MASTER INTERNAL IP

qconf -shgrp @allhosts > /tmp/syoung-BOWTIE-alignment-allhosts.q

    group_name @allhosts
    hostlist master

EDIT TO READ:
    
    group_name @allhosts
    hostlist domU-12-31-38-04-D8-06

qconf -Mhgrp /tmp/syoung-BOWTIE-alignment-allhosts.q

    root@domU-12-31-38-04-80-08.compute-1.internal modified "@allhosts" in host group list


... NOW CAN SUBMIT JOBS!!:

export SGE_QMASTER_PORT=36471; export SGE_EXECD_PORT=36472; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-microcluster; export USERNAME=syoung; export QUEUE=syoung-BOWTIE-alignment; export PROJECT=BOWTIE; export WORKFLOW=alignment; /opt/sge6/bin/lx24-amd64/qsub -q syoung-BOWTIE-alignment -V /tmp/BOWTIE-6-alignment-4.sh

    Your job 45 ("BOWTIE-6-alignment-4") has been submitted


    root@domU-12-31-38-04-80-08:~# qstat
    job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID 
    -----------------------------------------------------------------------------------------------------------------
         45 0.00000 BOWTIE-6-a root         qw    09/08/2011 18:19:16                                    1        
    root@domU-12-31-38-04-80-08:~# qstat -f
    queuename                      qtype resv/used/tot. load_avg arch          states
    ---------------------------------------------------------------------------------
    all.q@domU-12-31-38-04-D8-06.c BIP   0/0/1          1.31     lx24-amd64    
    ---------------------------------------------------------------------------------
    syoung-BOWTIE-alignment@domU-1 BIP   0/0/1          1.31     lx24-amd64    
    
    ############################################################################
     - PENDING JOBS - PENDING JOBS - PENDING JOBS - PENDING JOBS - PENDING JOBS
    ############################################################################
         45 0.00000 BOWTIE-6-a root         qw    09/08/2011 18:19:16     1        
    root@domU-12-31-38-04-80-08:~# qstat -f
    queuename                      qtype resv/used/tot. load_avg arch          states
    ---------------------------------------------------------------------------------
    all.q@domU-12-31-38-04-D8-06.c BIP   0/0/1          1.31     lx24-amd64    
    ---------------------------------------------------------------------------------
    syoung-BOWTIE-alignment@domU-1 BIP   0/0/1          1.31     lx24-amd64    
    
    ############################################################################
     - PENDING JOBS - PENDING JOBS - PENDING JOBS - PENDING JOBS - PENDING JOBS
    ############################################################################
         45 0.00000 BOWTIE-6-a root         qw    09/08/2011 18:19:16     1        
    root@domU-12-31-38-04-80-08:~# qstat -f
    queuename                      qtype resv/used/tot. load_avg arch          states
    ---------------------------------------------------------------------------------
    all.q@domU-12-31-38-04-D8-06.c BIP   0/0/1          1.31     lx24-amd64    
    ---------------------------------------------------------------------------------
    syoung-BOWTIE-alignment@domU-1 BIP   0/0/1          1.31     lx24-amd64    
    
    ############################################################################
     - PENDING JOBS - PENDING JOBS - PENDING JOBS - PENDING JOBS - PENDING JOBS
    ############################################################################
         45 0.00000 BOWTIE-6-a root         qw    09/08/2011 18:19:16     1        
    root@domU-12-31-38-04-80-08:~# qstat -f
    queuename                      qtype resv/used/tot. load_avg arch          states
    ---------------------------------------------------------------------------------
    all.q@domU-12-31-38-04-D8-06.c BIP   0/0/1          1.31     lx24-amd64    
    ---------------------------------------------------------------------------------
    syoung-BOWTIE-alignment@domU-1 BIP   0/1/1          1.31     lx24-amd64    
         45 0.55500 BOWTIE-6-a root         r     09/08/2011 18:19:23     1     


BACKCHECK: CHANGE @allhosts BACK TO USING 'master' INSTEAD OF THE MASTER LONG INTERNAL IP AND THE QUEUES SHOW 'N/A':

em /tmp/syoung-microcluster-allhosts.txt
    group_name @allhosts
    hostlist master

qconf -Mhgrp /tmp/syoung-microcluster-allhosts.txt
qconf -shgrp @allhosts
    group_name @allhosts
    hostlist master

qsub -r y -q syoung-BOWTIE-alignment test.sh

Your job 55 ("test") has been submitted
    root@domU-12-31-38-04-80-08:/nethome/syoung/agua/Project1/test# qstat -f
    queuename                      qtype resv/used/tot. load_avg arch          states
    ---------------------------------------------------------------------------------
    all.q@master                   BIP   0/0/1          -NA-     -NA-          au
    ---------------------------------------------------------------------------------
    syoung-BOWTIE-alignment@master BIP   0/0/1          -NA-     -NA-          au
    
    ############################################################################
     - PENDING JOBS - PENDING JOBS - PENDING JOBS - PENDING JOBS - PENDING JOBS
    ############################################################################
         53 0.00000 test       root         qw    09/09/2011 18:14:28     1        
         54 0.00000 test       root         qw    09/09/2011 18:14:29     1        
         55 0.00000 test       root         qw    09/09/2011 18:14:30     1   


RESTORE THE MASTER LONG INTERNAL IP TO @allhosts:

em /tmp/syoung-microcluster-allhosts.txt

    group_name @allhosts
    hostlist domU-12-31-38-04-D8-06.compute-1.internal

qconf -Mhgrp /tmp/syoung-microcluster-allhosts.txt
qconf -shgrp @allhosts
    group_name @allhosts
    hostlist domU-12-31-38-04-D8-06.compute-1.internal

qsub -r y -q syoung-BOWTIE-alignment test.sh
Your job 56 ("test") has been submitted
root@domU-12-31-38-04-80-08:/nethome/syoung/agua/Project1/test# qstat -f
    queuename                      qtype resv/used/tot. load_avg arch          states
    ---------------------------------------------------------------------------------
    all.q@domU-12-31-38-04-D8-06.c BIP   0/0/1          0.88     lx24-amd64    
    ---------------------------------------------------------------------------------
    syoung-BOWTIE-alignment@domU-1 BIP   0/1/1          0.88     lx24-amd64    
         53 0.55500 test       root         r     09/09/2011 18:20:23     1        
    
    ############################################################################
     - PENDING JOBS - PENDING JOBS - PENDING JOBS - PENDING JOBS - PENDING JOBS
    ############################################################################
         54 0.55500 test       root         qw    09/09/2011 18:14:29     1        
         55 0.55500 test       root         qw    09/09/2011 18:14:30     1        
         56 0.55500 test       root         qw    09/09/2011 18:20:36     1 


NOTES
-----

CONFIGURE HOST GROUPS:

http://wikis.sun.com/display/gridengine62u2/How+to+Configure+Host+Groups+From+the+Command+Line

Host groups enable you to use a single name to refer to multiple hosts. A host group can include other host groups as well as multiple individual hosts. Host groups that are members of another host group are subgroups of that host group.

For example, you might define a host group called @bigMachines that includes the following members:

@solaris64
@solaris32
fangorn
balrog
The initial @ sign indicates that the name is a host group. The host group @bigMachines includes all hosts that are members of the two subgroups @solaris64 and @solaris32. @bigMachines also includes two individual hosts, fangorn and balrog.

Commands
To configure host groups from the command line, use the following arguments for the qconf command:

To show a host group configuration, type the following command:
% qconf -shgrp HOSTGROUPNAME
The -shgrp option (show host group) shows the configuration of the specified host group.

To show the host group as a tree, type the following command:
% qconf -shgrp_tree HOSTGROUPNAME
The -shgrp_tree option (show host group as a tree) shows the configuration of the specified host group and its sub-hostgroups as a tree.

To show a host group with a resolved host list, type the following command:
% qconf -shgrp_resolved HOSTGROUPNAME
The -shgrp_resolved option (show host group with resolved host list) shows the configuration of the specified host group with a resolved host list.

To show the host group list, type the following command:
% qconf -shgrpl
The -shgrpl option (show host group list) displays a list of all host groups.

To add a host group to the list of host groups, type the following command:
% qconf -ahgrp HOSTGROUPNAME
The ahgrp option (add host group) adds a new host group to the list of host groups. See the hostgroup(5) man page for a detailed description of the configuration format.

To add a host group from a file, type the following command:
% qconf -Ahgrp FILENAME
The -Ahgrp option (add host group from a file) displays an editor that contains a host group configuration defined in filename. The editor is either the default vi editor or the editor that corresponds to the $EDITOR environment variable. To configure the host group, change and save the configuration file template.

To modify a host group, type the following command:
% qconf -mhgrp HOSTGROUPNAME
The -mhgrp option (modify host group) displays an editor that contains the configuration of the specified host group as template. You can modify the groupname, add a host to the hostlist, add a host group as a subgroup, and remove a host or host group. The editor is either the default vi editor or the editor that corresponds to the EDITOR environment variable. To modify the host group configuration, change and save the configuration file template.

To modify a host group from a file, type the following command:
% qconf -Mhgrp FILENAME
The -Mhgrp option (modify host group from a file) uses the content of filename as host group configuration template. The configuration in the specified file must refer to an existing host group. You can modify the groupname, add a host to the hostlist, add a host group as a subgroup, and remove a host or host group. The configuration of this host group is replaced by the file content.

To delete a host group, type the following command:
qconf -dhgrp HOSTGROUPNAME
The -dhgrp option (delete host group) deletes the specified host group from the list of host groups. All entries in the host group configuration are lost.


    
</entry>
<entry [Wed 2011:09:07 09:00:13 EST] USE qping TO QUERY STATUS OF SGE DAEMON>
    
http://gridscheduler.sourceforge.net/htmlman/htmlman1/qping.html?pathrev=V62u5_TAG

qping -info master 36471 qmaster 1df 



qping -info
GE 6.2u5
usage: qping [-help] [-noalias] [-ssl|-tcp] [ [ [-i < interval>] [-info] [-f] ] | [ [-dump_tag tag [param] ] [-dump] [-nonewline] ] ] < host> < port> < name> < id>
   -i         : set ping interval time
   -info      : show full status information and exit
   -f         : show full status information on each ping interval
   -noalias   : ignore $SGE_ROOT/SGE_CELL/common/host_aliases file
   -ssl       : use SSL framework
   -tcp       : use TCP framework
   -dump      : dump communication traffic (see "communication traffic output options" for additional information)
                   (provides the same output like -dump_tag MSG)
   -dump_tag  : dump communication traffic (see "communication traffic output options" for additional information)
                   tag=ALL < debug level> - show all
                   tag=APP < debug level> - show application messages
                   tag=MSG               - show commlib protocol messages
                   < debug level>         - ERROR, WARNING, INFO, DEBUG or DPRINTF
   -nonewline : dump output will not have a linebreak within a message
   -help      : show this info
   host       : host name of running component
   port       : port number of running component
   name       : name of running component (e.g.: "qmaster" or "execd")
   id         : id of running component (e.g.: 1 for daemons)

example:
   qping -info clustermaster 5000 qmaster 1

communication traffic output options:
   The environment variable SGE_QPING_OUTPUT_FORMAT can be used to hide columns and
   to set default column width. For hostname output the parameter hn is used.
   SGE_QPING_OUTPUT_FORMAT="h:1 h:4 w:1:20"
   will hide the columns 1 and 4 and set the width of column 1 to 20 characters.
       h:X   -> hide column X
       s:X   -> show column X
       w:X:Y -> set width of column X to Y
       hn:X  -> set hostname output parameter X. X values are "long" or "short"

   available columns are:

   nr active name      description
   == ====== ====      ===========
   01 yes    time      time of debug output creation
   02 yes    local     endpoint service name where debug client is connected
   03 yes    d.        message direction
   04 yes    remote    name of participating communication endpoint
   05 yes    format    message data format
   06 yes    ack type  message acknowledge type
   07 yes    msg tag   message tag information
   08 yes    msg id    message id
   09 yes    msg rid   message response id
   10 yes    msg len   message length
   11 yes    msg time  time when message was sent/received
   12  no    msg dump  message content dump (xml/bin/cull)
   13  no    info      additional information
   14 yes    msg ltime commlib linger time
   15 yes    con count nr. of connections
ERROR! no option argument
print Dumper ;



    
</entry>
<entry [Fri 2011:09:02 05:47:28 EST] FIXED act_qmaster ON HEADNODE AFTER RESTARTING QMASTER>

PROBLEM: VALUE IN act_qmaster IS SET TO HEADNODE LONG INTERNAL IP AFTER RESTARTING QMASTER    

SOLUTION: REPLACE WITH SHORT INTERNAL IP OF MASTER WHENEVER RESTART QMASTER

ADDED 

qmaster: ssh -o StrictHostKeyChecking=no -i /nethome/admin/.starcluster/id_rsa-admin-key root@domU-12-31-38-04-80-08.compute-1.internal
    
    
</entry>
<entry [Wed 2011:08:31 00:09:29 EST] TEST RESTARTING SGE IN Agua::Common::SGE::restartSge>

ADDED TO /var/www/.bash_profile LINE WITH fixip ALIAS:

    alias fixip='ec2-associate-address -i i-3ba8c35a  107.20.183.34'
    export AQUARIUS2=/home/syoung/22-agua/cloud/AWS/keypair/syoung/aquarius2/id_rsa
    export head='i-3ba8c35a'
    export HEADNODE_IP='ec2-107-20-183-34.compute-1.amazonaws.com'
    
    #### SSH HEADNODE                                                                        
    alias headnode='ssh -i $AQUARIUS2 root@$HEADNODE_IP'
    alias showhead=' echo "$HEADNODE_IP"'
    


RAN restartSge WHICH DETECTED THAT SGE WAS NOT RUNNING AND STARTED IT UP:

work '{"username":"syoung","sessionId":"9999999999.9999.999","project":"BOWTIE","workflow":"alignment","mode":"getStatus"}'
    
    Agua::Common::SGE::restartSge    ke: export SGE_QMASTER_PORT=36361; export SGE_EXECD_PORT=36362; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-microcluster; export USERNAME=syoung; export QUEUE=syoung-BOWTIE-alignment; export PROJECT=BOWTIE; export WORKFLOW=alignment; /opt/sge6/bin/lx24-amd64/qconf -ke all
    sent shutdown notification to  execd host domU-12-31-38-04-94-73.compute-1.internal
    no execd known on host ip-10-122-85-238.ec2.internal
    no execd known on host node001
    no execd known on host ip-10-86-255-99.ec2.internal
    ...


CONFIRMED THAT SGE IS RUNNING:

ps aux | grep sge

    sgeadmin  2608  0.0  0.7 132808  4528 ?        Sl   03:40   0:00 /opt/sge6/bin/lx24-amd64/sge_qmaster
    sgeadmin  2612  0.0  0.3  61892  2304 ?        Sl   03:40   0:00 /opt/sge6/bin/lx24-amd64/sge_execd


CONFIRMED THAT SGE IS LISTENING AT THE CORRECT PORTS:

netstat -ntulp | grep sge

    tcp        0      0 0.0.0.0:36361           0.0.0.0:*               LISTEN      2608/sge_qmaster
    tcp        0      0 0.0.0.0:36362           0.0.0.0:*               LISTEN      2612/sge_execd  


SGE STARTUP LOG APPEARS OKAY IN /tmp/sge_messages:

ll /tmp/sge_messages 
    -rw-rw-rw- 1 root root 888 2011-08-31 03:40 /tmp/sge_messages
date
    Wed Aug 31 04:11:16 UTC 2011

cat /tmp/sge_messages

    08/31/2011 02:37:14|  main|domU-12-31-38-04-94-73|E|communication error for "domU-12-31-38-04-94-73.compute-1.internal/qmaster/1" running on port 36361: "can't bind socket"
    08/31/2011 02:37:15|  main|domU-12-31-38-04-94-73|E|commlib error: can't bind socket (no additional information available)
    08/31/2011 03:28:32|  main|domU-12-31-38-04-94-73|E|communication error for "domU-12-31-38-04-94-73.compute-1.internal/qmaster/1" running on port 36361: "can't bind socket"
    08/31/2011 03:28:33|  main|domU-12-31-38-04-94-73|E|commlib error: can't bind socket (no additional information available)
    08/31/2011 03:40:11|  main|domU-12-31-38-04-94-73|E|communication error for "domU-12-31-38-04-94-73.compute-1.internal/qmaster/1" running on port 36361: "can't bind socket"
    08/31/2011 03:40:12|  main|domU-12-31-38-04-94-73|E|commlib error: can't bind socket (no additional information available)
    
</entry>
<entry [Tue 2011:08:30 04:34:50 EST] FIXED SGE-WON'T-START AND GIVES NO ERROR MESSAGES>

SUMMARY: HOSTNAME AND PERMISSIONS

PROBLEM: SGE WON'T START AND GIVES NO OUTPUT

/opt/sge6-fresh/bin/lx24-amd64/sge_qmaster
    **NO OUTPUT AND SGE NOT STARTED**

/opt/sge6-fresh/bin/lx24-amd64# ./sge_qmaster -show-license
    error: sge_gethostbyname failed



SHORT DIAGNOSIS: HOSTNAME AND PERMISSIONS PROBLEM (SEE FULL DIAGNOSIS BELOW)


SOLUTION:

1. ADDED STARTUP SCRIPT TO SET CORRECT HOSTNAME

2. MAKE SURE OWNERSHIP PERMISSIONS ARE CORRECT
chown sgeadmin:sgeadmin /opt/sge6
chown sgeadmin:sgeadmin /opt/sge6/CELLDIRNAME


3. CHANGED HOST NAME TO INTERNAL IP AND ADDED TO /etc/hosts

hostname
    domU-12-31-38-07-1A-E1

hostname ip-10-86-255-99.ec2.internal
    OK
    
/opt/sge6/bin/lx24-amd64/sge_qmaster
/opt/sge6/bin/lx24-amd64/sge_execd


SO AFTER START/STOP THE HOSTNAME IS AUTOMATICALLY CORRECT:

/opt/sge6-starcluster/utilbin/lx24-amd64/gethostname  -aname
    Hostname: domU-12-31-38-04-94-73.compute-1.internal
    Aliases:  
    Host Address(es): 10.220.151.129 



FULL DIAGNOSIS:
    
NOTHING IN ERROR LOGS:
root@10:/opt/sge6/utilbin/linux-x64# ./gethostbyname -all 10.220.113.204
Hostname: 10.220.113.204
SGE name: 10.220.113.204
Aliases:  
Host Address(es): 10.220.113.204 

/opt/sge6/*/spool/qmaster/messages
/tmp




SEE sge.quickref
[Thu 2011:05:05 10:55:28 EST]
ERROR MESSAGES


STARTUP MESSAGES
tail /opt/sge6/syoung-microcluster/spool/qmaster/messages
    
    05/02/2011 07:05:29|worker|master|E|submithost "node001" already exists
    05/02/2011 07:05:29|worker|master|E|adminhost "node001" already exists


RUNTIME MESSAGES
# MISSING tail /tmp/sge_qmaster_messages
# MISSING tail /tmp/sge_execd_messages



NB: AT LOGIN, ENV CONTAINS syoung-smallcluster INFO:
env | grep SGE
    SGE_CELL=syoung-smallcluster
    SGE_EXECD_PORT=63232
    SGE_QMASTER_PORT=63231
    SGE_ROOT=/opt/sge6
    SGE_CLUSTER_NAME=starcluster


#source /opt/sge6/syoung-microcluster/common/settings.sh

cat /opt/sge6/syoung-microcluster/common/settings.sh
    SGE_ROOT=/opt/sge6; export SGE_ROOT
    ARCH=`$SGE_ROOT/util/arch`
    DEFAULTMANPATH=`$SGE_ROOT/util/arch -m`
    MANTYPE=`$SGE_ROOT/util/arch -mt`
    SGE_CELL=default; export SGE_CELL
    SGE_CLUSTER_NAME=starcluster; export SGE_CLUSTER_NAME
    SGE_QMASTER_PORT=63231; export SGE_QMASTER_PORT
    SGE_EXECD_PORT=63232; export SGE_EXECD_PORT



CURRENT IP ADDRESSES OF HEADNODE:

EXTERNAL
ec2-107-20-70-58.compute-1.amazonaws.com
107.20.70.58

INTERNAL
ip-10-86-255-99.ec2.internal
10.86.255.99



RUNNING gethostname SHOWS PROBLEM WITH HOST NAME:

/opt/sge6-starcluster/utilbin/lx24-amd64/gethostname  -aname
error resolving local host: can't resolve host name (h_errno = HOST_NOT_FOUND)


VERIFIED HOSTNAME OUTPUT WORKS OKAY:

/opt/sge6/utilbin/lx24-amd64/gethostbyname -name 10.86.255.99

    ip-10-86-255-99.ec2.internal


/opt/sge6/utilbin/lx24-amd64/gethostbyname -name 107.20.70.58

    ec2-107-20-70-58.compute-1.amazonaws.com
    


LOOKED UP HOSTNAME:

hostname 
    domU-12-31-38-07-1A-E1


CHANGE HOSTNAME TO INTERNAL IP:

hostname  ip-10-86-255-99



TRY RUNNING gethostbyname WITH HOSTNAME:

/opt/sge6-starcluster/utilbin/lx24-amd64/gethostbyname  domU-12-31-38-07-1A-E1
    error resolving host "domU-12-31-38-07-1A-E1": can't resolve host name (h_errno = HOST_NOT_FOUND)

    
USE lsof TO CHECK IF SGE MASTER IS LISTENING:

lsof –i:6444





1. SET HOSTNAME

hostname **INTERNAL_IP**

2. CHANGED OWNERSHIP TO sgeadmin HEADNODE (AFTER COMPARED TO MASTER COPY)

chown sgeadmin:sgeadmin /opt/sge6
chown sgeadmin:sgeadmin /opt/sge6/default

THEN RAN SGE:

/opt/sge6/bin/lx24-amd64/sge_qmaster
/opt/sge6/bin/lx24-amd64/sge_execd

    OK!!

STARTED WITH THESE ENVIRONMENT VARIABLES:

SGE_CELL=syoung-smallcluster
SGE_EXECD_PORT=63232
SGE_QMASTER_PORT=63231
SGE_ROOT=/opt/sge6
SGE_CLUSTER_NAME=starcluster



CHECKED THAT SGE IS LISTENING ON THE CORRECT PORTS:

netstat -ntulp | grep sge
tcp        0      0 0.0.0.0:63231           0.0.0.0:*               LISTEN      3779/sge_qmaster
tcp        0      0 0.0.0.0:63232           0.0.0.0:*               LISTEN      3802/sge_execd 

    OK!!!


CHANGED TO syoung-microcluster ENVIRONMENT VARIABLES:

cat /nethome/admin/.starcluster/syoung-microcluster.config

    [plugin sge]
    cell=syoung-microcluster
    execdport=36362
    head_ip=10.86.157.176
    head_long_ip=ip-10-86-157-176.ec2.internal
    qmasterport=36361
    root=/opt/sge6
    setup_class=sge.CreateCell
    slots=1

SET ENVARS:

export SGE_QMASTER_PORT=36361
export SGE_EXECD_PORT=36362
export SGE_ROOT=/opt/sge6
export SGE_CELL=syoung-microcluster
export SGE_CLUSTER_NAME=syoung-microcluster


THEN RAN SGE:

/opt/sge6/bin/lx24-amd64/sge_qmaster
/opt/sge6/bin/lx24-amd64/sge_execd

    error: can't find connection
    error: can't get configuration from qmaster -- backgrounding

CHECKED THAT CORRECT PORTS ARE BEING LISTENED TO:

netstat -ntulp | grep sge

    tcp        0      0 0.0.0.0:63231           0.0.0.0:*               LISTEN      3779/sge_qmaster
    tcp        0      0 0.0.0.0:63232           0.0.0.0:*               LISTEN      3802/sge_execd  
    tcp        0      0 0.0.0.0:36361           0.0.0.0:*               LISTEN      3940/sge_qmaster
    tcp        0      0 0.0.0.0:36362           0.0.0.0:*               LISTEN      3944/sge_execd  



KILLED ORIGINAL syoung-smallcluster QMASTER/EXECD AND RESTARTED syoung-microcluster:

qhost
HOSTNAME                ARCH         NCPU  LOAD  MEMTOT  MEMUSE  SWAPTO  SWAPUS
-------------------------------------------------------------------------------
global                  -               -     -       -       -       -       -
ip-10-122-85-238        lx24-amd64      1     -  615.2M       -     0.0       -
ip-10-86-255-99         lx24-amd64      2  1.17    7.5G  509.9M     0.0     0.0
node001                 lx24-amd64      1     -  615.2M       -     0.0       -


    

RESTARTED syoung-smallcluster QMASTER/EXECD:

export SGE_CELL=syoung-smallcluster
export SGE_EXECD_PORT=63232
export SGE_QMASTER_PORT=63231
export SGE_ROOT=/opt/sge6
export SGE_CLUSTER_NAME=starcluster


qhost
    error: commlib error: got select error (Connection refused)
    error: unable to send message to qmaster using port 63231 on host "ip-10-86-255-99.ec2.internal": got send error


/opt/sge6/bin/lx24-amd64/sge_qmaster
/opt/sge6/bin/lx24-amd64/sge_execd


qhost
    HOSTNAME                ARCH         NCPU  LOAD  MEMTOT  MEMUSE  SWAPTO  SWAPUS
    -------------------------------------------------------------------------------
    global                  -               -     -       -       -       -       -
    ip-10-122-85-238        lx24-amd64      1     -  615.2M       -     0.0       -
    ip-10-86-255-99         lx24-amd64      2  0.95    7.5G  534.3M     0.0     0.0
    node001                 lx24-amd64      1     -  615.2M       -     0.0       -


NOTES
-----


NB: FOR FUTURE REFERENCE, COPIED

/opt/sge6

OVER FROM MASTER TO HEADNODE

/opt/sge6-master


scp -r -i /nethome/admin/.starcluster/id_rsa-admin-key ip-10-122-85-238.ec2.internal:/opt/sge6 /tmp




Running Grid Engine System Programs in Debug Mode
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
Error messagesdefault/spool/qmaster


Names of the program modules that are called internally
Line number information, which is helpful for error reporting, depending on the debug level you specify.


Note

To watch a debug trace, you should use a window with a large scroll-line buffer. For example, you might use a scroll-line buffer of 1000 lines.
If your window is an xterm, you might want to use the xterm logging mechanism to examine the trace output later on.
If you run one of the Grid Engine system daemons in debug mode, the daemons keep their terminal connection to write the trace output. You can abort the terminal connections by typing the interrupt character of the terminal emulation you use. For example, you might use Control-C.


</entry>
<entry [Tue 2011:08:30 02:11:14 EST] RUN SGE IN DEBUG TRACE MODE>

ENABLE DEBUGGING:

source /opt/sge6/util/dl.sh
dl 2

START SGE:

/opt/sge6/bin/lx24-amd64/sge_qmaster

 0   1558 139669726615296 --> qmaster() {
     1   1558 139669726615296 --> sge_get_root_dir() {
     2   1558 139669726615296 < -- sge_get_root_dir() ../libs/uti/sge_arch.c 136 }
     3   1558 139669726615296 --> sge_init_language_func() {
     4   1558 139669726615296 < -- sge_init_language_func() ../libs/uti/sge_language.c 455 }
     5   1558 139669726615296 --> sge_init_language() {
     6   1558 139669726615296     ****** starting localization procedure ... **********
    ...
    42   1558 139669726615296     error: sge_gethostbyname failed
    ...

</entry>
<entry [Fri 2011:06:24 06:17:35 EST] FIXED 'Illegal variable name' ERROR>

USE '-S /bin/bash' IN qsub COMMAND

qsub \
-S /bin/bash \
/nethome/syoung/agua/Project1/Workflow1//scripts/Project1-1-Workflow1-1.sh

OR:

export SGE_QMASTER_PORT=36251; export SGE_EXECD_PORT=36252; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-smallcluster; export USERNAME=syoung; export QUEUE=syoung-Project1-Workflow1; export PROJECT=Project1; export WORKFLOW=Workflow1; /opt/sge6/bin/lx24-amd64/qsub  -q syoung-Project1-Workflow1 /nethome/syoung/agua/Project1/Workflow1//scripts/Project1-1-Workflow1-1.sh


NOW GET THIS ERROR:

Use of uninitialized value $username in concatenation (.) or string at /agua/0.6-48-35e0670/bin/apps/expression/../../../lib/Agua/Common/SGE.pm line 71.
Use of uninitialized value $cluster in concatenation (.) or string at /agua/0.6-48-35e0670/bin/apps/expression/../../../lib/Agua/Common/SGE.pm line 71.
Can't call method "query" on an undefined value at /agua/0.6-48-35e0670/bin/apps/expression/../../../lib/Agua/Common/SGE.pm line 76.


ADDED ENV VARS OUTPUT IN SHELL SCRIPT:

echo SGE_ROOT:          $SGE_ROOT
echo SGE_CELL:          $SGE_CELL
echo SGE_QMASTER_PORT:  $SGE_QMASTER_PORT
echo SGE_EXECD_PORT:    $SGE_EXECD_PORT

echo USERNAME: 	       	$USERNAME
echo PROJECT:  	       	$PROJECT
echo WORKFLOW: 	       	$WORKFLOW
echo CLUSTER:  	       	$CLUSTER
echo QUEUE:    	       	$QUEUE






NOTES
-----

http://comments.gmane.org/gmane.comp.clustering.gridengine.users/19608
Grid errors submitting with a script

I've been trying to figure out what Grid has been complaining about all day.

I've created a script which will be used to submit Grid jobs. This script runs without any issues when run
without Grid. It uses NC Verilog as the job software.

Once I tell it to go through Grid I get these errors:
cat gridscript.sh.e183
Illegal variable name.
cat gridscript.sh.o183
Warning: no access to tty (Bad file descriptor).
Thus no job control in this shell.

Is there any way to find out what variable it is talking about? The only variable in my script is "user=$(whoami)"

------------------------------------------------------
http://gridengine.sunsource.net/ds/viewMessage.do?dsForumId=38&dsMessageId=251737

To unsubscribe from this discussion, e-mail: [users-unsubscribe < at> gridengine.sunsource.net].

Permalink | Reply | 
headers craffi | 29 Mar 20:30
  
Re: Grid errors submitting with a script

Sounds like your script is being run under a different shell environment 
than you are expecting. This is possible depending on SGE's settings as 
there are some modes that ignore the first line of the jobscript in 
order to implement the POSIX batch scheduling standard.

Try passing the "-S /bin/sh" or whatever argument to your qsub command 
to explicitly choose the interpreter.

-Chris
    
</entry>
<entry [Thu 2011:06:16 23:10:38 EST] TRIED TO FIX commlib ERROR - BUILT SGE ON HEAD NODE>


SUMMARY: RESTARTED SGE ON MASTER WITH CORRECT PORT SETTINGS TO FIX commlib ERROR. SINCE DIDN'T NEED TO DO BUILD, DISCARDED BUILT EXECUTABLES.



PROBLEM:

CONNECT TO MASTER FROM HEAD:

ssh -i /nethome/admin/.starcluster/id_rsa-admin-key root@ec2-72-44-55-178.compute-1.amazonaws.com


INSTALLED SGE ON MASTER (NOTE: NO EXECD BECAUSE IS MASTER NODE)

sudo aptitude install gridengine-client gridengine-common gridengine-master gridengine-qmon


LATER: REMOVE BUILT SGE
sudo aptitude remove gridengine-client gridengine-common gridengine-master gridengine-qmon

LINKED BIN TO /usr/bin



THEN GET THIS ERROR ON HEAD:

status
{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","mode":"getStatus"}

    Content-type: text/html

    error: commlib error: got select error (Connection refused)
    error: unable to send message to qmaster using port 36251 on host "ip-10-122-13-145.ec2.internal": got send error
    

ON MASTER

ssh -i /nethome/admin/.starcluster/id_rsa-admin-key root@ec2-72-44-55-178.compute-1.amazonaws.com

netstat -ntulp

    tcp        0      0 0.0.0.0:36251           0.0.0.0:*               LISTEN      7603/sge_qmaster
    tcp        0      0 0.0.0.0:36252           0.0.0.0:*               LISTEN      7609/sge_execd 



CHANGED 10.126.35.154 TO ec2-72-44-55-178.compute-1.amazonaws.com IN:

/opt/sge6/syoung-smallcluster/common/act_qmaster


THEN GOT 'can't resolve host name' ERROR USING NEWLY INSTALLED qstat:

/usr/lib/gridengine//qstat

error: unable to send message to qmaster using port 63231 on host "root@ec2-72-44-55-178.compute-1.amazonaws.com": can't resolve host name


SO CHANGED BACK TO 10.126.35.154 IN act_qmaster. NOW qstat HANGS ON HEAD:

/usr/lib/gridengine/qstat

    error: commlib error: got select error (Connection timed out)



SO RESTARTED SGE QMASTER AND EXECD AFTER SOURCING setting.sh IN syoung-smallcluster CELL:

qconf -km
qconf -ke all 

source /opt/sge6/syoung-smallcluster/common/settings.sh
/opt/sge6/bin/lx24-amd64/sge_qmaster
/opt/sge6/bin/lx24-amd64/sge_execd





export SGE_QMASTER_PORT=63231; export SGE_EXECD_PORT=63232; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-smallcluster; export USERNAME=syoung; export QUEUE=syoung-Project1-Workflow1; export PROJECT=Project1; export WORKFLOW=Workflow1; /opt/sge6/bin/lx24-amd64/qstat







DIAGNOSIS:

WRONG PORTS. PORTS STORED IN agua DATABASE ARE NOT OPEN:

export SGE_QMASTER_PORT=36251; export SGE_EXECD_PORT=36252; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-smallcluster; export USERNAME=syoung; export QUEUE=syoung-Project1-Workflow1; export PROJECT=Project1; export WORKFLOW=Workflow1; /opt/sge6/bin/lx24-amd64/qstat

    error: commlib error: got select error (Connection refused)
    error: unable to send message to qmaster using port 36251 on host "ip-10-122-
    13-145.ec2.internal": got send error


THE PORTS THAT ARE CURRENTLY OPEN ARE 63231 AND 63232:

export SGE_QMASTER_PORT=63231; export SGE_EXECD_PORT=63232; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-smallcluster; export USERNAME=syoung; export QUEUE=syoung-Project1-Workflow1; export PROJECT=Project1; export WORKFLOW=Workflow1; /opt/sge6/bin/lx24-amd64/qstat

    job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID 
    -----------------------------------------------------------------------------------------------------------------
          1 0.75000 test       root         qw    06/17/2011 13:46:42                                    1        
          2 0.61842 test       root         qw    06/17/2011 13:46:47                                    1        
          3 0.25000 test       root         qw    06/17/2011 13:47:01                                    1        

MASTER IS LISTENING ON THE OPEN PORTS:

ON MASTER
netstat -ntulp | grep sge

    tcp        0      0 0.0.0.0:63231           0.0.0.0:*               LISTEN      25952/sge_qmaster



RESTARTED SGE ON MASTER TO LISTEN AT PORTS 36251 AND 26252:

JUST IN CASE, OPENED PORT 36251 ON HEAD:

ec2-authorize default -p 36251 -P tcp
ec2-authorize default -p 36251 -P udp
ec2-authorize default -p 36252 -P tcp
ec2-authorize default -p 36252 -P udp





SOLUTION:

RESTART SGE ON MASTER WHEN GET commlib ERROR


FOLLOWUP:

SWITCHED BACK QSTAT LINKED TO /usr/bin/qstat:

/opt/sge6/bin/lx26-amd64/bin --> /usr/bin

TO ORIGINAL qstat:

/opt/sge6/bin/lx26-amd64/bin --> /usr/bin


N0W CAN GET QUEUE STATUS USING qstat:

status
    {"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","mode":"getStatus"}
    Content-type: text/html
    
    Agua::Workflow::getStatus    Workflow::getStatus()
    Agua::Workflow::getStatus    project: Project1
    Agua::Workflow::getStatus    workflow: Workflow1
    Agua::Workflow::getStatus    SELECT *, NOW() AS now
    FROM stage
    WHERE username ='syoung'
    AND project = 'Project1'
    AND workflow = 'Workflow1'
    ORDER BY number
    
    Agua::Workflow::getStatus    stage 1: TOPHAT
    Agua::Workflow::getStatus    stage 2: jbrowseFeatures
    Agua::Workflow::getStatus    cluster: syoung-smallcluster
    Use of uninitialized value $clusteroutput in concatenation (.) or string at /agua/0.6-48-35e0670/cgi-bin/lib/Agua/Workflow.pm line 400.
    Agua::Workflow::getStatus    clusteroutput: 
    Agua::Common::SGE::queueStatus    Agua::Common::SGE::queueStatus()
    Agua::Common::SGE::queueStatus    username: syoung
    Agua::Common::SGE::queueStatus    cluster: syoung-smallcluster
    Agua::Common::SGE::queueStatus    qstat: export SGE_QMASTER_PORT=36251; export SGE_EXECD_PORT=36252; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-smallcluster; export USERNAME=syoung; export QUEUE=syoung-Project1-Workflow1; export PROJECT=Project1; export WORKFLOW=Workflow1; /opt/sge6/bin/lx24-amd64
    Agua::Common::SGE::queueStatus    bindir: /opt/sge6/bin/lx24-amd64
    {"cluster":null,"queue":"=================================================================================\nqueuename                      qtype resv/used/tot. load_avg arch          states\n---------------------------------------------------------------------------------\nProject1-Workflow1@master      BIP   0/0/1          1.22     lx24-amd64    \n---------------------------------------------------------------------------------\nProject1-Workflow1@node001     BIP   0/0/1          -NA-     lx24-amd64    au\n---------------------------------------------------------------------------------\nProject1-Workflow1@node002     BIP   0/0/1          -NA-     lx24-amd64    au\n---------------------------------------------------------------------------------\nProject1-Workflow2@master      BIP   0/0/1          1.22     lx24-amd64    \n---------------------------------------------------------------------------------\nProject1-Workflow2@node001     BIP   0/0/1          -NA-     lx24-amd64    au\n---------------------------------------------------------------------------------\nProject1-Workflow2@node002     BIP   0/0/1          -NA-     lx24-amd64    au\nProject1-1: 1\n","stages":[{"stagedescription":null,"stagepid":"715","number":"1","status":"error","project":"Project1","submit":"1","workflowpid":"13399","stagenotes":null,"stagename":null,"stagejobid":"0","completed":"0000-00-00 00:00:00","owner":"admin","workflownumber":"1","cluster":"","stderrfile":null,"location":"apps/expression/TOPHAT.pl","executor":"/usr/bin/perl","name":"TOPHAT","username":"syoung","stdoutfile":null,"workflow":"Workflow1","now":"2011-06-17 16:00:40","type":"aligner","started":"0000-00-00 00:00:00","queued":"2011-06-16 09:17:59"},{"stagedescription":null,"stagepid":"715","number":"2","status":"queued","project":"Project1","submit":"0","workflowpid":"13399","stagenotes":null,"stagename":null,"stagejobid":"0","completed":"0000-00-00 00:00:00","owner":"admin","workflownumber":"1","cluster":"","stderrfile":null,"location":"apps/jbrowse/jbrowseFeatures.pl","executor":"/usr/bin/perl","name":"jbrowseFeatures","username":"syoung","stdoutfile":null,"workflow":"Workflow1","now":"2011-06-17 16:00:40","type":"view","started":"0000-00-00 00:00:00","queued":"2011-06-16 09:17:59"}]}




NOTES
-----

http://pka.engr.ccny.cuny.edu/~jmao/node/49


Install Sun Grid Engine (as Ubuntu package)
Submitted by Junjun Mao on Mon, 02/22/2010 - 10:00
Sun Grid Engine (SGE) is used as the job scheduler for this experimental cluster.

CPU slots on nodes < - > SGE queues < - > Users

Put it into a simple word, SGE queue(s) bridge CPU slots and users. That is users send jobs to SGE queues, then SGE queues find CPUs to run the jobs. There might be multiple queues on the system (just like multiple bank tellers in a branch to serve customers) and queues may have different priority (well, the teller that serves VIP only). Users may be assigned priority too. This section describes a simple SGE installation, in which there is only one queue that serves both serial and parallel jobs.

This procedure has been verified on Ubuntu 9.10 server.
 

Install SGE on master node:
Run this command on master node:

sudo aptitude install gridengine-client gridengine-common gridengine-master gridengine-qmon

The gridengine-exec is left out on purpose because the master node is not supposed to run jobs.
 

Install SGE on slave nodes:
Run this command on all slave nodes:

sudo aptitude install gridengine-exec gridengine-client

 

Start SGE with qmon
To use "qmon" Graphic User Interface, ssh to the master node with X forwarding on:

ssh -X loginname@masternode
Invoke qmon as superuser:

sudo qmon

 

Configure Host
Tab "Host Configuration" -> Tab "Administration Host" -> Add master node
Tab "Host Configuration" -> Tab "Submit Host" -> Add master node
Tab "Host Configuration" -> Tab "Execution Host" -> Add slave nodes such as node01, node02 ...
Click on "Done" to finish
 
Configure User
Add or delete users that are allowed to access SGE here. In this example, a user is added to an existing group and later this group will be allowed to submit jobs. Everything else is left as default values.

Users have to be added in order to submit jobs with SGE.

Tab "User Configuration" -> Tab "Userset" -> Highlight userset "arusers" and click on "Modify" -> Input user name in "User/Group" field -> Click "Ok" to finish

 
Configure Queue
While Host Configuration deals what computing resources are available and User Configuration defines who have access to the resources, this Queue Control defines ways to connect hosts and users.

Tab "Queue Control" -> Tab "Hosts" -> Confirm the execution hosts show up there. 

Tab "Queue Control" -> Tab "Cluster Queues" -> Click on "Add" -> Name the queue, add execution nodes to Hostlist and
   Tab "Use access" -> allow access to user group arusers;
   Tab "General Configuration" -> Field "Slots" -> Raise the number to total CPU cores on slave nodes (ok to use a bigger number than actual CPU cores).

Tab "Queue Control" -> Tab "Queue Instances" -> This is the place to manually assign hosts to queues, and control the the state (active, suspend ...) of hosts.
 
    
</entry>
<entry [Mon 2011:04:18 14:59:30 EST] HOW TO BACKUP A CLUSTER>

http://wikis.sun.com/display/GridEngine/Printable+Installing+Sun+Grid+Engine+Guide#PrintableInstallingSunGridEngineGuide-Cells

1. source SGE_ROOT/SGE_CELL/common/settings.sh FILE

2. RUN BACKUP SCRIPT from Sun Grid Engine 6.2 common PACKAGE

util/upgrade_modules/save_sge_config.sh /LOCATION/OF/BACKUP

3. INSTALL THE NEW VERSION (SEE URL ABOVE)

    
</entry>

