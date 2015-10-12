windows.xsl


gdisk -l /dev/sda
GPT fdisk (gdisk) version 0.8.5

Partition table scan:
  MBR: MBR only
  BSD: not present
  APM: not present
  GPT: not present


***************************************************************
Found invalid GPT and valid MBR; converting MBR to GPT format.
***************************************************************

Disk /dev/sda: 625142448 sectors, 298.1 GiB
Logical sector size: 512 bytes
Disk identifier (GUID): 1E8CB6BE-07A0-4D66-B14F-A31232EEFAC2
Partition table holds up to 128 entries
First usable sector is 34, last usable sector is 625142414
Partitions will be aligned on 2048-sector boundaries
Total free space is 420342381 sectors (200.4 GiB)

Number  Start (sector)    End (sector)  Size       Code  Name
   1            2048       102402047   48.8 GiB    0700  Microsoft basic data
   2       102402048       204802047   48.8 GiB    0700  Microsoft basic data
