import boto
import sys
import os

if len(sys.argv) != 1:
    print "usage: python create_bucket.py bucket"

bucket = sys.argv[1]
print "bucket: ", bucket

conn = boto.connect_s3()
print "conn: ", conn

directories = bucket.split("/")
print "directories: ", directories

currentpath = ""
for directory in directories:
    if currentpath == "":
        currentpath += directory
    else:
        currentpath += "/" + directory
    
    print "currentpath: ", currentpath
        
    try:
        conn.create_bucket(currentpath)
    except Exception:
        print "Failed to create bucket: ", currentpath

print "Created bucket: ", bucket
