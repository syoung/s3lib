notes





<entry [Fri 2012:11:02 00:05:02 EST] ENCRYPT JOBS DIRECTORY tar.gz FILE>



ENCRYPT:

cd /mnt/syoung
tar -zcvf - jobs | openssl des3 -salt > jobs.des3


DECRYPT:

openssl des3 -d -k secretpassword < stuff.des3 |tar zxf -






NOTES
-----

ENCRYPT:

tar -zcvf - stuff | openssl des3 -salt -k secretpassword > stuff.des3


DECRYPT:

openssl des3 -d -k secretpassword < stuff.des3 |tar zxf -






    
</entry>
<entry [Fri 2012:10:26 18:33:33 EST] NOTES STAGING>

1   syoung:notes (PRIVATE)
   /home/syoung/notes



    
</entry>
<entry [Fri 2012:10:26 18:32:45 EST] ADDED agua.staging.xls>

ENTRIES FOR:

agua
bioapps
biorepo
aguatest
starcluster
    
</entry>
<entry [Fri 2012:10:26 18:31:54 EST] ADDED minecraft.xls>

COMPLETED INSTALL MINECRAFT ON KIDS' TOSHIBA

</entry>