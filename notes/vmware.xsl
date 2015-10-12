vmware


<entry [Mon 2013:12:30 16:38:56 EST] INSTALL VMWARE ON UBUNTU>

https://help.ubuntu.com/community/VMware/Player
ALSO
http://www.webupd8.org/2012/06/how-to-install-vmware-player-in-ubuntu.html


1. INSTALL DEPENDENCIES

sudo apt-get install build-essential linux-headers-$(uname -r)


2. DOWNLOAD LATEST VERSION (v5.0)

mkdir -p /home/syoung/software/vmware
cd /home/syoung/software/vmware
wget https://my.vmware.com/web/vmware/free#desktop_end_user_computing/vmware_player/5_0



e.g. VMware-Player-5.0.2-1031769.i386.bundle (download the bundle version, not the rpm one) and run it as root using gksudo. You'll get a graphical installer that installs VMware player for you.

gksudo bash ./Downloads/VMware-Player-3.1.4-385536.i386.bundle
Note: this assumes the location of your Downloads folder is home/Downloads. *If nothing appears, you may need to make the file executable. You can do so with this command:

chmod +x ./Downloads/VMware-Player-3.1.4-385536.i386.bundle



    
</entry>