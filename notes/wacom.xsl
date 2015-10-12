wacom


<entry [Sat 2014:04:12 12:55:20 EST] WACOM-PLUS REPO FAILED TO FETCH ON apt-update>

Fetched 5,539 B in 56s (97 B/s)
W: Failed to fetch http://ppa.launchpad.net/minecraft-installer-peeps/minecraft-installer/ubuntu/dists/YOraring/main/binary-amd64/Packages  404  Not Found

W: Failed to fetch http://ppa.launchpad.net/minecraft-installer-peeps/minecraft-installer/ubuntu/dists/YOraring/main/binary-i386/Packages  404  Not Found

W: Failed to fetch http://ppa.launchpad.net/doctormo/wacom-plus/ubuntu/dists/raring/main/binary-amd64/Packages  404  Not Found

W: Failed to fetch http://ppa.launchpad.net/doctormo/wacom-plus/ubuntu/dists/raring/main/binary-i386/Packages  404  Not Found

E: Some index files failed to download. They have been ignored, or old ones used instead.

	
</entry>
<entry [Wed 2014:03:12 15:24:41 EST] linuxwacom DRIVER FOR INTUOS PEN AND TOUCH SMALL>

1. DOWNLOAD DRIVER

ANNOUNCED HERE
http://libregraphicsworld.org/blog/entry/wacom-intuos-pen-touch-tablets-on-linux

DOWNLOAD SITE
http://sourceforge.net/projects/linuxwacom/

DOWNLOAD LINK
http://sourceforge.net/projects/linuxwacom/files/latest/download

DIRECT DOWNLOAD
http://downloads.sourceforge.net/project/linuxwacom/xf86-input-wacom/xf86-input-wacom-0.22.1.tar.bz2?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Flinuxwacom%2F&ts=1394663093&use_mirror=iweb


2. INSTALL DRIVER

cd /home/syoung/software/wacom
tar xvfj xf86-input-wacom-0.22.1.tar.bz2
cd xf86-input-wacom-0.22.1

./configure --prefix=/usr
make
make install

INSTALLED xsetwacom BINARY

ll /usr/bin | grep wacom
-rwxr-xr-x  1 root root      154952 Mar 12 15:33 xsetwacom


NOTES
-----

FULL OUTPUT OF MAKE INSTALL

make install
Making install in conf
make[1]: Entering directory `/data2/software/wacom/xf86-input-wacom-0.22.1/conf'
make[2]: Entering directory `/data2/software/wacom/xf86-input-wacom-0.22.1/conf'
make[2]: Nothing to be done for `install-exec-am'.
 /bin/mkdir -p '/usr/share/X11/xorg.conf.d'
 /usr/bin/install -c -m 644 50-wacom.conf '/usr/share/X11/xorg.conf.d'
make[2]: Leaving directory `/data2/software/wacom/xf86-input-wacom-0.22.1/conf'
make[1]: Leaving directory `/data2/software/wacom/xf86-input-wacom-0.22.1/conf'
Making install in doc
make[1]: Entering directory `/data2/software/wacom/xf86-input-wacom-0.22.1/doc'
make[2]: Entering directory `/data2/software/wacom/xf86-input-wacom-0.22.1/doc'
make[2]: Nothing to be done for `install-exec-am'.
make[2]: Nothing to be done for `install-data-am'.
make[2]: Leaving directory `/data2/software/wacom/xf86-input-wacom-0.22.1/doc'
make[1]: Leaving directory `/data2/software/wacom/xf86-input-wacom-0.22.1/doc'
Making install in src
make[1]: Entering directory `/data2/software/wacom/xf86-input-wacom-0.22.1/src'
make[2]: Entering directory `/data2/software/wacom/xf86-input-wacom-0.22.1/src'
make[2]: Nothing to be done for `install-exec-am'.
 /bin/mkdir -p '/usr/lib/xorg/modules/input'
 /bin/bash ../libtool   --mode=install /usr/bin/install -c   wacom_drv.la '/usr/lib/xorg/modules/input'
libtool: install: /usr/bin/install -c .libs/wacom_drv.so /usr/lib/xorg/modules/input/wacom_drv.so
libtool: install: /usr/bin/install -c .libs/wacom_drv.lai /usr/lib/xorg/modules/input/wacom_drv.la
libtool: finish: PATH="/usr/bin:/opt/sge6/bin/lx24-amd64:/aguadev/bin/apps/logic:/home/syoung/software/komodo/7.1.1-10623/bin:/opt/pdk/bin:/aguadev/apps/bioapps/bin/utils:/usr/local/bin/packer:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/sbin" ldconfig -n /usr/lib/xorg/modules/input
----------------------------------------------------------------------
Libraries have been installed in:
   /usr/lib/xorg/modules/input

If you ever happen to want to link against installed libraries
in a given directory, LIBDIR, you must either use libtool, and
specify the full pathname of the library, or use the `-LLIBDIR'
flag during linking and do at least one of the following:
   - add LIBDIR to the `LD_LIBRARY_PATH' environment variable
     during execution
   - add LIBDIR to the `LD_RUN_PATH' environment variable
     during linking
   - use the `-Wl,-rpath -Wl,LIBDIR' linker flag
   - have your system administrator add LIBDIR to `/etc/ld.so.conf'

See any operating system documentation about shared libraries for
more information, such as the ld(1) and ld.so(8) manual pages.
----------------------------------------------------------------------
make[2]: Leaving directory `/data2/software/wacom/xf86-input-wacom-0.22.1/src'
make[1]: Leaving directory `/data2/software/wacom/xf86-input-wacom-0.22.1/src'
Making install in man
make[1]: Entering directory `/data2/software/wacom/xf86-input-wacom-0.22.1/man'
make[2]: Entering directory `/data2/software/wacom/xf86-input-wacom-0.22.1/man'
make[2]: Nothing to be done for `install-exec-am'.
 /bin/mkdir -p '/usr/share/man/man4'
 /usr/bin/install -c -m 644 wacom.4 '/usr/share/man/man4'
 /bin/mkdir -p '/usr/share/man/man1'
 /usr/bin/install -c -m 644 xsetwacom.1 '/usr/share/man/man1'
make[2]: Leaving directory `/data2/software/wacom/xf86-input-wacom-0.22.1/man'
make[1]: Leaving directory `/data2/software/wacom/xf86-input-wacom-0.22.1/man'
Making install in include
make[1]: Entering directory `/data2/software/wacom/xf86-input-wacom-0.22.1/include'
make[2]: Entering directory `/data2/software/wacom/xf86-input-wacom-0.22.1/include'
make[2]: Nothing to be done for `install-exec-am'.
 /bin/mkdir -p '/usr/include/xorg'
 /usr/bin/install -c -m 644 Xwacom.h wacom-properties.h isdv4.h wacom-util.h '/usr/include/xorg'
make[2]: Leaving directory `/data2/software/wacom/xf86-input-wacom-0.22.1/include'
make[1]: Leaving directory `/data2/software/wacom/xf86-input-wacom-0.22.1/include'
Making install in tools
make[1]: Entering directory `/data2/software/wacom/xf86-input-wacom-0.22.1/tools'
make[2]: Entering directory `/data2/software/wacom/xf86-input-wacom-0.22.1/tools'
 /bin/mkdir -p '/usr/bin'
  /bin/bash ../libtool   --mode=install /usr/bin/install -c xsetwacom isdv4-serial-debugger '/usr/bin'
libtool: install: /usr/bin/install -c xsetwacom /usr/bin/xsetwacom
libtool: install: /usr/bin/install -c isdv4-serial-debugger /usr/bin/isdv4-serial-debugger
make[2]: Nothing to be done for `install-data-am'.
make[2]: Leaving directory `/data2/software/wacom/xf86-input-wacom-0.22.1/tools'
make[1]: Leaving directory `/data2/software/wacom/xf86-input-wacom-0.22.1/tools'
Making install in test
make[1]: Entering directory `/data2/software/wacom/xf86-input-wacom-0.22.1/test'
make[2]: Entering directory `/data2/software/wacom/xf86-input-wacom-0.22.1/test'
make[2]: Nothing to be done for `install-exec-am'.
make[2]: Nothing to be done for `install-data-am'.
make[2]: Leaving directory `/data2/software/wacom/xf86-input-wacom-0.22.1/test'
make[1]: Leaving directory `/data2/software/wacom/xf86-input-wacom-0.22.1/test'
make[1]: Entering directory `/data2/software/wacom/xf86-input-wacom-0.22.1'
make[2]: Entering directory `/data2/software/wacom/xf86-input-wacom-0.22.1'
make[2]: Nothing to be done for `install-exec-am'.
 /bin/mkdir -p '/usr/lib/pkgconfig'
 /usr/bin/install -c -m 644 xorg-wacom.pc '/usr/lib/pkgconfig'
make[2]: Leaving directory `/data2/software/wacom/xf86-input-wacom-0.22.1'
make[1]: Leaving directory `/data2/software/wacom/xf86-input-wacom-0.22.1'





</entry>
<entry [Fri 2014:02:14 23:19:36 EST] RETRY INSTALL WACOM 0.20.0>

http://askubuntu.com/questions/368242/wacom-graphics-tablet-cth-480-ctl-480-not-detected-in-ubuntu-13-10

1. DOWNLOAD

http://downloads.sourceforge.net/project/linuxwacom/xf86-input-wacom/input-wacom/input-wacom-0.20.0.tar.bz2

http://sourceforge.net/projects/linuxwacom/files/xf86-input-wacom/input-wacom/input-wacom-0.20.0.tar.bz2/download

MD5: 86ec5c2a0a743889af6fa2e72b838f76 input-wacom-0.20.0.tar.bz2
SHA1: d2a54d73dbd45152a7f622ec01e1f124e85792a8 input-wacom-0.20.0.tar.bz2

up vote
8
down vote
Update for 13.10, 14 Dec 2013, input-wacom >= 0.20.0
Short version: you do not need to patch input-wacom anymore starting from version 0.20.0, and you do not strictly need to update the X.org input driver in 13.10.

Long version:

For 13.10, if you accept to forego the new things added to x86-input-wacom (at this time: 14 Dec 2013, looking at changelogs, it's some stuff about better touch behavior) you can simplify it a lot.

Basic information is still from the main answer, and from here, with a slight difference.

1) Download the last version of input-wacom kernel driver. It should be at least 0.20.0, otherwise the tablet will not be detected, from here: http://sourceforge.net/projects/linuxwacom/files/xf86-input-wacom/input-wacom/. In date 2013-12-14, the newest is input-wacom-0.20.0.tar.bz2.

2) be sure to have the build dependencies installed. Upgrade your system if you have not, so you have the last kernel. If it says that a reboot is needed, reboot before continuing (this is to avoid to build against a wrong kernel).

sudo apt-get install build-essential libX11-dev libxi-dev x11proto-input-dev xserver-xorg-dev libxrandr-dev libncurses5-dev autoconf libtool
sudo apt-get install linux-headers-generic
Notice that if uname -r tell you that you have a special kernel (ending not in -generic, but -rt, or -lowlatency, or whatever, you should modify the second apt-get accordingly)

2) uncompress the driver in a directory of your choice. Move the downloaded file in that direcory, cd to it, and

tar xjvf input-wacom-0.20.0.tar.bz2
3) a directory input-wacom-0.20.0 is created. cd to it and compile the drivers:

cd  input-wacom-0.20.0
./configure --prefix=/usr
if there are no errors, at the end you have a message starting with:

  BUILD ENVIRONMENT:
       linux kernel - yes 3.7
      kernel source - yes /lib/modules/3.11.0-14-generic/build

Your wacom.ko is available under 
    /home/romano/software/wacom/input-wacom-0.20.0/3.7
[...more stuff...]
You have kernel 3.11.something, not 3.7 --- do not worry. It's ok.

4) Install the driver.

sudo cp ./3.7/wacom.ko /lib/modules/`uname -r`/kernel/drivers/input/tablet/wacom.ko
sudo depmod -a
If you had not the tablet connected since the last reboot (i.e. you had no kernel module wacom.ko loaded), a reboot is not needed. You can just plug your tablet and go. Otherwise, reboot.

NOTICE: Every time the kernel is updated, you need to repeat step 3 and 4 (*)(you better add a

make clean 
in the driver directory before the ./configure step to rebuild all anew).

(*) you have to do the installation AFTER rebooting in the new kernel, because otherwise the uname -r tricks will install the module in the wrong place...


ALTERNATE:

The following approach works for me on Ubuntu 13.04 and 13.10:

Download input-wacom-0.20.0.tar.bz2 from SourceForge
Untar it and run ./configure. It is necessary to have gcc installed to compile (sudo apt-get install gcc)
Copy 3.7/wacom.ko to /lib/modules/KERNEL_VERSION/kernel/drivers/input/tablet/
Add wacom to /etc/modules because tablet is not recognized automatically
The above worked fine for kernels 3.8.0.34 on Ubuntu 13.04 and mainstream 3.12.6 on Ubuntu 13.10. I've installed 3.12.6 to check if its wacom driver contains recent changes but it is not the case.




ALTERNATE 2:


The tablet is too fresh :-) the input-wacom developers are working on support in the upcoming release of input-wacom (kernel driver) and x86-input-wacom (xserver input driver) as soon as the patches are accepted into the kernel upstream, they will release the new version.

If you don't want to wait that long to get your new tablet going -- the solution is to compile the kernel-module and xserver-driver yourself - I have 12.04 running with 3.8.0-32-lowlatency kernel from the kxstudio ppa, so I don't know if this works with the stock 3.2 kernel but since you are on 13.10, that shouldn't be a problem. You have to follow the instructions on the linux-wacom website on how to compile the kernel module and the xserver driver almost to the letter but you have to apply three patches in the process. Be sure to install all the build-dependencies needed and mentioned on the linux-wacom website.

The gist of it is

 mkdir ~/wacom
 cd ~/wacom
 git clone git://git.code.sf.net/p/linuxwacom/xf86-input-wacom
 git clone git://git.code.sf.net/p/linuxwacom/input-wacom
Now you need two patches for the kernel module, posted by a wacom developer in this thead http://sourceforge.net/p/linuxwacom/mailman/message/31592023/ as attachments to this post http://sourceforge.net/p/linuxwacom/mailman/message/31599376/

0001-Input-wacom-Not-all-multi-interface-devices-support-.patch
0002-Input-wacom-add-support-for-three-new-Intuos-devices.patch
Apply them

cd input-wacom
patch -p1 < ~/Downloads/0001-Input-wacom-Not-all-multi-interface-devices-support-.patch
patch -p1 < ~/Downloads/0002-Input-wacom-add-support-for-three-new-Intuos-devices.patch
compile the module

./autogen.sh
./make
then make a backup of the old module and install the freshly build

sudo cp /lib/modules/$(uname -r)/kernel/drivers/input/tablet/wacom.ko /lib/modules/$(uname -r)/kernel/drivers/input/tablet/wacom.ko.BAK
sudo cp 3.7/wacom.ko /lib/modules/$(uname -r)/kernel/drivers/input/tablet/wacom.ko
sudo depmod -a
To get a working xserver driver you have to apply a patch to get the git-sources to work with the ubuntu 12.04 xserver, the build_against_frankenserver.patch - the patch is available e.g. attachment in this thread http://ubuntuforums.org/showthread.php?t=1515562&page=104 , I don't know if this is still necessecary with 13.04 or 13.10! (and ignore patch failures in the test/ directory)

cd ../xf86-input-wacom
patch -p1 ~/Downloads/build_against_frankenserver.patch
./autogen.sh
./configure --prefix=/usr --libdir=/usr/lib
make
Install it sudo cp /usr/lib/xorg/modules/input/wacom_drv.so /usr/lib/xorg/modules/input/wacom_drv.so.BAK sudo cp src/.libs/wacom_drv.so /usr/lib/xorg/modules/input/wacom_drv.so

Reboot or restart and it should work.

Again be sure to read all the information given to you over at linux-wacom.sf.net, this is only a rough summary, and I wont have the time to help in depth anytime soon.

Still, I hope this helps -- the Intuos PTS is a really cool device, and it works like a charm this way.


	
</entry>
<entry [Mon 2013:12:16 22:18:09 EST] INSTALL WACOM DRIVER 0.20.0 FOR INTUOS ON UBUNTU>


http://askubuntu.com/questions/359892/why-is-my-wacom-intuos-tablet-not-detected


1. DOWNLOAD DRIVER

DOWNLOAD PAGE

https://launchpad.net/ubuntu/+source/xf86-input-wacom/1:0.20.0-0ubuntu1

DOWNLOAD FILE

https://launchpad.net/ubuntu/+archive/primary/+files/xf86-input-wacom_0.20.0.orig.tar.bz2


2. INSTALL DEPENDENCIES

sudo apt-get install build-essential libx11-dev libxi-dev x11proto-input-dev xserver-xorg-dev libxrandr-dev libncurses5-dev autoconf libtool

sudo apt-get install libxinerama-dev

suod apt-get install libudev-dev

3. INSTALL DRIVER

tar xvfz xf86*.tar.gz
cd debian
./configure --prefix=/usr
make
make install

	----------------------------------------------------------------------
	Libraries have been installed in:
	   /usr/lib/xorg/modules/input
	
	If you ever happen to want to link against installed libraries
	in a given directory, LIBDIR, you must either use libtool, and
	specify the full pathname of the library, or use the `-LLIBDIR'
	flag during linking and do at least one of the following:
	   - add LIBDIR to the `LD_LIBRARY_PATH' environment variable
		 during execution
	   - add LIBDIR to the `LD_RUN_PATH' environment variable
		 during linking
	   - use the `-Wl,-rpath -Wl,LIBDIR' linker flag
	   - have your system administrator add LIBDIR to `/etc/ld.so.conf'
	
	See any operating system documentation about shared libraries for
	more information, such as the ld(1) and ld.so(8) manual pages.


</entry>