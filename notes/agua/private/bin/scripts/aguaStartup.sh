#!/bin/sh

#### AUTOMOUNT DATA    
mount -t ext3 /dev/sdh /data

#### START LOG
LOGFILE=/tmp/aguaStartup.log
echo "Doing aguaStartup.sh" > $LOGFILE
echo `date` >> $LOGFILE

#### GET THE INTERNAL IP
META=http://169.254.169.254/latest/meta-data
HOSTNAME=`/usr/bin/curl -s $META/hostname | /bin/sed 's+\..*++g'`
echo "hostname: " $HOSTNAME 2>> $LOGFILE 1>> $LOGFILE

#### SET HOSTNAME
hostname $HOSTNAME  2>> $LOGFILE 1>> $LOGFILE
echo $HOSTNAME > /etc/hostname


#IPV4=`/usr/bin/curl -s $META/public-ipv4`
### DNS API ...
