import boto
import sys

"""
Move an existing object to another location.

source_bucket     Bucket containing the existing object.
source_file       Name of the existing object.
target_bucket     Bucket to which the object is being copied.
target_file       The name of the new object.

LATER ADD:

metadata          A dict containing new metadata that you want
                  to associate with this object.  If this is None
                  the metadata of the original object will be
                  copied to the new object.
preserve_acl      If True, the ACL from the original object
                  will be copied to the new object.  If False
                  the new object will have the default ACL.
"""

print "len(sys.argv): ", len(sys.argv)
print "sys.argv[1]: ", sys.argv[1]
print "sys.argv[2]: ", sys.argv[2]
print "sys.argv[3]: ", sys.argv[3]
print "sys.argv[4]: ", sys.argv[4]

if len(sys.argv) != 5:
    print "usage: python source_bucket source_file target_bucket target_file"
    sys.exit(1)
    
source_bucket   =   sys.argv[1]
source_file     =   sys.argv[2]
target_bucket   =   sys.argv[3]
target_file     =   sys.argv[4]
metadata        =   None
preserve_acl    =   True

#### CONNECT
conn = boto.connect_s3()

#### CREATE TARGET BUCKET
conn.create_bucket(target_bucket)

#### COPY TO NEW FILE
bucket = conn.get_bucket(source_bucket)
key = bucket.lookup(source_file)
key.copy(target_bucket, target_file, metadata=metadata, preserve_acl=preserve_acl)

#### DELETE OLD FILE
bucket.delete_key(source_file)

