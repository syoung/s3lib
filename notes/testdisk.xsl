testdisk


<entry [Mon 2012:11:26 08:41:54 EST] FIX LOST WIN7 PARTITION ON SONY LAPTOP>
    
1. GOT testdisk OUTPUT AFTER 'QUICK' SEARCH:

Christophe GRENIER < grenier@cgsecurity.org>
http://www.cgsecurity.org

Disk /dev/sda - 640 GB / 596 GiB - CHS 77825 255 63
Current partition structure:
     Partition                  Start        End    Size in sectors

 1 P Windows RE(store)        0  32 33  1788 211 23   28735488
 2 * HPFS - NTFS           1788 211 24  1801 147 10     204800 [System Reserved]
 3 P HPFS - NTFS           1801 147 11 33275  96 37  505626624
 4 E extended LBA         33275  96 38 77825  70  5  715694080
 5 L HPFS - NTFS          73256  48  9 77080 198 46   61442048 [Win7]


2. CHANGED Win7 FROM LOGICAL TO 'BOOTABLE PRIMARY':


TestDisk 6.14-WIP, Data Recovery Utility, May 2012
Christophe GRENIER < grenier@cgsecurity.org>
http://www.cgsecurity.org

Disk /dev/sda - 640 GB / 596 GiB - CHS 77825 255 63
     Partition               Start        End    Size in sectors
 P HPFS - NTFS              0  32 33  1788 211 23   28735488 [Recovery]
 P HPFS - NTFS           1788 211 24  1801 147 10     204800 [System Reserved]
 D HPFS - NTFS           1801 147 11 33275  96 37  505626624
>* HPFS - NTFS          73256  48  9 77080 198 46   61442048 [Win7]


3. GOT fdisk -l OUTPUT SHOWING NEW PARTITION INFO

fdisk -l

Disk /dev/sda: 640.1 GB, 640135028736 bytes
255 heads, 63 sectors/track, 77825 cylinders, total 1250263728 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x52a287ec

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1            2048    28737535    14367744    7  HPFS/NTFS/exFAT
/dev/sda2        28737536    28942335      102400    7  HPFS/NTFS/exFAT
/dev/sda3   *  1176860672  1238302719    30721024    7  HPFS/NTFS/exFAT

Disk /dev/sdc: 15.5 GB, 15504900096 bytes
43 heads, 43 sectors/track, 16378 cylinders, total 30283008 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0xc3072e18

   Device Boot      Start         End      Blocks   Id  System
/dev/sdc1            8064    30283007    15137472    c  W95 FAT32 (LBA)



4. USED fdisk TO CHANGE Win7 Start/End TO 1801/147/11 and 33275/96/37

Use sfdisk to change the start point and size of /dev/sda4 (the extended partition), then change 
the name of /dev/sda3 to /dev/sda5.

SAVED EXISTING PARTITION TABLE TO DISK:

/media/sdc1/partition.table.txt

edit it in a normal text editor, then tell sfdisk to write a new partition table based on our 
edited PT.txt:
Code:

sudo sfdisk --no-reread -f /dev/sdc -O PT.save <  PT.txt


EDITED PARTITION TABLE TO FILE: 

/media/sdc1/partition.table.2.txt



USED FILE TO WRITE NEW PARTITION TABLE:

sfdisk --no-reread -f /dev/sda -O PT.save <  /media/sdc1/partition.table.2.txt 

Disk /dev/sda: 77825 cylinders, 255 heads, 63 sectors/track
Old situation:
Units = cylinders of 8225280 bytes, blocks of 1024 bytes, counting from 0

   Device Boot Start     End   #cyls    #blocks   Id  System
/dev/sda1          0+   1788-   1789-  14367744    7  HPFS/NTFS/exFAT
/dev/sda2       1788+   1801-     13-    102400    7  HPFS/NTFS/exFAT
/dev/sda3   *  73256+  77080-   3825-  30721024    7  HPFS/NTFS/exFAT
/dev/sda4          0       -       0          0    0  Empty
New situation:
Units = sectors of 512 bytes, counting from 0

   Device Boot    Start       End   #sectors  Id  System
/dev/sda1          2048  28737535   28735488   7  HPFS/NTFS/exFAT
/dev/sda2      28737536  28942335     204800   7  HPFS/NTFS/exFAT
/dev/sda3   *  28942336 534568959  505626624   7  HPFS/NTFS/exFAT
/dev/sda4             0         -          0   0  Empty
Warning: partition 1 does not end at a cylinder boundary
Warning: partition 2 does not start at a cylinder boundary
Warning: partition 2 does not end at a cylinder boundary
Warning: partition 3 does not start at a cylinder boundary
Warning: partition 3 does not end at a cylinder boundary
Successfully wrote the new partition table

Re-reading the partition table ...

If you created or changed a DOS partition, /dev/foo7, say, then use dd(1)
to zero the first 512 bytes:  dd if=/dev/zero of=/dev/foo7 bs=512 count=1
(See fdisk(8).)


</entry>
<entry [Mon 2012:11:26 08:43:02 EST] TESTDISK LOG SONY LAPTOP>



Sun Nov 25 07:34:43 2012
Command line: TestDisk

TestDisk 6.14-WIP, Data Recovery Utility, May 2012
Christophe GRENIER < grenier@cgsecurity.org>
http://www.cgsecurity.org
OS: Linux, kernel 3.5.3-pmagic (#2 SMP Tue Sep 11 10:09:25 CDT 2012) x86_64
Compiler: GCC 4.7
Compilation date: 2012-05-30T19:32:33
ext2fs lib: 1.42.6, ntfs lib: libntfs-3g, reiserfs lib: none, ewf lib: none
/dev/sda: LBA, HPA, LBA48, DCO support
/dev/sda: size       1250263728 sectors
/dev/sda: user_max   1250263728 sectors
/dev/sda: native_max 1250263728 sectors
/dev/sda: dco        1250263728 sectors
Warning: can't get size for Disk /dev/mapper/control - 0 B - CHS 1 1 1, sector size=512
Hard disk list
Disk /dev/sda - 640 GB / 596 GiB - CHS 77825 255 63, sector size=512 - TOSHIBA MK6459GSXP, S/N:22GET0OAT, FW:GT001H

Partition table type default to Intel
Disk /dev/sda - 640 GB / 596 GiB - TOSHIBA MK6459GSXP
Partition table type: Intel

Analyse Disk /dev/sda - 640 GB / 596 GiB - CHS 77825 255 63
Current partition structure:

Partition sector doesn't have the endmark 0xAA55
Ask the user for vista mode
search_vista_part: 1

search_part()
Disk /dev/sda - 640 GB / 596 GiB - CHS 77825 255 63
NTFS at 0/32/33
filesystem size           28735488
sectors_per_cluster       8
mft_lcn                   786432
mftmirr_lcn               2
clusters_per_mft_record   -10
clusters_per_index_record 1
     HPFS - NTFS              0  32 33  1788 211 23   28735488 [Recovery]
     NTFS, blocksize=4096, 14 GB / 13 GiB
NTFS at 1788/211/24
filesystem size           204800
sectors_per_cluster       8
mft_lcn                   8533
mftmirr_lcn               2
clusters_per_mft_record   -10
clusters_per_index_record 1
     HPFS - NTFS           1788 211 24  1801 147 10     204800 [System Reserved]
     NTFS, blocksize=4096, 104 MB / 100 MiB
NTFS at 1801/147/11
filesystem size           505626609
sectors_per_cluster       8
mft_lcn                   786432
mftmirr_lcn               2
clusters_per_mft_record   -10
clusters_per_index_record 1
     HPFS - NTFS           1801 147 11 33275  96 22  505626609
     NTFS, blocksize=4096, 258 GB / 241 GiB
NTFS at 73256/48/9
filesystem size           61442048
sectors_per_cluster       8
mft_lcn                   786432
mftmirr_lcn               16
clusters_per_mft_record   -10
clusters_per_index_record 1
     HPFS - NTFS          73256  48  9 77080 198 46   61442048 [Win7]
     NTFS, blocksize=4096, 31 GB / 29 GiB

Results
   * HPFS - NTFS              0  32 33  1788 211 23   28735488 [Recovery]
     NTFS, blocksize=4096, 14 GB / 13 GiB
   P HPFS - NTFS           1788 211 24  1801 147 10     204800 [System Reserved]
     NTFS, blocksize=4096, 104 MB / 100 MiB
   P HPFS - NTFS           1801 147 11 33275  96 37  505626624
     NTFS, blocksize=4096, 258 GB / 241 GiB
   L HPFS - NTFS          73256  48  9 77080 198 46   61442048 [Win7]
     NTFS, blocksize=4096, 31 GB / 29 GiB
add_ext_part_i386: max
add_ext_part_i386: max

interface_write()
 1 * HPFS - NTFS              0  32 33  1788 211 23   28735488 [Recovery]
 2 P HPFS - NTFS           1788 211 24  1801 147 10     204800 [System Reserved]
 3 P HPFS - NTFS           1801 147 11 33275  96 37  505626624
 4 E extended LBA         33275  96 38 77825  70  5  715694080
 5 L HPFS - NTFS          73256  48  9 77080 198 46   61442048 [Win7]
write!

write_mbr_i386: starting...
Store new MBR code
write_all_log_i386: starting...
write_all_log_i386: CHS: 33275/96/38,lba=534568960
You will have to reboot for the change to take effect.
SIGHUP detected! TestDisk has been killed.


Sun Nov 25 08:42:32 2012
Command line: TestDisk

TestDisk 6.14-WIP, Data Recovery Utility, May 2012
Christophe GRENIER < grenier@cgsecurity.org>
http://www.cgsecurity.org
OS: Linux, kernel 3.5.3-pmagic (#2 SMP Tue Sep 11 10:09:25 CDT 2012) x86_64
Compiler: GCC 4.7
Compilation date: 2012-05-30T19:32:33
ext2fs lib: 1.42.6, ntfs lib: libntfs-3g, reiserfs lib: none, ewf lib: none
/dev/sda: LBA, HPA, LBA48, DCO support
/dev/sda: size       1250263728 sectors
/dev/sda: user_max   1250263728 sectors
/dev/sda: native_max 1250263728 sectors
/dev/sda: dco        1250263728 sectors
Warning: can't get size for Disk /dev/mapper/control - 0 B - CHS 1 1 1, sector size=512
Hard disk list
Disk /dev/sda - 640 GB / 596 GiB - CHS 77825 255 63, sector size=512 - TOSHIBA MK6459GSXP, S/N:22GET0OAT, FW:GT001H
Disk /dev/sdc - 15 GB / 14 GiB - CHS 14786 64 32, sector size=512, FW:PMAP


TestDisk exited normally.

    
</entry>
<entry [Fri 2012:10:26 23:32:57 EST] TESTDISK LOG - CHANGE GEOMETRY>
TestDisk 6.13, Data Recovery Utility, November 2011
Christophe GRENIER grenier@cgsecurity.org
http://www.cgsecurity.org

Disk /dev/sda - 320 GB / 298 GiB - CHS 38914 255 63

Warning: the current number of heads per cylinder is 255
but the correct value may be 16.
You can use the Geometry menu to change this value.
It's something to try if
- some partitions are not found by TestDisk
- or the partition table can not be written because partitions overlaps.

cat /proc/partitions
major minor  #blocks  name

   8        0  312571224 sda
   8        1  308788224 sda1
   8        2          1 sda2
   8        5    3780608 sda5
  11        0    1048575 sr0
   8       16  488386584 sdb
   8       17  450426758 sdb1
   8       18          1 sdb2
   8       21    8658944 sdb5
   8       22   29298688 sdb6
syoung@syoung-Satellite-C675D:~$ sudo fdisk -l /dev/sda
[sudo] password for syoung: 

Disk /dev/sda: 320.1 GB, 320072933376 bytes
255 heads, 63 sectors/track, 38913 cylinders, total 625142448 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x000765db

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *        2048   617578495   308788224   83  Linux
/dev/sda2       617580542   625141759     3780609    5  Extended
/dev/sda5       617580544   625141759     3780608   82  Linux swap / Solaris
syoung@syoung-Satellite-C675D:~$ 




    
</entry>
gpart /dev/sda

Begin scan...
^X^C
root@syoung-Satellite-C675D:~# time gpart /dev/sda

Begin scan...
Possible partition(Windows NT/W2K FS), size(152470mb), offset(152775mb)
End scan.

Checking partitions...

* Warning: partition(OS/2 HPFS, NTFS, QNX or Advanced UNIX) ends beyond disk end.
Partition(OS/2 HPFS, NTFS, QNX or Advanced UNIX): invalid primary 
Ok.

Guessed primary partition table:
Primary partition(1)
   type: 000(0x00)(unused)
   size: 0mb #s(0) s(0-0)
   chs:  (0/0/0)-(0/0/0)d (0/0/0)-(0/0/0)r

Primary partition(2)
   type: 000(0x00)(unused)
   size: 0mb #s(0) s(0-0)
   chs:  (0/0/0)-(0/0/0)d (0/0/0)-(0/0/0)r

Primary partition(3)
   type: 000(0x00)(unused)
   size: 0mb #s(0) s(0-0)
   chs:  (0/0/0)-(0/0/0)d (0/0/0)-(0/0/0)r

Primary partition(4)
   type: 000(0x00)(unused)
   size: 0mb #s(0) s(0-0)
   chs:  (0/0/0)-(0/0/0)d (0/0/0)-(0/0/0)r


   real38m43.329s
   user2m13.684s
   sys22m33.981s




2.Extundelete

    extundelete is a utility that can recover deleted files from an ext3 or ext4 partition



I've recently used the command line tool foremost for recovering 9000 photos off a SD card.

    Install foremost: sudo apt-get install foremost
    Mount and create the target directory for storing recovered data, make sure it's large enough to hold the data. I assume it's located at /media/backup/recover now.

    Assuming your flash drive to be named /dev/sdb, run:

    sudo foremost -i /dev/sdb -o /media/backup/recover

    Do something else, it might take a while to read and recover the data over USB.



https://help.ubuntu.com/community/DataRecovery




If you made a mistake while partitioning and the partition no longer appears in the partition table, so long as you have not written data in that space, all your data is still there.

GNU Parted

Run Parted from the command line to recover your partition.

When changing the partition table on your hard drive, you must ensure that no partition on the disk is mounted. This includes swap space. The easiest way to accomplish this is to run the live cd. Parted is installed on the base Ubuntu system. Once at the desktop, open a terminal and run_:

sudo swapoff -a

Next run parted and tell it to use the device in question. For example, if your /dev/sda drive is the drive from which you want to recover, run:

sudo parted /dev/sda

Then, use the rescue option:

rescue START END


where Start is the area of the disk where you believe the partition began and END is its end. If parted finds a potential partition, it will ask you if you want to add it to the partition table. 




CAUTION

You should NOT write to the failed device, as it can worsen a hardware failure, and overwrite existant data in case of lost files.

Shut down the affected machine as soon as possible, and restart it from a LiveCD or LiveUSB. Be certain that the "live" cd does not automatically mount any partition or swap space. 




WEDS 1pm

RAN DEEPER SEARCH IN TESTDISK:

TestDisk 6.13, Data Recovery Utility, November 2011
Christophe GRENIER <grenier@cgsecurity.org>
http://www.cgsecurity.org

Disk /dev/sda - 320 GB / 298 GiB - CHS 38913 255 63

The harddisk (320 GB / 298 GiB) seems too small! (< 440 GB / 410 GiB)
Check the harddisk size: HD jumpers settings, BIOS detection...

The following partition can't be recovered:
     Partition               Start        End    Size in sectors
>  Linux                22848   0  1 53601 232  7  494061568


FILE RECOVERY

scalpel # slow?
extundelete
photorec

Raise Data Recovery for Ext2/3/4



TRIED TO CHECK FOR SUPERBLOCK FAILURE BUT GET '/dev/sda is in use':

 sudo fsck.ext4 -v /dev/sda
e2fsck 1.42.5 (29-Jul-2012)
/dev/sda is in use.
e2fsck: Cannot continue, aborting.


SOLVED


Re: recovering partition table

Postby carandraug » 2012-10-01 07:46
Thank you all for you help. I finally managed to fix this. Just for the record here's how I did it. Part of the solution I found at http://linuxexpresso.wordpress.com/2010/03/31/repair-a-broken-ext4-superblock-in-ubuntu/ and it involves knowing the settings used to create the filesystem (I was pretty sure I didn't change the defaults).

Basically I first had to fix the partition table to reflect what I actually had there (I used testdisk for this but parted, cfdisk or fdisk should work fine as well). I just removed the wrong partitions and replaced by a single ext4 type partition covering the whole disk with the correct CHS values.

The rest is mostly from the link at start (read it for details) but basically I ran

Code: Select all
    mke2fs -n /dev/xxx


to find the positions for the superblocks backup. Then used the last backup closest to the end of the disk (only the ones at the start of the disk had been overwritten with dd) to run fsck. This generated a lof of errors but fsck has a -y option (not the same as -a).

Code: Select all
    sudo e2fsck -b backup_block_number /dev/xxx



I thought this had not worked because I couldn't see any files but actually they had all been saved to the lost+found directory.

So in the end I did salvage most of my files while keeping their filenames and directory structure. Hope this may help others in the future.



TESTDISK SHOWS DUPLICATE PARTITION

TestDisk 6.13, Data Recovery Utility, November 2011
Christophe GRENIER <grenier@cgsecurity.org>
http://www.cgsecurity.org

Disk /dev/sda - 320 GB / 298 GiB - CHS 38913 255 63
Current partition structure:
     Partition                  Start        End    Size in sectors

No ext2, JFS, Reiser, cramfs or XFS marker
 1 * Linux                38913   0  1 38913 254 63      16065
 1 * Linux                38913   0  1 38913 254 63      16065


