#!/usr/bin/env python
import boto
import os.path
import s3lib
import sys
import re

from multiprocessing import Pool
import multiprocessing
import multiprocessing.pool

class NoDaemonProcess(multiprocessing.Process):
    def _get_daemon(self):
        return False
    def _set_daemon(self, value):
        pass
    daemon = property(_get_daemon, _set_daemon)

class MyPool(multiprocessing.pool.Pool):
    Process = NoDaemonProcess


if len(sys.argv) != 3 and len(sys.argv) != 2:
    print "Usage: \ns3_download.py bucket key_name\n   OR   \ns3_download.py key_name_file"
    sys.exit()

file_list = {}

conn = boto.connect_s3()
if len(sys.argv) == 3:
    file_list[sys.argv[1]] = [sys.argv[2]]
else:
    if not os.path.isfile(sys.argv[1]):
        print "key name file %s does not exist"%(sys.argv[1])
        sys.exit()
    key_name_file = open(sys.argv[1], 'r')
    for line in key_name_file:
        line = line.rstrip('\r\n')
        if len(line) > 0:
            # i.e. s3://itmi.ptb.ea/key_name
            pattern = r's3:\/\/.+\/.+'
            if not re.match(pattern, line):
                print "key name pattern %s\ndoes not match standard formatting \"s3://bucket/keyname\""
                sys.exit()
            stripped = line.split("s3://")[1]
            tokens = stripped.split('/')
            bucketname = tokens[0]
            keyname = '/'.join(tokens[1:])
            try:
                bucket = conn.get_bucket(bucketname)
            except Exception, exc:
                print "Fatal Error: source bucket %s not found: exception %s"%(bucketname, exc)
                sys.exit()
            if not bucket.get_key(keyname):
                print "Fatal Error: source key %s not found in bucket %s"%(keyname, bucketname)
            if bucketname not in file_list:
                file_list[bucketname] = [keyname]
            else:
                file_list[bucketname].append(keyname)


cores = multiprocessing.cpu_count()
concurrency = 10

pool = MyPool(concurrency)

results = []
answers = []

for bucket in file_list.keys():
    for key in file_list[bucket]:
        localname = key.split('/')[-1]
        args = [bucket, key, localname, False, cores]
        results.append(pool.apply_async(s3lib.s3_download, args))

i = 0
for bucket in file_list.keys():
    for key in file_list[bucket]:
        answers.append(results[i].get(timeout=999999999))
        i += 1

pool.close()
pool.join()


