__author__ = "Deacon Sweeney"
__email__ = "dsweeney@scimentis.com"

import boto
import glob
import os.path
from boto.s3.key import Key
from subprocess import call
import os
import sys
import errno

from boto.s3.connection import S3Connection
import random
import re
import math
import mimetypes
import math

from filechunkio import FileChunkIO
import multiprocessing
from datetime import date
import time
import __builtin__
import socket
import datetime
import tempfile

import shutil

""" QUICK REFERENCE """

""" EXAMPLE """
"""
import s3lib

# some basic transfers
s3lib.s3_upload("./s3lib.py", "itmi.run.etc", "scripts/s3lib.py")
s3lib.s3_move("itmi.run.etc", "scripts/s3lib.py", "itmi.raw.etc", "scripts/s3lib.py")
s3lib.s3_download("itmi.run.rna", "00080e", "./00080e")

# example basic processing of a batch with testing afterward. Please do not run these commands
import boto
conn = boto.connect_s3()
# get the batch names sorted by date
batch_list = s3lib.get_sorted_batches_list("itmi.run.rna")
for batch in batch_list:
    # transfer all files in the bucket, renaming, and storing the new names in a mapping file
    transfer_vendor_folder_to_itmi_bucket("itmi.ptb.ea", "GlobinClear/%s"%(batch), "rna", "run")
    # next run fastqc and store the fastqc results in S3
    bucket = conn.get_bucket("itmi.run.rna")
    files = bucket.list(prefix="GlobinClear/%s"%(batch))
    bams = []
    for key in keys:
        if key.name.endswith("rsem.sorted.bam"):
            bams.append(key.name)
    for bam in bams:
        s3lib.s3_download("itmi.ptb.ea", bam, bam.split('/')[-1])
        os.system("./FastQC/fastqc --outdir=./fastqc_tmp %s"%(bam))
        s3lib.update_fastqc_results("rna", "./fastqc_tmp", bam, batch)
s3lib.remove_duplicate_mappings("itmi.run.rna", False)
s3lib.remove_unmapped_files("itmi.run.rna", False)

"""

""" TRANSFER FUNCTIONS """

# copy the key from source to destination bucket under a new name 
# s3_copy(source_bucket_name, source_keyname, dest_bucket_name, newkeyname, guess_mimetype=True, parallel_processes=8, headers={})

# remove a key from a bucket
# s3_remove(key, bucket_name)

# move a key from one bucket to another
# s3_move(source_bucket_name, keyname, dest_bucket_name, newkeyname, guess_mimetype=True, parallel_processes=8, headers={})

# upload a file
# s3_upload(source_path, bucketname, keyname, headers={}, guess_mimetype=True, parallel_processes=8)

# download a file
# s3_download(bucketname, keyname, dest_path, headers={}, parallel_processes=8)

# add the transfer record to the local log file
# s3_log_append(type, source, destination, size, start_time, total_time, passed_size_check, logfile="./s3lib.log")

""" UTILITY FUNCTIONS """

# transform participant ID to standard format
# sanitize_participant_ID(participant)

# fetch all keys from itmi.raw/run.* buckets
# get_full_names_list(conn)

# load a dictionary for transforming sample ID to participant ID
# get_ID_lookup()

# create a new random alphanumeric key name
# generate_unique_key(old_keys_dict)

# fetch a mapping file for the given bucket
# fetch_mapping(bucketname)

# collect file sizes for local files
# get_file_sizes(dirs)

# fetch the names of s3 keys from a bucket. returns a hash, keyed by key name
# fetch_s3_files(conn, bucket_name, pref=None)

# fetch sizes for a set of s3 keys. returns a hash, keyed by key name
# fetch_s3_sizes(conn, bucket_name, pref=None, skip_sizes=False, extension=None)

# fetch sizes and md5s for a set of s3 keys
# fetch_s3_sizes_and_md5s(conn, bucket_name, pref=None)

# query the vw_rtAWSFileDetails table for association between filename and itmisubjectID
# get_participant_for_file(some_file)

# query the vw_rtAWSFileDetails table for association between ISA sample code and itmisubjectID
# get_participant_for_ISA_code(ISA_code)

# query the requested <table> for association between <query> value of <value> and <result>
# get_result_from_table_where_query_equals_value(result, table, query, value)

# install sqlworkbench from S3:itmi.run.etc/scripts to the given directory
# install_sqlworkbench(dldir="~/tools")

# run fastqc then run this. extracts summary and adds to s3 summaries_file archive. uploads html report.
# update_fastqc_results(mol_type, results_dir, bam_name, batch_name)

# transfer vendor files to an itmi run or raw bucket. produces new unique alphanumeric keys and adds to the mapping
# transfer_vendor_folder_to_itmi_bucket(source_bucket_name, source_folder, moltype, runorraw)

# build a hash[batch][sampleID][filename] hash for all of the files in an itmi bucket, from its mapping file
# build_hash_for_files_in_itmi_bucket(bucketname)

# given a normal key name dir/batch/sampleID/file OR dir/batch/sampleID/dir/filename split into a 4 token list
# split_key_name(key_name)

# if vendor file not already mapped then add it to the mapping hash 
# is_file_already_mapped(key_name, mapped_hash)

# take the full listing of keys from the bucket and remove any that are not in the mapping
# remove_unmapped_files(bucketname, actually_delete=True)

# identify and remove any duplicate keys from the mapping file. Does not upload adjusted mapping file.
# remove_duplicate_mappings(bucketname, actually_delete=True)

# download the most recent Living Document manifest and return the first date that matches the provided batch
# get_batch_date(batchname)

# reads merged.bam.stats file for the list of provided stats
# get_bam_stats(bucketname, dir, stats)

# get a hash keyed by batch name holding date-sorted index. This is only for the itmi buckets
# get_sorted_batches(bucketname)

# get a list of batch names sorted by date. This is only for the itmi buckets
# get_sorted_batches_list(bucketname)

# reads the s3lib.conf file for login and password to the given resource (for now just redshift)
# get_credentials(which_credentials)


""" DOCUMENTATION """


"""
s3_copy(source_bucket_name, source_keyname, dest_bucket_name, newkeyname, guess_mimetype=True, parallel_processes=8, headers={})
    s3_copy requires a boto Key object, boto connect_s3 object, source and destination bucket names (strings), 
    and the new key name. The function can make a lazy guess at mimetype.

    Copy is performed in a parallelized manner. It uses MultiPartUpload.copy_part_from_key for the transfer, 
    and if this function throws an exception s3_copy retries up to a default of 10 times. If not all parts
    are transferred properly s3_copy cancels the upload and produces an error message. 


s3_remove(key, bucket_name) 
    s3_remove simply uses the boto bucket.delete_key function to remove a key
    requires a key object, a string for the bucket name, and a boto connect_s3 object


s3_move(source_bucket_name, keyname, dest_bucket_name, newkeyname, guess_mimetype=True, parallel_processes=8, headers={})
    s3_move uses the s3_copy function, followed by s3_delete. Before deleting the file size is compared between old 
    and new keys. If the file size is different s3_move produces an error message and exits. See s3_copy for a
    decription of arguments.


s3_upload(source_path, bucketname, keyname, headers={}, guess_mimetype=True, parallel_processes=8)
    s3_upload requires a destination bucket name, the path to the local file, a key name to store it under, and a 
    boto connect_s3 object. headers can be included and s3_upload can make a guess as to mimetype.

    For files over 50 Mb, multi-part upload is performed in a parallelized manner, with a default of 8 threads. It uses 
    MultiPartUpload.copy_part_from_key for the transfer, and if this function throws an exception s3_copy retries 
    up to a default of 10 times. If not all parts are transferred properly s3_copy cancels the upload and produces 
    an error message. 

s3_download(bucketname, keyname, dest_path, headers={}, guess_mimetype=True, parallel_processes=8)
    s3_upload requires source bucket and key names, the destination path, and a boto connect_s3 object. For files over
    50 Mb, multi-part download is performed in a parallel manner, with a default of 8 threads.

s3_log_append(source, destination, size, start_time, total_time, logfile="./s3lib.log")
    

sanitize_participant_ID(participant)
    sanitize_participant_ID removes _mg, mg, and transforms non-standard 4-token participant IDs into standard 3-token ones.
    Other transformations will likely be added, as more non-standard formats are discovered.


get_full_names_list(conn)
    fetch a dictionary of all of the alphanumerical keys from itmi.raw/run/* data buckets. Used for generating new keys 
    that do not collide with previously generated ones.


get_ID_lookup()
    the IDlookup file maps sample IDs to original participant IDs. This function returns a dictionary with sample IDs as 
    keys that hash the original IDs. To explain, there are a variety of formats that have been used to represent 
    participant. This file maps them all back to an original one. This will eventually be replaced with a network 
    call that maps to the data warehouse.


generate_unique_key(old_keys_dict)
    generate_unique_key produces a six character alphanumeric key that is the standard for storing data in the itmi.run/raw.* 
    buckets


fetch_mapping(bucketname)
    fetches a mapping file for the given bucket name. This function returns the filename where the mapping file was stored.
    The format of mapping file elements is the following set of strings, comma-delimited with no spaces:
    key - a six character alphanumeric string that is unique (among all itmi.raw/run.* buckets) to a file
    sample_ID - the participant ID used for this sample
    participant - the original ID for this participant
    batch - a string representing the group of samples that this sample was run with. also referred to as "card"
    basename - the original file name. If this file was originally located in a subdirectory of the sample directory
             (sample directory being located in batch directory) then the basename includes the subdirectory path


get_file_sizes(dirs)
    produces a data structure hierarchically organzied dictionaries with sizes stored as elements
    hierarchy is dict[batch][sample_ID][file basename] -> file size
    this function is used to conveniently collect local file sizes
    requires a list of directory paths to collect from. probably best to use absolute paths.


fetch_s3_sizes(conn, bucket_name, pref=None, skip_sizes=False, extension=None)
    fetch_s3_sizes returns a dictionary hashed by s3 key names and each key accesses its file size on S3
    skip_sizes is mostly for development testing purposes; collecting size information takes much time
    If extension is not None then only files with the included extension are collected.


fetch_s3_sizes_and_md5s(conn, bucket_name, pref=None)
    fetch_s3_sizes_and_md5s returns a dictionary hashed by s3 key names and each key accesses a list, where
    the first element in the list is file size on S3 and the second is the md5 calculated upon deposition
    on S3


get_participant_for_file(some_file)
    use a filename to query the vw_rptAWSFileDetails table in the data warehouse for its 
    associated itmiSubjectID field. This function uses the sqlworkbench.jar, and downloads it from
    an S3 bucket if necessary. Username and password are retrieved from a local s3lib.conf file.


get_participant_for_ISA_code(ISA_code)
    use an ISA code (e.g. ISA340678) to query the data warehouse for its associated itmiSubjectID field.
    This function uses the sqlworkbench.jar, and downloads it from an S3 bucket if necessary. Username
    and password are retrieved from a local s3lib.conf file.


get_result_from_table_where_query_equals_value(result, table, query, value)
    this is a generalized sql query tool, where the following query is made:
    select distinct <result> from <table> where <query>=<value>.

install_sqlworkbench(dldir="~/tools)
    this function is used internally by functions that query the redshift data warehouse. Fetches a 
    tarball from S3:itmi.run.etc/scripts and related postgres bindings, and installs the tool at
    the specified directory. To use this tool an s3lib.conf file should contain login credentials
    as specified here - https://atlassian-itmi.inova.org/confluence/display/BIOIN/s3lib.


update_fastqc_results(mol_type, results_dir, bam_name, batch_name)
    Provides all updates for once a fastqc report has been generated locally
    mol type is the standard bucket name dna, rna, mirna, methylation, results_dir is the 
    location of the fastqc results files, bam_name was the bam fastqc was run on, and 
    batch_name is the batch. 
   
    The function downloads the appropriate fastqc_summaries.txt file, unzips it, extracts
    and translates the summary of fastqc tests, adds them to the fastq_summaries, and uploads
    that file, overwriting the old one. The visual html report is also uploaded to 
    qc_reoprts/rna_all.


transfer_vendor_folder_to_itmi_bucket(source_bucket_name, source_folder, moltype, runorraw)
   Perform transfer and all updates to copy a set of vendor files to the designated itmi bucket.
   Downloads the mapping file and iterate through the vendor directory transferring and renaming
   with a unique six-character random alphanumerical code. Add the new mapping to the mapping file.
   Once all files are copied re-upload the mapping file, overwriting the old one.


build_hash_for_files_in_itmi_bucket(bucketname)
   Given a bucket name download the appropriate mapping file and create a hash for all 
   files included. Format is hash[batch][sample_ID][filename] = 0. Returns the hash.


split_key_name(key_name)
   Split the vendor key name into a four token set. This is typically used for sample 
   folders, where the vendor directory structure follows batch/sampleID/filename. If
   there is a single subdirectory in the sampleID folder, the subdirectory name and 
   each filename included in that subdirectory are concatenated. 

   This function fails if there are > 5 or < 4 tokens in the key name after split by '/'.


is_file_already_mapped(key_name, mapped_hash)
   If vendor file is already in the provided hash then returns True. If it is not
   then add it to the hash and returns the hash. Does not return the value False.
   This is used to ensure that no duplicates are added to the mapping file, for 
   instance if relaunching a vendor->itmi copy that was previously interrupted.


remove_unmapped_files(bucketname, actually_delete=True)
   Check each file in an itmi bucket to see if it was included
   in the mapping file for the bucket. If not in the mapping file
   then delete the key from the bucket. This is useful for removing
   copied files that were not added to the mapping, in the case of
   a directory transfer that was interrupted.


remove_duplicate_mappings(bucketname, actually_delete=True)
   Download the mapping file for the designated bucket and identify any keys in it that
   map to the same file. Remove bucket keys that are duplicates, saving the first to 
   appear in the mapping file. Remove the duplicate keys from the mapping file and upload
   it, overwriting the original.

   To simply view a list of duplicate files without actually deleting them, include False 
   as the second argument.


get_batch_date(batchname)
   Identify and download the most recent 'Living Document' manifest file. Go through the 
   lines of the file looking for the provided batch name. Return the date associated with 
   the first match.


get_bam_stats(bucketname, dir, stats)
   Requires a list of tokens from a '.merged.bam.stats' file, i.e. 'reads'
   for number of reads, 'pct align' for percent of reads aligned to reference, etc.
   Fetches the '.merged.bam.stats' file from the given bucket and directory
   and parses it to locate the requested statistics. Returns the set of statistics
   in the original order.


get_sorted_batches(bucketname)
   fetches the full list of batch names in the bucket, from the mapping file. Uses the 
   get_batch_date() function to produce a hash keyed by batch that stores each batches
   sorted index.


get_sorted_batches_list(bucketname)
   fetches the full list of batch names in the bucket, from the mapping file. Uses the 
   get_sorted_batches function to produce a list of batch names sorted by date.


get_credentials(which_credentials)
   looks for a local configuration file named s3lib.conf. If found it opens and retrieves
   login credentials username and password, which are returned as a two-element list. See
   online documentation for s3lib.conf format.

"""
 



""" FUNCTIONS """

def s3_copy(source_bucket_name, source_keyname, dest_bucket_name, newkeyname, guess_mimetype=True, parallel_processes=multiprocessing.cpu_count(), headers={}):
    conn = boto.connect_s3()
    start_time = "%s:%s"%(time.strftime("%d/%m/%Y"), time.strftime("%H:%M:%S"))
    t1 = time.time()
    try:
        sbucket = conn.get_bucket(source_bucket_name)
    except Exception, exc:
        print "Fatal Error: source bucket %s not found: exception %s"%(source_bucket_name, exc)
        sys.exit()    
    key = sbucket.get_key(source_keyname)
    if not key:
        print "Fatal Error in s3_copy: source key %s not found in bucket %s"%(key, sbucket)
        sys.exit()
    try:
        dbucket = conn.get_bucket(dest_bucket_name)
    except Exception, exc:
        print "Fatal Error: destination bucket %s not found: exeption %s"%(dest_bucket_name, exc)
        sys.exit()
    if guess_mimetype:
        mtype = mimetypes.guess_type(key.name)[0] or 'application/octet-stream'
        headers.update({'Content-Type':mtype})
    mp = dbucket.initiate_multipart_upload(newkeyname, headers=headers)
    source_size = key.size
    bytes_per_chunk = 30 * 1024 * 1024
    chunk_amount = int(math.ceil(source_size / float(bytes_per_chunk)))
    while chunk_amount > 1000:
        bytes_per_chunk += 5242880
        chunk_amount = int(math.ceil(source_size / float(bytes_per_chunk)))
    __builtin__.global_download_total = chunk_amount
    __builtin__.global_download_progress = 0

    size_mb = source_size / 1024 / 1024
    print "copying %s (%s) in %s chunks"%(source_size, size_mb, chunk_amount)
    pool = multiprocessing.Pool(processes=parallel_processes)

    start_time = "%s:%s"%(time.strftime("%d/%m/%Y"), time.strftime("%H:%M:%S"))
    for i in range(chunk_amount):
        offset = i * bytes_per_chunk
        remaining_bytes = source_size - offset
        bytes = min([bytes_per_chunk, remaining_bytes])
        part_num = i + 1
        pool.apply_async(_copy_part, [dest_bucket_name, mp.id, part_num, source_bucket_name, int(offset), int(bytes), conn, key, parallel_processes])
    pool.close()
    pool.join()
    if len(mp.get_all_parts()) == chunk_amount:
        mp.complete_upload()
    else:
        print "cancelling copy for %s - %d chunks uploaded, %d needed\n"%(source_keyname, len(mp.get_all_parts()), chunk_amount)
        mp.cancel_upload()
    print
    t2 = time.time()-t1
    source = "S3:%s:%s"%(source_bucket_name, source_keyname)
    destination = "S3:%s:%s"%(dest_bucket_name, newkeyname)
    size = dbucket.lookup(newkeyname).size
    total_time = t2
    if size == source_size:
        passed_size_check = True
    else:
        passed_size_check = False
    s3_log_append("s3_copy", source, destination, size, start_time, total_time, passed_size_check, logfile="./s3lib.log")
    print "Finished copying %0.2fM in %0.2fs (%0.2fmbps)"%(size/1024/1024, t2, 8*size_mb/t2)

def _copy_part(dest_bucket_name, multipart_id, part_num, source_bucket_name, offset, bytes, conn, key, threads, amount_of_retries=10):
    def _copy(retries_left=amount_of_retries):
        try:
            bucket = conn.get_bucket(dest_bucket_name)
            for mp in bucket.get_all_multipart_uploads():
                if mp.id == multipart_id:
                    mp.copy_part_from_key(source_bucket_name, key.name, part_num, offset, offset+bytes-1)
                    break
        except Exception, exc:
            print "failed partial upload, exception %s\nRetries left %s"%(exc, retries_left-1)
            if retries_left:
                _copy(retries_left=retries_left-1)
            else:
                raise exc
    _copy()
    import __builtin__
    __builtin__.global_download_progress += threads
    g = __builtin__.global_download_progress
    t = __builtin__.global_download_total
    sys.stdout.write("\rsomewhere around %d%% complete"%(int(100*g/(0.0+t))))
    sys.stdout.flush()


def s3_remove(key, bucket_name):
    conn = boto.connect_s3()
    try:
        b = conn.get_bucket(bucket_name)
    except Exception, exc:
        print "Fatal Error: source bucket %s not found, exception %s"%(bucket_name, exc)
        sys.exit()
    try:
        s = key.name
    except AttributeError:
        print "Fatal Error: s3_remove uses a key object as input, but no .name attribute on input key %s"%(key)
        sys.exit()
    key = b.get_key(key.name)
    if not key:
        print "Fatal Error in remove: source key %s not found in bucket %s"%(key.name, sbucket)
        sys.exit()
    
    b.delete_key(key)


def s3_move(source_bucket_name, keyname, dest_bucket_name, newkeyname, guess_mimetype=True, parallel_processes=multiprocessing.cpu_count(), headers={}):
    conn = boto.connect_s3()
    try:
        sb = conn.get_bucket(source_bucket_name)
    except Exception, exc:
        print "Fatal Error: source bucket %s not found, exception %s"%(source_bucket_name, exc)
        sys.exit()
    oldkey = sb.get_key(keyname)
    if not oldkey:
        print "Fatal Error in move: key %s not found in bucket %s"%(keyname, source_bucket_name)
        sys.exit()
    s3_copy(oldkey, conn, source_bucket_name, dest_bucket_name, newkeyname, guess_mimetype, parallel_processes, headers)
    db = conn.get_bucket(dest_bucket_name)
    newkey = db.get_key(newkeyname)
    if newkey.size == oldkey.size:
        s3_remove(oldkey, source_bucket_name, conn)
    else:
        print "Fatal S3 copy error"
        print "source key %s from %s size %s is different from destination key %s from %s size %s"%(oldkey.name, source_bucket_name, oldkey.size, newkey.name, dest_bucket_name, newkey.size)
        sys.exit()


def _upload_part(bucketname, multipart_id, part_num, source_path, offset, bytes, conn, threads, amount_of_retries=10):
    def _upload(retries_left=amount_of_retries):
        try:
            bucket = conn.get_bucket(bucketname)
            for mp in bucket.get_all_multipart_uploads():
                if mp.id == multipart_id:
                    with FileChunkIO(source_path, 'r', offset=offset, bytes=bytes) as fp:
                        mp.upload_part_from_file(fp=fp, part_num=part_num)
        except Exception, exc:
            print "failed multi-part upload attempt, exception %s"%(exc)
            sys.exit()
            if retries_left:
                _upload(retries_left=retries_left-1)
            else:
                raise exc
    _upload()
    import __builtin__
    __builtin__.global_download_progress += threads
    g = __builtin__.global_download_progress
    t = __builtin__.global_download_total
    sys.stdout.write("\rsomewhere around %d%% complete"%(int(100*g/(0.0+t))))
    sys.stdout.flush()


def s3_upload(source_path, bucketname, keyname, headers={}, guess_mimetype=True, parallel_processes=multiprocessing.cpu_count()):
    conn = boto.connect_s3()
    start_time = "%s:%s"%(time.strftime("%d/%m/%Y"), time.strftime("%H:%M:%S"))
    t1 = time.time()
    if not os.path.isfile(source_path):
        print "Fatal Error: source path %s does not exist or is not a file"%(source_path)
        sys.exit()
    source_size = os.stat(source_path).st_size
    bytes_per_chunk = 30 * 1024 * 1024
    try:
        bucket = conn.get_bucket(bucketname)
    except Exception, exc:
        print "Fatal Error: destination bucket %s does not exist - exception %s"%(bucketname, exc)
        sys.exit()

    if source_size <= bytes_per_chunk:
        k = boto.s3.key.Key(bucket)
        k.key = keyname
        b = k.set_contents_from_filename(source_path)
    else:
        if guess_mimetype:
            mtype = mimetypes.guess_type(keyname)[0] or 'application/octet-stream'
            headers.update({'Content-Type':mtype})
        mp = bucket.initiate_multipart_upload(keyname, headers=headers)
 
        chunk_amount = int(math.ceil(source_size / float(bytes_per_chunk)))

        while chunk_amount > 1000:
            bytes_per_chunk += 5242880
            chunk_amount = int(math.ceil(source_size / float(bytes_per_chunk)))
        __builtin__.global_download_total = chunk_amount
        __builtin__.global_download_progress = 0

        pool = multiprocessing.Pool(processes=parallel_processes) 
        size_mb = source_size / 1024 / 1024
        print "uploading %s (%s) in %s chunks"%(source_size, size_mb, chunk_amount)
        for i in range(chunk_amount):
            offset = i*bytes_per_chunk
            remaining_bytes = source_size - offset
            bytes = min([bytes_per_chunk, remaining_bytes])
            part_num = i + 1
            pool.apply_async(_upload_part, [bucketname, mp.id, part_num, source_path, offset, bytes, conn, parallel_processes])
        pool.close()
        pool.join()
        if len(mp.get_all_parts()) == chunk_amount:
            mp.complete_upload()
        else:
            print "canceling upload for %s - %d chunks uploaded, %d needed\n"%(source_path, len(mp.get_all_parts()), chunk_amount)
            mp.cancel_upload()
    print
    t2 = time.time()-t1
    source = "local:%s:%s"%(socket.gethostname(), source_path)
    destination = "S3:%s:%s"%(bucketname, keyname)
    size = conn.get_bucket(bucketname).lookup(keyname).size
    total_time = t2
    if source_size == size:
        passed_size_check = True
    else:
        passed_size_check = False
    s3_log_append("s3_upload", source, destination, size, start_time, total_time, passed_size_check, logfile="./s3lib.log")
    print "Finished uploading %0.2fM in %0.2fs (%0.2fmbps)"%(size/1024/1024, t2, 8*size/t2)


def _download_part(args):
    conn, bucketname, keyname, fname, split, min_byte, max_byte, max_tries, current_tries, threads, quiet = args
    resp = conn.make_request("GET", bucket=bucketname, key=keyname, headers={'Range':"bytes=%d-%d"%(min_byte, max_byte)})
    fd = os.open(fname, os.O_WRONLY)
    os.lseek(fd, min_byte, os.SEEK_SET)
    chunk_size = min((max_byte-min_byte), split*1024*1024)
    s=0
    try:
        while True:
            data = resp.read(chunk_size)
            if data == "":
                break
            os.write(fd, data)
            s += len(data)
        os.close(fd)
        s = s / chunk_size
    except Exception, err:
        if (current_tries > max_tries):
            print "Error downloading, %s"%(err)
            sys.exit()
        else:
            time.sleep(3)
            current_tries += 1
            _download_part((conn, bucketname, keyname, fname, split, min_byte, max_byte, max_tries, current_tries, threads, quiet))
    import __builtin__
    __builtin__.global_download_progress += threads
    g = __builtin__.global_download_progress
    t = __builtin__.global_download_total
    if not quiet:
        sys.stdout.write("\rsomewhere around %d%% complete"%(int(100*g/(0.0+t))))
        sys.stdout.flush()

def _gen_byte_ranges(size, num_parts):
    part_size = int(math.ceil(1. * size / num_parts))
    for i in range(num_parts):
    #for i in range(50, 60):
        yield(part_size*i, min(part_size*(i+1)-1, size-1), i)

def s3_download(bucketname, keyname, dest_path, quiet=False, parallel_processes=multiprocessing.cpu_count(), headers={}, guess_mimetype=True):
    conn = boto.connect_s3()
    split = 30
    max_tries = 3
    try:
        bucket = conn.get_bucket(bucketname)
    except Exception, exc:
        print "Fatal Error: source bucket %s not found, exception %s"%(bucketname, exc)
        sys.exit()
    bytes_per_chunk = split * 1024 * 1024
    key = bucket.get_key(keyname)
    if not key:
        print "Fatal Error in download: key %s not found in bucket %s"%(keyname, bucketname)
        sys.exit()
    start_time = "%s:%s"%(time.strftime("%d/%m/%Y"), time.strftime("%H:%M:%S"))
    if '/' in dest_path and not os.path.isdir(os.path.dirname(dest_path)):
        print "Fatal Error: destination path %s does not exist"%(os.path.basename(dest_path))
        sys.exit()
    if os.path.isdir(dest_path):
        print "Fatal Error: please supply file name in directory %s to store the file"%(dest_path)
        sys.exit()
        
    source_size = key.size
    size_mb = source_size / 1024 / 1024
    t1 = time.time()
    num_parts = (size_mb+(-size_mb%split))//split
    while num_parts > 1000:
        split += 5
        num_parts = (size_mb+(-size_mb%split))//split
    __builtin__.global_download_total = num_parts
    __builtin__.global_download_progress = 0
    if not quiet:
        print "downloading %s (%s) in %s chunks"%(key.size, size_mb, num_parts)
    if source_size <= bytes_per_chunk:
        try:
            key.get_contents_to_filename(dest_path)
        except Exception, exc:
            print "problem downloading key %s - exception %s"%(keyname, exc)
    else:
        resp = conn.make_request("HEAD", bucket=bucket, key=key)
        if resp is None:
            raise ValueError("s3 response is invalid for bucket %s key %s"%(bucket, key))
        fd = os.open(dest_path, os.O_CREAT)
        os.close(fd)

        def arg_iterator(num_parts):
            for min_byte, max_byte, part in _gen_byte_ranges(source_size, num_parts):
                yield(conn, bucket.name, key.name, dest_path, split, min_byte, max_byte, max_tries, 0, parallel_processes, quiet)
        pool = multiprocessing.Pool(processes = parallel_processes)
        p = pool.map_async(_download_part, arg_iterator(num_parts))
        pool.close()
        pool.join()
        p.get(9999999)
        if not quiet:
            print
    t2 = time.time()-t1
    source = "S3:%s:/%s"%(bucketname, keyname)
    destination = "local:%s:%s"%(socket.gethostname(), dest_path)
    size = os.stat(dest_path).st_size
    total_time = t2
    if size == source_size:
        passed_size_check = True
    else:
        passed_size_check = False
    s3_log_append("s3_download", source, destination, size, start_time, total_time, passed_size_check, logfile="./s3lib.log")

    if not quiet:
        print "Finished downloading %0.2fM in %0.2fs (%0.2fmbps)"%(size_mb, t2, 8*size_mb/t2)


def s3_log_append(type, source, destination, size, start_time, total_time, passed_size_check, logfile="./s3lib.log"):
    f = None
    if os.path.isfile(logfile):
        f = open(logfile, 'a')
    else:
        f = open(logfile, 'w')
    h_size = 0
    if size > 1024*1024*1024:
        h_size = "%0.2fGb"%(size/(0.0+1024*1024*1024))
    elif size > 1024*1024:
        h_size = "%0.2fMb"%(size/(0.0+1024*1024))
    elif size > 1024:
        h_size = "%0.2fkb"%(size/(0.0+1024))
    else:
        h_size = "%0.2f"%(size)
    outlines = []
    outlines.append("%s\n"%(type))
    outlines.append("\tsource: %s\n"%(source))
    outlines.append("\tdestination: %s\n"%(destination))
    outlines.append("\tbytes transferred: %s (%s)\n"%(size, h_size))
    outlines.append("\tstart time: %s\n"%(start_time))
    outlines.append("\ttotal time: %0.3f\n"%(total_time))
    outlines.append("\tmbps: %0.2f\n"%(((size*8)/total_time)/1024/1024))
    outlines.append("\tpassed size check: %s\n"%(passed_size_check))
    f.writelines(outlines)
    f.close()
    

def sanitize_participant_ID(participant):
    if participant.endswith('_s'):
        participant = participant[:-2]
    if participant.endswith('s'):
        participant = participant[:-1]
    if '_mg' in participant:
        participant = participant.split('_mg')[0]
    if 'mg' in participant:
        participant = participant.split('mg')[0]
    if re.match("(\d{3})-(\d{2})-(\d{5})-(\d{2}).*", participant):
        tokens = participant.split('-')
        participant = "%s-%s-%s"%(tokens[0], tokens[2], tokens[3])
    return participant

def get_full_names_list(conn):
    full_names_list = {}
    for type in ["rna", "mirna", "dna", "methylation"]:
        for phase in ["raw", "run"]:
            mybucket = conn.get_bucket("itmi.%s.%s"%(phase, type))
            for name in mybucket.list():
                full_names_list[name] = 0
    return full_names_list

def get_ID_lookup():
    if not os.path.exists("./IDlookup.csv"):
        conn = boto.connect_s3()
        etc_bucket = conn.get_bucket("itmi.raw.etc")
        key = boto.s3.Key(etc_bucket)
        key.name = "IDlookup.csv"
        key.get_contents_to_filename("IDlookup.csv")

    IDfile = open("IDlookup.csv", 'r')
    IDlookup = {}
    for line in IDfile:
        tokens = line.rstrip('\r\n').split(',')
        IDlookup[tokens[0]] = tokens[1]
    return IDlookup

def generate_unique_key(old_keys_dict):
    while True:
        rkey = ''
        for i in range(6):
            rkey += random.choice('0123456789abcdefghijklmnopqrstuvwxyz')
        if rkey not in old_keys_dict.keys():
            break
    return rkey

def fetch_mapping(bucketname, dated=False):
    # is in etc not raw/run
    conn = boto.connect_s3()
    tokens = bucketname.split('.')
    mapping_bucketname = '.'.join([tokens[0], tokens[1], 'etc'])
    try:
        bucket = conn.get_bucket(mapping_bucketname)
    except Exception as e:
        print "bucket %s not found. exception %s"%(mapping_bucketname, e)
        sys.exit()
    map_key = Key(bucket)
    map_file_name = ""
    if not dated:
        map_file_name = "%s_name_mapping.txt"%(bucketname)
    else:
        t = date.today()
        map_file_name = "%s_name_mapping.%s.%s.%s.txt"%(bucketname, t.month, t.day, t.year)

    map_key.key = map_file_name
    try:
        map_key.get_contents_to_filename(map_key.key)
    except Exception as e:
        print "%s key not found. Creating new."%(map_file_name)
        open(map_file_name, 'w').close()
    return map_file_name

def get_file_sizes(dirs):
    local_sizes = {}
    all_files = []
    for dir in dirs:
        all_files += glob.glob(dir)
    dir = dirs[0].split('/*')[0]
    for f in all_files:
        if os.path.isdir(f):
            continue
        tokens = f.split(dir)[1].split('/')
        (batch, participant, basename) = tokens[1:4]
        if len(tokens) > 4:
            basename = "%s/%s"%(tokens[3], tokens[4])
        if len(tokens) != 4 and len(tokens) != 5:
            print tokens
        if batch not in local_sizes:
            local_sizes[batch] = {participant:{basename:[os.path.getsize(f), f]}}
        else:
            if participant not in local_sizes[batch]:
                local_sizes[batch][participant] = {basename:[os.path.getsize(f), f]}
            else:
                local_sizes[batch][participant][basename] = [os.path.getsize(f), f]
    return local_sizes

def fetch_s3_files(conn, bucket_name, pref=None):
    return fetch_s3_sizes(conn, bucket_name, pref, True)

def fetch_s3_sizes(conn, bucket_name, pref=None, skip_sizes=False, extension=None):
    bucket = conn.get_bucket(bucket_name)
    s3_sizes = {}
    t = None
    if pref:
        t = bucket.list(prefix=pref)
    else:
        t = bucket.list()
    for name in t:
        if extension == None or not name.name.endswith(extension):
            continue
        try:
            s3_sizes[str(name.name)]
        except KeyError:
            if skip_sizes == True:
                s3_sizes[str(name.name)] = 1
            else:
                s3_sizes[str(name.name)] = bucket.lookup(name.name).size
        else:
            print "found duplicate s3 key %s"%(name.name)
    return s3_sizes

def fetch_s3_sizes_and_md5s(conn, bucket_name, pref=None):
    rna_run_bucket = conn.get_bucket(bucket_name)
    s3_sizes = {}
    t = None
    if pref:
        t = rna_run_bucket.list(prefix=pref)
    else:
        t = rna_run_bucket.list()
    for name in t:
        try:
            s3_sizes[str(name.name)]
        except KeyError:
            try:
                k = rna_run_bucket.get_key(name.name)
            except:
                pass # is a directory
            else:
                s3_sizes[str(name.name)] = [k.size, k.etag[1:-1]]
        else:
            print "found duplicate s3 key %s"%(name.name)
    return s3_sizes


def get_participant_for_file(some_file):
    install_sqlworkbench()
    (login, pw) = get_credentials("redshift")
    (fd, fname) = tempfile.mkstemp()
    homedir = os.path.expanduser('~')
    os.system("java -jar %s/tools/sqlworkbench/sqlworkbench.jar -url=jdbc:postgresql://itmi-dw-cl1.coywdnparoka.us-east-1.redshift.amazonaws.com:5439/imisawsdw?tcpKeepAlive=true -driverjar=%s/tools/sqlworkbench/postgresql-9.4-1201.jdbc41.jar -username=%s -password=%s -displayResult=true -command=\"select distinct itmisubjectID from vw_rptAWSFileDetails where itmifilename='%s'\" > %s"%(homedir, homedir, login, pw, some_file, fname))

    f = os.fdopen(fd, 'r')
    get_next_line = 0
    participant = ""
    for line in f:
        if get_next_line == 1:
            participant = line.rstrip('\r\n ')
            break
        if get_next_line == 0 and line.rstrip('\r\n').startswith("---"):
            get_next_line = 1
    f.close()
    os.remove(fname)
    return participant

def get_participant_for_ISA_code(ISA_code):
    install_sqlworkbench()
    (login, pw) = get_credentials("redshift")
    (fd, fname) = tempfile.mkstemp()
    homedir = os.path.expanduser('~')
    os.system("java -jar %s/tools/sqlworkbench/sqlworkbench.jar -url=jdbc:postgresql://itmi-dw-cl1.coywdnparoka.us-east-1.redshift.amazonaws.com:5439/imisawsdw?tcpKeepAlive=true -driverjar=%s/tools/sqlworkbench/postgresql-9.4-1201.jdbc41.jar -username=%s -password=%s -displayResult=true -command=\"select distinct itmisubjectID from vw_rptAWSFileDetails where itmifilename LIKE '%s%%'\" > %s"%(homedir, homedir, login, pw, ISA_code, fname))

    f = os.fdopen(fd, 'r')
    get_next_line = 0
    participant = ""
    for line in f:
        if get_next_line == 1:
            participant = line.rstrip('\r\n ')
            break
        if line.rstrip('\r\n').startswith("---"):
            get_next_line = 1
    f.close()
    os.remove(fname)
    return participant    

def get_result_from_table_where_query_equals_value(result, table, query, value):
    install_sqlworkbench()
    (login, pw) = get_credentials("redshift")
    (fd, fname) = tempfile.mkstemp()
    homedir = os.path.expanduser('~')
    os.system("java -jar %s/tools/sqlworkbench/sqlworkbench.jar -url=jdbc:postgresql://itmi-dw-cl1.coywdnparoka.us-east-1.redshift.amazonaws.com:5439/imisawsdw?tcpKeepAlive=true -driverjar=%s/tools/sqlworkbench/postgresql-9.4-1201.jdbc41.jar -username=%s -password=%s -displayResult=true -command=\"select distinct %s from %s where %s='%s%%'\" > %s"%(homedir, homedir, login, pw, result, table, query, value, fname))

    f = os.fdopen(fd, 'r')
    get_next_line = 0
    participant = ""
    for line in f:
        if get_next_line == 1:
            participant = line.rstrip('\r\n ')
            break
        if line.rstrip('\r\n').startswith("---"):
            get_next_line = 1
    f.close()
    os.remove(fname)
    return participant    



def get_participant_for_shipmentID(shipmentID):
    install_sqlworkbench()
    (login, pw) = get_credentials("redshift")
    (fd, fname) = tempfile.mkstemp()
    homedir = os.path.expanduser('~')
    os.system("java -jar %s/tools/sqlworkbench/sqlworkbench.jar -url=jdbc:postgresql://itmi-dw-cl1.coywdnparoka.us-east-1.redshift.amazonaws.com:5439/imisawsdw?tcpKeepAlive=true -driverjar=%s/tools/sqlworkbench/postgresql-9.4-1201.jdbc41.jar -username=%s -password=%s -displayResult=true -command=\"select distinct itmisubjectID from vw_rptSpecimenDetail where shipmentID='%s'\" > %s"%(homedir, homedir, login, pw, shipmentID, fname))

    f = os.fdopen(fd, 'r')
    get_next_line = 0
    participant = ""
    for line in f:
        if get_next_line == 1:
            participant = line.rstrip('\r\n ')
            break
        if line.rstrip('\r\n').startswith("---"):
            get_next_line = 1
    f.close()
    os.remove(fname)
    return participant    

def install_sqlworkbench(dldir="~/tools"):
    if dldir.startswith('~'):
        tokens = dldir.split('/')
        homedir = os.path.expanduser('~')
        dldir = '/'.join([homedir] + tokens[1:])
    try:
        os.makedirs(dldir)
    except OSError as exc:
        if exc.errno == errno.EEXIST and os.path.isdir(dldir):
            pass
        else:
            raise
    if not os.path.exists("%s/sqlworkbench/sqlworkbench.jar"%(dldir)):
        s3_download("itmi.run.etc", "scripts/sqlworkbench.tar.gz", "%s/sqlworkbench.tar.gz"%(dldir))
        #os.system("gunzip -f %s/sqlworkbench.tar.gz"%(dldir))
        cwd = os.getcwd()
        os.chdir(dldir)
        os.system("tar -xzf %s/sqlworkbench.tar.gz"%(dldir))
	os.chdir(cwd)
    if not os.path.exists("%s/sqlworkbench/postgresql-9.4-1201.jdbc41.jar"%(dldir)):
        s3_download("itmi.run.etc", "scripts/postgresql-9.4-1201.jdbc41.jar", "%s/postgresql-9.4-1201.jdbc41.jar"%(dldir))
        
    
def update_fastqc_results(mol_type, results_dir, bam_name, batch_name):
    summaries_filename = "itmi.run.%s_fastqc_summaries.txt"%(mol_type)
    s3_download("itmi.run.etc", "itmi.run.%s_fastqc_summaries.txt"%(mol_type), summaries_filename)
    os.system("unzip -d %s %s/*.zip"%(results_dir, results_dir))
    bamless = bam_name.split(".bam")[0]
    # upload the html report
    s3_upload("%s/%s_fastqc.html"%(results_dir, bamless), "itmi.raw.etc", "qc_reports/%s_all/%s_fastqc.html"%(mol_type, bamless))
    # collect the summary in 1,0,-1 notation
    summary_file = open("%s/%s_fastqc/summary.txt"%(results_dir, bamless), 'r')
    test_results = []
    for line in summary_file:
        if line.split('\t')[0] == 'PASS':
            test_results.append('1')
        elif line.split('\t')[0] == 'WARN':
            test_results.append('0')
        elif line.split('\t')[0] == 'FAIL':
            test_results.append('-1')
    sample_ID = bam_name.replace('_', '.').split('.')[0]
    sample_ID = sanitize_participant_ID(sample_ID)
    participant = get_participant_for_file(bam_name)
    t = test_results
    summary_outline = "%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s\n"%(sample_ID, t[0], t[1], t[2], t[3], t[4], t[5], t[6], t[7], t[8], t[9], t[10], t[11], batch_name, bam_name)
    summaries_file = open(summaries_filename, 'a')
    summaries_file.write(summary_outline)
    summaries_file.close()
    s3_upload(summaries_filename, "itmi.run.etc", "itmi.run.%s_fastqc_summaries.txt"%(mol_type))


def transfer_vendor_folder_to_itmi_bucket(source_bucket_name, source_folder, moltype, runorraw):
    conn = boto.connect_s3()
    allnames = get_full_names_list(conn)
    dest_bucket_name = "itmi.%s.%s"%(runorraw, moltype)
    source_bucket = conn.get_bucket(source_bucket_name)
    keylist = source_bucket.list(prefix=source_folder)

    # make sure we don't duplicate copies
    bhash = build_hash_for_files_in_itmi_bucket("itmi.%s.%s"%(runorraw, moltype))
    mapping_filename = fetch_mapping(dest_bucket_name)
    mapping_file = open(mapping_filename, 'a')

    skipcounter = 0
    for key in keylist:
        (dir, batch, sample_ID, filename) = split_key_name(key.name)
        if batch in bhash and sample_ID in bhash[batch] and filename in bhash[batch][sample_ID]:
            skipcounter += 1
            continue
        if '/' in filename:
            fn = filename.split('/')[1]
        else:
            fn = filename
        participant = get_participant_for_file(fn)
        newkey = generate_unique_key(allnames)
        allnames[newkey] = 0
        mapping_line = str("%s,%s,%s,%s,%s\n"%(newkey, sample_ID, participant, batch, filename))
        mapping_file.write(mapping_line)
        s3_copy(source_bucket_name, key.name, dest_bucket_name, newkey)
    if skipcounter > 0:
        print "skipped %s duplicate files from %s %s"%(skipcounter, batch, sample_ID)
    mapping_file.close()
    s3_upload(mapping_filename, "itmi.%s.etc"%(runorraw), mapping_filename)

def build_hash_for_files_in_itmi_bucket(bucketname):
    conn = boto.connect_s3()
    mapping_filename = fetch_mapping(bucketname)
    mapped_hash = {}
    f = open(mapping_filename, 'r')
    for line in f:
        (key, sample_ID, participant, batch, filename) = line.rstrip('\r\n').split(',')
        if batch not in mapped_hash:
            mapped_hash[batch] = {sample_ID:{filename:0}}
        else:
            if sample_ID not in mapped_hash[batch]:
                mapped_hash[batch][sample_ID] = {filename:0}
            else:
                mapped_hash[batch][sample_ID][filename] = 0
    return mapped_hash


def split_key_name(key_name):
    tokens = key_name.split('/')
    if len(tokens) == 5:
        (dir, batch, sample_ID, filenamedir, filename) = tokens
        filename = "%s/%s"%(filenamedir, filename)
        return_tuple = (dir, batch, sample_ID, filename)
    elif len(tokens) == 4:
        (dir, batch, sample_ID, filename) = tokens
        return_tuple = (dir, batch, sample_ID, filename)
    elif len(tokens) == 3:
        (dir, batch, filename) = tokens
        return_tuple = (dir, batch, filename)
    else:
        print "no key name parsing schema available for %s"%(key_name)
        sys.exit()
    return return_tuple


def is_file_already_mapped(key_name, mapped_hash):
    (dir, batch, sample_ID, filename) = split_key_name(key_name)
    if batch in mapped_hash:
        if sample_ID in mapped_hash[batch]:
            if filename in mapped_hash[batch][sample_ID]:
                return True
            else:
                mapped_hash[batch][sample_ID][filename] = 0
        else:
            mapped_hash[batch][sample_ID] = {filename:0}
    else:
        mapped_hash[batch] = {sample_ID:{filename:0}}
    return mapped_hash


def remove_raw_from_run(run_bucketname, raw_bucketname, actually_delete=True):
    conn = boto.connect_s3()
    run_locs = {}
    run_mapping_filename = fetch_mapping(run_bucketname)
    for line in open(run_mapping_filename):
        line = line.rstrip('\r\n')
        loctoks = line.split(',')[-1].split('/')[2:]
        loc = '/'.join(loctoks)
        if loc not in run_locs:
            run_locs[loc] = [line]
        else:
            run_locs[loc].append(line)

    raw_locs = {}
    raw_mapping_filename = fetch_mapping(raw_bucketname)
    for line in open(raw_mapping_filename):
        line = line.rstrip('\r\n')
        loctoks = line.split(',')[-1].split('/')[2:]
	loc = '/'.join(loctoks)
        raw_locs[loc] = line
    
    conn = boto.connect_s3()
    bucket = conn.get_bucket(run_bucketname)

    for raw_loc in raw_locs.keys():
        if raw_loc in run_locs:
            print "found raw %s in run bucket, %s mappings"%(raw_loc, len(run_locs[raw_loc]))
            if actually_delete:
                for run_line in run_locs[raw_loc]:
                    key = run_line.split(',')[0]
                    print "deleting key %s from bucket %s"%(key, run_bucketname)
                    bucket.delete_key(key)

    if actually_delete:
        remove_mappings_with_no_files(run_bucketname, actually_delete)


def remove_mappings_with_no_files(bucketname, actually_delete=True):
        conn = boto.connect_s3()
        bucketfilename = fetch_mapping(bucketname)
        bucket = conn.get_bucket(bucketname)
        outlines = []
        for line in open(bucketfilename, 'r'):
            keyname = line.split(',')[0]
            key = bucket.get_key(keyname)
            if key:
                outlines.append(line)
            else:
                print "no file found for %s"%(line)
        if actually_delete:
            shutil.copyfile(bucketfilename, "%s_backup"%(bucketfilename))
            f = open(bucketfilename, 'w')
            f.writelines(outlines)
            f.close()
            print "upload %s %s %s"%(bucketfilename, bucketname, bucketfilename)
            target_bucket = "itmi.run.etc"
            if ".raw." in bucketname:
                target_bucket = "itmi.raw.etc"
            s3_upload(bucketfilename, target_bucket, bucketfilename)

def remove_unmapped_files(bucketname, actually_delete=True):
    conn = boto.connect_s3()
    mapped_keys = {}
    mapping_filename = fetch_mapping(bucketname)
    for line in open(mapping_filename):
        mapped_keys[line.split(',')[0]] = 0
    bucket = conn.get_bucket(bucketname)
    ls = bucket.list()
    rmkeys = []
    for key in ls:
        if key.name not in mapped_keys:
            if actually_delete == True:
                #if not key.name.endswith(".bam"):
                bucket.delete_key(key.name)
                rmkeys.append(key.name)
            else:
                rmkeys.append(key.name)
    if actually_delete:
        print "removed keys: ",
    else:
        print "unmapped keys: ",
    for rmkey in rmkeys:
        print "%s "%(rmkey)


def remove_duplicate_mappings(bucketname, actually_delete=True):
    conn = boto.connect_s3()
    mapping_filename = fetch_mapping(bucketname)
    bucket = conn.get_bucket(bucketname)
    mapped_hash = {}
    f = open(mapping_filename, 'r')
    outlines = []
    write_this_one = 1
    for line in f:
        try:
            (key, sample_ID, participant, batch, filename) = line.rstrip('\r\n').split(',')
        except ValueError:
            tokens = line.rstrip('\r\n').split(',')
            if len(tokens) == 4:
                (key, sample_ID, batch, filename) = tokens
                participant = sample_ID
            elif len(tokens) > 5:
                (key, sample_ID, participant, batch) = tokens[0:4]
                filename_tokens = tokens[4:]
                filename = '/'.join(tokens[4:])
        if batch not in mapped_hash:
            mapped_hash[batch] = {sample_ID:{filename:0}}
        else:
            if sample_ID not in mapped_hash[batch]:
                mapped_hash[batch][sample_ID] = {filename:0}
            else:
                if filename not in mapped_hash[batch][sample_ID]:
                    mapped_hash[batch][sample_ID][filename] = 0
                else:
                    if actually_delete == True:
                        bucket.delete_key(key)
                        write_this_one = 0
                    else:
                        print "removing file %s, %s, %s, %s, %s"%(key, sample_ID, participant, batch, filename)
        if write_this_one == 1:
            outlines.append(line)
        else:
            write_this_one = 1
    f.close()
    if actually_delete == True:
        f = open(mapping_filename, 'w')
        f.writelines(outlines)
        f.close()
        target_bucket = ""
        if "run" in bucketname:
            target_bucket = "itmi.run.etc"
        elif "raw" in bucketname:
            target_bucket = "itmi.raw.etc"
        s3_upload("%s_name_mapping.txt"%(bucketname), target_bucket, "%s_name_mapping.txt"%(bucketname))
    return mapped_hash


def get_batch_date(batchname, bucketname="itmi.ptb.ea"):
    if batchname == "EA5127_102_6867":
        return "2015-02-25 00:00:00"
    conn = boto.connect_s3()
    bucket = conn.get_bucket("itmi.ptb.ea")
    ls = bucket.list(prefix="Living_Document")
    lis = []
    for item in ls:
        lis.append(item)
    lis.sort(cmp = lambda x, y: cmp(x.last_modified, y.last_modified))
    rmdoc = False
    if not os.path.isfile("./Living_Document"):
        rmdoc = True
    s3_download("itmi.ptb.ea", lis[-1].name, "Living_Document", True)
    f = open("./Living_Document", 'r')
    for line in f:
        tokens = line.split('\t')
        if tokens[3] == batchname or tokens[3].split('_')[0] == batchname:
            f.close()
            if rmdoc:
                os.remove("./Living_Document")
            return tokens[4]
    f.close()
    if rmdoc:
        os.remove("./Living_Document")
    return False
        

def get_bam_stats(bucketname, dir, stats):
    conn = boto.connect_s3()
    bucket = conn.get_bucket(bucketname)
    ls = bucket.list(prefix=dir)
    target = ""
    for key in ls:
        if key.name.endswith(".merged.bam.stats") or key.name.endswith("sam.stats"):
            target = key.name
    if len(target) > 0:
        s3_download("itmi.ptb.ea", target, "/tmp/bamstats_tmp", True)
    try:
        f = open("/tmp/bamstats_tmp", 'r')
    except IOError:
        print "failed download on %s at %s"%(target, dir)
        sys.exit()
    retvals = []
    for line in f:
        tokens = line.split('\t')
        for stat in stats:
            if tokens[0] == stat:
                retvals.append(tokens[1].rstrip('\r\n'))
    f.close()
    os.remove("/tmp/bamstats_tmp")
    return retvals

def get_sorted_batches(bucketname):
    conn = boto.connect_s3()
    bucket = conn.get_bucket(bucketname)
    mapping_hash = build_hash_for_files_in_itmi_bucket(bucketname)
    batch_dates = []
    batch_dates_hash = {}
    batch_hash  = {}
    for batch in mapping_hash.keys():
        if batch == "EA5088_102":
            batch_date = "2014-07-28 00:00:00"
        else:
            batch_date = get_batch_date(batch)
        if not batch_date:
            print "error retrieving date for batch %s"%(batch)
        batch_date = batch_date.split(' ')[0]
        batch_dates_hash[batch_date] = 0
        batch_hash[batch] = batch_date
    batch_dates = batch_dates_hash.keys()
    batch_dates.sort(key=lambda x: datetime.datetime.strptime(x, '%Y-%m-%d'))
    return_set = {}
    i = 0
    for batch_date in batch_dates:
        for key in batch_hash.keys():
            if batch_hash[key] == batch_date:
                return_set[key] = i
                i += 1
    return return_set

def get_sorted_batches_list(bucketname):
    sorted_hash = get_sorted_batches(bucketname)
    max = -1
    min = len(sorted_hash.keys())+1
    for k in sorted_hash.keys():
        if sorted_hash[k] > max:
            max = sorted_hash[k]
        if sorted_hash[k] < min:
            min = sorted_hash[k]
    return_set = []
    for i in range(min, max):
        for k in sorted_hash.keys():
            if sorted_hash[k] == i:
                return_set.append(k)
    return return_set

def get_credentials(which_credentials):
    confloc = None
    if os.path.isfile(".s3lib"):
        confloc = ".s3lib"
    elif os.path.isfile(os.path.join(os.path.expanduser("~"), ".s3lib")):
        confloc = os.path.join(os.path.expanduser("~"), ".s3lib")
    else:
        print "Fatal Error: No .s3lib file found in cwd or ~. See documentation for help."
        sys.exit()
    f = open(confloc, 'r')
    found_it = 0
    login = None
    pw = None
    for line in f:
        if line.rstrip('\r\n') == which_credentials:
            found_it = 1
        if found_it == 1:
            if pw and login:
                break
            if line.startswith("pw"):
                pw = line.split()[1]
            if line.startswith("login"):
                login = line.split()[1]
    if not pw:
        print "Fatal Error: no password found in ./s3lib.conf for %s"%(which_credentials)
        sys.exit()
    if not login:
        print "Fatal Error: no login found in ./s3lib.conf for %s"%(which_credentials)
        sys.exit()
    return [login, pw]

def check_md5_for_file(local_file_name, original_bucket, original_loc):
    if not os.path.isfile(local_file_name):
        print "file %s could not be found, exiting"%(local_file_name)

    (fd, fname) = tempfile.mkstemp()
    os.system("md5sum %s > %s"%(local_file_name, fname))
    f = os.fdopen(fd, 'r')
    checksum = None

    for line in f:
        tokens = line.rstrip('\r\n').split()
        checksum = tokens[0]
        break

    conn = boto.connect_s3()
    bucket = conn.get_bucket(original_bucket)
    key = bucket.get_key(original_loc)
    remote_md5 = None
    if not key:
        print "key %s not found in bucket %s"%(original_loc, original_bucket)
    else:
        try:
            remote_md5 = key.etag[1:-1]
        except TypeError:
            print "no md5 found for file %s bucket %s"%(original_loc, original_bucket)
    f.close()
    os.remove(fname)
    if checksum != remote_md5:
        return False
    else:
        return True

def check_md5_for_key(dest_bucket, dest_key, orig_bucket, orig_key):
    conn = boto.connect_s3()
    dbucket = conn.get_bucket(dest_bucket)
    dkey = dbucket.get_key(dest_key)
    if not dkey:
        print "key %s not found in bucket %s"%(dest_key, dest_bucket)
        return False

    obucket = conn.get_bucket(orig_bucket)
    okey = obucket.get_key(orig_key)
    if not okey:
        print "key %s not found in bucket %s"%(orig_key, orig_bucket)
        return False

    try:
        dmd5 = dkey.etag[1:-1]
    except TypeError:
        print "no md5 found for file %s bucket %s"%(dest_key, dest_bucket)
        return False

    try:
        omd5 = okey.etag[1:-1]
    except TypeError:
        print "no md5 found for file %s bucket %s"%(orig_key, orig_bucket)
        return False

    if dmd5 != omd5:
        return False
    else:
        return True
    


