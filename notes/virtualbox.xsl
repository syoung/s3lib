virtualbox


<entry [Fri 2015:01:30 15:29:00 EST] INSTALL GUEST ADDITIONS 4.3.10_Ubuntur93012 ON CENTOS>

1. GET MASTER VERSION

VBoxManage --version
	4.3.10_Ubuntur93012


2. ON VM, DOWNLOAD *.iso

SITE
http://download.virtualbox.org/virtualbox/4.3.10/
	
DOWNLOAD
wget http://download.virtualbox.org/virtualbox/4.3.10/VBoxGuestAdditions_4.3.10.iso


3. MOUNT AND INSTALL

mkdir /virtualbox
mount -o loop -t iso9660 VBoxGuestAdditions_4.3.10.iso  /virtualbox
cd /virtualbox
./VBoxLinuxAdditions.run




</entry>
<entry [Fri 2014:09:19 23:56:35 EST] INSTALL VIRTUALBOX ON UBUNTU 14.04>

1. INSTALL VIRTUALBOX

apt-get install -y virtualbox


2. INSTALL VAGRANT

apt-get install -y vagrant


3. INSTALL dkms TO INSURE VirtualBox host KERNEL MODULES (vboxdrv, vboxnetflt and vboxnetadp) are properly updated if the Linux kernel version changes during the next apt-get upgrade.

apt-get install -y virtualbox-dkms
    
</entry>
<entry [Tue 2014:03:18 12:39:50 EST] DOWNLOAD VIRTUALBOX AND GUEST ADDITIONS>

http://download.virtualbox.org/virtualbox/4.3.8/

VIRTUALBOX

http://download.virtualbox.org/virtualbox/4.3.8/virtualbox-4.3_4.3.8-92456~Ubuntu~raring_i386.deb

GUEST ADDITIONS

http://download.virtualbox.org/virtualbox/4.3.8/VBoxGuestAdditions_4.3.8.iso

	
</entry>
<entry [Mon 2014:03:10 18:54:05 EST] INSTALL VIRTUALBOX ON UBUNTU SERVER 14.04>

http://tutorialforlinux.com/2014/02/22/how-to-install-latest-virtualbox-on-ubuntu-14-04-trusty-lts-3264bit-easy-guide/

1. INSTALL GDebi Package Manager

sudo su -c "apt-get install gdebi"


2. INSTALL LATEST VirtualBox

cd ~/Downloads
sudo su -c "gdebi ./virtualbox*.deb"


Try Free VMware Workstation 10 on Ubuntu Li
	
</entry>
<entry [Sat 2013:12:14 21:38:10 EST] DOWNLOADED LATEST GUEST ADDITIONS (v4.3.4>

1. DOWNLOAD VIRTUALBOX 4.3.4

cd ~/software/virtualbox
wget http://download.virtualbox.org/virtualbox/4.3.4/virtualbox-4.3_4.3.4-91027~Ubuntu~raring_i386.deb


2. INSTALL DEPENDENCIES

apt-get install psmisc
apt-get -f install
	
	#### INSTALLS THESE OTHER VIRTUALBOX DEPENDENCIES
	#apt-get install libcurl3
	#apt-get install libdevmapper1.02.1
	#apt-get install libpython2.7
	#apt-get install libsdl1.2debian
	#apt-get install libvpx1
	#apt-get install libxcursor1
	#apt-get install libxinerama1

apt-get install psmisc
apt-get -f install

apt-get install libxmu6


3. INSTALL VIRTUALBOX 4.3.4

dpkg -i virtualbox-4.3_4.3.4-91027~Ubuntu~raring_i386.deb



</entry>
<entry [Wed 2013:11:20 14:39:40 EST] INSTALL GUEST ADDITIONS>

http://askubuntu.com/questions/22743/how-do-i-install-guest-additions-in-virtualbox/22745#22745

REQUIRED TO SPEED UP VIRTUALBOX AND USE COPY TO CLIPBOARD


sudo aptitude install virtualbox-guest-additions


1. *** ON GUEST **** INSTALL LIBRARIES

# UBUNTU
apt-get install dkms build-essential

uname -a # GET HEADERS VERSION, E.G.:

	apt-get install linux-headers-3.8.0-33-generic


2. *** ON GUEST **** INSTALL THE GUEST ADDITIONS

http://apt.ubuntu.com/p/virtualbox-guest-additions
/VirtualBox/GuestAdd/CheckHostVersion


3. *** ON HOST *** RUN VBoxGuestAdditions.run


cd /home/syoung/software/virtualbox
wget http://download.virtualbox.org/virtualbox/4.3.0/VBoxGuestAdditions_4.3.0.iso
mkdir /virtualbox
mount VBoxGuestAdditions_4.3.0.iso  /virtualbox
cd /virtualbox
./VBoxLinuxAdditions.run

	Verifying archive integrity... All good.
	Uncompressing VirtualBox 4.3.0 Guest Additions for Linux............
	VirtualBox Guest Additions installer
	Copying additional installer modules ...
	Installing additional modules ...
	Removing existing VirtualBox DKMS kernel modules ...done.
	Removing existing VirtualBox non-DKMS kernel modules ...done.
	Building the VirtualBox Guest Additions kernel modules ...done.
	Doing non-kernel setup of the Guest Additions ...done.
	Starting the VirtualBox Guest Additions ...fail!
	(modprobe vboxguest failed)
	Installing the Window System drivers
	Installing X.Org Server 1.13 modules ...done.
	Setting up the Window System to use the Guest Additions ...done.
	You may need to restart the hal service and the Window System (or just restart
	the guest system) to enable the Guest Additions.
	
	Installing graphics libraries and desktop services components ...done.


4. MOUNT THE GUEST ADDITIONS

you have to start the virtual machine then go to Devices menu > install additional addon - that if you are using windows. for ubuntu do this:

sudo su
enter your root or root equivalent password
apt-get update 
apt-get upgrade
apt-get install dkms

reboot UBUNTU virtual os

when your virtual ubuntu OS start do this

go to

devices --> cd/dvd devices --> virtual cd/dvd disk file

and navigate to your ubuntu os file you downloaded mine was ubuntu-11.04-server-i386.iso
this will mount that iso as a cd rom


again go to


Devices -> select the file name then run these commands as a root


cd /media
mkdir myubuntuiso
sudo mount /dev/sr0 myubuntuiso/
cd myubuntuiso/

./VBoxLinuxAdditions.run 




	
</entry>


