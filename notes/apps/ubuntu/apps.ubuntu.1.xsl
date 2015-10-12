archive.ubuntu.1


<entry [Thu Feb 17 00:57:25 EST 2011] FIND OUT IF USING GNOME>

how to know if I'm using xterm or gnome-terminal?

How to know if I'm using an xterm or a gnome-terminal from command line?

The output of "echo $TERM" is "xterm" from both of them.

How to know?

James Wilkinson already outlined why most environment variables probably
shouldn't be trusted, so I'll suggest checking the output of
xprop -id $WINDOWID WM_CLASS

HTH,

Nalin

Thanks to all that answered my question with a lot of useful
suggestions.

Finally, I decided to use Nalin's suggestion and implement the following
command to know if I'm using an xterm or a gnome-terminal:


xprop -id $WINDOWID WM_CLASS | awk '{print $3}' | sed 's/"//g' | sed
's/,//g'


which returns either "xterm" or "gnome-terminal".

Cheers,
Germán.
--

</entry>


<entry [Thu Feb 17 00:55:25 EST 2011] CHANGE KEYBOARD MAPPED KEYS>


    USE xmodmap


root@hplaptop:~# xmodmap
xmodmap:  up to 4 keys per modifier, (keycodes in parentheses):

shift       Shift_L (0x32),  Shift_R (0x3e)
lock        Caps_Lock (0x42)
control     Control_L (0x25),  Control_R (0x69)
mod1        Alt_L (0x40),  Alt_R (0x6c),  Meta_L (0xcd)
mod2        Num_Lock (0x4d)
mod3      
mod4        Super_L (0x85),  Super_R (0x86),  Super_L (0xce),  Hyper_L (0xcf)
mod5        ISO_Level3_Shift (0x5c),  Mode_switch (0xcb)



System Wide

To make these changes system wide, assuming you’re using Ubuntu, you can use the following:

sudo dpkg-reconfigure console-setup

This will re-install the console-tools package, which will remap your keyboard layout if you select something different. You’ll likely want to select all the default options, other than toggling between US and Dvorak.

    

</entry>

<entry [Thu Feb 17 00:54:25 EST 2011] RESET REFRESH RATE FOR SECOND MONITOR, ACTIVATE USB2VGA MONITOR>

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

lspci -v 
    
    ...
    01:00.0 VGA compatible controller: ATI Technologies Inc Madison [Mobility Radeon HD\
     5000 Series] (prog-if 00 [VGA controller])
            Subsystem: Hewlett-Packard Company Madison XT [FirePro M5800]
            Flags: bus master, fast devsel, latency 0, IRQ 46
            Memory at c0000000 (64-bit, prefetchable) [size=256M]
            Memory at d4400000 (64-bit, non-prefetchable) [size=128K]
            I/O ports at 5000 [size=256]
            Expansion ROM at d4440000 [disabled] [size=128K]
            Capabilities: [50] Power Management version 3
            Capabilities: [58] Express Legacy Endpoint, MSI 00
            Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
            Capabilities: [100] Vendor Specific Information: ID=0001 Rev=1 Len=010 
            Capabilities: [150] Advanced Error Reporting
            Kernel driver in use: radeon
            Kernel modules: radeon
    ...
    


1. GET MONITOR SETTINGS AT 1024X760 (75 HZ)

gtf 1024 768 75

  # 1024x768 @ 75.00 Hz (GTF) hsync: 60.15 kHz; pclk: 81.80 MHz
  Modeline "1024x768_75.00"  81.80  1024 1080 1192 1
  360  768 769 772 802  -HSync +Vsync


2. CHECK CURRENT SETTINGS WITH xrandr


http://www.thinkwiki.org/wiki/Xorg_RandR_1.2


3. RESET REFRESH RATE

xrandr --newmode"1024x768_75.00"  81.80  1024 1080 1192 1360  768 769 772 802  -HSync +Vsync
xrandr --addmode VGA-0 "1024x768_75.00"
xrandr --output VGA-0 "1024x768_75.00"


gtf 1024 768 75





    
</entry>

<entry [Thu Feb 17 00:53:25 EST 2011] ACTIVATE USB2VGA MONITOR>


1. INSTALLED THE PROPRIETARY ATi DRIVER USING

System --> Administration --> Additional Drivers


 
2. INSTALLED SiS USBVGA MODULE

DETAILS ON THE SISUSBVGA DRIVER
http://www.winischhofer.net/linuxsisusbvga.shtml

CHECKED SYSLOG ON INSERT OF USB PLUG (SHOWS GREEN SCREEN)

tail -f -n 20 /var/log/messages

<INSERT KENSINGTON>

    Feb 16 11:40:30 hplaptop kernel: [51902.743643] usb 2-1.2: new high speed USB device using ehci_hcd and address 6
    Feb 16 11:40:30 hplaptop kernel: [51903.048194] usb 2-1.2: dlfb: allocated 4 65024 byte urbs
    Feb 16 11:40:30 hplaptop kernel: [51903.137804] usb 2-1.2: dlfb: set_par mode 1680x1050
    Feb 16 11:40:30 hplaptop kernel: [51903.141614] usb 2-1.2: dlfb: open /dev/fb0 user=0 fb_info=ffff8801318c3800 count=1
    Feb 16 11:40:30 hplaptop kernel: [51903.141848] Console: switching to colour frame buffer device 210x65

<DETACH>

    Feb 16 11:44:24 hplaptop kernel: [52136.204715] usb 2-1.2: USB disconnect, address 6
    Feb 16 11:44:24 hplaptop kernel: [52136.204789] usb 2-1.2: dlfb: Waiting for completes and freeing all render urbs
    Feb 16 11:44:24 hplaptop kernel: [52136.204800] usb 2-1.2: dlfb: Detaching /dev/fb0
    Feb 16 11:44:24 hplaptop kernel: [52136.205186] usb 2-1.2: dlfb: release /dev/fb0 user=0 count=0
    Feb 16 11:44:24 hplaptop kernel: [52136.205259] Console: switching to colour VGA+ 80x25

NOTE: THE dlfb DRIVER WAS INSTALLED THE PREVIOUS DAY

grep dlfb /var/log/messages

    Feb 15 09:57:36 hplaptop kernel: [   14.547544] udlfb: module is from the staging directory, the quality is unknown, you have been warned.
    Feb 15 09:57:36 hplaptop kernel: [   14.549472] usb 2-1.3: dlfb: allocated 4 65024 byte urbs
    Feb 15 09:57:36 hplaptop kernel: [   14.632806] usb 2-1.3: dlfb: set_par mode 1680x1050
    Feb 15 09:57:36 hplaptop kernel: [   14.636892] usb 2-1.3: dlfb: open /dev/fb0 user=0 fb_info=ffff88013291c000 count=1
    Feb 15 09:57:36 hplaptop kernel: [   14.637646] usb 2-1.3: dlfb: set_par mode 1680x1050
    Feb 15 09:57:36 hplaptop kernel: [   14.657876] usb 2-1.3: dlfb: set_par mode 1680x1050
    Feb 15 09:57:36 hplaptop kernel: [   14.661257] usbcore: registered new interface driver udlfb
        


GET 'registered new interface driver sisusb' WHEN USE STARTECH USB2VGA (SHOWS BLACK SCREEN WITH THIN ORANGE BORDER):


<INSERT STARTECH>

    Feb 16 11:00:12 hplaptop kernel: [49491.330982] usb 2-1.2: new high speed USB device using ehci_hcd and address 4
    Feb 16 11:00:13 hplaptop kernel: [49491.483707] usb 2-1.2: USB2VGA dongle found at address 4
    Feb 16 11:00:13 hplaptop kernel: [49491.484147] usb 2-1.2: Allocated 8 output buffers
    Feb 16 11:00:13 hplaptop kernel: [49491.599630] usb 2-1.2: 8MB 1 ch/1 r SDR SDRAM, bus width 32
    Feb 16 11:00:13 hplaptop kernel: [49492.287581] usbcore: registered new interface driver sisusb



CHECKED xserver-xorg-video-sisusb PACKAGE IS INSTALLED:

cd /home/syoung/base/notes
dpkg --get-selections|awk '{print $1}' > package_list.txt
emacs package_list.txt 

    ...
    xserver-xorg-video-sis
    xserver-xorg-video-sisusb
    ...


BUT NOTHING FOUND BY modprobe:
 
modprobe sisusbvga
    <NOTHING>
    

EVEN THOUGH MODULE IS PRESENT IN THE KERNEL:

locate sisusbvga.ko
/lib/modules/2.6.35-22-generic/kernel/drivers/usb/misc/sisusbvga/sisusbvga.ko
/lib/modules/2.6.35-24-generic/kernel/drivers/usb/misc/sisusbvga/sisusbvga.ko
/lib/modules/2.6.35-25-generic/kernel/drivers/usb/misc/sisusbvga/sisusbvga.ko




'green screen' IS EXPECTED BEFORE CONFIGURATION OF xorg.conf

http://forum.xda-developers.com/showthread.php?t=889433&page=27

QUESTION: I wanted to use ubuntu for holding presentations and bought a DisplayLink usb2vga device from Kensington called "Universal Multi-Display Adapter". It should work with this ubuntu because the driver for "all DisplayLink devices to date (all DL1xx devices) is in the staging tree of the Linux 2.6.32 kernel" according to their website. If I connect it to my ubuntu notebook I will get the green screen without installing anything. 

ANSWER: you have to explain xorg how to use the usb screen and what resolution to use, plus some more details.

in other words, you have to modify the xorg.conf file, info about this should be available on the site from kensington, if not google should be able to help you further.

if that still doesn't work, try compiling your own version of the driver for your current
kernel and repeat the above process.




https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-driver-sis/+bug/224479

Re: Adding a 3rd monitor
DISCLAIMER: I have not done this personally.

However, the Kensington multi-display-adapter family should be a working example of hardware driven with the sisusbvga driver. See this old thread for a rather old example of getting it up and running.

If you go this route, don't leap right into repeating everything you find in that thread I linked - it's pretty old, and for all I know the adapter will "just work" right out-of-the-box if you plug it into a Karmic install.

One thing I can warn you of, from experience - Desktop Effects (ie, compiz) and multi-head are very likely not to want to live together on the same system. So if you go this route and you're having trouble, you might want to try disabling compiz before tearing your hair out completely.



GET CURRENT xorg.conf (GENERATED AFTER FIDDLINGS WITH nvidia-config ?)

NB: fglrx is the name of the Linux display driver used for ATI Radeon and ATI FireGL family video adapters and stands for "FireGL and Radeon for X". It contains free open source as well as proprietary and closed source parts.

cat /etc/X11/xorg.conf

Section "Screen"
	Identifier	"Default Screen"
	DefaultDepth	24
	SubSection "Display"
		Virtual	2517 1950
	EndSubSection
EndSection

Section "Module"
	Load	"glx"
EndSection

Section "Device"
	Identifier	"Default Device"
	Driver	"fglrx"
EndSection


EDIT xorg.conf TO ENABLE USB2VGA
https://help.ubuntu.com/community/USB2VGA
http://www.linux.com/archive/feed/118108 ### xorg.conf editing basics


1. EDIT xorg.conf

NB: SEE EDITING TIPS HERE:
http://www.linux.com/archive/feed/118108



emacs /etc/X11/xorg.conf

EDIT ServerLayout SECTION AT TOP OF /etc/X11/xorg.conf (CREATE IF MISSING) TO LOOK LIKE THIS

Section "ServerLayout"
        Identifier      "Default Layout"
        Screen 0 "Default Screen"
        Screen 1 "Screen[SISUSBVGA]" RightOf "Default Screen"
        InputDevice     "Generic Keyboard"
        InputDevice     "Configured Mouse"
EndSection


INSERT THE FOLLOWING INTO THE BOTTOM OF xorg.conf:

### SISUSBVGA ###

Section "Device"
 Identifier "Device[SISUSBVGA]"
 VendorName "SiS" # Value does not matter
 BoardName "SiS" # Value does not matter
 Driver "sisusb"
EndSection
-
Section "Monitor"
 Identifier "Monitor[SISUSBVGA]"
 VendorName "Monitor Vendor" # value does not matter
 ModelName "Monitor Model" # value does not matter
 VertRefresh 50-75
 HorizSync 30-90
EndSection

Section "Screen"
 Identifier "Screen[SISUSBVGA]"
 Device "Device[SISUSBVGA]"
 Monitor "Monitor[SISUSBVGA]"
 DefaultDepth 16
 SubSection "Display"
  Depth 16
  Modes "1024x768" "800x600" "640x480"
 EndSubSection
 SubSection "Display"
  Depth 8
  Modes "1024x768" "800x600" "640x480"
 EndSubSection
 SubSection "Display"
  Depth 24
  Modes "1024x768" "800x600" "640x480"
 EndSubSection
EndSection



3. STOP X SERVER


4. WRITE DEFAULT CONFIG FILE 

Xorg -configure

3. restart X using Ctrl-Alt-Backspace

    - VIEWSONIC HAS 'unknown' LABEL AND LAPTOP HAS 'laptop' LABEL AT TOP LEFT OF SCREEN
    
    - NO LABEL ON STARTECH USB2VGA SCREEN
    

4. LOG OUT AND RELOG IN

    - DROPS TO TERMINAL

    - CHECK /var/log/Xlog.0.log FOR FAILURE



If it doesn't work, please use this thread on ubuntuforums:
http://ubuntuforums.org/showthread.php?t=260863


http://wiki.debian.org/XStrikeForce/HowToRandR12


NEXT, CHECK ADDITION OF SETTINGS FOR MAX DISPLAY DENSITY: 1680 X 1050


 SubSection "Display"
  Depth 24
  Modes "1680X1050" "1024x768" "800x600" "640x480"
 EndSubSection




USE xrandr TO CONFIGURE SCREENS
-------------------------------

GOOD DIALOGUE ON xrandr 
http://forums.linuxmint.com/viewtopic.php?f=49&t=63957

INSTRUCTIONS ON HOW TO DO IT WITH xrandr
http://ubuntuforums.org/showthread.php?t=1567873




</entry>

<entry [Thu Feb 17 00:53:25 EST 2011] CHANGE REFRESH RATE ON 2ND VIEWSONIC LCD>



**** NOT IMPLEMENTED AS SCREEN SEEMS TO CALM DOWN AFTER A WHILE ****



INSTRUCTIONS ON HOW TO DO IT WITH xrandr
http://ubuntuforums.org/showthread.php?t=1567873

gtf 1024 768 75


xrandr --newmode"1024x768_60.00"  81.80  1024 1080 1192 1360  768 769 772 802  -HSync +Vsync
xrandr --addmode VGA-0 "1024x768_60.00"
xrandr --output VGA-0 "1024x768_60.00"



CHECK SETTINGS ON LAPTOP:

xrandr -q

    Screen 0: minimum 320 x 200, current 2397 x 1950, maximum 2517 x 1950
    LVDS connected 1600x900+797+1050 (normal left inverted right x axis y axis) 344mm x 193mm
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
    CRT1 connected 1680x1050+0+0 (normal left inverted right x axis y axis) 474mm x 296mm
       1680x1050      60.0*+
       1400x1050      60.0  
       1280x1024      75.0     60.0  
       1440x900       59.9  
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


REMOVE THE VGA-CONNECTED LCD AND THE 'CRT1' ENTRY BECOMES 'disconnected':

xrandr -q

   Screen 0: minimum 320 x 200, current 1600 x 900, maximum 2517 x 1950
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
   CRT1 disconnected (normal left inverted right x axis y axis)







NOTES
-----

gtf - calculate VESA GTF mode lines
-----------------------------------

usage: gtf x y refresh [-v|--verbose] [-f|--fbmode] [-x|--xorgmode]

            x : the desired horizontal resolution (required)
            y : the desired vertical resolution (required)
      refresh : the desired refresh rate (required)
 -v|--verbose : enable verbose printouts (traces each step of the computation)
  -f|--fbmode : output an fbset(8)-style mode description
 -x|--xorgmode : output an Xorg-style mode description (this is the default
                if no mode description is requested)



SYNOPSIS
       gtf    h-resolution    v-resolution    refresh    [-v|--verbose]    [-f|--fbmode]
       [-x|--xorgmode]

DESCRIPTION
       Gtf is a utility for calculating VESA GTF modes.  Given  the  desired  horizontal
       and  vertical resolutions and refresh rate (in Hz), the parameters for a matching
       VESA GTF mode are printed out.  Two output  formats  are  supported:  mode  lines
       suitable  for  the  Xorg  xorg.conf(5) file, and mode parameters suitable for the
       Linux fbset(8) utility.

OPTIONS
       -v|--verbose
               Enable verbose printouts  This shows a trace for each step of the  compu‐
               tation.

       -x|--xorgmode
               Print  the mode parameters as Xorg-style mode lines.  This is the default
               format.

       -f|--fbset
               Print the mode parameters in a format suitable for fbset(8).

SEE ALSO
       xorg.conf(5)



xrandr
------

HAVE TO USE xrandr TO AVOID REDOING xorg.conf AFTER STARTUP?

http://forums.linuxmint.com/viewtopic.php?f=49&t=63957

<!--R 1.2 extension is in Xserver and is used for dynamic configuration, but it can be used for xorg.conf configuration so that you do not have to set everything at each start up. This Debian wiki page may be easier to follow and more complete than the man pages for randr and xrandr. 

xrandr --help
usage: xrandr [options]
  where options are:
  -display <display> or -d <display>
  -help
  -o <normal,inverted,left,right,0,1,2,3>
            or --orientation <normal,inverted,left,right,0,1,2,3>
  -q        or --query
  -s <size>/<width>x<height> or --size <size>/<width>x<height>
  -r <rate> or --rate <rate> or --refresh <rate>
  -v        or --version
  -x        (reflect in x)
  -y        (reflect in y)
  --screen <screen>
  --verbose
  --dryrun
  --nograb
  --prop or --properties
  --fb <width>x<height>
  --fbmm <width>x<height>
  --dpi <dpi>/<output>
  --output <output>
      --auto
      --mode <mode>
      --preferred
      --pos <x>x<y>
      --rate <rate> or --refresh <rate>
      --reflect normal,x,y,xy
      --rotate normal,inverted,left,right
      --left-of <output>
      --right-of <output>
      --above <output>
      --below <output>
      --same-as <output>
      --set <property> <value>
      --scale <x>x<y>
      --transform <a>,<b>,<c>,<d>,<e>,<f>,<g>,<h>,<i>
      --off
      --crtc <crtc>
      --panning <w>x<h>[+<x>+<y>[/<track:w>x<h>+<x>+<y>[/<border:l>/<t>/<r>/<b>]]]
      --gamma <r>:<g>:<b>
      --primary
  --noprimary
  --newmode <name> <clock MHz>
            <hdisp> <hsync-start> <hsync-end> <htotal>
            <vdisp> <vsync-start> <vsync-end> <vtotal>
            [+HSync] [-HSync] [+VSync] [-VSync]
  --rmmode <name>
  --addmode <output> <name>
  --delmode <output> <name>
-->


USE  ddcprobe TO PROBE
----------------------

INSTALL ddcprobe

apt-get install xresprobe


USE ddcprobe

ddcprobe
    
    vbe: VESA 3.0 detected.
    oem: ATI ATOMBIOS
    vendor: (C) 1988-2005, ATI Technologies Inc.
    product: FGL MADISON 01.00
    memory: 16384kb
    mode: 640x400x256
    mode: 640x480x256
    mode: 800x600x256
    mode: 1024x768x256
    mode: 1280x1024x256
    mode: 640x480x32k
    mode: 640x480x64k
    mode: 800x600x32k
    mode: 800x600x64k
    mode: 1024x768x32k
    mode: 1024x768x64k
    mode: 1280x1024x32k
    mode: 1280x1024x64k
    mode: 320x200x32k
    mode: 320x200x64k
    mode: 1600x1200x256
    mode: 1600x1200x32k
    mode: 1600x1200x64k
    edid: 
    edid: 1 3
    id: 01ee
    eisa: AUO01ee
    serial: 00000000
    manufacture: 1 2008
    input: analog signal.
    screensize: 34 19
    gamma: 2.200000
    dpms: RGB, no active off, no suspend, no standby
    dtiming: 1600x900@68
    monitorid: AUO
    monitorid: B156RW01 V1



HOW TO ADD USB2VGA SUPPORT BY RECOMPILING THE KERNEL
----------------------------------------------------

Usb2vga (PID: 0x0711 VID: 0x0903) adapter in linux

Some instructions on how to get it working
http://www.comerma.net/usb2vga_en.html

the first time I connected it I saw disappointed that it was not recognised by the kernel module, dmesg reported; usb 7-1: new high speed USB device using ehci_hcd and address 3 usb 7-1: configuration #1 chosen from 1 choice, wich means nothing, it just didn't recognised the device.

On lsusb I can see it; Bus 007 Device 003: ID 0711:0903 Magic Control Technology Corp.

I saw in one of the pages googling that just adding the device id in the kernel driverd worked for an other device, so I did the same, and it worked!

First you need to download kernel source (using ubuntu aproximation);

apt-get install linux-source-2.6.??
Where ?? is your kernel version. After download you will have a bzip2 file in /usr/src, just descompress it and go to /drivers/usb/misc/sisusbvga/. Edit sisusb.c and find out the group of USB_DEVICES, and just add { USB_DEVICE(0x0711, 0x0903) }, between them. Then go up to the maximum level, perform a

make menuconfig
in order to have a valid .config, type

make
and wait for a long time (time for coffee). Once it finishes you will have the sisusbvga.ko on the device folder (/drivers/usb/misc/sisusbvga/). You just have to copy it to your equivalent kernel modules /lib/modules/2.6.??-??-??/kernel/drivers/usb/misc/sisusbvga/ (it's always recomended to make a backup of the previous module just in case). You need to be root to do that.

That's it, you just need to do a

modprobe sisusbvga
and now when you connect your device you should see it's led on and some information on dmessg: sisusb: USB2VGA dongle found at address 4 , sisusbvga[133]: Allocated 8 output buffers , sisusbvga[133]: 16MB 1 ch/1 r SDR SDRAM, bus width 64







</entry>


<entry [Wed Feb 16 01:02:56 EST 2011] INSTALLED FILEZILLA>

Edit-->Settings-->SFTP-->Add keypair --> converted agua.pem to agua.pkk


ec2-75-101-214-196.compute-1.amazonaws.com
root
22
(NB: PORT IS NEEDED SO THAT IT WILL USE THE agua.pkk PRIVATE KEY)



</entry>

<entry [Sun Feb 13 19:27:53 EST 2011] INSTALL PERL MODULES AND MOOSE ON HP>

perl -MCPAN -e shell

install Config::JSON
install JSON
install File::Remove
install File::Copy::Recursive
install Net::LDAP
install File::Sort
install DBI
install DBD::mysql
install DBD::SQLite
install Term::ReadKey
install Getopt::Simple
install DBD::SQLite

###INSTALL NET::AMAZON::EC2
####### Net::Amazon::EC2 DEPENDENCIES
###install Digest::HMAC_SHA1
###install Params::Validate

###1. INSTALL EXPAT
###
###cd /root/base/apps/perl
###wget http://downloads.sourceforge.net/expat/expat-2.0.1.tar.gz
###
###2. INSTALL XML::Simple USING CPAN
###
###install XML::Simple


THEN RAN workflow.cgi BUT GOT perlsuid ERROR:

workflow.cgi     run_command: /home/syoung/0.5/cgi-bin/putrelay.pl agua "perl /home/syoung/0.5/cgi-bin/workflow.pl < /tmp/workflow-temp.-json"
Can't do setuid (cannot exec sperl)


FULL OUTPUT:

echo '{"username":"admin","sessionId":"9999999999.9999.999","mode":"getData"}' | perl -w workflow.cgi

   Content-type: text/html
   
   workflow.cgi     input: {"username":"admin","sessionId":"9999999999.9999.999","mode":"getData"}
   workflow.cgi     username: admin
   workflow.cgi     relay script: /home/syoung/0.5/cgi-bin/putrelay.pl
   /home/syoung/0.5/cgi-bin/user.pl admin 9999999999.9999.999
   workflow.cgi::as_user    user_query: username=admin&sessionId=9999999999.9999.999
   workflow.cgi::as_user    run_command: perl /home/syoung/0.5/cgi-bin/user.pl "username=admin&sessionId=9999999999.9999.999"
   workflow.cgi::as_user    result: Common::validate()
   workflow.cgi::as_user    no result returned from /home/syoung/0.5/cgi-bin/user.pl script
   syoung@hplaptop:/var/www/cgi-bin/agua/0.5$ echo '{"username":"admin","sessionId":"9999999999.9999.999","mode":"getData"}' | perl -U workflow.cgi
   Content-type: text/html
   
   workflow.cgi     input: {"username":"admin","sessionId":"9999999999.9999.999","mode":"getData"}
   workflow.cgi     username: admin
   workflow.cgi     relay script: /home/syoung/0.5/cgi-bin/putrelay.pl
   /home/syoung/0.5/cgi-bin/user.pl admin 9999999999.9999.999
   workflow.cgi::as_user    user_query: username=admin&sessionId=9999999999.9999.999
   workflow.cgi::as_user    run_command: perl /home/syoung/0.5/cgi-bin/user.pl "username=admin&sessionId=9999999999.9999.999"
   workflow.cgi::as_user    result: agua
   workflow.cgi::as_user    as_user: agua
   workflow.cgi::as_user    as_user: agua
   workflow.cgi     setown_command: chown agua /home/syoung/0.5/cgi-bin/putrelay.pl
   chown: invalid user: `agua'
   workflow.cgi     setuid_command: chmod u+s /home/syoung/0.5/cgi-bin/putrelay.pl
   workflow.cgi     setgid_command: chmod g+s /home/syoung/0.5/cgi-bin/putrelay.pl
   Use of uninitialized value $filepath in substitution (s///) at workflow.cgi line 143,    Use of uninitialized value $filepath in concatenation (.) or string at workflow.cgi line 144, 
   workflow.cgi     tempfile: /tmp/workflow-temp.-json
   workflow.cgi     Temp file contents:
   {"username":"admin","sessionId":"9999999999.9999.999","mode":"getData","asuser":"agua"}
   workflow.cgi     command: /home/syoung/0.5/cgi-bin/putrelay.pl agua "perl /home/syoung/0.5/cgi-bin/workflow.pl < /tmp/workflow-temp.-json"
   workflow.cgi     run_command: /home/syoung/0.5/cgi-bin/putrelay.pl agua "perl /home/syoung/0.5/cgi-bin/workflow.pl < /tmp/workflow-temp.-json"
   Can't do setuid (cannot exec sperl)



syoung@hplaptop:/var/www/cgi-bin/agua/0.5$ perl -v

This is perl, v5.10.1 (*) built for x86_64-linux-gnu-thread-multi
(with 40 registered patches, see perl -V for more detail)



SO INSTALLED perl-suid:

apt-get install perl-suid

    ...
    Get:1 http://us.archive.ubuntu.com/ubuntu/ maverick/main perl-suid amd64 5.10.1-12ubuntu2 [34.5kB]
    Fetched 34.5kB in 0s (50.3kB/s)  
    Selecting previously deselected package perl-suid.
    (Reading database ... 176482 files and directories currently installed.)
    Unpacking perl-suid (from .../perl-suid_5.10.1-12ubuntu2_amd64.deb) ...
    Processing triggers for man-db ...
    Setting up perl-suid (5.10.1-12ubuntu2) ...



THEN RETRIED workflow.cgi:

    Can't locate MooseX/Declare.pm in @INC
    
    
INSTALLED MOOSE MODULES:

perl -MCPAN -e shell

#### INSTALL Module::Builder with CPAN
install Module::Load::Conditional
install IPC::Cmd
install ExtUtils::CBuilder
install Module::Build

    OK

INSTALL Moose ON PERL 5.8.8
##install DROLSKY/Moose-1.09.tar.gz
install MooseX::FollowPBP
install Params::Validate
install IPC::Cmd
install MooseX::Params::Validate
install Moose::Util::TypeConstraints
install Try::Tiny
install Getopt::Long::Descriptive
install MooseX::Getopt

    OK

INSTALL MOOSEX::DECLARE
-----------------------
install aliased
install Carp::Clan
install Sub::Identify
install Variable::Magic
install B::Hooks::EndOfScope


install Devel::PartialDump
install Test::Tester
install Hook::LexWrap
install Clone

install Text::Diff
install Test::SubCalls
install Test::Differences
install Params::Validate
install Pod::Simple


install namespace::clean
install Pod::Escapes
install ExtUtils::Depends

install MooseX::Declare

    OK


LIST INSTALLED MODULE VERSIONS:

/home/syoung/0.5/bin/apps/utils/modules.pl 

    Algorithm::Diff -- 1.1902
    B::Hooks::EndOfScope -- 0.09
    B::Hooks::OP::Check -- 0.18
    CPAN::Meta::YAML -- 0.003
    Carp::Clan -- 6.04
    Class::Inspector -- 1.25
    Class::Load -- 0.06
    Class::MOP -- 1.12
    Class::Singleton -- 1.4
    Clone -- 0.31
    Context::Preserve -- 0.01
    Convert::ASN1 -- 0.22
    DBI -- 1.616
    Data::OptList -- 0.106
    DateTime -- 0.66
    DateTime::Locale -- 0.45
    DateTime::TimeZone -- 1.28
    Devel::Caller -- 2.05
    Devel::Declare -- 0.006000
    Devel::GlobalDestruction -- 0.03
    Devel::PartialDump -- 0.13
    Dist::CheckConflicts -- 0.02
    ExtUtils::CBuilder -- 0.280202
    ExtUtils::Depends -- 0.304
    ExtUtils::ParseXS -- 2.2206
    File::Remove -- 1.42
    File::Sort -- 1.01
    Getopt::Long::Descriptive -- 0.089
    Hook::LexWrap -- 0.24
    IPC::Cmd -- 0.70
    JSON -- 2.50
    JSON::XS -- 2.3
    List::MoreUtils -- 0.30
    MRO::Compat -- 0.11
    Module::Build -- 0.3624
    Module::CoreList -- 2.44
    Module::Load -- 0.18
    Module::Load::Conditional -- 0.44
    Module::Metadata -- 1.000004
    Moose -- 1.21
    MooseX::Declare -- 0.34
    MooseX::FollowPBP -- 0.04
    MooseX::Getopt -- 0.35
    MooseX::LazyRequire -- 0.06
    MooseX::Meta::TypeConstraint::ForceCoercion -- 0.01
    MooseX::Method::Signatures -- 0.36
    MooseX::Params::Validate -- 0.16
    MooseX::Role::Parameterized -- 0.23
    MooseX::Traits -- 0.11
    MooseX::Types -- 0.25
    MooseX::Types::DateTime -- 0.05
    MooseX::Types::Structured -- 0.26
    Net::LDAP -- 0.4001
    PPI -- 1.213
    Package::DeprecationManager -- 0.10
    Package::Stash -- 0.25
    Package::Stash::XS -- 0.21
    PadWalker -- 1.92
    Params::Util -- 1.03
    Params::Validate -- 0.95
    Parse::Method::Signatures -- 1.003013
    Perl -- 5.10.1
    Perl::OSType -- 1.002
    Pod::Simple -- 3.15
    Scope::Guard -- 0.20
    Sub::Exporter -- 0.982
    Sub::Identify -- 0.04
    Sub::Install -- 0.925
    Sub::Uplevel -- 0.22
    Task::Weaken -- 1.03
    Test::Differences -- 0.500
    Test::Exception -- 0.31
    Test::Fatal -- 0.003
    Test::NoWarnings -- 1.02
    Test::Object -- 0.07
    Test::Pod -- 1.44
    Test::Requires -- 0.06
    Test::Simple -- 0.96
    Test::SubCalls -- 1.09
    Test::Tester -- 0.107
    Test::Warn -- 0.22
    Test::use::ok -- 0.02
    Text::Diff -- 1.37
    Tree::DAG_Node -- 1.06
    Try::Tiny -- 0.09
    Variable::Magic -- 0.46
    YAML -- 0.72
    aliased -- 0.30
    common::sense -- 3.4
    namespace::autoclean -- 0.12
    namespace::clean -- 0.20
    version -- 0.88



</entry>

<entry [Sat Feb 12 22:26:14 EST 2011] CONFIGURED APACHE, MYSQL, CGI-BIN ON HP>


echo {"username":"admin","sessionId":"9999999999.9999.999","mode":"getData"} | perl -U workflow.cgi



</entry>

<entry [Sat Feb 12 22:25:14 EST 2011] ENABLE INNODB ENGINE IN MYSQL ON UBUNTU>

mysql -V


CONFIRM THAT INNODB IS POSSIBLE:

show engines;
+------------+---------+----------------------------------------------------------------+--------------+------+------------+
| Engine     | Support | Comment                                                        | Transactions | XA   | Savepoints |
+------------+---------+----------------------------------------------------------------+--------------+------+------------+
| InnoDB     | YES     | Supports transactions, row-level locking, and foreign keys     | YES          | YES  | YES        |
| MRG_MYISAM | YES     | Collection of identical MyISAM tables                          | NO           | NO   | NO         |
| BLACKHOLE  | YES     | /dev/null storage engine (anything you write to it disappears) | NO           | NO   | NO         |
| CSV        | YES     | CSV storage engine                                             | NO           | NO   | NO         |
| MEMORY     | YES     | Hash based, stored in memory, useful for temporary tables      | NO           | NO   | NO         |
| FEDERATED  | NO      | Federated MySQL storage engine                                 | NULL         | NULL | NULL       |
| ARCHIVE    | YES     | Archive storage engine                                         | NO           | NO   | NO         |
| MyISAM     | DEFAULT | Default engine as of MySQL 3.23 with great performance         | NO           | NO   | NO         |
+------------+---------+----------------------------------------------------------------+--------------+------+------------+
8 rows in set (0.00 sec)


1. RE-INSTALLED USING PACKAGE MANAGER:


2. RESTARTED MYSQL

###/usr/bin/mysqld_safe --user=mysql

mysqld_safe &

    OK!
    
CAN LOG IN AS root BUT CAN'T LOAD DUMP FILE:

 mysql -u root -p agua < agua-110212.dump
Enter password: 
ERROR 1064 (42000) at line 22: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''access'' at line 1


ERROR LOG:

http://dev.mysql.com/doc/refman/5.1/en/forcing-recovery.html


ADD RECOVERY LINE TO my.cnf

emacs /etc/mysql/my.cnf
[mysqld]
innodb_force_recovery = 4


RESTARTED WITH mysqld_safe & AND CHECK LOG:

emacs /var/log/mysqld/error.log

    110213  1:14:05 [Note] Plugin 'FEDERATED' is disabled.
    InnoDB: The log sequence number in ibdata files does not match
    InnoDB: the log sequence number in the ib_logfiles!
    110213  1:14:05  InnoDB: Database was not shut down normally!
    InnoDB: Starting crash recovery.
    InnoDB: Reading tablespace information from the .ibd files...
    InnoDB: Restoring possible half-written data pages from the doublewrite
    InnoDB: buffer...
    110213  1:14:05  InnoDB: Started; log sequence number 0 44253
    InnoDB: !!! innodb_force_recovery is set to 4 !!!
    110213  1:14:05 [Note] Event Scheduler: Loaded 0 events
    110213  1:14:05 [Note] /usr/sbin/mysqld: ready for connections.
    Version: '5.1.49-1ubuntu8.1'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  (Ubuntu)





TRIED TO CREATE TABLE MANUALLY:

mysql -u root -p agua < agua-110212.dump

BUT GOT THIS ERROR

ERROR 1030 (HY000) at line 72: Got error -1 from storage engine



THIS IS BECAUSE OF THE 'innodb_force_recovery = 4' LINE IN my.cnf

http://bugs.mysql.com/bug.php?id=30225


SO COMMENTED OUT THE LINE AND RESTART MYSQL


    OK!
    

root USER CAN SEE agua TABLES 


GRANTED PRIVILEGES TO agua USER:

CREATE USER agua@localhost IDENTIFIED BY 'open4agua';
GRANT ALL PRIVILEGES ON agua.* TO agua@localhost;
FLUSH PRIVILEGES;

    OK!
    





mysql> CREATE TABLE 'access' (
    ->   'project' varchar(20) NOT NULL,
    ->   'groupname' varchar(20) NOT NULL DEFAULT '',
    ->   'owner' varchar(20) NOT NULL DEFAULT '',
    ->   'ownerrights' int(1) NOT NULL DEFAULT '0',
    ->   'grouprights' int(1) NOT NULL DEFAULT '0',
    ->   'worldrights' int(1) NOT NULL DEFAULT '0',
    ->   PRIMARY KEY ('project','groupname','owner','ownerrights','grouprights','worldrights')
    -> ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''access' (
  'project' varchar(20) NOT NULL,
  'groupname' varchar(20) NOT NULL ' at line 1




http://dev.mysql.com/tech-resources/articles/mysql_intro.html


mysql -u root

SET PASSWORD FOR 'root'@'localhost' = PASSWORD('secret_password');


CREATE INNODB DATABASE BY FIRST ADDING INNODB INFO TO my.cnf

my.cnf 

/etc/mysql/my.cnf



PROBLEM: MYSQL WILL NOT START EVEN THOUGH IT SAYS 'st1art: Job is running'.

SO TRIED TO REINSTALL MYSQL BUT IT DIDN'T WORK:

apt-get install mysql-server --fix-missing --fix-broken --assume-yes



apparmor SEEMS TO BE DOING SOMETHING:

emacs /etc/apparmor.d/usr.sbin.mysqld
    ...
    [34390.936725] type=1400 audit(1297570443.127:86): apparmor="STATUS" operation="profile_replace" name="/usr/sbin/mysqld" pid=17945 comm="apparmor_parser"
    [34421.053656] type=1400 audit(1297570473.317:87): apparmor="STATUS" operation="profile_replace" name="/usr/sbin/mysqld" pid=18015 comm="apparmor_parser"

SO TRIED THIS, BUT STILL COULDN'T START MYSQL:

In 10.04, apparmor does not allow MySQL to read the InnoDB plugins. Add the following lines to

emacs /etc/apparmor.d/usr.sbin.mysqld

/usr/lib/mysql/plugin/ r, /usr/lib/mysql/plugin/* mr,

Then reload apparmor and restart the MySQL service.



I am trying to enable InnDB on my linux server. I have installed Ubuntu 10.04 JeOS on an ESX server. I then installed mySQL and tomcat using aptitude. However when I use SHOW ENGINES; in mySQL it does not appear that InnoDB was installed. I then tried following the directions in the documentation.

http://dev.mysql.com/doc/refman/5.1/en/innodb.html

However I get the following when trying to enable a plugin:

ERROR 1123 (HY000): Can't initialize function 'InnoDB'; Plugin initialization function failed.




</entry>


<entry [Wed Feb  9 21:31:06 EST 2011] APACHE ON UBUNTU - WHERE IS httpd.conf>


INSTEAD OF httpd.conf, UBUNTU HAS apache2.conf

/etc/apache2/apache2.conf p

htt
WHICH PULLS IN THESE ADDITIONAL FILES:

cat /etc/apache2/apache2.conf | grep Include | grep -v "#"

    Include mods-enabled/*.load
    Include mods-enabled/*.conf
    Include httpd.conf
    Include ports.conf
    Include conf.d/
    Include sites-enabled/


1. MAKE SURE THAT THE SERVER ROOT IS SET AS THE INSTALLATION DIRECTORY:

ServerRoot "/etc/apache2"


2. RESTART APACHE:

/etc/init.d/apache2 restart


3. MAKE SURE THAT ALL THE LINKED DIRECTORIES ARE chmod 755, I.E., FROM /home/syoung/0.5/html ONWARDS





NOTES
-----



ENABLE default SITE:

a2ensite default 


RESTART APACHE:

/etc/init.d/apache2 reload

    apache2: Syntax error on line 204 of /etc/apache2/apache2.conf: Include directory '/var/www/html/mods-enabled' not found
    Action 'configtest' failed.
    The Apache error log may have more information.
       ...fail!


ADD LINK TO ORIGINAL mods-enabled/authz_host.load INSIDE NEW DOCUMENT ROOT mods-enabled FOLDER:

ln -s /etc/apache2/mods-enabled/authz_host.load `pwd`/mods-enabled/authz.host.load


RELOAD APACHE:

/etc/init.d/apache2 reload

    * Reloading web server config apache2      



RESTART APACHE:

/etc/init.d/apache2 restart

    * Restarting web server apache2                                                                             no listening sockets available, shutting down
   Unable to open logs
   Action 'start' failed.
   The Apache error log may have more information.


CREATE LINK TO ORIGINAL ports.conf WHICH TELLS APACHE WHICH PORTS TO LISTEN ON:

ln -s /etc/apache2/ports.conf /var/www/html/ports.conf 

cat /etc/apache2/ports.conf

<!--    # If you just change the port or add more ports here, you will likely also
    # have to change the VirtualHost statement in
    # /etc/apache2/sites-enabled/000-default
    # This is also true if you have upgraded from before 2.2.9-3 (i.e. from
    # Debian etch). See /usr/share/doc/apache2.2-common/NEWS.Debian.gz and
    # README.Debian.gz
    
    NameVirtualHost *:80
    Listen 80
    
    <IfModule mod_ssl.c>
        # If you add NameVirtualHost *:443 here, you will also have to change
        # the VirtualHost statement in /etc/apache2/sites-available/default-ssl
        # to <VirtualHost *:443>
        # Server Name Indication for SSL named virtual hosts is currently not
        # supported by MSIE on Windows XP.
        Listen 443
    </IfModule>
    
    <IfModule mod_gnutls.c>
        Listen 443
    </IfModule>

-->



Configuring Apache 2 on Debian, Ubuntu
http://www.control-escape.com/web/configuring-apache2-debian.html

The Debian distribution of Linux includes the Apache web server, both the venerable version 1 and the more modern version 2. The Debian maintainers have a peculiar way of arranging the configuration files for Apache 2.0 which is not documented in the standard Apache documentation. This introduction should help you get acclimated to the Debian way of configuring Apache 2.0.

Active Configuration Files

# /etc/apache2/apache2.conf - pulls in additional
# configurations in this order:
Include /etc/apache2/mods-enabled/*.load
Include /etc/apache2/mods-enabled/*.conf
Include /etc/apache2/httpd.conf
Include /etc/apache2/ports.conf
Include /etc/apache2/conf.d/[^.#]*
Include /etc/apache2/sites-enabled/[^.#]*


Debian stores its Apache 2.0 configuration files in the directory /etc/apache2. Normally the main Apache configuration file is called httpd.conf. Although that file exists on Debian, it is only there for compatibility with other software that expects it to exist. The real configuration starts with the file apache2.conf. You can still add configuration statements to httpd.conf, as apache2.conf includes it, but you would do well to ignore that fact. Your hand-edited changes should go elsewhere (see below).

Debian adds another configuration file, ports.conf, which contains the Listen directives telling the Apache server what IP address and port to listen to (Apache 2 no longer uses the Port directive.) I'm not sure why the maintainers decided to break this out into a separate file.

The best place to put your own custom configurations is in the conf.d directory. Files in this directory are included as part of the "global" server configuration and will apply to all virtual hosts (see below). For example, if all the sites on your server use the Yahoo User Interface libraries, you might store one copy of the libraries in a central location that can be shared across all sites, and create a file /etc/apache2/conf.d/yui.conf with an Alias directive to map it to the same URL space for all sites.

Apache Modules
# Files related to Apache modules
/etc/apache2/mods-enabled/*.load
/etc/apache2/mods-enabled/*.conf
/etc/apache2/mods-available/*.load
/etc/apache2/mods-available/*.conf
/usr/sbin/a2enmod
/usr/sbin/a2dismod


<!--One of the great advantages of the Apache web server is its modular architecture. You can add or remove functionality as dictated by your requirements. In the default Apache build, you would find a section near the top of your httpd.conf file with instructions to load each module. Later in the file, you would find configuration sections specific to each module, possibly wrapped in a <IfModule> directive. This arrangement can be tricky from the perspective of a system administrator who may need to install or uninstall various Apache modules. Identifying the configuration changes that are required by a module or that require a specific module can be difficult to do by hand and even harder to automate with a script.

To make things easier on the server administrator, Debian takes advantage of the fact that Apache configuration files may contain an Include directive which pulls in additional configuration files. Debian creates two non-standard directories: /etc/apache2/mods-enabled and /etc/apache2/mods-available. Whenever you install an Apache module from a Debian package, the module will drop one or two files into the mods-available directory. The mandatory module.load contains the Apache Load directive to load the module into your web server. The optional module.conf file contains additional configuration directives necessary for the operation of the module.

Installing a module from a Debian package makes it available to your server, but does not automatically activate the module in your server. To activate the module, use the a2enmod command:
a2enmod module
/etc/init.d/apache2 force-reload

The a2enmod command will create symbolic links in the mods-enabled directory pointing to your module.load and, if it exists, module.conf. To force a running Apache to re-read its configuration files and thus load the module, you must then send it the force-reload signal.

Likewise, to disable a module:

a2dismod module
/etc/init.d/apache2 force-reload

You can, of course, manage the symbolic links in the mods-enabled directory directly, but it is usually safer to use the provided scripts. Issue either command without a module argument and it will print for you a list of appropriate module names.

Virtual Hosts
# Files related to Apache virtual hosts
/etc/apache2/sites-enabled/[^.#]*
/etc/apache2/sites-available/*
/usr/sbin/a2ensite
/usr/sbin/a2dissite

A Virtual Host is just a web site served by your Apache server. Virtual hosts are managed just like modules. Each site gets its own configuration file that contains all the Apache directives that pertain only to that site. These files (or symbolic links to them) should be placed in the sites-available directory.

There are no strict naming requirements for these files (files beginning with "." or "#" will be ignored), but for convenience you should name each site configuration file to match the domain name it is serving. There is no need to add a "conf" extension. For example, control-escape.com is the file used for this web site.
To activate any of these sites, use the a2ensite command, which operates identically to the a2enmod command mentioned above. There is a respective a2dissite command for disabling a site.

Even if you only run one web site on your server, Apache is still configured to have one virtual host, the Default Virtual Host. The default virtual host is treated specially by the a2ensite script. If you look in your sites-enabled directory you will find that the link has been named 000-default. The number is prepended to the name by the a2ensite script to ensure that the default virtual host is the first one included by Apache (which sorts the files alphabetically). If you want other sites to be loaded in a particular order other than alphabetical, you can rename the links here, but you should always ensure that the default virtual host is the first one loaded.

Conclusion and Resources

Although Debian's configuration setup for Apache 2 is non-standard, it is still fairly easy to understand, and it provides tools that make life easier for the administrators of web servers that change often or serve multiple web sites. For additional help, view the Debian README file at /etc/apache2/README. For general information on configuring Apache, try these resources.
Web: Official Apache 2 Documentation
Book: Apache: The Definitive Guide (3rd Edition)- O'Reilly's definitive guide to Apache is perhaps the best general resource to Apache outside the documentation itself.





NOTES
-----


http://netbeans.org/kb/docs/php/configure-php-environment-ubuntu.html

ENABLE default SITE:

a2ensite default 


RESTART APACHE:

/etc/init.d/apache2 reload

    apache2: Syntax error on line 204 of /etc/apache2/apache2.conf: Include directory '/var/www/html/mods-enabled' not found
    Action 'configtest' failed.
    The Apache error log may have more information.
       ...fail!


emacs /etc/apache2/apache2.conf


ORIGINAL CONF SITE:

cat /etc/apache2/sites-available/default

<VirtualHost *:80>
	ServerAdmin webmaster@localhost

	DocumentRoot /var/www
	<Directory />
		Options FollowSymLinks
		AllowOverride None
	</Directory>
	<Directory /var/www/>
		Options Indexes FollowSymLinks MultiViews
		AllowOverride None
		Order allow,deny
		allow from all
	</Directory>

	ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/
	<Directory "/usr/lib/cgi-bin">
		AllowOverride None
		Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch
		Order allow,deny
		Allow from all
	</Directory>

	ErrorLog ${APACHE_LOG_DIR}/error.log

	# Possible values include: debug, info, notice, warn, error, crit,
	# alert, emerg.
	LogLevel warn

	CustomLog ${APACHE_LOG_DIR}/access.log combined

    Alias /doc/ "/usr/share/doc/"
    <Directory "/usr/share/doc/">
        Options Indexes MultiViews FollowSymLinks
        AllowOverride None
        Order deny,allow
        Deny from all
        Allow from 127.0.0.0/255.0.0.0 ::1/128
    </Directory>

</VirtualHost>

-->
Activating the New Virtual Host

To deactivate the default host and activate the new host, launch the Terminal and run the following two utilities in the Terminal window:

sudo a2dissite default && sudo a2ensite mysite

Restart the Apache HTTP server:

sudo /etc/init.d/apache2 reload





</entry>


<entry [Wed Feb  9 21:31:06 EST 2011] UBUNTU SHORTCUTS>

For almost every task that you can perform with the mouse, you can use the keyboard to perform the same task. Shortcut keys are keys that provide you with a quick way to perform a task.

You can use shortcut keys to perform general GNOME Desktop tasks and to work with interface items such as panels and windows. You can also use shortcut keys in applications. To customize your shortcut keys, use the Keyboard Shortcuts preference tool. See the section called “Keyboard Shortcuts Preferences” for more information about configuring keyboard shortcuts.

	
Many PC keyboards come with two special keys for the Windows operating system: a key with a Microsoft Windows™ logo and a key for accessing context menus.

In GNOME, the Windows key is often configured to act as an additional modifier key, called the Super key. The context menu key can be used to access the context menu of the selected item, just as the Shift+F10 keyboard shortcut can.

You can also modify the GNOME Desktop preferences to use keyboard accessibility features. See the section called “Keyboard Accessibility Preferences” for more information about the keyboard accessibility features.

The following sections describe the shortcut keys that you can use throughout the desktop and applications.

Global Shortcut Keys

Global shortcut keys enable you to use the keyboard to perform tasks related to your desktop, rather than tasks on the currently selected window or application. The following table lists some global shortcut keys:

Shortcut Key

Function

Alt+F1

Open the Applications Menu.

Alt+F2

Display the Run Application dialog. See the section called “Running Applications” for more information.

Print Screen

Take a screenshot of the entire desktop. See the section called “Taking Screenshots” for more information.

Alt+Print Screen

Take a screenshot of the currently focused window.

Ctrl+Alt+Arrow keys

Switch to the workspace to the specified direction of the current workspace. See the section called “Workspaces” for more information on working with multiple workspaces.

Ctrl+Alt+D

Minimize all windows and give focus to the desktop.

Alt+Tab

Switch between windows. A list of windows that you can select is displayed. Release the keys to select a window. You can press the Shift key to cycle through the windows in reverse order.

Ctrl+Alt+Tab

Switch the focus between the panels and the desktop. A list of items that you can select is displayed. Release the keys to select an item. You can press the Shift key to cycle through the items in reverse order.

Window Shortcut Keys

Window shortcut keys allow you to use the keyboard to perform tasks on the currently focused window. The following table lists some window shortcut keys:

Shortcut Key

Function

Alt+Tab

Switch between windows. A list of windows that you can select is displayed. Release the keys to select a window. You can press the Shift key to cycle through the windows in reverse order.

Alt+F4

Close the currently focused window.

Alt+F5

Unmaximize the current window, if it is maximized.

Alt+F7

Move the currently focused window. After pressing this shortcut, you can move the window using either the mouse or the arrow keys. To finish the move, click the mouse or press any key on the keyboard.

Alt+F8

Resize the currently focused window. After pressing this shortcut, you can resize the window using either the mouse or the arrow keys. To finish the resize, click the mouse or press any key on the keyboard.

Alt+F9

Minimize the current window.

Alt+F10

Maximize the current window.

Alt+spacebar

Open the window menu for the currently selected window. The window menu allows you to perform actions on the window, such as minimizing, moving between workspaces, and closing.

Shift+Ctrl+Alt+Arrow keys

Move the current window to another workspace in the specified direction. See the section called “Workspaces” for more information on working with multiple workspaces.

Application Keys

Application shortcut keys enable you to perform application tasks. You can use shortcut keys to perform application tasks more quickly than if you use a mouse. The following table lists some common application shortcut keys:

Shortcut Key

Action

Ctrl+N

Create a new document or window.

Ctrl+X

Cut the selected text or region and place it on the clipboard.

Ctrl+C

Copy the selected text or region onto the clipboard.

Ctrl+V

Paste the contents of the clipboard.

Ctrl+Z

Undo the last action.

Ctrl+S

Save the current document to disk.

F1

Load the online help document for the application.

In addition to these shortcut keys, all applications support a set of keys to navigate and work with the user interface. These keys allow you to perform operations that you might normally perform with a mouse. The following table describes some interface control keys:

Keys

Action

Arrow keys or Tab

Move between controls in the interface or items in a list.

Enter or spacebar

Activate or choose the selected item.

F10

Activate the left-most menu of the application window.

Shift+F10

Activate the context menu for the selected item.

Esc

Close a menu without selecting a menu item, or cancel a drag operation.

Access Keys

A menubar is a bar at the top of a window that contains the menus for the application. An access key is an underlined letter in a menubar, menu, or dialog that you can use to perform an action. On a menubar, the access key for each menu is underlined.

To open a menu, hold the Alt key, then press the access key. In the menu, the access key for each menu item is underlined. To choose a menu item when a menu is displayed, you can simply press the access key for the menu item.

For example, to open a new window in the Help application, press Alt+F to open the File menu, then press N to activate the New Window menu item.

You can also use access keys to access elements in a dialog. In a dialog, one letter in most dialog elements is underlined. To access a particular dialog element, hold Alt, then press the access key.





</entry>



<entry [Fri Feb  4 09:52:35 UTC 2011] DOWNLOAD YORUBA1 SAMPLE INPUT DATA (148 MB)>

1. COPY agua.pem FROM OLD hplaptop


2. USE agua.pem TO DOWNLOAD DATA FROM AQUARIUS-7

mkdir -p /aquarius/nethome/admin/.agua/Project1/Workflow1
cd /aquarius/nethome/admin/.agua/Project1/Workflow1
scp -i /home/syoung/22-agua/cloud/AWS/keypair/agua.pem root@ec2-75-101-214-196.compute-1.amazonaws.com:/data/agua/0.5/yoruba1-1M.inputs.tar.gz .



NOTES
-----

PREPARED DATA SET ON STARCLUSTER MASTER

cp /aquarius/nethome/admin/.agua/Project1/Workflow1/yoruba1-1.reads_1.1M.sequence.txt .
cp /aquarius/nethome/admin/.agua/Project1/Workflow1/yoruba1-1.reads_2.1M.sequence.txt .
cp -r /aquarius/nethome/data/sequences/human/hg19/bowtie/chr22 .
tar cvfz yoruba1-1M.inputs.tar.gz yoruba1-1.reads_* chr22

yoruba1-1.reads_1.1M.sequence.txt


</entry>

<entry [Fri Feb  4 09:51:35 UTC 2011] INSTALLED SGE>

sudo apt-get install gridengine-master gridengine-exec gridengine-client gridengine-qmon gridengine-common

    OK

Then you're going to want to fire up qmon with sudo permissions and create your queue. You're going to want to go to queue control, add a new queue name as suits your fancy, add a host which is your machine, it needs to resolve, i.e. ping myhostname knows what you're talking about. This can be accomplished by adding a line to /etc/hosts or probably by just using your hostname or 127.0.0.1. I set slots to 4, which means it can use up all the cpu power when it needs to, I found I was still able to work normally when the queue is loaded (i.e. cpu usage will be at 100% on each core for the next 24 hours at least). But I could see setting it to 3 if you have a quad core machine. You're also going to want to go to host configuration and add your machine as a submit host. This should allow you to submit jobs from the local machine to the queue on the local machine. It's kind of a pseudoqueue, but it gets my work done faster, so I'm not complaining. Leave a comment if you have any problems, I may be able to help you out.



MASTER HOST
IP 184.49.91.26


</entry>

<entry [Fri Feb  4 09:50:35 UTC 2011] INSTALL SSH SERVER ON UBUNTU>

sudo apt-get update
sudo apt-get install openssh-server

</entry>--
<entry [Wed Jan 26 14:03:06 EST 2011] LOGIN TO PEGASUS IS VERY SLOW>

ssh -v syoung@pegasus.ccs.miami.edu

    debug1: SSH2_MSG_SERVICE_ACCEPT received
    debug1: Authentications that can continue: publickey,gssapi-with-mic,password
    debug1: Next authentication method: gssapi-with-mic
    debug1: Unspecified GSS failure.  Minor code may provide more information
    Credentials cache file '/tmp/krb5cc_1000' not found
    
    debug1: Unspecified GSS failure.  Minor code may provide more information
    Credentials cache file '/tmp/krb5cc_1000' not found 
    
    debug1: Unspecified GSS failure.  Minor code may provide more information
    
    
    debug1: Next authentication method: publickey
    debug1: Trying private key: /home/syoung/.ssh/id_rsa
    debug1: Trying private key: /home/syoung/.ssh/id_dsa
    debug1: Next authentication method: password
    syoung@pegasus.ccs.miami.edu's password: 
    debug1: Authentication succeeded (password).
    debug1: channel 0: new [client-session]
    debug1: Entering interactive session.
    debug1: Sending environment.
    debug1: Sending env LANG = en_US.utf8
    Last login: Wed Jan 26 13:37:49 2011 from 10.136.60.245
    
</entry>

 
 
 
 
 
