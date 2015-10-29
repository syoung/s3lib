import boto
import sys

if len(sys.argv) != 1:
    print "usage: python delete_file.py file"

target_file = sys.argv[1]

conn = boto.connect_s3()

try:
    bucket.delete_key(target_file)
except:
    print "Failed to delete file: ", target_file
