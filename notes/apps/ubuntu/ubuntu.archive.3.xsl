ubuntu.archive.3


<entry [Wed 2011:03:30 18:03:45 EST] FIX SUDDEN FREEZE>

SOLUTION:

REMOVED CALL TO metacity IN ROOT .bash_profile


PROBLEM:

COMPUTER WOULD FREEZE AT INOPPORTUNE MOMENTS AND WITHOUT WARNING


DIAGNOSIS:

KEEP SEEING THESE ERRORS IN /var/log/syslog

Mar 30 17:47:34 hp pulseaudio[2138]: alsa-util.c:   appl_ptr     : 87272
Mar 30 17:47:34 hp pulseaudio[2138]: alsa-util.c:   hw_ptr       : 87272
Mar 30 17:47:37 hp modem-manager: (ttyS0) closing serial device...
Mar 30 17:47:37 hp init: plymouth-stop pre-start process (2357) terminated with status 1
Mar 30 17:47:59 hp pulseaudio[2138]: ratelimit.c: 4 events suppressed

**** FROZE HERE ***

Mar 30 17:52:46 hp kernel: imklog 4.2.0, log source = /proc/kmsg started.
Mar 30 17:52:46 hp rsyslogd: [origin software="rsyslogd" swVersion="4.2.0" x-pid="1121" x-info="http:\
//www.rsyslog.com"] (re)start


THIS SEEMS TO COINCIDE WITH FREEZES:

 lo: Disabled Privacy Extensions
Mar 30 14:32:43 hp kernel: [ 1951.030452] ISO 9660 Extensions: Microsoft Joliet Level 3
Mar 30 14:32:43 hp kernel: [ 1951.043197] ISOFS: changing to secondary root



    
</entry>
<entry [Wed 2011:03:30 13:48:57 EST]  INSTALL PERL MODULES>

1. INSTALL EXPAT FOR XML::Simple

mkdir -p /home/syoung/software/expat/archive
cd /home/syoung/software/expat/archive
wget http://downloads.sourceforge.net/expat/expat-2.0.1.tar.gz
tar xvfz expat-2.0.1.tar.gz
cd expat-2.0.1
./configure
make
make install

    OK

2. INSTALL DBD::mysql

INSTALL mysql-devel TO AVOID ERROR 'mysql.h: No such file or directory':
(mysql.h is included in the mysql-devel package which is not installed by default.)

UBUNTU
apt-get install libmysqlclient16 libmysqlclient16-dev

CENTOS
yum install mysql-devel
	

3. SETUP AUTOMATIC CPAN INSTALL 
  
  SEE apps.cpan
  [Wed Nov 17 11:42:00 EST 2010] AUTOMATE CPAN INSTALLS


4. INSTALL ALL GENERAL MODULES

emacs /home/syoung/0.6/install/perlmodslist.txt
YAML
XML::Simple
Config::JSON
JSON
File::Remove
File::Copy::Recursive
Net::LDAP
File::Sort
DBI
DBD::SQLite
Term::ReadKey 
#### Net::Amazon::EC2 DEPENDENCIES
##Digest::HMAC_SHA1
##Params::Validate
DBI
DBD::mysql


cd /home/syoung/0.6/install
cat perlmodslist.txt | grep -v "^#" | xargs -L1 -IMYMODULE perl -MCPAN -e 'install MYMODULE' 

    OK


5. INSTALL ALL MOOSE-RELATED MODULES

emacs /home/syoung/0.6/install/moosemodslist.txt

#### INSTALL Module::Builder with CPAN
Module::Load::Conditional
IPC::Cmd
ExtUtils::CBuilder
Module::Build
#### INSTALL Moose ON PERL 5.8.8
##DROLSKY/Moose-1.09.tar.gz
MooseX::FollowPBP
Params::Validate
IPC::Cmd
MooseX::Params::Validate
Moose::Util::TypeConstraints
Try::Tiny
Getopt::Long::Descriptive
MooseX::Getopt
#
#### INSTALL MOOSEX::DECLARE
aliased
Carp::Clan
Sub::Identify
Variable::Magic
B::Hooks::EndOfScope
#
Devel::PartialDump
Test::Tester
Hook::LexWrap
Clone
#
Text::Diff
Test::SubCalls
Test::Differences
Params::Validate
Pod::Simple
#
namespace::clean
Pod::Escapes
ExtUtils::Depends
#
MooseX::Declare



cd /home/syoung/0.6/install
cat moosemodslist.txt | grep -v "^#" | xargs -L1 -IMYMODULE perl -MCPAN -e 'install MYMODULE' 
    OK


6. LIST INSTALLED MODULE VERSIONS:

/home/syoung/0.6/bin/apps/utils/modules.pl > /home/syoung/0.6/install/installedmods.txt


**** COPIED TO notes/apps/cpan/installedmods.txt  ****

cp /home/syoung/0.6/install/installedmods.txt /home/syoung/base/notes/apps/cpan/installedmods.txt

   
</entry>


<entry [Wed 2011:03:30 12:54:49 EST] SYSTEM FREEZE syslog>

REPEAT OF THIS IN /var/log/syslog

  Mar 30 12:14:26 hp kernel: [ 2032.563544] xhci_hcd 0000:45:00.0: WARN: short transfer on control ep

http://ubuntuforums.org/showthread.php?t=1648547
SUGGESTS THIS MAY BE DUE TO THE USB - TRY PLUGGING INTO OTHER USB PORT ON THE OTHER SIDE OF THE LAPTOP (EHCI PORTS VS NON-EHCI PORTS)

emacs /var/log/syslog

    Mar 30 12:23:48 hp kernel: [ 2593.288666] udlfb: probe of 3-3:1.0 failed with error -12
    Mar 30 12:24:23 hp kernel: [ 2628.071317] lo: Disabled Privacy Extensions
    Mar 30 12:37:30 hp kernel: [ 3412.420347] e1000e: eth0 NIC Link is Down
    Mar 30 12:37:30 hp vmnetBridge: Removing interface eth0 index:2
    Mar 30 12:37:30 hp NetworkManager[1174]: <info> (eth0): carrier now OFF (device state 8, deferring action for 4 seconds)
    Mar 30 12:37:30 hp kernel: [ 3412.460985] bridge-eth0: disabling the bridge
    Mar 30 12:37:30 hp vmnetBridge: Stopped bridge eth0 to virtual network 0.
    Mar 30 12:37:30 hp kernel: [ 3412.549560] bridge-eth0: down
    Mar 30 12:37:30 hp kernel: [ 3412.549568] bridge-eth0: detached
    Mar 30 12:37:34 hp NetworkManager[1174]: <info> (eth0): device state change: 8 -> 2 (reason 40)
    Mar 30 12:37:34 hp NetworkManager[1174]: <info> (eth0): deactivating device (reason: 40).
    Mar 30 12:37:34 hp NetworkManager[1174]: <info> (eth0): canceled DHCP transaction, DHCP client pid 2771
    Mar 30 12:37:34 hp avahi-daemon[1172]: Withdrawing address record for 10.136.60.245 on eth0.
    Mar 30 12:37:34 hp avahi-daemon[1172]: Leaving mDNS multicast group on interface eth0.IPv4 with address 10.136.60.245.
    Mar 30 12:37:34 hp avahi-daemon[1172]: Interface eth0.IPv4 no longer relevant for mDNS.

    **** REBOOT HERE ****

    Mar 30 12:41:42 hp kernel: imklog 4.2.0, log source = /proc/kmsg started.
    Mar 30 12:41:42 hp rsyslogd: [origin software="rsyslogd" swVersion="4.2.0" x-pid="1110" x-info="http://www.rsyslog.com"] (re)start
    Mar 30 12:41:42 hp rsyslogd: rsyslogd's groupid changed to 103
    Mar 30 12:41:42 hp rsyslogd: rsyslogd's userid changed to 101
    Mar 30 12:41:42 hp rsyslogd-2039: Could no open output file '/dev/xconsole' [try http://www.rsyslog.com/e/2039 ]
    Mar 30 12:41:42 hp avahi-daemon[1138]: Found user 'avahi' (UID 104) and group 'avahi' (GID 109).
    Mar 30 12:41:42 hp avahi-daemon[1138]: Successfully dropped root privileges.



REMOVED USB COMPLETELY WHILE INSTALLING CPAN MODULES


KERNEL LOG AFTER UNPLUGGED USB:
    
    ...
    Mar 30 12:55:42 hp kernel: [  450.752035] /dev/vmnet: open called by PID 1478 (vmnet-bridge)
    Mar 30 12:55:42 hp kernel: [  450.752053] /dev/vmnet: hub 0 does not exist, allocating memory.
    Mar 30 12:55:42 hp kernel: [  450.752100] /dev/vmnet: port on hub 0 successfully opened
    Mar 30 12:55:42 hp kernel: [  450.752136] bridge-eth0: up
    Mar 30 12:55:42 hp kernel: [  450.752143] bridge-eth0: attached
    Mar 30 12:55:46 hp kernel: [  453.339469] /dev/vmmon[0]: HostIF_ReadUptime: detected settimeofday: fixed uptimeBase old 18445442569996177792 new 18445442569995140453 attempts 1
    Mar 30 12:55:54 hp kernel: [  460.960338] eth0: no IPv6 routers present
    Mar 30 12:56:22 hp kernel: [  489.715561] usb 3-3: USB disconnect, address 2
    Mar 30 13:04:11 hp kernel: [  956.825295] lo: Disabled Privacy Extensions

    
    
</entry>

<entry [Wed 2011:03:30 12:03:36 EST] VMWARE DUAL MONITORS>


EDIT .vmx FILE TO INCREASE SCREEN SIZE

svga.maxwidth=3360
svga.maxheight=2100

(TWICE 1680 X 1050)


http://communities.vmware.com/message/305266

Re: Dual monitors


If you have 1024x768 on both monitors, just set the following parameters up in your .vmx:

Re: Dual monitors

svga.maxwidth=2048
svga.maxheight=768

And you'll be able to use both monitors.
 
Works like a champ.
    

</entry>


<entry [Tue 2011:03:29 14:05:24 EST] PURGE BOTH PROPRIETARY AND OPEN SOURCE RADEON DRIVERS>
    
https://wiki.ubuntu.com/X/Troubleshooting/FglrxInteferesWithRadeonDriver#Problem:%20%20Need%20to%20fully%20remove%20-fglrx%20and%20reinstall%20-ati%20from%20scratch
    
    
THERE ARE FILES ALL OVER WHICH ARE NOT INCLUDED IN THE LIST

dpkg -l '*fglrx*'
    
    Desired=Unknown/Install/Remove/Purge/Hold
    | Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-pend
    |/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
    ||/ Name           Version        Description
    +++-==============-==============-============================================
    ii  fglrx          2:8.780-0ubunt Video driver for the ATI graphics accelerato
    ii  fglrx-amdcccle 2:8.780-0ubunt Catalyst Control Center for the ATI graphics
    un  fglrx-control  < none>         (no description available)
    un  fglrx-control- < none>         (no description available)
    ii  fglrx-dev      2:8.780-0ubunt Video driver for the ATI graphics accelerato
    un  fglrx-driver   < none >         (no description available)
    un  fglrx-driver-d < none >         (no description available)
    un  fglrx-kernel-s < none >         (no description available)
    ii  fglrx-modalias 2:8.780-0ubunt Identifiers supported by the ATI graphics dr
    un  xfree86-driver < none >         (no description available)
    un  xfree86-driver < none >         (no description available)
    un  xorg-driver-fg < none >         (no description available)
    un  xorg-driver-fg < none >         (no description available)
    root@hp:/home/syoung# 

locate fglrx

    /etc/X11/xorg.conf.110327-still-unloadmodule-fglrxdrm
    ...
    /usr/lib/fglrx/libaticalcl.so
    /usr/lib/fglrx/libaticaldd.so
    ...
    /var/lib/dpkg/info/fglrx.shlibs

203 FILES IN TOTAL


SOLUTION:

1. THOROUGHLY REMOVE ALL TRACES OF BOTH THE OPEN SOURCE AND PROPRIETARY RADEON DRIVERS
2. REINSTALL THE PROPRIETARY ONE

removes both -fglrx and -ati, and reinstalls the latter:

/usr/share/ati/fglrx-uninstall.sh  
apt-get remove --purge fglrx*
apt-get remove --purge xserver-xorg-video-ati xserver-xorg-video-radeon 
apt-get install xserver-xorg-video-ati
apt-get install --reinstall libgl1-mesa-glx libgl1-mesa-dri xserver-xorg-core
dpkg-reconfigure xserver-xorg

## Optionally, if you want the proprietary fglrx/Catalyst driver to be installable through the Restricted Hardware Driver Manager (a.k.a. jockey), you'll need to:

sudo apt-get install fglrx-modaliases

REBOOTED, GOT GREEN SCREEN.



FOLLOWED STEPS ON noonday:
http://blogg.noonday.se/2010/01/28/linux-usb-video-adapter/


apt-get update; sudo apt-get install libusb-dev xorg-dev build-essential
cd ~/software/drivers/displaylink/udlfb
make; sudo make install; sudo depmod -a
cd ../xf86-video-displaylink
./configure; make; sudo make install


REINSTALLED PROPRIETARY ATI DRIVER:

SYSTEM --> ADDITIONAL DRIVERS --> ACTIVATE

REBOOTED

REGENERATED xorg.conf USING ATI DRIVER:

aticonfig --initial -f


TEST IN NEW X WINDOW
--------------------

startx -- :2 -config /etc/X11/xorg.conf.onworking -logverbose 7 -logfile /var/log/Xorg.onworking.log



    FAILED & HUNG - REBOOTED
    
mknod /dev/fb1 c 29 0
startx -- :2 -config /etc/X11/xorg.conf.radeon-new -logverbose 7 -logfile /var/log/Xorg.radeon-new.log



BUT CAN'T FIND /dev/fb1 EVEN THOUGH ITS THERE.

CHECKED IN /var/log/kern.log AND FOUND conflicting memory types ERROR:

    Mar 29 15:27:05 hp kerznel: [ 1601.309374] Xorg:3193 conflicting memory types c0000000-d0000000 uncached-minus< - >write-combining
    Mar 29 15:27:05 hp kernel: [ 1601.309384] reserve_memtype failed 0xc0000000-0xd0000000, track write-combining, req write-combining
    Mar 29 15:27:05 hp kernel: [ 1601.385341] Xorg:3193 conflicting memory types c0000000-d0000000 uncached-minus< - >write-combining
    Mar 29 15:27:05 hp kernel: [ 1601.385347] reserve_memtype failed 0xc0000000-0xd0000000, track uncached-minus, req uncached-minus


SEEMS TO BE DUE TO X86_PAT BEING ENABLED:

cat /usr/src/linux/.config |grep X86_PAT

    CONFIG_X86_PAT=y



SOLUTION:

Add 'nopat' to kernel boot parameters

    
    
    
</entry>

<entry [Sun 2011:03:27 01:46:30 EST] RETRY USBVGA AFTER REINSTALL UBUNTU>

OPEN SOURCE RADEON DRIVER
https://help.ubuntu.com/community/RadeonDriver

PROBLEM WITH fglrxinfo

fglrxinfo
X Error of failed request:  BadRequest (invalid request code or no such operation)
  Major opcode of failed request:  159 (GLX)
  Minor opcode of failed request:  19 (X_GLXQueryServerString)
  Serial number of failed request:  18
  Current serial number in output stream:  18


REGENERATED xorg.conf USING ATI DRIVER:

aticonfig --initial -f

    Uninitialised file found, configuring.
    Using /etc/X11/xorg.conf
    Saving back-up to /etc/X11/xorg.conf.fglrx-0
    root@hp:/home/syoung# date
    Tue Mar 29 13:19:57 EDT 2011



REINSTALLED ATI CATALYST AND GOT GREEN SCREEN!

TESTING OLD CONFIGS
-------------------

startx -- :2 -config /etc/X11/xorg.2x.conf -logverbose 7 -logfile /var/log/Xorg.2x.log




TESTING INCREMENTAL CHANGES IN TEST xorg.conf.displaylink FILE
--------------------------------------------------------------

startx -- :2 -config /etc/X11/xorg.conf.displaylink5 -logverbose 7 -logfile /var/log/Xorg.displaylink5.log

HUNG



startx -- :2 -config /etc/X11/xorg.conf.displaylink4 -logverbose 7 -logfile /var/log/Xorg.displaylink4.log

ADDED BUS ID TO DEFAULT DEVICE AND CHANGED MONITOR OPTION TO 'DPMS' 'true' (ADDED 'true'):
FAILED TO BOOT. FOUND THAT DEVICE NAME WAS INCORRECT SO CHANGED


startx -- :2 -config /etc/X11/xorg.conf.displaylink3 -logverbose 7 -logfile /var/log/Xorg.displaylink3.log

CRASHED, NOT SURE IF DUE TO CONF OR TO POSSIBLE NON-CLOSED STATE OF TERMINAL 2...


startx -- :2 -config /etc/X11/xorg.conf.displaylink2 -logverbose 7 -logfile /var/log/Xorg.displaylink2.log

HUNG: PURPLE WITH MOUSE IN DISPLAYLINK SCREEN

SAME ERROR AS BEFORE:

    (++) Using config file: "/etc/X11/xorg.conf.displaylink2"
    (==) Using system config directory "/usr/share/X11/xorg.conf.d"
    (EE) GLX error: Can not get required symbols.


RUN DISPLAYLINK ONLY:

startx -- :2 -config /etc/X11/xorg.conf.displaylink -logverbose 7 -logfile /var/log/Xorg.displaylink.log

"GLX error: Can not get required symbols"






TRIED WITH HOPEFULLY WORKING ARCHIVED xorg.conf BUT NO LUCK:

startx -- :2 -config /etc/X11/xorg.conf.110322.triple-testing2 -logverbose 7 -logfile /var/log/Xorg.110322.triple-testing2.log

GOT ERROR 'CMMQS BIOS Control: CMMQS handle is not valid':


startx -- :2 -config /etc/X11/xorg.conf.110322.triple-testing -logverbose 7 -logfile /var/log/Xorg.110322.triple-testing.log

GOT ERROR 'CMMQS BIOS Control: CMMQS handle is not valid':

    Mar 29 12:12:01 hp kernel: [   26.507467] [fglrx:firegl_cmmqs_BIOSControl] *ERROR* CMMQS BIOS Control: CMMQS handle is not valid.


ALSO DUPLICATE 'Default Device':

grep WW /var/log/Xorg.110322.triple-testing.log 

    (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
    [   104.948] (WW) The directory "/usr/share/fonts/X11/cyrillic" does not exist.
    [   107.191] (WW) Falling back to old probe method for displaylink
    [   107.230] (WW) Falling back to old probe method for fglrx
    [   107.235] (WW) fglrx: More than one matching Device section found: Default Device
    [   107.236] (WW) fglrx: No matching Device section for instance (BusID PCI:0@1:0:1) found
    [   107.359] (WW) fglrx(1): board is an unknown third party board, chipset is supported


ERROR IN kern.log:

    Mar 29 12:12:01 hp kernel: [   26.507467] [fglrx:firegl_cmmqs_BIOSControl] *ERROR* CMMQS BIOS Control: CMMQS handle is not valid.


DISPLAYLINK SEEMS OKAY IN syslog:

    Mar 29 12:11:59 hp kernel: [   24.114927] udlfb: DisplayLink Kensington M01063 - serial #000000000001333
    Mar 29 12:11:59 hp kernel: [   24.114931] udlfb: vid_17e9&pid_0036&rev_0103 driver's dlfb_data struct at ffff8801318eb800
    Mar 29 12:11:59 hp kernel: [   24.114933] udlfb: console enable=0
    Mar 29 12:11:59 hp kernel: [   24.114934] udlfb: fb_defio enable=0
    Mar 29 12:11:59 hp kernel: [   24.115175] xhci_hcd 0000:45:00.0: WARN: short transfer on control ep
    Mar 29 12:11:59 hp kernel: [   24.115315] udlfb: vendor descriptor length:22 data:22 5f 01 0020 05 00 01 03 00 04
    Mar 29 12:11:59 hp kernel: [   24.115318] udlfb: DL chip limited to 2360000 pixel modes
    Mar 29 12:11:59 hp kernel: [   24.115368] udlfb: allocated 4 65024 byte urbs
    Mar 29 12:11:59 hp kernel: [   24.229907] udlfb: 1680x1050 valid mode
    Mar 29 12:11:59 hp kernel: [   24.229913] udlfb: 720x400 valid mode
    Mar 29 12:11:59 hp kernel: [   24.229915] udlfb: 640x480 valid mode
    Mar 29 12:11:59 hp kernel: [   24.229918] udlfb: 640x480 valid mode
    Mar 29 12:11:59 hp kernel: [   24.229920] udlfb: 640x480 valid mode
    Mar 29 12:11:59 hp kernel: [   24.229923] udlfb: 640x480 valid mode
    Mar 29 12:11:59 hp kernel: [   24.229925] udlfb: 800x600 valid mode
    Mar 29 12:11:59 hp kernel: [   24.229928] udlfb: 800x600 valid mode
    Mar 29 12:11:59 hp kernel: [   24.229930] udlfb: 800x600 valid mode
    Mar 29 12:11:59 hp kernel: [   24.229932] udlfb: 800x600 valid mode
    Mar 29 12:11:59 hp kernel: [   24.229935] udlfb: 832x624 valid mode
    Mar 29 12:11:59 hp kernel: [   24.229937] udlfb: 1024x768 valid mode
    Mar 29 12:11:59 hp kernel: [   24.229940] udlfb: 1024x768 valid mode
    Mar 29 12:11:59 hp kernel: [   24.229942] udlfb: 1024x768 valid mode
    Mar 29 12:11:59 hp kernel: [   24.229945] udlfb: 1280x1024 valid mode
    Mar 29 12:11:59 hp kernel: [   24.229947] udlfb: 1152x864 valid mode
    Mar 29 12:11:59 hp kernel: [   24.229950] udlfb: 1680x1680 beyond chip capabilities
    Mar 29 12:11:59 hp kernel: [   24.229952] udlfb: 1600x1200 valid mode
    Mar 29 12:11:59 hp kernel: [   24.229955] udlfb: 1440x1440 valid mode
    Mar 29 12:11:59 hp kernel: [   24.229958] udlfb: 1400x1050 valid mode
    Mar 29 12:11:59 hp kernel: [   24.229960] udlfb: 1280x1024 valid mode
    Mar 29 12:11:59 hp kernel: [   24.229963] udlfb: 1280x960 valid mode
    Mar 29 12:11:59 hp kernel: [   24.229965] udlfb: 1152x864 valid mode
    Mar 29 12:11:59 hp kernel: [   24.229969] udlfb: Reallocating framebuffer. Addresses will change!
    Mar 29 12:11:59 hp kernel: [   24.231403] udlfb: 1400x1050 valid mode
    Mar 29 12:11:59 hp kernel: [   24.231408] udlfb: set_par mode 1400x1050
    Mar 29 12:11:59 hp kernel: [   24.235537] udlfb: DisplayLink USB device /dev/fb0 attached. 1400x1050 resolution. Using 5744K framebuffer memory
    Mar 29 12:11:59 hp kernel: [   24.235564] usbcore: registered new interface driver udlfb
    Mar 29 12:11:59 hp kernel: [   24.253129] udlfb: open /dev/fb0 user=1 fb_info=ffff88012ff3d000 count=1
    
BUT syslog SHOWS SAME ERROR WITH fglrx:

    Mar 29 12:12:01 hp kernel: [   26.138334]   alloc irq_desc for 49 on node -1
    Mar 29 12:12:01 hp kernel: [   26.138337]   alloc kstat_irqs on node -1
    Mar 29 12:12:01 hp kernel: [   26.138349] fglrx_pci 0000:01:00.0: irq 49 for MSI/MSI-X
    Mar 29 12:12:01 hp kernel: [   26.138856] [fglrx] Firegl kernel thread PID: 1576
    Mar 29 12:12:01 hp kernel: [   26.138948] [fglrx] Firegl kernel thread PID: 1577
    Mar 29 12:12:01 hp kernel: [   26.139017] [fglrx] Firegl kernel thread PID: 1578
    Mar 29 12:12:01 hp kernel: [   26.139311] [fglrx] IRQ 49 Enabled
    Mar 29 12:12:01 hp kernel: [   26.507350] cfg80211: Found new beacon on frequency: 5180 MHz (Ch 36) on phy0
    Mar 29 12:12:01 hp kernel: [   26.507467] [fglrx:firegl_cmmqs_BIOSControl] *ERROR* CMMQS BIOS Control: CMMQS handle is not valid.
    Mar 29 12:12:01 hp kernel: [   26.507472] [fglrx:firegl_bios_control] *ERROR* CMMQS BIOS Control is failed: firegl_bios_control




SEARCHED THE ERROR:
https://bugs.launchpad.net/ubuntu/+source/initramfs-tools/+bug/392039


POSSIBLE SOLUTION: ADD drm TO THE BLACKLIST

#### DISABLE INTEL DRIVER FOR CORE i5                                           
blacklist intel_ips
blacklist intel_agp
blacklist drm


DO THIS MANUALLY:

sudo modprobe -r i915
sudo modprobe -r drm
modprobe fglrx

RESTARTED AND SAME AS BEFORE *** DID NOT WORK***


    Felix Kuehling wrote on 2009-06-25:	 #2
    Running Ubuntu 9.10 with kernel 2.6.30? I won't even ask how you got as far as you did. ;) But here is what I think the problem is:
    
    Looks like the drm kernel module is loaded. See this message in BootDmesg.txt: "[drm] Initialized drm 1.1.0 20060810". Therefore the fglrx kernel module fails to load later on with "[fglrx:firegl_init_module] *ERROR* firegl_stub_register failed". Without the fglrx module loaded, you won't get DRI.
    
    You need to unload the drm kernel module before fglrx can be loaded.
    
    sam tygier wrote on 2009-06-25:	 #3
    >Running Ubuntu 9.10 with kernel 2.6.30? I won't even ask how you got as far as you did. ;)
    really, i just enabled fglrx in jockey.
    
    drm was in use by i915. i did
    
    sudo modprobe -r i915
    sudo modprobe -r drm
    modprobe fglrx
    
    and restarted X. now moving windows is smooth, and i can enable compiz.
    
    so why is drm getting loaded when fglrx is enabled?
    
    Bryce Harrington on 2009-06-26
    summary:	 - fglrx DRI initialization failed
    + [HD 3600] fglrx DRI initialization failed
    Bryce Harrington wrote on 2009-06-26: Re: [HD 3600] fglrx DRI initialization failed	 #4
    I've posted a new version of the -fglrx driver to our xorg-edgers PPA,
    would you mind testing it either on Jaunty or Karmic and see if it
    resolves this bug?
    
    Get fglrx 8.620 here:
    
      https://edge.launchpad.net/~xorg-edgers/+archive/ppa


0. INSTALLED LATEST VERSION OF ATI CATALYST PROPRIETARY SOFTWARE


cd /home/syoung/software/drivers/ati-driver

http://www2.ati.com/drivers/linux/ati-driver-installer-11-2-x86.x86_64.run

INSTALLED OK.

LOG FILE: /usr/share/ati

ADVANCED CONFIG:

aticonfig

DESKTOP CONFIG:

NEW MENU ITEM:

System --> Preferences --> ATI Catalyst Control Center


GOT DUPLICATE ENTRIES AS BEFORE BUT STILL NO GREEN SCREEN.


    
    
DID REINSTALL OF libdlo AND GOT LATEST DISPLAYLINK DRIVER FROM git:

apt-get install pkg-config xorg-dev


cd ~/git
git clone http://git.plugable.com/webdav/xf-video-udlfb/
cd xf-video-udlfb
./configure
make
sudo make install

THEN TRIED TO RUN WITH xorg.conf.radeon AND GOT THIS ERROR:

tail /var/log/Xorg.
    udlfb: probe of 3-4:1.0 failed with error -12

    
    
    
RE-REINSTALL displaylink:

cd /home/syoung/software/drivers/displaylink/xf86-video-displaylink
./configure
make
make install

    Libraries have been installed in:
       /usr/local/lib/xorg/modules/drivers
    
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
    
    make[2]: Leaving directory `/home/syoung/software/drivers/displaylink/xf86-video-displaylink'
    make[1]: Leaving directory `/home/syoung/software/drivers/displaylink/xf86-video-displaylink'

DESPITE THE ABOVE REINSTALL, KEPT GETTING can't load displaylink ERROR.


FOUND POSSIBLE MISSING displaylink DRIVER:

cd /media/3d6699d4-1c0c-4ed4-a2ad-b8874aee13bf/usr/lib/xorg/modules
diff drivers /usr/lib/xorg/modules/drivers
    Only in drivers: displaylink_drv.so
    Only in /usr/lib/xorg/modules/drivers: nouveau_drv.so
    Binary files drivers/savage_drv.so and /usr/lib/xorg/modules/drivers/savage_drv.so differ

SO COPIED FROM BROKEN DISC TO CURRENT:

cd /media/3d6699d4-1c0c-4ed4-a2ad-b8874aee13bf/usr/lib/xorg/modules
cp drivers/displaylink_drv.so /usr/lib/xorg/modules/drivers


AND REBOOTED

BUT GOT DROPPED DOWN TO SOME GENTOO-LIKE COMMAND PROMPT WITH MESSAGES LIKE

    cat /proc/cmdlist
    cat /proc/modules; ls /dev



SO WENT THE FSARCHIVER ROUTE
----------------------------

BEFORE CONNECTED BROKEN DRIVE;

fsarchiver probe simple
[======DISK======] [=============NAME==============] [====SIZE====] [MAJ] [MIN]
[sda             ] [Hitachi HTS54251               ] [   149.05 GB] [  8] [  0]

[=====DEVICE=====] [==FILESYS==] [======LABEL======] [====SIZE====] [MAJ] [MIN] 
[sda1            ] [ext4       ] [< unknown >        ] [    19.44 GB] [  8] [  1] 
[sda3            ] [ext4       ] [DATA             ] [   123.52 GB] [  8] [  3] 
[sda5            ] [swap       ] [< unknown >        ] [     6.09 GB] [  8] [  5] 


AFTER CONNECTED BROKEN DRIVE:


root@hp:/home/syoung# fsarchiver probe simple
[======DISK======] [=============NAME==============] [====SIZE====] [MAJ] [MIN]
[sda             ] [Hitachi HTS54251               ] [   149.05 GB] [  8] [  0]
[sdb             ] [00BEKT-60PVMT0                 ] [   298.09 GB] [  8] [ 16]

[=====DEVICE=====] [==FILESYS==] [======LABEL======] [====SIZE====] [MAJ] [MIN] 
[sda1            ] [ext4       ] [< unknown>        ] [    19.44 GB] [  8] [  1] 
[sda3            ] [ext4       ] [DATA             ] [   123.52 GB] [  8] [  3] 
[sda5            ] [swap       ] [< unknown>        ] [     6.09 GB] [  8] [  5] 
[sdb1            ] [ext4       ] [< unknown>        ] [    75.28 GB] [  8] [ 17] 
[sdb5            ] [swap       ] [< unknown >        ] [     8.60 GB] [  8] [ 21] 
[sdb6            ] [ext4       ] [< unknown >        ] [   214.20 GB] [  8] [ 22] 


AND THE BROKEN DRIVE PARTITIONS ARE MOUNTED AS FOLLOWS:

df -a

/dev/sdb6             211G  140G   61G  70% /media/39362810-23a0-4f6b-8ea1-aeb32d99c1f7
/dev/sdb1              75G  6.4G   64G  10% /media/3d6699d4-1c0c-4ed4-a2ad-b8874aee13bf


UNMOUNT BROKEN OS AND REMOUNT AS READ-ONLY:

umount /media/3d6699d4-1c0c-4ed4-a2ad-b8874aee13bf
mkdir /mnt/os
mount -o ro,user_xattr,acl /dev/sdb1 /mnt/os

time fsarchiver savefs /home/syoung/ubuntu.brokendrive.110328.fsa /dev/sdb1

    [errno=5, Input/output error]: oper_save.c#189,createar_obj_regfile_unique(): Cannot read data block from /var/spool/gridengine/spooldb/log.0000000001, block=262144 and res=-1
    
    Statistics for filesystem 0
    * files successfully processed:....regfiles=183525, directories=31657, symlinks=37076, hardlinks=529, specials=86
    * files with errors:...............regfiles=1, directories=0, symlinks=0, hardlinks=0, specials=0
    
    real	10m59.881s
    user	5m42.780s
    sys	0m32.600s


BURNT TO DISC AND TRIED TO RESTORE BUT THE BROKEN DISC OS WOULD NOT EVEN BOOT WITH A MINIMAL xorg.conf!

SO TRIED INSTALLING displaylink USING apt-get:

apt-get install xserver-xorg-video-displaylink

WHICH CREATED THESE FILES:

    /usr/lib/xorg/modules/drivers/displaylink_drv.so
    /usr/local/lib/xorg/modules/drivers/displaylink_drv.la
    /usr/local/lib/xorg/modules/drivers/displaylink_drv.so
    /usr/share/doc/xserver-xorg-video-displaylink/README
    /usr/share/doc/xserver-xorg-video-displaylink/changelog.Debian.gz
    /usr/share/doc/xserver-xorg-video-displaylink/changelog.gz
    /usr/share/doc/xserver-xorg-video-displaylink/copyright
    /var/cache/apt/archives/xserver-xorg-video-displaylink_0.3-0ubuntu6_amd64.deb
    /var/lib/dpkg/info/xserver-xorg-video-displaylink.list
    /var/lib/dpkg/info/xserver-xorg-video-displaylink.md5sums


THEN, ADDED THIS TO xorg.conf:

Section "Device"
Identifier "DisplayLinkDevice"
driver "displaylink"
Option "fbdev" "/dev/fb1"
EndSection

Section "Monitor"
Identifier "DisplayLinkMonitor"
EndSection

Section "Screen"
Identifier "DisplayLinkScreen"
Device "DisplayLinkDevice"
Monitor "DisplayLinkMonitor"
SubSection "Display"
Depth 16
Modes "1280x1024"
EndSubSection
EndSection


AND TESTED WITHOUT LOGGING OUT:

startx -- :1 -config /etc/X11/xorg.conf.test

startx -- :1 -config /etc/X11/xorg.conf.test.X.displaylink-stuff -logverbose 7 -logfile /var/log/Xorg.test.log



WITH DISPLAYLINK SCREEN AND VIEWSONIC SCREENS:

startx -- :2 -config /etc/X11/xorg.2x.conf -logverbose 7 -logfile /var/log/Xorg.2x.log


TRIED TO KILL SCREEN AND RERUN BUT GOT THIS ERROR IN /var/log/Xorg.2x.log:

    [  5751.258] _XSERVTransSocketINETCreateListener: ...SocketCreateListener() failed
    [  5751.258] _XSERVTransMakeAllCOTSServerListeners: server already running
    [  5751.258] 
    Fatal server error:
    [  5751.258] Cannot establish any listening sockets - Make sure an X server isn't already running
    ...

SOLUTION: GET THE PID WITH netstat -ln WHERE PORT = 6000 + TERMINAL NUMBER

http://www.x.org/wiki/FAQErrorMessages

    _XSERVTransSocketINETCreateListener: ...SocketCreateListener() failed
    _XSERVTransMakeAllCOTSServerListeners: server already running
    Fatal server error:
    Cannot establish any listening sockets - Make sure an X server isn't already running


    This problem is very similar to the previous one. You will get this message possibly because the lock file was removed somehow or some other program which doesn't create a lock file is already listening on this port. You can check this by doing a netstat -ln. Xservers usually listen at tcp port 6000+< Display Number>, therefore if you have started your Xserver with the command line option :1 it will be listening on port 6001. 
    Please check the article above for further information.

THERE IS INDEED A PROCESS LISTENING AT PORT 6002:

netstat -ln | grep 6002

    tcp        0      0 0.0.0.0:6002            0.0.0.0:*               LISTEN     
    tcp6       0      0 :::6002                 :::*                    LISTEN     

AND THE xinit PROCESS IS SHOWN IN ps aux:

ps aux  | grep /tmp

    root      3407  0.0  0.0  15704   872 ?        S    01:15   0:00 xinit /etc/X11/xinit/xinitrc -- /usr/bin/X :2 -config /etc/X11/xorg.2x.conf -logverbose 7 -logfile /var/log/Xorg.2x.log -auth /tmp/serverauth.DTSDaTEMMk
    root      3408  0.2  4.8 304764 190980 tty8    S< s+ 01:15   0:09 /usr/bin/X :2 -config /etc/X11/xorg.2x.conf -logverbose 7 -logfile /var/log/Xorg.2x.log -auth /tmp/serverauth.DTSDaTEMMk
    root      4774  0.0  0.0  15704   512 pts/1    T    02:17   0:00 xinit /etc/X11/xinit/xinitrc -- /usr/bin/X :2 -config /etc/X11/xorg.2x.conf -logverbose 7 -logfile /var/log/Xorg.2x.log -auth /tmp/serverauth.yBk6N2LMcG
    root      4872  0.0  0.0   8956   876 pts/1    S+   02:27   0:00 grep --color=auto /tmp


SO KILLED USING PIDS AND WAS ABLE TO RESTART USING TERMINAL 2!


THIS IS THE 4-STEP DEBUG PROCESS
--------------------------------

1. START AN X WINDOW IN TERMINAL 2

startx -- :2 -config /etc/X11/xorg.2x.conf -logverbose 7 -logfile /var/log/Xorg.2x.log

2. USE CNTL+ALT+F7 TO RETURN TO CURRENT TERMINAL

3. CHECK LOG FILE, SYSLOG, KERNEL LOG, ETC.:

/var/log/Xorg.2x.log

4. KILL PIDS

ps aux | grep startx
ps aux | grep xinit



USE xorg.conf.3x

startx -- :2 -config /etc/X11/xorg.conf.3x -logverbose 7 -logfile /var/log/xorg.conf.3x.log
    
    ++) Log file: "/var/log/xorg.conf.3x.log", Time: Tue Mar 29 02:48:44 2011
    (++) Using config file: "/etc/X11/xorg.conf.3x"
    (==) Using system config directory "/usr/share/X11/xorg.conf.d"
    (EE) open /dev/fb0: No such file or directory
    (WW) fglrx: No matching Device section for instance (BusID PCI:0@1:0:1) found


USE

startx -- :2 -config /etc/X11/xorg.conf.3x-autogen-hplaptop -logverbose 7 -logfile /var/log/xorg.conf.3x-autogen-hplaptop.log


    (++) Log file: "/var/log/xorg.conf.3x-autogen-hplaptop.log", Time: Tue Mar 29 02:54:50 2011
    (++) Using config file: "/etc/X11/xorg.conf.3x-autogen-hplaptop"
    (==) Using system config directory "/usr/share/X11/xorg.conf.d"
    (EE) open /dev/fb0: No such file or directory
    (WW) fglrx: No matching Device section for instance (BusID PCI:0@1:0:1) found


BUT ALREADY CONTAINS DEVICE SECTION USING PCI ID!!!

    Section "Device"
            Identifier  "Card0"
            Driver      "radeon"
            BusID       "PCI:1:0:0"
    EndSection



RETURN TO NOONDAY TO RECONSTRUCT xorg.conf.test FROM THE BEGINNING:
http://blogg.noonday.se/2010/01/28/linux-usb-video-adapter/

USED RAW COPY FROM PAGE CONTAINING NVIDIA SETUP INFO:

startx -- :2 -config /etc/X11/xorg.conf.nvidia -logverbose 7 -logfile /var/log/xorg.conf.xorg.conf.nvidia.log


EDITED AS xorg.conf.radeon AND RAN:


startx -- :2 -config /etc/X11/xorg.conf.radeon -logverbose 7 -logfile /var/log/xorg.conf.radeon.log



USING xrandr
------------
http://wiki.debian.org/XStrikeForce/HowToRandR12


USE xrandr TO CLOSE AND OPEN SCREENS

xrandr --output LVDS --off
xrandr --output LVDS --auto

WHERE LVDS IS ONE OF THE SCREENS AUTOMATICALLY DETECTED BY xrandr:

xrandr
    Screen 0: minimum 320 x 200, current 1680 x 1050, maximum 2079 x 2100
    LVDS connected 1600x900+0+0 (normal left inverted right x axis y axis) 344mm x 193mm
       1600x900       60.0*+
       1440x900       60.0  
       1280x768       60.0  
       1280x720       60.0  
       1024x768       60.0  
       1024x600       60.0  
       800x600        60.0  
       800x480        60.0  
       640x480        60.0  
    DFP1 disconnected (normal left inverted right x axis y axis)
    DFP2 disconnected (normal left inverted right x axis y axis)
    DFP3 disconnected (normal left inverted right x axis y axis)
    CRT1 connected 1680x1050+0+0 (normal left inverted right x axis y axis) 495mm x 291mm
       1680x1050      60.0*+
       1600x1200      60.0  
       1400x1050      60.0  
       1280x1024      75.0     60.0  
       1440x900       60.0  
       1280x960       60.0  
       1280x800       60.0  
       1152x864       75.0  
       1280x768       60.0  
       1280x720       60.0  
       1024x768       75.0     70.1     60.0  
       1024x600       75.0     70.1     60.0  
       800x600        72.2     75.0     60.3     56.2  
       800x480        72.2     75.0     60.3     56.2  
       640x480        75.0     72.8     67.0     59.9  


With the above xrandr output, you may change the LVDS mode to 1024x768 using:

xrandr --output LVDS --mode 1024x768


The refresh rate may also be changed, either at the same time or independently:

xrandr --output LVDS --mode 1024x768 --rate 75



TRIED A NEW SET OF INSTRUCTIONS:
http://plugable.com/2009/11/16/setting-up-usb-multiseat-with-displaylink-on-linux-gdm-up-to-2-20/

INSTALL THE LATEST udlfb FROM git:

udlfb is in the staging tree of Linux kernels 2.6.32 and later. We'll install the latest version here.

1. INSTALL git

apt-get install git-core
 
2. DOWNLOAD PACKAGE TO ~/git AND INSTALL

mkdir ~/git
cd ~/git
apt-get install module-assistant
module-assistant prepare
git clone http://git.plugable.com/webdav/udlfb/
cd udlfb
make
    make[1]: Leaving directory `/usr/src/linux-headers-2.6.35-28-generic'

make install

    make[1]: Leaving directory `/usr/src/linux-headers-2.6.35-28-generic'


GENERATE modules.dep AND map FILES:

depmod -a


3. PLUG IN DISPLAYLINK DEVICE AND SHOULD SEE GREEN SCREEN -- BUT DON'T!




ANOTHER SET OF INSTRUCTIONS
http://www.wretch.cc/blog/fatalfeel/660093


Refer to Mulchman's Blog

Close displaylink in XP

install libdlo driver:

1. apt-get install libusb-dev

2 ./configure && sudo make install && make check 

CHECK BUS ID:

lspci | grep VGA

    01:00.0 VGA compatible controller: ATI Technologies Inc Madison [Mobility Radeon HD 5000 Series]


1.Setting usb list

2.Attach mouse in vmware(host is meaning xp)

3.
apt-get install libusb-dev xorg-dev build-essential
apt-get install git-core

4.
cd ~/Downloads

5.

wget http://projects.unbit.it/downloads/udlfb-0.2.3_and_xf86-video-displaylink-0.3.tar.gz

6.
tar xzvf udlfb-0.2.3_and_xf86-video-displaylink-0.3.tar.gz
rm -rf udlfb

git clone http://git.plugable.com/webdav/udlfb

7.
cd udlfb

8.
make && make install && depmod -a

9.
cd ../xf86-video-displaylink

10.
Modify xf86-video-displaylink/src/displaylink.c and remark 4 lines:

1)-> //#include "xf86Resources.h"
2)-> //#include "xf86RAC.h"

fPtr->pEnt = xf86GetEntityInfo(pScrn->entityList[0]);

3)-> //pScrn->racMemFlags = RAC_FB | RAC_COLORMAP | RAC_CURSOR | RAC_VIEWPORT;
/* XXX Is this right? Can probably remove RAC_FB */
4)-> //pScrn->racIoFlags = RAC_FB | RAC_COLORMAP | RAC_CURSOR | RAC_VIEWPORT;

./configure && make && make install

11.

emacs /etc/X11/xorg.conf.wretch

############ Original Video Settings ########### 

Section "Device"
Identifier "Configured Video Device"
EndSection

Section "Monitor"
Identifier "Configured Monitor"
EndSection

Section "Screen"
Identifier "Default Screen"
Monitor "Configured Monitor"
Device "Configured Video Device"
SubSection "Display"
Depth 32
Modes "800x600"
EndSubSection
EndSection

################################################# 

Section "ServerLayout"
Identifier "Server Layout"
Screen 0 "DisplayLinkScreen" 0 0
Screen 1 "Default Screen" LeftOf "Default Screen"
EndSection

################################################# 

Section "Files"
ModulePath "/usr/lib/xorg/modules"
ModulePath "/usr/local/lib/xorg/modules"
EndSection

############### DisplayLink Stuff ############### 

Section "Device"
Identifier "DisplayLinkDevice"
driver "displaylink"
Option "fbdev" "/dev/fb1"
EndSection

Section "Monitor"
Identifier "DisplayLinkMonitor"
EndSection

Section "Screen"
Identifier "DisplayLinkScreen"
Device "DisplayLinkDevice"
Monitor "DisplayLinkMonitor"
SubSection "Display"
Depth 32
Modes "1280x1024"
EndSubSection
EndSection


12.gedit /etc/gdm/Init/Default and add 4 lines
gdmwhich () {
COMMAND="$1"
OUTPUT=
IFS=:
for dir in $PATH
do
if test -x "$dir/$COMMAND" ; then
if test "x$OUTPUT" = "x" ; then
OUTPUT="$dir/$COMMAND"
fi
fi
done
IFS=$OLD_IFS
echo "$OUTPUT"
}

1)XRANDR=`gdmwhich xrandr`
2)if [ "x$XRANDR" != "x" ] ; then
3) $XRANDR -o 0
4)fi

sysresources=/etc/X11/Xresources


dmesg | grep fb

SHOULD SEE THIS:

    DisplayLink device attached DisplayLink device attached
    ret control msg 0: 4 1501fffffff0 ret control msg 0: 4 1501fffffff0
    EDID XRES 800 YRES 600 EDID XRES 800 YRES 600
    INIT VIDEO 0 800 480 INIT VIDEO 480 800 0
    INIT VIDEO 1 1024 768 INIT VIDEO 768 1024 1
    INIT VIDEO 2 1280 1024 INIT VIDEO 1024 1280 2
    INIT VIDEO 3 1400 1050 INIT VIDEO 1050 1400 3
    udlfb: probe of XXX:XX failed with error -12 udlfb
    usbcore: registered new interface driver udlfb usbcore: registered new interface driver udlfb
    VMODES initialized VMODES initialized


INSTEAD I SEE THIS BEFORE START WITH xorg.conf.wretch:

dmesg | grep fb

    [    0.000000] ACPI: HPET 00000000bf7fb000 00038 (v01 HPQOEM 1521     00000001 HP   00000001)
    [ 4480.423735] udlfb: probe of 3-4:1.0 failed with error -12
    [ 4480.423767] usbcore: registered new interface driver udlfb
    [11314.293833] udlfb: probe of 3-4:1.0 failed with error -12



NOW AFTER START X WITH xorg.conf.wretch:

startx -- :2 -config /etc/X11/xorg.conf.wretch -logverbose 7 -logfile /var/log/xorg.conf.wretch.log

GET THIS IN syslog:


Mar 29 03:50:13 hp kernel: [11308.851274] usb 3-4: USB disconnect, address 2
Mar 29 03:50:18 hp kernel: [11314.154228] usb 3-4: new high speed USB device using xhci_hcd and address 0
Mar 29 03:50:18 hp kernel: [11314.177352] xhci_hcd 0000:45:00.0: WARN: short transfer on control ep
Mar 29 03:50:18 hp kernel: [11314.178097] xhci_hcd 0000:45:00.0: WARN: short transfer on control ep
Mar 29 03:50:18 hp kernel: [11314.178864] xhci_hcd 0000:45:00.0: WARN: short transfer on control ep
Mar 29 03:50:18 hp kernel: [11314.179611] xhci_hcd 0000:45:00.0: WARN: short transfer on control ep
Mar 29 03:50:18 hp kernel: [11314.179864] usb 3-4: ep 0x82 - rounding interval to 8 microframes
Mar 29 03:50:18 hp kernel: [11314.181030] DisplayLink device attached
Mar 29 03:50:18 hp kernel: [11314.181360] ret control msg 0: 4 1400fffffff1
Mar 29 03:50:18 hp kernel: [11314.293817] EDID XRES 1680 YRES 1050
Mar 29 03:50:18 hp kernel: [11314.293820] INIT VIDEO 0 800 480
Mar 29 03:50:18 hp kernel: [11314.293821] INIT VIDEO 1 1024 768
Mar 29 03:50:18 hp kernel: [11314.293822] INIT VIDEO 2 1280 1024
Mar 29 03:50:18 hp kernel: [11314.293823] INIT VIDEO 3 1400 1050
Mar 29 03:50:18 hp kernel: [11314.293833] udlfb: probe of 3-4:1.0 failed with error -12
Mar 29 04:04:18 hp acpid: client connected from 8989[0:0]
Mar 29 04:04:18 hp acpid: 1 client rule loaded
Mar 29 04:04:19 hp kernel: [12152.970011] Assertion failed in ../../../../../../../../drivers/2d/lnx/fgl/drm/kernel/hal_evergreen.c at line: 64
Mar 29 04:04:20 hp acpid: client 4240[0:0] has disconnected
Mar 29 04:04:20 hp acpid: client 8989[0:0] has disconnected
Mar 29 04:04:20 hp acpid: client connected from 4240[0:0]
Mar 29 04:04:20 hp acpid: 1 client rule loaded


It's mean Resolution and Depth in /etc/X11/xorg.conf setting error










    
INSTALL ATI RADEON PROPRIETARY DRIVER
-------------------------------------
https://help.ubuntu.com/community/BinaryDriverHowto/ATI

DOWNLOADED TO HERE:

/home/syoung/software/drivers/ati-radeon-HD5000

BUT DID NOT INSTALL, INSTEAD USED UBUNTU TOOLS TO INSTALL:

1. ENABLE "Source Code" REPOSITORY IN Synaptic Package Manager

2. System -> Administration -> Additional Drivers

    REBOOT --> OK


CHECK MONITOR SETTINGS

xrandr -q
    
    Screen 0: minimum 320 x 200, current 2066 x 1668, maximum 8192 x 8192
    LVDS connected 1600x900+466+768 (normal left inverted right x axis y axis) 0mm x 0mm
       1600x900       60.0*+
       1440x900       59.9     59.9  
       1280x854       59.9  
       1360x768       59.8  
       1280x800       59.8  
       1152x864       60.0  
       1280x720       59.9  
       1152x768       59.8  
       1024x768       60.0     59.9  
       800x600        60.3     59.9  
       848x480        59.7  
       720x480        59.7  
       640x480        59.9     59.4  
    DisplayPort-0 disconnected (normal left inverted right x axis y axis)
    DisplayPort-1 disconnected (normal left inverted right x axis y axis)
    DisplayPort-2 disconnected (normal left inverted right x axis y axis)
    VGA-0 connected 1360x768+0+0 (normal left inverted right x axis y axis) 0mm x 0mm
       1360x768       59.8* 
       1152x864       60.0  
       1024x768       60.0  
       800x600        60.3  
       640x480        59.9  


SETTINGS FOR LAPTOP MONITOR (SPONTANEOUSLY WRITTEN TO /var/log/Xorg.0.log):
    
[  2323.569] (II) fglrx(0): EDID vendor "AUO", prod id 494
[  2323.569] (II) fglrx(0): Printing DDC gathered Modelines:
[  2323.569] (II) fglrx(0): Modeline "1600x900"x0.0  107.80  1600 1664 1706 1970  900 903 906 912 -hsync -vsync (54.7 kHz)    


GENERATE NEW xorg.conf WITH Xorg -configure:

CTL+SHIFT+F1
service gdm stop
Xorg -configure

CREATES THIS FILE:

/root/xorg.conf.new

SAVED TO:

xorg.conf.new-autogenerated.hplaptop.3 monitors

WHICH CONTAINS THE FOLLOWING LAPTOP MONITOR CONFIGURATION INFO:


    Section "Monitor"
            Identifier   "Monitor0"
            VendorName   "AUO"
            ModelName    "1ee"
    EndSection
    
    Section "Device"
            Identifier  "Card0"
            Driver      "radeon"
            BusID       "PCI:1:0:0"
    EndSection
    
    Section "Screen"
            Identifier "Screen0"
            Device     "Card0"
            Monitor    "Monitor0"
            SubSection "Display"
                    Viewport   0 0
                    Depth     1
            EndSubSection
            SubSection "Display"
                    Viewport   0 0
                    Depth     4
            EndSubSection
            SubSection "Display"
                    Viewport   0 0
                    Depth     8
            EndSubSection
            SubSection "Display"
                    Viewport   0 0
                    Depth     15
            EndSubSection
            SubSection "Display"
                    Viewport   0 0
                    Depth     16
            EndSubSection
            SubSection "Display"
                    Viewport   0 0
                    Depth     24
            EndSubSection
    EndSection




1. CONFIRM libusb IS INSTALLED

dpkg -l | grep usb

    OK - SAME AS BEFORE 

SEE [Tue 2011:03:22 14:32:47 EST] RECRACK USBVGA


GOOGLE SEARCH FOR "failed to get i195 symbols, turbo graphics disabled"

https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-intel/+bug/590504

Bug Description

The new Intel processors have the graphics card integrated on themselves. As it turns out, current stable ubutnu (10.04) with all updates applied cannot boot with this graphics adapter,.

The only working solution as of now is to: set Xorg driver to vesa and pass i915.modeset=0 parameter to kernel in grub.

It is possible to use x-updates ppa to get newer intel driver, which allows to use external monitor, however, if one doesn't connect external monitor to the computer, the system won't boot. So, the workaround is the only solution for a notebook at the moment

Seems that a newer kernel (branch 2.6.33 at minimum) and new intel driver are both needed to get this work properly. The current Maverick Meerkat alpha fails to boot as well.

 I found a bug on LP related to this, but reported only with new MacBooks and it's connected with ATI driver. I think that this bug probably affects all notebooks which use Core i5 and it's integrated graphics chip. Confirmed on 2 different Lenovo models and a Dell laptop.



ADDED TO

emacs -nw /etc/modprobe.d/blacklist.conf

LINES:

blacklist intel_ips
blacklsit intel_agp

(PRESENT IN WORKING 3-MONITOR SETUP BEFORE HARDDISC FAILURE)


INSTALL DISPLAYLINK DRIVER
--------------------------

1. INSTALL REQUIRED DEPENDENCIES

sudo apt-get install libusb-dev
    OK


2. INSTALL dlo LIBRARY (**ALREADY DOWNLOADED**)

**** Plug in a DisplayLink USB device ****

cd /home/syoung/software/drivers/displaylink
wget http://people.freedesktop.org/~berniet/libdlo-0.1.2.tar.gz
tar xvfz *
cd libdlo-0.1.2
./configure
sudo make
sudo make install
make check

    OK - SHOWS VARIOUS PATTERNS
    ...
    test: release &238B9D0...
    test: final...
    test: finished.
    PASS: test/test1
    =============
    1 test passed
    =============
    make[2]: Leaving directory `/home/syoung/software/drivers/displaylink/libdlo-0.1.2'
    make[1]: Leaving directory `/home/syoung/software/drivers/displaylink/libdlo-0.1.2'


2. INSTALL DISPLAYLINK DRIVER

wget http://projects.unbit.it/downloads/udlfb-0.2.3_and_xf86-video-displaylink-0.3.tar.gz

DOWNLOADED TO HERE:
/home/syoung/software/drivers/displaylink/udlfb-0.2.3_and_xf86-video-displaylink-0.3.tar.gz

INSTALL

cd /home/syoung/software/drivers/displaylink
tar xvfz Desktop/udlfb-0.2.3_and_xf86-video-displaylink-0.3.tar.gz
cd udflb
make
make install

    make[1]: Entering directory `/usr/src/linux-headers-2.6.35-28-generic'
      INSTALL /home/syoung/software/drivers/displaylink/udlfb/udlfb.ko
      DEPMOD  2.6.35-28-generic
    make[1]: Leaving directory `/usr/src/linux-headers-2.6.35-28-generic'

REGENERATE LIST OF MODULES (PROBE ALL MODULES) IN /lib/modules/2.6.35-28-generic/modules.symbols
:


depmod -a


FIX displaylink.c FILE BEFORE MAKE:
http://permalink.gmane.org/gmane.comp.freedesktop.libdlo/334

    diff -Nu displaylink.c.orig displaylink.c
    --- displaylink.c.orig	2009-06-11 02:38:15.000000000 +1200
    +++ displaylink.c	2010-05-02 16:16:56.000000000 +1200
    @@ -46,9 +46,6 @@
    
     #include "fb.h"
    
    -#include "xf86Resources.h"
    -#include "xf86RAC.h"
    -
     #include "fbdevhw.h"
    
     
    @@ -282,10 +279,6 @@
    
            fPtr->pEnt = xf86GetEntityInfo(pScrn->entityList[0]);
    
    -	pScrn->racMemFlags = RAC_FB | RAC_COLORMAP | RAC_CURSOR | RAC_VIEWPORT;
    -	/* XXX Is this right?  Can probably remove RAC_FB */
    -	pScrn->racIoFlags = RAC_FB | RAC_COLORMAP | RAC_CURSOR | RAC_VIEWPORT;
    -
            /* open device */
            if (!fbdevHWInit(pScrn,NULL,xf86FindOptionValue(fPtr->pEnt->device->options,"fbdev")))
                    return FALSE;
    @@ -545,8 +538,6 @@
    
            xf86DPMSInit(pScreen, fbdevHWDPMSSetWeak(), 0);
    
    -	xf86CrtcScreenInit (pScreen);
    -
            pScreen->SaveScreen = fbdevHWSaveScreenWeak();
    
            /* Wrap the current CloseScreen function */


cd ../xf86-video-displaylink
./configure
make
sudo make install

    Libraries have been installed in:
       /usr/local/lib/xorg/modules/drivers



NB: AFTER RELOAD, EXPECT /var/log/Xorg.0.log TO CONTAIN THIS:
(FROM Notes-drivers-displaylink.txt)


    (II) LoadModule: "displaylink"
    (II) Loading /usr/lib/xorg/modules/drivers/displaylink_drv.so
    (II) Module displaylink: vendor="X.Org Foundation"
            compiled for 1.7.6, module version = 0.0.1
            ABI class: X.Org Video Driver, version 6.0



REBOOTED BUT WOULD NOT FIND displaylink DRIVER UNLESS ModulePath SPECIFIED IN xorg.conf:
    
    Section "Files"
            ModulePath      "/usr/lib/xorg/modules"
            ModulePath      "/usr/local/lib/xorg/modules"
    EndSection


BUT THEN GOT ERROR WITH Fire GL DRM library:

    Can't load Fire GL DRM library (libfglrxdrm.so)
    UnloadModule: fglrxdrm
    open /dev/fb0 : no such file or direcotry
    ...
    Warning: Couldn't open module fglrxdrm
    UnloadModule: fglrx
    UnloadModule: vgdhw
    
    Screens found but none have a usable configuration
    
DID locate ON libfglrxdrm:

    /usr/lib/fglrx/xorg/modules/linux/libfglrxdrm.so



SO LINKED IT TO COMMONLY USED LIB DIR:

ll /usr/local/lib/xorg/modules/drivers/
total 148
drwxr-xr-x 2 root root   4096 2011-03-27 04:23 ./
drwxr-xr-x 3 root root   4096 2011-03-27 04:23 ../
-rwxr-xr-x 1 root root    993 2011-03-27 04:23 displaylink_drv.la*
-rwxr-xr-x 1 root root 135473 2011-03-27 04:23 displaylink_drv.so*

ln -s /usr/lib/fglrx/xorg/modules/linux/libfglrxdrm.so /usr/local/lib/xorg/modules/drivers/libfglrxdrm.so

BUT STILL DIDN'T WORK.

SO WENT BACK TO LAST WORKING CONFIGURATION ON BROKEN HARD DISC AND FOUND THAT NEITHER displaylink_drv.so NOR libfglrxdrm.so ARE PRESENT. SO REMOVED THESE FROM CURRENT SETUP AND SUBSTITUTED IN LAST (HOPEFULLY WORKING) FROM BROKEN DISC:

cp /etc/X11/xorg.3xv2 /etc/X11/xorg.conf

mv /usr/local/lib/xorg /usr/local/lib/xorg.bkp


AND LOGGED BACK IN. TWO SCREENS AS NORMAL BUT RIGHT SCREEN IS DARK.

emacs /var/log/Xorg.0.log

fglrxdrm LOAD OKAY:

    [   671.539] (II) Loading sub module "fglrxdrm"
    [   671.539] (II) LoadModule: "fglrxdrm"
    [   671.539] (II) Loading /usr/lib/xorg/extra-modules/modules/linux/libfglrxdrm.so
    [   671.539] (II) Module fglrxdrm: vendor="FireGL - ATI Technologies Inc."
    [   671.539] 	compiled for 1.8.99.905, module version = 8.78.30

BUT DISPLAYLINK DRIVER DIDN'T LOAD

    [   671.524] (II) Loading extension DRI2
    [   671.524] (II) LoadModule: "displaylink"
    [   671.525] (WW) Warning, couldn't open module displaylink
    [   671.525] (II) UnloadModule: "displaylink"
    [   671.525] (EE) Failed to load module "displaylink" (module does not exist, 0)
    [   671.525] (II) LoadModule: "fglrx"


SO REPLACED displaylink_drv.so AND MOVED ONLY libfglrxdrm.so IN /usr/local/lib/xorg:

mv /usr/local/lib/xorg.bkp /usr/local/lib/xorg

cd /usr/local/lib/xorg/modules/drivers
mv libfglrxdrm.so libfglrxdrm.so.bkp




</entry>


<entry [Fri 2011:03:25 15:34:41 EST] INSTALLED OPSCODE REQUIREMENTS>
    
http://help.opscode.com/kb/start/1-system-requirements-dependencies

http://www.opscode.com/blog/2010/07/01/new-apt-repository-for-chef-0-9/

1. INSTALL RUBY AND RUBYGEMS
Ruby 1.8.5, 1.8.6, 1.8.7, 1.9.1 or 1.9.2 with SSL bindings is required.
https://gist.github.com/862659
#### sudo aptitude install ruby ruby-dev rubygems irb libopenssl-ruby libxml2-dev libxslt1-dev git-core
#### gem install chef fog highline net-ssh-multi
#### export PATH=/home/jtimberman/.gem/ruby/1.8/bin:$PATH

apt-get install ruby
    OK

ruby -v
    ruby 1.8.7 (2010-06-23 patchlevel 299) [x86_64-linux]


Rubygems
Version 1.3.5 or greater. On Ubuntu and Debian Rubygems should be installed from source.
http://rubygems.org/pages/download

mkdir -p /home/syoung/software/ruby/archive
cd /home/syoung/software/ruby/archive
wget http://production.cf.rubygems.org/rubygems/rubygems-1.6.2.tgz
tar xvfz rubygems-1.6.2.tgz
cd rubygems-1.6.2
ruby setup.rb
    RubyGems 1.6.2 installed
    RubyGems installed the following executables:
            /usr/bin/gem1.8


2. INSTALL OPSCODE CLIENT AND SERVER USING apt-get
https://gist.github.com/862659

SUMMARY:
echo 'deb http://apt.opscode.com/ lucid main' | tee /etc/apt/sources.list.d/opscode.list
wget -qO - http://apt.opscode.com/packages@opscode.com.gpg.key | apt-key add -
apt-get update
apt-get install chef libfog-ruby libnet-ssh-multi-ruby libhighline-ruby
update-rc.d chef-client disable 

NB: The Opscode Platform is compatible with chef-client v0.9.0 and greater. Older clients need to be upgraded before connecting.


1. Add the Opscode APT Repository
(NB: Use lucid on Maverick)

Create /etc/apt/sources.list.d/opscode.list:
http://wiki.opscode.com/display/chef/Package+Installation+on+Debian+and+Ubuntu

echo "deb http://apt.opscode.com/ lucid main" > /etc/apt/sources.list.d/opscode.list


2. ADD THE Opscode GPG KEY TO apt

wget -qO - http://apt.opscode.com/packages@opscode.com.gpg.key | sudo apt-key add -
sudo apt-get update
    OK
    

3. INSTALL THE chef CLIENT

apt-get install chef libfog-ruby libnet-ssh-multi-ruby libhighline-ruby


INSTALL OPTIONAL PACKAGES:

apt-get install libopenssl-ruby ruby-dev build-essential
    OK

    ...    
    Setting up libruby (4.5) ...
    Setting up ruby1.8-dev (1.8.7.299-2) ...
    Setting up ruby-dev (4.5) ...



SET CHEF SERVER URL:

    http://www.aguadev.org:4000

    Creating config file /etc/chef/client.rb with new version
     * Starting chef-client  chef-client 


DETAILS OF SUPPORTING PACKAGES:

REQUIRED PACKAGES
The following packages are required to use Knife sub-commands:

libnet-ssh-multi-ruby - for knife ssh.
libhighline-ruby - for knife ssh, knife bootstrap and cloud computing commands
libfog-ruby - for cloud computing commands.

OPTIONAL PACKAGES

libopenssl-ruby - if the chef-server has SSL (like the Opscode Platform), this is required.
ruby-dev and build-essential - required to build gems that have native extensions from source with gem_package



4. INSTALL THE chef SERVER
http://www.opscode.com/blog/2010/07/01/new-apt-repository-for-chef-0-9/

ENABLE UNIVERSE IN Synaptic Package Manager

    OK

INSTALL gecode

apt-get install libgecode-dev
apt-get install libgecode27
    OK

ADD THIS LINE TO lib/rubygems/specification.rb (SEE NOTES FOR WHY):

emacs /home/syoung/software/ruby/archive/rubygems-1.6.2/lib/rubygems/specification.rb

    require 'rubygems/user_interaction'
    

INSTALL chef-server INCLUDING API and WebUI:

apt-get install chef chef-server


CHEF SERVER URL:
http://www.aguadev.org:4000

rabbitmq CONSUMER PASSWORD:
a*

WEB UI ADMIN PASSWORD:
a*



NOTES
-----

PROBLEM:

FAILS WITH ERROR:

/usr/lib/ruby/1.8/rubygems/remote_fetcher.rb:14: uninitialized constant Gem::UserInteraction (NameError)
    from /usr/local/lib/site_ruby/1.8/rubygems/custom_require.rb:36:in `gem_original_require'
    from /usr/local/lib/site_ruby/1.8/rubygems/custom_require.rb:36:in `require'


SOLUTION:

Date: 2011-02-04 04:24
Sender: Torsten Schönebaum

Adding
require 'rubygems/user_interaction'
to lib/rubygems/specification.rb solves this issue for me.

emacs /home/syoung/software/ruby/archive/rubygems-1.6.2/lib/rubygems/specification.rb

   
INSTALLING chef-server    
----------------------

You will be prompted by debconf for the Chef Server URL. Put in a value like "http://chef.example.com:4000". You will also be prompted for the rabbitmq consumer password and the webui admin password.

This will:

    Install all the dependencies for Chef Server, including Merb, CouchDB, RabbitMQ, etc.
    Starts CouchDB (via the couchdb package).
    Starts RabbitMQ (via the rabbitmq-server package).
    Start chef-server-api via /etc/init.d/chef-server, running a merb worker on port 4000
    Start chef-server-webui via /etc/init.d/chef-server-webui, running a merb worker on port 4040
    Start chef-solr-indexer via /etc/init.d/chef-solr-indexer, connecting to the rabbitmq-server
    Start chef-solr via /etc/init.d/chef-solr, using the distro package for solr-jetty
    Start chef-client via /etc/init.d/chef-client
    Add configuration files in /etc/chef for the client, server, solr/solr-indexer and solo
    Create all the correct directory paths per the configuration files

NB: If you do not want the webui installed, install the chef-server-api package only.

sudo apt-get install chef chef-server-api

This does the same as above without the chef-server-webui service.

</entry>


<entry [Fri 2011:03:25 15:18:18 EST] INSTALL MYSQL AND LOAD agua DATABASE>

1. INSTALL MYSQL

apt-get install mysql-server

2. CREATE agua DATABASE

mysql -u root -p < /home/syoung/0.6/bin/sql/createDb.sql

3. ADD agua USER

mysql -u root -p < /home/syoung/0.6/bin/sql/createAguaUser.sql

4. LOAD agua DATA

mysql -u root -p agua < /home/syoung/0.6/bin/sql/dump/agua-110230.dump

#### EXPORT DATA TO DUMP FILE
mysqldump -u root -p agua > /home/syoung/0.6/bin/sql/dump/agua-110230.dump




NOTES
-----

PREPARE FILES:

grep -v INSERT /home/syoung/0.6/bin/sql/dump/agua-110212.dump | grep -v "/\*" > /home/syoung/0.6/bin/sql/dump/agua-110212.create.dump

(THEN CLEANED UP ' SYMBOLS)

grep INSERT /home/syoung/0.6/bin/sql/dump/agua-110212.dump > /home/syoung/0.6/bin/sql/dump/agua-110212.insert.dump

</entry>

<entry [Fri 2011:03:25 14:05:08 EST] CONFIGURE APACHE>
    
1. UNCOMMENT IN /etc/apache2/apache2.conf TO MAKE SURE THAT THE SERVER ROOT IS SET AS THE INSTALLATION DIRECTORY:

#ServerRoot "/etc/apache2"
ServerRoot "/etc/apache2"


2. RESTART APACHE:

/etc/init.d/apache2 restart


3. LINK DIRECTORIES

ln -s /home/syoung/0.6/html /var/www/html/agua/0.6
ln -s /home/syoung/0.6/cgi-bin /var/www/cgi-bin/agua/0.6

AND CGI DIRS:

ln -s /home/syoung/0.6/lib /var/www/cgi-bin/agua/0.6/lib
ln -s /home/syoung/0.6/conf /var/www/cgi-bin/agua/0.6/conf
ln -s /home/syoung/0.6/bin/sql /var/www/cgi-bin/agua/0.6/s  


4. SET PERMISSIONS
(MAKE SURE THAT ALL THE LINKED DIRECTORIES ARE ACCESSIBLE TO www-data)

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

OPEN UP lib AND OTHER DIRS
cd /home/syoung/0.6
find ./lib -type d -exec chmod 0775 {} \;;
find ./lib -type f -exec chmod 0644 {} \;


SET UP cgi-bin
--------------

1. REPLACE mpm-worker WITH mpm-prefork (Non-threaded) CGI DAEMON TO AVOID THIS:

    'unable to connect to cgi daemon'

apt-get install apache2
apt-get install apache2-mpm-prefork

(OR USE SYNAPTIC)


2. FIXED PATH TO CGI-BIN IN /etc/apache2/sites-available FILE:

#       ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/
#       < Directory "/usr/lib/cgi-bin">
        ScriptAlias /cgi-bin/ /var/www/cgi-bin/
        < Directory "/var/www/cgi-bin">
                AllowOverride None
                Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch
                Order allow,deny
                Allow from all
        < /Directory>


FOR DEBUGGING, CHANGE www-data SHELL TO BASH
--------------------------------------------

EDIT /etc/passwd

#www-data:x:33:33:www-data:/var/www:/bin/sh
www-data:x:33:33:www-data:/var/www:/bin/bash



</entry>


<entry [Tue 2011:03:22 14:32:47 EST] FIXED WINDOW RESIZING >

Ubuntu Software Center --> Install compiz advanced desktop effects settings (ccsm)


DESKTOP --> CHANGE DESKTOP BACKGROUND --> THEME --> CLEARLOOK

RIGHTCLICK ON DESKTOP --> VISUAL EFFECTS --> NONE

</entry>

<entry [Tue 2011:03:22 14:32:47 EST] RECRACK USBVGA>

MONITOR SPECIFICATIONS
----------------------
http://salestores.com/viewso61.html

VIEWSONIC 2235WM 22"

Display & Graphics
Resolution	 1680 x 1050 Optimum Resolution
Maximum Resolution	 1680 x 1050
Mac Compatible Modes	 1680 x 1050
Scanning Frequencies	30 kHz to 82 kHz Horizontal
50 Hz to 85 Hz Vertical
Contrast Ratio	 700:1
Brightness	 280 Nit

VGA CARD SPECIFICATIONS
-----------------------
elitebook LAPTOP HAS FirePro M5800 (Mobility Radeon HD5000 Series) VGA CARD

lspci | grep VGS

    01:00.0 VGA compatible controller: ATI Technologies Inc Madison [Mobility Radeon HD 5000 Series]



0. INSTALLED LATEST VERSION OF ATI CATALYST PROPRIETARY SOFTWARE

http://www2.ati.com/drivers/linux/ati-driver-installer-11-2-x86.x86_64.run

INSTALLED OK.

LOG FILE: /usr/share/ati

ADVANCED CONFIG:

aticonfig

DESKTOP CONFIG:

NEW MENU ITEM:

System --> Preferences --> ATI Catalyst Control Center



BUT SLOW. UNINSTALL:

sudo apt-get remove fglrx
    
    NOT RUN YET




SEARCHED ubuntu usbvga


1. CONFIRM libusb IS INSTALLED

dpkg -l | grep usb

    ii  libusb-0.1-4                         2:0.1.12-15ubuntu2
    userspace USB programming library
    ii  libusb-1.0-0                         2:1.0.8-2                                         userspace USB programming library
    ii  libusb-dev                           2:0.1.12-15ubuntu2                                userspace USB programming library development files
    ii  libusbmuxd1                          1.0.4-1                                           USB multiplexor daemon for iPhone and iPod Touch devices - library
    ii  usb-creator-common                   0.2.25                                            create a startup disk using a CD or disc image (common files)
    ii  usb-creator-gtk                      0.2.25                                            create a startup disk using a CD or disc image (for GNOME)
    ii  usb-modeswitch                       1.1.4-1                                           mode switching tool for controlling "flip flop" USB devices
    ii  usb-modeswitch-data                  20100826-1                                        mode switching data for usb-modeswitch
    ii  usbmuxd                              1.0.4-1                                           USB multiplexor daemon for iPhone and iPod Touch devices
    ii  usbutils                             0.87-4                                            Linux USB utilities
    ii  xserver-xorg-video-sisusb            1:0.9.4-0ubuntu1                                  X.Org X server -- SiS USB display driver



2. EDIT

/etc/gdm/Init/Default

ADD THIS after the defintion of the gdmwhich() function:

XRANDR=`gdmwhich xrandr`
if [ "x$XRANDR" != "x" ] ; then
  $XRANDR -o 0
fi



3. ADD SECTIONS TO xorg.conf

CURRENT xorg.conf CONTENTS:

em /etc/X11/xorg.conf
    
    Section "Screen"
            Identifier      "Default Screen"
            DefaultDepth    24
            SubSection "Display"
                    Virtual 2048 2048
            EndSubSection
    EndSection
    
    Section "Module"
            Load    "glx"
    EndSection
    
    Section "Device"
            Identifier      "Default Device"
            Driver  "fglrx"
    EndSection


WHERE

fglrx IS A 'Video driver for ATI graphics accelerators'

glx IS A DISPLAY SETTING UTILITY

    glxinfo
        The program 'glxinfo' is currently not installed.  You can install it by typing:
        apt-get install mesa-utils




GET DEVICE LOCATION:

ls /dev/fb*
    /dev/fb0

EDIT TO LOOK LIKE THIS:

em /etc/X11/xorg.conf


#### register the screen with the ServerLayout:


Section "ServerLayout"
    Identifier     "Nvidia-Layout"
    Screen	0  "DisplayLinkScreen" 0 0
    Screen      1  "Primary-Screens" LeftOf "DisplayLinkScreen"

    InputDevice    "Keyboard0" "CoreKeyboard"
    InputDevice    "Mouse0" "CorePointer"
    Option         "Xinerama" "off"
EndSection

#### add the DisplayLink device, monitor and screen to the file

############### DisplayLink Screen ###############                                                                 
Section "Device"
        Identifier      "DisplayLinkDevice"
        driver          "displaylink"
        Option  "fbdev" "/dev/fb0"
EndSection

Section "Monitor"
        Identifier      "DisplayLinkMonitor"
EndSection

Section "Screen"
        Identifier      "DisplayLinkScreen"
	Device          "DisplayLinkDevice"
        Monitor         "DisplayLinkMonitor"
        SubSection "Display"
    		#Virtual     1280 1024
                Depth   24
		Modes   "1280x1024" "1024x768" "800x600"
        EndSubSection
EndSection



Section "Screen"
        Identifier      "Default Screen"
        DefaultDepth    24
        SubSection "Display"
                Virtual 2048 2048
        EndSubSection
EndSection

Section "Module"
        Load    "glx"
EndSection

Section "Device"
        Identifier      "Default Device"
        Driver  "fglrx"
EndSection


Section "Monitor"
Identifier "VX2235wm"
Option "DPMS"
EndSection

Section "Screen"

    Identifier "Primary-Screens"
    Device "Default Device"
    Monitor "VX2235wm"
    DefaultDepth 24
    SubSection "Display"
        Depth 1
        Modes "1680x1050" "1600x1200" "1440x1440" "1400x1050" "1280x1024" "1280x960" "1152x864" "1024x768" "832x624" "800x600" "720x400" "640x480"
    EndSubSection
    SubSection "Display"
        Depth 4
        Modes "1680x1050" "1600x1200" "1440x1440" "1400x1050" "1280x1024" "1280x960" "1152x864" "1024x768" "832x624" "800x600" "720x400" "640x480"
    EndSubSection
    SubSection "Display"
        Depth 8
        Modes "1680x1050" "1600x1200" "1440x1440" "1400x1050" "1280x1024" "1280x960" "1152x864" "1024x768" "832x624" "800x600" "720x400" "640x480"
    EndSubSection
    SubSection "Display"
        Depth 15
        Modes "1680x1050" "1600x1200" "1440x1440" "1400x1050" "1280x1024" "1280x960" "1152x864" "1024x768" "832x624" "800x600" "720x400" "640x480"
    EndSubSection
    SubSection "Display"
        Depth 16
        Modes "1680x1050" "1600x1200" "1440x1440" "1400x1050" "1280x1024" "1280x960" "1152x864" "1024x768" "832x624" "800x600" "720x400" "640x480"
    EndSubSection
    SubSection "Display"
        Depth 24
        Modes "1680x1050" "1600x1200" "1440x1440" "1400x1050" "1280x1024" "1280x960" "1152x864" "1024x768" "832x624" "800x600" "720x400" "640x480"
    EndSubSection
EndSection


#Section "Screen"
#    Identifier     "Primary-Screens"
#    Device         "nvidia-vga"
#    Monitor        "Dell-Monitor"
#    DefaultDepth    24
#    Option         "TwinView" "1"
#    Option         "TwinViewXineramaInfoOrder" "DFP-0"
#    Option         "metamodes" "CRT: nvidia-auto-select +0+0, DFP: nvidia-auto-select +1280+0"
#    SubSection     "Display"
#        Depth       24
#    EndSubSection
#EndSection
#






LOGOUT AND BACK IN:


lspci  | grep VGA
01:00.0 VGA compatible controller: ATI Technologies Inc Madison [Mobility Radeon HD 5000 Series]
syoung@hplaptop:~$ dmesg | grep intel
[    1.382891] intel_idle: MWAIT substates: 0x1120
[    1.382892] intel_idle: v0.4 model 0x25
[    1.382893] intel_idle: lapic_timer_reliable_states 0xffffffff
[    1.383902] ACPI: acpi_idle yielding to intel_idle
[   11.167902] intel ips 0000:00:1f.6: Warning: CPU TDP doesn't match expected value (found 25, expected 35)
[   11.167938] intel ips 0000:00:1f.6: PCI INT C -> GSI 18 (level, low) -> IRQ 18
[   11.168086] intel ips 0000:00:1f.6: failed to get i915 symbols, graphics turbo disabled
[   11.250942] intel ips 0000:00:1f.6: IPS driver initialized, MCP temp limit 65535
[   19.614265] hda-intel: IRQ timing workaround is activated for card #1. Suggest a bigger bdl_pos_adj.

Section "Screen"
    Identifier     "Primary-Screens"
    Device         "nvidia-vga"
    Monitor        "Dell-Monitor"
    DefaultDepth    24
    Option         "TwinView" "1"
    Option         "TwinViewXineramaInfoOrder" "DFP-0"
    Option         "metamodes" "CRT: nvidia-auto-select +0+0, DFP: nvidia-auto-select +1280+0"
    SubSection     "Display"
        Depth       24
    EndSubSection
EndSection


TRIED THIS FIX:
http://ubuntuforums.org/showthread.php?t=1594981&page=6

ADD 'blacklist intel_ips' TO /etc/modprobe.d/blacklist.conf:

em /etc/modprobe.d/blacklist.conf


BUT GIVES SLOW GRAPHICS:

sudo echo "softdep intel_ips pre: i915" > /etc/modprobe.d/intel-ips-dep-i915.conf

Then reboot.

The 'softdep' option tells modprobe that intel_ips module has a soft dependency on i915, meaning intel_ips can be loaded without i915, but will only provide limited functionality. With this option, modprobe will always try to load i915 before inserting intel_ips.


THEN GIVES THIS ERROR:

ERROR* drm/i915 can't work without intel_agp module
 

INFO ON drm MODULE:

modinfo drm

    filename:       /lib/modules/2.6.35-28-generic/kernel/drivers/gpu/drm/drm.ko
    license:        GPL and additional rights
    description:    DRM shared core routines
    author:         Gareth Hughes, Leif Delgass, José Fonseca, Jon Smirl
    srcversion:     058AFD3A760B23F9161B997
    depends:        
    vermagic:       2.6.35-28-generic SMP mod_unload modversions 
    parm:           debug:Enable debug output (int)


lsmod
Module                  Size  Used by
udlfb                  15573  1 
sysimgblt               2571  1 udlfb
sysfillrect             3973  1 udlfb
syscopyarea             3696  1 udlfb
binfmt_misc             7984  1 
pata_pcmcia            10810  1 
intel_ips              13252  0 
snd_hda_codec_atihdmi     3079  1 
tpm_infineon            9441  0 
drm_kms_helper         32836  0 
snd_hda_codec_idt      64699  1 
drm                   206198  1 drm_kms_helper
arc4                    1497  2 
snd_hda_intel          26147  2 
pcmcia                 40944  1 pata_pcmcia
snd_hda_codec         100951  3 snd_hda_codec_atihdmi,snd_hda_codec_idt,snd_hda_intel
snd_hwdep               6660  1 snd_hda_codec
snd_pcm                89104  2 snd_hda_intel,snd_hda_codec
joydev                 11395  0 
iwlagn                202721  0 
snd_seq_midi            5932  0 
snd_rawmidi            22207  1 snd_seq_midi
snd_seq_midi_event      7291  1 snd_seq_midi
ppdev                   6804  0 
parport_pc             30086  1 
snd_seq                57512  2 snd_seq_midi,snd_seq_midi_event
i2c_algo_bit            6208  0 
iwlcore               146875  1 iwlagn
hp_accel               14304  0 
mac80211              267099  2 iwlagn,iwlcore
tpm_tis                10022  0 
lis3lv02d              10384  1 hp_accel
input_polldev           4527  1 lis3lv02d
snd_timer              23850  2 snd_pcm,snd_seq
snd_seq_device          6912  3 snd_seq_midi,snd_rawmidi,snd_seq
fglrx                2703937  3 
tpm                    16013  2 tpm_infineon,tpm_tis
tpm_bios                6426  1 tpm
uvcvideo               62379  0 
r852                   11348  0 
videodev               49359  1 uvcvideo
hp_wmi                  6467  0 
yenta_socket           24279  0 
pcmcia_rsrc            10357  1 yenta_socket
pcmcia_core            17677  3 pcmcia,yenta_socket,pcmcia_rsrc
v4l1_compat            15519  2 uvcvideo,videodev
v4l2_compat_ioctl32    12614  1 videodev
sm_common               4441  1 r852
nand                   38430  2 r852,sm_common
psmouse                62080  0 
snd                    64181  13 snd_hda_codec_idt,snd_hda_intel,snd_hda_codec,snd_hwdep,snd_pcm,snd_rawmidi,snd_seq,snd_timer,snd_seq_device
cfg80211              170485  3 iwlagn,iwlcore,mac80211
video                  22176  0 
output                  2527  1 video
lp                     10201  0 
nand_ids                4443  1 nand
nand_ecc                4406  1 nand
parport                37032  3 ppdev,parport_pc,lp
serio_raw               4910  0 
mtd                    21479  2 sm_common,nand
xhci_hcd               60496  0 
soundcore               1240  1 snd
intel_agp              32334  0 
snd_page_alloc          8588  2 snd_hda_intel,snd_pcm
sdhci_pci               8083  0 
sdhci                  18400  1 sdhci_pci
firewire_ohci          24839  0 
led_class               3393  2 hp_accel,sdhci
firewire_core          54327  1 firewire_ohci
e1000e                151787  0 
crc_itu_t               1739  1 firewire_core


The only way I managed to force system to run was as follows:

1. I run it in recovery mode

2. I chose something like "customize graphic settings" or "run in safe graphic mode" (I don't remember how it was named and also I'm using version with polish language)

3. Then I chose option to restart x.org server


After that I am able to use my Ubuntu normally, but cannot switch on any graphic special effects.







CHECK X11 LOG:

Xorg.0.log 
    
    



[    32.593] (II) fglrx(0): xdl_x760_atiddxDisplayScreenEnableDisplays
[    43.034] (II) fglrx(0): EDID vendor "VSC", prod id 22814
[    43.034] (II) fglrx(0): Using hsync ranges from config file
[    43.034] (II) fglrx(0): Using vrefresh ranges from config file


[    60.976] (II) fglrx(0): Printing DDC gathered Modelines:
[    60.976] (II) fglrx(0): Modeline "1680x1050"x0.0  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz)
[    60.976] (II) fglrx(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[    60.976] (II) fglrx(0): Modeline "800x600"x0.0   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz)
[    60.976] (II) fglrx(0): Modeline "640x480"x0.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz)
[    60.976] (II) fglrx(0): Modeline "640x480"x0.0   31.50  640 664 704 832  480 489 492 520 -hsync -vsync (37.9 kHz)
[    60.976] (II) fglrx(0): Modeline "640x480"x0.0   30.24  640 704 768 864  480 483 486 525 -hsync -vsync (35.0 kHz)
[    60.976] (II) fglrx(0): Modeline "640x480"x0.0   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
[    60.976] (II) fglrx(0): Modeline "720x400"x0.0   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz)
[    60.976] (II) fglrx(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
[    60.976] (II) fglrx(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz)
[    60.976] (II) fglrx(0): Modeline "1024x768"x0.0   75.00  1024 1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz)
[    60.976] (II) fglrx(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[    60.976] (II) fglrx(0): Modeline "832x624"x0.0   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz)
[    60.976] (II) fglrx(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz)
[    60.976] (II) fglrx(0): Modeline "800x600"x0.0   50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz)
[    60.976] (II) fglrx(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
[    60.976] (II) fglrx(0): Modeline "1600x1200"x0.0  162.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz)
[    60.976] (II) fglrx(0): Modeline "1440x900"x0.0  106.50  1440 1520 1672 1904  900 903 909 934 -hsync +vsync (55.9 kHz)
[    60.976] (II) fglrx(0): Modeline "1400x1050"x0.0  121.75  1400 1488 1632 1864  1050 1053 1057 1089 -hsync +vsync (65.3 kHz)
[    60.976] (II) fglrx(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
[    60.976] (II) fglrx(0): Modeline "1280x960"x0.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
[    69.432] (II) fglrx(0): EDID vendor "AUO", prod id 494
[    69.432] (II) fglrx(0): Printing DDC gathered Modelines:
[    69.432] (II) fglrx(0): Modeline "1600x900"x0.0  107.80  1600 1664 1706 1970  900 903 906 912 -hsync -vsync (54.7 kHz)
[   802.706] (II) fglrx(0): EDID vendor "AUO", prod id 494
[   802.706] (II) fglrx(0): Printing DDC gathered Modelines:
[   802.706] (II) fglrx(0): Modeline "1600x900"x0.0  107.80  1600 1664 1706 1970  900 903 906 912 -hsync -vsync (54.7 kHz)


LEFT MONITOR AND LAPTOP

xrandr
Screen 1: minimum 320 x 200, current 1680 x 1050, maximum 2173 x 1950
LVDS connected 1600x900+0+0 (normal left inverted right x axis y axis) 344mm x 193mm
   1600x900       60.0*+
   1440x900       60.0  
   1280x768       60.0  
   1280x720       60.0  
   1024x768       60.0  
   1024x600       60.0  
   800x600        60.0  
   800x480        60.0  
   640x480        60.0  
DFP1 disconnected (normal left inverted right x axis y axis)
DFP2 disconnected (normal left inverted right x axis y axis)
DFP3 disconnected (normal left inverted right x axis y axis)
CRT1 connected 1680x1050+0+0 (normal left inverted right x axis y axis) 495mm x 291mm
   1680x1050      60.0*+
   1600x1200      60.0  
   1400x1050      60.0  
   1280x1024      75.0     60.0  
   1440x900       60.0  
   1280x960       60.0  
   1280x800       60.0  
   1152x864       75.0  
   1280x768       60.0  
   1280x720       60.0  
   1024x768       75.0     70.1     60.0  
   1024x600       75.0     70.1     60.0  
   800x600        72.2     75.0     60.3     56.2  
   800x480        72.2     75.0     60.3     56.2  
   640x480        75.0     72.8     67.0     59.9  



RIGHT MONITOR

 xrandr
Screen 0: minimum 320 x 200, current 1680 x 1050, maximum 1680 x 1050
udlfb connected 1680x1050+0+0 474mm x 296mm
   1680x1050      60.0*+
   1400x1050      60.0  
   1280x1024      75.0     60.0  
   1440x900       59.9  
   1280x960       60.0  
   1152x864       75.0  
   1024x768       75.0     70.1     60.0  
   832x624        74.6  
   800x600        72.2     75.0     60.3     56.2  
   640x480        75.0     72.8     66.7     59.9  
   720x400        70.1  
syoung@hplaptop:~$ 


BIBLE ON XORG.CONF
http://www.x.org/archive/X11R6.8.1/doc/xorg.conf.5.html



WROTE xorg.conf TO INCLUDE THREE SCREENS IN LAYOUT SECTION:





Section "ServerLayout"
	Identifier     "Nvidia-Layout"
	Screen	        0  "DisplayLinkScreen" 0 0
	Screen          1  "Screen1" LeftOf "DisplayLinkScreen"
	Screen          2  "Screen2" Below "DisplayLinkScreen"
	Option         "Xinerama" "off"
    Option         "Clone" "on"
EndSection

Section "Device"
	Identifier      "Default Device"
	Driver  "fglrx"
EndSection

Section "Module"
	Load    "glx"
EndSection

Section "Device"
	Identifier      "DisplayLinkDevice"
	driver          "displaylink"
	Option  "fbdev" "/dev/fb0"
EndSection

Section "Monitor"
	Identifier      "DisplayLinkMonitor"
EndSection

Section "Screen"
	Identifier      "DisplayLinkScreen"
	Device          "DisplayLinkDevice"
	Monitor         "DisplayLinkMonitor"
	SubSection "Display"
		Depth   24
		Modes   "1280x1024" "1024x768" "800x600"
		Virtual	2173 1950
	EndSubSection
EndSection


Section "Monitor"
	Identifier "VX2235wm"
	Option "DPMS"
EndSection


Section "Screen"
	Identifier      "Default Screen"
	DefaultDepth    24
	SubSection "Display"
		Virtual	2173 1950
	EndSubSection
EndSection

Section "Screen"
	Identifier "Screen1"
	Device "Default Device"
	Monitor "VX2235wm"
	DefaultDepth 24
	SubSection "Display"
		Depth 1
		Modes "1680x1050" "1600x1200" "1440x1440" "1400x1050" "1280x1024" "1280x960" "1152x864" "1024x768" "832x624" "800x600" "720x400" "640x480"
		Virtual	2173 1950
	EndSubSection
	SubSection "Display"
		Depth 4
		Modes "1680x1050" "1600x1200" "1440x1440" "1400x1050" "1280x1024" "1280x960" "1152x864" "1024x768" "832x624" "800x600" "720x400" "640x480"
		Virtual	2173 1950
	EndSubSection
	SubSection "Display"
		Depth 8
		Modes "1680x1050" "1600x1200" "1440x1440" "1400x1050" "1280x1024" "1280x960" "1152x864" "1024x768" "832x624" "800x600" "720x400" "640x480"
		Virtual	2173 1950
	EndSubSection
	SubSection "Display"
		Depth 15
		Modes "1680x1050" "1600x1200" "1440x1440" "1400x1050" "1280x1024" "1280x960" "1152x864" "1024x768" "832x624" "800x600" "720x400" "640x480"
		Virtual	2173 1950
	EndSubSection
	SubSection "Display"
		Depth 16
		Modes "1680x1050" "1600x1200" "1440x1440" "1400x1050" "1280x1024" "1280x960" "1152x864" "1024x768" "832x624" "800x600" "720x400" "640x480"
		Virtual	2173 1950
	EndSubSection
	SubSection "Display"
		Depth 24
		Modes "1680x1050" "1600x1200" "1440x1440" "1400x1050" "1280x1024" "1280x960" "1152x864" "1024x768" "832x624" "800x600" "720x400" "640x480"
		Virtual	2173 1950
	EndSubSection
EndSection



















OLD COPY:

#### register the 'DISPLAYLINKSCxoREEN' screen with the ServerLayout:
Section "ServerLayout"
	Identifier     "Nvidia-Layout"
	Screen	   0  "DisplayLinkScreen" 0 0
	Screen      1  "Primary-Screens" LeftOf "DisplayLinkScreen"
	Screen      2  "Screen2" Below "DisplayLinkScreen"
	Option         "Xinerama" "off"
EndSection

Section "Device"
	Identifier      "Default Device"
	Driver  "fglrx"
EndSection

Section "Module"
	Load    "glx"
EndSection

############### DisplayLink Stuff ###############
Section "Device"
	Identifier      "DisplayLinkDevice"
	driver          "displaylink"
	Option  "fbdev" "/dev/fb0"
EndSection

Section "Monitor"
	Identifier      "DisplayLinkMonitor"
EndSection

Section "Screen"
	Identifier      "DisplayLinkScreen"
	Device          "DisplayLinkDevice"
	Monitor         "DisplayLinkMonitor"
	SubSection "Display"
		Depth   24
		Modes   "1280x1024" "1024x768" "800x600"
		Virtual	2173 1950
		#Virtual     1280 1024
	EndSubSection
EndSection

#### CREATE VIEWSONIC SCREEN 1
Section "Monitor"
	Identifier "VX2235wm"
	Option "DPMS"
EndSection

Section "Screen"
	Identifier "Primary-Screens"
	Device "Default Device"
	Monitor "VX2235wm"
	DefaultDepth 24
	SubSection "Display"
		Depth 1
		Modes "1680x1050" "1600x1200" "1440x1440" "1400x1050" "1280x1024" "1280x960" "1152x864" "1024x768" "832x624" "800x600" "720x400" "640x480"
		Virtual	2173 1950
	EndSubSection
	SubSection "Display"
		Depth 4
		Modes "1680x1050" "1600x1200" "1440x1440" "1400x1050" "1280x1024" "1280x960" "1152x864" "1024x768" "832x624" "800x600" "720x400" "640x480"
		Virtual	2173 1950
	EndSubSection
	SubSection "Display"
		Depth 8
		Modes "1680x1050" "1600x1200" "1440x1440" "1400x1050" "1280x1024" "1280x960" "1152x864" "1024x768" "832x624" "800x600" "720x400" "640x480"
		Virtual	2173 1950
	EndSubSection
	SubSection "Display"
		Depth 15
		Modes "1680x1050" "1600x1200" "1440x1440" "1400x1050" "1280x1024" "1280x960" "1152x864" "1024x768" "832x624" "800x600" "720x400" "640x480"
		Virtual	2173 1950
	EndSubSection
	SubSection "Display"
		Depth 16
		Modes "1680x1050" "1600x1200" "1440x1440" "1400x1050" "1280x1024" "1280x960" "1152x864" "1024x768" "832x624" "800x600" "720x400" "640x480"
		Virtual	2173 1950
	EndSubSection
	SubSection "Display"
		Depth 24
		Modes "1680x1050" "1600x1200" "1440x1440" "1400x1050" "1280x1024" "1280x960" "1152x864" "1024x768" "832x624" "800x600" "720x400" "640x480"
		Virtual	2173 1950
	EndSubSection
EndSection

#### SECOND SCREEN USING CREATE VIEWSONIC
Section "Screen"
	Identifier "Screen2"
	Device "Default Device"
	Monitor "VX2235wm"
	DefaultDepth 24
	SubSection "Display"
		Depth 1
		Modes "1680x1050" "1600x1200" "1440x1440" "1400x1050" "1280x1024" "1280x960" "1152x864" "1024x768" "832x624" "800x600" "720x400" "640x480"
		Virtual	2173 1950
	EndSubSection
	SubSection "Display"
		Depth 4
		Modes "1680x1050" "1600x1200" "1440x1440" "1400x1050" "1280x1024" "1280x960" "1152x864" "1024x768" "832x624" "800x600" "720x400" "640x480"
		Virtual	2173 1950
	EndSubSection
	SubSection "Display"
		Depth 8
		Modes "1680x1050" "1600x1200" "1440x1440" "1400x1050" "1280x1024" "1280x960" "1152x864" "1024x768" "832x624" "800x600" "720x400" "640x480"
		Virtual	2173 1950
	EndSubSection
	SubSection "Display"
		Depth 15
		Modes "1680x1050" "1600x1200" "1440x1440" "1400x1050" "1280x1024" "1280x960" "1152x864" "1024x768" "832x624" "800x600" "720x400" "640x480"
		Virtual	2173 1950
	EndSubSection
	SubSection "Display"
		Depth 16
		Modes "1680x1050" "1600x1200" "1440x1440" "1400x1050" "1280x1024" "1280x960" "1152x864" "1024x768" "832x624" "800x600" "720x400" "640x480"
		Virtual	2173 1950
	EndSubSection
	SubSection "Display"
		Depth 24
		Modes "1680x1050" "1600x1200" "1440x1440" "1400x1050" "1280x1024" "1280x960" "1152x864" "1024x768" "832x624" "800x600" "720x400" "640x480"
		Virtual	2173 1950
	EndSubSection
EndSection

Section "Screen"
	Identifier      "Default Screen"
    Device          "Default Device"
	DefaultDepth    24
	SubSection "Display"
		Virtual	2173 1950
	EndSubSection
EndSection

#Section "Screen"
#    Identifier     "Primary-Screens"
#    Device         "nvidia-vga"
#    Monitor        "Dell-Monitor"
#    DefaultDepth    24
#    Option         "TwinView" "1"
#    Option         "TwinViewXineramaInfoOrder" "DFP-0"
#    Option         "metamodes" "CRT: nvidia-auto-select +0+0, DFP: nvidia-auto-select +1280+0"
#    SubSection     "Display"
#        Depth       24
#    EndSubSection
#EndSection
#



WORKING 3-SCREEN XORG.CONF:
http://www.linuxquestions.org/questions/ubuntu-63/multiple-monitors-in-ubuntu-341003/page2.html

 07-31-2005, 01:13 AM	   #22
DeadPenguin
Member
 
Registered: Nov 2004
Location: Delaware
Distribution: Slackware
Posts: 351

Original Poster 
Rep: 
I now have 3 monitors working with this xorg.conf.
----------------------------------------------------------------------
# /etc/X11/xorg.conf (xorg X Window System server configuration file)
#
# This file was generated by dexconf, the Debian X Configuration tool, using
# values from the debconf database.
#
# Edit this file with caution, and see the /etc/X11/xorg.conf manual page.
# (Type "man /etc/X11/xorg.conf" at the shell prompt.)
#
# This file is automatically updated on xserver-xorg package upgrades *only*
# if it has not been modified since the last upgrade of the xserver-xorg
# package.
#
# If you have edited this file but would like it to be automatically updated
# again, run the following commands:
#
# cp /etc/X11/xorg.conf /etc/X11/xorg.conf.custom
# sudo sh -c 'md5sum /etc/X11/xorg.conf >/var/lib/xfree86/xorg.conf.md5sum'
# sudo dpkg-reconfigure xserver-xorg

Section "Files"
FontPath	"unix/:7100"	 # local font server
# if the local font server has problems, we can fall back on these
FontPath	"/usr/lib/X11/fonts/misc"
FontPath	"/usr/lib/X11/fonts/cyrillic"
FontPath	"/usr/lib/X11/fonts/100dpi/:unscaled"
FontPath	"/usr/lib/X11/fonts/75dpi/:unscaled"
FontPath	"/usr/lib/X11/fonts/Type1"
FontPath	"/usr/lib/X11/fonts/CID"
FontPath	"/usr/lib/X11/fonts/100dpi"
FontPath	"/usr/lib/X11/fonts/75dpi"
# paths to defoma fonts
FontPath	"/var/lib/defoma/x-ttcidfont-conf.d/dirs/TrueType"
FontPath	"/var/lib/defoma/x-ttcidfont-conf.d/dirs/CID"
EndSection

Section "Module"
Load	"bitmap"
Load	"dbe"
Load	"ddc"
Load	"dri"
Load	"extmod"
Load	"freetype"
Load	"glx"
Load	"int10"
Load	"record"
Load	"type1"
Load	"vbe"
EndSection

Section "InputDevice"
Identifier	"Generic Keyboard"
Driver	 "keyboard"
Option	 "CoreKeyboard"
Option	 "XkbRules"	"xorg"
Option	 "XkbModel"	"pc104"
Option	 "XkbLayout"	"us"
EndSection

Section "InputDevice"
Identifier	"Configured Mouse"
Driver	 "mouse"
Option	 "CorePointer"
Option	 "Device"	 "/dev/input/mice"
Option	 "Protocol"	 "ImPS/2"
Option	 "Emulate3Buttons"	"true"
Option	 "ZAxisMapping"	 "4 5"
EndSection

Section "Device"
Identifier	"Device[0]"
Driver	 "radeon"
BusID	 "PCI:1:8:0"
EndSection

Section "Device"
Identifier	"Device[1]"
Driver	 "radeon"
BusID	 "PCI:1:10:0"
EndSection

Section "Device"
Identifier	"Device[2]"
Driver	 "radeon"
BusID	 "PCI:3:0:0"
EndSection

Section "Monitor"
DisplaySize 330 240
Identifier	"Monitor[0]"
ModelName	"D1025TM"
VendorName	"Dell"
HorizSync 31-85
VertRefresh 50-160
Option	 "DPMS"
EndSection

Section "Monitor"
DisplaySize 330 240
Identifier	"Monitor[1]"
ModelName	"D1025TM"
VendorName	"Dell"
HorizSync 31-85
VertRefresh 50-160
Option	 "DPMS"
EndSection

Section "Monitor"
DisplaySize 330 240
Identifier	"Monitor[2]"
ModelName	"D1025TM"
VendorName	"Dell"
HorizSync 31-85
VertRefresh 50-160
Option	 "DPMS"
EndSection

Section "Screen"
Identifier	"Screen[0]"
Device	 "Device[0]"
Monitor	 "Monitor[0]"
DefaultDepth	24
SubSection "Display"
Depth	 1
Modes	 "1024x768" "800x600" "720x400" "720x350" "640x480"
EndSubSection
SubSection "Display"
Depth	 4
Modes	 "1024x768" "800x600" "720x400" "720x350" "640x480"
EndSubSection
SubSection "Display"
Depth	 8
Modes	 "1024x768" "800x600" "720x400" "720x350" "640x480"
EndSubSection
SubSection "Display"
Depth	 15
Modes	 "1024x768" "800x600" "720x400" "720x350" "640x480"
EndSubSection
SubSection "Display"
Depth	 16
Modes	 "1024x768" "800x600" "720x400" "720x350" "640x480"
EndSubSection
SubSection "Display"
Depth	 24
Modes	 "1024x768" "800x600" "720x400" "720x350" "640x480"
EndSubSection
EndSection

Section "Screen"
Identifier	"Screen[1]"
Device	 "Device[1]"
Monitor	 "Monitor[1]"
DefaultDepth	24
SubSection "Display"
Depth	 1
Modes	 "1024x768" "800x600" "720x400" "720x350" "640x480"
EndSubSection
SubSection "Display"
Depth	 4
Modes	 "1024x768" "800x600" "720x400" "720x350" "640x480"
EndSubSection
SubSection "Display"
Depth	 8
Modes	 "1024x768" "800x600" "720x400" "720x350" "640x480"
EndSubSection
SubSection "Display"
Depth	 15
Modes	 "1024x768" "800x600" "720x400" "720x350" "640x480"
EndSubSection
SubSection "Display"
Depth	 16
Modes	 "1024x768" "800x600" "720x400" "720x350" "640x480"
EndSubSection
SubSection "Display"
Depth	 24
Modes	 "1024x768" "800x600" "720x400" "720x350" "640x480"
EndSubSection
EndSection

Section "Screen"
Identifier	"Screen[2]"
Device	 "Device[2]"
Monitor	 "Monitor[2]"
DefaultDepth	24
SubSection "Display"
Depth	 1
Modes	 "1024x768" "800x600" "720x400" "720x350" "640x480"
EndSubSection
SubSection "Display"
Depth	 4
Modes	 "1024x768" "800x600" "720x400" "720x350" "640x480"
EndSubSection
SubSection "Display"
Depth	 8
Modes	 "1024x768" "800x600" "720x400" "720x350" "640x480"
EndSubSection
SubSection "Display"
Depth	 15
Modes	 "1024x768" "800x600" "720x400" "720x350" "640x480"
EndSubSection
SubSection "Display"
Depth	 16
Modes	 "1024x768" "800x600" "720x400" "720x350" "640x480"
EndSubSection
SubSection "Display"
Depth	 24
Modes	 "1024x768" "800x600" "720x400" "720x350" "640x480"
EndSubSection
EndSection

Section "ServerLayout"
Identifier	"Main Layout"
Screen	 "Screen[0]"
Screen	 "Screen[1]" RightOf "Screen[0]"
Screen	 "Screen[2]" LeftOf "Screen[0]"
InputDevice	"Generic Keyboard"
InputDevice	"Configured Mouse"
Option	 "Xinerama""true"
Option	 "Clone""false"
EndSection

Section "DRI"
Mode	0666
EndSection
---------------------------------------------------------
It shows up as one big desktop acrossed the three monitors. 
How would I get it to be 3 seperate desktops?

Thanks,
Blair

P.S.
Gomi how is the new G5?



</entry>


