drivers



<entry [Wed 2013:08:14 00:17:01 EST] CANON PIXMA MP495 PRINTER>

NB: DON'T HAVE TO SET ROUTER SSID TO 'BJNPSETUP'

http://ubuntuforums.org/showthread.php?t=1602839&page=11
http://askubuntu.com/questions/145700/canon-mp495-scanner-not-working

PRINTER:
NETGEAR N300 WIRELESS ROUTER (WNR2000 )



1. DOWNLOAD DRIVERS

https://code.launchpad.net/~michael-gruz/+archive/canon-trunk/+packages

12.04 PRINTER DRIVER
cnijfilter-common_3.60.2-0~15~precise1_amd64.deb
cnijfilter-mp495series_3.60.2-0~15~precise1_amd64.deb

12.04 SCANNER DRIVER
scangearmp-common - 1.80-0~11~precise1


2. INSTALL PRINTER DRIVER

cd /home/syoung/software/drivers/canon-pixma-MP595/12.04
sudo dpkg -i cnijfilter-common_3.60.2-0~15~precise1_amd64.deb  cnijfilter-mp495series_3.60.2-0~15~precise1_amd64.deb 

    OK

3. INSTALL SCANNER DRIVER

cd /home/syoung/software/drivers/canon-pixma-MP595/12.04
sudo dpkg -i scangearmp-common_1.80-0~11~precise1_amd64.deb scangearmp-mp495series_1.80-0~11~precise1_amd64.deb 

    OK




    
</entry>
