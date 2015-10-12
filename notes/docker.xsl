docker



<entry [Thu 2014:04:24 16:02:19 EST] DOCKER ERROR MESSAGES: 127>


Value 127 is returned by /bin/sh when the given command is not found within your PATH system variable and it is not a built-in shell command. In other words, the system doesn't understand your command, because it doesn't know where to find the binary you're trying to call.

	
</entry>
<entry [Thu 2014:04:24 14:38:54 EST] DELETE CONTAINERS BEFORE A PARTICULAR CONTAINER>

docker rm $(docker ps --before 9c49c11c8d21 -q)
	
</entry>
<entry [Thu 2014:04:24 13:12:11 EST] DEVELOPING WITH VAGRANT AND DOCKER>

http://tonyhb.com/unsuck-your-vagrant-developing-in-one-vm-with-vagrant-and-docker

	
</entry>
<entry [Thu 2014:04:24 09:20:03 EST] AUTOMATICALLY START CONTAINERS ON BOOT>

http://docs.docker.io/use/host_integration/

	
</entry>
<entry [Thu 2014:04:24 08:12:06 EST] CLEAR ALL IMAGES COMMAND>

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

for i in `sudo docker images | awk '{print $3}'`;do sudo docker rmi $i;done


OR

docker rm `docker ps --no-trunc -a -q`

	
</entry>
<entry [Thu 2014:04:24 05:18:42 EST] OPEN MULTIPLE WINDOWS ON THE SAME RUNNING CONTAINER>

1. GET THE FULL ID OF THE CONTAINER

docker ps -notrunc

	CONTAINER ID                                                       IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
	0fc44aefd07659e85dd8addac30b81e3fff97671ce7717bac71ce873643eef7e   ubuntu:14.04        /bin/bash           13 minutes ago      Up 13 minutes                           goofy_wright  

2. INSTALL lxc

apt-get install lxc


3. ATTACH THE CONTAINER

sudo lxc-attach -n <ID>

E.G.:

sudo lxc-attach -n 0fc44aefd07659e85dd8addac30b81e3fff97671ce7717bac71ce873643eef7e
	
</entry>
<entry [Thu 2014:04:24 05:06:25 EST] DOWNLOAD PUBLIC IMAGES WITH pull>

# DOWNLOAD ALL UBUNTU IMAGES
(try this if you get a 404 error for an individual Ubuntu image)
docker pull ubuntu

# Ubuntu 12.10 Quantal base image
docker pull ubuntu:12.10

# Ubuntu 12.04 LTS Precise base image
docker pull ubuntu:12.04

# Centos 6.4 base image
docker pull centos

	
</entry>
<entry [Thu 2014:04:24 03:11:52 EST] BUILD A DOCKER IMAGE USING packer.io>

http://www.packer.io/docs/builders/docker.html

	
</entry>
<entry [Thu 2014:04:24 03:10:07 EST] BUILD FROM YOUR OWN IMAGE IN DOCKER REPO>

Build a dockerfile like this:

FROM apache-copy

CMD  /usr/sbin/apache2 -D  # or whatever command you need

then run `docker build -t apache-copy`

then run `docker run -d -p 80:80 apache-copy`
	
</entry>
<entry [Thu 2014:04:24 02:52:08 EST] USE EXPOSE TO COMMUNICATE BETWEEN TWO DIFFERENT CONTAINERS>
	
INTERESTING
https://groups.google.com/forum/#!topic/docker-user/yv2RAnaXvpk

DOCKER COMMAND LINE
http://docs.docker.io/reference/commandline/cli/

$ sudo docker run -p 127.0.0.1:80:8080 ubuntu bash
This binds port 8080 of the container to port 80 on 127.0.0.1 of the host machine. Redirect Ports explains in detail how to manipulate ports in Docker.

$ sudo docker run --expose 80 ubuntu bash
This exposes port 80 of the container for use within a link without publishing the port to the host system’s interfaces. Redirect Ports explains in detail how to manipulate ports in Docker.

$ sudo docker run -e MYVAR1 --env MYVAR2=foo --env-file ./env.list ubuntu bash
This sets environmental variables in the container. For illustration all three flags are shown here. Where -e, --env take an environment variable and value, or if no "=" is provided, then that variable’s current value is passed through (i.e. $MYVAR1 from the host is set to $MYVAR1 in the container). All three flags, -e, --env and --env-file can be repeated.

Regardless of the order of these three flags, the --env-file are processed first, and then -e, --env flags. This way, the -e or --env will override variables as needed.

$ cat ./env.list
TEST_FOO=BAR
$ sudo docker run --env TEST_FOO="This is a test" --env-file ./env.list busybox env | grep TEST_FOO
TEST_FOO=This is a test
The --env-file flag takes a filename as an argument and expects each line to be in the VAR=VAL format, mimicking the argument passed to --env. Comment lines need only be prefixed with #

An example of a file passed with --env-file

$ cat ./env.list
TEST_FOO=BAR

# this is a comment
TEST_APP_DEST_HOST=10.10.0.127
TEST_APP_DEST_PORT=8888

# pass through this variable from the caller
TEST_PASSTHROUGH
$ sudo TEST_PASSTHROUGH=howdy docker run --env-file ./env.list busybox env
HOME=/
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
HOSTNAME=5198e0745561
TEST_FOO=BAR
TEST_APP_DEST_HOST=10.10.0.127
TEST_APP_DEST_PORT=8888
TEST_PASSTHROUGH=howdy

$ sudo docker run --name console -t -i ubuntu bash
This will create and run a new container with the container name being console.

$ sudo docker run --link /redis:redis --name console ubuntu bash
The --link flag will link the container named /redis into the newly created container with the alias redis. The new container can access the network and environment of the redis container via environment variables. The --name flag will assign the name console to the newly created container.


$ sudo docker run --volumes-from 777f7dc92da7,ba8c0c54f0f2:ro -i -t ubuntu pwd
The --volumes-from flag mounts all the defined volumes from the referenced containers. Containers can be specified by a comma separated list or by repetitions of the --volumes-from argument. The container ID may be optionally suffixed with :ro or :rw to mount the volumes in read-only or read-write mode, respectively. By default, the volumes are mounted in the same mode (read write or read only) as the reference container.

The -a flag tells docker run to bind to the container’s stdin, stdout or stderr. This makes it possible to manipulate the output and input as needed.

$ sudo echo "test" | docker run -i -a stdin ubuntu cat -
This pipes data into a container and prints the container’s ID by attaching only to the container’s stdin.

$ sudo docker run -a stderr ubuntu echo test
This isn’t going to print anything unless there’s an error because we’ve only attached to the stderr of the container. The container’s logs still store what’s been written to stderr and stdout.

$ sudo cat somefile | docker run -i -a stdin mybuilder dobuild
This is how piping a file into a container could be done for a build. The container’s ID will be printed after the build is done and the build logs could be retrieved using docker logs. This is useful if you need to pipe a file or something else into a container and retrieve the container’s ID once the container has finished running.

A complete example

$ sudo docker run -d --name static static-web-files sh
$ sudo docker run -d --expose=8098 --name riak riakserver
$ sudo docker run -d -m 100m -e DEVELOPMENT=1 -e BRANCH=example-code -v $(pwd):/app/bin:ro --name app appserver
$ sudo docker run -d -p 1443:443 --dns=dns.dev.org --dns-search=dev.org -v /var/log/httpd --volumes-from static --link riak --link app -h www.sven.dev.org --name web webserver
$ sudo docker run -t -i --rm --volumes-from web -w /var/log/httpd busybox tail -f access.log
This example shows 5 containers that might be set up to test a web application change:

Start a pre-prepared volume image static-web-files (in the background) that has CSS, image and static HTML in it, (with a VOLUME instruction in the Dockerfile to allow the web server to use those files);
Start a pre-prepared riakserver image, give the container name riak and expose port 8098 to any containers that link to it;
Start the appserver image, restricting its memory usage to 100MB, setting two environment variables DEVELOPMENT and BRANCH and bind-mounting the current directory ($(pwd) ) in the container in read-only mode as /app/bin;
Start the webserver, mapping port 443 in the container to port 1443 on the Docker server, setting the DNS server to dns.dev.org and DNS search domain to dev.org, creating a volume to put the log files into (so we can access it from another container), then importing the files from the volume exposed by the static container, and linking to all exposed ports from riak and app. Lastly, we set the hostname to web.sven.dev.org so its consistent with the pre-generated SSL certificate;
Finally, we create a container that runs tail -f access.log using the logs volume from the web container, setting the workdir to /var/log/httpd. The --rm option means that when the container exits, the container’s layer is removed.



</entry>
<entry [Thu 2014:04:24 02:35:40 EST] EXPORT AN IMAGE TO SHRINK IT, OR JUST SAVE IT>

SAVE to a tarball and LOAD back again. This will preserve the history of the image.

# save the image to a tarball
docker save IMAGE > /home/save.tar
 
# load it back
docker load < /home/save.tar


***SHRINK IMAGE***
******************
EXPORT to a tarball and IMPORT back again. This will not preserve the history of the container.

# export the container to a tarball
docker export CONTAINER > /home/export.tar
 
# import it back
cat /home/export.tar | docker import - some-name:latest


</entry>
<entry [Thu 2014:04:24 02:33:08 EST] SHRINK IMAGE AND EXPORT>

# CLEAR APT CACHE
apt-get clean

# CHECK /tmp FOR UNWANTED FILES

</entry>
<entry [Thu 2014:04:24 02:28:43 EST] START UP AND ACCESS CONTAINER FROM IMAGE>

NB: At each RUN step, a new container is created (using the image from the previous step).
The command is executed, then a snapshot is taken, producing the image for the next step.
So, all processes are effectively terminated between steps.

ID=$(sudo docker run -i -t -d IMAGE /bin/bash)

sudo docker attach $ID

Example with mounted folder:

ID=$(sudo docker run -i -t -d -v /host_folder:/image_folder IMAGE /bin/bash)

sudo docker attach $ID  

Your terminal will now change to the root user on the Virtual Machine and you will be in the Docker container. Now you can use the following common Docker commands to interact with your Docker image and prepare it to be a BaseSpace application. -v /host_folder:/image_folder:ro will make this new folder read-only.
	
</entry>
<entry [Thu 2014:04:24 02:26:08 EST] ADD A SHARED FOLDER TO A RUNNING IMAGE>

https://portal-hoth.basespace.illumina.com/docs/content/documentation/native-apps/manage-docker-image

Use Shared Folders feature in Virtual Box to share a folder between your host machine and the Native App Virtual Machine.

Once the share is created, create the folder you wish to copy the mount files into on the Virtual Machine.

After the folder is created, use

sudo mount -t vboxsf -o uid=$UID,gid=$GID share [destination_folder_name]
to mount that volume to the destination folder on the Virtual Machine.

Now, add the mounted folder to the run command above when creating an interactive Docker container as shown in that portion of this guide. You will now be able to access this data and copy it into your Docker image for the app's use!

	
</entry>
<entry [Sat 2014:04:12 12:51:03 EST] INSTALLED gtfuse ON docker ON CENTOS 6.4>

1. CREATE DIRECTORY

mkdir -p /agua/apps/gtfuse/1.0.0-1
cd /agua/apps/gtfuse/1.0.0-1


2. PULL centos 6.4 BASE IMAGE (98 MB)

NB: USE docker search TO SEARCH index.docker.io FOR IMAGES

#docker pull centos ## 32-bit
docker pull hansode/centos-6.4-x86_64


3. INSTALL gtfuse

sudo docker run -i -t centos /bin/bash 

IN DOCKER

uname -a

	Linux afb942f14aed 3.8.0-35-generic #50-Ubuntu SMP Tue Dec 3 01:24:59 UTC 2013 x86_64 x86_64 x86_64 GNU/Linux

cat /etc/centos-release 

	CentOS release 6.4 (Final)

mkdir -p /apps/gt
cd /apps/gt
wget https://s3-us-west-1.amazonaws.com/biotools/GeneTorrent-3.8.4-4.tar.gz.zip --no-check-certificate
yum install -y unzip
unzip GeneTorrent-3.8.4-4.tar.gz.zip
	PASSWORD
tar xvfz GeneTorrent-3.8.4-4.tar.gz
cd GeneTorrent-3.8.4-4


4. RUN gtfuse



5. SAVE CONTAINER

GET CONTAINER ID

docker ps
	CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
	c320bf718dce        centos:6.4          /bin/bash           9 minutes ago       Up 9 minutes                            sad_almeida         

SAVE CONTAINER
docker commit c320bf718dce gtfuse
	


NB: IF KERNEL < 3.8 THEN MUST INSTALL LIBS

CHECK KERNEL
uname -r
	3.8.0-35-generic

INSTALL LIBS
sudo apt-get update
sudo apt-get install linux-image-generic-lts-raring linux-headers-generic-lts-raring
sudo reboot


	
</entry>
<entry [Sat 2014:04:12 12:39:32 EST] INSTALLED docker ON ALIEN>

CENTOS
yum install -y docker-io

UBUNTU

USE SHORTCUT SCRIPT:

curl -s https://get.docker.io/ubuntu/ | sudo sh

OR:

1. INSTALL apt-transport-https

if [ ! -e /usr/lib/apt/methods/https ]; then
  apt-get update
  apt-get install apt-transport-https
fi


2. ADD DOCKER REPO KEY TO LOCAL KEYCHAIN

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9


3. ADD DOCKER TO sources.list AND UPDATE APT

echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list
sudo apt-get update

4. INSTALL lxc-docker
You may receive a warning that the package isn’t trusted. Answer yes to continue installation

apt-get install -y lxc-docker


5. VERIFY DOCKER IS INSTALLED AND RUNNING

service docker status

	docker start/running, process 27282

	
</entry>
<entry [Sat 2014:04:12 12:35:59 EST] INSTALL PCAP-Core ON docker>

ftp://ftp.sanger.ac.uk/pub/project/PanCancer/genome.fa.gz

	FROM	ubuntu:12.10
	
	RUN		apt-get update
	RUN		apt-get install -y  zlib1g-dev g++ dh-autoreconf libncurses-dev pkg-config git libgd2-noxpm-dev
	RUN		mkdir /opt/ICGC
	RUN		mkdir /scratch
	RUN		cd /opt && git clone https://github.com/ICGC-TCGA-PanCancer/PCAP-core.git && cd PCAP-core && git checkout dev
	RUN		useradd -u 1000 -g root -d /home/aligner -m -s /bin/bash aligner 
	RUN		chown -R aligner /opt/*
	RUN		cd /opt/PCAP-core/ && export HOME=/home/aligner &&  sudo -u aligner ./setup.sh /opt/ICGC/



	RUN		mkdir /opt/reference
	RUN		cd /opt/reference && curl -O ftp://ftp.sanger.ac.uk/pub/project/PanCancer/genome.fa.gz
	RUN		cd /opt/reference && curl -O ftp://ftp.sanger.ac.uk/pub/project/PanCancer/genome.fa.gz.64.amb
	RUN		cd /opt/reference && curl -O ftp://ftp.sanger.ac.uk/pub/project/PanCancer/genome.fa.gz.64.ann
	RUN		cd /opt/reference && curl -O ftp://ftp.sanger.ac.uk/pub/project/PanCancer/genome.fa.gz.64.bwt
	RUN		cd /opt/reference && curl -O ftp://ftp.sanger.ac.uk/pub/project/PanCancer/genome.fa.gz.64.pac
	RUN		cd /opt/reference && curl -O ftp://ftp.sanger.ac.uk/pub/project/PanCancer/genome.fa.gz.64.sa
	RUN		cd /opt/reference && curl -O ftp://ftp.sanger.ac.uk/pub/project/PanCancer/genome.fa.gz.fai
	ENV		PERL5LIB /opt/ICGC/lib/perl5/
	ENV		PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/ICGC/bin

	
</entry>
<entry [Sun 2014:04:06 13:16:56 EST] INSTALL bcbio>

USAGE INFO
https://github.com/chapmanb/bcbio-nextgen

DOCUMENTATION
https://bcbio-nextgen.readthedocs.org/en/latest/contents/installation.html?highlight=docker


1. DOWNLOAD bcbio

mkdir -p /agua/apps/bcbio
cd /agua/apps/bcbio
git clone https://github.com/chapmanb/bcbio-nextgen.git
mv bcbio-nextgen 0.7.8
cd 0.7.8

2. INSTALL docker

cd /agua/apps/bcbio/0.7.8
yum install docker-io
service docker start
docker build ./

	...
	Step 6 : RUN wget --no-check-certificate -O createsetuser      https://raw.github.com/chapmanb/bcbio-nextgen-vm/master/scripts/createsetuser &&    chmod a+x createsetuser && mv createsetuser /sbin
	 ---> Running in 85298b000c73
	--2014-04-06 21:08:02--  https://raw.github.com/chapmanb/bcbio-nextgen-vm/master/scripts/createsetuser
	idn_decode failed (9): 'System iconv failed'
	199.27.79.133
	idn_decode failed (9): 'System iconv failed'
	connected.
	200 OK
	 (1.7K) [text/plain]
	Saving to: 'createsetuser'
	
	 100% 62.2M=0s
	
	2014-04-06 21:08:02 (62.2 MB/s) - 'createsetuser' saved [1697/1697]
	
	mv: error while loading shared libraries: /lib/x86_64-linux-gnu/libattr.so.1: invalid ELF header
	2014/04/06 21:08:03 The command [/bin/sh -c wget --no-check-certificate -O createsetuser      https://raw.github.com/chapmanb/bcbio-nextgen-vm/master/scripts/createsetuser &&    chmod a+x createsetuser && mv createsetuser /sbin] returned a non-zero code: 127


RUN CONTAINER

docker run bcbio-nextgen



#python bcbio_nextgen_install.py /usr/local/share/bcbio-nextgen --tooldir=/usr/local


	
</entry>
<entry [Wed 2014:04:02 02:24:59 EST] TROUBLESHOOTING DOCKER BUILD>

SUMMARY:
1. EXPLICITY SPECIFY PORT 4243
export DOCKER_HOST=tcp://localhost:4243

2. RESTART DOCKER DAEMON
service docker restart


sudo docker build -t icgc-aligner:dev ./

	2014/04/02 02:24:46 write unix /var/run/docker.sock: broken pipe

	rm -fr /var/run/docker.sock
	touch /var/run/docker.sock
	
service docker restart

	Stopping docker:                                           [  OK  ]
	Starting docker:	                                   [  OK  ]

sudo docker build -t icgc-aligner:dev ./

	2014/04/02 02:30:00 Cannot connect to the Docker daemon. Is 'docker -d' running on this host?


export DOCKER_HOST=tcp://localhost:4243
service docker restart
	Stopping docker:                                           [FAILED]
	Starting docker:	                                   [  OK  ]

service docker status

	docker dead but pid file exists

rm -fr /var/run/docker.pid
service docker status
	docker dead but subsys locked
service docker restart
	Stopping docker:                                           [FAILED]
	Starting docker:	                                   [  OK  ]
service docker status
	docker dead but pid file exists

reboot

service docker restart
	Stopping docker:                                           [FAILED]
	Starting cgconfig service:                                 [  OK  ]
	Starting docker:	                                   [  OK  ]


</entry>
<entry [Tue 2014:04:01 22:49:57 EST] RUN bamtofastq IN docker>

1. RUN bamtofastq

To run the bam2fastq ( the -v argument tells docker which directories get mounted into the container )

sudo docker run -d -v /mnt:/mnt  icgc-aligner:test /opt/ICGC/bin/bamtofastq filename=/mnt/pancanfs/input/97115519-0dae-4a83-a53f-d69850362ff5/G39020.TCGA-F1-6177-01A-11D-1800-08.2.bam outputperreadgroup=1 gz=1 outputdir=/mnt/splits/97115519-0dae-4a83-a53f-d69850362ff5/ level=1

NB: parameter 'level=1' tells it to use the lowest gzip compression level

Notes: this is the compressed version (with lowest compression setting), but bam2fastq keeps naming the files .fa and not .fa.gz, so you'll need to rename them. The readgroup info will be encoded on the name of the files in the directory.


2. RUN alignment

To do alignments, you'll probably have to do a manually call to bwa mem rather then the wrapper they used (bwa_mem.pl), because you'll have to pass in the readgroup info, but their script doesn't do that if you pass fastq files (it will automatically extract it from a bam file, but that only works for the ICGC single lane BAMs).

The command I used when testing was

sudo docker run -v /mnt:/mnt icgc-aligner:dev bwa_mem.pl -threads 16 -sample test -outdir /mnt/output/c251b1da-9e40-488d-9558-21204e7665ae -reference /opt/reference/genome.fa.gz /mnt/splits/c251b1da-9e40-488d-9558-21204e7665ae.0.bam

NB: The important note will be the path to the reference: /opt/reference/genome.fa.gz


3. RUN pancan_alignment.sh

sudo docker run -d -v /mnt:/mnt -v /pancanfs:/pancanfs icgc-aligner:dev /pancanfs/software/pancan_alignment.sh 06cfbe02-7034-4aa7-bdb1-1b6abe66c510

Which then runs the script, but it will have access to all the installed PCAP installed tools.


	
</entry>
<entry [Tue 2014:04:01 18:52:44 EST] INSTALL ICGC-ALIGNER docker IMAGE>

1. INSTALL icgc-aligner ON DOCKER

emacs -nw Dockerfile-v1

	FROM	ubuntu:12.10
	
	RUN		apt-get update
	RUN		apt-get install -y  zlib1g-dev g++ dh-autoreconf libncurses-dev pkg-config git libgd2-noxpm-dev
	RUN		mkdir /opt/ICGC
	RUN		mkdir /scratch
	RUN		cd /opt && git clone https://github.com/ICGC-TCGA-PanCancer/PCAP-core.git && cd PCAP-core && git checkout dev
	RUN		useradd -u 1000 -g root -d /home/aligner -m -s /bin/bash aligner 
	RUN		chown -R aligner /opt/*
	RUN		cd /opt/PCAP-core/ && export HOME=/home/aligner &&  sudo -u aligner ./setup.sh /opt/ICGC/
	RUN		mkdir /opt/reference
	RUN		cd /opt/reference && curl -O ftp://ftp.sanger.ac.uk/pub/project/PanCancer/genome.fa.gz
	RUN		cd /opt/reference && curl -O ftp://ftp.sanger.ac.uk/pub/project/PanCancer/genome.fa.gz.64.amb
	RUN		cd /opt/reference && curl -O ftp://ftp.sanger.ac.uk/pub/project/PanCancer/genome.fa.gz.64.ann
	RUN		cd /opt/reference && curl -O ftp://ftp.sanger.ac.uk/pub/project/PanCancer/genome.fa.gz.64.bwt
	RUN		cd /opt/reference && curl -O ftp://ftp.sanger.ac.uk/pub/project/PanCancer/genome.fa.gz.64.pac
	RUN		cd /opt/reference && curl -O ftp://ftp.sanger.ac.uk/pub/project/PanCancer/genome.fa.gz.64.sa
	RUN		cd /opt/reference && curl -O ftp://ftp.sanger.ac.uk/pub/project/PanCancer/genome.fa.gz.fai
	ENV		PERL5LIB /opt/ICGC/lib/perl5/
	ENV		PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/ICGC/bin

emacs -nw Dockerfile-v2

	FROM	ubuntu:12.04
	
	RUN		apt-get update
	RUN		apt-get install -y zlib1g-dev g++ dh-autoreconf libncurses-dev pkg-config git libgd2-noxpm-dev unzip 
	RUN		echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
	RUN		apt-get update && apt-get -y install python-software-properties
	RUN		add-apt-repository ppa:webupd8team/java
	RUN		apt-get update && apt-get -y upgrade
	RUN		echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
	RUN		apt-get -y install oracle-java7-installer && apt-get clean
	
	RUN             mkdir /opt/reference
	RUN             cd /opt/reference && curl -O ftp://ftp.sanger.ac.uk/pub/project/PanCancer/genome.fa.gz
	RUN             cd /opt/reference && curl -O ftp://ftp.sanger.ac.uk/pub/project/PanCancer/genome.fa.gz.64.amb
	RUN             cd /opt/reference && curl -O ftp://ftp.sanger.ac.uk/pub/project/PanCancer/genome.fa.gz.64.ann
	RUN             cd /opt/reference && curl -O ftp://ftp.sanger.ac.uk/pub/project/PanCancer/genome.fa.gz.64.bwt
	RUN             cd /opt/reference && curl -O ftp://ftp.sanger.ac.uk/pub/project/PanCancer/genome.fa.gz.64.pac
	RUN             cd /opt/reference && curl -O ftp://ftp.sanger.ac.uk/pub/project/PanCancer/genome.fa.gz.64.sa
	RUN             cd /opt/reference && curl -O ftp://ftp.sanger.ac.uk/pub/project/PanCancer/genome.fa.gz.fai
	
	RUN		cd /opt && curl -O http://softlayer-ams.dl.sourceforge.net/project/picard/picard-tools/1.110/picard-tools-1.110.zip && unzip picard-tools-1.110.zip
	RUN		ln -s /opt/picard-tools-1.110 /opt/picard-tools
	
	RUN		mkdir /opt/ICGC
	RUN		cd /opt && git clone https://github.com/ICGC-TCGA-PanCancer/PCAP-core.git && cd PCAP-core && git checkout dev
	RUN		useradd -u 1000 -g root -d /home/aligner -m -s /bin/bash aligner 
	RUN		chown -R aligner /opt/*
	RUN		cd /opt/PCAP-core/ && export HOME=/home/aligner &&  sudo -u aligner ./setup.sh /opt/ICGC/
	
	ENV		JAVA_HOME /usr/lib/jvm/java-7-oracle
	ENV		PERL5LIB /opt/ICGC/lib/perl5/
	ENV		PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/ICGC/bin


2. AVOID DISK BECOMING FULL BY MOVING /tmp AND /var/lib/docker TO /mnt

# MOVE /tmp
mkdir /mnt/tmp
cp /tmp/* /mnt/tmp
mv /tmp /tmp.old
ln -s /mnt/tmp /tmp

# MOVE /var/lib/docker
mkdir /mnt/docker
cp -r /var/lib/docker/* /mnt/docker
mv /var/lib/docker /var/lib/docker.old
ln -s /mnt/docker /var/lib/docker


4. BUILD WITH Dockerfile IN SAME DIRECTORY:

DOWNLOAD COMPILED icgc-aligner docker IMAGE

USES dev BRANCH OF PCAP-core (6 GB - CONTAINS REFERENCE GENOME)

cd /mnt
wget http://hgwdev.sdsc.edu/~kellrott/icgc-aligner.tar


sudo docker build -t icgc-aligner:dev ./

To run the bam2fastq ( the -v argument tells docker which directories get mounted into the container )

sudo docker run -d -v /mnt:/mnt  icgc-aligner:test /opt/ICGC/bin/bamtofastq filename=/mnt/pancanfs/input/97115519-0dae-4a83-a53f-d69850362ff5/G39020.TCGA-F1-6177-01A-11D-1800-08.2.bam outputperreadgroup=1 gz=1 outputdir=/mnt/splits/97115519-0dae-4a83-a53f-d69850362ff5/

Notes: this is the compressed version (with lowest compression setting), but bam2fastq keeps naming the files .fa and not .fa.gz, so you'll need to rename them. The readgroup info will be encoded on the name of the files in the directory.

To do alignments, you'll probably have to do a manually call to bwa mem rather then the wrapper they used (bwa_mem.pl), because you'll have to pass in the readgroup info, but their script doesn't do that if you pass fastq files (it will automatically extract it from a bam file, but that only works for the ICGC single lane BAMs).

The command I used when testing was 

sudo docker run \
-v \
/mnt:/mnt icgc-aligner:dev \
bwa_mem.pl \
-threads 16 \
-sample test \
-outdir /mnt/output/c251b1da-9e40-488d-9558-21204e7665ae \
-reference /opt/reference/genome.fa.gz \
/mnt/splits/c251b1da-9e40-488d-9558-21204e7665ae.0.bam

The important note will be the path to the reference:

/opt/reference/genome.fa.gz




sudo su
cd /mnt
sudo docker build -t icgc-aligner:dev ./

	Uploading context 467.2 GB

	FAILED




TROUBLESHOOTING
---------------

USING Dockerfile-v1:

cd /mnt
sudo docker build -t icgc-aligner:dev ./

	Uploading context 19.35 GB
	...
	Uploading context 278.4 GB
	Uploading context 
	Step 0 : FROM ubuntu:12.10
	Pulling repository ubuntu
	5ac751e8d623: Download complete 
	511136ea3c5a: Download complete 
	321f7f4200f4: Download complete 
	 ---> 5ac751e8d623
	Step 1 : RUN  apt-get update
	 ---> Running in 0c339a60a884
	 
	...
	
	debconf: unable to initialize frontend: Dialog
	debconf: (TERM is not set, so the dialog frontend is not usable.)
	debconf: falling back to frontend: Readline
	debconf: unable to initialize frontend: Readline
	debconf: (Can't locate Term/ReadLine.pm in @INC (@INC contains: /etc/perl /usr/local/lib/perl/5.14.2 /usr/local/share/perl/5.14.2 /usr/lib/perl5 /usr/share/perl5 /usr/lib/perl/5.14 /usr/share/perl/5.14 /usr/local/lib/site_perl .) at /usr/share/perl5/Debconf/FrontEnd/Readline.pm line 7, <> line 128.)
	debconf: falling back to frontend: Teletype
	dpkg-preconfigure: unable to re-open stdin: 

	...
	
	Step 3 : RUN  mkdir /opt/ICGC
	 ---> Running in 743ffbc8f0a3
	 ---> 404406197ef9
	Step 4 : RUN  mkdir /scratch
	 ---> Running in 8eb1ba63a6bd
	 ---> 39dede8c3864
	Step 5 : RUN  cd /opt && git clone https://github.com/ICGC-TCGA-PanCancer/PCAP-core.git && cd PCAP-core && git checkout dev
	 ---> Running in 89586a2f720b
	Cloning into 'PCAP-core'...
	Branch dev set up to track remote branch dev from origin.
	Switched to a new branch 'dev'
	 ---> 74cc2a3ca234
	Step 6 : RUN  useradd -u 1000 -g root -d /home/aligner -m -s /bin/bash aligner
	 ---> Running in a9f2466dd401
	 ---> 5f00e22e8be8
	Step 7 : RUN  chown -R aligner /opt/*
	 ---> Running in c58ecfe6e20f
	 ---> 0f34fb8145c1
	Step 8 : RUN  cd /opt/PCAP-core/ && export HOME=/home/aligner &&  sudo -u aligner ./setup.sh /opt/ICGC/
	 ---> Running in f0b92581e73c
	Max compilation CPUs set to 6
	 done.
	 done.
	 done.
	 done.
	 done.
	 done.
	 done.
	 failed.  See setup.log file for error messages. Failed to build libmaus.
		Please check INSTALL file for items that should be installed by a package manager
	2014/04/02 05:45:59 The command [/bin/sh -c cd /opt/PCAP-core/ && export HOME=/home/aligner &&  sudo -u aligner ./setup.sh /opt/ICGC/] returned a non-zero code: 1


PROBLEM

MISSING Term::Readline

SOLUTION

debconf-get-selections


</entry>
<entry [Tue 2014:04:01 18:52:43 EST] INSTALL docker>

docker installation guide:
https://www.docker.io/gettingstarted/


1. INSTALL EPEL

wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
sudo rpm -Uvh remi-release-6*.rpm epel-release-6*.rpm

1. INSTALL docker-io

https://www.docker.io/gettingstarted/

# REMOVE docker (NOT THE REAL DOCKER)

sudo yum -y remove docker

# INSTALL docker-io

sudo yum -y install docker-io

# UPDATE docker-io

sudo yum -y update docker-io


# START DOCKER SERVICE

sudo service docker start


# *** OPTIONAL: ENABLE DOCKER AT BOOT

sudo chkconfig docker on


# *** OPTIONAL: VERIFY DOCKER IS WORKING

sudo docker run -i -t fedora /bin/bash


</entry>
<entry [Sat 2014:03:29 12:10:57 EST] INSTALL DOCKER>

I'm moving some files into /pancanfs/input/
I'll let you know when they are finished. I think we'll have to change up the Synapse tool to accommodate the changes we've been making in our workflow. Once that is done, you'll be able to use it to know which files I've downloaded and store the readgroup info you find and the metadata about the bam files you create.

I've stored a compiled copy of the icgc-aligner tool docker image at http://hgwdev.sdsc.edu/~kellrott/icgc-aligner.tar
It uses the dev branch of the PCAP-core. 
I've included the reference genome in the image (that why it's 6GB large)
The builder file is attached. 

You can find the docker installation guide at https://www.docker.io/gettingstarted/

To build, in the directory with the docker file, and run the command 
sudo docker build -t icgc-aligner:dev ./

To run the bam2fastq ( the -v argument tells docker which directories get mounted into the container )

sudo docker run -d -v /mnt:/mnt  icgc-aligner:test /opt/ICGC/bin/bamtofastq filename=/mnt/pancanfs/input/97115519-0dae-4a83-a53f-d69850362ff5/G39020.TCGA-F1-6177-01A-11D-1800-08.2.bam outputperreadgroup=1 gz=1 outputdir=/mnt/splits/97115519-0dae-4a83-a53f-d69850362ff5/

Notes: this is the compressed version (with lowest compression setting), but bam2fastq keeps naming the files .fa and not .fa.gz, so you'll need to rename them. The readgroup info will be encoded on the name of the files in the directory.

To do alignments, you'll probably have to do a manually call to bwa mem rather then the wrapper they used (bwa_mem.pl), because you'll have to pass in the readgroup info, but their script doesn't do that if you pass fastq files (it will automatically extract it from a bam file, but that only works for the ICGC single lane BAMs).

The command I used when testing was 

sudo docker run -v /mnt:/mnt icgc-aligner:dev bwa_mem.pl -threads 16 -sample test -outdir /mnt/output/c251b1da-9e40-488d-9558-21204e7665ae -reference /opt/reference/genome.fa.gz /mnt/splits/c251b1da-9e40-488d-9558-21204e7665ae.0.bam

The important note will be the path to the reference: /opt/reference/genome.fa.gz

    
</entry>
