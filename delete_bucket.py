import boto
import sys

if len(sys.argv) != 2:
    print "usage: python delete_bucket.py bucket"
    sys.exit(1)

bucket = sys.argv[1]

conn = boto.connect_s3()

try:
    bucket = conn.delete_bucket(bucket)
    print "Deleted bucket: ", bucket
except Exception:
    print "Failed to delete bucket as is not empty or does not exist"

