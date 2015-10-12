backup


<entry [Fri 2013:09:20 05:56:35 EST] THUNDERBIRD INSTALL LIGHTNING>

1. LIGHTNING LOCATION

software/thunderbird/lightning-2.6-tb+sm-linux.xpi

2. INSTALL LIGHTNING

Thunderbird --> Tools --> Add-ons --> Options (screwdriver and spanner image at top right) --> Install from File --> Install


</entry>
<entry [Thu 2013:09:12 19:20:00 EST] DOWNLOAD AND INSTALL JAVA FOR CHROME>

http://javadl.sun.com/webapps/download/AutoDL?BundleId=80805

    
</entry>
<entry [Thu 2013:09:12 13:50:15 EST] INSTALL SKYPE>

1. SET SOFTWARE SOURCE TO 'Main Server'

Ubuntu Software Center --> Main Server


2. UPDATE APT-GET
apt-get update


3. INSTALL SKYPE

sudo apt-get -f install skype

    
</entry>
<entry [Wed 2013:08:21 19:22:05 EST] INSTALL FINGERPRINT READER>

sudo add-apt-repository ppa:fingerprint/fingerprint-gui
sudo apt-get update
sudo apt-get install libbsapi policykit-1-fingerprint-gui fingerprint-gui

    
</entry>
<entry [Tue 2013:08:20 04:16:22 EST] INSTALL ZOTERO>
    
    
</entry>
<entry [Tue 2013:08:20 03:09:01 EST] INSTALL SCRIPT install.pl>

INSTALLS

#### GIT
apt-get install -y git 

#### EC2-API
apt-get install ec2-api-tools

#### TOOLS
apt-get install cpanminus
apt-get install emacs23
apt-get install diffuse

#### 32-BIT LIBS FOR PYTHON
apt-get install libc6-i386 lib32gcc1 lib32z1 lib32stdc++6 ia32-libs

#### COMPIZ
apt-get install compizconfig-settings-manager

#### AGUA
cpanm install JSON
cpanm install Term::ReadKey


    
</entry>
<entry [Fri 2013:05:31 00:44:08 EST] INSTALL ec2-api TOOLS>

sudo apt-get install ec2-api-tools
    
</entry>
<entry [Fri 2013:05:31 00:39:26 EST] INSTALL CHROME>
    

1. EDIT sources.list FILE

emacs -nw /etc/apt/sources.list

ADD THIS LINE:

deb http://dl.google.com/linux/chrome/deb/ stable main


2. GET KEY FOR CHROME FROM UBUNTU KEY SERVER

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8E5D2411637A5E2A


AND DO THIS TO PREVENT THIS ERROR: W: GPG error: http://dl.google.com stable Release: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY A040830F7FAC5991

sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -


3. UPDATE apt-get

apt-get update


4. INSTALL CHROME STABLE

apt-get install google-chrome-stable

    
</entry>
<entry [Sat 2012:11:17 01:04:14 EST] RECOVERY PLAN v3>

#### TOOLS
apt-get install cpanminus
apt-get install emacs23
apt-get install diffuse

#### 32-BIT LIBS FOR PYTHON
apt-get install libc6-i386 lib32gcc1 lib32z1 lib32stdc++6 ia32-libs

#### COMPIZ
apt-get install compizconfig-settings-manager

MAKE PANEL (SYSTRAY) TRANSPARENT>
Compiz Config Settings Manager --> Unity Plugin --> Experimental --> Panel Opacity -> 0

#### AGUA
cpanm install JSON
cpanm install Term::ReadKey

#### INSTALL AGUA
./install.pl
./config.pl
./deploy.pl



</entry>
<entry [Tue 2012:11:13 01:53:52 EST] GOOGLE BOOKMARKS>

stuartpyoungbookmarks
a*
    
</entry>
<entry [Tue 2012:10:30 01:17:10 EST] 17" TOSHIBA LAPTOP SPECS>

Satellite C675D-S7109 Laptop Specifications

PROCESSOR*
AMD E-Series Processor E-300

GRAPHICS ENGINE*
AMD Radeon™ HD 6310

GRAPHICS MEMORY*
384MB-1974MB dynamically allocated shared graphics memory

Memory and Storage
4GB DDR3 1066MHz memory

HARD DRIVE*
320GB HDD (5400rpm, Serial ATA)

OPTICAL DRIVE*
DVD-SuperMulti drive (+/-R double layer)
Audio and Video

DISPLAY SIZE
17.3" widescreen

DISPLAY TYPE*
HD+ TruBrite® LED Backlit display

DISPLAY RESOLUTION
1600x900, 16:9 aspect ratio, Supports 720p content

AUDIO
Headphone jack (stereo), Microphone jack (mono), Standard stereo speakers
Communication

WEBCAM
Webcam and microphone

WIRELESS LAN*
Wi-Fi® Wireless networking (802.11b/g/n)

BLUETOOTH
No Bluetooth (No Antenna)

LAN
10/100 Ethernet LAN

Power
AC ADAPTER
65W (19V 3.42A) Auto-sensing, 100-240V / 50-60Hz input

BATTERY
Li-Ion (48Wh, 6-Cell)
BATTERY LIFE*
Up to 3.97 hours
    
</entry>
<entry [Tue 2012:10:30 01:16:37 EST] KIDS LAPTOP SPECS>

ProcessorIntel Celeron 925 / 2.3 GHz
Memory3.0 GB / 4.0 GB (max)
Hard Drive250.0 GB - Serial ATA-300 - 5400.0 rpm
Operating SystemMicrosoft Windows 7 Home Premium 64-bit Edition
Display Type15.6 in TFT active matrix
Max Resolution1366 x 768 ( HD )
Graphics ProcessorIntel GMA 4500M Dynamic Video Memory Technology 5.0
Optical DriveDVD±RW (±R DL) / DVD-RAM

    
</entry><entry [Thu 2012:10:25 01:28:32 EST] INSTALL PROPRIETARY/RESTRICTED PACKAGES (TAKES MORE THAN AN HOUR)>
    
Software Center --> SEARCH: restricted --> Ubuntu restricted extras

    
</entry>
<entry [Thu 2012:07:12 21:41:03 EST] SUDO>

1. NO PASSWORD SUDO
USE visudo TO EDIT /etc/sudoers

visudo

ON UBUNTU 

NB: *** MUST BE AT  __END__ OF FILE (OR WILL BE UNDONE BY %admin LINE) ***

syoung ALL=(ALL) NOPASSWD: ALL

    
</entry>
<entry [Thu 2012:07:12 20:54:36 EST] GIT RECOVERY>

# EMACS
git config --global core.editor "emacs -nw"

# SYOUNG USER
# syoung NAME AND EMAIL
git config --global user.name "Stuart Young"
git config --global user.email "stuartpyoung@gmail.com"
# EMACS FOR DEFAULT EDITOR
git config core.editor "emacs -nw" --global

# ROOT USER
# agua NAME AND EMAIL
git config --global user.name "Agua Development Team"
git config --global user.email "aguadev@gmail.com"
# EMACS FOR DEFAULT EDITOR
git config core.editor "emacs -nw" --global
    
</entry>
<entry [Sun 2012:04:15 22:00:50 EST] RECOVERY PLAN v2>

INSTALL
apt-get install cpanminus

PERL MODS
cpanm install JSON
cpanm install Term::ReadKey

INSTALL AGUA
./install.pl
./config.pl
./deploy.pl



CHANGE OWNERSHIP IN HTML
chown -R www-data:syoung /var/www/html



UBUNTU

INSTALL COMPIZ MANAGER
sudo apt-get install compizconfig-settings-manager

MAKE PANEL (SYSTRAY) TRANSPARENT>
Compiz Config Settings Manager --> Unity Plugin --> Experimental --> Panel Opacity -> 0

    OK!!!

    
</entry>
<entry [Wed 2011:11:16 11:43:28 EST] BACKUP PLAN V1>
    
EDUCATION
mendeley
    
PROGRAMMING
apt-get install emacs23
apt-get install qgit 
apt-get install diffuse

OFFICE
LibreOffice


GRAPHICS
pdf editor
simplescan

INTERNET
chromium
chrome
skype
thunderbird

VIDEO
xine
play it slowly
sound recorder


</entry>
