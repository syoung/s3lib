osx


<entry [Mon 2015:06:15 08:16:43 EST] FIX WIFE ON YOSEMITE (10.10.3)>

1) RESTART Wifi. IF NO LUCK, CONTINUE

2) FORCE OSX TO CREATE CONFIG FILES

1. Turn OFF Wifi in Wireless Network menu

2. Remove plist files

/Library/Preferences/

com.apple.airport.preferences.
com.apple.network.
com.apple.wifi.message-tracer.
NetworkInterfaces.plist
preferences.plist

3. Move to ‘wifi backups’ or similar

4. Reboot

5. Turn ON Wifi in Wireless Network menu. IF NO LUCK, CONTINUE


3) CREATE NEW WIFI WITH CUSTOM DNS (8.8.8.8)
What we’re doing here is creating a new network location which is going to have a configuration different from the defaults. First, we’ll use a completely new network setup. Then, we’ll set DNS on the computer rather than waiting for OS X to get DNS details from the wi-fi router, which alone can resolve many issues with DNS lookups, since Yosemite seems to be finicky with some routers. Finally, we’re going to set a custom MTU size that is slightly smaller than the default, which will get rejected less often by a router, it’s an old netadmin trick that has long been used to fix network troubles.
1. Open the  Apple menu and go to System Preferences, then choose “Network”
2. Pull down the “Locations” menu and choose “Edit Locations”, then click the [+] plus button, give the new network location a name like “Yosemite WiFi” then click Done


3. Next to “Network Name” join your desired wifi network as usual
4. Now click the “Advanced” button, and go to the “DNS” tab
5. Click the [+] plus button and specify a DNS server – we’re using 8.8.8.8 for Google DNS in this example but you should use the fastest DNS servers you can find for your location, it will vary. You can also use your own ISP DNS servers
6. Now go to the “Hardware” tab and click on ‘Configure’ and choose “Manually”
7. Click on MTU and change it to “Custom” and set the MTU number to 1453 (this is a networking secret from ancient times, and yes it still works!), then click on “OK”


8. Now click on “Apply” to set your network changes
Quit and relaunch any apps that require network access, like Safari, Chrome, Messages, Mail, and your wireless connectivity should be flawless and back at full speed at this point. 


Fix #1: Add a New Network Location & Renew DHCP
This may work best for those who upgraded from a previous version of OS X to Mountain Lion but if you’re having the wifi drop issue go ahead and do it anyway because it is consistently successful with addressing wireless issues:
Open System Preferences from the  Apple menu and choose “Network”
Pull down the “Location” menu and choose “Edit Locations…”
Click the [+] button to add a new location, name it whatever you want then click Done
Back at the “Network” screen, click the “Network Name” menu and join the wireless network
Your wireless connection may now be active and working fine, but renew the DHCP lease anyway:
From the Network panel, click on the “Advanced” button in the lower right corner, then click the “TCP/IP” tab
Make sure “Configure IPv4:” is set to “Using DHCP” and then click the “Renew DHCP Lease” button, click “Apply” when prompted
The appropriate DHCP settings should be renewed from the connected router, click “OK” and exit out of System Prefs

The network location and DHCP renewal tip resolved similar wifi problems in Lion, and it seems to work in Mountain Lion too for many users.
Fix #2: Change MTU Size to Prevent Dropped Connections
This is a bit geeky but bare with us: MTU stands for Maximum Transmission Unit and controls the largest packet size allowed for transmission over the network. If this setting is greater than network capacity, the computer will experience packet loss and dropped connections. The default setting of 1500 is somewhat aggressive and some networks reject packets of that size, but it turns out that 1453 is just small enough to maintain a consistent connection with most networks but just large enough to not cause any slowdowns, it’s the magic number and an old cisco networking secret.
Open System Preferences from the  Apple menu and select “Network”
Click the “Advanced” button in the lower corner, followed by the “Hardware” tab
Pull down the “Configure” menu and set to “Manually”
Change “MTU” to “Custom” and set the field to “1453”

Click “OK” and close out of Network preferences
Be sure you’re joined on a wireless network, close out of System Preferences, and enjoy theinternet as usual.
Additional Troubleshooting Tips
Sometimes just rebooting the Mac is sufficient to resolve the problems, but that’s not always the case.
Also, some wireless network problems are due to interference with other networks, be sure to check the channel of the router you are connecting to and make sure the connection strength is strong. Now is probably as good of time as any to fire up the all new Wi-Fi scanner in Mountain Lionand check out your network health.
In some situations, performing a clean install of Mountain Lion has worked for users who have consistently upgraded from ancient versions of OS X onward, but realistically that should be considered a worst case scenario and for most users you can get the same effect simply by adding a new Network Location as instructed in fix #1 above.
Let us know in the comments if these tips work for you, or if you find something else that works too.

    
</entry>
<entry [Mon 2015:04:27 14:11:01 EST] INSTALL MYSQL ON OSX 10.10.3 (YOSEMITE)>


https://github.com/MacMiniVault/Mac-Scripts

bash <(curl -Ls http://git.io/eUx7rg)


  
</entry>
<entry [Wed 2014:11:19 11:01:18 EST] INSTALL wget ON OSX>

1. INSTALL Xcode

xcode-select --install


2. GET WGET USING curl

cd ~/Downloads
curl -O http://ftp.gnu.org/gnu/wget/wget-1.15.tar.gz
Extract it and move into it

tar -zxvf wget-1.15.tar.gz
cd wget-1.15/

3. CONFIGURE

./configure
an error may occur on SSL…

configure: error: --with-ssl was given, but GNUTLS is not available.
wget needs to have some type of SSL support GNUTLS is most probably not available on your OS X system – if so use OpenSSL in the configure as an alternative use so re-run the configure with an SSL flag:

./configure --with-ssl=openssl


4. INSTALL

make
sudo make install

INSTALLED TO:

/usr/local/bin/wget


</entry>
<entry [Mon 2014:01:13 13:53:48 EST] INSTALLED ec2-api-tools ON OSX>

1. INSTALL ec2-api-tools WITH brew

brew install ec2-api-tools
Warning: It appears you have MacPorts or Fink installed.
Software installed with other package managers causes known problems for
Homebrew. If a formula fails to build, uninstall MacPorts/Fink and try again.
==> Downloading http://ec2-downloads.s3.amazonaws.com/ec2-api-tools-1.6.9.0.zip
######################################################################## 100.0%
==> Caveats
Before you can use these tools you must export some variables to your $SHELL
and download your X.509 certificate and private key from Amazon Web Services.

Your certificate and private key are available at:
http://aws-portal.amazon.com/gp/aws/developer/account/index.html?action=access-key

Download two ".pem" files, one starting with `pk-`, and one starting with `cert-`.
You need to put both into a folder in your home directory, `~/.ec2`.

To export the needed variables, add them to your dotfiles.
 * On Bash, add them to `~/.bash_profile`.
 * On Zsh, add them to `~/.zprofile` instead.

export JAVA_HOME="$(/usr/libexec/java_home)"
export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
==> Summary
🍺  /usr/local/Cellar/ec2-api-tools/1.6.9.0: 360 files, 16M, built in 8 seconds


2. ADD ENVIRONMENT VARIABLES TO .bash_profile

export JAVA_HOME="$(/usr/libexec/java_home)"
export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"


    
</entry>
<entry [Thu 2014:04:03 14:21:13 EST] CONVERT WEBEX .arf FILE TO .wmv>

1. DOWNLOAD WEBEX PLAYER

http://www.webex.com/downloadplayer.html



    
</entry>
<entry [Mon 2013:10:28 10:43:52 EST] ENABLED USE dscl IN SINGLE USER MODE>

NB: IGNORE THIS ERROR MESSAGE WHEN USING dscl IN SINGLE-USER MODE

    launchctl: Couldn't stat("/System/Library/LaunchDaemons/com.apple.DirectoryServicesLocal.plist"): No such file or directory nothing found to load



NNB: DO THE FOLLOWING TO AVOID THIS ERROR:

launchctl: Couldn't stat ("/System/Library/LaunchDaemons/com.apple.opendirectoryd.plist")
    

1. START UP IN SINGLE USER MODE

HOLD APPLE(Command) KEY AND 'S' KEY


2. MOUNT FILE SYSTEM

mount -uw /


3. LOAD opendirectoryd(8)

launchctl load /System/Library/LaunchDaemons/com.apple.opendirectoryd.plist

    
</entry>