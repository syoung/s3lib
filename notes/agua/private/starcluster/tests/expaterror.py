#!/usr/bin/env python
import time
import datetime
import traceback
import xml.dom.minidom

hosts = []
jobs = []
jobstats = []
_default_fields = ["JB_job_number", "state", "JB_submission_time",
                   "queue_name", "slots", "tasks"]

#syoung@hp:~/0.6/starcluster/tests$ ./expaterror.py 
#balancers.sge.__init__.parse_qhost    
#balancers.sge.__init__.parse_qhost    ExpatError: incorrect XML format. Returning self.hosts
#balancers.sge.__init__.parse_qhost    Inside 'finally'. Returning self.hosts
#hosts:  []


class test(object):

    hosts = []

    def __init__(self):
        #print "arg: %s", arg
        import sys
        #print "sys.argv[1]: %s", sys.argv[1]
    
    def parse_qhost(self, string):
        """
        this function parses qhost -xml output and makes a neat array
        takes in a string, so we can pipe in output from ssh.exec('qhost -xml')
        """
        print "balancers.sge.__init__.parse_qhost    "

        import xml.parsers.expat
        try:
            doc = xml.dom.minidom.parseString(string)
        except xml.parsers.expat.ExpatError:
            print "balancers.sge.__init__.parse_qhost    ExpatError: incorrect XML format. Returning self.hosts"
            return self.hosts
        else:
            print "balancers.sge.__init__.parse_qhost    Undetermined error reading XML. Returning self.hosts"
            return self.hosts
        finally:
            print "balancers.sge.__init__.parse_qhost    Inside 'finally'. Returning self.hosts"
    
            #for h in doc.getElementsByTagName("host"):
            #    name = h.getAttribute("name")
            #    hash = {"name": name}
            #    for stat in h.getElementsByTagName("hostvalue"):
            #        for hvalue in stat.childNodes:
            #            attr = stat.attributes['name'].value
            #            val = ""
            #            if hvalue.nodeType == xml.dom.minidom.Node.TEXT_NODE:
            #                val = hvalue.data
            #            hash[attr] = val
            #    if hash['name'] != u'global':
            #        self.hosts.append(hash)
            #return self.hosts
    
    def run(self):
        self.stat.parse_qhost(qhostXml)
        self.stat.parse_qstat(qstatXml)
        self.stat.parse_qacct(qacct, now)
    
    
string = """<qhost xmlns:xsd="http://gridengine.sunsource.net/source/browse/*checkout*/gridengine/source/dist/util/resources/schemas/qhost/qhost.xsd?revision=1.2">
<host name='global'>
<hostvalue name='arch_string'>-</hostvalue>
<hostvalue name='num_proc'>-</hostvalue>
<hostvalue name='load_avg'>-</hostvalue>
<hostvalue name='mem_total'>-</hostvalue>
<hostvalue name='mem_used'>-</hostvalue>
<hostvalue name='swap_total'>-</hostvalue>
<hostvalue name='swap_used'>-</hostvalue>
</host>
<host name='master'>
<hostvalue name='arch_string'>lx24-amd64</hostvalue>
<hostvalue name='num_proc'>1</hostvalue>
<hostvalue name='load_avg'>1.10</hostvalue>
<hostvalue name='mem_total'>615.2M</hostvalue>
<hostvalue name='mem_used'>88.4M</hostvalue>
<hostvalue name='swap_total'>0.0</hostvalue>
<hostvalue name='swap_used'>0.0</hostvalue>
</host>
</qhost>
"""
string = "error: commlib error: access denied (client IP resolved to host name 'ip-10-126-47-173.ec2.internal'. This is not identical to clients host name 'master') error: unable to send hmessage to qmaster using port 36251 on host 'master': got send error"

t = test();
hosts = t.parse_qhost(string)    
print "hosts: ", hosts
