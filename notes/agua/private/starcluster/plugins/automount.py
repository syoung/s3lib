#!/usr/bin/env python
import os
import re
import string
import sys
import time
import posixpath

from starcluster.clustersetup import ClusterSetup
from starcluster.logger import log

class NfsShares (ClusterSetup):
    """
    Automatically mounts external NFS shares on StarCluster nodes
    """
    def __init__(self, head_ip, interval, sourcedirs, mountpoints):
        log.info("AutoMount.__init__    Initialising AutoMount plugin.")
        log.info("AutoMount.__init__    head_ip %s" % head_ip)        
        log.info("AutoMount.__init__    interval %s" % interval)
        log.info("AutoMount.__init__    sourcedirs %s" % sourcedirs)
        log.info("AutoMount.__init__    mountpoints %s" % mountpoints)
        
        self.head_ip = head_ip
        # set default interval
        if not interval: interval = 10
        self.interval = interval
        self.sourcedirs = sourcedirs.split(",")
        self.mountpoints = mountpoints.split(",")
        
        if len(self.sourcedirs) != len(self.mountpoints):
            log.info("AutoMount.__init__    length of sourcedirs (" 
                + len(self.sourcedirs) 
                + ") is not the same as length of mountpoints ("
                + len(self.mountpoints)
                + ")"
                )
            sys.exit(0)

    def run(self, nodes, master, user, user_shell, volumes):
        """
            Mount NFS shares on master and all nodes
        """
        log.info("")
        log.info("AutoMount.run    Starting AutoMount...")
        log.info("AutoMount.run    self.head_ip %s" % self.head_ip)

        #### DEBUG: MOUNT ONLY ON MASTER
        #log.info("AutoMount.run    Mounting NFS shares on master")
        #self._mount(master);

        #### MOUNT ON ALL NODES
        log.info("AutoMount.run    Mounting NFS shares on nodes")
        for node in nodes:
            self._mount(node)
        
    def _mount(self, node):
        """
            Mount shares from head node on master and exec nodes
        """
        log.info("")
        log.info("AutoMount._mount    node.private_dns_name: %s" % node.private_dns_name)
        log.info("AutoMount._mount    self.head_ip: %s" % self.head_ip)

        #### INSERT ENTRIES INTO /etc/fstab ON MASTER/EXEC NODE
        log.info("AutoMount._mount    Doing self._addToFstab")
        for i in range(len(self.sourcedirs)):
            self._addToFstab(node, self.sourcedirs[i], self.head_ip, self.mountpoints[i], self.interval)
        
        #### INSERT ENTRIES INTO /etc/exports ON HEAD NODE
        log.info("AutoMount._mount    Doing self._addToExports")
        for i in range(len(self.sourcedirs)):
            self._addToExports(node, self.sourcedirs[i])

        #### FIX mountd PORT ON head AND MASTER/NODES
        #### ASSUMES portmap (111) AND nfs (2049) PORTS DON'T NEED TO BE FIXED
        self._setMountdPort(node, "32767")
 
        #### MOUNT THE SHARES
        for i in range(len(self.sourcedirs)):
            self._mountNfs(node, self.sourcedirs[i], self.head_ip, self.mountpoints[i], self.interval)

        ##### DEBUG: JUST TESTING - ACTUALLY USED IN on_remove-node BELOW
        ## REMOVE ENTRIES FROM /etc/exports ON HEAD NODE
        #for i in range(len(self.sourcedirs)):
        #    self._removeFromExports(node, self.sourcedirs[i])


    def _addToExports(self, node, sourcedir):
        """
            Add entries to /etc/exports on head node
        """
        # /data ip-10-124-247-224.ec2.internal(async,no_root_squash,no_subtree_check,rw)
        insert = sourcedir + "  " + node.private_ip_address + "(async,no_root_squash,no_subtree_check,rw)"
        cmd = "echo '" + insert + "' >> /etc/exports ;"
        log.info(cmd)
        os.system(cmd)
        os.system("exportfs -ra")
        os.system("service portmap restart")
        os.system("service nfs restart")
        
    def _removeFromExports(self, node, sourcedir):
        """
            Remove entries from /etc/exports on head node
        """
        # /data ip-10-124-247-224.ec2.internal(async,no_root_squash,no_subtree_check,rw)
        f = open("/etc/exports", 'rb')
        contents = f.read()
        f.close()
        #print "AutoMount._removeFromExports     contents of /etc/exports BEFORE: "
        #print contents
        
        insert = sourcedir + "  " + node.private_ip_address + "(async,no_root_squash,no_subtree_check,rw)\n"
        contents = string.replace(contents, insert,"")
        #print "AutoMount._removeFromExports     contents of /etc/exports AFTER: "
        #print contents

        f = open("/etc/exports", 'w')
        f.write(contents)
        f.close()        

    def _addToFstab(self, node, sourcedir, sourceip, mountpoint, interval):
        """
            Add entries to /etc/fstab on master/exec nodes
        """
        insert = self.head_ip + ":" + sourcedir + "  " + mountpoint + "  nfs  nfsvers=3,defaults 0 0"
        cmd = "echo '" + insert + "' >> /etc/fstab ;"
        log.info(cmd)
        node.ssh.execute(cmd)

    def _setMountdPort(self, node, mountdport):
        """
            Fix mountd port to same number on all hosts - head, master and exec nodes
        """
        #### ubuntu
        nfsconfig = "/etc/default/nfs-kernel-server"
        insert = "RPCMOUNTDOPTS=\"--port " + mountdport + " --manage-gids\""
        
        #### centos - ADD LATER USING uname -a
        #nfsconfig = "/etc/sysconfig/nfs"
        #insert = "MOUNTD_PORT=" + mountdport
        
        cmd = "echo '" + insert + "' >> "  + nfsconfig + ";"        
        log.info("Doing node.ssh.execute: " + cmd)
        node.ssh.execute(cmd)
        node.ssh.execute("service portmap restart")
        node.ssh.execute("service nfs restart")
        
        log.info("Doing os.system: " + cmd)
        os.system(cmd)
        os.system("service portmap restart")
        os.system("service nfs restart")
        
        
    def _mountNfs(self, node, sourcedir, sourceip, mountpoint, interval):
        """
            Mount the shares on the local filesystem - wait <interval> seconds between tries
        """
        cmd = "mount -t nfs " + sourceip + ":" + sourcedir + " " + mountpoint
        log.info(cmd)
        
        if not node.ssh.isdir(mountpoint): node.ssh.makedirs(mountpoint)
        
        file_list = []
        while not file_list:
            #log.info("AutoMount._mountNfs    cmd: %s" % cmd)
            node.ssh.execute(cmd)
            file_list = node.ssh.ls(mountpoint)
            #log.info("AutoMount._mountNfs    file_list BEFORE break: %s" % file_list)
            if file_list: break
            #log.info("AutoMount._mountNfs    file_list AFTER break: %s" % file_list)
            log.info("Sleeping  %s seconds" % interval)
            time.sleep(float(interval))

    def on_add_node(self, node, nodes, master, user, user_shell, volumes):
        log.info("AutoMount.on_add_node    ")
        log.info("AutoMount.on_add_node    node.private_dns_name: %s" % node.private_dns_name)
        self._mount(node)

    def on_remove_node(self, node, nodes, master, user, user_shell, volumes):
        log.info("")
        log.info("AutoMount.on_remove_node    Removing %s from cluster" % node.alias)
        log.info("AutoMount.on_remove_node    node.private_dns_name: %s" % node.private_dns_name)

        # REMOVE ENTRIES FROM /etc/exports ON HEAD NODE
        for i in range(len(self.sourcedirs)):
            self._removeFromExports(node, self.sourcedirs[i])

