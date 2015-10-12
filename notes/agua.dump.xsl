agua.dump

NB: JUST DUMP agua USER IF NO CHANGES TO admin OR guest USERS

<entry [Sat 2015:08:29 22:05:42 EST] DUMPED agua AFTER ADDING successor, ETC. FIELDS TO stage TABLE>

1. EXTRACT AGUA USER ENTRIES TO agua.dump

sudo /a/bin/scripts/dumpUser.pl \
--username agua \
--database agua \
--outputfile /a/bin/sql/dump/agua/agua.dump \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterstatus,\
clusterworkflow,\
download,\
feature,\
groupmember:owner='agua',\
groupmember:name='agua',\
groups,\
heartbeat,\
instance,\
instancetype,\
queue,\
queuesample,\
query,\
package:owner='agua',\
parameter:owner='agua',\
project,\
provenance,\
sampletable,\
sessions,\
source,\
stage,\
stageparameter,\
tenant,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

2. REMOVED NON-agua USER create-*.dump FILES

rm -fr /a/bin/sql/dump/agua/create-admin.dump
rm -fr /a/bin/sql/dump/agua/create-guest.dump


ll -tr /a/bin/sql/dump/agua/*agua.dump

    -rw-rw-r-- 1 syoung syoung    20 Aug 29 21:25 insert-guest.dump
    -rw-rw-r-- 1 syoung syoung   823 Aug 29 21:25 guest.dump
    -rw-rw-r-- 1 syoung syoung    20 Aug 29 21:26 insert-admin.dump
    -rw-rw-r-- 1 syoung syoung   823 Aug 29 21:26 admin.dump
    -rw-rw-r-- 1 syoung syoung 27029 Aug 29 22:04 create-agua.dump
    -rw-rw-r-- 1 syoung syoung    20 Aug 29 22:04 insert-agua.dump
    -rw-rw-r-- 1 syoung syoung 27049 Aug 29 22:04 agua.dump

</entry>
<entry [Sat 2015:08:29 21:13:01 EST] EXTRACTED USER DUMP FILES FOR admin, agua AND guest>

1. EXTRACT AGUA USER ENTRIES TO agua.dump

sudo /a/bin/scripts/dumpUser.pl \
--username agua \
--database agua \
--outputfile /a/bin/sql/dump/agua/agua.dump \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterstatus,\
clusterworkflow,\
download,\
feature,\
groupmember:owner='agua',\
groupmember:name='agua',\
groups,\
heartbeat,\
instance,\
instancetype,\
queue,\
queuesample,\
query,\
package:owner='agua',\
parameter:owner='agua',\
project,\
provenance,\
sampletable,\
sessions,\
source,\
stage,\
stageparameter,\
tenant,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

ll -tr /a/bin/sql/dump/agua/*agua.dump
    -rw-rw-r-- 1 syoung syoung 26898 Aug 29 21:23 /a/bin/sql/dump/agua/create-agua.dump
    -rw-rw-r-- 1 syoung syoung    20 Aug 29 21:23 /a/bin/sql/dump/agua/insert-agua.dump
    -rw-rw-r-- 1 syoung syoung 26918 Aug 29 21:23 /a/bin/sql/dump/agua/agua.dump


2. EXTRACT guest USER ENTRIES TO guest.dump

sudo /a/bin/scripts/dumpUser.pl \
--username guest \
--database guest \
--outputfile /a/bin/sql/dump/agua/guest.dump \
--tables "access:owner='guest',\
ami,\
app:owner='guest',\
cluster,\
clustervars,\
clusterstatus,\
clusterworkflow,\
download,\
feature,\
groupmember:owner='guest',\
groupmember:name='guest',\
groups,\
heartbeat,\
instance,\
instancetype,\
queue,\
queuesample,\
query,\
package:owner='guest',\
parameter:owner='guest',\
project,\
provenance,\
sampletable,\
sessions,\
source,\
stage,\
stageparameter,\
tenant,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

ll -tr /a/bin/sql/dump/agua/*guest.dump

    -rw-rw-r-- 1 syoung syoung 803 Aug 29 21:25 /a/bin/sql/dump/agua/create-guest.dump
    -rw-rw-r-- 1 syoung syoung  20 Aug 29 21:25 /a/bin/sql/dump/agua/insert-guest.dump
    -rw-rw-r-- 1 syoung syoung 823 Aug 29 21:25 /a/bin/sql/dump/agua/guest.dump


5. EXTRACT admin USER ENTRIES TO admin.dump

sudo /a/bin/scripts/dumpUser.pl \
--username admin \
--database admin \
--outputfile /a/bin/sql/dump/agua/admin.dump \
--tables "access:owner='admin',\
ami,\
app:owner='admin',\
cluster,\
clustervars,\
clusterstatus,\
clusterworkflow,\
download,\
feature,\
groupmember:owner='admin',\
groupmember:name='admin',\
groups,\
heartbeat,\
instance,\
instancetype,\
queue,\
queuesample,\
query,\
package:owner='admin',\
parameter:owner='admin',\
project,\
provenance,\
sampletable,\
sessions,\
source,\
stage,\
stageparameter,\
tenant,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

ll -tr /a/bin/sql/dump/agua/*admin.dump
    
    -rw-rw-r-- 1 syoung syoung 803 Aug 29 21:26 /a/bin/sql/dump/agua/create-admin.dump
    -rw-rw-r-- 1 syoung syoung  20 Aug 29 21:26 /a/bin/sql/dump/agua/insert-admin.dump
    -rw-rw-r-- 1 syoung syoung 823 Aug 29 21:26 /a/bin/sql/dump/agua/admin.dump

</entry>
<entry [Wed 2015:07:29 21:46:24 EST] CHANGED ancestor AND successor FIELDS IN stage>

1. CHANGED stage FIELDS

    ancestor            INT(3) DEFAULT NULL,
    successor           INT(3) DEFAULT NULL,


2. DUMP DATABASE

/a/bin/scripts/dumpDb.pl --db agua --outputdir /a/private/bin/sql/dump

    /a/private/bin/sql/dump/agua.2015-07-29-21-47-48.dump


3. EXTRACT AGUA USER ENTRIES TO agua.dump

sudo /a/bin/scripts/dumpUser.pl \
--username agua \
--database agua \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterstatus,\
clusterworkflow,\
download,\
feature,\
groupmember:owner='agua',\
groupmember:name='agua',\
groups,\
heartbeat,\
instance,\
instancetype,\
queue,\
queuesample,\
query,\
package:owner='agua',\
parameter:owner='agua',\
project,\
provenance,\
sampletable,\
sessions,\
source,\
stage,\
stageparameter,\
tenant,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report


4. MOVE TO CORRECT LOCATION

mv -f /a/bin/sql/dump/*dump /a/bin/sql/dump/agua
ll -tr /a/bin/sql/dump/agua
	
    -rw-r--r-- 1 root   root    26516 Jul 29 21:48 create-agua.dump
    -rw-r--r-- 1 root   root   719137 Jul 29 21:48 insert-agua.dump
    -rw-r--r-- 1 root   root   745653 Jul 29 21:48 agua.dump

5. COPY TO /a/t/unit/dump/create.dump

cp /a/bin/sql/dump/agua/create-agua.dump /a/t/unit/dump/create.dump
    



    
</entry>
<entry [Wed 2015:07:22 05:51:21 EST] MOVED status FIELD IN stage>
    
1. DUMP DATABASE

/a/bin/scripts/dumpDb.pl --db agua --outputdir /a/private/bin/sql/dump

	/a/private/bin/sql/dump/agua.2015-07-21-12-45-03.dump


2. EXTRACT AGUA USER ENTRIES TO agua.dump

sudo /a/bin/scripts/dumpUser.pl \
--username agua \
--database agua \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterstatus,\
clusterworkflow,\
download,\
feature,\
groupmember:owner='agua',\
groupmember:name='agua',\
groups,\
heartbeat,\
instance,\
instancetype,\
queue,\
queuesample,\
query,\
package:owner='agua',\
parameter:owner='agua',\
project,\
provenance,\
sampletable,\
sessions,\
source,\
stage,\
stageparameter,\
tenant,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report


3. MOVE TO CORRECT LOCATION

mv -f /a/bin/sql/dump/*dump /a/bin/sql/dump/agua
ll -tr /a/bin/sql/dump/agua
	
    -rw-r--r-- 1 root   root    26516 Jul 22 05:54 create-agua.dump
    -rw-r--r-- 1 root   root   719143 Jul 22 05:54 insert-agua.dump
    -rw-r--r-- 1 root   root   745659 Jul 22 05:54 agua.dump


4. COPY TO /a/t/unit/dump/create.dump

cp /a/bin/sql/dump/agua/create-agua.dump /a/t/unit/dump/create.dump
    
</entry>
<entry [Tue 2015:07:21 12:43:56 EST] ADDED ancestor AND successor FIELDS TO stage>

1. DUMPED DATABASE

/a/bin/scripts/dumpDb.pl --db agua --outputdir /a/private/bin/sql/dump

	/a/private/bin/sql/dump/agua.2015-07-21-12-45-03.dump


2. EXTRACT AGUA USER ENTRIES TO agua.dump

sudo /a/bin/scripts/dumpUser.pl \
--username agua \
--database agua \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterstatus,\
clusterworkflow,\
download,\
feature,\
groupmember:owner='agua',\
groupmember:name='agua',\
groups,\
heartbeat,\
instance,\
instancetype,\
queue,\
queuesample,\
query,\
package:owner='agua',\
parameter:owner='agua',\
project,\
provenance,\
sampletable,\
sessions,\
source,\
stage,\
stageparameter,\
tenant,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

mv -f /a/bin/sql/dump/*dump /a/bin/sql/dump/agua
ll -tr /a/bin/sql/dump/agua
	
-rw-r--r-- 1 root   root    26516 Jul 21 12:45 create-agua.dump
-rw-r--r-- 1 root   root   719143 Jul 21 12:45 insert-agua.dump	
-rw-r--r-- 1 root   root   745659 Jul 21 12:45 agua.dump

    
</entry>
<entry [Tue 2014:08:26 12:38:59 EST] ADDED ipaddress FIELD TO instance AND provenanceTABLES, ADDED heartbeat TABLE>
	
1. DUMPED DATABASE

/a/bin/scripts/dumpDb.pl --db agua --outputdir /a/private/bin/sql/dump

	/a/private/bin/sql/dump/agua.2014-08-16-23-16-13.dump


2. EXTRACT AGUA USER ENTRIES TO agua.dump

sudo /a/bin/scripts/dumpUser.pl \
--username agua \
--database agua \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterstatus,\
clusterworkflow,\
download,\
feature,\
groupmember:owner='agua',\
groupmember:name='agua',\
groups,\
heartbeat,\
instance,\
instancetype,\
queue,\
queuesample,\
query,\
package:owner='agua',\
parameter:owner='agua',\
project,\
provenance,\
sampletable,\
sessions,\
source,\
stage,\
stageparameter,\
tenant,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

mv -f /a/bin/sql/dump/*dump /a/bin/sql/dump/agua
ll -tr /a/bin/sql/dump/agua
	
	-rw-r--r-- 1 root   root    26391 Aug 26 12:52 create-agua.dump
	-rw-r--r-- 1 root   root   719143 Aug 26 12:52 insert-agua.dump
	-rw-r--r-- 1 root   root   745534 Aug 26 12:52 agua.dump
	
</entry>
<entry [Sat 2014:08:16 23:15:53 EST] ADDED sampletable TABLE>
	
1. DUMPED DATABASE

/a/bin/scripts/dumpDb.pl --db agua --outputdir /a/private/bin/sql/dump

	/a/private/bin/sql/dump/agua.2014-08-16-23-16-13.dump


2. EXTRACT AGUA USER ENTRIES TO agua.dump

sudo /a/bin/scripts/dumpUser.pl \
--username agua \
--database agua \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterworkflow,\
download,\
feature,\
groupmember:owner='agua',\
groupmember:name='agua',\
groups,\
instance,\
instancetype,\
queue,\
queuesample,\
query,\
package:owner='agua',\
parameter:owner='agua',\
project,\
provenance,\
samplefile,\
sessions,\
source,\
stage,\
stageparameter,\
tenant,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

mv -f /a/bin/sql/dump/*dump /a/bin/sql/dump/agua
ll -tr /a/bin/sql/dump/agua

	-rw-r--r-- 1 root   root    26355 Aug 16 23:16 create-agua.dump
	-rw-r--r-- 1 root   root   719143 Aug 16 23:16 insert-agua.dump
	-rw-r--r-- 1 root   root   745498 Aug 16 23:16 agua.dump

</entry>
<entry [Wed 2014:06:18 22:59:32 EST] ADDED heartbeat TABLE AND CHANGED instance TABLE>

1. DUMPED DATABASE

/a/bin/scripts/dumpDb.pl --db agua --outputdir /a/private/bin/sql/dump

	/a/private/bin/sql/dump/agua.2014-06-18-23-00-04.dump
	

2. EXTRACT AGUA USER ENTRIES TO agua.dump

sudo /a/bin/scripts/dumpUser.pl \
--username agua \
--database agua \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterworkflow,\
download,\
feature,\
groupmember:owner='agua',\
groupmember:name='agua',\
groups,\
instance,\
instancetype,\
queue,\
queuesample,\
query,\
package:owner='agua',\
parameter:owner='agua',\
project,\
provenance,\
samplefile,\
sessions,\
source,\
stage,\
stageparameter,\
tenant,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

mv -f /a/bin/sql/dump/*dump /a/bin/sql/dump/agua
ll -tr /a/bin/sql/dump/agua

	-rw-r--r-- 1 root   root    24481 Jun 18 23:00 create-agua.dump
	-rw-r--r-- 1 root   root   718863 Jun 18 23:00 insert-agua.dump
	-rw-r--r-- 1 root   root   743344 Jun 18 23:00 agua.dump

	
</entry>
<entry [Mon 2014:06:16 20:39:17 EST] CHANGED FIELDS IN tenant TABLE TO USE OPENSTACK IDENTIFIER FORMAT>

1. DUMPED DATABASE

/a/bin/scripts/dumpDb.pl --db agua --outputdir /a/private/bin/sql/dump

	/a/private/bin/sql/dump/agua.2014-06-16-20-42-04.dump


2. EXTRACT AGUA USER ENTRIES TO agua.dump

sudo /a/bin/scripts/dumpUser.pl \
--username agua \
--database agua \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterworkflow,\
download,\
feature,\
groupmember:owner='agua',\
groupmember:name='agua',\
groups,\
instance,\
instancetype,\
queue,\
queuesample,\
query,\
package:owner='agua',\
parameter:owner='agua',\
project,\
provenance,\
samplefile,\
sessions,\
source,\
stage,\
stageparameter,\
tenant,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

mv -f /a/bin/sql/dump/*dump /a/bin/sql/dump/agua
ll -tr /a/bin/sql/dump/agua

	-rw-r--r-- 1 root   root    23955 Jun 16 20:42 create-agua.dump
	-rw-r--r-- 1 root   root   718863 Jun 16 20:42 insert-agua.dump
	-rw-r--r-- 1 root   root   742818 Jun 16 20:42 agua.dump

</entry>
<entry [Mon 2014:06:16 12:06:20 EST] MODIFIED instance TABLE>
	
1. DUMPED DATABASE

/a/bin/scripts/dumpDb.pl --db agua --outputdir /a/private/bin/sql/dump

	/a/private/bin/sql/dump/agua.2014-06-16-12-37-33.dump
	

2. EXTRACT AGUA USER ENTRIES TO agua.dump

sudo /a/bin/scripts/dumpUser.pl \
--username agua \
--database agua \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterworkflow,\
download,\
feature,\
groupmember:owner='agua',\
groupmember:name='agua',\
groups,\
instance,\
instancetype,\
queue,\
queuesample,\
query,\
package:owner='agua',\
parameter:owner='agua',\
project,\
provenance,\
samplefile,\
sessions,\
source,\
stage,\
stageparameter,\
tenant,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

mv -f /a/bin/sql/dump/*dump /a/bin/sql/dump/agua
ll -tr /a/bin/sql/dump/agua
	
	-rw-r--r-- 1 root   root    23947 Jun 16 12:38 create-agua.dump
	-rw-r--r-- 1 root   root   718863 Jun 16 12:38 insert-agua.dump
	-rw-r--r-- 1 root   root   742810 Jun 16 12:38 agua.dump


</entry>
<entry [Mon 2014:06:16 11:26:53 EST] ADDED instance TABLE>
	
1. DUMPED DATABASE

/a/bin/scripts/dumpDb.pl --db agua --outputdir /a/private/bin/sql/dump

	/a/private/bin/sql/dump/agua.2014-06-16-11-27-17.dump
	
	
2. EXTRACT AGUA USER ENTRIES TO agua.dump

sudo /a/bin/scripts/dumpUser.pl \
--username agua \
--database agua \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterworkflow,\
download,\
feature,\
groupmember:owner='agua',\
groupmember:name='agua',\
groups,\
instance,\
instancetype,\
queue,\
queuesample,\
query,\
package:owner='agua',\
parameter:owner='agua',\
project,\
provenance,\
samplefile,\
sessions,\
source,\
stage,\
stageparameter,\
tenant,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

mv -f /a/bin/sql/dump/*dump /a/bin/sql/dump/agua
ll -tr /a/bin/sql/dump/agua
	
	-rw-r--r-- 1 root   root    23927 Jun 16 11:27 create-agua.dump
	-rw-r--r-- 1 root   root   718863 Jun 16 11:27 insert-agua.dump
	-rw-r--r-- 1 root   root   742790 Jun 16 11:27 agua.dump
	
</entry>
<entry [Mon 2014:06:16 04:05:18 EST] ADDED tenant TABLE>
	
1. DUMPED DATABASE

/a/bin/scripts/dumpDb.pl --db agua --outputdir /a/private/bin/sql/dump

	/a/private/bin/sql/dump/agua.2014-06-16-04-05-39.dump

	
2. EXTRACT AGUA USER ENTRIES TO agua.dump

sudo /a/bin/scripts/dumpUser.pl \
--username agua \
--database agua \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterworkflow,\
download,\
feature,\
groupmember:owner='agua',\
groupmember:name='agua',\
groups,\
instancetype,\
queue,\
queuesample,\
query,\
package:owner='agua',\
parameter:owner='agua',\
project,\
provenance,\
samplefile,\
sessions,\
source,\
stage,\
stageparameter,\
tenant,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

mv -f /a/bin/sql/dump/*dump /a/bin/sql/dump/agua
ll -tr /a/bin/sql/dump/agua

	-rw-r--r-- 1 root   root    23403 Jun 16 04:06 create-agua.dump
	-rw-r--r-- 1 root   root   718863 Jun 16 04:06 insert-agua.dump
	-rw-r--r-- 1 root   root   742266 Jun 16 04:06 agua.dump	
	
</entry>
<entry [Sat 2014:06:14 05:05:38 EST] REMOVED owner FIELD FROM provenance TABLE>
	
1. DUMPED DATABASE

/a/bin/scripts/dumpDb.pl --db agua --outputdir /a/private/bin/sql/dump

	/a/private/bin/sql/dump/agua.2014-06-14-05-05-47.dump

	
2. EXTRACT AGUA USER ENTRIES TO agua.dump

sudo /a/bin/scripts/dumpUser.pl \
--username agua \
--database agua \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterworkflow,\
download,\
feature,\
groupmember:owner='agua',\
groupmember:name='agua',\
groups,\
instancetype,\
queue,\
queuesample,\
query,\
package:owner='agua',\
parameter:owner='agua',\
project,\
provenance,\
samplefile,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

mv -f /a/bin/sql/dump/*dump /a/bin/sql/dump/agua
ll -tr /a/bin/sql/dump/agua

	-rw-r--r-- 1 root   root    22849 Jun 14 05:10 create-agua.dump
	-rw-r--r-- 1 root   root   718863 Jun 14 05:10 insert-agua.dump
	-rw-r--r-- 1 root   root   741712 Jun 14 05:10 agua.dump

	
</entry>
<entry [Fri 2014:05:09 13:20:11 EST] REMOVED owner FIELD FROM provenance TABLE>
	
1. DUMPED DATABASE

/a/bin/scripts/dumpDb.pl --db agua --outputdir /a/private/bin/sql/dump

	/a/private/bin/sql/dump/agua.2014-05-09-13-42-46.dump

	
2. EXTRACT AGUA USER ENTRIES TO agua.dump

sudo /a/bin/scripts/dumpUser.pl \
--username agua \
--database agua \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterworkflow,\
download,\
feature,\
groupmember:owner='agua',\
groupmember:name='agua',\
groups,\
queue,\
queuesample,\
query,\
package:owner='agua',\
parameter:owner='agua',\
project,\
provenance,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

mv -f /a/bin/sql/dump/*dump /a/bin/sql/dump/agua
ll -tr /a/bin/sql/dump/agua

	-rw-r--r-- 1 root   root    21624 May  9 13:21 create-agua.dump
	-rw-r--r-- 1 root   root   718847 May  9 13:21 insert-agua.dump
	-rw-r--r-- 1 root   root   740471 May  9 13:21 agua.dump

	
</entry>
<entry [Tue 2014:05:06 18:48:15 EST] UPDATED provenance TABLE>

ADDED TO provenance TABLE FIELDS: stdout, stderr

1. DUMPED DATABASE

/a/bin/scripts/dumpDb.pl --db agua --outputdir /a/private/bin/sql/dump

	/a/private/bin/sql/dump/agua.2014-05-06-19-41-33.dump

	
2. EXTRACT AGUA USER ENTRIES TO agua.dump

sudo /a/bin/scripts/dumpUser.pl \
--username agua \
--database agua \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterworkflow,\
download,\
feature,\
groupmember:owner='agua',\
groupmember:name='agua',\
groups,\
queue,\
queuesample,\
query,\
package:owner='agua',\
parameter:owner='agua',\
project,\
provenance,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

mv -f /a/bin/sql/dump/*dump /a/bin/sql/dump/agua
ll -tr /a/bin/sql/dump/agua
	
	-rw-r--r-- 1 root   root    22K May  6 19:41 create-agua.dump
	-rw-r--r-- 1 root   root   702K May  6 19:41 insert-agua.dump
	-rw-r--r-- 1 root   root   724K May  6 19:41 agua.dump


</entry>
<entry [Tue 2014:05:06 15:06:46 EST] Added queue, queuesample AND provenance TABLES>

NB: queue AND provenance MISSED LAST TIME BUT INCLUDED THIS TIME

1. DUMPED DATABASE

/a/bin/scripts/dumpDb.pl --db agua --outputdir /a/private/bin/sql/dump

	/a/private/bin/sql/dump/agua.2014-05-06-15-24-41.dump

	
2. EXTRACT AGUA USER ENTRIES TO agua.dump

sudo /a/bin/scripts/dumpUser.pl \
--username agua \
--database agua \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterworkflow,\
download,\
feature,\
groupmember:owner='agua',\
groupmember:name='agua',\
groups,\
queue,\
queuesample,\
query,\
package:owner='agua',\
parameter:owner='agua',\
project,\
provenance,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

mv -f /a/bin/sql/dump/*dump /a/bin/sql/dump/agua
ll -tr /a/bin/sql/dump/agua
	
	-rw-r--r-- 1 root   root    21639 May  6 15:24 create-agua.dump
	-rw-r--r-- 1 root   root   718847 May  6 15:24 insert-agua.dump
	-rw-r--r-- 1 root   root   740486 May  6 15:24 agua.dump


3. EXTRACT guest USER ENTRIES TO guest.dump

sudo /a/bin/scripts/dumpUser.pl \
--username guest \
--database agua \
--outputfile /a/bin/sql/dump/a/guest.dump \
--tables "access:owner='guest',\
ami,\
app:owner='guest',\
cluster,\
clustervars,\
clusterworkflow,\
download,\
feature,\
groupmember:owner='guest',\
groupmember:name='guest',\
groups,\
queue,\
queuesample,\
query,\
package:owner='guest',\
parameter:owner='guest',\
project,\
provenance,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

ll -tr /a/bin/sql/dump/agua

	-rw-rw-r-- 1 syoung syoung  21639 May  6 15:25 create-guest.dump
	-rw-rw-r-- 1 syoung syoung     20 May  6 15:25 insert-guest.dump
	-rw-rw-r-- 1 syoung syoung  21659 May  6 15:25 guest.dump


4. EXTRACT admin USER ENTRIES TO admin.dump

sudo /a/bin/scripts/dumpUser.pl \
--username admin \
--database agua \
--outputfile /a/bin/sql/dump/a/admin.dump \
--tables "access:owner='admin',\
ami,\
app:owner='admin',\
cluster,\
clustervars,\
clusterworkflow,\
download:owner=admin,\
feature,\
groupmember:owner='admin',\
groupmember:name='admin',\
groups,\
queue,\
queuesample,\
query:owner=admin,\
package:owner='admin',\
parameter:owner='admin',\
project,\
provenance,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report


ll -tr /a/bin/sql/dump/agua

	-rw-rw-r-- 1 syoung syoung  21639 May  6 15:25 create-admin.dump
	-rw-rw-r-- 1 syoung syoung     20 May  6 15:25 insert-admin.dump
	-rw-rw-r-- 1 syoung syoung  21659 May  6 15:25 admin.dump


	
</entry>
<entry [Wed 2014:04:30 10:08:59 EST] ADDED queue AND provenance TABLES>
	

1. DUMPED DATABASE

/aguadev/bin/scripts/dumpDb.pl --db agua --outputdir /aguadev/private/bin/sql/dump

	/aguadev/private/bin/sql/dump/agua.2014-04-30-10-09-35.dump

	
2. EXTRACT AGUA USER ENTRIES TO agua.dump

sudo /aguadev/bin/scripts/dumpUser.pl \
--username agua \
--database aguadev \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterworkflow,\
download,\
feature,\
groupmember:owner='agua',\
groupmember:name='agua',\
groups,\
query,\
package:owner='agua',\
parameter:owner='agua',\
project,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

mv -f /aguadev/bin/sql/dump/*dump /aguadev/bin/sql/dump/agua
ll -tr /aguadev/bin/sql/dump/agua

	-rw-r--r-- 1 root   root    21116 Apr 30 10:09 create-agua.dump
	-rw-r--r-- 1 root   root   718847 Apr 30 10:09 insert-agua.dump
	-rw-r--r-- 1 root   root   739963 Apr 30 10:09 agua.dump

	
3. EXTRACT guest USER ENTRIES TO guest.dump

sudo /aguadev/bin/scripts/dumpUser.pl \
--username guest \
--database aguadev \
--outputfile /aguadev/bin/sql/dump/a/guest.dump \
--tables "access:owner='guest',\
ami,\
app:owner='guest',\
cluster,\
clustervars,\
clusterworkflow,\
download,\
feature,\
groupmember:owner='guest',\
groupmember:name='guest',\
groups,\
query,\
package:owner='guest',\
parameter:owner='guest',\
project,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

ll -tr /aguadev/bin/sql/dump/agua

	-rw-rw-r-- 1 syoung syoung  21116 Apr 30 10:11 create-guest.dump
	-rw-rw-r-- 1 syoung syoung   1888 Apr 30 10:11 insert-guest.dump
	-rw-rw-r-- 1 syoung syoung  23004 Apr 30 10:11 guest.dump


4. EXTRACT admin USER ENTRIES TO admin.dump

sudo /aguadev/bin/scripts/dumpUser.pl \
--username admin \
--database aguadev \
--outputfile /aguadev/bin/sql/dump/a/admin.dump \
--tables "access:owner='admin',\
ami,\
app:owner='admin',\
cluster,\
clustervars,\
clusterworkflow,\
download:owner=admin,\
feature,\
groupmember:owner='admin',\
groupmember:name='admin',\
groups,\
query:owner=admin,\
package:owner='admin',\
parameter:owner='admin',\
project,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report


ll -tr /aguadev/bin/sql/dump/agua

	-rw-rw-r-- 1 syoung syoung  21116 Apr 30 10:12 create-admin.dump
	-rw-rw-r-- 1 syoung syoung 111596 Apr 30 10:12 insert-admin.dump
	-rw-rw-r-- 1 syoung syoung 132712 Apr 30 10:12 admin.dump

	
</entry>
<entry [Sun 2014:03:30 15:06:26 EST] ADDED version TO package TABLE KEYS>

1. DUMPED DATABASE

/aguadev/bin/scripts/dumpDb.pl --db agua --outputdir /aguadev/private/bin/sql/dump

	/aguadev/private/bin/sql/dump/agua.2014-03-30-15-18-38.dump

	
2. EXTRACT AGUA USER ENTRIES TO agua.dump

sudo /aguadev/bin/scripts/dumpUser.pl \
--username agua \
--database aguadev \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterworkflow,\
download,\
feature,\
groupmember:owner='agua',\
groupmember:name='agua',\
groups,\
query,\
package:owner='agua',\
parameter:owner='agua',\
project,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

mv /aguadev/bin/sql/dump/*dump /aguadev/bin/sql/dump/agua
ll -tr /aguadev/bin/sql/dump/agua

	-rw-r--r-- 1 root   root    19520 Mar 30 15:19 create-agua.dump
	-rw-r--r-- 1 root   root   718832 Mar 30 15:19 insert-agua.dump
	-rw-r--r-- 1 root   root   738352 Mar 30 15:19 agua.dump


#### SKIPPED - 3. COPY create-agua.dump TO TEST create.dump

cp /aguadev/bin/sql/dump/create-agua.dump /aguadev/t/dump/create.dump

FOR LEGACY TESTS THAT USE /aguadev/t/dump/create.dump
    

4. EXTRACT guest USER ENTRIES TO guest.dump

sudo /aguadev/bin/scripts/dumpUser.pl \
--username guest \
--database aguadev \
--outputfile /aguadev/bin/sql/dump/a/guest.dump \
--tables "access:owner='guest',\
ami,\
app:owner='guest',\
cluster,\
clustervars,\
clusterworkflow,\
download,\
feature,\
groupmember:owner='guest',\
groupmember:name='guest',\
groups,\
query,\
package:owner='guest',\
parameter:owner='guest',\
project,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

ll -tr /aguadev/bin/sql/dump/agua

	-rw-rw-r-- 1 syoung syoung  19520 Mar 30 15:22 create-guest.dump
	-rw-rw-r-- 1 syoung syoung   2634 Mar 30 15:22 insert-guest.dump
	-rw-rw-r-- 1 syoung syoung  22154 Mar 30 15:22 guest.dump


5. EXTRACT admin USER ENTRIES TO admin.dump

sudo /aguadev/bin/scripts/dumpUser.pl \
--username admin \
--database aguadev \
--outputfile /aguadev/bin/sql/dump/a/admin.dump \
--tables "access:owner='admin',\
ami,\
app:owner='admin',\
cluster,\
clustervars,\
clusterworkflow,\
download:owner=admin,\
feature,\
groupmember:owner='admin',\
groupmember:name='admin',\
groups,\
query:owner=admin,\
package:owner='admin',\
parameter:owner='admin',\
project,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report


ll -tr /aguadev/bin/sql/dump/agua

	-rw-rw-r-- 1 syoung syoung  19520 Mar 30 15:23 create-admin.dump
	-rw-rw-r-- 1 syoung syoung 110372 Mar 30 15:23 insert-admin.dump
	-rw-rw-r-- 1 syoung syoung 129892 Mar 30 15:23 admin.dump	

</entry>
<entry [Wed 2014:01:08 13:37:58 EST] FIRST aguatest DATABASE DUMP>

1. COPIED USER INFO FROM guest TO testuser

/aguadev/bin/sql/dump/test/testuser.dump


2. COPIED agua INFO FROM aguadev DATABASE TO aguatest DATABASE

/aguadev/bin/sql/dump/test/agua.dump


3. LOADED agua.dump DATA INTO aguatest

IN MYSQL:

source /aguadev/bin/sql/dump/test/agua.dump




	
</entry>
<entry [Sat 2013:12:21 14:04:26 EST] ADDED query AND download TABLES>

1. DUMPED DATABASE

/aguadev/bin/scripts/dumpDb.pl --db agua --outputdir /aguadev/private/bin/sql/dump

	/aguadev/private/bin/sql/dump/agua.2013-12-21-14-05-33.dump    


2. EXTRACT AGUA USER ENTRIES TO agua.dump

sudo /aguadev/bin/scripts/dumpUser.pl \
--username agua \
--database aguadev \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterworkflow,\
download,\
feature,\
groupmember:owner='agua',\
groupmember:name='agua',\
groups,\
query,\
package:owner='agua',\
parameter:owner='agua',\
project,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report


ll -tr /aguadev/bin/sql/dump

	-rw-r--r-- 1 syoung syoung  20K Dec 21 14:09 create-agua.dump
	-rw-r--r-- 1 syoung syoung   20 Dec 21 14:09 insert-agua.dump
	-rw-r--r-- 1 syoung syoung  20K Dec 21 14:09 agua.dump



3. COPY create-agua.dump TO TEST create.dump

cp /aguadev/bin/sql/dump/create-agua.dump /aguadev/t/dump/create.dump

FOR LEGACY TESTS THAT USE /aguadev/t/dump/create.dump
    

4. EXTRACT guest USER ENTRIES TO guest.dump

sudo /aguadev/bin/scripts/dumpUser.pl \
--username guest \
--database aguadev \
--outputfile /aguadev/bin/sql/dump/guest.dump \
--tables "access:owner='guest',\
ami,\
app:owner='guest',\
cluster,\
clustervars,\
clusterworkflow,\
download,\
feature,\
groupmember:owner='guest',\
groupmember:name='guest',\
groups,\
query,\
package:owner='guest',\
parameter:owner='guest',\
project,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

ll -tr /aguadev/bin/sql/dump

	-rw-r--r-- 1 syoung syoung  20K Dec 21 14:10 create-guest.dump
	-rw-r--r-- 1 syoung syoung  37K Dec 21 14:10 insert-guest.dump
	-rw-r--r-- 1 syoung syoung  56K Dec 21 14:10 guest.dump


5. EXTRACT admin USER ENTRIES TO admin.dump

sudo /aguadev/bin/scripts/dumpUser.pl \
--username admin \
--database aguadev \
--outputfile /aguadev/bin/sql/dump/admin.dump \
--tables "access:owner='admin',\
ami,\
app:owner='admin',\
cluster,\
clustervars,\
clusterworkflow,\
download:owner=admin,\
feature,\
groupmember:owner='admin',\
groupmember:name='admin',\
groups,\
query:owner=admin,\
package:owner='admin',\
parameter:owner='admin',\
project,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report


ll -tr /aguadev/bin/sql/dump
	
	-rw-r--r-- 1 syoung syoung  20K Dec 21 14:12 create-admin.dump
	-rw-r--r-- 1 syoung syoung  675 Dec 21 14:12 insert-admin.dump
	-rw-r--r-- 1 syoung syoung  20K Dec 21 14:12 admin.dump
	

</entry>
<entry [Sun 2013:09:01 02:40:35 EST] FIXED sleep.sh LOCATION IN app TABLE, ADDED GUEST ENTRIES IN view AND viewfeature TABLES>

1. DUMPED DATABASE

/aguadev/bin/scripts/dumpDb.pl --db agua --outputdir /aguadev/private/bin/sql/dump

    /aguadev/private/bin/sql/dump/agua.2013-09-01-02-42-27.dump
    

2. EXTRACT AGUA USER ENTRIES TO agua.dump

sudo /aguadev/bin/scripts/dumpUser.pl \
--username agua \
--database aguadev \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterworkflow,\
feature,\
groupmember:owner='agua',\
groupmember:name='agua',\
groups,\
package:owner='agua',\
parameter:owner='agua',\
project,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report


ll -tr /aguadev/bin/sql/dump

    -rw-r--r-- 1 syoung syoung  18317 Sep  1 02:43 create-agua.dump
    -rw-r--r-- 1 syoung syoung 739590 Sep  1 02:43 insert-agua.dump
    -rw-r--r-- 1 syoung syoung 757907 Sep  1 02:43 agua.dump


3. COPY create-agua.dump TO TEST create.dump

cp /aguadev/bin/sql/dump/create-agua.dump /aguadev/t/dump/create.dump

FOR LEGACY TESTS THAT USE /aguadev/t/dump/create.dump
    

4. EXTRACT guest USER ENTRIES TO guest.dump

sudo /aguadev/bin/scripts/dumpUser.pl \
--username guest \
--database aguadev \
--outputfile /aguadev/bin/sql/dump/guest.dump \
--tables "access:owner='guest',\
ami,\
app:owner='guest',\
cluster,\
clustervars,\
clusterworkflow,\
feature,\
groupmember:owner='guest',\
groupmember:name='guest',\
groups,\
package:owner='guest',\
parameter:owner='guest',\
project,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

ll -tr /aguadev/bin/sql/dump

    -rw-r--r-- 1 root   root    18317 Sep  1 02:54 create-guest.dump
    -rw-r--r-- 1 root   root    38364 Sep  1 02:54 insert-guest.dump
    -rw-r--r-- 1 syoung syoung  56681 Sep  1 02:54 guest.dump



5. EXTRACT admin USER ENTRIES TO admin.dump

sudo /aguadev/bin/scripts/dumpUser.pl \
--username admin \
--database aguadev \
--outputfile /aguadev/bin/sql/dump/admin.dump \
--tables "access:owner='admin',\
ami,\
app:owner='admin',\
cluster,\
clustervars,\
clusterworkflow,\
feature,\
groupmember:owner='admin',\
groupmember:name='admin',\
groups,\
package:owner='admin',\
parameter:owner='admin',\
project,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report


ll -tr /aguadev/bin/sql/dump
    
    -rw-r--r-- 1 root   root    18317 Sep  1 02:56 create-admin.dump
    -rw-r--r-- 1 root   root     5399 Sep  1 02:56 insert-admin.dump
    -rw-r--r-- 1 root   root    23716 Sep  1 02:56 admin.dump


</entry>
<entry [Thu 2013:07:18 01:58:34 EST] REMOVE aguatest FROM package TABLE>

1. DUMPED DATABASE

/aguadev/bin/scripts/dumpDb.pl --db agua --outputdir /aguadev/private/bin/sql/dump

    /aguadev/private/bin/sql/dump/agua.2013-07-18-01:44:51.dump    
    /aguadev/private/bin/sql/dump/agua.2013-07-18-01:59:20.dump

2. EXTRACTED TABLES TO agua.dump

sudo /aguadev/bin/scripts/dumpUser.pl \
--username agua \
--database aguadev \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterworkflow,\
feature,\
groupmember:owner='agua',\
groupmember:name='agua',\
groups,\
package:owner='agua',\
parameter:owner='agua',\
project,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report



VERIFY FILES

ll -tr /aguadev/bin/sql/dump

#    -rw-r--r-- 1 syoung syoung  18302 Jul 17 15:59 create-agua.dump
#    -rw-r--r-- 1 syoung syoung 719788 Jul 17 15:59 insert-agua.dump
#    -rw-r--r-- 1 syoung syoung 738090 Jul 17 15:59 agua.dump

    -rw-r--r-- 1 syoung syoung  18320 Jul 18 01:45 create-agua.dump
    -rw-r--r-- 1 syoung syoung 739825 Jul 18 01:45 insert-agua.dump
    -rw-r--r-- 1 syoung syoung 758145 Jul 18 01:45 agua.dump



4. COPIED create-agua.dump TO TEST create.dump

cp /aguadev/bin/sql/dump/create-agua.dump /aguadev/t/dump/create.dump

FOR LEGACY TESTS THAT USE /aguadev/t/dump/create.dump
    
    
</entry>
<entry [Thu 2013:07:18 01:14:43 EST] FIXED username IN bioapps ENTRIES IN app TABLE>

1. CHANGED USERNAME FROM agua TO admin IN TSV FILE (TEMPORARY LOADER FOR TESTING)
    
    /mnt/repos/private/syoung/biorepodev/syoung/a/tsv/app.tsv


2. DUMPED DATABASE

/aguadev/bin/scripts/dumpDb.pl --db agua --outputdir /aguadev/private/bin/sql/dump

    /aguadev/private/bin/sql/dump/agua.2013-07-18-01:44:51.dump    


3. EXTRACTED TABLES TO agua.dump

sudo /aguadev/bin/scripts/dumpUser.pl \
--username agua \
--database aguadev \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterworkflow,\
feature,\
groupmember:owner='agua',\
groupmember:name='agua',\
groups,\
package:owner='agua',\
parameter:owner='agua',\
project,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report



VERIFY FILES

ll -tr /aguadev/bin/sql/dump

#    -rw-r--r-- 1 syoung syoung  18302 Jul 17 15:59 create-agua.dump
#    -rw-r--r-- 1 syoung syoung 719788 Jul 17 15:59 insert-agua.dump
#    -rw-r--r-- 1 syoung syoung 738090 Jul 17 15:59 agua.dump

    -rw-r--r-- 1 syoung syoung  18320 Jul 18 01:45 create-agua.dump
    -rw-r--r-- 1 syoung syoung 739825 Jul 18 01:45 insert-agua.dump
    -rw-r--r-- 1 syoung syoung 758145 Jul 18 01:45 agua.dump



4. COPIED create-agua.dump TO TEST create.dump

cp /aguadev/bin/sql/dump/create-agua.dump /aguadev/t/dump/create.dump

FOR LEGACY TESTS THAT USE /aguadev/t/dump/create.dump


    
</entry>
<entry [Wed 2013:07:17 15:41:28 EST] ADDED linkurl FIELD TO app TABLE, POPULATED EMBOSS APPS INTO package, app AND parameter TABLES>

1. COMMITTED CHANGES

* 2be4cf6 (HEAD, git/master, bit/master, master) +Fix bin/sql/app.sql,lib/Agua: Added 'linkurl' field to app table, reenabled emboss.pm with paramtypes
* ef068f6 -Onw html/plugins/apps: Fixing only 'admin' packages shown (not 'agua') in Apps pane
* dceefa5 +Fix html/plugins/apps: ParameterRow not displaying


2. LIST OF CHANGES

    ADDED linkurl FIELD TO app TABLE
    
    POPULATED EMBOSS APPS INTO package, app AND parameter TABLES

    ADDED linkurl FIELD TO bioapps DATA
    
        /mnt/repos/private/syoung/biorepodev/syoung/a/tsv/app.tsv


3. DUMPED DATABASE

/aguadev/bin/scripts/dumpDb.pl --db agua --outputdir /aguadev/private/bin/sql/dump

    /aguadev/private/bin/sql/dump/agua.2013-07-17-15:45:15.dump
    

4. EXTRACTED TABLES TO agua.dump

sudo /aguadev/bin/scripts/dumpUser.pl \
--username agua \
--database aguadev \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterworkflow,\
feature,\
groupmember:owner='agua',\
groupmember:name='agua',\
groups,\
package:owner='agua',\
parameter:owner='agua',\
project,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report



VERIFY FILES

ll -tr /aguadev/bin/sql/dump

    -rw-r--r-- 1 syoung syoung  18302 Jul 17 15:59 create-agua.dump
    -rw-r--r-- 1 syoung syoung 719788 Jul 17 15:59 insert-agua.dump
    -rw-r--r-- 1 syoung syoung 738090 Jul 17 15:59 agua.dump


5. COPIED create-agua.dump TO TEST create.dump

cp /aguadev/bin/sql/dump/create-agua.dump /aguadev/t/dump/create.dump

    
</entry>
<entry [Sun 2013:01:06 22:38:00 EST] ADDED admin PROJECTS, EDITED app, parameter AND package TABLES>

1. ADDED admin PROJECTS, EDITED app, parameter AND package TABLES

* 101e59c -Fix bin/sql/app & parameter.sql: Added 'username' field after 'owner
* 23748b8 -Fix bin/sql/stageparameter.sql: Swapped owner and username lines
* f0b9db5 -Fix bin/sql/package.sql,lib/Agua/Ops/Install,lib/Auga/Common/Package/Default: Added 'repository' field to package table


2. ADDED admin PROJECTS

    ADDED Project4.ntHumChimp
    
    ADDED Project3.Parkinsons
    
        control1
        control2
        test1
        test2


3. CREATED DUMP FILE

/a/bin/scripts/dumpDb.pl --db agua --outputdir /a/private/bin/sql/dump/

    /a/private/bin/sql/dump//agua.2013-01-06-22:44:41.dump

    
4. EXTRACTED TABLES TO agua.dump

/a/bin/scripts/dumpUser.pl \
--username agua \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterworkflow,\
feature,\
groupmember:owner='agua',\
groupmember:name='agua',\
groups,\
package:owner='agua',\
parameter:owner='agua',\
project,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

    /a/bin/sql/dump/create-agua.dump
    /a/bin/sql/dump/insert-agua.dump
    /a/bin/sql/dump/agua.dump


5. COPIED create-agua.dump TO TEST create.dump

cp /a/bin/sql/dump/create-agua.dump /a/t/dump/create.dump





</entry>
<entry [Sat 2012:12:29 07:01:34 EST] BIOINFORMATICS BLOGS>

OMICS OMICS
http://omicsomics.blogspot.com/2012/01/does-illlmina-also-have-homopolymer.html
-- CALL FOR BAC-EUKARYOTIC TEST GENOME

    
</entry>
<entry [Sun 2012:12:23 06:26:44 EST] ADDED Project2.Parkinsons JBROWSE VIEW FEATURES TO features AND viewfeatures>

1. ADDED Project2.Parkinsons JBROWSE VIEW FEATURES TO features AND viewfeatures

SEE agua.xsl
[Sat 2012:12:22 04:21:00 EST] RESTORED JBROWSE DEMO DATA TO admin USER PROJECTS


2. CREATED DUMP FILE

/a/bin/scripts/dumpDb.pl --db agua --outputdir /a/private/bin/sql/dump/

    /a/private/bin/sql/dump//agua.2012-12-23-06:30:25.dump

    
3. EXTRACTED TABLES TO agua.dump

/a/bin/scripts/dumpUser.pl \
--username agua \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterworkflow,\
feature,\
groupmember:owner='agua',\
groupmember:name='agua',\
groups,\
package:owner='agua',\
parameter:owner='agua',\
project,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

    /a/bin/sql/dump/create-agua.dump
    /a/bin/sql/dump/insert-agua.dump
    /a/bin/sql/dump/agua.dump


4. COPIED create-agua.dump TO TEST create.dump

cp /a/bin/sql/dump/create-agua.dump /a/t/dump/create.dump


    
</entry>
<entry [Sat 2012:11:10 04:07:27 EST] ADDED 'status' FIELD TO workflow AND project TABLES>

1. ADDED 'status' FIELD TO workflow AND project TABLES

2. CREATED DUMP FILE

/a/bin/scripts/dumpDb.pl --db agua --outputdir /a/private/bin/sql/dump/

    /a/private/bin/sql/dump//agua.2012-11-10-04:08:19.dump

3. EXTRACTED TABLES TO agua.dump

/a/bin/scripts/dumpUser.pl \
--username agua \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterworkflow,\
feature,\
groupmember:owner='agua',\
groupmember:name='agua',\
groups,\
package:owner='agua',\
parameter:owner='agua',\
project,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

    /a/bin/sql/dump/create-agua.dump
    /a/bin/sql/dump/insert-agua.dump
    /a/bin/sql/dump/agua.dump


4. COPIED create-agua.dump TO TEST create.dump

cp /a/bin/sql/dump/create-agua.dump /a/t/dump/create.dump

    


    
</entry>
<entry [Tue 2012:10:09 16:36:08 EST] FIXED MISSING ami TABLE ENTRIES>


1. CHANGED USERNAME TO agua IN ami TO DUMP ENTRIES

update ami set username='agua';


2. CREATED DUMP FILE

/a/bin/scripts/dumpDb.pl --db agua --outputdir /a/private/bin/sql/dump/

    /a/private/bin/sql/dump//agua.2012-10-09-16:44:31.dump


3. EXTRACTED TABLES TO agua.dump

/a/bin/scripts/dumpUser.pl \
--username agua \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterworkflow,\
feature,\
groupmember:owner='agua',\
groupmember:name='agua',\
groups,\
package:owner='agua',\
parameter:owner='agua',\
project,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

    /a/bin/sql/dump/create-agua.dump
    /a/bin/sql/dump/insert-agua.dump
    /a/bin/sql/dump/agua.dump


4. COPIED create-agua.dump TO TEST create.dump

cp /a/bin/sql/dump/create-agua.dump /a/t/dump/create.dump

    
    
</entry>
<entry [Thu 2012:09:13 09:47:48 EST] UPDATE ami WITH ERIDANUS-0.8.0-alpha AS StarCluster-base>

1. SET AMIID FOR ERIDANUS-0.8.0-alpha

update ami set amiid='ami-11c67678' where aminame='StarCluster-base';


2. CREATED DUMP FILE

/a/bin/scripts/dumpDb.pl --db agua --outputdir /a/private/bin/sql/dump/

    /a/private/bin/sql/dump//agua.2012-09-13-09:49:36.dump

3. EXTRACTED TABLES TO agua.dump

/a/bin/scripts/dumpUser.pl \
--username agua \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterworkflow,\
feature,\
groupmember:owner='agua',\
groupmember:name='agua',\
groups,\
package:owner='agua',\
parameter:owner='agua',\
project,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

    /a/bin/sql/dump/create-agua.dump
    /a/bin/sql/dump/insert-agua.dump
    /a/bin/sql/dump/agua.dump


4. COPIED create-agua.dump TO TEST create.dump

cp /a/bin/sql/dump/create-agua.dump /a/t/dump/create.dump


    
</entry>
<entry [Fri 2012:08:17 14:06:11 EST] CHANGED package TABLE KEY TO username-package>

1. CHANGED package TABLE KEY FROM owner-package-installdir TO username-package

2. CREATED PRIVATE dump FILE
/a/bin/scripts/dumpDb.pl --db agua --outputdir /a/private/bin/sql/dump/

    /a/private/bin/sql/dump//agua.2012-08-17-14:07:50.dump

3. EXTRACTED TABLES TO agua.dump

/a/bin/scripts/dumpUser.pl \
--username agua \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterworkflow,\
feature,\
groupmember:owner='agua',\
groupmember:name='agua',\
groups,\
package:owner='agua',\
parameter:owner='agua',\
project,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

    /a/bin/sql/dump/create-agua.dump
    /a/bin/sql/dump/insert-agua.dump
    /a/bin/sql/dump/agua.dump


4. COPIED create-agua.dump TO TEST create.dump

cp /a/bin/sql/dump/create-agua.dump /a/t/dump/create.dump

    
</entry>
<entry [Thu 2012:07:26 20:44:55 EST] MOVED repoaccess TABLE TO hub AND ADDED tokenid>

1. repoaccess CHANGED TO hub

2. ADDED tokenid FIELD TO hub

3. DROPPED TABLE repoaccess


/a/bin/scripts/dumpDb.pl --db agua --outputdir /a/private/bin/sql/dump/

    /a/private/bin/sql/dump//agua.2012-07-26-21:06:54.dump


/a/bin/scripts/dumpUser.pl \
--username agua \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterworkflow,\
feature,\
groupmember:owner='agua',\
groupmember:name='agua',\
groups,\
package:owner='agua',\
parameter:owner='agua',\
project,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

    /a/bin/sql/dump/create-agua.dump
    /a/bin/sql/dump/insert-agua.dump
    /a/bin/sql/dump/agua.dump


cp /a/bin/sql/dump/create-agua.dump /a/t/dump/create.dump
    
</entry>
<entry [Sun 2012:07:15 16:19:18 EST] CHANGES TO aws AND repoaccess TABLES>

1. repoaccess CHANGED sshkey TO keyfile

2. aws CHANGED secretaccesskey TO awssecretaccesskey

3. DUMPED DATA

/a/bin/scripts/dumpDb.pl --db agua --outputdir /a/private/bin/sql/dump/

    /a/private/bin/sql/dump//agua.2012-07-15-16:21:21.dump

/a/bin/scripts/dumpUser.pl \
--username agua \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterworkflow,\
feature,\
groupmember:owner='agua',\
groupmember:name='agua',\
groups,\
package:owner='agua',\
parameter:owner='agua',\
project,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report
    
    /a/bin/sql/dump/create-agua.dump
    /a/bin/sql/dump/insert-agua.dump
    /a/bin/sql/dump/agua.dump
    
</entry>
<entry [Fri 2012:07:13 23:47:30 EST] ADDED aguatest ENTRY TO package TABLE>

/a/bin/scripts/dumpDb.pl --db agua --outputdir /a/private/bin/sql/dump/

    /a/private/bin/sql/dump//agua.2012-07-13-23:48:33.dump

/a/bin/scripts/dumpUser.pl \
--username agua \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterworkflow,\
feature,\
groupmember:owner='agua',\
groupmember:name='agua',\
groups,\
package:owner='agua',\
parameter:owner='agua',\
project,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

    /a/bin/sql/dump/create-agua.dump
    /a/bin/sql/dump/insert-agua.dump
    /a/bin/sql/dump/agua.dump

-------------

/a/bin/sql/dump/agua.dump CONTAINS:

INSERT INTO package VALUES ('agua','admin','agua','ready','0.7.5+build10','/a/repos/public/a/biorepository/a/agua','/agua','','','','2012-02-25 01:24:24'\
);
INSERT INTO package VALUES ('agua','admin','aguatest','ready','0.0.1','/a/repos/public/a/biorepository/aguatest','/a/t','','','','2012-07-13 23:45:54');
INSERT INTO package VALUES ('agua','admin','bioapps','ready','0.7.2','/a/repos/public/a/biorepository/a/bioapps','/a/bioapps','','','','2012-02-25 20:\
16:28');
INSERT INTO package VALUES ('agua','admin','biorepository','ready','0.7.5+build5','','/a/repos/public/a/biorepository','','','','2012-02-25 23:52:01');


    
</entry>
<entry [Thu 2012:07:12 16:25:16 EST] SAVED DB BEFORE SWITCH TO NEW TOSHIBA>
    
/a/private/bin/sql/dump/agua.2012-07-12-16:24:37.dump
    
</entry>
<entry [Sun 2012:06:10 21:20:25 EST] CHANGED package TABLE: ADDED privacy FIELD>

CHANGED
./Common/Package/Sync/inputs/apps/tsv/package.tsv
./CLI/Project/inputs/apps/tsv/package.tsv

DUMPED
/a/private/bin/sql/dump/agua.2012-06-10-22:11:17.dump

REPLACED create.dump:

/a/bin/scripts/dumpUser.pl \
--database agua \
--username admin \
--outputfile /a/t/bin/Agua/Common/Package/Sync/inputs/dump/agua.dump 

/a/t/bin/Agua/Common/Package/Sync/inputs/dump/create-agua.dump
    
</entry>
<entry [Tue 2012:06:05 03:21:56 EST] FIXED installdir IN app AND parameter TABLES IN aguatest TEST DATABASE>

cp /a/t/bin/Agua/Common/Package/Sync/inputs/dump/aguatest.2012-06-05-03:21:34.dump \
/a/t/bin/Agua/Common/Package/Sync/inputs/dump/create.dump
    
</entry>
<entry [Tue 2012:05:22 20:34:52 EST] CHANGED feature TABLE syoung FEATURES ProjectX TO Project2>

/a/private/bin/sql/dump/agua.2012-05-22-20:34:33.dump
    
</entry>
<entry [Mon 2012:04:30 18:02:44 EST] BEFORE TEST CLUSTER - TRANSFER FROM TOSHIBA TO HEADNODE>

/a/private/bin/sql/dump//agua.2012-04-30-16:34:59.dump
    
scp /a/private/bin/sql/dump//agua.2012-04-30-16:34:59.dump \
root@ec2-23-21-20-52.compute-1.amazonaws.com:/tmp
    
</entry>
<entry [Tue 2012:04:24 14:05:11 EST] BEFORE CREATE DEFAULT agua.tables.dump AND agua.data.dump>

(CORRECTED clustervars 'admin-admin-*cluster' ENTRIES)
 
/a/private/bin/sql/dump//agua.2012-04-24-14:04:44.dump

</entry>
<entry [Sun 2012:04:08 16:19:02 EST] REMOVED UNNEEDED ENTRIES IN access TABLE>
    
/a/private/bin/sql/dump//agua.2012-04-08-16:18:28.dump
    
    
</entry>
<entry [Sun 2012:03:18 20:47:04 EST] REPLACED OLD AMI WITH ERIDANUS-8 IN ami TABLE>

/a/private/bin/sql/dump/agua.2012-03-18-20:39:45.dump

BEFORE THIS, FIXED '%project%/...' ENTRIES IN stageparameter

agua.2012-03-18-17:41:18.dump
    
</entry>
<entry [Wed 2012:03:07 19:07:26 EST] ENABLED agua SHARED WORKFLOWS>

/a/private/bin/sql/dump/agua.2012-03-07-19:07:05.dump
    
</entry>
<entry [Thu 2012:02:09 18:08:53 EST] ADDED bioapps TO package TABLE>

/a/bin/sql/dump/agua.2012-02-09-18:07:49.dump
    
</entry>
<entry [Sat 2012:02:04 01:14:11 EST] FIXED apptype='false' IN PARAMETER TABLE>

/a/0.6/bin/sql/dump/agua.2012-02-04-01:13:41.dump
    
</entry>
<entry [Fri 2012:02:03 15:23:22 EST] CORRECTED APPTYPE 'alignment' TO 'aligner' IN parameter TABLE>
    
... TO CONCORD WITH app TABLE

update parameter set apptype ='aligner' where apptype='alignment';


/a/0.6/bin/sql/dump/agua.2012-02-03-15:23:07.dump

    
</entry>
<entry [Tue 2012:01:31 10:48:49 EST] CHANGED app LOCATION TO RELATIVE AND CORRECTD installdir IN app TABLE>

/a/0.6/bin/sql/dump/agua.2012-01-31-10:48:20.dump

</entry>
<entry [Thu 2012:01:26 19:06:03 EST] DUMPED agua AFTER FIXING FIELDS IN app TABLE>

/a/0.6/bin/sql/dump/agua.2012-01-26-19:05:18.dump


REDID AFTER REMOVING 3 EMPTY LINES:

/a/0.6/bin/sql/dump/agua.2012-01-26-19:05:18.dump


AND REDID AGAIN AFTER ADDING owner, version, installdir TO stage TABLE

/a/0.6/bin/sql/dump/agua.2012-01-27-02:44:11.dump


REMOVED testversion ENTRIES FROM package

/a/0.6/bin/sql/dump/agua.2012-01-27-21:51:17.dump



</entry>
<entry [Sun 2012:01:22 12:03:45 EST] DUMPED agua AFTER CHANGED installdir FIELD TO location AS A KEY>

/a/0.6/bin/sql/dump/agua.2012-01-22-12:02:49.dump

    
</entry>
<entry [Thu 2012:01:12 04:58:23 EST] DUMPED agua BEFORE TEST Agua::Common::Packages::defaultPackages>

/a/0.6/bin/scripts", $self-> ./dumpDb.pl --db agua --outputdir /a/0.6/bin/sql/dump

    /a/0.6/bin/sql/dump/agua.2012-01-12-04:58:08.dump
    
</entry>
<entry [Sun 2012:01:08 07:11:51 EST] DUMPED agua DATABASE>

/a/0.6/bin/scripts/dumpDb.pl (), "\
--db agua \
--outputdir /a/0.6/bin/sql/dump
    
    /a/0.6/bin/sql/dump/agua.2012-01-08-07:12:22.dump
        
    dumpDb.pl    Run time: 00:00:02
    dumpDb.pl    Completed /a/0.6/bin/scripts/dumpDb.pl
    7:12AM, 8 January 2012
    dumpDb.pl    ****************************************

    
</entry>
