apps.ec2.archive.2

<entry [Fri Dec 10 20:57:02 UTC 2010] DESIGN AGUA INITIALISATION - USER INPUTS KEYS OVER HTTPS AFTER LAUNCH TO AVOID SECURITY RISK >
    
### OLD METHOD: USE SCRIPT AT INSTANCE BOOT TO LOAD KEYS IN USERDATA (NOT SECURE)

emacs /etc/rc.d/rc.local
    #!/bin/sh
    #
    # This script will be executed *after* all the other init scripts.
    # You can put your own initialization stuff in here if you don't
    # want to do the full Sys V style init stuff.
    
    touch /var/lock/subsys/local
    
    exec &> /var/log/agua.log 2>&1
    echo "**** Starting script"
    date
    
    #### MOUNT AGUA DATA & MYSQL
    /agua/bin/scripts/initAws.pl



### NEW METHOD:

USE init.html TO PASS KEYS, ETC. OVER HTTPS TO init.cgi


echo {"username":"agua","mode":"init","data":{"username":"admin","volumesize":1000,"amazonuserid":"7282130200","ec2publiccert":"-----BEGIN CERTIFICATE-----MIICeDCCAeGgAwIBAgIGAPU26XvIMA0GCSqGSIb3DQEBBQUAMFMxCzAJBgNVBAYTAlVTMRMwEQYDVQQKEwpBbWF6b24uY29tMQwwCgYDVQQLEwNBV1MxITAfBgNVBAMTGEFXUyBMaW1pdGVkLUFzc3VyYW5jZSBDQTAeFw0xMDEwMDQxODE0MzlaFw0xMTEwMDQxODE0MzlaMFMxCzAJBgNVBAYTAlVTMRMwEQYDVQQKEwpBbWF6b24uY29tMRcwFQYDVQQLEw5BV1MtRGV2ZWxvcGVyczEWMBQGA1UEAxMNMWdjbG41ZW5qYXcxNDCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEArakx/b3BIYoal1of5iVhZTtgGkFz5InF582kyAviP2Mceou9vcc+RdXHIc4PgTU7N37t5wGP8j9SA7u5dFWxb4TRNONqX6iPskF2DfUKlfFK1mXEp8h7ucGBbY9D4BHu07zQhNczfnjsqGlrRfmBCtrTCFNPy58KuyXceZOb5xMCAwEAAaNXMFUwDgYDVR0PAQH/BAQDAgWgMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMCMAwGA1UdEwEB/wQCMAAwHQYDVR0OBBYEFA2qXsSYvwsst1nAdM9SbVpWytCWMA0GCSqGSIb3DQEBBQUAA4GBAAtHxmSUKGMxiJXy8LjYg1DAG0Z1VYh8juWAzsYLk8I19AqvDp/Z4hB3OeGCmTyY31siCdaAwhkWHX+OIS91HzUi1Uy8774I4O3Ar1wqF5keR25avv/QZREJ68k8yucb7U/+9ds3/uPd2JHq+HyADQfPQUEJwUC8PMLuYkyOikXi-----END CERTIFICATE-----","ec2privatekey":"-----BEGIN PRIVATE KEY-----MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAK2pMf29wSGKGpdaH+YlYWU7YBpBc+SJxefNpMgL4j9jHHqLvb3HPkXVxyHOD4E1Ozd+7ecBj/I/UgO7uXRVsW+E0TTjal+oj7JBdg31CpXxStZlxKfIe7nBgW2PQ+AR7tO80ITXM3547Khpa0X5gQra0whTT8ufCrsl3HmTm+cTAgMBAAECgYBB8ilYuRE5Ik+cwA2zAOjuX1DMR6Sx2Zu8vfvgN5sQBRwQcTZ5dcrxDBBVhwGeSE+XcGz5Nz+pd2A2qLfxNIVvOSqrFHWGLylyPxfp/L3gpvXz/5N+eZ6Y9PT18NiYWmpXEXcKEDT+Msg8Io8CiivYU+cSs1yCq1becopC+EftqQJBAPI/j6T9BlFWO2e4Bu8xxKST3Xc5Q7+6Ux3v7h0bRD225dxrE/ML1/N36GwJq7joWHtscK6+jLJOgm4uBQ9sq+UCQQC3hOXiBHDRVtk8Pn6goRTPxMxAixoqbCP6DDogkigIpuJ4iEvmAYEE4XVfqC1bjay/oHU9hn8AOP0XwAJKHkeXAkAnu28W830eyBL0PwW8I6CKEcqILHdFMg1B4sFeOsOlj6MB1PovqeiggTE4zxlAObORgsa0koJHGINiCOBBmGRVAkEAhfMHw9fP7MxCVVmcHWxVf206VGXznEFAZTNlff6QH/iHVsjM9T3lyQUzIbXkHW4kR947lMPFkQkHmr04Lpc5UwJASiBGFuHXymAL3LzH1tGxZLbWvoXgkLGEJHG2Badq9ADhxHM5OVgq8mV2oG9JJDR0NXZ3GIQGUOVC4ibdjDymrg==-----END PRIVATE KEY-----","awsaccesskeyid":"AKIAIZXZ6S7ARZ44TTHQ","secretaccesskey":"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"}} | perl -U init.cgi


echo '{"username":"agua","mode":"init","data":{"username":"admin","volumesize":1000,"amazonuserid":"7282130200","ec2publiccert":"-----BEGIN CERTIFICATE-----MIICeDCCAeGgAwIBAgIGAPU26XvIMA0GCSqGSIb3DQEBBQUAMFMxCzAJBgNVBAYTAlVTMRMwEQYDVQQKEwpBbWF6b24uY29tMQwwCgYDVQQLEwNBV1MxITAfBgNVBAMTGEFXUyBMaW1pdGVkLUFzc3VyYW5jZSBDQTAeFw0xMDEwMDQxODE0MzlaFw0xMTEwMDQxODE0MzlaMFMxCzAJBgNVBAYTAlVTMRMwEQYDVQQKEwpBbWF6b24uY29tMRcwFQYDVQQLEw5BV1MtRGV2ZWxvcGVyczEWMBQGA1UEAxMNMWdjbG41ZW5qYXcxNDCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEArakx/b3BIYoal1of5iVhZTtgGkFz5InF582kyAviP2Mceou9vcc+RdXHIc4PgTU7N37t5wGP8j9SA7u5dFWxb4TRNONqX6iPskF2DfUKlfFK1mXEp8h7ucGBbY9D4BHu07zQhNczfnjsqGlrRfmBCtrTCFNPy58KuyXceZOb5xMCAwEAAaNXMFUwDgYDVR0PAQH/BAQDAgWgMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMCMAwGA1UdEwEB/wQCMAAwHQYDVR0OBBYEFA2qXsSYvwsst1nAdM9SbVpWytCWMA0GCSqGSIb3DQEBBQUAA4GBAAtHxmSUKGMxiJXy8LjYg1DAG0Z1VYh8juWAzsYLk8I19AqvDp/Z4hB3OeGCmTyY31siCdaAwhkWHX+OIS91HzUi1Uy8774I4O3Ar1wqF5keR25avv/QZREJ68k8yucb7U/+9ds3/uPd2JHq+HyADQfPQUEJwUC8PMLuYkyOikXi-----END CERTIFICATE-----","ec2privatekey":"-----BEGIN PRIVATE KEY-----MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAK2pMf29wSGKGpdaH+YlYWU7YBpBc+SJxefNpMgL4j9jHHqLvb3HPkXVxyHOD4E1Ozd+7ecBj/I/UgO7uXRVsW+E0TTjal+oj7JBdg31CpXxStZlxKfIe7nBgW2PQ+AR7tO80ITXM3547Khpa0X5gQra0whTT8ufCrsl3HmTm+cTAgMBAAECgYBB8ilYuRE5Ik+cwA2zAOjuX1DMR6Sx2Zu8vfvgN5sQBRwQcTZ5dcrxDBBVhwGeSE+XcGz5Nz+pd2A2qLfxNIVvOSqrFHWGLylyPxfp/L3gpvXz/5N+eZ6Y9PT18NiYWmpXEXcKEDT+Msg8Io8CiivYU+cSs1yCq1becopC+EftqQJBAPI/j6T9BlFWO2e4Bu8xxKST3Xc5Q7+6Ux3v7h0bRD225dxrE/ML1/N36GwJq7joWHtscK6+jLJOgm4uBQ9sq+UCQQC3hOXiBHDRVtk8Pn6goRTPxMxAixoqbCP6DDogkigIpuJ4iEvmAYEE4XVfqC1bjay/oHU9hn8AOP0XwAJKHkeXAkAnu28W830eyBL0PwW8I6CKEcqILHdFMg1B4sFeOsOlj6MB1PovqeiggTE4zxlAObORgsa0koJHGINiCOBBmGRVAkEAhfMHw9fP7MxCVVmcHWxVf206VGXznEFAZTNlff6QH/iHVsjM9T3lyQUzIbXkHW4kR947lMPFkQkHmr04Lpc5UwJASiBGFuHXymAL3LzH1tGxZLbWvoXgkLGEJHG2Badq9ADhxHM5OVgq8mV2oG9JJDR0NXZ3GIQGUOVC4ibdjDymrg==-----END PRIVATE KEY-----","awsaccesskeyid":"AKIAIZXZ6S7ARZ44TTHQ","secretaccesskey":"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"}}' | perl -U init.cgi



aws: {"username":"admin","volumesize":1000,"amazonuserid":"7282130200","ec2publiccert":"-----BEGIN CERTIFICATE-----MIICeDCCAeGgAwIBAgIGAPU26XvIMA0GCSqGSIb3DQEBBQUAMFMxCzAJBgNVBAYTAlVTMRMwEQYDVQQKEwpBbWF6b24uY29tMQwwCgYDVQQLEwNBV1MxITAfBgNVBAMTGEFXUyBMaW1pdGVkLUFzc3VyYW5jZSBDQTAeFw0xMDEwMDQxODE0MzlaFw0xMTEwMDQxODE0MzlaMFMxCzAJBgNVBAYTAlVTMRMwEQYDVQQKEwpBbWF6b24uY29tMRcwFQYDVQQLEw5BV1MtRGV2ZWxvcGVyczEWMBQGA1UEAxMNMWdjbG41ZW5qYXcxNDCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEArakx/b3BIYoal1of5iVhZTtgGkFz5InF582kyAviP2Mceou9vcc+RdXHIc4PgTU7N37t5wGP8j9SA7u5dFWxb4TRNONqX6iPskF2DfUKlfFK1mXEp8h7ucGBbY9D4BHu07zQhNczfnjsqGlrRfmBCtrTCFNPy58KuyXceZOb5xMCAwEAAaNXMFUwDgYDVR0PAQH/BAQDAgWgMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMCMAwGA1UdEwEB/wQCMAAwHQYDVR0OBBYEFA2qXsSYvwsst1nAdM9SbVpWytCWMA0GCSqGSIb3DQEBBQUAA4GBAAtHxmSUKGMxiJXy8LjYg1DAG0Z1VYh8juWAzsYLk8I19AqvDp/Z4hB3OeGCmTyY31siCdaAwhkWHX+OIS91HzUi1Uy8774I4O3Ar1wqF5keR25avv/QZREJ68k8yucb7U/+9ds3/uPd2JHq+HyADQfPQUEJwUC8PMLuYkyOikXi-----END CERTIFICATE-----","ec2privatekey":"-----BEGIN PRIVATE KEY-----MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAK2pMf29wSGKGpdaH+YlYWU7YBpBc+SJxefNpMgL4j9jHHqLvb3HPkXVxyHOD4E1Ozd+7ecBj/I/UgO7uXRVsW+E0TTjal+oj7JBdg31CpXxStZlxKfIe7nBgW2PQ+AR7tO80ITXM3547Khpa0X5gQra0whTT8ufCrsl3HmTm+cTAgMBAAECgYBB8ilYuRE5Ik+cwA2zAOjuX1DMR6Sx2Zu8vfvgN5sQBRwQcTZ5dcrxDBBVhwGeSE+XcGz5Nz+pd2A2qLfxNIVvOSqrFHWGLylyPxfp/L3gpvXz/5N+eZ6Y9PT18NiYWmpXEXcKEDT+Msg8Io8CiivYU+cSs1yCq1becopC+EftqQJBAPI/j6T9BlFWO2e4Bu8xxKST3Xc5Q7+6Ux3v7h0bRD225dxrE/ML1/N36GwJq7joWHtscK6+jLJOgm4uBQ9sq+UCQQC3hOXiBHDRVtk8Pn6goRTPxMxAixoqbCP6DDogkigIpuJ4iEvmAYEE4XVfqC1bjay/oHU9hn8AOP0XwAJKHkeXAkAnu28W830eyBL0PwW8I6CKEcqILHdFMg1B4sFeOsOlj6MB1PovqeiggTE4zxlAObORgsa0koJHGINiCOBBmGRVAkEAhfMHw9fP7MxCVVmcHWxVf206VGXznEFAZTNlff6QH/iHVsjM9T3lyQUzIbXkHW4kR947lMPFkQkHmr04Lpc5UwJASiBGFuHXymAL3LzH1tGxZLbWvoXgkLGEJHG2Badq9ADhxHM5OVgq8mV2oG9JJDR0NXZ3GIQGUOVC4ibdjDymrg==-----END PRIVATE KEY-----","awsaccesskeyid":"AKIAIZXZ6S7ARZ44TTHQ","secretaccesskey":"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"}






CONNECT TO AQUARIUS-4:



ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-184-72-83-137.compute-1.amazonaws.com



CHANGE:

cat /etc/fstab

    /dev/sda1  /         ext3    defaults        1 1
    /dev/sdb   /mnt      ext3    defaults        0 0
    none       /dev/pts  devpts  gid=5,mode=620  0 0
    none       /proc     proc    defaults        0 0
    none       /sys      sysfs   defaults        0 0
    /swapfile  none      swap    sw              0 0
    
    /dev/sdi   /nethome      ext3    defaults        0 0
    /nethome/mysql/etc/mysql /etc/mysql     none bind
    /nethome/mysql/lib/mysql /var/lib/mysql none bind
    /nethome/mysql/log/mysql /var/log/mysql none bind

TO THIS:

cat /etc/fstab

    /dev/sda1  /         ext3    defaults        1 1
    none       /dev/pts  devpts  gid=5,mode=620  0 0
    none       /proc     proc    defaults        0 0
    none       /sys      sysfs   defaults        0 0
    /swapfile  none      swap    sw              0 0


SEE WHAT'S MOUNTED NOW:

df -a

    Filesystem            Size  Used Avail Use% Mounted on
    /dev/sda1              10G  5.3G  4.2G  56% /
    none                     0     0     0   -  /proc
    none                     0     0     0   -  /sys
    none                     0     0     0   -  /dev/pts
    /nethome/mysql/etc/mysql
                           10G  5.3G  4.2G  56% /etc/mysql
    /nethome/mysql/lib/mysql
                           10G  5.3G  4.2G  56% /var/lib/mysql
    /nethome/mysql/log/mysql
                           10G  5.3G  4.2G  56% /var/log/mysql
    none                     0     0     0   -  /proc/sys/fs/binfmt_misc
    /dev/sdh               40G   25G   14G  65% /data


REMOVED THE OLD /etc/rc.local FILE:
    
    !/bin/sh
    #
    # This script will be executed *after* all the other init scripts.
    # You can put your own initialization stuff in here if you don't
    # want to do the full Sys V style init stuff.
    
    ###touch /var/lock/subsys/local
    
    exec >/var/log/startup.log
    echo "Starting script"
    
    ###mkdir -p /var/log/startup
    logfile=/var/log/startup/mount.log
    echo "Starting script" >> $logfile
    date >> $logfile
    
    #### START HTTPD
    echo "Starting httpd" >> $logfile
    /etc/init.d/httpd start
    
    #### ATTACH VOLUME
    echo "Attaching volume" >> $logfile
    ###/root/.aws/mount-data.sh
    
    ### MOUNT MYSQL
    echo "Mounting mysql" >> $logfile
    ### /root/.aws/mount-mysql.sh
    
    #### START MYSQL
    echo "Starting mysql" >> $logfile
    /etc/init.d/mysqld restart
    
    #### MOUNT VOLUME


AND REMOVED /root/.aws/mount-agua.sh

    #!/bin/bash
    
    #### START LOG
    exec &> /var/log/agua.log 2>&1
    
    #### VARIABLES
    DATADIR=/data2
    VOLUME=""
    SNAPSHOT=snap-55fe4a3f
    SIZE=40
    DEVICE=/dev/sdf
    
    # Call the environment setup script
    . /root/.aws/aws.sh
    
    # Get basic info from instance meta-data
    INSTANCE_ID=`curl -s http://169.254.169.254/latest/meta-data/instance-id`
    AVAILABILITY_ZONE=`curl -s \
    http://169.254.169.254/latest/meta-data/placement/availability-zone`
    echo "INSTANCE_ID: $INSTANCE_ID"
    echo "AVAILABILITY_ZONE: $AVAILABILITY_ZONE"
    
    ####   Start httpd (allows reporting of errors in later steps)
    echo "Starting httpd"
    /etc/init.d/httpd restart
    
    ####   If not exists, create 'data' EBS volume (max 1 TB, add
    ####   manually later) in user's own account
    
    ####   Mount 'data' EBS volume at /data
    ####   If not exists /data/mysql:
    if ! [ -d $DATADIR ]; then
    
        echo "DATADIR $DATADIR not found"
    
            echo "Creating volume"
                while [[ "$VOLUME" == ""  ]];
                    do
                        echo "ec2-create-volume --snapshot $SNAPSHOT -s $SIZE -z $AVAILABILITY_ZONE"
        
                            VOLUME=`ec2-create-volume --snapshot $SNAPSHOT -s $SIZE -z $AVAILABILITY_ZONE\
                                | grep VOLUME | cut -f2`
                    done
    
        #VOLUME=vol-a519f5cd
        echo "VOLUME" : $VOLUME
        
        #### Attach the volume
        echo "Attaching volume: $VOLUME"
        
        echo "ec2-attach-volume $VOLUME -K $EC2_PRIVATE_KEY -C $EC2_CERT -i $INSTANCE_ID -d $DEVICE"
        
        ec2-attach-volume "$VOLUME" -K "$EC2_PRIVATE_KEY" -C "$EC2_CERT" -i "$INSTANCE_ID" -d "$DEVICE"
        
        while [[ "$VOLUME_STATUS" != "attached"  ]];
        do
            echo "ec2-describe-volumes  --verbose -K $EC2_PRIVATE_KEY -C $EC2_CERT $VOLUME | grep ATTACHMENT | cut -f5"
               VOLUME_STATUS=`ec2-describe-volumes  --verbose -K "$EC2_PRIVATE_KEY" -C "$EC2_CERT" "$VOLUME"\
               | grep ATTACHMENT | cut -f5`
               echo Status of "$VOLUME" : $VOLUME_STATUS
        done
        
        #### MOUNT DEVICE
        echo "mkdir $DATADIR"
        mkdir $DATADIR
        echo "mount $DEVICE $DATADIR"
        mount $DEVICE $DATADIR
        
        #### ADD TO /etc/fstab SO VOLUME DEVICE IS MOUNTED AUTOMATICALLY AFTER REBOOT
        echo "$DEVICE   $DATADIR      ext3    defaults        0 0" | tee -a /etc/fstab
    
        #### START MYSQL FROM AGUA INSTALLATION IN DATADIR
        echo "Loading empty 'agua' database into $DATADIR/mysql"
    
        #### STOP MYSQL
        /etc/init.d/mysqld stop
    
        # CREATE BINDINGS TO LINK TO MYSQL ON EBS VOLUME
        ####   'apps' table is already populated
        ####   'admin' user password is set to default 'open4admin'
        ####   Mysql root password is set to default 'open4root'
        
        # USE bind AND mount TO MIRROR NEW LOCATIONS IN OLD FOLDERS
        # Point MySQL to the correct database files on the EBS volume using mount bind.
    
        # Mount in /etc/mysql
        echo "$DATADIR/mysql/etc/mysql /etc/mysql     none bind" | tee -a /etc/fstab
        mkdir /etc/mysql
        mount /etc/mysql
        
        # Mount in /var/lib
        echo "$DATADIR/mysql/lib/mysql /var/lib/mysql none bind" | tee -a /etc/fstab
        mkdir /var/lib/mysql
        mount /var/lib/mysql
        
        # Mount in /var/log
        echo "$DATADIR/mysql/log/mysql /var/log/mysql none bind" | tee -a /etc/fstab
        mkdir /var/log/mysql
        mount /var/log/mysql
        
        #### START MYSQL FROM $DATADIR/mysql
        /etc/init.d/mysqld start
        
    fi;



AND KEPT ONLY THE HTTPD STARTUP IN THE /etc/rc.d/rc.local FILE:

I.E., REMOVED THIS:

    #!/bin/sh
    
    touch /var/lock/subsys/local
    
    exec &> /var/log/agua.log 2>&1
    echo "**** Starting script"
    date
    
    #### MOUNT AGUA DATA & MYSQL
    /agua/bin/scripts/initAws.pl


AND ADDED THIS:

    #!/bin/sh
    #
    # This script will be executed *after* all the other init scripts.
    # You can put your own initialization stuff in here if you don't
    # want to do the full Sys V style init stuff.
    
    touch /var/lock/subsys/local
        
    exec &> /var/log/agua.log 2>&1
    echo "**** Starting /etc/rc.d/rc.local ****"
    date
    
    ####   Start httpd (allows reporting of errors in later steps)
    echo "Starting httpd"
    /etc/init.d/httpd restart
    
    #### START MYSQL FROM $DATADIR/mysql
    /etc/init.d/mysqld starting




ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-184-72-83-137.compute-1.amazonaws.com






TEST init.cgi
-------------


1. UNMOUNT /data BUT LEAVE /dev/sdh. RUN init.cgi TO SEE IF IT WILL CORRECTLY DETACH THE ATTACHED VOLUME

df -a
    ...
    /dev/sdh               40G   25G   14G  65% /data

umount /data
df -a

    Filesystem            Size  Used Avail Use% Mounted on
    /dev/sda1              10G  5.3G  4.2G  56% /
    none                     0     0     0   -  /proc
    none                     0     0     0   -  /sys
    none                     0     0     0   -  /dev/pts
    /nethome/mysql/etc/mysql
                           10G  5.3G  4.2G  56% /etc/mysql
    /nethome/mysql/lib/mysql
                           10G  5.3G  4.2G  56% /var/lib/mysql
    /nethome/mysql/log/mysql
                           10G  5.3G  4.2G  56% /var/log/mysql
    none                     0     0     0   -  /proc/sys/fs/binfmt_misc


MOUNT /data BY RUNNING init.cgi:

(NOTE: CERTIFICATE AND KEY MUST HAVE '\n' BEFORE AND AFTER CODES)

echo '{"username":"agua","mode":"init","data":{"username":"admin","volumesize":1000,"amazonuserid":"7282130200","ec2publiccert":"-----BEGIN CERTIFICATE-----\nMIICeDCCAeGgAwIBAgIGAPU26XvIMA0GCSqGSIb3DQEBBQUAMFMxCzAJBgNVBAYTAlVTMRMwEQYDVQQKEwpBbWF6b24uY29tMQwwCgYDVQQLEwNBV1MxITAfBgNVBAMTGEFXUyBMaW1pdGVkLUFzc3VyYW5jZSBDQTAeFw0xMDEwMDQxODE0MzlaFw0xMTEwMDQxODE0MzlaMFMxCzAJBgNVBAYTAlVTMRMwEQYDVQQKEwpBbWF6b24uY29tMRcwFQYDVQQLEw5BV1MtRGV2ZWxvcGVyczEWMBQGA1UEAxMNMWdjbG41ZW5qYXcxNDCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEArakx/b3BIYoal1of5iVhZTtgGkFz5InF582kyAviP2Mceou9vcc+RdXHIc4PgTU7N37t5wGP8j9SA7u5dFWxb4TRNONqX6iPskF2DfUKlfFK1mXEp8h7ucGBbY9D4BHu07zQhNczfnjsqGlrRfmBCtrTCFNPy58KuyXceZOb5xMCAwEAAaNXMFUwDgYDVR0PAQH/BAQDAgWgMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMCMAwGA1UdEwEB/wQCMAAwHQYDVR0OBBYEFA2qXsSYvwsst1nAdM9SbVpWytCWMA0GCSqGSIb3DQEBBQUAA4GBAAtHxmSUKGMxiJXy8LjYg1DAG0Z1VYh8juWAzsYLk8I19AqvDp/Z4hB3OeGCmTyY31siCdaAwhkWHX+OIS91HzUi1Uy8774I4O3Ar1wqF5keR25avv/QZREJ68k8yucb7U/+9ds3/uPd2JHq+HyADQfPQUEJwUC8PMLuYkyOikXi\n-----END CERTIFICATE-----","ec2privatekey":"-----BEGIN PRIVATE KEY-----\nMIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAK2pMf29wSGKGpdaH+YlYWU7YBpBc+SJxefNpMgL4j9jHHqLvb3HPkXVxyHOD4E1Ozd+7ecBj/I/UgO7uXRVsW+E0TTjal+oj7JBdg31CpXxStZlxKfIe7nBgW2PQ+AR7tO80ITXM3547Khpa0X5gQra0whTT8ufCrsl3HmTm+cTAgMBAAECgYBB8ilYuRE5Ik+cwA2zAOjuX1DMR6Sx2Zu8vfvgN5sQBRwQcTZ5dcrxDBBVhwGeSE+XcGz5Nz+pd2A2qLfxNIVvOSqrFHWGLylyPxfp/L3gpvXz/5N+eZ6Y9PT18NiYWmpXEXcKEDT+Msg8Io8CiivYU+cSs1yCq1becopC+EftqQJBAPI/j6T9BlFWO2e4Bu8xxKST3Xc5Q7+6Ux3v7h0bRD225dxrE/ML1/N36GwJq7joWHtscK6+jLJOgm4uBQ9sq+UCQQC3hOXiBHDRVtk8Pn6goRTPxMxAixoqbCP6DDogkigIpuJ4iEvmAYEE4XVfqC1bjay/oHU9hn8AOP0XwAJKHkeXAkAnu28W830eyBL0PwW8I6CKEcqILHdFMg1B4sFeOsOlj6MB1PovqeiggTE4zxlAObORgsa0koJHGINiCOBBmGRVAkEAhfMHw9fP7MxCVVmcHWxVf206VGXznEFAZTNlff6QH/iHVsjM9T3lyQUzIbXkHW4kR947lMPFkQkHmr04Lpc5UwJASiBGFuHXymAL3LzH1tGxZLbWvoXgkLGEJHG2Badq9ADhxHM5OVgq8mV2oG9JJDR0NXZ3GIQGUOVC4ibdjDymrg==\n-----END PRIVATE KEY-----","awsaccesskeyid":"AKIAIZXZ6S7ARZ44TTHQ","secretaccesskey":"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"}}' | perl -U init.cgi

    ...
    init.cgi     username: agua
    init.cgi     mode: init
    initAws.pl    dbtype: MySQL
    initAws.pl    usermysql: agua
    initAws.pl    password: open4agua
    initAws.pl    database: agua
    initAws.pl    Creating MySQL dbobject
    Created MySQL dbobject
    Created Admin::AWS object: Admin::AWS=HASH(0x13c9c10)
    Admin::AWS::init   userdata:
    $VAR1 = {
              'mode' => 'init',
              'data' => {
                          'ec2publiccert' => '-----BEGIN CERTIFICATE-----
    MIICeDCCAeGgAwIBAgIGAPU26XvIMA0GCSqGSIb3DQEBBQUAMFMxCzAJBgNVBAYTAlVTMRMwEQYDVQQKEwpBbWF6b24uY29tMQwwCgYDVQQLEwNBV1MxITAfBgNVBAMTGEFXUyBMaW1pdGVkLUFzc3VyYW5jZSBDQTAeFw0xMDEwMDQxODE0MzlaFw0xMTEwMDQxODE0MzlaMFMxCzAJBgNVBAYTAlVTMRMwEQYDVQQKEwpBbWF6b24uY29tMRcwFQYDVQQLEw5BV1MtRGV2ZWxvcGVyczEWMBQGA1UEAxMNMWdjbG41ZW5qYXcxNDCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEArakx/b3BIYoal1of5iVhZTtgGkFz5InF582kyAviP2Mceou9vcc+RdXHIc4PgTU7N37t5wGP8j9SA7u5dFWxb4TRNONqX6iPskF2DfUKlfFK1mXEp8h7ucGBbY9D4BHu07zQhNczfnjsqGlrRfmBCtrTCFNPy58KuyXceZOb5xMCAwEAAaNXMFUwDgYDVR0PAQH/BAQDAgWgMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMCMAwGA1UdEwEB/wQCMAAwHQYDVR0OBBYEFA2qXsSYvwsst1nAdM9SbVpWytCWMA0GCSqGSIb3DQEBBQUAA4GBAAtHxmSUKGMxiJXy8LjYg1DAG0Z1VYh8juWAzsYLk8I19AqvDp/Z4hB3OeGCmTyY31siCdaAwhkWHX+OIS91HzUi1Uy8774I4O3Ar1wqF5keR25avv/QZREJ68k8yucb7U/+9ds3/uPd2JHq+HyADQfPQUEJwUC8PMLuYkyOikXi
    -----END CERTIFICATE-----',
                          'ec2privatekey' => '-----BEGIN PRIVATE KEY-----
    MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAK2pMf29wSGKGpdaH+YlYWU7YBpBc+SJxefNpMgL4j9jHHqLvb3HPkXVxyHOD4E1Ozd+7ecBj/I/UgO7uXRVsW+E0TTjal+oj7JBdg31CpXxStZlxKfIe7nBgW2PQ+AR7tO80ITXM3547Khpa0X5gQra0whTT8ufCrsl3HmTm+cTAgMBAAECgYBB8ilYuRE5Ik+cwA2zAOjuX1DMR6Sx2Zu8vfvgN5sQBRwQcTZ5dcrxDBBVhwGeSE+XcGz5Nz+pd2A2qLfxNIVvOSqrFHWGLylyPxfp/L3gpvXz/5N+eZ6Y9PT18NiYWmpXEXcKEDT+Msg8Io8CiivYU+cSs1yCq1becopC+EftqQJBAPI/j6T9BlFWO2e4Bu8xxKST3Xc5Q7+6Ux3v7h0bRD225dxrE/ML1/N36GwJq7joWHtscK6+jLJOgm4uBQ9sq+UCQQC3hOXiBHDRVtk8Pn6goRTPxMxAixoqbCP6DDogkigIpuJ4iEvmAYEE4XVfqC1bjay/oHU9hn8AOP0XwAJKHkeXAkAnu28W830eyBL0PwW8I6CKEcqILHdFMg1B4sFeOsOlj6MB1PovqeiggTE4zxlAObORgsa0koJHGINiCOBBmGRVAkEAhfMHw9fP7MxCVVmcHWxVf206VGXznEFAZTNlff6QH/iHVsjM9T3lyQUzIbXkHW4kR947lMPFkQkHmr04Lpc5UwJASiBGFuHXymAL3LzH1tGxZLbWvoXgkLGEJHG2Badq9ADhxHM5OVgq8mV2oG9JJDR0NXZ3GIQGUOVC4ibdjDymrg==
    -----END PRIVATE KEY-----',
                          'amazonuserid' => '7282130200',
                          'secretaccesskey' => '4+0Max8DLoykQ+kPeGzP6S4LUJw0y5Ab0DrschU6',
                          'awsaccesskeyid' => 'AKIAIZXZ6S7ARZ44TTHQ',
                          'volumesize' => 1000,
                          'username' => 'admin'
                        },
              'username' => 'agua'
            };
    AWS::init    Doing printKeyfiles()
    Admin::AWS::printKeyfiles    username: admin
    Admin::AWS::printKeyfiles    userdata:
    $VAR1 = {
              'mode' => 'init',
              'data' => {
                          'ec2publiccert' => '-----BEGIN CERTIFICATE-----
    MIICeDCCAeGgAwIBAgIGAPU26XvIMA0GCSqGSIb3DQEBBQUAMFMxCzAJBgNVBAYTAlVTMRMwEQYDVQQKEwpBbWF6b24uY29tMQwwCgYDVQQLEwNBV1MxITAfBgNVBAMTGEFXUyBMaW1pdGVkLUFzc3VyYW5jZSBDQTAeFw0xMDEwMDQxODE0MzlaFw0xMTEwMDQxODE0MzlaMFMxCzAJBgNVBAYTAlVTMRMwEQYDVQQKEwpBbWF6b24uY29tMRcwFQYDVQQLEw5BV1MtRGV2ZWxvcGVyczEWMBQGA1UEAxMNMWdjbG41ZW5qYXcxNDCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEArakx/b3BIYoal1of5iVhZTtgGkFz5InF582kyAviP2Mceou9vcc+RdXHIc4PgTU7N37t5wGP8j9SA7u5dFWxb4TRNONqX6iPskF2DfUKlfFK1mXEp8h7ucGBbY9D4BHu07zQhNczfnjsqGlrRfmBCtrTCFNPy58KuyXceZOb5xMCAwEAAaNXMFUwDgYDVR0PAQH/BAQDAgWgMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMCMAwGA1UdEwEB/wQCMAAwHQYDVR0OBBYEFA2qXsSYvwsst1nAdM9SbVpWytCWMA0GCSqGSIb3DQEBBQUAA4GBAAtHxmSUKGMxiJXy8LjYg1DAG0Z1VYh8juWAzsYLk8I19AqvDp/Z4hB3OeGCmTyY31siCdaAwhkWHX+OIS91HzUi1Uy8774I4O3Ar1wqF5keR25avv/QZREJ68k8yucb7U/+9ds3/uPd2JHq+HyADQfPQUEJwUC8PMLuYkyOikXi
    -----END CERTIFICATE-----',
                          'ec2privatekey' => '-----BEGIN PRIVATE KEY-----
    MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAK2pMf29wSGKGpdaH+YlYWU7YBpBc+SJxefNpMgL4j9jHHqLvb3HPkXVxyHOD4E1Ozd+7ecBj/I/UgO7uXRVsW+E0TTjal+oj7JBdg31CpXxStZlxKfIe7nBgW2PQ+AR7tO80ITXM3547Khpa0X5gQra0whTT8ufCrsl3HmTm+cTAgMBAAECgYBB8ilYuRE5Ik+cwA2zAOjuX1DMR6Sx2Zu8vfvgN5sQBRwQcTZ5dcrxDBBVhwGeSE+XcGz5Nz+pd2A2qLfxNIVvOSqrFHWGLylyPxfp/L3gpvXz/5N+eZ6Y9PT18NiYWmpXEXcKEDT+Msg8Io8CiivYU+cSs1yCq1becopC+EftqQJBAPI/j6T9BlFWO2e4Bu8xxKST3Xc5Q7+6Ux3v7h0bRD225dxrE/ML1/N36GwJq7joWHtscK6+jLJOgm4uBQ9sq+UCQQC3hOXiBHDRVtk8Pn6goRTPxMxAixoqbCP6DDogkigIpuJ4iEvmAYEE4XVfqC1bjay/oHU9hn8AOP0XwAJKHkeXAkAnu28W830eyBL0PwW8I6CKEcqILHdFMg1B4sFeOsOlj6MB1PovqeiggTE4zxlAObORgsa0koJHGINiCOBBmGRVAkEAhfMHw9fP7MxCVVmcHWxVf206VGXznEFAZTNlff6QH/iHVsjM9T3lyQUzIbXkHW4kR947lMPFkQkHmr04Lpc5UwJASiBGFuHXymAL3LzH1tGxZLbWvoXgkLGEJHG2Badq9ADhxHM5OVgq8mV2oG9JJDR0NXZ3GIQGUOVC4ibdjDymrg==
    -----END PRIVATE KEY-----',
                          'amazonuserid' => '7282130200',
                          'secretaccesskey' => '4+0Max8DLoykQ+kPeGzP6S4LUJw0y5Ab0DrschU6',
                          'awsaccesskeyid' => 'AKIAIZXZ6S7ARZ44TTHQ',
                          'volumesize' => 1000,
                          'username' => 'admin'
                        },
              'username' => 'agua'
            };
    AWS::init    Doing setEnvironment()
    AWS::init    Doing mountAguaData()
    Admin::AWS::mountUserData    create_command: ec2-create-volume --snapshot snap-55fe4a3f -s 40 -z us-east-1a -K /agua/home/admin/.keypairs/private.pem -C /agua/home/admin/.keypairs/public.pem  | grep VOLUME | cut -f2
    Admin::AWS::mountAguaData    volumeid: vol-f820f590
    
    Admin::AWS::mountAguaData    instanceid: i-1cd2fe71
    Admin::AWS::detachAttached    volumes: VOLUME   vol-23d9104b    40      snap-55fe4a3f   us-east-1a      available      2010-12-09T19:37:00+0000
     VOLUME vol-8f7891e7    40      snap-55fe4a3f   us-east-1a      available       2010-11-16T01:17:27+0000
     VOLUME vol-6c752005    40              us-east-1a      available       2010-08-25T20:12:52+0000
     VOLUME vol-c8d702a0    40      snap-55fe4a3f   us-east-1a      in-use  2010-12-11T20:04:32+0000
     ATTACHMENT     vol-c8d702a0    i-1cd2fe71      /dev/sdh        attached        2010-12-11T20:04:59+0000
     VOLUME vol-7fc60f17    10      snap-a53276cf   us-east-1a      in-use  2010-12-09T19:35:11+0000
     ATTACHMENT     vol-7fc60f17    i-1cd2fe71      /dev/sda1       attached        2010-12-11T20:03:51+0000
     VOLUME vol-77c60f1f    40      snap-b93276d3   us-east-1a      in-use  2010-12-09T19:35:12+0000
     ATTACHMENT     vol-77c60f1f    i-1cd2fe71      /dev/sdi        attached        2010-12-11T20:03:51+0000
     VOLUME vol-f820f590    40      snap-55fe4a3f   us-east-1a      available       2010-12-12T04:38:17+0000
    
    Admin::AWS::detachAttached    checking volumes for i-1cd2fe71 and /dev/sdh
    Admin::AWS::detachAttached    checking volume: VOLUME   vol-23d9104b    40      snap-55fe4a3f   us-east-1a    available        2010-12-09T19:37:00+0000
    Admin::AWS::detachAttached    checking volume: VOLUME   vol-8f7891e7    40      snap-55fe4a3f   us-east-1a    available        2010-11-16T01:17:27+0000
    Admin::AWS::detachAttached    checking volume: VOLUME   vol-6c752005    40              us-east-1a      available      2010-08-25T20:12:52+0000
    Admin::AWS::detachAttached    checking volume: VOLUME   vol-c8d702a0    40      snap-55fe4a3f   us-east-1a    in-use   2010-12-11T20:04:32+0000
    Admin::AWS::detachAttached    checking volume: ATTACHMENT       vol-c8d702a0    i-1cd2fe71      /dev/sdh      attached 2010-12-11T20:04:59+0000
    Admin::AWS::detachAttached    volume matched: ATTACHMENT        vol-c8d702a0    i-1cd2fe71      /dev/sdh      attached 2010-12-11T20:04:59+0000
    
    Admin::AWS::detachAttached    attachedvolumeid: vol-c8d702a0
    Admin::AWS::detachAttached    Doing self->detachVolume(i-1cd2fe71, /dev/sdh, vol-c8d702a0)Admin::AWS::detachVolume    detach_command: ec2-detach-volume vol-c8d702a0
    Admin::AWS::detachVolume    detach_success: ATTACHMENT  vol-c8d702a0    i-1cd2fe71      /dev/sdh        detaching      2010-12-11T20:04:59+0000
    
    Admin::AWS::detachVolume    counter 0 detach_success: available
    finished detach
    Admin::AWS::mountAguaData    attach_command: ec2-attach-volume vol-f820f590 -i i-1cd2fe71 -d /dev/sdh
    
    
    Admin::AWS::mountAguaData    attach_success: attaching
    
    Admin::AWS::mountAguaData    counter 0 attach_success: attached
    Admin::AWS::mountAguaData    mount_command: mount /dev/sdh /data
    Admin::AWS::mountAguaData    mount_success: 


CONFIRM /data IS MOUNTED:


    [root@domU-12-31-38-01-DA-9B 0.5]# ll /data
    total 48K
    drwxr-xr-x  9 root root 4.0K Oct 18 23:19 .
    drwxr-xr-x 27 root root 4.0K Dec 11 23:35 ..
    drwxr-xr-x  3 root root 4.0K Oct 10 23:49 agua
    drwxr-xr-x 53 root root 4.0K Oct 14 03:48 apps
    drwxr-xr-x  3 root root 4.0K Oct 11 01:50 base
    drwxr-xr-x  2 root root 4.0K Oct 18 19:56 img-mnt
    drwx------  2 root root  16K Oct 10 23:43 lost+found
    drwxr-xr-x  5 root root 4.0K Oct 11 01:07 mysql
    drwxr-xr-x  2 root root 4.0K Oct 11 02:44 starcluster



2. REMOVE /nethome THEN MOUNT /nethome USING init.cgi:
            
mv /nethome /nethome-old



RUN init.cgi'S mountNethome SUBROUTINE:
    
    AWS::init    Doing mountNethome()
    availabilityzone: us-east-1a
    mountpoint: /nethome
    size: 40
    device: /dev/sdi
    Admin::AWS::mountAguaData    instanceid: i-1cd2fe71
    Admin::AWS::mountUserData    create_command: ec2-create-volume -s 40 -z us-east-1a | grep VOLUME | cut -f2
    Admin::AWS::mountAguaData    volumeid: vol-b45683dc
    
    Admin::AWS::detachAttached    volumes: VOLUME   vol-23d9104b    40      snap-55fe4a3f   us-east-1a      available      2010-12-09T19:37:00+0000
     VOLUME vol-2229fc4a    40              us-east-1a      in-use  2010-12-12T05:06:19+0000
     ATTACHMENT     vol-2229fc4a    i-1cd2fe71      /dev/sdi        attached        2010-12-12T05:08:10+0000
     VOLUME vol-8f7891e7    40      snap-55fe4a3f   us-east-1a      available       2010-11-16T01:17:27+0000
     VOLUME vol-6c752005    40              us-east-1a      available       2010-08-25T20:12:52+0000
     VOLUME vol-7fc60f17    10      snap-a53276cf   us-east-1a      in-use  2010-12-09T19:35:11+0000
     ATTACHMENT     vol-7fc60f17    i-1cd2fe71      /dev/sda1       attached        2010-12-11T20:03:51+0000
     VOLUME vol-c8d702a0    40      snap-55fe4a3f   us-east-1a      available       2010-12-11T20:04:32+0000
     VOLUME vol-77c60f1f    40      snap-b93276d3   us-east-1a      available       2010-12-09T19:35:12+0000
     VOLUME vol-f820f590    40      snap-55fe4a3f   us-east-1a      in-use  2010-12-12T04:38:17+0000
     ATTACHMENT     vol-f820f590    i-1cd2fe71      /dev/sdh        attached        2010-12-12T04:39:58+0000
     VOLUME vol-b45683dc    40              us-east-1a      available       2010-12-12T05:43:02+0000
    
    Admin::AWS::detachAttached    checking volumes for i-1cd2fe71 and /dev/sdi
    Admin::AWS::detachAttached    checking volume: VOLUME   vol-23d9104b    40      snap-55fe4a3f   us-east-1a    available        2010-12-09T19:37:00+0000
    Admin::AWS::detachAttached    checking volume: VOLUME   vol-2229fc4a    40              us-east-1a      in-use2010-12-12T05:06:19+0000
    Admin::AWS::detachAttached    checking volume: ATTACHMENT       vol-2229fc4a    i-1cd2fe71      /dev/sdi      attached 2010-12-12T05:08:10+0000
    Admin::AWS::detachAttached    volume matched: ATTACHMENT        vol-2229fc4a    i-1cd2fe71      /dev/sdi      attached 2010-12-12T05:08:10+0000
    
    Admin::AWS::detachAttached    attachedvolumeid: vol-2229fc4a
    Admin::AWS::detachAttached    Doing self->detachVolume(i-1cd2fe71, /dev/sdi, vol-2229fc4a)Admin::AWS::detachVolume    detach_command: ec2-detach-volume vol-2229fc4a
    Admin::AWS::detachVolume    detach_success: ATTACHMENT  vol-2229fc4a    i-1cd2fe71      /dev/sdi        detaching      2010-12-12T05:08:10+0000
    
    Admin::AWS::detachVolume    counter 0 detach_success: available
    finished detach
    Admin::AWS::attachVolume    attach_command: ec2-attach-volume vol-b45683dc -i i-1cd2fe71 -d /dev/sdi
    Admin::AWS::attachVolume    attach_success: attaching
    
    Admin::AWS::attachVolume    counter 0 attach_success: attached
    Admin::AWS::attachVolume    mount_command: mount /dev/sdi /nethome
    mount: you must specify the filesystem type
    Admin::AWS::attachVolume    mount_success: 
    fstab: /dev/sda1  /         ext3    defaults        1 1
     none       /dev/pts  devpts  gid=5,mode=620  0 0
     none       /proc     proc    defaults        0 0
     none       /sys      sysfs   defaults        0 0
     /swapfile  none      swap    sw              0 0
     /dev/sdh               40G   25G   14G  65% /data
    AWS::init    Doing startHttpd()
    Admin::AWS::startHttpd    start_command: /etc/init.d/mysqld start
    Initializing MySQL database:  Installing MySQL system tables...
    OK
    Filling help tables...
    OK
    
    To start mysqld at boot time you have to copy
    support-files/mysql.server to the right place for your system
    
    PLEASE REMEMBER TO SET A PASSWORD FOR THE MySQL root USER !
    To do so, start the server, then issue the following commands:
    /usr/bin/mysqladmin -u root password 'new-password'
    /usr/bin/mysqladmin -u root -h domU-12-31-38-01-DA-9B password 'new-password'
    
    Alternatively you can run:
    /usr/bin/mysql_secure_installation
    
    which will also give you the option of removing the test
    databases and anonymous user created by default.  This is
    strongly recommended for production servers.
    
    See the manual for more instructions.
    
    You can start the MySQL daemon with:
    cd /usr ; /usr/bin/mysqld_safe &
    
    You can test the MySQL daemon with mysql-test-run.pl
    cd mysql-test ; perl mysql-test-run.pl
    
    Please report any problems with the /usr/bin/mysqlbug script!
    
    The latest information about MySQL is available on the web at
    http://www.mysql.com
    Support MySQL by buying support/licenses at http://shop.mysql.com
    [  OK  ]
    Starting MySQL:  [  OK  ]
    [root@domU-12-31-38-01-DA-9B 0.5]# mysql -u root -p
    Enter password: 
    ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)


BEFORE

df -a
    /dev/sda1              10G  5.3G  4.2G  56% /
    none                     0     0     0   -  /proc
    none                     0     0     0   -  /sys
    none                     0     0     0   -  /dev/pts
    none                     0     0     0   -  /proc/sys/fs/binfmt_misc
    /dev/sdh               40G   25G   14G  65% /data
    


AFTER

df -a
    /dev/sda1  /         ext3    defaults        1 1
    none       /dev/pts  devpts  gid=5,mode=620  0 0
    none       /proc     proc    defaults        0 0
    none       /sys      sysfs   defaults        0 0
    /swapfile  none      swap    sw              0 0
    /dev/sdh               40G   25G   14G  65% /data
    /dev/sdi   /nethome      ext3    defaults        0 0
    



3. REMOVE EXISTING MYSQL DIRECTORIES AND THEN RUN init.cgi TO COPY MYSQL TO /etc/mysql, ETC. AND START MYSQL

mv /var/lib/mysql /var/lib/mysql-old
mv /var/log/mysql /var/log/mysql-old
mv /etc/mysql/ /etc/mysql-old

    AWS::init    Doing setEnvironment()
    AWS::init    Doing mountMysql()
    Admin::AWS::mountMysql    mountpoint: /nethome
    Admin::AWS::mountMysql    device: /dev/sdi
    Admin::AWS::mountMysql    Looking for mysqldir: /nethome/mysql
    Common::copyWorkflow    copying /data/mysql to /nethome/mysql
    Common::copyWorkflow    copy result: 96
    Admin::AWS::mountMysql    stop_command: /etc/init.d/mysqld stop
    Stopping MySQL:  [  OK  ]
    Admin::AWS::mountMysql    fstab: /dev/sda1  /         ext3    defaults        1 1
     none       /dev/pts  devpts  gid=5,mode=620  0 0
     none       /proc     proc    defaults        0 0
     none       /sys      sysfs   defaults        0 0
     /swapfile  none      swap    sw              0 0
     /dev/sdh               40G   25G   14G  65% /data
    
    Admin::AWS::mountMysql    mkdir /etc/mysql;
    mount /etc/mysql
    [mntent]: line 6 in /etc/fstab is bad
    Admin::AWS::mountMysql    mkdir /var/lib/mysql;
     mount /var/lib/mysql
    mkdir: cannot create directory `/var/lib/mysql': File exists
    [mntent]: line 6 in /etc/fstab is bad
    Admin::AWS::mountMysql    mkdir /var/log/mysql;
    mount /var/log/mysql
    [mntent]: line 6 in /etc/fstab is bad
    Admin::AWS::mountMysql    start_command: /etc/init.d/mysqld start
    Starting MySQL:  [  OK  ]
    AWS::init    Doing startHttpd()
    Admin::AWS::startHttpd    start_command: /etc/init.d/mysqld start
    Starting MySQL:  [  OK  ]
    
    [root@domU-12-31-38-01-DA-9B 0.5]# mysql -u root -p
    Enter password: 
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 4
    Server version: 5.0.77 Source distribution
    
    Type 'help;' or '\h' for help. Type '\c' to clear the buffer.
    
    mysql> use agua;
    Reading table information for completion of table and column names
    You can turn off this feature to get a quicker startup with -A
    
    Database changed
    mysql> show tables;
    +-------------------+
    | Tables_in_agua    |
    +-------------------+
    | access            | 
    | aguausers         | 
    | app               | 
    | diffs             | 
    | diffs244079       | 
    | etcgroup          | 
    | groupmember       | 
    | groups            | 
    | monitor           | 
    | parameter         | 
    | project           | 
    | report            | 
    | sessions          | 
    | source            | 
    | stage             | 
    | stagejob          | 
    | stageparameter    | 
    | users             | 
    | view              | 
    | workflow          | 
    | workflowparameter | 
    +-------------------+
    21 rows in set (0.00 sec)
    


    OK!




PACKAGE AQUARIUS-4 FOR EXPORT TO AQUARIUS-5 AMI
-----------------------------------------------

# STOP MYSQL
/etc/init.d/mysqld stop

# UNMOUNT /data AND REMOVE
umount /data
rm -fr /data

# UNMOUNT /nethome
umount /nethome    

# REMOVE MYSQL DIRECTORIES
rm -fr /nethome 
rm -fr /var/lib/mysql 
rm -fr /var/log/mysql 
rm -fr /etc/mysql/ 
(FIRST REBOOT TO AVOID 'resource is busy' PROBLEM WHEN DELETING THESE FOLDERS).


# REMOVE MY EC2 KEYS
ll /agua/home/admin/.keypairs/
    -rw------- 1 root root  902 Dec 12 00:53 private.pem
    -rw-rw-rw- 1 root root  902 Dec 12 00:53 public.pem

rm -fr /agua/home/admin/.keypairs/*pem







CREATE AQUARIUS-5 AMI FROM THIS AQUARIUS-4 USING AWS CONSOLE    

AQUARIUS-5 AMI
    ami-b61aecdf




JGILBERT(COMMAND LINE AQUARIUS-5)
---------------------------------

ec2-run-instances \
ami-b61aecdf \
--instance-type t1.micro \
-z us-east-1a \

    RESERVATION     r-2dc7be47      558277860346    default
    INSTANCE        i-6643740b      ami-b61aecdf                    pending         0               t1.micro      2010-12-12T06:54:52+0000 us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled           ebs                                      paravirtual

ec2din

    RESERVATION     r-2dc7be47      558277860346    default
    INSTANCE        i-6643740b      ami-b61aecdf    ec2-184-73-69-212.compute-1.amazonaws.com       ip-10-127-122-172.ec2.internal running         0               t1.micro        2010-12-12T06:54:52+0000        us-east-1a    aki-b51cf9dc     ari-b31cf9da            monitoring-disabled     184.73.69.212   10.127.122.172                ebs                                      paravirtual
    BLOCKDEVICE     /dev/sda1       vol-3e449156    2010-12-12T06:55:02.000Z


CONNECT TO AQUARIUS-5:

ssh -v -i /root/base/apps/ec2/keypair/jgilbert/pk-APKAII4QOUJW7PXZDFLA.pem \
root@ec2-184-73-69-212.compute-1.amazonaws.com


ssh -v -i /root/base/apps/ec2/keypair/jgilbert/pk-QQN6FHMRVQPPCSNYWYZFI7EGBSUXJF5T.pem \
root@ec2-184-72-203-43.compute-1.amazonaws.com


ssh -v -i /root/base/apps/ec2/keypair/jgilbert/pk-QQN6FHMRVQPPCSNYWYZFI7EGBSUXJF5T.pem \
ec2-174-129-114-133.compute-1.amazonaws.com 








SYOUNG (AWS CONSOLE AQUARIUS-5)
-------------------------------

EC2 Instance: i-28427545

AMI ID: ami-b61aecdf	Zone: us-east-1a
Security Groups: default	Type: t1.micro
Status: running	Owner: 728213020069
VPC ID: -	Subnet ID: -
Virtualization: paravirtual	Placement Group:
Reservation: r-41c6bf2b	RAM Disk ID: ari-b31cf9da
Platform: -	Key Pair Name: agua
Kernel ID: aki-b51cf9dc	Monitoring: basic
AMI Launch Index: 0	Elastic IP: -
Root Device: /dev/sda1	Root Device Type: ebs
Block Devices: /dev/sda1=vol-d24491ba:attached:2010-12-12T06:58:09.000Z:true
Lifecycle: normal
Public DNS: ec2-184-72-196-117.compute-1.amazonaws.com
Private DNS: ip-10-122-239-164.ec2.internal
Private IP Address: 10.122.239.164
Launch Time: 2010-12-12 01:58 EST

CONNECT TO AQUARIUS-5:

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-50-16-78-248.compute-1.amazonaws.com


USE init.html TO SAVE KEYS AND INITIALISE:

amazonuserid        728213020069
awsaccesskeyid	    AKIAIZXZ6S7ARZ44TTHQ
awssecretaccesskey	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
ec2publiccert
-----BEGIN CERTIFICATE-----
MIICeDCCAeGgAwIBAgIGAPU26XvIMA0GCSqGSIb3DQEBBQUAMFMxCzAJBgNVBAYTAlVTMRMwEQYDVQQKEwpBbWF6b24uY29tMQwwCgYDVQQLEwNBV1MxITAfBgNVBAMTGEFXUyBMaW1pdGVkLUFzc3VyYW5jZSBDQTAeFw0xMDEwMDQxODE0MzlaFw0xMTEwMDQxODE0MzlaMFMxCzAJBgNVBAYTAlVTMRMwEQYDVQQKEwpBbWF6b24uY29tMRcwFQYDVQQLEw5BV1MtRGV2ZWxvcGVyczEWMBQGA1UEAxMNMWdjbG41ZW5qYXcxNDCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEArakx/b3BIYoal1of5iVhZTtgGkFz5InF582kyAviP2Mceou9vcc+RdXHIc4PgTU7N37t5wGP8j9SA7u5dFWxb4TRNONqX6iPskF2DfUKlfFK1mXEp8h7ucGBbY9D4BHu07zQhNczfnjsqGlrRfmBCtrTCFNPy58KuyXceZOb5xMCAwEAAaNXMFUwDgYDVR0PAQH/BAQDAgWgMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMCMAwGA1UdEwEB/wQCMAAwHQYDVR0OBBYEFA2qXsSYvwsst1nAdM9SbVpWytCWMA0GCSqGSIb3DQEBBQUAA4GBAAtHxmSUKGMxiJXy8LjYg1DAG0Z1VYh8juWAzsYLk8I19AqvDp/Z4hB3OeGCmTyY31siCdaAwhkWHX+OIS91HzUi1Uy8774I4O3Ar1wqF5keR25avv/QZREJ68k8yucb7U/+9ds3/uPd2JHq+HyADQfPQUEJwUC8PMLuYkyOikXi
-----END CERTIFICATE-----

ec2privatekey
-----BEGIN PRIVATE KEY-----
MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAK2pMf29wSGKGpdaH+YlYWU7YBpBc+SJxefNpMgL4j9jHHqLvb3HPkXVxyHOD4E1Ozd+7ecBj/I/UgO7uXRVsW+E0TTjal+oj7JBdg31CpXxStZlxKfIe7nBgW2PQ+AR7tO80ITXM3547Khpa0X5gQra0whTT8ufCrsl3HmTm+cTAgMBAAECgYBB8ilYuRE5Ik+cwA2zAOjuX1DMR6Sx2Zu8vfvgN5sQBRwQcTZ5dcrxDBBVhwGeSE+XcGz5Nz+pd2A2qLfxNIVvOSqrFHWGLylyPxfp/L3gpvXz/5N+eZ6Y9PT18NiYWmpXEXcKEDT+Msg8Io8CiivYU+cSs1yCq1becopC+EftqQJBAPI/j6T9BlFWO2e4Bu8xxKST3Xc5Q7+6Ux3v7h0bRD225dxrE/ML1/N36GwJq7joWHtscK6+jLJOgm4uBQ9sq+UCQQC3hOXiBHDRVtk8Pn6goRTPxMxAixoqbCP6DDogkigIpuJ4iEvmAYEE4XVfqC1bjay/oHU9hn8AOP0XwAJKHkeXAkAnu28W830eyBL0PwW8I6CKEcqILHdFMg1B4sFeOsOlj6MB1PovqeiggTE4zxlAObORgsa0koJHGINiCOBBmGRVAkEAhfMHw9fP7MxCVVmcHWxVf206VGXznEFAZTNlff6QH/iHVsjM9T3lyQUzIbXkHW4kR947lMPFkQkHmr04Lpc5UwJASiBGFuHXymAL3LzH1tGxZLbWvoXgkLGEJHG2Badq9ADhxHM5OVgq8mV2oG9JJDR0NXZ3GIQGUOVC4ibdjDymrg
-----END PRIVATE KEY-----





****** ERROR IN init.cgi WITH FindBin ******





SYOUNG (COMMAND LINE AQUARIUS-5)
--------------------------------

BEFORE ec2din

    RESERVATION     r-095f2c63      728213020069    default
    INSTANCE        i-1cd2fe71      ami-f4788f9d                    stopped agua    0               t1.micro     2010-12-11T20:03:45+0000 us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled          ebs                                      paravirtual
    BLOCKDEVICE     /dev/sda1       vol-7fc60f17    2010-12-09T19:35:12.000Z
    TAG     instance        i-1cd2fe71      Name    aquarius-4

    RESERVATION     r-41c6bf2b      728213020069    default
    INSTANCE        i-28427545      ami-b61aecdf    ec2-50-16-78-248.compute-1.amazonaws.com        ip-10-127-122-129.ec2.internal        running agua    0               t1.micro        2010-12-12T15:58:15+0000        us-east-1a    aki-b51cf9dc    ari-b31cf9da            monitoring-disabled     50.16.78.248    10.127.122.129       ebs                                      paravirtual
    BLOCKDEVICE     /dev/sda1       vol-d24491ba    2010-12-12T06:58:09.000Z
    TAG     instance        i-28427545      Name    aquarius-5


RUN AQUARIUS-5 ON COMMAND LINE:

aquarius-5 AMI: ami-3e19ef57


ec2-run-instances \
ami-3e19ef57 \
--instance-type t1.micro \
-z us-east-1a 
        
    RESERVATION     r-f58bf39f      728213020069    default
    INSTANCE        i-44695f29      ami-3e19ef57                    pending         0               t1.micro      2010-12-12T16:50:31+0000 us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled           ebs                                      paravirtual

ec2din
    
    RESERVATION     r-f58bf39f      728213020069    default
    INSTANCE        i-44695f29      ami-3e19ef57    ec2-174-129-176-149.compute-1.amazonaws.com     ip-10-122-42-182.ec2.internal  running         0               t1.micro        2010-12-12T16:50:31+0000        us-east-1a    aki-b51cf9dc     ari-b31cf9da            monitoring-disabled     174.129.176.149 10.122.42.182                 ebs                                      paravirtual
    BLOCKDEVICE     /dev/sda1       vol-06a97d6e    2010-12-12T16:50:40.000Z



CONNECT:

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-176-149.compute-1.amazonaws.com



SYSTEM LOG:

    ...
    Checking filesystems
    Checking all file systems.
    [/sbin/fsck.ext3 (1) -- /] fsck.ext3 -a /dev/sda1 
    /dev/sda1: clean, 154204/655360 files, 1388257/2621440 blocks
    [  OK  ]
    
    Remounting root filesystem in read-write mode:  [mntent]: line 6 in /etc/fstab is bad
    [  OK  ]
    
    [mntent]: line 6 in /etc/fstab is bad
    Mounting local filesystems:  [mntent]: line 6 in /etc/fstab is bad
    mount: mount point /nethome does not exist
    mount: mount point /etc/mysql does not exist
    mount: mount point /var/lib/mysql does not exist
    mount: mount point /var/log/mysql does not exist
    [FAILED]
    
    Enabling local filesystem quotas:  [  OK  ]
    
    Enabling /etc/fstab swaps:  [  OK  ]
    
    INIT: Entering runlevel: 4
    
    Entering non-interactive startup
    Starting background readahead: [  OK  ]
    
    Bringing up loopback interface:  [  OK  ]
    
    Bringing up interface eth0:  
    Determining IP information for eth0... done.
    [  OK  ]
    
    Starting auditd: [  OK  ]
    
    Starting getsshkey:    % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                     Dload  Upload   Total   Spent    Left  Speed
    
      0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
    curl: (22) The requested URL returned error: 404
    
    getting ssh-key...
      % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                     Dload  Upload   Total   Spent    Left  Speed
    <REPEAT>




DIFFERENCE BETWEEN AQUARIUS-4 AND AQUARIUS-5 INSTANCES:

RESERVATION     r-095f2c63      728213020069    default
INSTANCE        i-1cd2fe71      ami-f4788f9d    ec2-184-72-83-137.compute-1.amazonaws.com    ip-10-122-19-106.ec2.internal    running agua    0               t1.micro        2010-12-12T16:14:38+0000      us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled  184.72.83.137    10.122.19.106                   ebs                                     paravirtual
BLOCKDEVICE     /dev/sda1       vol-7fc60f17    2010-12-09T19:35:12.000Z
TAG     instance        i-1cd2fe71      Name    aquarius-4


RESERVATION     r-f58bf39f      728213020069    default
INSTANCE        i-44695f29      ami-3e19ef57    ec2-174-129-176-149.compute-1.amazonaws.com  ip-10-122-42-182.ec2.internal    running         0               t1.micro        2010-12-12T16:50:31+0000      us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled  174.129.176.149  10.122.42.182                   ebs                                     paravirtual
BLOCKDEVICE     /dev/sda1       vol-06a97d6e    2010-12-12T16:50:40.000Z



    
TWO POSSIBLE WORKAROUNDS FOR 'getting ssh-key' ERROR
----------------------------------------------------


1. USE ec2-import-keypair BEFORE RUNNING INSTANCE

*** TRY THIS FIRST AS DOESN'T NEED REGENERATION OF AQUARIUS-5 AMI.


2. ALTER getsshkey SCRIPT TO NOT USE curl



1. USE ec2-import-keypair BEFORE RUNNING INSTANCE


SEE ABOVE






2. ALTER getsshkey SCRIPT TO NOT USE curl

DIDN'T DO THIS - PROBLEM WITH IT IS THAT YOU CAN ONLY SET THE INDIVIDUAL'S PUBLIC KEY IN ADVANCE SO LIMITED ONLY TO KNOWN USERS


NB: NORMALLY getsshkey WILL DO THE FOLLOWING:

curl -f http://169.254.169.254/latest/meta-data/public-keys/0/openssh-key 

    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCCPnQNSJ8BlNLcb9I/XZW3L1D7iWNzfWs6RJp+H2nMGY3f05ERG1VyuIlADto/8xMypyItInBOGu2Pg1GeOpKYXMVdGtXJ00st5IHPt1gubMMlKki4KCZRqhJu7+mc7ijUa84IX45oEHn7KEf8M6X52npL3sgJw+GSWcKEJ1YQ1AJuykj7SaAAgMoFXvGi9p611ZI1n0PsoupmWAVii9KLd8ZaZEWxiq/NCx/MglBJcYSFzabgi0bmvRdAiY5qYitrMRYLwr1aCk4aZ5ow8wkFvPVqE+I8cpgdyk+fjo/eEnl52aVOaHG7NzUnub3mqXhIy2QozZqxV5k8DzMuqYRL agua

AND WRITE THE OUTPUT TO /root/.ssh/authorized_keys




[root@ip-10-122-19-106 ~]# cat /etc/rc.d/init.d/getsshkey


    #!/bin/bash
    # chkconfig: 4 11 11
    # description: This script fetches the ssh key early. \
    #
    
    start() {
      if [ ! -d /root/.ssh ] ; then
              mkdir -p /root/.ssh
              chmod 700 /root/.ssh
      fi
      # Fetch public key using HTTP
      curl -f http://169.254.169.254/latest/meta-data/public-keys/0/openssh-key > /tmp/my-key
      while [ $? -ne 0 ]
      do
        sleep 1
        echo "getting ssh-key..."
        curl -f http://169.254.169.254/latest/meta-data/public-keys/0/openssh-key > /tmp/my-key
      done
      echo "got ssh-key."
      cat /tmp/my-key >> /root/.ssh/authorized_keys
      chmod 600 /root/.ssh/authorized_keys
      rm /tmp/my-key
    }
    
    stop() {
      echo "Nothing to do here"
    }
    
    restart() {
      stop
      start
    }
    
    # See how we were called.
    case "$1" in
      start)
        start
        ;;
      stop)
        stop
        ;;
      restart)
        restart
        ;;
      *)
        echo $"Usage: $0 {start|stop}"
        exit 1
    esac
    
    exit $?


REPLACE THIS:

      # Fetch public key using HTTP
      curl -f http://169.254.169.254/latest/meta-data/public-keys/0/openssh-key > /tmp/my-key
      while [ $? -ne 0 ]
      do
        sleep 1
        echo "getting ssh-key..."
        curl -f http://169.254.169.254/latest/meta-data/public-keys/0/openssh-key > /tmp/my-key
      done
      echo "got ssh-key."
      cat /tmp/my-key >> /root/.ssh/authorized_keys
      chmod 600 /root/.ssh/authorized_keys
      rm /tmp/my-key


WITH THIS:

  # Fetch public key using HTTP
  cat /tmp/authorized_keys >> /root/.ssh/authorized_keys
  chmod 600 /root/.ssh/authorized_keys

  #curl -f http://169.254.169.254/latest/meta-data/public-keys/0/openssh-key > /tmp/my-key
  #if [ $? -eq 0 ] ; then
 #        cat /tmp/my-key >> /root/.ssh/authorized_keys
  #        chmod 600 /root/.ssh/authorized_keys
  #        rm /tmp/my-key
  #fi
  # or fetch public key using the file in the ephemeral store:
  #if [ -e /mnt/openssh_id.pub ] ; then
  #        cat /mnt/openssh_id.pub >> /root/.ssh/authorized_keys
  #        chmod 600 /root/.ssh/authorized_keys
  #fi


WHERE /tmp/authorized_keys CONTAINS:

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCCPnQNSJ8BlNLcb9I/XZW3L1D7iWNzfWs6RJp+H2nMGY3f05ERG1VyuIlADto/8xMypyItInBOGu2Pg1GeOpKYXMVdGtXJ00st5IHPt1gubMMlKki4KCZRqhJu7+mc7ijUa84IX45oEHn7KEf8M6X52npL3sgJw+GSWcKEJ1YQ1AJuykj7SaAAgMoFXvGi9p611ZI1n0PsoupmWAVii9KLd8ZaZEWxiq/NCx/MglBJcYSFzabgi0bmvRdAiY5qYitrMRYLwr1aCk4aZ5ow8wkFvPVqE+I8cpgdyk+fjo/eEnl52aVOaHG7NzUnub3mqXhIy2QozZqxV5k8DzMuqYRL agua




NOTES
-----



OPEN SSH, HTTP, ETC. PORTS
--------------------------

for port in 22 80 8443 8773; do ec2-authorize default -p $port ; done
    
    Client.InvalidPermission.Duplicate: The permission '0.0.0.0/0-1-22-22' has already been authorized on the specified group
    Client.InvalidPermission.Duplicate: The permission '0.0.0.0/0-1-80-80' has already been authorized on the specified group
    GROUP           default
    PERMISSION              default ALLOWS  tcp     8443    8443    FROM    CIDR    0.0.0.0/0
    GROUP           default
    PERMISSION              default ALLOWS  tcp     8773    8773    FROM    CIDR    0.0.0.0/0
    [root@li182-248 ~]# 





Uploading Personal ssh Keys to Amazon EC2

http://alestic.com/2010/10/ec2-ssh-keys

By Eric Hammond on October 14, 2010 6:23 AM | 2 Comments | 2 TrackBacks
Amazon recently launched the ability to upload your own ssh public key to EC2 so that it can be passed to new instances when they are launched. Prior to this you always had to use an ssh keypair that was generated by Amazon.

The benefits of using your own ssh key include:

Amazon never sees the private part of the ssh key (though they promise they do not save a copy after you downloaded it and we all trust them with this)

The private part of the ssh key is never transmitted over the network (though it always goes over an encrypted connection and we mostly trust this)

You can now upload the same public ssh key to all EC2 regions, so you no longer have to keep track of a separate ssh key for each region.

You can use your default personal ssh key with brand new EC2 instances, so you no longer have to remember to specify options like -i EC2KEYPAIR in every ssh, scp, rsync command.

If you havent yet created an ssh key for your local system, it can be done with the command:

ssh-keygen
You can accept the default file locations, and I recommend using a secure passphrase to keep the key safe.

Here are some sample commands that will upload to all existing regions your personal ssh public key from the default file location on Ubuntu, giving it an EC2 keypair name of your current username. Adjust to suit your preferences:

keypair=$USER  # or some name that is meaningful to you
publickeyfile=$HOME/.ssh/id_rsa.pub
regions=$(ec2-describe-regions | cut -f2)

for region in $regions; do
  echo $region
  ec2-import-keypair --region $region --public-key-file $publickeyfile $keypair
done

When you start new instances, you can now specify this new keypair name and EC2 will provide the previously uploaded public ssh key to the instance, allowing you to ssh in. For example:

ec2-run-instances --key $USER ami-508c7839
[...]
ec2-describe-instances i-88eb15e5
[...]
ssh ubuntu@ec2-184-73-107-172.compute-1.amazonaws.com
Dont forget to terminate the instance if you started one to test this.

[Update]

Based on a Twitter question, I tested uploading a DSA public ssh key (instead of RSA) and got this error from Amazon:

Client.InvalidKeyPair.Format: Invalid DER encoded key material

I dont see why DSA would not work since its just a blurb of text being stored by EC2 and passed to the instance to add to $HOME/.ssh/authorized_keys but there you have it.



INSTALL SCRIPT THAT ALTERS getsshkey TO NOT USE curl
----------------------------------------------------

PROBLEM: RELIES UPON A KEY BEING LEFT IN /tmp (AND HOPEFULLY REMOVED AFTER BOOT...)


echo "starting install"
echo "127.0.0.1         localhost       localhost.localdomain" > /etc/hosts
authconfig --enableshadow --useshadow --enablemd5 --updateall
mv /lib/tls /lib/tls.disabled
echo "Disabling TTYs"
perl -p -i -e 's/(.*tty2)/#\1/' /etc/inittab
perl -p -i -e 's/(.*tty3)/#\1/' /etc/inittab
perl -p -i -e 's/(.*tty4)/#\1/' /etc/inittab
perl -p -i -e 's/(.*tty5)/#\1/' /etc/inittab
perl -p -i -e 's/(.*tty6)/#\1/' /etc/inittab
perl -p -i -e 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
perl -p -i -e 's/#ClientAliveInterval 0/ClientAliveInterval 60/' /etc/ssh/sshd_config
perl -p -i -e 's/#ClientAliveCountMax 3/ClientAliveCountMax 240/' /etc/ssh/sshd_config
service network start
echo "Fetching RightScale"
cat <<'SSH' >/etc/init.d/getsshkey
#!/bin/bash
# chkconfig: 4 11 11
# description: This script fetches the ssh key early. \
#

# Source function library.
. /etc/rc.d/init.d/functions

# Source networking configuration.
[ -r /etc/sysconfig/network ] && . /etc/sysconfig/network

# Check that networking is up.
[ "${NETWORKING}" = "no" ] && exit 1

start() {
  if [ ! -d /root/.ssh ] ; then
          mkdir -p /root/.ssh
          chmod 700 /root/.ssh
  fi
  # Fetch public key using HTTP
  cat /tmp/authorized_keys >> /root/.ssh/authorized_keys
  chmod 600 /root/.ssh/authorized_keys

  #curl -f http://169.254.169.254/latest/meta-data/public-keys/0/openssh-key > /tmp/my-key
  #if [ $? -eq 0 ] ; then
 #        cat /tmp/my-key >> /root/.ssh/authorized_keys
  #        chmod 600 /root/.ssh/authorized_keys
  #        rm /tmp/my-key
  #fi
  # or fetch public key using the file in the ephemeral store:
  #if [ -e /mnt/openssh_id.pub ] ; then
  #        cat /mnt/openssh_id.pub >> /root/.ssh/authorized_keys
  #        chmod 600 /root/.ssh/authorized_keys
  #fi
}

stop() {
  echo "Nothing to do here"
}

restart() {
  stop
  start
}

# See how we were called.
case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart)
    restart
    ;;
  *)
    echo $"Usage: $0 {start|stop}"
    exit 1
esac

exit $?

SSH
chmod +x /etc/init.d/getsshkey
rpm -Uvh http://s3.amazonaws.com/rightscale_scripts/syslog-ng-1.6.12-1.el5.centos.i386.rpm
curl -o /opt/rightscale_scripts.tgz http://s3.amazonaws.com/rightscale_scripts/rightscale_scripts.tgz
tar -xvzf /opt/rightscale_scripts.tgz -C /opt/
ln /opt/rightscale/etc/init.d/rightscale /etc/init.d/rightscale
chmod +x /opt/rightscale/etc/init.d/rightscale
chmod +x /etc/init.d/rightscale
echo "Modifying Services"
chkconfig --add rightscale
chkconfig --add postfix
chkconfig --add getsshkey
chkconfig --level 4 sshd on
chkconfig --level 4 getsshkey on
chkconfig --level 4 rightscale on
chkconfig --level 4 postfix on
chkconfig --level 4 psacct on
chkconfig --level 4 syslog-ng on
chkconfig --level 4 smartd off
chkconfig --level 4 anacron off
chkconfig --level 4 avahi-daemon off
chkconfig --level 4 avahi-dnsconfd off
chkconfig --level 4 apmd off
chkconfig --level 4 acpid off
chkconfig --level 4 auditd off
chkconfig --level 4 irqbalance off
chkconfig --level 4 mdmpd off
chkconfig --level 4 portmap off
chkconfig --level 4 nfslock off
chkconfig --level 4 syslog off
chkconfig --level 4 sendmail off
chkconfig --level 4 cpuspeed off
chkconfig --level 4 cups off
chkconfig --level 4 autofs off
chkconfig --level 4 bluetooth off
chkconfig --level 4 rpcidmapd off
chkconfig --level 4 rpcsvcgssd off
chkconfig --level 4 rpcgssd off
chkconfig --level 4 pcscd off
chkconfig --level 4 gpm off
chkconfig --level 4 hidd off
chkconfig --level 4 xfs off
chkconfig --level 4 yum-updatesd off
chkconfig --del avahi-daemon
chkconfig --del acpid
chkconfig --del auditd
chkconfig --del irqbalance
chkconfig --del mdmpd
chkconfig --del avahi-dnsconfd
chkconfig --del NetworkManager
chkconfig --del NetworkManagerDispatcher
chkconfig --del dhcdbd
chkconfig --del dund
chkconfig --del firstboot
chkconfig --del irda
chkconfig --del apmd
chkconfig --del smartd
chkconfig --del kudzu
chkconfig --del hidd
chkconfig --del gpm
chkconfig --del pcscd
chkconfig --del bluetooth
chkconfig --del cpuspeed
chkconfig --del cups
chkconfig --del rdisc
chkconfig --del sendmail
chkconfig --del readahead_later
chkconfig --del syslog
chkconfig --del wpa_supplicant
chkconfig --del pand
chkconfig --del netplugd

echo "Installing Software"
cd /tmp/updates
rpm -Uvh *.rpm --no-deps --force
tar -xvzf linux-2.6.16-ec2.tgz
mv linux-2.6.16-xenU/ /usr/src/
ln -sf /usr/src/linux-2.6.16-xenU/include/acpi /usr/include/acpi
ln -sf /usr/src/linux-2.6.16-xenU/include/asm /usr/include/asm
ln -sf /usr/src/linux-2.6.16-xenU/include/asm /usr/include/asm-generic
ln -sf /usr/src/linux-2.6.16-xenU/include/config /usr/include/config
ln -sf /usr/src/linux-2.6.16-xenU/include/keys /usr/include/keys
ln -sf /usr/src/linux-2.6.16-xenU/include/linux /usr/include/linux
ln -sf /usr/src/linux-2.6.16-xenU/include/math-emu /usr/include/math-emu
ln -sf /usr/src/linux-2.6.16-xenU/include/media /usr/include/media
ln -sf /usr/src/linux-2.6.16-xenU/include/mtd /usr/include/mtd
ln -sf /usr/src/linux-2.6.16-xenU/include/pcmcia /usr/include/pcmcia
ln -sf /usr/src/linux-2.6.16-xenU/include/rdma /usr/include/rdma
ln -sf /usr/src/linux-2.6.16-xenU/include/rxrpc /usr/include/rxrpc
ln -sf /usr/src/linux-2.6.16-xenU/include/sound /usr/include/sound
ln -sf /usr/src/linux-2.6.16-xenU/include/video /usr/include/video
ln -sf /usr/src/linux-2.6.16-xenU/include/xen /usr/include/xen
echo "Lets Add Java"
mkdir /usr/java
curl -o /usr/java/java.tar.gz http://s3.amazonaws.com/rightscale_java/java.tar.gz
tar -xvzf /usr/java/java.tar.gz
ln -s /usr/java/jre1.6.0_01 /usr/java/latest
ln -s /usr/java/latest /usr/java/default
curl -o /tmp/updates/jre-6u1-linux-i586.rpm http://s3.amazonaws.com/rightscale_java/jre-6u1-linux-i586.rpm
rpm -Uvh /tmp/updates/jre-6u1-linux-i586.rpm
rm -f /usr/java/java.tar.gz
echo "export JAVA_HOME=/usr/java/default" >> /etc/profile.d/java.sh
chmod +x /etc/profile.d/java.sh
echo "Add EC2 Tools"
mkdir /home/ec2
mkdir /home/ec2/etc
curl -o /tmp/ec2-api-tools-1.2-9739.zip http://s3.amazonaws.com/ec2-downloads/ec2-api-tools-1.2-9739.zip
unzip /tmp/ec2-api-tools-1.2-9739.zip -d /tmp/
mv /tmp/ec2-api-tools-1.2-9739/* /home/ec2/
rm -fr /tmp/ec2*
chmod o-w /home/ec2
echo "More EC2 Mods"
cat <<'PROMPT'> /etc/profile.d/prompt.sh
PS1="[\u@\h:\w] "
PROMPT
chmod +x /etc/profile.d/prompt.sh
cat <<'EC2'> /etc/profile.d/ec2.sh
export EC2_CERT=/home/ec2/etc/cert.pem
export EC2_HOME=/home/ec2
export EC2_PRIVATE_KEY=/home/ec2/etc/pk.pem
export AWS_ACCOUNT_NUMBER=981691651230
export AWS_ACCESS_KEY_ID=0B2WWTCZH7R7NSX5D102
export AWS_BUCKET=getabby
export IMAGE_NAME=getabbybase
export PATH=$PATH:/home/ec2/bin/
EC2

chmod +x /etc/profile.d/ec2.sh
ln -f /opt/rightscale/etc/motd /etc/motd
echo "RubyGems"
wget http://rubyforge.org/frs/download.php/17190/rubygems-0.9.2.tgz
tar -xvzf rubygems-0.9.2.tgz
cd rubygems-0.9.2
ruby setup.rb
gem update
mkdir -p /tmp/updates
curl -o /tmp/updates/s3sync.gem http://exdolo.com/s3sync.gem
gem install /tmp/updates/s3sync.gem
gem install xml-simple net-ssh net-sftp -y
updatedb
cat << AMI> /etc/cron.daily/do_amitools_update.sh
#!/bin/bash
#
# do_amitools_update.sh: updates ami-tools to the latest version..
#
## Include Files:
. /var/spool/ec2/meta-data.sh
. /var/spool/ec2/user-data.sh

# Update the EC2 AMI creation tools
echo " + Updating ec2-ami-tools"
curl -o /tmp/ec2-ami-tools.noarch.rpm http://s3.amazonaws.com/ec2-downloads/ec2-ami-tools.noarch.rpm && \
rpm -Uvh --nodeps /tmp/ec2-ami-tools.noarch.rpm && \
echo " + Updated ec2-ami-tools"

## Cleanup FileSystem
rm -f /tmp/ec2-ami-tools.noarch.rpm
rm -f /tmp/ec2-ami-tools.noarch.rpm.*

AMI

chmod +x /etc/cron.daily/do_amitools_update.sh
cat <<'YUM'> /etc/yum.repos.d/CentOS-Base.repo

# CentOS-Base.repo
#
# This file uses a new mirrorlist system developed by Lance Davis for CentOS.
# The mirror system uses the connecting IP address of the client and the
# update status of each mirror to pick mirrors that are updated to and
# geographically close to the client.  You should use this for CentOS updates
# unless you are manually picking other mirrors.
#
# If the mirrorlist= does not work for you, as a fall back you can try the
# remarked out baseurl= line instead.
#
#

[base]
name=CentOS-4 - Base
baseurl=http://mirror.centos.org/centos/4/os/i386/
gpgcheck=1
gpgkey=http://mirror.centos.org/centos/RPM-GPG-KEY-centos4
priority=1
protect=1

#released updates
[update]
name=CentOS-4 - Updates
baseurl=http://mirror.centos.org/centos/4/updates/i386/
gpgcheck=1
gpgkey=http://mirror.centos.org/centos/RPM-GPG-KEY-centos4
priority=1
protect=1

#packages used/produced in the build but not released
[addons]
name=CentOS-4 - Addons
baseurl=http://mirror.centos.org/centos/4/addons/i386/
gpgcheck=1
gpgkey=http://mirror.centos.org/centos/RPM-GPG-KEY-centos4
priority=1
[extras]
name=CentOS 4 Extras $releasever - $basearch
baseurl=http://mirror.centos.org/centos/4/extras/i386/
enabled=1

YUM

exit











CAN'T CONNECT TO JGILBERT INSTANCE OF AQUARIUS-4 BECAUSE OF ERROR MOUNTING /mnt SO REMOVE /mnt FROM /etc/fstab:

    /dev/sdb   /mnt      ext3    defaults        0 0


ssh -v -i /root/base/apps/ec2/keypair/jgilbert/pk-APKAII4QOUJW7PXZDFLA.pem \
root@ec2-184-72-203-43.compute-1.amazonaws.com

ssh -v -i /root/base/apps/ec2/keypair/jgilbert/pk-QQN6FHMRVQPPCSNYWYZFI7EGBSUXJF5T.pem \
root@ec2-184-72-203-43.compute-1.amazonaws.com

ALL THE ABOVE SSH COMMAND GAVE THE CONNECTION REFUSED ERROR:
    
    OpenSSH_4.3p2, OpenSSL 0.9.8e-fips-rhel5 01 Jul 2008
    debug1: Reading configuration data /etc/ssh/ssh_config
    debug1: Applying options for *
    debug1: Connecting to ec2-184-72-203-43.compute-1.amazonaws.com [184.72.203.43] port 22.
    debug1: connect to address 184.72.203.43 port 22: Connection refused
    ssh: connect to host ec2-184-72-203-43.compute-1.amazonaws.com port 22: Connection refused



LAUNCHED NEW AQUARIUS-4 USING AWS CONSOLE INSTEAD OF COMMAND LINE (WITH USERDATA FILE) BUT STILL GO THE SAME SSH ERROR.




AS syoung, LAUNCHED AQUARIUS-4 USING AWS CONSOLE


C2 Instance: i-1cd2fe71
AMI ID: ami-f4788f9d	Zone: us-east-1a
Security Groups: default	Type: t1.micro
Status: running	Owner: 728213020069
VPC ID: -	Subnet ID: -
Virtualization: paravirtual	Placement Group:
Reservation: r-095f2c63	RAM Disk ID: ari-b31cf9da
Platform: -	Key Pair Name: agua
Kernel ID: aki-b51cf9dc	Monitoring: basic
AMI Launch Index: 0	Elastic IP: -
Root Device: /dev/sda1	Root Device Type: ebs
Block Devices: /dev/sda1,/dev/sdi,/dev/sdh=vol-7fc60f17,vol-77c60f1f,vol-23d9104b:attached,attached,attached:2010-12-09T19:35:12.000Z,2010-12-09T19:35:12.000Z,2010-12-09T19:37:27.000Z:true,false,false
Lifecycle: normal
Public DNS: ec2-184-72-165-176.compute-1.amazonaws.com
Private DNS: domU-12-31-38-04-18-77.compute-1.internal
Private IP Address: 10.220.27.133
Launch Time: 2010-12-09 14:35 EST
State Transition Reason:

ATTACHED VOLUMES:

/dev/sdh    vol-7fc60f17
/dev/sda1   vol-77c60f1f
/dev/sdi    vol-23d9104b


CONNECTED OK:

ssh -i /root/base/apps/ec2/keypair/agua.pem \
ec2-184-72-165-176.compute-1.amazonaws.com


ssh -i /root/base/apps/ec2/keypair/agua.pem \
ec2-184-72-165-176.compute-1.amazonaws.com

    The authenticity of host 'ec2-184-72-165-176.compute-1.amazonaws.com (184.72.165.176)' can't be established.
    RSA key fingerprint is 4f:8c:78:d2:48:fc:a1:88:da:3b:c9:ee:95:18:11:6d.
    Are you sure you want to continue connecting (yes/no)? YES
    Warning: Permanently added 'ec2-184-72-165-176.compute-1.amazonaws.com,184.72.165.176' (RSA) to the list of known hosts.
    Last login: Fri Nov 19 10:21:37 2010 from 129.171.150.136
         ___   _        __   __   ____            __    
        / _ \ (_)___ _ / /  / /_ / __/____ ___ _ / /___ 
       / , _// // _ `// _ \/ __/_\ \ / __// _ `// // -_)
      /_/|_|/_/ \_, //_//_/\__//___/ \__/ \_,_//_/ \__/ 
               /___/                                                 
                                                  
    Welcome to a public Amazon EC2 image brought to you by RightScale!
    
    ********************************************************************
    ********************************************************************
    ***       Your EC2 Instance is now operational.                  ***
    ***       All of the configuration has completed.                ***
    ***       Please check /var/log/install for details.             ***
    ********************************************************************
    ********************************************************************
    [root@domU-12-31-38-04-18-77 ~]# OK
    
    
    
    [root@domU-12-31-38-04-18-77 ~]# cat /etc/fstab
    /dev/sda1  /         ext3    defaults        1 1
    /dev/sdb   /mnt      ext3    defaults        0 0
    none       /dev/pts  devpts  gid=5,mode=620  0 0
    none       /proc     proc    defaults        0 0
    none       /sys      sysfs   defaults        0 0
    /swapfile  none      swap    sw              0 0
    
    /dev/sdi   /nethome      ext3    defaults        0 0
    /nethome/mysql/etc/mysql /etc/mysql     none bind
    /nethome/mysql/lib/mysql /var/lib/mysql none bind
    /nethome/mysql/log/mysql /var/log/mysql none bind




RESTART AQUARIUS-3

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-177-154.compute-1.amazonaws.com

Last login: Fri Nov 19 12:31:24 2010 from 129.171.150.136
     ___   _        __   __   ____            __    
    / _ \ (_)___ _ / /  / /_ / __/____ ___ _ / /___ 
   / , _// // _ `// _ \/ __/_\ \ / __// _ `// // -_)
  /_/|_|/_/ \_, //_//_/\__//___/ \__/ \_,_//_/ \__/ 
           /___/                                                 
                                              
Welcome to a public Amazon EC2 image brought to you by RightScale!

********************************************************************
********************************************************************
***       Your EC2 Instance is now operational.                  ***
***       All of the configuration has completed.                ***
***       Please check /var/log/install for details.             ***
********************************************************************
********************************************************************

[root@domU-12-31-38-04-9D-A1 ~]# cat /etc/fstab
/dev/sda1  /         ext3    defaults        1 1
/dev/sdb   /mnt      ext3    defaults        0 0
none       /dev/pts  devpts  gid=5,mode=620  0 0
none       /proc     proc    defaults        0 0
none       /sys      sysfs   defaults        0 0
/swapfile  none      swap    sw              0 0

[root@domU-12-31-38-04-9D-A1 ~]# df -a
Filesystem            Size  Used Avail Use% Mounted on
/dev/sda1              10G  5.3G  4.2G  56% /
none                     0     0     0   -  /proc
none                     0     0     0   -  /sys
none                     0     0     0   -  /dev/pts
/dev/sdb              414G  199M  393G   1% /mnt
none                     0     0     0   -  /proc/sys/fs/binfmt_misc
/dev/sdh               40G   25G   14G  65% /data




CAN'T CONNECT TO RECENTLY LAUNCHED 

ssh -i /root/base/apps/ec2/keypair/agua.pem \
ec2-174-129-154-216.compute-1.amazonaws.com

ssh: connect to host ec2-174-129-154-216.compute-1.amazonaws.com port 22: Connection refused




</entry>



<entry [Thu Dec  9 14:12:22 EST 2010] TEST JGILBERT LAUNCH INSTANCES>



EC2 ON OSX
http://www.robertsosinski.com/2008/01/26/starting-amazon-ec2-with-mac-os-x/

EC2 SECURITY
http://www.smartfrog.org/wiki/display/sf/EC2+Security

SSH - MUST COPY PUBLIC CERTIFICATE TO /root/.ssh/id_rsa FILE
http://www.smartfrog.org/wiki/display/sf/EC2+Security

USER DATA FILE
http://alestic.com/2009/06/ec2-user-data-scripts

Debugging Tip: If you add set -x at the top of a bash script, then it will output every command executed. If you add set -e to the script, then the user-data script will exit on the first command which does not succeed. These help you quickly identify where problems might have started.

Security: The complete user-data input is available to any user or process running on the instance (THAT CAN MAKE A NETWORK CONNECTION FROM THE INSTANCE. SEE: http://docs.amazonwebservices.com/AWSEC2/latest/DeveloperGuide/index.html?AESDG-chapter-instancedata.html). There is no way to change the instance user-data after instance startup, so anybody who has access to the instance can simply request http://169.254.169.254/latest/user-data



LAUNCH AQUARIUS-4 AS JGILBERT: ami-f4788f9d
-------------------------------------------

1. CREATE JGILBERT USER DATA FILE

mkdir -p /root/base/apps/ec2/userdata/jgilbert
emacs /root/base/apps/ec2/userdata/jgilbert/userdata.txt

amazonuserid=558277860346&awsaccesskeyid=AKIAJWZIAB2ZZB7FHJIQ&awssecretaccesskey=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&ec2publiccert=-----BEGIN CERTIFICATE-----\nMIICdzCCAeCgAwIBAgIFHoFGKBUwDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMYQVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTEwMTExOTE2NDMzNFoXDTExMTExOTE2NDMzNFowUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAVBgNVBAsTDkFXUy1EZXZlbG9wZXJzMRYwFAYDVQQDEw0xd2h3enZlN21ueGNhMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCBAssW9lEbOI1zeh5SAoUqncF6ezQ7M0ZGfgPfo/bKkmxTZitcDbHlPx8i2RDsrrhjFkBPOY6cJaguUIqZrVi80mAYlk     C/WatU0OKRMtOQsGPV7MMhMNSYD1wwN48SiDpWnF9WoSIdyXnNmywDTzPVemJWMMbCUrB9h+VppPPpEwIDAQABo1cwVTAOBgNVHQ8BAf8EBAMCBaAwFgYDVR0lAQH/BAwwCgYIKwYBBQUHAwIwDAYDVR0TAQH/BAIwADAdBgNVHQ4EFgQUls+H6G2aw4Di4BAiw39F5NjCNZswDQYJKoZIhvcNAQEFBQADgYEAbW0DkQ9+pqJO8bxoKUGgskdkJo9pzvF+5qeG/ncPyEYXj0ufrBqcEBfOmIBC0af7N5uFYZ9yvMm4QI7mR9K7Gjfmwa3pq1zHVyfNkuAd4XVdX4x4/eYGwGPDDqqqudkI0PEjYqYism14Gy9EA49oP9CWbJzhkHqqiHDjsuOAN8E=\n-----END CERTIFICATE-----&ec2privatekey=-----BEGIN PRIVATE KEY-----\nMIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAIECyxb2URs4jXN6HlIChSqdwXp7NDszRkZ+A9+j9sqSbFNmK1wNseU/HyLZEOyuuGMWQE85jpwlqC5QipmtWLzSYBiWQL9Zq1TQ4pEy05CwY9XswyEw1JgPXDA3jxKIOlacX1ahIh3Jec2bLANPM9V6YlYwxsJSsH2H5Wmk8+kTAgMBAAECgYA8oGFsQwjOb/8ZO1QwWfrWkhgwROHAyFHIIsQTPuxlOfYqIyNROSZWgxlQuQ1ZDKqd9gD2uieofZHRYgwgN/Qw69GuDUt9HzcNQ5yDPm3Ofa0WcD0tQa9YToHqEWVQaddc8D6DLcOwBDEropf2OIqd4JFusmenVBSIETihVKX8cQJBAM3Zs6W4nWtDExw7QlucgiKC0/R5exBk+BGVBAGHHcBTy+WXFrycUEJbj6q/PEIdGFxFvcO6GUk8x0JFGBgEB28CQQCgcNVc2Ar3kN3BAeM0xM5SVWlDYjDZwq5KId72g6CI/tcfjdpIHNI7yGlMNj4YPKOW2CAZebPLj3C74wclPUadAkEAgOcVju33baaX/fLBz/pGp3PDZHD59j8z9FabJpXEtJ4ErWWacEt2GseZRHPyOPhdO9LUTQ9pLCpqIH6B4vAK8wJAa0cnE16N7r1Z2Y1Wi9kwkBL2QI0uVtz6xyzgtfqLZC7qTvn9w4wp8rlt1vzKBlC9ncZDqGUdGHaADdGe3IKdbQJATBQ5VR3WM0lx6BrxXtHlxmmTikQ1mTlEdkjL4xJ9iXw7cRIIVdDzAait4TwuoxWxNODHlfMxK4ul8zcEE5bSlw==\n-----END PRIVATE KEY-----



RUN INSTANCE AS SYOUNG
----------------------

AMAZON 12-DIGIT USER ID
728213020069

1. CREATE USER DATA FILE

emacs /root/base/apps/ec2/userdata/syoung.txt
amazonuserid=728213020069&awsaccesskeyid=AKIAIZXZ6S7ARZ44TTHQ&awssecretaccesskey=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&ec2publiccert=-----BEGIN CERTIFICATE-----\nMIICeDCCAeGgAwIBAgIGAPU26XvIMA0GCSqGSIb3DQEBBQUAMFMxCzAJBgNVBAYTAlVTMRMwEQYDVQQKEwpBbWF6b24uY29tMQwwCgYDVQQLEwNBV1MxITAfBgNVBAMTGEFXUyBMaW1pdGVkLUFzc3VyYW5jZSBDQTAeFw0xMDEwMDQxODE0MzlaFw0xMTEwMDQxODE0MzlaMFMxCzAJBgNVBAYTAlVTMRMwEQYDVQQKEwpBbWF6b24uY29tMRcwFQYDVQQLEw5BV1MtRGV2ZWxvcGVyczEWMBQGA1UEAxMNMWdjbG41ZW5qYXcxNDCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEArakx/b3BIYoal1of5iVhZTtgGkFz5InF582kyAviP2Mceou9vcc+RdXHIc4PgTU7N37t5wGP8j9SA7u5dFWxb4TRNONqX6iPskF2DfUKlfFK1mXEp8h7ucGBbY9D4BHu07zQhNczfnjsqGlrRfmBCtrTCFNPy58KuyXceZOb5xMCAwEAAaNXMFUwDgYDVR0PAQH/BAQDAgWgMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMCMAwGA1UdEwEB/wQCMAAwHQYDVR0OBBYEFA2qXsSYvwsst1nAdM9SbVpWytCWMA0GCSqGSIb3DQEBBQUAA4GBAAtHxmSUKGMxiJXy8LjYg1DAG0Z1VYh8juWAzsYLk8I19AqvDp/Z4hB3OeGCmTyY31siCdaAwhkWHX+OIS91HzUi1Uy8774I4O3Ar1wqF5keR25avv/QZREJ68k8yucb7U/+9ds3/uPd2JHq+HyADQfPQUEJwUC8PMLuYkyOikXi\n-----END CERTIFICATE-----&ec2privatekey=-----BEGIN PRIVATE KEY-----\nMIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAK2pMf29wSGKGpdaH+YlYWU7YBpBc+SJxefNpMgL4j9jHHqLvb3HPkXVxyHOD4E1Ozd+7ecBj/I/UgO7uXRVsW+E0TTjal+oj7JBdg31CpXxStZlxKfIe7nBgW2PQ+AR7tO80ITXM3547Khpa0X5gQra0whTT8ufCrsl3HmTm+cTAgMBAAECgYBB8ilYuRE5Ik+cwA2zAOjuX1DMR6Sx2Zu8vfvgN5sQBRwQcTZ5dcrxDBBVhwGeSE+XcGz5Nz+pd2A2qLfxNIVvOSqrFHWGLylyPxfp/L3gpvXz/5N+eZ6Y9PT18NiYWmpXEXcKEDT+Msg8Io8CiivYU+cSs1yCq1becopC+EftqQJBAPI/j6T9BlFWO2e4Bu8xxKST3Xc5Q7+6Ux3v7h0bRD225dxrE/ML1/N36GwJq7joWHtscK6+jLJOgm4uBQ9sq+UCQQC3hOXiBHDRVtk8Pn6goRTPxMxAixoqbCP6DDogkigIpuJ4iEvmAYEE4XVfqC1bjay/oHU9hn8AOP0XwAJKHkeXAkAnu28W830eyBL0PwW8I6CKEcqILHdFMg1B4sFeOsOlj6MB1PovqeiggTE4zxlAObORgsa0koJHGINiCOBBmGRVAkEAhfMHw9fP7MxCVVmcHWxVf206VGXznEFAZTNlff6QH/iHVsjM9T3lyQUzIbXkHW4kR947lMPFkQkHmr04Lpc5UwJASiBGFuHXymAL3LzH1tGxZLbWvoXgkLGEJHG2Badq9ADhxHM5OVgq8mV2oG9JJDR0NXZ3GIQGUOVC4ibdjDymrg==\n-----END PRIVATE KEY-----


2. RUN INSTANCE


keysy

ec2-run-instances \
ami-f4788f9d \
--instance-type t1.micro \
-z us-east-1a \
--user-data-file /root/base/apps/ec2/userdata/syoung.txt
    
    RESERVATION     r-25fc8c4f      728213020069    default
    INSTANCE        i-589db035      ami-f4788f9d                    pending         0               t1.micr2010-12-09T14:52:58+0000 us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled    ebs                                      paravirtual


ec2-describe-instances    

RESERVATION     r-25fc8c4f      728213020069    default
INSTANCE        i-589db035      ami-f4788f9d                    pending         0               t1.micr2010-12-09T14:52:58+0000 us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled    ebs                                      paravirtual
[root@li182-248 ~]# ec2-describe-instances                                                             
RESERVATION     r-cbef69a1      728213020069    default
INSTANCE        i-84791ee9      ami-de2ed9b7                    stopped agua    0               t1.micr2010-12-07T17:43:47+0000 us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled    ebs                                      paravirtual
BLOCKDEVICE     /dev/sda1       vol-2d789145    2010-11-16T01:15:45.000Z
TAG     instance        i-84791ee9      Name    aquarius-2
RESERVATION     r-2d69e747      728213020069    default
INSTANCE        i-28056e45      ami-6a788f03                    stopped agua    0               m1.larg2010-11-19T15:19:38+0000 us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled    ebs                                      paravirtual
BLOCKDEVICE     /dev/sda1       vol-0bd02463    2010-11-19T15:19:42.000Z
TAG     instance        i-28056e45      Name    aquarius-3

RESERVATION     r-25fc8c4f      728213020069    default
INSTANCE        i-589db035      ami-f4788f9d    ec2-184-73-78-67.compute-1.amazonaws.com        ip-10-122-94-13.ec2.internal    running         0               t1.micro        2010-12-09T14:52:58+0000       us-east-1a       aki-b51cf9dc    ari-b31cf9da            monitoring-disabled     184.73.78.67    10.122.94.13                    ebs                                     paravirtual






NOTE IDs:

INSTANCE ID     i-589db035
INSTANCE IP     ec2-184-73-78-67.compute-1.amazonaws.com


CONNECT VIA SSH:

ssh -i root@ec2-184-73-78-67.compute-1.amazonaws.com
    
    OpenSSH_4.3p2, OpenSSL 0.9.8e-fips-rhel5 01 Jul 2008
    debug1: Reading configuration data /etc/ssh/ssh_config
    debug1: Applying options for *
    debug1: Connecting to ec2-184-73-78-67.compute-1.amazonaws.com [184.73.78.67] port 22.
    debug1: connect to address 184.73.78.67 port 22: Connection refused
    ssh: connect to host ec2-184-73-78-67.compute-1.amazonaws.com port 22: Connection refused


CHECKED SYSTEM LOG:

Mounting local filesystems:  mount: special device /dev/sdb does not exist
mount: wrong fs type, bad option, bad superblock on /dev/sdi,
       missing codepage or other error
       In some cases useful info is found in syslog - try
       dmesg | tail  or so


...

Starting getsshkey:    % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed

  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
curl: (22) The requested URL returned error: 404
getting ssh-key...

<REPEAT>

curl: (22) The requested URL returned error: 404




LAUNCH AQUARIUS-4 AS JGILBERT: ami-f4788f9d
-------------------------------------------

1. CREATE JGILBERT USER DATA FILE

mkdir -p /root/base/apps/ec2/userdata/jgilbert
emacs /root/base/apps/ec2/userdata/jgilbert/userdata.txt

amazonuserid=558277860346&awsaccesskeyid=AKIAJWZIAB2ZZB7FHJIQ&awssecretaccesskey=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&ec2publiccert=-----BEGIN CERTIFICATE-----\nMIICdzCCAeCgAwIBAgIFHoFGKBUwDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMYQVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTEwMTExOTE2NDMzNFoXDTExMTExOTE2NDMzNFowUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAVBgNVBAsTDkFXUy1EZXZlbG9wZXJzMRYwFAYDVQQDEw0xd2h3enZlN21ueGNhMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCBAssW9lEbOI1zeh5SAoUqncF6ezQ7M0ZGfgPfo/bKkmxTZitcDbHlPx8i2RDsrrhjFkBPOY6cJaguUIqZrVi80mAYlk     C/WatU0OKRMtOQsGPV7MMhMNSYD1wwN48SiDpWnF9WoSIdyXnNmywDTzPVemJWMMbCUrB9h+VppPPpEwIDAQABo1cwVTAOBgNVHQ8BAf8EBAMCBaAwFgYDVR0lAQH/BAwwCgYIKwYBBQUHAwIwDAYDVR0TAQH/BAIwADAdBgNVHQ4EFgQUls+H6G2aw4Di4BAiw39F5NjCNZswDQYJKoZIhvcNAQEFBQADgYEAbW0DkQ9+pqJO8bxoKUGgskdkJo9pzvF+5qeG/ncPyEYXj0ufrBqcEBfOmIBC0af7N5uFYZ9yvMm4QI7mR9K7Gjfmwa3pq1zHVyfNkuAd4XVdX4x4/eYGwGPDDqqqudkI0PEjYqYism14Gy9EA49oP9CWbJzhkHqqiHDjsuOAN8E=\n-----END CERTIFICATE-----&ec2privatekey=-----BEGIN PRIVATE KEY-----\nMIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAIECyxb2URs4jXN6HlIChSqdwXp7NDszRkZ+A9+j9sqSbFNmK1wNseU/HyLZEOyuuGMWQE85jpwlqC5QipmtWLzSYBiWQL9Zq1TQ4pEy05CwY9XswyEw1JgPXDA3jxKIOlacX1ahIh3Jec2bLANPM9V6YlYwxsJSsH2H5Wmk8+kTAgMBAAECgYA8oGFsQwjOb/8ZO1QwWfrWkhgwROHAyFHIIsQTPuxlOfYqIyNROSZWgxlQuQ1ZDKqd9gD2uieofZHRYgwgN/Qw69GuDUt9HzcNQ5yDPm3Ofa0WcD0tQa9YToHqEWVQaddc8D6DLcOwBDEropf2OIqd4JFusmenVBSIETihVKX8cQJBAM3Zs6W4nWtDExw7QlucgiKC0/R5exBk+BGVBAGHHcBTy+WXFrycUEJbj6q/PEIdGFxFvcO6GUk8x0JFGBgEB28CQQCgcNVc2Ar3kN3BAeM0xM5SVWlDYjDZwq5KId72g6CI/tcfjdpIHNI7yGlMNj4YPKOW2CAZebPLj3C74wclPUadAkEAgOcVju33baaX/fLBz/pGp3PDZHD59j8z9FabJpXEtJ4ErWWacEt2GseZRHPyOPhdO9LUTQ9pLCpqIH6B4vAK8wJAa0cnE16N7r1Z2Y1Wi9kwkBL2QI0uVtz6xyzgtfqLZC7qTvn9w4wp8rlt1vzKBlC9ncZDqGUdGHaADdGe3IKdbQJATBQ5VR3WM0lx6BrxXtHlxmmTikQ1mTlEdkjL4xJ9iXw7cRIIVdDzAait4TwuoxWxNODHlfMxK4ul8zcEE5bSlw==\n-----END PRIVATE KEY-----



RUN AN INSTANCE AS JGILBERT

keyjg

ec2-run-instances \
ami-f4788f9d \
--instance-type t1.micro \
-z us-east-1a \
--user-data-file /root/base/apps/ec2/userdata/jgilbert/userdata.txt
    
    RESERVATION     r-61f2820b      558277860346    default
    INSTANCE        i-dc8fa2b1      ami-f4788f9d                    pending         0               t1.micr2010-12-09T14:32:43+0000 us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled    ebs                                      paravirtual




ec2-describe-instances


    RESERVATION     r-fba7d691      558277860346    default
    INSTANCE        i-28002245      ami-6a788f03    ec2-50-16-50-37.compute-1.amazonaws.com domU-12-31-38-01-C5-51.compute-1.internal       running         0               t1.micro        2010-12-09T03:28:20+000us-east-1a       aki-b51cf9dc    ari-b31cf9da            monitoring-disabled     50.16.50.37     10.253.202.159                  ebs                                     paravirtual
    BLOCKDEVICE     /dev/sda1       vol-cbaa64a3    2010-12-09T03:28:23.000Z

    RESERVATION     r-6f9eef05      558277860346    default
    INSTANCE        i-8ae0c2e7      ami-6a788f03    ec2-184-72-213-75.compute-1.amazonaws.com       domU-12-31-38-00-7A-A5.compute-1.internal       running         0               t1.micro        2010-12-09T04:27:26+0000        us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled     184.72.213.75   10.252.125.79                   ebs                                     paravirtual
    BLOCKDEVICE     /dev/sda1       vol-29bc7241    2010-12-09T04:27:34.000Z

    RESERVATION     r-bde899d7      558277860346    default
    INSTANCE        i-36dffd5b      ami-f4788f9d                    terminated              0              t1.micro 2010-12-09T06:11:10+0000        us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled                                     ebs                                     paravirtual
    
    ************
    ************
    RESERVATION     r-61f2820b      558277860346    default
    INSTANCE        i-dc8fa2b1      ami-f4788f9d    ec2-184-72-203-43.compute-1.amazonaws.com       ip-10-127-94-60.ec2.internal    running         0               t1.micro        2010-12-09T14:32:43+0000       us-east-1a       aki-b51cf9dc    ari-b31cf9da            monitoring-disabled     184.72.203.43   10.127.94.60                    ebs                                     paravirtual
    ************
    ************



NOTE IDs:

INSTANCE ID     i-dc8fa2b1
INSTANCE IP     ec2-184-72-203-43.compute-1.amazonaws.com


CONNECT VIA SSH:


cd /root/base/apps/ec2/keypair/jgilbert
ssh -v -i pk-APKAII4QOUJW7PXZDFLA.pem \
root@ec2-184-72-203-43.compute-1.amazonaws.com





cd /root/base/apps/ec2/keypair/jgilbert
ssh -v -i pk-QQN6FHMRVQPPCSNYWYZFI7EGBSUXJF5T.pem \
root@ec2-184-72-203-43.compute-1.amazonaws.com \
-o StrictHostKeyChecking=no
    
    OpenSSH_4.3p2, OpenSSL 0.9.8e-fips-rhel5 01 Jul 2008
    debug1: Reading configuration data /etc/ssh/ssh_config
    debug1: Applying options for *
    debug1: Connecting to ec2-184-72-203-43.compute-1.amazonaws.com [184.72.203.43] port 22.
    debug1: connect to address 184.72.203.43 port 22: Connection refused
    ssh: connect to host ec2-184-72-203-43.compute-1.amazonaws.com port 22: Connection refused


THIS GIVES 'Connection refused':

cd /root/.ssh
ssh -v root@ec2-184-72-203-43.compute-1.amazonaws.com
    
    OpenSSH_4.3p2, OpenSSL 0.9.8e-fips-rhel5 01 Jul 2008
    debug1: Reading configuration data /etc/ssh/ssh_config
    debug1: Applying options for *
    debug1: Connecting to ec2-184-72-203-43.compute-1.amazonaws.com [184.72.203.43] port 22.
    debug1: connect to address 184.72.203.43 port 22: Connection refused
    ssh: connect to host ec2-184-72-203-43.compute-1.amazonaws.com port 22: Connection refused

THIS HANGS:

cd /root/.ssh
ssh -v -i ec2.keypair.ssh root@ec2-184-72-203-43.compute-1.amazonaws.com -o StrictHostKeyChecking=no -o ServerAliveInterval=30

    OpenSSH_4.3p2, OpenSSL 0.9.8e-fips-rhel5 01 Jul 2008
    debug1: Reading configuration data /etc/ssh/ssh_config
    debug1: Applying options for *
    debug1: Connecting to ec2-184-72-203-43.compute-1.amazonaws.com [184.72.203.43] port 22.




ERROR: Identity file ec2.keypair not accessible: No such file or directory.

ssh -v -i ec2.keypair.ssh root@ec2-184-72-203-43.compute-1.amazonaws.com -o StrictHostKeyChecking=no -o ServerAliveInterval=30

    Warning: Identity file ec2.keypair not accessible: No such file or directory.
    debug1: Reading configuration data /etc/ssh/ssh_config
    debug1: Applying options for *
    debug1: Connecting to ec2-184-72-203-43.compute-1.amazonaws.com [184.72.203.43] port 22.
    debug1: connect to address 184.72.203.43 port 22: Connection refused
    ssh: connect to host ec2-184-72-203-43.compute-1.amazonaws.com port 22: Connection refused

SOLUTION:

CHANGE TO ec2.keypair.ssh






REBOOT:

ec2-reboot-instances i-dc8fa2b1





RUN AN INSTANCE AS JGILBERT
---------------------------

ec2-run-instances ami-5647a33f --instance-type m1.small -z us-east-1a

    RESERVATION     r-bb2554d1      728213020069    default
    INSTANCE        i-b0ccefdd      ami-5647a33f                    pending         0            m1.small 2010-12-08T23:28:44+0000        us-east-1a      aki-a71cf9ce    ari-a51cf9cc         monitoring-disabled    



ec2-describe-instances
----------------------

RESERVATION     r-cbef69a1      728213020069    default
INSTANCE        i-84791ee9      ami-de2ed9b7                    stopped agua    0            t1.micro 2010-12-07T17:43:47+0000        us-east-1a      aki-b51cf9dc    ari-b31cf9da         monitoring-disabled                                      ebs                                  paravirtual
BLOCKDEVICE     /dev/sda1       vol-2d789145    2010-11-16T01:15:45.000Z
TAG     instance        i-84791ee9      Name    aquarius-2
RESERVATION     r-2d69e747      728213020069    default
INSTANCE        i-28056e45      ami-6a788f03                    stopped agua    0            m1.large 2010-11-19T15:19:38+0000        us-east-1a      aki-b51cf9dc    ari-b31cf9da         monitoring-disabled                                      ebs                                  paravirtual
BLOCKDEVICE     /dev/sda1       vol-0bd02463    2010-11-19T15:19:42.000Z
TAG     instance        i-28056e45      Name    aquarius-3
RESERVATION     r-bb2554d1      728213020069    default
INSTANCE        i-b0ccefdd      ami-5647a33f                    pending         0            m1.small 2010-12-08T23:28:44+0000        us-east-1a      aki-a71cf9ce    ari-a51cf9cc         monitoring-disabled                                      instance-store                       paravirtual

***WAIT***

RESERVATION     r-cbef69a1      728213020069    default
INSTANCE        i-84791ee9      ami-de2ed9b7                    stopped agua    0            t1.micro 2010-12-07T17:43:47+0000        us-east-1a      aki-b51cf9dc    ari-b31cf9da         monitoring-disabled                                      ebs                                  paravirtual
BLOCKDEVICE     /dev/sda1       vol-2d789145    2010-11-16T01:15:45.000Z
TAG     instance        i-84791ee9      Name    aquarius-2
RESERVATION     r-2d69e747      728213020069    default
INSTANCE        i-28056e45      ami-6a788f03                    stopped agua    0            m1.large 2010-11-19T15:19:38+0000        us-east-1a      aki-b51cf9dc    ari-b31cf9da         monitoring-disabled                                      ebs                                  paravirtual
BLOCKDEVICE     /dev/sda1       vol-0bd02463    2010-11-19T15:19:42.000Z
TAG     instance        i-28056e45      Name    aquarius-3
RESERVATION     r-bb2554d1      728213020069    default
INSTANCE        i-b0ccefdd      ami-5647a33f    ec2-50-16-82-65.compute-1.amazonaws.com domU-12-31-38-00-7D-D4.compute-1.internal     running         0               m1.small        2010-12-08T23:28:44+0000      us-east-1a      aki-a71cf9ce    ari-a51cf9cc            monitoring-disabled   50.16.82.65     10.252.130.34                   instance-store                       paravirtual



ec2-describe-images
-------------------
IMAGE   ami-6a788f03    728213020069/aquarius-3 728213020069    available       private      x86_64   machine aki-b51cf9dc    ari-b31cf9da            ebs     paravirtual
BLOCKDEVICEMAPPING      /dev/sda1               snap-01f3b66b   10



ec2-run-instances \
ami-6a788f03 \
--instance-type m1.small \
-z us-east-1a





ssh -v root@ec2-50-16-82-65.compute-1.amazonaws.com

    ...
    debug1: Next authentication method: publickey
    debug1: Trying private key: /root/.ssh/identity
    debug1: Trying private key: /root/.ssh/id_rsa
    debug1: Trying private key: /root/.ssh/id_dsa
    debug1: No more authentication methods to try.
    Permission denied (publickey,gssapi-with-mic).


keysy
ec2-describe-keypairs

    KEYPAIR ngsdev  9a:ab:b7:c9:4d:21:89:59:54:5a:61:0e:b2:80:da:dd:7e:af:77:ab
    KEYPAIR starcluster-1   12:a9:09:e0:08:4a:a5:bf:fc:45:68:bf:0e:5e:19:b6:d8:0b:dc:28
    KEYPAIR default-EC2-US  89:21:36:0a:d4:02:03:a1:b9:43:30:ad:a6:4b:7b:77:29:2c:42:ee
    KEYPAIR gsg-keypair     04:28:01:c0:99:8f:9b:fb:26:63:3d:77:03:0e:95:56:9b:7b:dd:ac
    KEYPAIR starcluster     68:50:15:c2:7f:b2:a8:5c:aa:5d:6b:37:a5:e6:15:06:22:d8:8a:61
    KEYPAIR agua    61:2d:42:13:55:92:09:bb:a9:8c:fa:17:69:29:ae:39:b5:76:d9:82


CREATE A NEW KEYPAIR FILE FOR JGILBERT
--------------------------------------

Generate a key and save the output to a file, a file that is then made accessible only to the owner:

keyjg
ec2-add-keypair ec2-keypair1 > ~/.ssh/ec2.keypair.ssh
chmod 600 ~/.ssh/ec2.keypair.ssh


cat ~/.ssh/ec2.keypair.ssh

KEYPAIR ec2-keypair1    48:18:33:d1:5a:4b:25:53:01:c6:c0:c9:d3:2a:ac:6c:0e:d1:f4:43
-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEA71KvDgpLRsQGS2JdsjbGIiubEZwHDzb2blt2u47K42h+4I6ExKMOnLzBK77V
MHImhShhtTk9TrRD2x+HVCGK5JrcE6b2917Hz78DwIU97FKnCbuHJ16sqidVotitRaZsEO40jV+c
qSI/dd2+AMaV6CGFL9/PpnvZGw9kGbJLg7ogeWe9v2Q6D5y8BF0i2IUuz2ihGxCImDX686nJNjyM
xzhoMh5atQRXxc/kBcMob1rJiiUQKd/Z8yUoCN3eJct1Z1MiKSJ14v+a4dw9G5l9UdOK7efQKWWl
lIb7Dk3dt0/zmiCD5Tn1w57dzbG1ToQihK0iGGzvk1KHzTUYRnUzHQIDAQABAoIBAA1Pfvb78ZXc
/zCgJu/rhfeOj1BaajYZa3lV0vO5jGU7gZsBsjaxjvV+tgu10GuiXawYQ97tcRB4jDGavk8aknwG
dOkO5zt45QoT6KSDhJ8pNasf5/Nzm4zXJTcqb/CowefrJ7cZM0Bg7ECk9ZVbdijz/FFeVFFBICEW
KQ4Y0YRg8TSwvqEIsDXVxQ1bznTwCVNPTR6Z+B5sNmOuc9Pukjnvu6Bk++rBKHhF+tGqQmW1sv5g
xhNszGwImthpZBK+SJZXnbNfccaRuvxJ3Q5uOT/14OwlQ6QzX2om8eUVyGLa88BwRyknBf8KdUbG
w9TgGNVvrC5W/eW5jn4TEsaxm00CgYEA/ca8XGy3HRxkO3XEqr2JGA32Fb6Cux6quWH+1Zvs2NpA
AKQckkakKIOtcM6hDm3wUF60EBYmWMkUzaRO+sDIgVaovWprPJ+cItVxaqGJcLfESzH/vF9ZBHpF
fv27vnrb5tD5p8Ukk/V4xLweUIhgbYji++lPINGXcnmoSzkX3T8CgYEA8WuG1iLlNlZ2LMKCAevA
3SPe0FZd/lReCgWiRvFNX8AqFw77gqNBjBOJ06ulAwqcFCs/PkoqB2RJCi9x/QUwOwbjj3KSnyuv
NiseqkhjXkUje/4NmMc9L/2BUsP4EUkAVU8nlyBIAn6K7jW+MXVyUX7zHzrnSj8iqXldr1wjrKMC
gYEA5LcNIhtU+SaSa0hbhCon+Ybzp2s4tV4RLdzU6D2MO3CPyEQf//Esl9r9ILMJUlDhCf4gOHNO
AizP0/pmt/Wxf2fT0kqr9UpAVOCbRCfsD6t/fOnF+0bPmop8QdR6NVTTBXaH2p2BttvACUcl5xzS
E0YQlEsUZpae8KwWch01lc8CgYAgC3DDXbBlDQb0nADbtmpMMCW0K7KgPpyY4fSPTBpEGmK72s5B
od/icvl5cjAd/juHZdIoN3nqr0IOqwuLVTP4scpk0QVrQUYpf4G7go5GBhFWtPsjC1cw1opi7QYx
bSoxKKeNpMhKJHfWdKXBNOCutpYY0B3BOi4kpqpry2Qk1wKBgBYN1glA5gvsZMzyBcESx+W0u142
LXztx8mYALCRNRi33PVqoDsO4jpWmdkN1sRvabFzRaSOi/ucxeat9YGnyHhjbQ1As6ElQw9d4qdG
dmFCttm6YTjpvoyCQs1DuFoH3AV1Z/tUMd5W/tBcFUnku5h8UsMoujq+7H40mpYZ7Dre
-----END RSA PRIVATE KEY-----


What's happened, then, is that you have created an SSH keypair and uploaded the public key to Amazon.

    NB: You don't get to keep a copy of the public key, you don't get to upload an existing key
    
    You could probably get the public key back once you ssh in to the root of the new machine.




SET PASSWORD '' ON KEYPAIR:

ssh-keygen -p -f /root/.ssh/ec2.keypair.ssh

    Key has comment '/root/.ssh/ec2.keypair.ssh'
    Enter new passphrase (empty for no passphrase): 
    Enter same passphrase again: 
    Your identification has been saved with the new passphrase.



OPEN PORTS:

ec2-authorize default -p 22
ec2-authorize default -p 80



TRY AGAIN WITH ANOTHER AMI:

cd /root/.ssh
ec2-run-instances ami-23b6534a -k ec2-keypair1

    RESERVATION     r-21aedf4b      558277860346    default
    INSTANCE        i-fc0c2e91      ami-23b6534a                    pending ec2-keypair1    0    m1.small 2010-12-09T03:50:38+0000        us-east-1c                              monitoring-disabled                                   instance-store                                  paravirtual


ec2-describe-instances

    RESERVATION     r-21aedf4b      558277860346    default
    INSTANCE        i-fc0c2e91      ami-23b6534a    ec2-184-73-128-7.compute-1.amazonaws.com     domU-12-31-39-06-24-13.compute-1.internal        running ec2-keypair1    0               m1.small      2010-12-09T03:50:38+0000        us-east-1c                              monitoring-disabled   184.73.128.7    10.208.43.225                   instance-store                       paravirtual


CONNECT VIA SSH:

cd /root/.ssh
ssh -v -i ec2-keypair1 root@ec2-184-73-128-7.compute-1.amazonaws.com

    debug1: SSH2_MSG_SERVICE_ACCEPT received
    debug1: Authentications that can continue: publickey,gssapi-with-mic,password
    debug1: Next authentication method: gssapi-with-mic
    debug1: Unspecified GSS failure.  Minor code may provide more information
    Unknown code krb5 195
    
    debug1: Unspecified GSS failure.  Minor code may provide more information
    Unknown code krb5 195
    
    debug1: Unspecified GSS failure.  Minor code may provide more information
    Unknown code krb5 195
    
    debug1: Next authentication method: publickey
    debug1: Trying private key: /root/.ssh/identity
    debug1: Trying private key: /root/.ssh/id_rsa
    debug1: Trying private key: /root/.ssh/id_dsa
    debug1: Next authentication method: password


SOLUTION:

cd /root/.ssh/
cp ec2.keypairs.sh id_rsa


    OK!
    
    
TERMINATE TEST INSTANCE:

ec2-terminate-instances i-fc0c2e91      

    Client.AuthFailure: Not authorized for instances: [i-fc0c2e91]

WORKS WHEN USE JGILBERT KEYS:

[root@li182-248 ~]# keyjg
[root@li182-248 ~]# ec2-terminate-instances i-fc0c2e91      
INSTANCE        i-fc0c2e91      running shutting-down



LAUNCH AQUARIUS-3: ami-6a788f03
-----------------------------------


ec2-run-instances \
ami-6a788f03 \
--instance-type t1.micro \
-z us-east-1a

    RESERVATION     r-6f9eef05      558277860346    default
    INSTANCE        i-8ae0c2e7      ami-6a788f03                    pending         0            t1.micro 2010-12-09T04:27:26+0000        us-east-1a      aki-b51cf9dc    ari-b31cf9da         monitoring-disabled                                      ebs                                  paravirtual



ec2-describe-instances

    INSTANCE        i-8ae0c2e7      ami-6a788f03    ec2-184-72-213-75.compute-1.amazonaws.com    domU-12-31-38-00-7A-A5.compute-1.internal        running         0               t1.micro     2010-12-09T04:27:26+0000 us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled   184.72.213.75   10.252.125.79                   ebs                                  paravirtual
    BLOCKDEVICE     /dev/sda1       vol-29bc7241    2010-12-09T04:27:34.000Z


... WAIT ...


ec2-describe-instances

    INSTANCE        i-8ae0c2e7      ami-6a788f03    ec2-184-72-213-75.compute-1.amazonaws.com    domU-12-31-38-00-7A-A5.compute-1.internal        running         0               t1.micro     2010-12-09T04:27:26+0000 us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled   184.72.213.75   10.252.125.79                   ebs                                  paravirtual
    BLOCKDEVICE     /dev/sda1       vol-29bc7241    2010-12-09T04:27:34.000Z



NOTE IDs:

INSTANCE ID     i-8ae0c2e7      
INSTANCE IP     ec2-184-72-213-75.compute-1.amazonaws.com


cd /root/.ssh
ssh -v -i ec2.keypair root@ec2-184-72-213-75.compute-1.amazonaws.com

    OpenSSH_4.3p2, OpenSSL 0.9.8e-fips-rhel5 01 Jul 2008
    debug1: Reading configuration data /etc/ssh/ssh_config
    debug1: Applying options for *
    debug1: Connecting to ec2-50-16-50-37.compute-1.amazonaws.com [50.16.50.37] port 22.
    debug1: connect to address 50.16.50.37 port 22: Connection refused
    ssh: connect to host ec2-50-16-50-37.compute-1.amazonaws.com port 22: Connection refused



ENABLE PORT 22 FOR SSH:

ec2-authorize default -p 22

    Client.InvalidPermission.Duplicate: The permission '0.0.0.0/0-1-22-22' has already been authorized on the specified group

ec2-authorize default -p 80

   Client.InvalidPermission.Duplicate: The permission '0.0.0.0/0-1-80-80' has already been authorized on the specified group 







LAUNCH AQUARIUS-4: ami-f4788f9d
-------------------------------


ec2-run-instances \
ami-f4788f9d \
--instance-type t1.micro \
-z us-east-1a
    
    RESERVATION     r-bde899d7      558277860346    default
    INSTANCE        i-36dffd5b      ami-f4788f9d                    pending         0            t1.micro 2010-12-09T06:11:10+0000        us-east-1a      aki-b51cf9dc    ari-b31cf9da         monitoring-disabled                                      ebs                                  paravirtual

    #RESERVATION     r-6f9eef05      558277860346    default
    #INSTANCE        i-8ae0c2e7      ami-6a788f03                    pending         0            t1.micro 2010-12-09T04:27:26+0000        us-east-1a      aki-b51cf9dc    ari-b31cf9da         monitoring-disabled                                      ebs                                  paravirtual



ec2-describe-instances

RESERVATION     r-fba7d691      558277860346    default
INSTANCE        i-28002245      ami-6a788f03    ec2-50-16-50-37.compute-1.amazonaws.com domU-12-31-38-01-C5-51.compute-1.internal     running         0               t1.micro        2010-12-09T03:28:20+0000      us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled   50.16.50.37     10.253.202.159                  ebs                                  paravirtual
BLOCKDEVICE     /dev/sda1       vol-cbaa64a3    2010-12-09T03:28:23.000Z


RESERVATION     r-21aedf4b      558277860346    default
INSTANCE        i-fc0c2e91      ami-23b6534a                    terminated      ec2-keypair1 m1.small 2010-12-09T03:50:38+0000        us-east-1c                              monitoring-disabled                                   instance-store                                  paravirtual


RESERVATION     r-6f9eef05      558277860346    default

INSTANCE        i-8ae0c2e7      ami-6a788f03    ec2-184-72-213-75.compute-1.amazonaws.com    domU-12-31-38-00-7A-A5.compute-1.internal        running         0               t1.micro     2010-12-09T04:27:26+0000 us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled   184.72.213.75   10.252.125.79                   ebs                                  paravirtual
BLOCKDEVICE     /dev/sda1       vol-29bc7241    2010-12-09T04:27:34.000Z


RESERVATION     r-bde899d7      558277860346    default
INSTANCE        i-36dffd5b      ami-f4788f9d    ec2-184-73-26-126.compute-1.amazonaws.com    ip-10-127-121-144.ec2.internal   running         0               t1.micro        2010-12-09T06:11:10+0000      us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled  184.73.26.126    10.127.121.144                  ebs                                     paravirtual
BLOCKDEVICE     /dev/sda1       vol-13c30d7b    2010-12-09T06:11:21.000Z
BLOCKDEVICE     /dev/sdh        vol-15c30d7d    2010-12-09T06:11:21.000Z
BLOCKDEVICE     /dev/sdi        vol-17c30d7f    2010-12-09T06:11:21.000Z





NOTE IDs:

INSTANCE ID     i-36dffd5b
INSTANCE IP     ec2-184-73-26-126.compute-1.amazonaws.com


cd /root/.ssh
ssh -v -i ec2.keypair root@ec2-184-73-26-126.compute-1.amazonaws.com

    
    OpenSSH_4.3p2, OpenSSL 0.9.8e-fips-rhel5 01 Jul 2008
    Warning: Identity file ec2.keypair not accessible: No such file or directory.
    debug1: Reading configuration data /etc/ssh/ssh_config
    debug1: Applying options for *
    debug1: Connecting to ec2-184-73-26-126.compute-1.amazonaws.com [184.73.26.126] port 22.
    debug1: connect to address 184.73.26.126 port 22: Connection refused
    ssh: connect to host ec2-184-73-26-126.compute-1.amazonaws.com port 22: Connection refused


    #OpenSSH_4.3p2, OpenSSL 0.9.8e-fips-rhel5 01 Jul 2008
    #debug1: Reading configuration data /etc/ssh/ssh_config
    #debug1: Applying options for *
    #debug1: Connecting to ec2-50-16-50-37.compute-1.amazonaws.com [50.16.50.37] port 22.
    #debug1: connect to address 50.16.50.37 port 22: Connection refused
    #ssh: connect to host ec2-50-16-50-37.compute-1.amazonaws.com port 22: Connection refused






NOTES
-----


USER DATA FILE
--------------

http://alestic.com/2009/06/ec2-user-data-scripts


Automate EC2 Instance Setup with user-data Scripts

By Eric Hammond on June 1, 2009 3:15 AM | 10 Comments | 3 TrackBacks
user-data Scripts

The Ubuntu and Debian EC2 images published on http://alestic.com allow you to send in a startup script using the EC2 user-data parameter when you run a new instance. This functionality is useful for automating the installation and configuration of software on EC2 instances.

The basic rule followed by the image is:

If the instance user-data starts with the two characters #! then the instance runs it as the root user on the first boot.

The user-data script is run late in the startup process, so you can assume that networking and other system services are functional.

If you start an EC2 instance with any user-data which does not start with #! the image simply ignores it and allows your own software to access and use the data as it sees fit.

This same user-data startup script functionality has been copied in the Ubuntu images published by Canonical, and your existing user-data script should be portable across images with little change. Read a comparison of the Alestic and Canonical EC2 images.

Example

Here is a sample user-data script which sets up an Ubuntu LAMP server on a new EC2 instance:

#!/bin/bash
set -e -x
export DEBIAN_FRONTEND=noninteractive
apt-get update && apt-get upgrade -y
tasksel install lamp-server
echo "Please remember to set the MySQL root password!"
Save this to a file named, say, install-lamp and then pass it to a new EC2 instance, say, Ubuntu 9.04 Jaunty:

ec2-run-instances --key KEYPAIR --user-data-file install-lamp ami-bf5eb9d6
Please see http://alestic.com for the latest AMI ids for Ubuntu and Debian.

Note: This simplistic user-data script is for demonstration purposes only. Though it does set up a fully functional LAMP server which may be as good as some public LAMP AMIs, it does not take into account important design issues like database persistence. Read Running MySQL on Amazon EC2 with Elastic Block Store.

Debugging

Since you are passing code to the new EC2 instance, there is a very small chance that you may have made a mistake in writing the software. Well maybe not you, but somebody else out there might not be perfect, so I have to write this for them.

The stdout and stderr of your user-data script is output in /var/log/syslog and you can review this for any success and failure messages. It will contain both things you echo directly in the script as well as output from programs you run.

Tip: If you add set -x at the top of a bash script, then it will output every command executed. If you add set -e to the script, then the user-data script will exit on the first command which does not succeed. These help you quickly identify where problems might have started.

Limitations

Amazon EC2 limits the size of user-data to 16KB. If your startup instructions are larger than this limit, you can write a user-data script which downloads the full program(s) from somewhere else like S3 and runs them.

Though a shell is a handy tool for writing scripts to install and configure software, the user-data script can be written in any language which supports the shabang (#!) mechanism for running programs. This includes bash, Perl, Python, Ruby, tcl, awk, sed, vim, make, or any other language you can find pre-installed on the image.

If you want to use another language, a user-data script written in bash could install the language, install the program, and then run it.

Security

Setting up a new EC2 instance often requires installing private information like EC2 keys and certificates (e.g., to make AWS API calls). You should be aware that if you pass secrets in the user-data parameter, the complete input is available to any user or process running on the instance.

There is no way to change the instance user-data after instance startup, so anybody who has access to the instance can simply request http://169.254.169.254/latest/user-data

Depending on what software you install on your instance, even Internet users may be able to exploit holes to get at your user-data. For example, if your web server lets users specify a URL to upload a file, they might be able to enter the above URL and then read the contents.

Alternatives

Though user-data scripts are my favorite method to set up EC2 instances, its not always the appropriate approach. Alternatives include:

Manually ssh in to the instance and enter commands to install and configure software.

Automatically ssh in to the instance with automated commands to install and configure software.

Install and configure software using (1) or (2) and then rebundle the instance to create a new AMI. Use the new image when running instances.

Build your own EC2 images from scratch.

The ssh options have the benefit of not putting any private information into the user-data accessible from the instance. They have the disadvantage of needing to monitor new instances waiting for the ssh server to accept connections; this complicates the startup process compared to user-data scripts.

The rebundled AMI approach and building your own AMI approach are useful when the installation and configuration of your required software take a very long time or cant be done with automated processes (less common than you might think). A big drawback of creating your own AMIs is maintaining them, keeping up with security patches and other enhancements and fixes which might be applied by the base image maintainers.

Software

Note to AMI authors: If you wish to add to your EC2 images the same ability to run user-data scripts, feel free to include the following code and make it run on image startup:

http://ec2ubuntu.googlecode.com/svn/trunk/etc/init.d/ec2-run-user-data

#!/bin/bash
#
# ec2-run-user-data - Run instance user-data if it looks like a script.
#
# Only retrieves and runs the user-data script once per instance.  If
# you want the user-data script to run again (e.g., on the next boot)
# then add this command in the user-data script:
#   rm -f /var/ec2/ec2-run-user-data.*
#
# History:
#
#   2010-01-07 Tom White
#   - Add support for gzip-compressed user data
#
#   2008-05-16 Eric Hammond <ehammond@thinksome.com>
#   - Initial version including code from Kim Scheibel, Jorge Oliveira
#
prog=$(basename $0)
logger="logger -t $prog"
curl="curl --retry 3 --silent --show-error --fail"
instance_data_url=http://169.254.169.254/2008-02-01

# Wait until meta-data is available.
perl -MIO::Socket::INET -e '
 until(new IO::Socket::INET("169.254.169.254:80")){print"Waiting for meta-data...\n";sleep 1}
' | $logger

# Exit if we have already run on this instance (e.g., previous boot).
ami_id=$($curl $instance_data_url/meta-data/ami-id)
been_run_file=/var/ec2/$prog.$ami_id
mkdir -p $(dirname $been_run_file)
if [ -f $been_run_file ]; then
  $logger < $been_run_file
  exit
fi

# Retrieve the instance user-data and run it if it looks like a script
user_data_file=$(tempfile --prefix ec2 --suffix .user-data --mode 700)
$logger "Retrieving user-data"
$curl -o $user_data_file $instance_data_url/user-data 2>&1 | $logger
if [ $(file -bi $user_data_file) = 'application/x-gzip' ]; then
  $logger "Uncompressing gzip'd user-data"
  mv $user_data_file $user_data_file.gz
  gunzip $user_data_file.gz
fi
if [ ! -s $user_data_file ]; then
  $logger "No user-data available"
  echo "user-data was not available" > $been_run_file
elif head -1 $user_data_file | egrep -v '^#!'; then
  $logger "Skipping user-data as it does not begin with #!"
  echo "user-data did not begin with #!" > $been_run_file
else
  $logger "Running user-data"
  echo "user-data has already been run on this instance" > $been_run_file
  $user_data_file 2>&1 | logger -t "user-data"
  $logger "user-data exit code: $?"
  




SSH - MUST COPY PUBLIC CERTIFICATE TO /root/.ssh/id_rsa FILE
------------------------------------------------------------

http://www.smartfrog.org/wiki/display/sf/EC2+Security
EC2 Security

EC2 Security is designed to give authorised users access to their machines, but nobody else. An AMI image can be published; when it is picked up by other users, it gets rebound to the new owners in the process. Even so, you need to be sure that there are no back doors in the VMs. Amazon warn people about naively using third party AMIs. Even with the Amazon issues, there is the risk that they are not so much malicious, just capable of leaving vulnerabilities in the systems. Futhermore, being Linux images, they are implicitly vulnerable if not kept up to date.

The S3 store has a fairly complex security model, as it is possible to make any resources in the asset store public, and it is possible to grant restricted access rights to downstream users. This is used to enable all the 'upload to S3' applications that can be resold to others.

Security Key setup
This turns out to be very tricky. Imagine, security that is hard to set up!

Security concepts

You have an account. This is where bills are sent. It must have a credit card set up. A normal Amazon account can be used for this; if you have more than one credit card you must declared which card to use for billing.

There is an Access Key ID and Secret Access Key. The ID is not secret; it is included in various requests. The Secret Access Key is used to sign messages. Users can create new secret access keys -these are shared secrets between you and Amazon Web Services.
The FireFox EC2 GUI uses the key ID and Secret Access Key to identify you.
There is an X509 certificate and a matching RSA private key for talking to the AWS system. This is generated on the AWS web site and downloaded over HTTPS. Of course, this means that amazon themselves could retain the private key, but it is only to authenticate AWS communications. If you do not trust amazon, you can upload your own certificate. These certificates and keys are bound to the Access Key ID; you can use them in communications with the servers without including the Access Key ID.

The X509 certificate is used for WS-Security operations; the SOAP stack. This includes the Amazon command line tools. It is not apparently used by the AWS query API.

There is only one X509 certificate per account. When a new one is created, the old one is revoked.

An SSH 'keypair' is generated to talk to specific machines. This is done on your local machine; the public key is then uploaded to the AWS infrastructure via a specific operation.

Certificates
Create an X.509 certificate on the amazon web services site, under your account settings. This gives two files to download: a certificate and a private key. Save these to somewhere like ~/.ec2
Set the EC2_PRIVATE_KEY environment variable to the downloaded private key.
Set the EC2_CERT key to the downloaded certificate.
Test the settings with the command ec2-describe-images -o self
    

Keypairs

Before creating a machine, you need a new keypair

Keypairs can be created from the FireFox GUI, but you get more control from the command line.

> ec2-add-keypair ec2-keypair1
KEYPAIR ec2-keypair1    9e:e4:17:35:74:6d:45:61:be:4c:a4:7c:bb:d2:cc:d3:1f:5b:c8:bc
-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAykaexY3dvuJvmOz6nHzWMaqVA9wLsc5cFfo9TF+ozZz3RVbNltFspjqiGtN7
iO2l3bK5ef9bJ+RWiJdvhjSW12P5JpxSEFKCFXCSF6Yw736eIjtXDiHvtmnjgvPRCTStKplEoqk3
cWR2we6o6IAGGmoQ+GixlQDJWsZWVeQZ0aEzOVhpHZFrbOTsV+OHbopz4qWzMgB6yE7OO6LHsXO/
XwimNSNWY5mthezlIHqh3KHJ17clnK44GneERl5inTMl8zniT2mVDDP+lqtyrbigLc7XV/NCm//B
k/Seb7poELWN4W3HAa4Y7CIyUl9tQnpP7TBPGs01iqFUHwiqSSzHAwIDAQABAoIBAEFe6Vj3LD7Q
dzh4/dUtExwiAN6qcq0X//KqWL0h/S/WFqO2FeMz82UVdeYtirMJ+pzXcdHXkOInjT+/kS9SN52M
lazAwFS+FYRQSSaTcyUzSm/Ntai/lvTg68IagefzujMWLXRUM7LVwPuT4cqh9Vb8CFf/ncSF6I0J
pEVF3oI8f3fBzzse481Xk5mcCx1FP4ZMXtNOB1WXBRJGMvSdgWXDapc2/Z9S9Ik+7MkhNfsDn15k
Dv5mXrrUmSU6dUcQlu5AEP5qaMzm/u7Jo66vqhTcvSTodahMR76NWTiDbdevZ1cIFVvlYev0WC/Q
BOovwkDHioLp8tll6S7U3UO7KOECgYEA46A/qXeUrDCK5bE++UwZXV0bqfnonicg6ZFk6yfuxmsC
iD6jKVY6Ppa0Ym5KO3SNBYFG+ptugYz8FeKiGAK6kLEgmVnO5k8ZAXB9CUh5DVz3mSqUSl0dW/Sl
cEqO5pmCwjM/deVHhgIWo2KkIrJm+pC0IDNwxBW6Go0nClu/cR0CgYEA431tLPNqEt/GEj1xZRJW
cFtVRnq0q1HcZUDzGfPtO9OfCTCkw9HyXPJerjVIiUMsL8owYYLaHxDA9IglXlvvZaZiM8DQ47xh
9wkqdzgNI0WQ334wSIqreUP3uO2ovuCtdwr3fG44SIolCSgy8UliInHhn/V5F4nHuC7XRvX6vp8C
gYA624ralRMaWwrvTZ+M8sJ0Q8kNcJNXoaJ/AptnutGg+LaU6C1kWOmCmZFXClGjggWc8Mqbrmkq
knv0ZL+pGbuIAmT9gh1frAA5QQ7zwYubivhy4HGrsNwQlPfaS00cD4GiGYJFR93wpsWXxb/PQPYj
wBrzYJm9+ig/CVSY9xRPeQKBgQCGuRUa9dzv6I5I5xJspPuD9tL9tlWg0A4R+PD/gbIRKDabHq+1
OHSsDu17hhq7D4jvlHIqjW/Xzfg32RkoVJHmRS8LLzmGZV4vCsKXcB53sQ8nDHhTvavnWRUv869n
u29/fIMssamrbASa86+XrbnsZD0Wmi1ofzREI5licPJaSQKBgQCfUuBwiyZXKUukX++YWstynVwe
bZ8m9AbvtNA21Y+EdXPbzpAuNS+F1NSRBB0MEOTMWrOa4SyokmNz1wkyN5GDsEaYOG31iXbqC35z
T6qNvUHxc0/xqzaKSJ9j2m68a3R+Mkt23F0PcoxF0kbdfSliZwuG/ahpeEY73Z98mlCt0Q==
-----END RSA PRIVATE KEY-----
This is an OpenSSH-compatible private key. To use it on Windows, you need Putty installed, and you need to convert it into putty format.

You can list the current keypairs in the GUI, or on the command line

> ec2-describe-keypairs
KEYPAIR keypair1        ea:cf:74:4d:45:d2:0f:17:a3:31:91:14:1d:ad:3f:a6:72:c1:f8:f4
KEYPAIR ec2-keypair1    9e:e4:17:35:74:6d:45:61:be:4c:a4:7c:bb:d2:cc:d3:1f:5b:c8:bc
After putting the private key up on a web site, you also need to unregister the key

> ec2-delete-keypair ec2-keypair1
KEYPAIR ec2-keypair1
To use these keys, you need to save them somewhere for .ssh to get at. Generate a key and save the output to a file, a file that is then made accessible only to the owner:

> ec2-add-keypair ec2-keypair1 > ~/.ssh/ec2.keypair.ssh
chmod 0700 ~/.ssh/ec2.keypair.ssh
Windows users have to look at the documentation to see how to import it in to putty. Note that the generated private key is not password protected. If you want that, use ssh-keygen -p -f ~/.ssh/ec2.keypair.ssh to set a passphrase on the new file. Running this program is a good check that the permissions are good. Here is what you don't want to see

ssh-keygen -p -f ~/.ssh/ec2.keypair.ssh
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@         WARNING: UNPROTECTED PRIVATE KEY FILE!          @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
Permissions 0644 for '/home/slo/.ssh/ec2.keypair.ssh' are too open.
It is recommended that your private key files are NOT accessible by others.
This private key will be ignored.
bad permissions: ignore key: /home/slo/.ssh/ec2.keypair.ssh
Enter old passphrase:
And here is the passphrase being set

ssh-keygen -p -f ~/.ssh/ec2.keypair.ssh
Key has comment '/home/slo/.ssh/ec2.keypair.ssh'
Enter new passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved with the new passphrase.
What's happened, then, is that you have created an SSH keypair and uploaded the public key to Amazon. You don't get to keep a copy of the public key, you don't get to upload an existing key (not through their tools, anyway). You could probably get the public key back once you ssh in to the root of the new machine.

]# cat ~/.ssh/authorized_keys 
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCFtrgaMv8fI0BXMqRYWb3ZrcpIvn7oCzeHXXDszp6m7WIc0w5eDDypeiLKPLRIkDb+DoLb0npGmUuE6yX3U+alYzpJ6O1WFq8AaPIoAet5SLDixA8QrNUG25Qy4fPO8d6u8HVlRBvra4KIlixDIDrD3XzikkNrjYkWb8Hyb/KJUHbxuqJL1xEVjVs6OptRNKlzwLlwMtQMO1ZD24gxvPMs8Z2ERzdgGEj6ELf+jaJWL31P3D6wzqlQl6tw/5vvTzJ7UOvDz8P1Uzr2iI2D6xluT1NXHf7DZd4eOUGA9gs/ZbwF3nkbtMreVPZTvw5emiEM2nVmxM26OimIA/NM0Ntt ec2-keypair1
or you can copy things over

scp -i ~/.ssh/ec2.keypair.ssh root@ec2-67-202-21-138.compute-1.amazonaws.com:.ssh/authorized_keys . 




</entry>



<entry [Thu Dec  9 15:09:50 UTC 2010] REPLICATE AN IMAGE TO DIFFERENT AWS REGIONS>



http://support.rightscale.com/12-Guides/Dashboard_Users_Guide/Clouds/AWS_Region/EC2_Images/Actions/01-Replicating_an_Image_to_EC2-EU

To replicate an image into AWS-EU, you must create an S3 bucket in Europe.

Go to Clouds -> AWS Global -> S3 Browser.  Create a new bucket and be sure to specify "Europe" as its location.
Go to Clouds -> AWS US-East -> Images.  Under the Personal tab, select an image that you would like to make available in the EC2-EU region.
Next, specify the S3 bucket where you would like to store the image.  Notice that the sebucket is EU. 

(Note: Some kernels and ramdisks cannot be copied over to different EC2 regions, therefore you may need to select a different kernel.  Only kernels that can be copied over will be listed.)

Click the Replicate button. 
Click the Replicate action button. 

Your image will not be available immediately. The length of time needed to replicate the image to a different region depends on how busy the queue is, and the size of the data to transfer for your image.   You will see a flash message similar to the following: "Your Ec2 image replication task has been placed to a queue. The Ec2 images list will be updated soon." 



</entry>



<entry [Sun July  11 21:58:46 EDT 2010] LOWER COST S3 STORAGE - RRS: REDUCED REDUNDANCY STORAGE>




http://www.cloudiquity.com/
admin on 19 May 2010

Amazon S3 add RRS  Reduced Redundancy Storage
introduce a new storage option for Amazon S3 called Reduced Redundancy Storage (RRS) that enables customers to reduce their costs by storing non-critical, reproducible data at lower levels of redundancy than the standard storage of Amazon S3. It provides a cost-effective solution for distributing or sharing content that is durably stored elsewhere, or for storing thumbnails, transcoded media, or other processed data that can be easily reproduced. The RRS option stores objects on multiple devices across multiple facilities, providing 400 times the durability of a typical disk drive, but does not replicate objects as many times as standard Amazon S3 storage does, and thus is even more cost effective. Both storage options are designed to be highly available, and both are backed by Amazon S3s Service Level Agreement.Once customer data is stored using either Amazon S3s standard or reduced redundancy storage options, Amazon S3 maintains durability by quickly detecting failed, corrupted, or unresponsive devices and restoring redundancy by re-replicating the data. Amazon S3 standard storage is designed to provide 99.999999999% durability and to sustain the concurrent loss of data in two facilities, while RRS is designed to provide 99.99% durability and to sustain the loss of data in a single facility.Pricing for Amazon S3 Reduced Redundancy Storage starts at only $0.10 per gigabyte per month and decreases as you store more data. To get started using RRS and Amazon S3, visit http://aws.amazon.com/s3 or learn more by joining our May 26 webinar.Sincerely,The Amazon S3 Team
Amazon have introduced a new storage option for Amazon S3 called Reduced Redundancy Storage (RRS) that enables customers to reduce their costs by storing non-critical, reproducible data at lower levels of redundancy than the standard storage of Amazon S3.

It provides a cost-effective solution for distributing or sharing content that is durably stored elsewhere, or for storing thumbnails, transcoded media, or other processed data that can be easily reproduced. The RRS option stores objects on multiple devices across multiple facilities, providing 400 times the durability of a typical disk drive, but does not replicate objects as many times as standard Amazon S3 storage does, and thus is even more cost effective.

Both storage options are designed to be highly available, and both are backed by Amazon S3s Service Level Agreement.

Once customer data is stored using either Amazon S3s standard or reduced redundancy storage options, Amazon S3 maintains durability by quickly detecting failed, corrupted, or unresponsive devices and restoring redundancy by re-replicating the data. Amazon S3 standard storage is designed to provide 99.999999999% durability and to sustain the concurrent loss of data in two facilities, while RRS is designed to provide 99.99% durability and to sustain the loss of data in a single facility.

Pricing for Amazon S3 Reduced Redundancy Storage starts at only $0.10 per gigabyte per month and decreases as you store more data.

From a programming viewpoint to enable your storage to take advantage of RRS  you need to set the storage class of an object you upload to RRS. To enable this you set x-amz-storage-class to REDUCED_REDUNDANCY in a PUT request.


</entry>



<entry [Wed Dec  8 17:23:02 EST 2010] GIVE GUNEY/KAREN ACCESS TO AMI>




ADD KAREN TO LAUNCH PERMISSION ATTRIBUTE:

ec2-modify-image-attribute  ami-6a788f03 --launch-permission --add 684733399587

    launchPermission        ami-6a788f03    ADD     userId  684733399587


SEE WHO CAN LAUNCH THE INSTANCE:

ec2-describe-image-attribute ami-6a788f03    --launch-permission
    
    launchPermission        ami-6a788f03    userId  558277860346
    launchPermission        ami-6a788f03    userId  983300124420
    launchPermission        ami-6a788f03    userId  684733399587





[root@ip-10-242-62-95 ~]# ec2-describe-instances
RESERVATION     r-3b901f51      983300124420    default
INSTANCE        i-10acc57d      ami-887285e1    ec2-174-129-74-180.compute-1.amazonaws.com      ip-10-242-62-95.ec2.internal    running agua    0 m1.large 2010-12-07T17:56:21+0000        us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled     174.129.74.180  10.242.62.95                       ebs
BLOCKDEVICE     /dev/sda1       vol-7318ed1b    2010-11-19T02:14:38.000Z
[root@ip-10-242-62-95 ~]# 




karen nuytemans
684733399587
AKIAIKR6ZDBQA3RFJRUQ
VqV/AWAgcZilaRUyn9M7KUgNLArrJjC9sO3pbrzX



amazonuserid=684733399587&awsaccesskeyid=AKIAIKR6ZDBQA3RFJRUQ&awssecretaccesskey=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&ec2publiccert=-----BEGIN CERTIFICATE-----\nMIICdjCCAd+gAwIBAgIFIg24p1kwDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMYQVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTEwMTIwNzE4MzcwN1oXDTExMTIwNzE4MzcwN1owUjELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAVBgNVBAsTDkFXUy1EZXZlbG9wZXJzMRUwEwYDVQQDEwxydnIyd2htNWdnMjYwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAJe5R4q+eRySeQVin1QtPP6334sIOE+aJgAVYNmF+doCjqwfKeyGYgYPwjM1tfCB9AoLjGUqtXnjRkwZf8aSLl2dE6cNqwq2/Zo5yZOobgDTlhafktg+vjbdDjnPpBCGZsBUyLtOwkt/MiwrBpJvwVw1WsYuHlXklYZfREQJ61wjAgMBAAGjVzBVMA4GA1UdDwEB/wQEAwIFoDAWBgNVHSUBAf8EDDAKBggrBgEFBQcDAjAMBgNVHRMBAf8EAjAAMB0GA1UdDgQWBBThX7tL1R4VxK5ZpJZ+I5Dv8sCSnjANBgkqhkiG9w0BAQUFAAOBgQA58ZYVWryxHbdtfgBluRJzlboDZFGj/UbjJ1/+pIsHHwRk8CZk/lCjoE04rk62IF/DcwPmsRlaCaDf1eGnxiZcT/rvgxWOEwUyphzexrAO1IL98TJc/sWZPlBgEbGrlVAbuds2xCLkMcmAS9xdGzddhpG2N7pzUbDwr8CNSdWMyA==\n-----END CERTIFICATE-----&ec2privatekey=-----BEGIN PRIVATE KEY-----\nMIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAJe5R4q+eRySeQVin1QtPP6334sIOE+aJgAVYNmF+doCjqwfKeyGYgYPwjM1tfCB9AoLjGUqtXnjRkwZf8aSLl2dE6cNqwq2/Zo5yZOobgDTlhafktg+vjbdDjnPpBCGZsBUyLtOwkt/MiwrBpJvwVw1WsYuHlXklYZfREQJ61wjAgMBAAECgYBpb5k24qy5XVR6mJGOZq2XeWIAdSLktoOn1TNrln4NsW9CT5nLw4tFGRhki/O2gih7/pB/EVHxtS353lJ8RMOwuJj/2HMHUp48I2rW4+H0mMZuTjWCWhWsJh9LSnp14gXKgw1ONJlCNL7EDj8tp5dS6Z6ke+0voWM7QuX9HTVm8QJBAN2AW++JAt3TYfHvtG7Bg4Se7T2AJh8HpNqfYOfNTLbHhL0nlYBZItgv7EZgQqIrtCrUDjfiY/+JK0NZazoduakCQQCvWsP6r+4VVdLj0Zt3B05oZ/+WP68BqD8fW0LdKQnQITYRU5TKAFJMfjTTQbwQ5Zz5O5TPZmz+JDax8S0ZMz7rAkEAhW1q9BH+jg1ldM3GTOl5BgyOMHvfetWp8qALSdcbnQb26NLNdfE70iqcE5Cs0u+sqhfvMK7JOgcw7nMQ6oM5cQJAFJpBdG6/NlqDEKlL7sw49iNh8DFDSpqN8A006e8sa/u68oYzcRhgkwQxCLEse3++1bmeXk/WdnWix31ioxdWSQJBAI7j1XBcusXIVYR5A7yiRFNyCAoKfY4BecME0J/mMh7ut72E7mokVDkUBWCboE7sk2IRb+E+RZDGZWPfM4xHrms=\n-----END PRIVATE KEY-----







</entry>



<entry [Thu Dec  2 19:49:22 EST 2010] ERIC BENSON - CALL AND FOLLOWUP MESSAGE>




Hi Eric,

Thank you for answering all my questions during our phone call today.

I'm looking forward to receiving the NDA so we can discuss the Direct Connect MPLS system? I'd also like to know if its possible to access billing information through the EC2 API (or if that could be developed?). It would also help if you could provide me with a list of any biotech companies, academic institutions or research centers that you're working with.

And I was wondering if there is an official or sanctioned clearing house for AMIs, particularly bioinformatics-related one? If not, do you know if one is planned, either launched by Amazon or by any other group?

Also, given that you've just recently launched the cc1 instance and Mysql RDS,  I was wondering if there are any more surprises in the pipeline?

After we rang off I realized I hadn't asked you my last question:

5. Is it possible to have a separate login password for my AWS account and my Amazon account? For ease of use and security, I would like to be able to access the two accounts separately. I would like to migrate my existing AWS account information to achieve this, i.e., without having to create a new Amazon account just for AWS.

If you can send me the NDA by tomorrow AM, I'll send it right back to you and we could perhaps shoot for a late-afternoon call? I'd like to ask you for more details on the data transfer and if you have any examples of how existing clients manage large transfers - the challenges and pitfalls, etc.

Thanks and best regards,

Stuart


ERIC BENSON QUESTIONS AND ANSWERS
---------------------------------

1. For Next Generation Sequencing applications, I need to upload terabytes of data before processing. Is AWS Import/Export the only service you have for this kind of data volume? Particularly, alternate network transfer over dedicated lines?

How does ASPERA perform in practise? depending on number of aspera instances and bandwidth where yuo are we do have clients pushing multiple terabytes per day




ftp, vpc

direct connect mpls

NDA


s3 tiered pricing




2. For network data transfers it would be useful to be able to start transferring the data file before it has actually finished being written. Would s3 multipart be able to handle 100+ GB files in this manner? And what range of transfer speed could I expect?


5 gb max file size in S3 but ways to work around it by chopping up into chunks and reassembling



3. Could you please provide me with a range of storage fees ($/TB/month) from 100 Terabytes to 1 Pedabyte? In particular, it would be useful to have an idea of the rate of price reductions with scale and over time. 



$0.08 /gb/month

lose 1 item every 12 years? ten-nines?


reduced redundancy storage

$0.05 per GB/month at 1 pedabyte - open to negotiation?



4. I would like to prepay for EC2 usage and allow other AWS users to use this prepaid amount. Do you have a mechanism for this? Please note, I don't want to pay a yearly fee to be able to purchase these prepaid blocks.


API for billing.

Flexible so might be able to provide prepaid blocks.

10G ehterrnet cc1s cluster instances

list of companies?



5. Is it possible to have a separate login password for my AWS account and my Amazon account? For ease of use and security, I would like to be able to access the two accounts separately. I would like to migrate my existing AWS account information to achieve this, i.e., without having to create a new Amazon account just for AWS.


6. TEACHING TIME




</entry>



<entry [Thu Dec  2 12:11:36 EST 2010] ASPERA AMI AVAILABLE>




Hi Johnny,

I thought you might be interested in this as a possible solution for the cloud data transfer problem:

http://asperasoft.com/en/products/on_demand_17/aspera_on_demand_for_AWS_17

Aspera is the fast data transfer system for the 1000 Genomes Project, and the Broad Institute, EBI and BGI are also using it. This Nov 16 article goes into some of the details:

http://www.bio-itworld.com/2010/issues/nov-dec/aspera.html

Cheers,

Stuart


ALSO AT CHI NEXTGEN CONFERENCE IN MARCH 2011:


March 14-16
Sequencing Data Storage and Management
http://www.xgencongress.com/sds

March 16-18
Sequencing Data Analysis and Interpretation
http://www.xgencongress.com/sdw


5:10 Ultra High-Speed Transport of Life Sciences Data over Global Networks 
Michelle Munson, President & Co-Founder, Aspera, Inc.
Collaborative research teams need to efficiently exchange, process and analyze gigabytes of data in a sequence run. Traditional data transport methods are unable to manage this volume of data. This session focuses on now-generation transport technologies used in genomic research that achieves up to 1000x, the throughput of standard file transfer protocols. A case study of global researchers participating in the 1000 Genomes Project showcases how they have been able to exchange sequencing data at 1 Gbps.



</entry>



<entry [Tue Nov 30 12:13:03 EST 2010] MESSAGE TO AWS>



Dear Sir/Madam,

I am implementing bioinformatics analysis pipelines on AWS and I was hoping you could help me with the following questions:

1. For Next Generation Sequencing applications, I need to upload terabytes of data before processing. Is AWS Import/Export the only service you have for this kind of data volume? Particularly, alternate network transfer over dedicated lines?

2. For network data transfers it would be useful to be able to start transferring the data file before it has actually finished being written. Would s3 multipart be able to handle 100+ GB files in this manner? And what range of transfer speed could I expect?

3. Could you please provide me with a range of storage fees ($/TB/month) from 100 Terabytes to 1 Pedabyte? In particular, it would be useful to have an idea of the rate of price reductions with scale and over time. 

4. I would like to prepay for EC2 usage and allow other AWS users to use this prepaid amount. Do you have a mechanism for this? Please note, I don't want to pay a yearly fee to be able to purchase these prepaid blocks.

5. Is it possible to have a separate login password for my AWS account and my Amazon account? For ease of use and security, I would like to be able to access the two accounts separately. I would like to migrate my existing AWS account information to achieve this, i.e., without having to create a new Amazon account just for AWS.

Thanks and best regards,

Stuart Young



AWS IMPORT/EXPORT CALCULATOR
http://awsimportexport.s3.amazonaws.com/aws-import-export-calculator.html

S3 USAGE CALCULATOR
http://calculator.s3.amazonaws.com/calc5.html


GPU
http://aws.typepad.com/aws/2010/11/new-ec2-instance-type-the-cluster-gpu-instance.html

EC2 INSTANCE TYPES
http://aws.amazon.com/ec2/instance-types/


</entry>



<entry [Tue Nov 30 12:12:03 EST 2010] JOHNNY GILBERT'S INFO>




AKIAJWZIAB2ZZB7FHJIQ

7dEtf/23BzV2UAwk6jUikk80WBsItHISdC2Urwef


amazonuserid=558277860346&awsaccesskeyid=AKIAJWZIAB2ZZB7FHJIQ&awssecretaccesskey=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&ec2publiccert=-----BEGIN CERTIFICATE-----\nMIICdzCCAeCgAwIBAgIFHoFGKBUwDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMYQVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTEwMTExOTE2NDMzNFoXDTExMTExOTE2NDMzNFowUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAVBgNVBAsTDkFXUy1EZXZlbG9wZXJzMRYwFAYDVQQDEw0xd2h3enZlN21ueGNhMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCBAssW9lEbOI1zeh5SAoUqncF6ezQ7M0ZGfgPfo/bKkmxTZitcDbHlPx8i2RDsrrhjFkBPOY6cJaguUIqZrVi80mAYlk     C/WatU0OKRMtOQsGPV7MMhMNSYD1wwN48SiDpWnF9WoSIdyXnNmywDTzPVemJWMMbCUrB9h+VppPPpEwIDAQABo1cwVTAOBgNVHQ8BAf8EBAMCBaAwFgYDVR0lAQH/BAwwCgYIKwYBBQUHAwIwDAYDVR0TAQH/BAIwADAdBgNVHQ4EFgQUls+H6G2aw4Di4BAiw39F5NjCNZswDQYJKoZIhvcNAQEFBQADgYEAbW0DkQ9+pqJO8bxoKUGgskdkJo9pzvF+5qeG/ncPyEYXj0ufrBqcEBfOmIBC0af7N5uFYZ9yvMm4QI7mR9K7Gjfmwa3pq1zHVyfNkuAd4XVdX4x4/eYGwGPDDqqqudkI0PEjYqYism14Gy9EA49oP9CWbJzhkHqqiHDjsuOAN8E=\n-----END CERTIFICATE-----&ec2privatekey=-----BEGIN PRIVATE KEY-----\nMIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAIECyxb2URs4jXN6HlIChSqdwXp7NDszRkZ+A9+j9sqSbFNmK1wNseU/HyLZEOyuuGMWQE85jpwlqC5QipmtWLzSYBiWQL9Zq1TQ4pEy05CwY9XswyEw1JgPXDA3jxKIOlacX1ahIh3Jec2bLANPM9V6YlYwxsJSsH2H5Wmk8+kTAgMBAAECgYA8oGFsQwjOb/8ZO1QwWfrWkhgwROHAyFHIIsQTPuxlOfYqIyNROSZWgxlQuQ1ZDKqd9gD2uieofZHRYgwgN/Qw69GuDUt9HzcNQ5yDPm3Ofa0WcD0tQa9YToHqEWVQaddc8D6DLcOwBDEropf2OIqd4JFusmenVBSIETihVKX8cQJBAM3Zs6W4nWtDExw7QlucgiKC0/R5exBk+BGVBAGHHcBTy+WXFrycUEJbj6q/PEIdGFxFvcO6GUk8x0JFGBgEB28CQQCgcNVc2Ar3kN3BAeM0xM5SVWlDYjDZwq5KId72g6CI/tcfjdpIHNI7yGlMNj4YPKOW2CAZebPLj3C74wclPUadAkEAgOcVju33baaX/fLBz/pGp3PDZHD59j8z9FabJpXEtJ4ErWWacEt2GseZRHPyOPhdO9LUTQ9pLCpqIH6B4vAK8wJAa0cnE16N7r1Z2Y1Wi9kwkBL2QI0uVtz6xyzgtfqLZC7qTvn9w4wp8rlt1vzKBlC9ncZDqGUdGHaADdGe3IKdbQJATBQ5VR3WM0lx6BrxXtHlxmmTikQ1mTlEdkjL4xJ9iXw7cRIIVdDzAait4TwuoxWxNODHlfMxK4ul8zcEE5bSlw==\n-----END PRIVATE KEY-----






aquarius-4
ami-f4788f9d

aquarius-4
ami-6a788f03


ADDED PERMISSIONS FOR USERS

JOHNNY GILBERT
558277860346


</entry>



<entry [Fri Nov 19 10:53:25 2010] CREATED aquarius-4>



aquarius-4
ami-f4788f9d

aquarius-4
ami-6a788f03


ADDED PERMISSIONS FOR USERS

JOHNNY GILBERT
558277860346

YUCHING
983300124420




</entry>



<entry [Fri Nov 19 10:52:25 2010] LAUNCH <<<LARGE>>> aquarius-3 (STUART) WITH STUART'S USER DATA:>



amazonuserid=728213020069&awsaccesskeyid=AKIAIZXZ6S7ARZ44TTHQ&awssecretaccesskey=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&ec2publiccert=-----BEGIN CERTIFICATE-----\nMIICeDCCAeGgAwIBAgIGAPU26XvIMA0GCSqGSIb3DQEBBQUAMFMxCzAJBgNVBAYTAlVTMRMwEQYDVQQKEwpBbWF6b24uY29tMQwwCgYDVQQLEwNBV1MxITAfBgNVBAMTGEFXUyBMaW1pdGVkLUFzc3VyYW5jZSBDQTAeFw0xMDEwMDQxODE0MzlaFw0xMTEwMDQxODE0MzlaMFMxCzAJBgNVBAYTAlVTMRMwEQYDVQQKEwpBbWF6b24uY29tMRcwFQYDVQQLEw5BV1MtRGV2ZWxvcGVyczEWMBQGA1UEAxMNMWdjbG41ZW5qYXcxNDCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEArakx/b3BIYoal1of5iVhZTtgGkFz5InF582kyAviP2Mceou9vcc+RdXHIc4PgTU7N37t5wGP8j9SA7u5dFWxb4TRNONqX6iPskF2DfUKlfFK1mXEp8h7ucGBbY9D4BHu07zQhNczfnjsqGlrRfmBCtrTCFNPy58KuyXceZOb5xMCAwEAAaNXMFUwDgYDVR0PAQH/BAQDAgWgMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMCMAwGA1UdEwEB/wQCMAAwHQYDVR0OBBYEFA2qXsSYvwsst1nAdM9SbVpWytCWMA0GCSqGSIb3DQEBBQUAA4GBAAtHxmSUKGMxiJXy8LjYg1DAG0Z1VYh8juWAzsYLk8I19AqvDp/Z4hB3OeGCmTyY31siCdaAwhkWHX+OIS91HzUi1Uy8774I4O3Ar1wqF5keR25avv/QZREJ68k8yucb7U/+9ds3/uPd2JHq+HyADQfPQUEJwUC8PMLuYkyOikXi\n-----END CERTIFICATE-----&ec2privatekey=-----BEGIN PRIVATE KEY-----\nMIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAK2pMf29wSGKGpdaH+YlYWU7YBpBc+SJxefNpMgL4j9jHHqLvb3HPkXVxyHOD4E1Ozd+7ecBj/I/UgO7uXRVsW+E0TTjal+oj7JBdg31CpXxStZlxKfIe7nBgW2PQ+AR7tO80ITXM3547Khpa0X5gQra0whTT8ufCrsl3HmTm+cTAgMBAAECgYBB8ilYuRE5Ik+cwA2zAOjuX1DMR6Sx2Zu8vfvgN5sQBRwQcTZ5dcrxDBBVhwGeSE+XcGz5Nz+pd2A2qLfxNIVvOSqrFHWGLylyPxfp/L3gpvXz/5N+eZ6Y9PT18NiYWmpXEXcKEDT+Msg8Io8CiivYU+cSs1yCq1becopC+EftqQJBAPI/j6T9BlFWO2e4Bu8xxKST3Xc5Q7+6Ux3v7h0bRD225dxrE/ML1/N36GwJq7joWHtscK6+jLJOgm4uBQ9sq+UCQQC3hOXiBHDRVtk8Pn6goRTPxMxAixoqbCP6DDogkigIpuJ4iEvmAYEE4XVfqC1bjay/oHU9hn8AOP0XwAJKHkeXAkAnu28W830eyBL0PwW8I6CKEcqILHdFMg1B4sFeOsOlj6MB1PovqeiggTE4zxlAObORgsa0koJHGINiCOBBmGRVAkEAhfMHw9fP7MxCVVmcHWxVf206VGXznEFAZTNlff6QH/iHVsjM9T3lyQUzIbXkHW4kR947lMPFkQkHmr04Lpc5UwJASiBGFuHXymAL3LzH1tGxZLbWvoXgkLGEJHG2Badq9ADhxHM5OVgq8mV2oG9JJDR0NXZ3GIQGUOVC4ibdjDymrg==\n-----END PRIVATE KEY-----


AKIAIZXZ6S7ARZ44TTHQ


</entry>



<entry [Fri Nov 19 10:51:25 2010] FINISHING TOUCHES TO AQUARIUS-3 TO MAKE IT BOOT, MOUNT DATA AND RUN SERVICES>



1. ADDED LINKS FOR AQUARIUS-3

mkdir /var/www/html/agua
ln -s /agua/html /var/www/html/agua/0.5

mkdir /var/www/cgi-bin/agua
ln -s /agua/cgi-bin /var/www/cgi-bin/agua/0.5


2. REMOVED REFERENCE TO SOURCE aws.sh IN /etc/rc.d/rc.local


3. ADDED RESTART HTTPD 


4. REMOVED /nethome DIRECTORY

SHUTDOWN MYSQL
/etc/init.d/mysqld stop

USE fuser TO FIND OUT WHICH PROCESS IS KEEPING THE DEVICE BUSY:
fuser -m /dev/sdi
    <none>



5. REMOVED /data DIRECTORY


6. RESTORED /etc/fstab

cp /etc/fstab.safe  /etc/fstab
 

</entry>



<entry [Thu Nov 18 23:15:07 EST 2010] .bash_profile EDITS FOR TRANSITION AQUARIUS-2 TO AQUARIUS-3>



EDIT .bash_profile

CHANGE THIS:

export EC2_PRIVATE_KEY=/agua/home/admin/.keypairs/privatekey.pem
export EC2_CERT=/agua/home/admin/.keypairs/publickey.pem

TO THIS:

export EC2_PRIVATE_KEY=/agua/home/admin/.keypairs/private.pem
export EC2_CERT=/agua/home/admin/.keypairs/public.pem


FULL BASH PROFILE:


cat ~/.bash_profile

# .bash_profile
# User specific aliases and functions

#### ec2
export PATH=/home/ec2/bin:$PATH
export EC2_HOME=/home/ec2
export JAVA_HOME=/usr
export EC2_PRIVATE_KEY=/agua/home/admin/.keypairs/private.pem
export EC2_CERT=/agua/home/admin/.keypairs/public.pem

# DATE
alias DATE='date'

# FIX DOS LINE ENDINGS
alias fle="perl -pi -e 's/\r//g' "
alias fle2="perl -pi -e 's/\r/\n/g' "

# turn on color file listing
export CLICOLOR=1

# ALIASES
alias q='qstat'
alias sqlite='sqlite3'
alias mod='chmod 755 *'
alias now='date "+DATE: %m/%d/%y%nTIME: %H:%M:%S"'
alias psg='ps aux | grep'
alias llhg='ls -alh | grep'
alias llg='ls -al | grep'
alias lg='ls | grep'
alias xpl='chmod 755 *.pl *.cgi *.t'
alias mq='mysql -u root -p'

alias em='emacs -nw'
alias me='emacs -nw'
alias gobash='emacs -nw ~/.bash_profile'
alias sobash='source ~/.bash_profile'
alias er='tail -f -n 100 /var/log/httpd/error_log'
alias myer='tail -100 /var/log/mysqld.log'
alias html='cd /var/www/html'
alias cgi='cd /var/www/cgi-bin'
alias cl='clear; ls; pwd'
alias apps='cd ~/base/apps'
alias updb='updatedb'

alias l='ls'
alias df='df -ah'
alias rm='rm -i'
alias mv='mv -i'
alias LL='ls -alh'
alias ll='ls -alh'
# -l = list view
# -a = all views, even hidden
# -h = human-readable sizes, e.g. 900B, 15K, 1.2MB

# keeps pico from line wrapping
alias pico="/usr/bin/pico -w"


# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi








</entry>



<entry [Thurs Nov 18 09:17:50 EST 2010] CREATED initAws.pl EXECUTE INITIALISATION TASKS FOR AGUA>



ADDED agua USER ON YUCHING'S aquarius-2-udata INSTANCE

mkdir /nethome
useradd agua -d /nethome/agua


cat /etc/passwd

    root:x:0:0:root:/root:/bin/bash
    bin:x:1:1:bin:/bin:/sbin/nologin
    daemon:x:2:2:daemon:/sbin:/sbin/nologin
    adm:x:3:4:adm:/var/adm:/sbin/nologin
    lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
    sync:x:5:0:sync:/sbin:/bin/sync
    shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
    halt:x:7:0:halt:/sbin:/sbin/halt
    mail:x:8:12:mail:/var/spool/mail:/sbin/nologin
    news:x:9:13:news:/etc/news:
    uucp:x:10:14:uucp:/var/spool/uucp:/sbin/nologin
    operator:x:11:0:operator:/root:/sbin/nologin
    games:x:12:100:games:/usr/games:/sbin/nologin
    gopher:x:13:30:gopher:/var/gopher:/sbin/nologin
    ftp:x:14:50:FTP User:/var/ftp:/sbin/nologin
    nobody:x:99:99:Nobody:/:/sbin/nologin
    vcsa:x:69:69:virtual console memory owner:/dev:/sbin/nologin
    nscd:x:28:28:NSCD Daemon:/:/sbin/nologin
    pcap:x:77:77::/var/arpwatch:/sbin/nologin
    dbus:x:81:81:System message bus:/:/sbin/nologin
    rpc:x:32:32:Portmapper RPC user:/:/sbin/nologin
    avahi:x:70:70:Avahi daemon:/:/sbin/nologin
    mailnull:x:47:47::/var/spool/mqueue:/sbin/nologin
    smmsp:x:51:51::/var/spool/mqueue:/sbin/nologin
    rpcuser:x:29:29:RPC Service User:/var/lib/nfs:/sbin/nologin
    nfsnobody:x:4294967294:4294967294:Anonymous NFS User:/var/lib/nfs:/sbin/nologin
    haldaemon:x:68:68:HAL daemon:/:/sbin/nologin
    avahi-autoipd:x:100:101:avahi-autoipd:/var/lib/avahi-autoipd:/sbin/nologin
    postfix:x:89:89::/var/spool/postfix:/sbin/nologin
    sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin
    apache:x:48:48:Apache:/var/www:/bin/bash
    xfs:x:43:43:X Font Server:/etc/X11/fs:/sbin/nologin
    mysql:x:27:27:MySQL Server:/var/lib/mysql:/bin/bash
    distcache:x:94:94:Distcache:/:/sbin/nologin
    agua:x:500:500::/nethome/agua:/bin/bash


cat /etc/shadow

    root:$1$Ltj/Kfoe$m5CpCJox3V6hZEkQdcOr.0:14909:0:99999:7:::
    bin:*:14586:0:99999:7:::
    daemon:*:14586:0:99999:7:::
    adm:*:14586:0:99999:7:::
    lp:*:14586:0:99999:7:::
    sync:*:14586:0:99999:7:::
    shutdown:*:14586:0:99999:7:::
    halt:*:14586:0:99999:7:::
    mail:*:14586:0:99999:7:::
    news:*:14586:0:99999:7:::
    uucp:*:14586:0:99999:7:::
    operator:*:14586:0:99999:7:::
    games:*:14586:0:99999:7:::
    gopher:*:14586:0:99999:7:::
    ftp:*:14586:0:99999:7:::
    nobody:*:14586:0:99999:7:::
    vcsa:!!:14586:0:99999:7:::
    nscd:!!:14586:0:99999:7:::
    pcap:!!:14586:0:99999:7:::
    dbus:!!:14586:0:99999:7:::
    rpc:!!:14586:0:99999:7:::
    avahi:!!:14586:0:99999:7:::
    mailnull:!!:14586:0:99999:7:::
    smmsp:!!:14586:0:99999:7:::
    rpcuser:!!:14586:0:99999:7:::
    nfsnobody:!!:14586:0:99999:7:::
    haldaemon:!!:14586:0:99999:7:::
    avahi-autoipd:!!:14586:0:99999:7:::
    postfix:!!:14586:0:99999:7:::
    sshd:!!:14586:0:99999:7:::
    apache:!!:14907::::::
    xfs:!!:14907::::::
    mysql:!!:14909::::::
    distcache:!!:14920::::::
    agua:!!:14931:0:99999:7:::



</entry>



<entry [Wed Nov 17 18:17:50 EST 2010] CREATED initAws.pl EXECUTE INITIALISATION TASKS FOR AGUA>




INITIALISATION TASKS:

    0. PARSE USERDATA KEYS PASSED TO INSTANCE FROM AWS CONSOLE

    1. PRINT X.509 KEY FILES FOR HTTPS AND AWS
    
    2. MOUNT AGUA DATA VOLUME
    
    3. MOUNT USER VOLUMES	

    4. LOAD USER DATA INTO AGUA DATABASE



SUMMARY AGUA DATA STRUCTURE


THREE DATA GROUPS:

1. /agua (AMI 10GB)

    1. AGUA SOFTWARE
    latest agua scripts
    latest agua mysql
    

2. /data (SNAPSHOT-BASED EBS VOLUME 20GB)
    (SNAPSHOT ID CORRESPONDS TO agua VERSION)
    
    1. AGUA DATA & APPS
    reference genomes
    external applications
    jbrowse data

 
3. /nethome (CREATED EBS VOLUME 10GB - 1TB)

    1. USER DATA DIVIDED INTO INDIVIDUAL USER SUB-FOLDERS
    
    /nethome/user1
    /nethome/user2

   2. MYSQL DIRECTORY (COPIED FROM /data)
    /nethome/mysql




CONFIGURATION VALUES

emacs default-linux.conf

    ...
    #### AWS
    AGUADATA_SNAPSHOT       snap-55fe4a3f
    AGUADATA_AVAILZONE      us-east-1a
    AGUADATA_MOUNTPOINT     /data
    AGUADATA_SIZE           40
    AGUADATA_DEVICE         /dev/sdh
    ...




LAUNCH <<<LARGE>>> aquarius-2 WITH YUCHING'S USER DATA:

amazonuserid=983300124420&awsaccesskeyid=AKIAI6A6W55JJGZAUZJQ&awssecretaccesskey=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&ec2publiccert=-----BEGIN CERTIFICATE-----\nMIICdjCCAd+gAwIBAgIFICPVqRcwDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMYQVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTEwMTExMzE2NTYzNVoXDTExMTExMzE2NTYzNVowUjELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAVBgNVBAsTDkFXUy1EZXZlbG9wZXJzMRUwEwYDVQQDEwxqbjNjM2czajB3c2EwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAInvArQAsWgBcXnduzJil96gHC/dURbre/4Hyrx5FRTFFNHgUwZkFPYp7oxKRAKOSV2kh8ZLyDSv9yqi0/C9ESKG89zRClUhUASj1yUTBkmVFp2bYiVkGbx11UnZMYiNz+n9o7IzKRQALrtQ2KfFJmmA3d7qlKOpBcVsDQyKWubbAgMBAAGjVzBVMA4GA1UdDwEB/wQEAwIFoDAWBgNVHSUBAf8EDDAKBggrBgEFBQcDAjAMBgNVHRMBAf8EAjAAMB0GA1UdDgQWBBREmsS8R7JBEsureBtF49VTLPiE3TANBgkqhkiG9w0BAQUFAAOBgQCNT3OQqOzJijMftvdUXjJROWsly8EOoDWJ6uULYAWHyXSLXhmkd43VXFXKPCBCkUhmTCjXI5BZ+FYOVD/dVdXYQ5DtCYAQY3nWzKSr4tsfggh5FkMg80Yj0lz7xnOTtF6c2KP6fbcgKtJugj8B/iQBvwY1uQ8FQZLQrocjDhBKMA==\n-----END CERTIFICATE-----&ec2privatekey=-----BEGIN PRIVATE KEY-----\nMIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAInvArQAsWgBcXnduzJil96gHC/dURbre/4Hyrx5FRTFFNHgUwZkFPYp7oxKRAKOSV2kh8ZLyDSv9yqi0/C9ESKG89zRClUhUASj1yUTBkmVFp2bYiVkGbx11UnZMYiNz+n9o7IzKRQALrtQ2KfFJmmA3d7qlKOpBcVsDQyKWubbAgMBAAECgYEAhQeePMraTyvtLJLcY3jRbiZPaR5zgb515IfRUTsaSODW9p/6kxRdXxkL+AP8WdavDYCMboRSP/ZiVJ2b+PfwGELpjoH4OYd420+wK3pLnBm4UrXxUsX92rA3UbUIqA8KSYMJikxkOSTuxsRn26ew78IbSbyX9D8aUfn/SAYH1IkCQQDikU5DEfZlrti738ToNWb0Des1UrTT75wXOt0c9lCTVJC+wskZOl3tj+jIa4R7eUwZ93cQ3XtqbFvMMPzFFP9lAkEAm9obxjZOuEAKdid4jjo1bf7yQsqKA2K9wFaTjQI9hCqcKVTUW0WgQf/xZxYzTMzyjgyFyCOPoBCNcF7CzseJPwJAKAa3ps2zk/8xtu8vYD6e85rJ5N+5pn98OfZiPc2eKokUET9kO5q+IUv9OfsUqqOhOC0p0cbvGLwP86Dr5v1wqQJBAJUKin8OFk/LJnYBnx9ceRX8tg67hCpithWGdcpmdw+6c+ZusjmqpuwW5/NuXpa2c8r2HMXdhA9NZQUuCdwXI58CQQCZk37/ypK4yGbnQV7zaVhMZgiS9M9750kc5Il4GVZHbrbruhMgQSrvfjOX3r2FxN3IFKROx+choIOcwX/w9T3z\n-----END PRIVATE KEY-----


CONNECT:

ec2-75-101-225-3.compute-1.amazonaws.com


GET USER DATA:

curl http://169.254.169.254/1.0/user-data

    OK

    user id=983300124420&accesskeyid=AKIAI6A6W55JJGZAUZJQ&awssecretaccesskey=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&publiccert=-----BEGIN CERTIFICATE-----MIICdjCCAd+gAwIBAgIFICPVqRcwDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMYQVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTEwMTExMzE2NTYzNVoXDTExMTExMzE2NTYzNVowUjELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAVBgNVBAsTDkFXUy1EZXZlbG9wZXJzMRUwEwYDVQQDEwxqbjNjM2czajB3c2EwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAInvArQAsWgBcXnduzJil96gHC/dURbre/4Hyrx5FRTFFNHgUwZkFPYp7oxKRAKOSV2kh8ZLyDSv9yqi0/C9ESKG89zRClUhUASj1yUTBkmVFp2bYiVkGbx11UnZMYiNz+n9o7IzKRQALrtQ2KfFJmmA3d7qlKOpBcVsDQyKWubbAgMBAAGjVzBVMA4GA1UdDwEB/wQEAwIFoDAWBgNVHSUBAf8EDDAKBggrBgEFBQcDAjAMBgNVHRMBAf8EAjAAMB0GA1UdDgQWBBREmsS8R7JBEsureBtF49VTLPiE3TANBgkqhkiG9w0BAQUFAAOBgQCNT3OQqOzJijMftvdUXjJROWsly8EOoDWJ6uULYAWHyXSLXhmkd43VXFXKPCBCkUhmTCjXI5BZ+FYOVD/dVdXYQ5DtCYAQY3nWzKSr4tsfggh5FkMg80Yj0lz7xnOTtF6c2KP6fbcgKtJugj8B/iQBvwY1uQ8FQZLQrocjDhBKMA==-----END CERTIFICATE-----&privatekey=-----BEGIN PRIVATE KEY-----MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAInvArQAsWgBcXnduzJil96gHC/dURbre/4Hyrx5FRTFFNHgUwZkFPYp7oxKRAKOSV2kh8ZLyDSv9yqi0/C9ESKG89zRClUhUASj1yUTBkmVFp2bYiVkGbx11UnZMYiNz+n9o7IzKRQALrtQ2KfFJmmA3d7qlKOpBcVsDQyKWubbAgMBAAECgYEAhQeePMraTyvtLJLcY3jRbiZPaR5zgb515IfRUTsaSODW9p/6kxRdXxkL+AP8WdavDYCMboRSP/ZiVJ2b+PfwGELpjoH4OYd420+wK3pLnBm4UrXxUsX92rA3UbUIqA8KSYMJikxkOSTuxsRn26ew78IbSbyX9D8aUfn/SAYH1IkCQQDikU5DEfZlrti738ToNWb0Des1UrTT75wXOt0c9lCTVJC+wskZOl3tj+jIa4R7eUwZ93cQ3XtqbFvMMPzFFP9lAkEAm9obxjZOuEAKdid4jjo1bf7yQsqKA2K9wFaTjQI9hCqcKVTUW0WgQf/xZxYzTMzyjgyFyCOPoBCNcF7CzseJPwJAKAa3ps2zk/8xtu8vYD6e85rJ5N+5pn98OfZiPc2eKokUET9kO5q+IUv9OfsUqqOhOC0p0cbvGLwP86Dr5v1wqQJBAJUKin8OFk/LJnYBnx9ceRX8tg67hCpithWGdcpmdw+6c+ZusjmqpuwW5/NuXpa2c8r2HMXdhA9NZQUuCdwXI58CQQCZk37/ypK4yGbnQV7zaVhMZgiS9M9750kc5Il4GVZHbrbruhMgQSrvfjOX3r2FxN3IFKROx+choIOcwX/w9T3z-----END PRIVATE KEY-----



RUN initAws.pl
--------------


export EC2_PRIVATE_KEY=/agua/home/admin/.keypairs/private.pem
export EC2_CERT=/agua/home/admin/.keypairs/public.pem


CREATE VOLUME
-------------


CONFIRM VOLUME IS CREATED:

ec2dvol vol-8b37dde3 
    VOLUME  vol-8b37dde3    40      snap-55fe4a3f   us-east-1a      available       2010-11-18T07:49:19+0000


ATTACH+MOUNT VOLUME
-------------------

Admin::AWS::mountAguaData    instanceid: i-9accaef7
Admin::AWS::mountAguaData    attach_command: ec2-attach-volume vol-8b37dde3 -K /agua/home/admin/.keypairs/private.pem -C /agua/home/admin/.keypairs/public.pem -i i-9accaef7 -d /dev/sdh
Client.InvalidParameterValue: Invalid value '/dev/sdh' for unixDevice. Attachment point /dev/sdh is already in use
Admin::AWS::mountAguaData    attach_success: 
Admin::AWS::mountAguaData    mount_command: mount /dev/sdh /data
mount: /dev/sdh already mounted or /data busy
mount: according to mtab, /dev/sdh is already mounted on /data
Admin::AWS::mountAguaData    mount_success: 



CONFIRM VOLUME IS ATTACHED TO THIS INSTANCE:


ll /data

    drwxr-xr-x  3 root root 4.0K Oct 10 23:49 agua
    drwxr-xr-x 53 root root 4.0K Oct 14 03:48 apps
    drwxr-xr-x  3 root root 4.0K Oct 11 01:50 base
    drwxr-xr-x  2 root root 4.0K Oct 18 19:56 img-mnt
    drwx------  2 root root  16K Oct 10 23:43 lost+found
    drwxr-xr-x  5 root root 4.0K Oct 11 01:07 mysql
    drwxr-xr-x  2 root root 4.0K Oct 11 02:44 starcluster

df -a

    Filesystem            Size  Used Avail Use% Mounted on
    /dev/sda1              10G  5.2G  4.3G  56% /
    none                     0     0     0   -  /proc
    none                     0     0     0   -  /sys
    none                     0     0     0   -  /dev/pts
    /dev/sdb              414G  199M  393G   1% /mnt
    none                     0     0     0   -  /proc/sys/fs/binfmt_misc
    /dev/sdh               40G   25G   14G  65% /data
    

ec2din

    RESERVATION     r-5f19a335      983300124420    default
    INSTANCE        i-342cb459      ami-de2ed9b7                    stopped agua    0               t1.micro        2010-11-17T13:59:57+000us-east-1a       aki-b51cf9dc    ari-b31cf9da            monitoring-disabled                                     ebs
    BLOCKDEVICE     /dev/sda1       vol-e3816f8b    2010-11-14T15:07:54.000Z
    BLOCKDEVICE     /dev/sdf        vol-4948a121    2010-11-16T02:38:40.000Z
    RESERVATION     r-e3c24089      983300124420    default
    INSTANCE        i-9accaef7      ami-de2ed9b7    ec2-67-202-49-116.compute-1.amazonaws.com       ip-10-112-63-33.ec2.internal    runningagua     0               m1.large        2010-11-18T07:30:53+0000        us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled     67.202.49.116   10.112.63.33                    ebs
    BLOCKDEVICE     /dev/sda1       vol-27608b4f    2010-11-17T16:35:17.000Z
    BLOCKDEVICE     /dev/sdh        vol-3d2dc755    2010-11-18T05:52:18.000Z


cat /etc/fstab

/dev/sda1  /         ext3    defaults        1 1
/dev/sdb   /mnt      ext3    defaults        0 0
none       /dev/pts  devpts  gid=5,mode=620  0 0
none       /proc     proc    defaults        0 0
none       /sys      sysfs   defaults        0 0
/swapfile  none      swap    sw              0 0

/data/mysql/etc/mysql /etc/mysql     none bind
/data/mysql/lib/mysql /var/lib/mysql none bind
/data/mysql/log/mysql /var/log/mysql none bind


    







NOTES
-----

GOT THIS ERROR WHEN TRYING TO ATTACH VOLUME USING Net::Amazon::EC2 INSTANCE:

QUERY TO SIGN: ActionAttachVolumeAWSAccessKeyIdAKIAI6A6W55JJGZAUZJQDevice/dev/sdhInstanceIdi-9accaef7SignatureVersion1Timestamp2010-11-18T06:10:58.000ZVersion2009-11-30VolumeIdvol-3f20ca57
GENERATED QUERY URL: http://us-east-1.ec2.amazonaws.com

[Thu Nov 18 01:11:00 2010] initAws.pl: $VAR1 = {
[Thu Nov 18 01:11:00 2010] initAws.pl:           'RequestID' => 'e331d2de-d115-4424-9916-50f59b20845d',
[Thu Nov 18 01:11:00 2010] initAws.pl:           'Errors' => [
[Thu Nov 18 01:11:00 2010] initAws.pl:                       {
[Thu Nov 18 01:11:00 2010] initAws.pl:                         'Error' => {
[Thu Nov 18 01:11:00 2010] initAws.pl:                                    'Code' => 'InvalidParameterValue',
[Thu Nov 18 01:11:00 2010] initAws.pl:                                    'Message' => 'Invalid value \'/dev/sdh\' for unixDevice. Attachment point /dev/sdh is already in use'
[Thu Nov 18 01:11:00 2010] initAws.pl:                                  }
[Thu Nov 18 01:11:00 2010] initAws.pl:                       }
[Thu Nov 18 01:11:00 2010] initAws.pl:                     ]
[Thu Nov 18 01:11:00 2010] initAws.pl:         };
[Thu Nov 18 01:11:00 2010] initAws.pl: 
[Thu Nov 18 01:11:00 2010] initAws.pl: 


ERROR CODE: InvalidParameterValue MESSAGE: Invalid value '/dev/sdh' for unixDevice. Attachment point /dev/sdh is already in use FOR REQUEST: e331d2de-d115-4424-9916-50f59b20845d



Admin::AWS::mountAguaData    success: 
$VAR1 = bless( {
                 'errors' => [
                               bless( {
                                        'message' => 'Invalid value \'/dev/sdh\' for unixDevice. Attachment point /dev/sdh is already in use',
                                        'code' => 'InvalidParameterValue'
                                      }, 'Net::Amazon::EC2::Error' )
                             ],
                 'request_id' => 'e331d2de-d115-4424-9916-50f59b20845d'
               }, 'Net::Amazon::EC2::Errors' );
Admin::AWS::mountAguaData    mount_command: mount /dev/sdh /data
Admin::AWS::mountAguaData    mount_success: 
[root@ip-10-203-2-251 scripts]# ll /data






http://aws.amazon.com/articles/1085?_encoding=UTF8&jiveRedirect=1

Using Parameterized Launches to Customize Your AMIs


PJ Cabrera explains how to use parameterized launches and a simple Ruby script to easily configure Amazon Machine Image (AMI) instances.
Details
Submitted By:	Craig@AWS
AWS Products Used:	 Amazon EC2
Language(s):	 Ruby
Created On:	December 7, 2007 6:08 PM GMT
Last Updated:	September 21, 2008 10:09 PM GMT
By PJ Cabrera, freelance software developer

Amazon Elastic Compute Cloud (Beta) (Amazon EC2), an Amazon Web Services (AWS) tool, lets developers create several instances of an AMI. Although you can use Amazon EC2 to create multiple instances almost at will, rarely does it makes sense for each of these instances to be configured identically. Parameterized launches let you pass the instances custom configuration parameters that they can retrieve and act on as they are started or at any other time during the life of the instance. In this article, I give you several examples of how to use parameterized launches and create a simple generic AMI that you can extend and use along with your own startup scripts and other software.

User Data Defined

You'll use the Amazon EC2 command-line utility ec2-run-instances to launch instances of an AMI, booting Amazon EC2 virtual machines with your choice of Linux distro and installed software. The command takes several parameters, among them the so-called user data parameters, -d and -f. You can use either of these parameters to send specific data to your AMI instances at launch time.

Following are several examples that show how to use the ec2-run-instances command and the -d and -f parameters to send user data at launch time. I will be using a fake AMI ID, ami-1234567. Substitute this for an AMI you can experiment with to run these examples.

The simplest example is a string of delimited-value assignments, in which you use commas as delimiters. You can parse this on your instance by using a script and configure your software according to the values you pass at launch time. I will discuss how to do this shortly.

ec2-run-instances ami-1234567 -d service=httpd,cache=320K
Sometimes you need to include white space and other special characters in your user data. Most command shells can treat long strings of text surrounded by double quotes as a single parameter, as I demonstrate in the following example.

ec2-run-instances ami-1234567 -d "services='httpd mysql'"
Unix shells can pass a parameter that spans multiple lines by using double quotes to mark the start and the end of the data.

ec2-run-instances ami-1234567 -n 2 -d \ 
"service=httd,domainname=www.mydomain.com
service=mongrel_cluster,domainname=mongrel1.mydomain.com"
In the previous example, the -n parameter tells Amazon EC2 to start more than one instance of the AMI at the same time--in this case, two instances. Imagine that the first line in the user data example is meant for the first instance, and the second line is meant for the second instance. I will explain how each instance can retrieve its specific user data later in this tutorial.

So, that is it for -d parameter examples. The -f parameter can be quite handy, too. You'll use it to send a file as user data instead of sending strings of text from the command prompt. Windows users can use the -f parameter to send data on multiple lines because the Windows command shell cannot process multi-line command lines. To demonstrate, let's reproduce the previous example using the -f parameter.

-- user-data.ini file contents ---
service=httd,domainname=www.mydomain.com
service=mongrel_cluster,domainname=mongrel1.mydomain.com

-- instance launching command-line --
ec2-run-instances ami-1234567 -n 2 -f user-data.ini
According to the Amazon EC2 Developer Guide, the -f parameter can even handle binary files! The data is encoded to base64 in transit and arrives verbatim on the other side. The Amazon EC2 Developer Guide also points out that the user data has a 16 KB limit. That's quite generous if you restrict your user data to heavily compressed text configuration files.

ec2-run-instances ami-1234567 -f bunchOfiles.zip
To retrieve this user-data (as the Amazon EC2 Developer Guide calls it) you run your instance by sending an HTTP GET request to the following URL: http://169.254.169.254/1.0/user-data. From your Amazon EC2 instance's command prompt, you can check this data by using cURL, like this:

curl http://169.254.169.254/1.0/user-data
When using the -f parameter to send binary files at launch time , you can use wget to download the binary file, like this:

wget http://169.254.169.254/1.0/user-data -O bunchOfiles.zip

A Practical Example

We've looked at ways to send user data at launch time and seen how to retrieve this user data at the command line from our instance. But the real power of this feature is in automating the retrieval of the user data from the instance at launch and applying the user data to configure our instances.

For example, imagine that you want to use one AMI to run your web site, employing several instances for performance, reliability, and fail tolerance. You want to have an instance of your AMI run Apache as a load balancer, and two other instances of the same AMI running mongrel_cluster. You also need the dynamic DNS utility ddclient to assign your instances' IP addresses to the domains used by your web site. You need dynamic DNS because the IP of an instance is likely to change every time you need to relaunch an instance.

I'm going to gloss over the installation and specific configuration steps of this software, and instead discuss how to automate the services that each of your instances will run and the setting of configuration parameters from user data sent at instance launch time. One specific configuration change I made in this case was to disable Apache, mongrel_cluster, and ddclient from running by default. You want them to be started only by the automated configuration scripts created for this example, and only if the configuration parameters of a specific instance's user data tell the scripts to start one of the services.

For this example, I am going to send a .zip file to three AMI instances by using the following command:

ec2-run-instances ami-1234567 -n 3 -f payload.zip
The payload.zip archive contains a shell script called autorun.sh, a Ruby script called get-launch-params.rb, and a plain-text configuration file called launch-params. I will show the contents of each of these files shortly.

The key to automating the configuration of services in an AMI at launch time is to modify the init scripts on your AMI to retrieve the user data and act on the configuration parameters sent at launch time. You need to modify the last script to run at startup. In a Red Hat-based distribution such as Fedora Core or Red Hat Enterprise Linux, this script is located at /etc/rc.local. For this example, you will modify /etc/rc.local by adding the following code at the end:

####### These lines go at the end of /etc/rc.local #######

wget http://169.254.169.254/1.0/user-data \ 
  -O /tmp/payload.zip

# if wget error code is 0, there was no error
if [ "$?" -e "0" ]; then

  mkdir /tmp/payload
  unzip /tmp/payload.zip -d /tmp/payload/ -o

  # if unzip error code is 0, there was no error
  if [ "$?" -e "0" ]; then
	
    # if the autorun.sh script exists, run it
    if [ -x /tmp/payload/autorun.sh ]; then

      sh /tmp/payload/autorun.sh

    else
      echo rc.local : No autorun script to run
    fi

  else
    echo rc.local : payload.zip is corrupted
  fi
	
else
  echo rc.local : error retrieving user data
fi
This script retrieves the user data, which I will call "the payload" for the remainder of this article, assuming it is a .zip archive. The file /etc/rc.local unpacks the payload to the folder /tmp/payload and runs a script called autorun.sh, which, as you might remember, we packed into the payload along with the other files mentioned earlier. The autorun.sh file contains the following code:

#! /usr/bin/bash

### autorun.sh

# get the launch parameters for this Amazon EC2 instance and 
# export the launch parameters out as shell variables
`/usr/bin/ruby /tmp/payload/get-launch-params.rb -e`

# if the 'service' environment variable is set, then start
# the service specified at launch for this instance
if [ "$service" != "" ]; then
  /etc/init.d/$service start
fi

# if the 'domainname' environment variable is set, then
# append the domain name at the end of the ddclient config
# and run the ddclient service to update the DNS records
if [ "$domainname" != "" ]; then

  # don't forget to update /etc/ddclient/ddclient.conf
  # with the credentials for your dynamic DNS provider,
  # and to create your own AMI so your changes will "take"

  echo $domainname >> /etc/ddclient/ddclient.conf
  /etc/init.d/ddclient start
fi
The autorun.sh script runs another script packed in the payload--the Ruby script called get-launch-params.rb--and then examines two specific environment variables, service and domainname, and takes action depending on whether the variables are set. Here are the contents of get-launch-params.rb:

#! /usr/bin/ruby

### get-launch-params.rb

# The following script obtains the launch parameters from 
# the file /tmp/payload/launch-params, then parses out the 
# parameters for this instance by using the launch index
# of this particular EC2 instance.
#
# Pass the command the -e flag to output the instance 
# parameters as exports of shell variables. Any other 
# arguments are ignored.

require 'net/http'
require 'uri'

def get_http_request(uri_suffix)
  uri_str = "http://169.254.169.254/1.0/" + uri_suffix
  response = Net::HTTP.get_response(URI.parse(uri_str))
  case response
  when Net::HTTPSuccess then 
    response.body
  else
    nil
  end
end

def get_launch_params(launch_params_file)
  IO.readlines launch_params_file
end

def get_launch_instance
  get_http_request "meta-data/ami-launch-index"
end

export_stmt = ""

launch_params = get_launch_params(
  "/tmp/payload/launch-params")

if launch_params.length > 0
  launch_instance = get_launch_instance

  instance_params_str = launch_params[launch_instance.to_i]

  instance_params = instance_params_str.split(',')

  export_stmt = "export " if ARGV.length > 0 && 
    ARGV.include?("-e")

  instance_params.each { |param| 
    puts export_stmt + param 
  }

end
The get-launch-params.rb script parses out the contents of the file called launch-params, which was also packed in the payload and which contains one line of configuration parameters per instance to be launched. The script obtains the AMI instance's launch index from the Amazon EC2 metadata web service, then outputs each environment variable that corresponds to this particular instance. Here are the contents of the launch-params file:

service=httpd,domainname=www.mydomain.com
service=mongrel_cluster,domainname=mongrel1.mydomain.com
service=mongrel_cluster,domainname=mongrel2.mydomain.com
Putting It All Together

Using /etc/rc.local and the contents of the payload archive along with autorun.sh, get-launch-params.rb, and launch-params makes for a very flexible and potent combination. The AMI has been kept as generic and simple as possible, except for the modified /etc/rc.local file. The payload archive contains all the configuration files and scripts we need to tailor each instance as we like.

Keep in mind that starting up a few services and setting a domain is only the tip of the iceberg. The autorun.sh script could have downloaded and installed packages, overwritten configuration files with other files from the payload, and turned a generic instance into anything I wanted. I chose to preinstall the Apache, mongrel_cluster, and ddclient packages for faster startup times, but I could have used an even more generic AMI and made autorun.sh install services according to the settings of various different launch parameters in the payload.

The possibilities of what you can do with parameterized launches are indeed endless. I hope this article whetted your appetite and started you thinking of ways to make your AMIs more flexible and reusable for many tasks and over many instances.

PJ Cabrera is a freelance software developer specializing in Ruby on Rails e-commerce and content management systems development. PJ's interests include Ruby on Rails and open-source scripting languages and frameworks, agile development practices, mesh networks, compute clouds, XML parsing and processing technologies, microformats for more semantic web content, and research into innovative uses of Bayesian filtering and symbolic processing for improved information retrieval, question answering, text categorization, and extraction. You can reach him at pjcabrera at pobox dot com, and read his weblog at pjtrix.com/blawg/

Comments

Very Helpful.. but....
I've been using this for payload deployment on centos, and it's a very good way to deploy things onto your system, I now have payload zip files to configure and install any of the types of systems I might need at very short notice.

A word of warning to those wanting to use this method though...

1 - there is a 16Kb limit on the zip file, so make sure it's under that or you will have problems.

2 - make sure your script does not run again when you re-boot, one instance  has running was rebooted and it totally failed to re-start because it was trying to overwrite a file, and the console got stuck during boot time because it was asking to confirm the overwrite, silly I know, but it stung me - I have changed my script to touch /etc/payload-deployed and test for the existence of that file before unzipping and running, that way the script only runs once.

Chris Brooks
Systems Administrator
VSM Systems
 vsmadmin on June 11, 2009 10:53 AM GMT
variable scoping problem...
Good article.

In the rc.local code sample I had to use the following in order to get the exported variables to be seen by my calling script:

source /tmp/payload/autorun.sh

instead of: 

sh /tmp/payload/autorun.sh

Thanks for your good work!

Daren
 dd132 on October 30, 2008 6:36 PM GMT
Well written!
Thanks for all the notes and example.
 cpstaff on October 13, 2008 11:22 PM GMT
Very helpful overview
This is a nice overview of how to handle instance-specific configuration automatically.

Thanks!
 "sublime1" on September 10, 2008 1:28 PM GMT
doesn't work under rightscale images?
hmm - this used to work until recently:

% ec2-run-instances  -f payload.zip

but now when I log into my (rightscale provided OS) instance I see:

!!!       Your EC2 Instance has failed installation.             !!!
!!!       Please check /var/log/install for details.             !!!


Running boot RightScripts
Thu Feb 21 14:47:38 PST 2008
/opt/rightscale/bin/runrightscripts.rb:7:in `require': /var/spool/ec2/user-data.rb:9: Invalid char `\257' in expression (SyntaxError)
/var/spool/ec2/user-data.rb:9: Invalid char `\265' in expression
/var/spool/ec2/user-data.rb:9: Invalid char `\177' in expression

% file /var/spool/ec2/user-data.rb
/var/spool/ec2/user-data.rb: data
 Shiv Ramamurthi on February 21, 2008 10:53 PM GMT
Very interesting...
Article does a good job @ showing how generic AMIs can be and how much can be done @ runtime...exciting really.
 Gabriel Kent on January 23, 2008 9:41 PM GMT
 
 
 
 
 
 
 


Automate EC2 Instance Setup with user-data Scripts

http://alestic.com/2009/06/ec2-user-data-scripts

By Eric Hammond on June 1, 2009 3:15 AM | 10 Comments | 2 TrackBacks
user-data Scripts

The Ubuntu and Debian EC2 images published on http://alestic.com allow you to send in a startup script using the EC2 user-data parameter when you run a new instance. This functionality is useful for automating the installation and configuration of software on EC2 instances.

The basic rule followed by the image is:

If the instance user-data starts with the two characters #! then the instance runs it as the root user on the first boot.

The user-data script is run late in the startup process, so you can assume that networking and other system services are functional.

If you start an EC2 instance with any user-data which does not start with #! the image simply ignores it and allows your own software to access and use the data as it sees fit.

This same user-data startup script functionality has been copied in the Ubuntu images published by Canonical, and your existing user-data script should be portable across images with little change. Read a comparison of the Alestic and Canonical EC2 images.

Example

Here is a sample user-data script which sets up an Ubuntu LAMP server on a new EC2 instance:

#!/bin/bash
set -e -x
export DEBIAN_FRONTEND=noninteractive
apt-get update && apt-get upgrade -y
tasksel install lamp-server
echo "Please remember to set the MySQL root password!"
Save this to a file named, say, install-lamp and then pass it to a new EC2 instance, say, Ubuntu 9.04 Jaunty:

ec2-run-instances --key KEYPAIR --user-data-file install-lamp ami-bf5eb9d6
Please see http://alestic.com for the latest AMI ids for Ubuntu and Debian.

Note: This simplistic user-data script is for demonstration purposes only. Though it does set up a fully functional LAMP server which may be as good as some public LAMP AMIs, it does not take into account important design issues like database persistence. Read Running MySQL on Amazon EC2 with Elastic Block Store.

Debugging

Since you are passing code to the new EC2 instance, there is a very small chance that you may have made a mistake in writing the software. Well maybe not you, but somebody else out there might not be perfect, so I have to write this for them.

The stdout and stderr of your user-data script is output in /var/log/syslog and you can review this for any success and failure messages. It will contain both things you echo directly in the script as well as output from programs you run.

Tip: If you add set -x at the top of a bash script, then it will output every command executed. If you add set -e to the script, then the user-data script will exit on the first command which does not succeed. These help you quickly identify where problems might have started.

Limitations

Amazon EC2 limits the size of user-data to 16KB. If your startup instructions are larger than this limit, you can write a user-data script which downloads the full program(s) from somewhere else like S3 and runs them.

Though a shell is a handy tool for writing scripts to install and configure software, the user-data script can be written in any language which supports the shabang (#!) mechanism for running programs. This includes bash, Perl, Python, Ruby, tcl, awk, sed, vim, make, or any other language you can find pre-installed on the image.

If you want to use another language, a user-data script written in bash could install the language, install the program, and then run it.

Security

Setting up a new EC2 instance often requires installing private information like EC2 keys and certificates (e.g., to make AWS API calls). You should be aware that if you pass secrets in the user-data parameter, the complete input is available to any user or process running on the instance.

There is no way to change the instance user-data after instance startup, so anybody who has access to the instance can simply request http://169.254.169.254/latest/user-data

Depending on what software you install on your instance, even Internet users may be able to exploit holes to get at your user-data. For example, if your web server lets users specify a URL to upload a file, they might be able to enter the above URL and then read the contents.

Alternatives

Though user-data scripts are my favorite method to set up EC2 instances, its not always the appropriate approach. Alternatives include:

Manually ssh in to the instance and enter commands to install and configure software.

Automatically ssh in to the instance with automated commands to install and configure software.

Install and configure software using (1) or (2) and then rebundle the instance to create a new AMI. Use the new image when running instances.

Build your own EC2 images from scratch.

The ssh options have the benefit of not putting any private information into the user-data accessible from the instance. They have the disadvantage of needing to monitor new instances waiting for the ssh server to accept connections; this complicates the startup process compared to user-data scripts.

The rebundled AMI approach and building your own AMI approach are useful when the installation and configuration of your required software take a very long time or cant be done with automated processes (less common than you might think). A big drawback of creating your own AMIs is maintaining them, keeping up with security patches and other enhancements and fixes which might be applied by the base image maintainers.

Software

Note to AMI authors: If you wish to add to your EC2 images the same ability to run user-data scripts, feel free to include the following code and make it run on image startup:

http://ec2-run-user-data.notlong.com

http://support.rightscale.com/06-FAQs/FAQ_0102_-_What_is_the_EC2_User_Data_Field,_and_how_can_I_use_it%3F

FAQ 102 - What is the EC2 User Data Field, and how can I use it?


You need to understand how to use the EC2 User Data Field. 

Answer
RightScale automatically passes the following basic information into the user data field as a single string when launching an instance from the Dashboard:

RS_server=my.rightscale.com& RS_EIP=174.129.123.46& RS_api_url=https://my.rightscale.com/api/inst/ec2_instances/6ef2e6ef2e6ef2e6ef2e6ef2e& RS_sketchy=sketchy1-3.rightscale.com& RS_token=4ccd4ccd4ccd4ccd
 

In addition to what RightScale automatically passes to your instance at boot time, you also have the flexibility to pass more user data.  Although you can use the EC2 User Data Field to pass additional data to your instance, it's typically not recommended or commonly used since it's better to pass such data as input paramaters via RightScripts or Chef recipes.   However, if you are using an image that requires EC2 User Data or you want to use it for a specialized purpose, you can certainly do so within the Dashboard.

To pass additional user data to an EC2 instance, click the Edit button under an inactive Server's Info tab.  (You cannot pass EC2 User Data to a running instance.)  Under the "EC2 User Data" field, enter additional user data information.  Be sure to use ampersands (&) to delimit multiple values (i.e. must use 'http-get' format).    If you use commas (,) to delimit multiple values instead of using ampersands, an array of values will be seen as a long text string. 

Note: When viewing saved user data in the Dashboard, RightScale replaces any ampersands with commas to increase readability.

RightScale passes any specified user data to the instance during boot time.

There is a 16KB maximum limit on the total amount of specified user data (including the basic data RightScale automatically supplies). When you provide additional user data, it gets pre-pended to the data above. So if you provided user data in the Dashboard as:

MY_TEST=mycustomdatahere& MY_TEST2=more of my custom data here
When the instance is launched the user data field will look like the following:

MY_TEST=mycustomdatahere& MY_TEST2=more of my custom data here& RS_server=my.rightscale.com& RS_EIP=174.129.251.168& RS_api_url=https://my.rightscale.com/api/inst/ec2_instances/6ef2e6ef2e6ef2e6ef2e6ef2e& RS_sketchy=sketchy1-8.rightscale.com& RS_token=4ccd4ccd4ccd4ccd
RightScale will always be able to extract its own RightScale-specific data out as long as you don't use the RS_ in your data.

You can retrieve the data on an instance as follows:

curl 169.254.169.254

1.0
2007-01-19
2007-03-01
2007-08-29
2007-10-10
2007-12-15
2008-02-01 

This will give you a list of servers available metadata.  Then you can pick up the data using:

curl 169.254.169.254/2008-02-01/user-data





</entry>



<entry [Wed Nov 17 18:18:50 EST 2010] INSTALLED PERL 5.12.2 AND MOOSE ON aquarius-2-udata (YUCHING)>




-- MOOSE NEEDED FOR USING Net::Amazon::EC2 IN initAws.pl


1. DOWNLOAD PERL 5.12

cd /root/base/apps/perl
wget http://www.cpan.org/src/5.0/perl-5.12.2.tar.gz
make
make test
make install


2. INSTALLED MOOSE FOR PERL

perl -MCPAN -e shell
install Moose

    OK


3. INSTALLED AGUA DEPENDENCIES

SEE:
[
    Notes-projec22-agua.txt
    Wed Nov 17 19:44:39 EST 2010
    INSTALL AGUA PERL MODULES ON NEW PERL 5.12.2
]



NOTES
-----


HAD THE FOLLOWING PROBLEMS INSTALLING ON PERL 5.8.8


PROBLEM 1
---------

WHEN INSTALLING Test::Fatal DEPENDENCY FOR Moose

    Test requires module 'Acme::Unknown::Missing::Module::Name' but it's not found


SOLUTION

INSTALL Acme::Module

cd /root/base/apps/perl
wget http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Acme-Module-Authors-0.01.tar.gz
etc..
    OK


PROBLEM 1
---------

WHEN INSTALLING Package::DeprecationManager DEPENDENCY FOR Moose

    ExtUtils::MakeMaker version 6.31 required--this is only version 6.30 at Makefile.PL line 7.

WHEN INSTALLING Test::Requires DEPENDENCY FOR Moose

    Warning: prerequisite ExtUtils::MakeMaker 6.42 not found. We have 6.30.

SOLUTION

UPDATE ExtUtils::MakeMaker VERSION


cd /root/base/apps/perl
wget http://search.cpan.org/CPAN/authors/id/M/MS/MSCHWERN/ExtUtils-MakeMaker-6.56.tar.gz





</entry>



<entry [Sun Nov 14 22:44:10 EST 2010] NON-INTERACTIVE CERTIFICATE GENERATION FOR AUTOMATED HTTPS>




1. CREATE CONFIG FILE FOR NON-INTERACTIVE CERTIFICATE GENERATION

INSTANCE_ID=`curl -s http://169.254.169.254/latest/meta-data/instance-id`
echo "DOMAIN_NAME=ec2-describe-instances | grep $INSTANCE_ID | cut -f 4"
DOMAIN_NAME=`ec2-describe-instances | grep $INSTANCE_ID | cut -f 4`
echo "DOMAIN_NAME: $DOMAIN_NAME"


    DOMAIN_NAME: ec2-50-16-90-172.compute-1.amazonaws.com



EMAIL=trash@mytrash.com


cd /root/base/apps/https
emacs config.txt
# SSL server cert/key parms
# Cert extensions
subjectKeyIdentifier    = hash
authorityKeyIdentifier  = keyid:always,issuer:always
basicConstraints        = CA:false
nsCertType              = server
# openssl req
[req]
default_bits            = 1024
prompt                  = no
distinguished_name      = UMCP_SSLS_DN
# DN fields for SSL Server cert
[UMCP_SSLS_DN]
C                       = US
ST                      = Maryland
O                       = UMCP/OIT/TSS/EIS
CN                      = ec2-50-16-90-172.compute-1.amazonaws.com
emailAddress            = trash@traash.com






2. CREATE RANDOM SEED

RANDFILE=/root/base/apps/https/randfile.txt
(date;df) > $RANDFILE
export RANDFILE




3. GENERATE PRIVATE KEY

PRIVATE_KEYFILE=/root/base/apps/https/privatekey.pem
PIPELINE_FILE=/root/base/apps/https/pipeline.pem
SIGNNAME="Key B"
SIGNKEY=keyb.pem
SIGNCERT=certb.pem
CERTIFICATE_FILE=/root/base/apps/https/publiccert.pem
CONFIGFILE=/root/base/apps/https/config.txt


cd /root/base/apps/https
##openssl genrsa -des3 -out server.key 1024 

openssl genrsa -out privatekey.pem 1024


echo "openssl req -config $CONFIGFILE -newkey rsa -keyout "$PRIVATE_KEYFILE" -out $PIPELINE_FILE"

openssl req -config "$CONFIGFILE" -newkey rsa -keyout "$PRIVATE_KEYFILE" -out "$PIPELINE_FILE"


echo ""
echo "Next passphrase is to access $SIGNNAME for signing"
echo ""

echo "openssl x509 -req -extfile $CONFIGFILE -CA $SIGNCERT -CAkey $SIGNKEY -days 730 -in privatekey.pem -out $CERTIFICATE_FILE"

openssl x509 -req -extfile $CONFIGFILE -CA $SIGNCERT -CAkey $SIGNKEY -days 730 -in privatekey.pem -out $CERTIFICATE_FILE


openssl x509 -req -extfile $CONFIGFILE -CA "$SIGNCERT" -CAkey "$SIGNKEY" \
        -days 730 -in "$PIPEFILE" -out "$CERTIFICATE_FILE" 



###(date;df)>$RANDFILE
###
###echo "SSL Server key will be written to $CERTKEYF"
###echo "SSL Server Certificate will be written to $CERTFILE"
###echo "First passphrase is to protect key for $CERTHOST"
###echo ""
###
###openssl req -config $CONFFILE -newkey rsa -keyout "$CERTKEYF" -out $PIPEFILE
###
###echo ""
###echo "Next passphrase is to access $SIGNNAME for signing"
###echo ""
###
###openssl x509 -req -extfile $CONFFILE -CA "$SIGNCERT" -CAkey "$SIGNKEY" \
###        -days 730 -in "$PIPEFILE" -out "$CERTFILE" 







echo "SSL Server key will be written to $CERTKEYF"
echo "SSL Server Certificate will be written to $CERTFILE"


GET CERTIFICATE

cd /root/base/apps/https
openssl req -new -key privatekey.pem -out server.csr




openssl req -config /root/base/apps/https/config.txt \
-newkey rsa \
-keyout publickey.pem \
-key /root/base/apps/https/privatekey.pem \
publickey.pem






SIGNNAME="Key B"
SIGNKEY=keyb.pem
SIGNCERT=certb.pem
CONFIGFILE=/root/base/apps/https/config.txt

openssl x509 -req \
-extfile $CONFIGFILE \
-CA "$SIGNCERT" \
-CAkey "$SIGNKEY" \
-days 730 -in "$PIPEFILE" -out "$CERTFILE" 

rm -f $CONFIGFILE $RANDFILE $PIPEFILE




NOTES
-----

USE -config ARGUMENT AND GENERATE PRIVATE KEY WITHOUT PASSWORD

openssl genrsa -out key.pem 1024

http://developer.apple.com/library/mac/#documentation/Darwin/Reference/ManPages/man1/req.1ssl.html

    


http://www.mail-archive.com/openssl-users@openssl.org/msg29015.html

I've done some sh scripts that do programatic input to req.  The full
text of the script is appended at the bottom, but the basic trick is
to use a conf file with prompt=no and then use $ substitution to put
the right things in.  Like this:

...
# openssl req
[req]
prompt                  = no
distinguished_name      = UMCP_SSLS_DN
# DN fields for SSL Server cert
[UMCP_SSLS_DN]
C                       = US
ST                      = Maryland
O                       = UMCP/OIT/TSS/EIS
CN                      = $CERTHOST
emailAddress            = $CERTMAIL

Note how environment variables CERTHOST and CERTMAIL from the
script are edited into the information put into the request.




Hope this helps, the following is a conversational script that
asks for the info and then does the non-interactive req that
you want to do:

#! /bin/sh

# Conversational version of makec: make SSL server certificate

# The higher-level certificate to sign the certificate with.
# Note: SIGNNAME is only used in echo to the user.

SIGNNAME="Key B"
SIGNKEY=keyb.pem
SIGNCERT=certb.pem

# CERTHOST - host name the cert is for    foombar.umd.edu
# CERTMAIL - email address for the cert   [EMAIL PROTECTED]
# CERTFILE - filename cert written to     foombar.umd.edu-cert.pem
# CERTKEYF - f/n private key written to   foombar.umd.edu-enckey.pem
# UNIQNAME - unique name for scratch file
# CONFFILE - OpenSSL config file we create
# RANDFILE - OpenSSL random file we create
# PIPEFILE - file to pipe from "req" to "x509"

case "$#" in

0) # No arguments - ask for host name and email
echo ""
echo "This script generates certificates for SSL servers."
echo ""
while true; do
 /usr/ucb/echo -n "Internet domain and host name of the server (or ?): "
 if read CERTHOST; then
  case "$CERTHOST" in
   "?"|"")
    echo ""
    echo "You are being asked for the internet host and domain name"
    echo "for which the SSL server certificate is being generated."
    echo "Like  foombar.umd.edu   or something similar."
    echo "";;
   *)
    CERTHOST=`echo "$CERTHOST" | tr A-Z a-z`
    if echo "$CERTHOST" | awk -F'.' '(2>NF){exit 1}
      {for(i=1;i<=NF;i++)if($i!~/^[0-9a-z][0-9a-z-]*[0-9a-z]$/)exit 1}'
    then
     break;
    else
     echo "Golly, \"$CERTHOST\" doesn't look like an internet host name."
     echo "Enter ? for more information."
    fi
  esac
 else
  echo ""
  echo "`basename $0`: Interaction terminated by end of file"; exit 1
 fi
done
while true; do
 /usr/ucb/echo -n "EMAIL address to be included in the certificate (or ?): "
 if read CERTMAIL; then
  case "$CERTMAIL" in
   "?"|"")
    echo ""
    echo "You are being asked for the email address to be included in"
    echo "the SSL certificate that is being generated.  This will be"
    echo "like  [EMAIL PROTECTED]  or something similar."
    echo "";;
   *)
    CERTMAIL=`echo "$CERTMAIL" | tr A-Z a-z`  # mistake to lowercase???
    if echo "$CERTMAIL" | awk -F'@' '(2!=NF){exit 1}{
      n=split($1,a,".")
      for(i=1;i<=n;i++)if(a[i]!~/^[0-9a-z][0-9a-z-]*[0-9a-z]$/)exit 1
      n=split($2,a,".");if(2>n)exit 1
      for(i=1;i<=n;i++)if(a[i]!~/^[0-9a-z][0-9a-z-]*[0-9a-z]$/)exit 1}'
    then
     break
    else
     echo "Golly, $CERTMAIL doesn't look like an email address."
     echo "Enter ? for more information."
    fi
  esac
 else
  echo ""
  echo "`basename $0`: Interaction terminated by end of file"; exit 1
 fi
done;;

2)   # Two arguments, interpret as host and email
CERTHOST=`echo "$1" | tr A-Z a-z`
if echo "$CERTHOST" | awk -F'.' '(2>NF){exit 1}
  {for(i=1;i<=NF;i++)if($i!~/^[0-9a-z][0-9a-z-]*[0-9a-z]$/)exit 1}'
then :; else
 echo "`basename $0`: bad host name $CERTHOST"
 exit 1
fi
CERTMAIL=`echo "$2" | tr A-Z a-z`
if echo "$CERTMAIL" | awk -F'@' '(2!=NF){exit 1}{
  n=split($1,a,".")
  for(i=1;i<=n;i++)if(a[i]!~/^[0-9a-z][0-9a-z-]*[0-9a-z]$/)exit 1
  n=split($2,a,".");if(2>n)exit 1
  for(i=1;i<=n;i++)if(a[i]!~/^[0-9a-z][0-9a-z-]*[0-9a-z]$/)exit 1}'
then :; else
  echo "`basename $0`: bad email address $CERTMAIL"
  exit 1
fi ;;

*)  # Any other case is invalid
echo ""
echo "Usage: `basename $0` <hostname> <email>"
echo ""
exit 1;;
esac

# ask for confirmation

while true; do
 echo "The host name for the certificate is: $CERTHOST"
 echo "The email address for the certificate is: $CERTMAIL"
 /usr/ucb/echo -n "Is this correct? (yn?): "
 if read resp; then
  resp=`echo "$resp" | tr A-Z a-z`
  case "$resp" in
   y|ye|yes) break;;
   n|no)echo "`basename $0`: Giving up for now."; exit 1;;
   "?"|h|he|hel|help)
     echo ""
     echo "The hostname for the certificate is the hostname for the SSL"
     echo "server machine that the certificate is destined to protect,"
     echo "and should be given in fully qualifed internet domain name form"
     echo "(with dots). Like  foombar.umd.edu  or similar."
     echo ""
     echo "The email address is embedded in the certificate to give"
     echo "relying parties a point of contact."
     echo ""
     echo "You are being asked to choose Yes or No."
     echo "This script will not proceed until you do so."
     echo "If you choose No, this script will exit"
     echo "without generating a certificate."
     echo "";;
   *) echo "You must choose Yes or No (? for help)";;
  esac
 else
  echo "`basename $0`: interaction terminated by end of file"; exit 1
 fi
done

# Check for overwriting files

CERTFILE="$CERTHOST-cert.pem"
if /bin/test -e $CERTFILE; then
 while true; do
  /usr/ucb/echo -n "$CERTFILE already exists -- overwrite it? (yn?) "
  if read resp; then
   resp=`echo "$resp" | tr A-Z a-z`
   case "$resp" in
    y|ye|yes)
     if rm "$CERTFILE"; then
      break
     else
      echo "`basename $0`: could not rm $CERTFILE -- giving up."; exit 1
     fi;;
    n|no) echo "`basename $0`: Giving up for now."; exit 1;;
    "?"|h|he|hel|help)
     echo ""
     echo "The filename into which the certificate is to be written:"
     echo "  $CERTFILE"
     echo "already exists.  This script can either overwrite this file"
     echo "or exit without creating the certificate."
     echo "";;
    *) echo "You must choose Yes or No (? for help)";;
   esac
  else
   echo "`basename $0`: interaction terminated by end of file"; exit 1
  fi
 done
fi
CERTKEYF="$CERTHOST-enckey.pem"
if /bin/test -e $CERTKEYF; then
 while true; do
  /usr/ucb/echo -n "$CERTKEYF already exists -- overwrite it? (yn?) "
  if read resp; then
   resp=`echo "$resp" | tr A-Z a-z`
   case "$resp" in
    y|ye|yes)
     if rm "$CERTKEYF"; then
      break
     else
      echo "`basename $0`: could not rm $CERTKEYF -- giving up."; exit 1
    fi;;
    n|no) echo "`basename $0`: Giving up for now."; exit 1;;
    "?"|h||he|hel|help)
     echo ""
     echo "The filename into which the private key is to be written:"
     echo "  $CERTKEYF"
     echo "already exists.  This script can either overwrite this file"
     echo "or exit without creating the certificate."
     echo "";;
    *) echo "You must choose Yes or No (? for help)";;
   esac
  else
   echo "`basename $0`: interaction terminated by end of file"; exit 1
  fi
 done
fi

# OK finally generate the certificate (code from makec)
# Export the variables called in from the OpenSSL config file we make

export CERTHOST 
export CERTMAIL

UNIQNAME=`basename $0`.`uname -n`.$$
# echo "$UNIQNAME"
CONFFILE=.conf.$UNIQNAME
RANDFILE=.rand.$UNIQNAME
PIPEFILE=.pipe.$UNIQNAME
export RANDFILE

trap 'rm -f $CERTFILE $CERTKEYF $CONFFILE $RANDFILE $PIPEFILE' 1 2 15

cat <<@eof >$CONFFILE
# SSL server cert/key parms
# Cert extensions
subjectKeyIdentifier    = hash
authorityKeyIdentifier  = keyid:always,issuer:always
basicConstraints        = CA:false
nsCertType              = server
# openssl req
[req]
default_bits            = 1024
prompt                  = no
distinguished_name      = UMCP_SSLS_DN
# DN fields for SSL Server cert
[UMCP_SSLS_DN]
C                       = US
ST                      = Maryland
O                       = UMCP/OIT/TSS/EIS
CN                      = $CERTHOST
emailAddress            = $CERTMAIL
@eof

(date;df)>$RANDFILE

echo "SSL Server key will be written to $CERTKEYF"
echo "SSL Server Certificate will be written to $CERTFILE"
echo "First passphrase is to protect key for $CERTHOST"
echo ""

openssl req -config $CONFFILE -newkey rsa -keyout "$CERTKEYF" -out $PIPEFILE

echo ""
echo "Next passphrase is to access $SIGNNAME for signing"
echo ""

openssl x509 -req -extfile $CONFFILE -CA "$\" -CAkey "$SIGNKEY" \
        -days 730 -in "$PIPEFILE" -out "$CERTFILE" 

rm -f $CONFFILE $RANDFILE $PIPEFILE

# End of cmake

====





2. GENERATE CSR (Certificate Signing Request)

USE COMMON NAME: ec2-50-16-41-25.compute-1.amazonaws.com


openssl req -batch \
-new \
-key server.key \
-out server.csr


	Country Name (2 letter code) [GB]:US
	State or Province Name (full name) [Berkshire]:Florida
	Locality Name (eg, city) [Newbury]:Miami
	Organization Name (eg, company) [My Company Ltd]:Stuart Young
	Organizational Unit Name (eg, section) []:
	Common Name (eg, your name or your server's hostname) []:ec2-50-16-41-25.compute-1.amazonaws.com



 openssl req -h
unknown option -h
req [options] <infile >outfile
where options  are
 -inform arg    input format - DER or PEM
 -outform arg   output format - DER or PEM
 -in arg        input file
 -out arg       output file
 -text          text form of request
 -pubkey        output public key
 -noout         do not output REQ
 -verify        verify signature on REQ
 -modulus       RSA modulus
 -nodes         don't encrypt the output key
 -engine e      use engine e, possibly a hardware device
 -subject       output the request's subject
 -passin        private key password source
 -key file      use the private key contained in file
 -keyform arg   key file format
 -keyout arg    file to send the key to
 -rand file:file:...
                load the file (or the files in the directory) into
                the random number generator
 -newkey rsa:bits generate a new RSA key of 'bits' in size
 -newkey dsa:file generate a new DSA key, parameters taken from CA in 'file'
 -[digest]      Digest to sign with (md5, sha1, md2, mdc2, md4)
 -config file   request template file.
 -subj arg      set or modify request subject
 -multivalue-rdn enable support for multivalued RDNs
 -new           new request.
 -batch         do not ask anything during request generation
 -x509          output a x509 structure instead of a cert. req.
 -days          number of days a certificate generated by -x509 is valid for.
 -set_serial    serial number to use for a certificate generated by -x509.
 -newhdr        output "NEW" in the header lines
 -asn1-kludge   Output the 'request' in a format that is wrong but some CA's
                have been reported as requiring
 -extensions .. specify certificate extension section (override value in config file)
 -reqexts ..    specify request extension section (override value in config file)
 -utf8          input characters are UTF8 (default ASCII)
 -nameopt arg    - various certificate name options
 -reqopt arg    - various request text options







</entry>



<entry [Mon Nov 15 01:10:22 EST 2010] AGUA FIRST LAUNCH - AUTOMATICALLY GENERATE https KEY AND PROMPT USER TO INPUT KEYS>




AUTOMATICALLY GENERATE https KEY
--------------------------------

SEE ABOVE.



THREE DATA GROUPS:

1. /agua (AMI 10GB)

    AGUA SOFTWARE
    
    latest agua scripts
    latest agua mysql
    

2. /external (SNAPSHOT-BASED EBS VOLUME 20GB)
    (SNAPSHOT ID CORRESPONDS TO agua VERSION)
    
    1. AGUA DATA & APPS
    reference genomes
    external applications
    jbrowse data

    2. MYSQL DIRECTORY
    /data/mysql


3. /projects (CREATED EBS VOLUME 10GB - 1TB)

    1. USER DATA DIVIDED INTO INDIVIDUAL USER SUB-FOLDERS
    
    /projects/users/user1
    /projects/users/user2





    OWNERSHIP AND JOB LAUNCH PERMISSIONS CAN BE MIXED:

    1. USER FOLDERS ARE OWNED BY AGUA AND USE EBS SPACE OWNED BY THE 'ADMIN' USER WHO
    
    LAUNCHED THE AMI. USERS LAUNCH SGE CLUSTERS USING THE 'ADMIN' USER'S IDENTITY.
    
    
    2. AND/OR, USERS CAN PROVIDE THEIR OWN AWS CREDENTIALS TO:
    
        1. ATTACH THEIR OWN EBS SPACE TO THEIR ACCOUNT INSIDE AGUA
    
        2. LAUNCH THEIR OWN SGE CLUSTERS TO RUN JOBS
        


    TO ACCOMPLISH THE FIRST MODEL OF OWNERSHIP AND LAUNCH PERMISSIONS:


        1. ADMIN USER CONNECTS VIA HTTPS TO AGUA AFTER LAUNCHING THE AMI
        
        2. ADMIN USER PROVIDES PUBLIC AND PRIVATE KEYS
        
        3. INPUT VOLUME NAME IF WANT TO USE EXISTING EBS VOLUME FOR /projects

        4. USER SPECIFIES VOLUME SIZE (UP TO 1 TB)

        5. IF NO VOLUME NAME SUPPLIED, NEW VOLUME IS CREATED AND MYSQL IS
        
            COPIED OVER AND INITIALISED.
        
            OTHERWISE, ATTACH EXISTING VOLUME AND LINK MYSQL 
            
        
        
        
AQUARIUS    2

ec2-describe-instances

    RESERVATION     r-a5da67cf      983300124420    default
    INSTANCE        i-5e7ee833      ami-3a4fbb53                    stopped agua    0               t1.micro        2010-11-13T03:40:41+0000    us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled                                ebs
    BLOCKDEVICE     /dev/sda1       vol-8de604e5    2010-11-11T05:16:27.000Z
    BLOCKDEVICE     /dev/sdf        vol-37648b5f    2010-11-14T06:46:01.000Z


    RESERVATION     r-5f19a335      983300124420    default
    INSTANCE        i-342cb459      ami-de2ed9b7    ec2-184-73-113-57.compute-1.amazonaws.com       ip-10-204-51-241.ec2.internal       running agua    0               t1.micro        2010-11-14T15:07:44+0000        us-east-1a      aki-b51cf9dc    ari-b31cf9da                monitoring-disabled     184.73.113.57   10.204.51.241                   ebs
    BLOCKDEVICE     /dev/sda1       vol-e3816f8b    2010-11-14T15:07:54.000Z
    BLOCKDEVICE     /dev/sdf        vol-4948a121    2010-11-16T02:38:40.000Z



AQUARIUS    1   Autoload sequence (called in /etc/rc.d/rc.local):
                    -   AMI contains applications and mysql installation with 'agua' database


STUART AQUARIUS 2:
ec2-50-16-12-114.compute-1.amazonaws.com 


STUART AQUARIUS 1 NEW IP
ec2-50-16-59-62.compute-1.amazonaws.com 


YUCHING AQUARIUS 1 NEW IP
ec2-50-16-90-172.compute-1.amazonaws.com


1. ADD ACCESS PERMISSION TO SNAPSHOT FOR USER

YUCHING
983300124420

agua KEYPAIR FINGERPRINT
73:ef:e5:3b:eb:fe:c5:61:9f:5b:e8:57:04:c1:82:23:4b:93:23:e0


2. REMOVE ANY PREVIOUSLY ATTACHED VOLUMES AT /dev/sdg

ec2-detach-volume vol-6c752005
    ATTACHMENT      vol-6c752005    i-0caa7261      /dev/sdg        detaching       2010-10-27T03:52:18+0000



3. RUN MOUNT SCRIPT


STUART
------

rm -fr /root/.aws/aws.sh 
emacs /root/.aws/aws.sh 
#!/bin/bash

export AMAZON_USER_ID=728213020069
export EC2_PRIVATE_KEY=/root/base/apps/ec2/keypair/pk-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem
export EC2_CERT=/root/base/apps/ec2/keypair/cert-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem
export AWS_ACCESS_KEY_ID=AKIAIZXZ6S7ARZ44TTHQ
export AWS_SECRET_ACCESS_KEY=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
export EC2_AMITOOL_HOME=/home/ec2
export EC2_APITOOL_HOME=/home/ec2
export EC2_HOME=/home/ec2
export JAVA_HOME=/usr
PATH=$EC2_AMITOOL_HOME/bin:$PATH


YUCHING
-------

rm -fr /root/.aws/aws.sh 
emacs /root/.aws/aws.sh 
#!/bin/bash

export AMAZON_USER_ID=983300124420
export EC2_PRIVATE_KEY=/root/base/apps/ec2/keypair/pk-NM4PJIJUL2MENBRRP5JBQUNGEZG7G3HR.pem
export EC2_CERT=/root/base/apps/ec2/keypair/cert-NM4PJIJUL2MENBRRP5JBQUNGEZG7G3HR.pem 
export AWS_ACCESS_KEY_ID=AKIAI6A6W55JJGZAUZJQ
export AWS_SECRET_ACCESS_KEY=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
export EC2_AMITOOL_HOME=/home/ec2
export EC2_APITOOL_HOME=/home/ec2
export EC2_HOME=/home/ec2
export JAVA_HOME=/usr
PATH=$EC2_AMITOOL_HOME/bin:$PATH




chmod 755 /root/.aws/aws.sh




rm -fr /root/.aws/mount-agua.sh
emacs /root/.aws/mount-agua.sh
#!/bin/bash

#### START LOG
exec &> /var/log/agua.log 2>&1

#### VARIABLES
DATADIR=/data2
VOLUME=""
SNAPSHOT=snap-55fe4a3f
SIZE=40
DEVICE=/dev/sdf

# Call the environment setup script
. ~/.aws/aws.sh

# Get basic info from instance meta-data
INSTANCE_ID=`curl -s http://169.254.169.254/latest/meta-data/instance-id`
AVAILABILITY_ZONE=`curl -s \
http://169.254.169.254/latest/meta-data/placement/availability-zone`
echo "INSTANCE_ID: $INSTANCE_ID"
echo "AVAILABILITY_ZONE: $AVAILABILITY_ZONE"

####   Start httpd (allows reporting of errors in later steps)
echo "Starting httpd"
/etc/init.d/httpd restart

####   If not exists, create 'data' EBS volume (max 1 TB, add 
####   manually later) in user's own account

####   Mount 'data' EBS volume at /data
####   If not exists /data/mysql:
if ! [ -d $DATADIR ]; then

    echo "DATADIR $DATADIR not found"

    echo "Creating volume"
    while [[ "$VOLUME" == ""  ]];
    do
        echo "ec2-create-volume --snapshot $SNAPSHOT -s $SIZE -z $AVAILABILITY_ZONE"
    
        VOLUME=`ec2-create-volume --snapshot $SNAPSHOT -s $SIZE -z $AVAILABILITY_ZONE\
        | grep VOLUME | cut -f2`
    done
    
    #VOLUME=vol-a519f5cd
    echo "VOLUME" : $VOLUME
    
    #### Attach the volume
    echo "Attaching volume: $VOLUME"
    
    echo "ec2-attach-volume $VOLUME -K $EC2_PRIVATE_KEY -C $EC2_CERT -i $INSTANCE_ID -d $DEVICE"
    
    ec2-attach-volume "$VOLUME" -K "$EC2_PRIVATE_KEY" -C "$EC2_CERT" -i "$INSTANCE_ID" -d "$DEVICE"
    
    while [[ "$VOLUME_STATUS" != "attached"  ]];
    do
        echo "ec2-describe-volumes  --verbose -K $EC2_PRIVATE_KEY -C $EC2_CERT $VOLUME | grep ATTACHMENT | cut -f5"
        VOLUME_STATUS=`ec2-describe-volumes  --verbose -K "$EC2_PRIVATE_KEY" -C "$EC2_CERT" "$VOLUME"\
        | grep ATTACHMENT | cut -f5`
        echo Status of "$VOLUME" : $VOLUME_STATUS
    done
    
    #### MOUNT DEVICE
    echo "mkdir $DATADIR"
    mkdir $DATADIR
    echo "mount $DEVICE $DATADIR"
    mount $DEVICE $DATADIR

    #### ADD TO /etc/fstab SO VOLUME DEVICE IS MOUNTED AUTOMATICALLY AFTER REBOOT
    echo "$DEVICE   $DATADIR      ext3    defaults        0 0" | tee -a /etc/fstab

    #### START MYSQL FROM AGUA INSTALLATION IN DATADIR
    echo "Loading empty 'agua' database into $DATADIR/mysql"

    #### STOP MYSQL
    /etc/init.d/mysqld stop

    # CREATE BINDINGS TO LINK TO MYSQL ON EBS VOLUME
    ####   'apps' table is already populated
    ####   'admin' user password is set to default 'open4admin'
    ####   Mysql root password is set to default 'open4root'
    
    # USE bind AND mount TO MIRROR NEW LOCATIONS IN OLD FOLDERS
    # Point MySQL to the correct database files on the EBS volume using mount bind.

    # Mount in /etc/mysql
    echo "$DATADIR/mysql/etc/mysql /etc/mysql     none bind" | tee -a /etc/fstab
    mkdir /etc/mysql
    mount /etc/mysql
    
    # Mount in /var/lib
    echo "$DATADIR/mysql/lib/mysql /var/lib/mysql none bind" | tee -a /etc/fstab
    mkdir /var/lib/mysql
    mount /var/lib/mysql
    
    # Mount in /var/log
    echo "$DATADIR/mysql/log/mysql /var/log/mysql none bind" | tee -a /etc/fstab
    mkdir /var/log/mysql
    mount /var/log/mysql
    
    #### START MYSQL FROM $DATADIR/mysql
    /etc/init.d/mysqld start
    
fi;



#### CHANGE PERMISSIONS
chmod 755 mount-data.sh




OUTPUT:

time ./mount2.sh 

    INSTANCE_ID: i-5e7ee833
    AVAILABILITY_ZONE: us-east-1a
    DATADIR /data2 not found
    Creating volume
    ec2-create-volume --snapshot snap-55fe4a3f -s 40 -z us-east-1a
    VOLUME : vol-ab6a85c3
    Attaching volume: vol-ab6a85c3
    ec2-attach-volume vol-ab6a85c3 -K /root/base/apps/ec2/keypair/pk-NM4PJIJUL2MENBRRP5JBQUNGEZG7G3HR.pem -C /root/base/apps/ec2/keypair/cert-NM4PJIJUL2MENBRRP5JBQUNGEZG7G3HR.pem -i i-5e7ee833 -d /dev/sde
    ATTACHMENT      vol-ab6a85c3    i-5e7ee833      /dev/sde        attaching       2010-11-14T06:16:05+0000
    ec2-describe-volumes  --verbose -K /root/base/apps/ec2/keypair/pk-NM4PJIJUL2MENBRRP5JBQUNGEZG7G3HR.pem -C /root/base/apps/ec2/keypair/cert-NM4PJIJUL2MENBRRP5JBQUNGEZG7G3HR.pem vol-ab6a85c3 | grep ATTACHMENT | cut -f5
    Status of vol-ab6a85c3 : attached
    mkdir /data2
    mount /dev/sde /data2
    /dev/sde   /data2      ext3    defaults        0 0
    Loading empty 'agua' database into /data2/mysql
    Stopping MySQL:  [  OK  ]
    /data2/mysql/etc/mysql /etc/mysql     none bind
    mkdir: cannot create directory `/etc/mysql': File exists
    /data2/mysql/lib/mysql /var/lib/mysql none bind
    mkdir: cannot create directory `/var/lib/mysql': File exists
    /data2/mysql/log/mysql /var/log/mysql none bind
    mkdir: cannot create directory `/var/log/mysql': File exists
    Starting MySQL:  [  OK  ]

[root@ip-10-195-79-45 .aws]# ll /data2

    drwxr-xr-x  3 root root 4.0K Oct 10 23:49 agua
    drwxr-xr-x 53 root root 4.0K Oct 14 03:48 apps
    drwxr-xr-x  3 root root 4.0K Oct 11 01:50 base
    drwxr-xr-x  2 root root 4.0K Oct 18 19:56 img-mnt
    drwx------  2 root root  16K Oct 10 23:43 lost+found
    drwxr-xr-x  5 root root 4.0K Oct 11 01:07 mysql
    drwxr-xr-x  2 root root 4.0K Oct 11 02:44 starcluster



real    0m59.814s
user    0m14.704s
sys     0m0.118s


ec2-describe-instances

    RESERVATION     r-a5da67cf      983300124420    default
    INSTANCE        i-5e7ee833      ami-3a4fbb53    ec2-50-16-90-172.compute-1.amazonaws.com        ip-10-195-79-45.ec2.internal        running agua    0               t1.micro        2010-11-13T03:40:41+0000        us-east-1a      aki-b51cf9dc        ari-b31cf9da            monitoring-disabled     50.16.90.172    10.195.79.45                    ebs
    BLOCKDEVICE     /dev/sda1       vol-8de604e5    2010-11-11T05:16:27.000Z
    BLOCKDEVICE     /dev/sdf        vol-37648b5f    2010-11-14T06:46:01.000Z
    
    RESERVATION     r-5f19a335      983300124420    default
    INSTANCE        i-342cb459      ami-de2ed9b7    ec2-184-73-113-57.compute-1.amazonaws.com       ip-10-204-51-241.ec2.internal       running agua    0               t1.micro        2010-11-14T15:07:44+0000        us-east-1a      aki-b51cf9dc        ari-b31cf9da            monitoring-disabled     184.73.113.57   10.204.51.241                   ebs
    BLOCKDEVICE     /dev/sda1       vol-e3816f8b    2010-11-14T15:07:54.000Z


DEVICE=/dev/sdf
INSTANCE_ID=`curl -s http://169.254.169.254/latest/meta-data/instance-id`
echo "DEVICE: $DEVICE"
echo "INSTANCE_ID: $INSTANCE_ID"
echo "EXISTING=ec2-describe-volumes  | grep $INSTANCE_ID | grep $DEVICE | cut -f 2"
EXISTING=`ec2-describe-volumes  | grep $INSTANCE_ID | grep $DEVICE | cut -f 2`
echo "EXISTING VOLUME: $EXISTING"

if [[ "$EXISTING_VOLUME" != ""  ]]; then

    echo "ec2-detach-volume --force -i $INSTANCE_ID -d $DEVICE"
    DETACH_RESULT=`ec2-detach-volume --force -i $INSTANCE_ID -d $DEVICE`
    echo "DETACH_RESULT: $DETACH_RESULT"
    DELETE_RESULT=`ec2-delete-volume $EXISTING_VOLUME
    echo "DELETE_RESULT: $DELETE_RESULT"
    
fi


    DEVICE: /dev/sdf
    INSTANCE_ID: i-5e7ee833
    EXISTING=ec2-describe-volumes  | grep i-5e7ee833 | grep /dev/sdf | cut -f 2
    EXISTING: vol-37648b5f

ec2-describe-volumes

    VOLUME  vol-8de604e5    10      snap-57fe4a3d   us-east-1a      in-use  2010-11-11T05:16:26+0000
    ATTACHMENT      vol-8de604e5    i-5e7ee833      /dev/sda1       attached        2010-11-13T03:40:51+0000
    VOLUME  vol-37648b5f    40      snap-55fe4a3f   us-east-1a      in-use  2010-11-14T06:45:55+0000
    ATTACHMENT      vol-37648b5f    i-5e7ee833      /dev/sdf        attached        2010-11-14T06:46:01+0000
    
    VOLUME  vol-e3816f8b    10      snap-79157c13   us-east-1a      in-use  2010-11-14T15:07:53+0000
    ATTACHMENT      vol-e3816f8b    i-342cb459      /dev/sda1       attached        2010-11-14T15:07:56+0000



#### ADD TO rc.local 
######################


rm -fr /etc/rc.d/rc.local
emacs /etc/rc.d/rc.local
#!/bin/sh
#
# This script will be executed *after* all the other init scripts.
# You can put your own initialization stuff in here if you don't
# want to do the full Sys V style init stuff.

touch /var/lock/subsys/local


exec &> /var/log/startup.log 2>&1
echo "**** Starting script"
date

#### LOAD AWS ENVIRONMENTAL VARIABLES
. /root/.aws/aws.sh

#### MOUNT AGUA DATA & MYSQL
/root/.aws/mount-agua.sh


 
 
KEY LOCATION ON INSTANCE:

cat /home/ec2/etc/ec2/amitools/cert-ec2.pem

    -----BEGIN CERTIFICATE-----
    MIIDzjCCAzegAwIBAgIJALDnZV+lpZdSMA0GCSqGSIb3DQEBBQUAMIGhMQswCQYD
    VQQGEwJaQTEVMBMGA1UECBMMV2VzdGVybiBDYXBlMRIwEAYDVQQHEwlDYXBlIFRv
    d24xJzAlBgNVBAoTHkFtYXpvbiBEZXZlbG9wbWVudCBDZW50cmUgKFNBKTEMMAoG
    A1UECxMDQUVTMREwDwYDVQQDEwhBRVMgVGVzdDEdMBsGCSqGSIb3DQEJARYOYWVz
    QGFtYXpvbi5jb20wHhcNMDUwODA5MTYwMTA5WhcNMDYwODA5MTYwMTA5WjCBoTEL
    MAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rlcm4gQ2FwZTESMBAGA1UEBxMJQ2Fw
    ZSBUb3duMScwJQYDVQQKEx5BbWF6b24gRGV2ZWxvcG1lbnQgQ2VudHJlIChTQSkx
    DDAKBgNVBAsTA0FFUzERMA8GA1UEAxMIQUVTIFRlc3QxHTAbBgkqhkiG9w0BCQEW
    DmFlc0BhbWF6b24uY29tMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC8v/X5
    zZv8CAVfNmvBM0br/RUcf1wU8xC5d2otFQQsQKB3qiWoj3oHeOWskOlTPFVZ8N+/
    hEaMjyOUkg2+g6XEagCQtFCEBzUVoMjiQIBPiWj5CWkFtlav2zt33LZ0ErTND4xl
    j7FQFqbaytHU9xuQcFO2p12bdITiBs5Kwoi9bQIDAQABo4IBCjCCAQYwHQYDVR0O
    BBYEFPQnsX1kDVzPtX+38ACV8RhoYcw8MIHWBgNVHSMEgc4wgcuAFPQnsX1kDVzP
    tX+38ACV8RhoYcw8oYGnpIGkMIGhMQswCQYDVQQGEwJaQTEVMBMGA1UECBMMV2Vz
    dGVybiBDYXBlMRIwEAYDVQQHEwlDYXBlIFRvd24xJzAlBgNVBAoTHkFtYXpvbiBE
    ZXZlbG9wbWVudCBDZW50cmUgKFNBKTEMMAoGA1UECxMDQUVTMREwDwYDVQQDEwhB
    RVMgVGVzdDEdMBsGCSqGSIb3DQEJARYOYWVzQGFtYXpvbi5jb22CCQCw52VfpaWX
    UjAMBgNVHRMEBTADAQH/MA0GCSqGSIb3DQEBBQUAA4GBAJJlWll4uGlrqBzeIw7u
    M3RvomlxMESwGKb9gI+ZeORlnHAyZxvd9XngIcjPuU+8uc3wc10LRQUCn45a5hFs
    zaCp9BSewLCCirn6awZn2tP8JlagSbjrN9YShStt8S3S/Jj+eBoRvc7jJnmEeMkx
    O0wHOzp5ZHRDK7tGULD6jCfU
    -----END CERTIFICATE-----

 
 
NOTES
-----


1) 'Client.AuthFailure: Not authorized'

PROBLEM

WHEN ATTACHING A VOLUME GET THIS ERROR:

Client.AuthFailure: Not authorized for instances: [i-5e7ee833]


DIAGNOSIS

ec2 TOOLS WILL SHOW THAT A VOLUME HAS BEEN CREATED FROM AN EBS SNAPSHOT THAT YOU
DON'T ACTUALLY HAVE PERMISSIONS TO ACCESS. IT'S ONLY WHEN YOU COME TO MOUNT THE
VOLUME THAT YOU GET THE ABOVE ERROR.


SOLUTION

SHARE THE EBS SNAPSHOT WITH THE USER BEFORE THEY CREATE A VOLUME FROM IT




2) VOLUME HANGS IN 'attaching'

PROBLEM

HANGS IN 'attaching' STATE AND NEVER REALLY ATTACHES


DIAGNOSIS

VOLUME IS NOT PROPERLY DETACHED


SOLUTION

USE FORCE: ec2-detach-volume -f 



</entry>
