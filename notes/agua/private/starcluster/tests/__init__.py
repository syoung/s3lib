#!/usr/bin/env python
import time
import datetime
import traceback
import xml.dom.minidom

class SGEStats(object):
    """
    SunGridEngine stats parser
    """
    hosts = []
    jobs = []
    jobstats = []
    _default_fields = ["JB_job_number", "state", "JB_submission_time",
                       "queue_name", "slots", "tasks"]

    @property
    def first_job_id(self):
        if not self.jobs:
            return
        return int(self.jobs[0]['JB_job_number'])

    @property
    def last_job_id(self):
        if not self.jobs:
            return
        return int(self.jobs[-1]['JB_job_number'])

    def parse_qhost(self, string):
        """
        this function parses qhost -xml output and makes a neat array
        takes in a string, so we can pipe in output from ssh.exec('qhost -xml')
        """
        
        #log.info("balancers.sge.__init__.parse_qhost    string: %s", string)
        string = "error: commlib error: access denied (client IP resolved to host name 'ip-10-126-47-173.ec2.internal'. This is not identical to clients host name 'master') error: unable to send message to qmaster using port 36251 on host 'master': got send error"
        #log.info("balancers.sge.__init__.parse_qhost    string DEBUG: %s", string)

        #### IF THERE HAS BEEN AN ExpatError, KEEP THE OLD self.hosts
        import re
        match = re.search('^error', string)
        log.info("createCell.run    error match: %s", match);
        if match:
            log.info("balancers.sge.__init__.parse_qhost    USING DUMMY BECAUSE FOUND ERROR in XML string: %s", string)
            return

#        string = """<qhost xmlns:xsd="http://gridengine.sunsource.net/source/browse/*checkout*/gridengine/source/dist/util/resources/schemas/qhost/qhost.xsd?revision=1.2">
#<host name='global'>
#<hostvalue name='arch_string'>-</hostvalue>
#<hostvalue name='num_proc'>-</hostvalue>
#<hostvalue name='load_avg'>-</hostvalue>
#<hostvalue name='mem_total'>-</hostvalue>
#<hostvalue name='mem_used'>-</hostvalue>
#<hostvalue name='swap_total'>-</hostvalue>
#<hostvalue name='swap_used'>-</hostvalue>
#</host>
#<host name='master'>
#<hostvalue name='arch_string'>lx24-amd64</hostvalue>
#<hostvalue name='num_proc'>1</hostvalue>
#<hostvalue name='load_avg'>1.10</hostvalue>
#<hostvalue name='mem_total'>615.2M</hostvalue>
#<hostvalue name='mem_used'>88.4M</hostvalue>
#<hostvalue name='swap_total'>0.0</hostvalue>
#<hostvalue name='swap_used'>0.0</hostvalue>
#</host>
#</qhost>
#"""
            #log.info("balancers.sge.__init__.parse_qhost    DUMMY string: %s", string)
            #return self.hosts

        #### OTHERWISE, CLEAR THE OLD HOSTS
        else:
            log.info("balancers.sge.__init__.parse_qhost    NO ERRORS in XML string: %s", string)
            self.hosts = []  # clear the old hosts
            
        import xml.parsers.expat
        try:
            doc = xml.dom.minidom.parseString(string)
        except ExpatError:
            log.info("balancers.sge.__init__.parse_qhost    ExpatError: incorrect XML format. Returning self.hosts")
            return self.hosts
        else:
            log.info("balancers.sge.__init__.parse_qhost    Undetermined error reading XML. Returning self.hosts")
            return self.hosts
        finally:
            log.info("balancers.sge.__init__.parse_qhost    Inside 'finally'. Returning self.hosts")

            for h in doc.getElementsByTagName("host"):
                name = h.getAttribute("name")
                hash = {"name": name}
                for stat in h.getElementsByTagName("hostvalue"):
                    for hvalue in stat.childNodes:
                        attr = stat.attributes['name'].value
                        val = ""
                        if hvalue.nodeType == xml.dom.minidom.Node.TEXT_NODE:
                            val = hvalue.data
                        hash[attr] = val
                if hash['name'] != u'global':
                    self.hosts.append(hash)
            return self.hosts

    def run(self):
        self.stat.parse_qhost(qhostXml)
        self.stat.parse_qstat(qstatXml)
        self.stat.parse_qacct(qacct, now)


    def __init__(self, arg):
        print "arg: %s", arg
        import sys
        print "sys.argv[1]: %s", sys.argv[1]
    
        if __name__ == "__main__":
         self.run()