sge.archive.2

<entry [Mon 2011:04:18 12:03:26 EST] POTENTIAL GOTCHA: USER NAMES MUST BE THE SAME ON EXECUTION HOSTS>

SO FOR NOW JUST USE 'www-data' USER TO RUN JOBS

http://wikis.sun.com/display/GridEngine/Planning+the+Installation#PlanningtheInstallation-Cells

User Names
For the Grid Engine system to verify that users submitting jobs have permission to submit them on the desired execution hosts, users' names must be identical on the submit and execution hosts. You might therefore have to change user names on some machines, because Grid Engine user names map directly to system user accounts.

	Note
User names on the master host are not relevant for permission checking. These user names do not have to match or even exist.


</entry>
<entry [Mon 2011:04:18 11:56:43 EST] USE $SGE_CELL TO RUN MULTIPLE SGE CLUSTERS>

USEFUL TIPS FOR ADDING threaded TO PE LIST FOR NEW CELL:
http://wikis.sun.com/display/GridEngine/Using+Files+and+Scripts+for+Administrative+Tasks


...
Targeting Queue Instances With the qselect Command
The qselect command outputs a list of queue instances. If you specify options, qselect lists only the queue instances that match the criteria that you specify. You can use qselect in combination with the qconf command to target specific queue instances that you want to modify.

Example ? Listing Queues
The following command lists all queue instances on Linux machines:

% qselect -l arch=glinux
The following command lists all queue instances on machines with two CPUs:

% qselect -l num_proc=2




COPIED /var/lib/gridengine/default AND SUBDIRS TO /var/lib/gridengine/smallcluster

cp -pr default smallcluster


SET $SGE_CELL ENVIRONMENT VARIABLE

export SGE_CELL=smallcluster


SUBMITTED JOB:

cd /root
qsub -q default test.sh

Your job 207 ("test.sh") has been submitted

root@hp:~# qstat

    job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID 
    -----------------------------------------------------------------------------------------------------------------
        207 0.50000 test.sh    root         r     04/18/2011 14:16:33 default@hp                         1        


CONFIRMED THAT NON-smallcluster qstat SHOWS SAME DETAILS


CHECKED BY DIFF THAT THE smallcluster JOBS ARE INDEED BEING RUN IN THE CORRECT CELL:

diff /var/lib/gridengine/default.bkp/common/accounting /var/lib/gridengine/smallcluster/common/accounting 

    198,200d197
    < default:hp:root:root:test.sh:207:sge:0:1303150592:1303150593:1303150653:0:0:60:0.000000:0.000000:1284.000000:0:0:0:0:1103:2:0:160.000000:40:0:0:0:15:5:NONE:defaultdepartment:NONE:1:0:0.000000:0.000000:0.000014:-U arusers -q default:0.000000:NONE:11165696.000000:0:0
    < default:hp:root:root:test.sh:208:sge:0:1303151370:1303151427:1303151487:0:0:60:0.000000:0.000000:1288.000000:0:0:0:0:1109:0:0:0.000000:40:0:0:0:9:4:NONE:defaultdepartment:NONE:1:0:0.000000:0.000000:0.000014:-U arusers -q default:0.000000:NONE:11165696.000000:0:0
    < default:hp:root:root:test.sh:209:sge:0:1303151458:1303151460:1303151520:0:0:60:0.000000:0.000000:1284.000000:0:0:0:0:1103:0:0:0.000000:40:0:0:0:9:4:NONE:defaultdepartment:NONE:1:0:0.000000:0.000000:0.000014:-U arusers -q default:0.000000:NONE:11165696.000000:0:0





 
Re: multiple clusters/cells (and SDM)
http://permalink.gmane.org/gmane.comp.clustering.gridengine.users/21892

Hi,

can't comment on the SDM/Hedeby bit - not using that - but I can 
definitely confirm that having multiple cells from one installation 
isn't complicated. And yes it's the cell name & ports. I actually copied 
my (running) SGE cell and then removed all the bits that looked 
cell-specific (mainly using grep to find them :) ) as I didn't want to 
risk re-running the installer against my production environment. And I 
got it right on first attempt. I agree there's not much information 
about it out there. I did ask the list a couple of question before I 
started

Tina


    
http://wikis.sun.com/display/GridEngine/Planning+the+Installation#PlanningtheInstallation-Cells

You can set up the Grid Engine system as a single cluster or as a collection of loosely coupled clusters called cells.

The $SGE_CELL environment variable indicates the cluster being referenced.

When the Grid Engine system is installed as a single cluster, $SGE_CELL is not set, and the value default is assumed for the cell value.


http://gridengine.info/2005/09/29/things-to-think-about-before-installing

THE default CELL FILES ARE HERE:
(INCLUDES site-specific startup files etc.)

$SGE_ROOT/default/


THIS IS THE DIRECTORY STRUCTURE:
http://ait.web.psi.ch/services/linux/hpc/merlin3/sge/admin/sge_hosts.html

$SGE_ROOT
     |-- $SGE_CELL
         |-- common
         |   |-- act_qmaster          Master hostname 
         |   |-- configuration        Do not edit manually!  See qconf -sconf
         |   |-- ...
         |   |
         |   |-- local_conf
         |       |-- merlinXX
         |       |-- ...
         |   
         |-- spool
         |   |-- qmaster   
         |   |   |-- admin_hosts   
         |   |   |   |-- merlinXX   
         |   |   |   |-- ...
         |   |   |-- exec_hosts   
         |   |   |   |-- merlinXX   
         |   |   |   |-- ...
         |   |   |-- submit_hosts   
         |   |   |   |-- merlinXX   
         |   |   |   |-- ...
         |   |   |-- qinstances
         |   |       |-- all.q
         |   |       |   |-- merlinXX   
         |   |       |   |-- ...
         |   |       |-- long.q
         |   |       |   |-- merlinXX   
         |   |       |   |-- ...
         |   |       |-- background.q
         |   |       |   |-- merlinXX   
         |   |       |   |-- ...
         |   |   
         |   |-- merlinXX   
         |   |-- ...

Example:

  find $SGE_ROOT/$SGE_CELL  -name '*merlin11*' 
  /opt/sge/n1ge6/default/spool/merlin11
  /opt/sge/n1ge6/default/spool/qmaster/qinstances/long.q/merlin11
  /opt/sge/n1ge6/default/spool/qmaster/qinstances/background.q/merlin11
  /opt/sge/n1ge6/default/spool/qmaster/qinstances/all.q/merlin11
  /opt/sge/n1ge6/default/spool/qmaster/admin_hosts/merlin11
  /opt/sge/n1ge6/default/spool/qmaster/install_merlin11_2006-04-26_15:55:50.log
  /opt/sge/n1ge6/default/spool/qmaster/exec_hosts/merlin11
  /opt/sge/n1ge6/default/spool/qmaster/submit_hosts/merlin11
  /opt/sge/n1ge6/default/common/local_conf/merlin11
  
  
HAVE TO COPY CELL DIRECTORY FROM MASTER TO EXEC HOST...? MAYBE OLD INFO
http://biowiki.org/HowToAdministerSunGridEngine

    Now perform the most idiotic step of the entire installation, and the step which the SGE documentation seems to make no mention of: we must copy your cell directory (for us, it is /opt/sge/default/, because our cell name is "default) from the master host to your exec host (i.e. you must copy the contents of /opt/sge/default/ from the master to /opt/sge/default/ on the exec host). If you don't, you will get an error during the interactive install telling you that the master node has not been installed. If there is a proper way to do this that someone knows, please enlighten me.

</entry>

<entry [Mon 2011:04:18 11:21:56 EST] CREATE QUEUE USING PERL (Agua::Monitor::SGE::addQueue)>

INTRO: THE FOLLOWING STEPS ARE IMPLEMENTED IN Agua::Monitor::SGE::addQueue

REFERENCES: USING FILES AND SCRIPTS FOR SGE ADMIN
http://wikis.sun.com/display/GridEngine/Using+Files+and+Scripts+for+Administrative+Tasks
http://ait.web.psi.ch/services/linux/hpc/merlin3/sge/admin/sge_hosts.html

1. GET HOST LIST
http://www.vsa-services.com/sge-tips

qconf -sel	Show a list of all currently-configured execution hosts.

EXAMPLE OUTPUT:
http://ait.web.psi.ch/services/linux/hpc/merlin3/sge/admin/sge_hosts.html

    qconf -sel
      merlin01
      merlin02
      merlin03
      merlin04
      merlin05
      ...


2. CREATE QUEUE FILE BASED ON DEFAULT QUEUE:    

qconf -mq default

    qname                 default
    hostlist              hp
    seq_no                0
    load_thresholds       np_load_avg=1.75
    suspend_thresholds    NONE
    nsuspend              1
    suspend_interval      00:05:00
    priority              0
    min_cpu_interval      00:05:00
    processors            UNDEFINED
    qtype                 BATCH INTERACTIVE
    ckpt_list             NONE
    pe_list               make threaded     <=== HERE
    rerun                 FALSE
    slots                 3
    tmpdir                /tmp
    shell                 /bin/sh
    prolog                NONE
    epilog                NONE
    shell_start_mode      posix_compliant
    starter_method        NONE
    suspend_method        NONE
    resume_method         NONE
    terminate_method      NONE
    notify                00:00:60
    owner_list            NONE
    user_lists            NONE
    xuser_lists           NONE
    subordinate_list      NONE
    complex_values        NONE
    projects              NONE
    xprojects             NONE
    calendar              NONE
    initial_state         default
    s_rt                  INFINITY
    h_rt                  INFINITY
    s_cpu                 INFINITY


3. ADD THE QUEUE

my $add = "qconf -Aq $queuefile";
print "Agua::Monitor::SGE::createQueue    add: $add\n";
print `$add`;


NOTES
-----

NB: THIS USES THE HOST LIST @allhosts

WE MAY NOT NEED TO CREATE HOST GROUP BUT IF WE DO THIS IS HOW TO DO IT:
http://ait.web.psi.ch/services/linux/hpc/merlin3/sge/admin/sge_hosts.html

Host Groups

The default hostgroup is called @allhosts. To create a new hostgroup use the qconf -Ahgrp file_name command where the configuration file file_name has the structure described in man hostgroup. 
Example:

   cat merlin0809.hgrp 
group_name @merlin0809

hostlist merlin08 merlin09

   qconf -Ahgrp merlin0809.hgrp 
   added "@merlin0809" to host group list
   
   qconf -shgrpl
   @allhosts
   @merlin0809

   qconf -shgrp @merlin0809
   group_name @merlin0809
   hostlist merlin08 merlin09

The host groups are stored in the directory $SGE_ROOT/$SGE_CELL/spool/qmaster/hostgroups, e.g.:

  cat /opt/sge/n1ge6/default/spool/qmaster/hostgroups/@merlin0809
# Version: GE 6.0u7
# 
# DO NOT MODIFY THIS FILE MANUALLY!
# 
group_name  @merlin0809
hostlist    merlin08 merlin09





PROBLEM:

denied: "www-data" must be manager for this operation


SOLUTION:

MAKE www-data A MANAGER USER USING QMON


http://wikis.sun.com/display/GridEngine/Using+Files+and+Scripts+for+Administrative+Tasks

Using Files to Modify a Global Configuration or the Scheduler
To change a global configuration, use the qconf -mconf command. To change the scheduler, use the qconf -msconf command.

Both of these commands open a temporary file in an editor. When you exit the editor, any changes that you save to this temporary file are processed by the system and take effect immediately. The editor used to open the temporary file is the editor specified by the EDITOR environment variable. If this variable is undefined, the vi editor is used by default.

You can use the EDITOR environment variable to automate the behavior of the qconf command. Change the value of this variable to point to an editor program that modifies a file whose name is given by the first argument. After the editor modifies the temporary file and exits, the system reads in the modifications, which take effect immediately.

	Note
If the modification time of the file does not change after the edit operation, the system sometimes incorrectly assumes that the file was not modified. Therefore you should insert a sleep 1 instruction before writing the file, to ensure a different modification time.
You can use this technique with any qconf -m... command. However, the technique is especially useful for administration of the scheduler and the global configuration, as you cannot automate the procedure in any other way.

Example ? Modifying the Schedule Interval
The following example modifies the schedule interval of the scheduler:

#!/bin/ksh
# sched_int.sh: modify the schedule interval
# usage: sched_int.sh < n>, where < n> is
# the new interval, in seconds. n < 60

TMPFILE=/tmp/sched_int.$$
if [ $MOD_SGE_SCHED_INT ]; then
     grep -v schedule_interval $1 > $TMPFILE
     echo "schedule_interval 0:0:$MOD_SGE_SCHED_INT" >> $TMPFILE
# sleep to ensure modification time changes
     sleep 1
     mv $TMPFILE $1
else
     export EDITOR=$0
     export MOD_SGE_SCHED_INT=$1
     qconf -msconf
fi
    
</entry>
<entry [Mon 2011:04:18 11:17:44 EST] SGE IANA PORT NUMBERS>

http://www.iana.org/assignments/port-numbers

#			   Paul Sterk <paul.sterk&sun.com> March 2006
sge_qmaster	6444/tcp   Grid Engine Qmaster Service
sge_qmaster	6444/udp   Grid Engine Qmaster Service
sge_execd	6445/tcp   Grid Engine Execution Service
sge_execd	6445/udp   Grid Engine Execution Service


http://gridengine.info/2006/09/19/sge-gets-registered-iana-port-numbers

Looks like we should "officially" be using ports 6444 and 6445 now. Expect to see these values propagate into an /etc/services file near you.    

IT IS INDEED FOUND IN /etc/services ON UBUNTU 10.10:

cat /etc/services | grep 6444

    sge_qmaster	6444/tcp			# Grid Engine Qmaster Service
    sge_qmaster	6444/udp			# Grid Engine Qmaster Service


</entry>

<entry [Tue 2011:04:12 01:23:01 EST] qconf CHEAT SHEET>


Using qconf Command
http://ait.web.psi.ch/services/linux/hpc/merlin3/sge/admin/sge_hosts.html

To view the basic cluster and host configuration use the qconf -sconf command:

   qconf -sconf  [global]
   qconf -sconf  host_name
To modify the basic cluster or host specific configuration use the following commands:

   qconf -mconf  global
   qconf -mconf  host_name
To view and change the setup of hosts use qconf -XY [file] with the following options:

   =================================================================
                     HOST   execution   admin     submit  host_group 
                       Y      e          h          s
    ACTION        X 
   ----------------------------------------------------------------- 
   add (edit)     a           *          *          *         *
   add (file)     A           *                               *
   delete         d           *          *          *         *
   modify (edit)  m           *                               *
   modify (file)  M           *                               *
   show           s           *          *          *         *
   show list      sYl         *                               *
   ================================================================
 

qconf Cheat Sheet
=================

For a detailed list of available qconf commands, see the qconf(1) man page.

Complex Configuration
Command	Description

qconf -sc	Show the current complex configuration.
qconf -mc	Modify the complex configuration using an editor.
qconf -Mc filename	Modify the current complex configuration by overwriting the current configuration as specified by the file filename.


For more information, see How to Configure the Complex From the Command Line.

Calendar Configuration
Command	Description
qconf -scal calendarname	Show the configuration for the specified calendar.
qconf -scall	Show a list of all currently configured calendars.
qconf -acal calendarname	Add a new calendar definition to the Sun Grid Engine environment.
qconf -Acal filename	Add a new calendar definition to the Sun Grid Engine environment from the file filename.
qconf -mcal calendarname	Modify the specified calendar configuration using an editor.
qconf -Mcal filename	Modify the current calendar configuration by overwriting the current configuration as specified by filename.
qconf -dcal calendarname	Delete a calendar.
For more information, see How to Configure Queue Calendars From the Command Line.

Checkpointing Environment Configuration
Command	Description
qconf -sckpt checkpointname	Show the configuration of the specified checkpointing environment.
qconf -sckptl	Show a list of all currently configured checkpointing environments.
qconf -ackpt checkpointname	Add a checkpointing environment to the Sun Grid engine environment.
qconf -Ackpt filename	Add a checkpointing environment from the file filename.
qconf -mckpt checkpointname	Modify the specified checkpointing environment using an editor.
qconf -Mckpt filename	Modify a checkpointing environment from file filename.
qconf -dckpt checkpointname	Delete a checkpointing environment.
For more information, see How to Configure Checkpointing Environments From the Command Line.

Cluster Configuration
Command	Description
qconf -sconf [host,...|global]	Show a local host configuration or the global cluster configuration.
qconf -sconfl	Show a list of all currently configured hosts.
qconf -aconf host,...	Add a host configuration.
qconf -Aconf filelist	Add the configuration specified in the files enlisted in the comma-separated filelist.
qconf -mconf [host,...|global]	Modify one or more local host configurations, or modify the global cluster configuration.
qconf -Mconf filelist	Modify the configurations specified in the files enlisted in the comma separated filelist.
qconf -dconf host,...	Delete one or more hosts from the configuration list.
For more information, see How to Configure Clusters From the Command Line.

Event Client Configuration
Command	Description
qconf -secl	Show event client list.
qconf -kec [eventclientname,...|all]	Shuts down event clients registered at the master daemon.

Host Configuration
Command	Description
qconf -se host	Show the configuration for the specified execution host.
qconf -sel	Show a list of all currently-configured execution hosts.
qconf -ae	Add an execution host.
qconf -Ae filename	Add an execution host from file filename.
qconf -me host	Modify the specified execution host using an editor.
qconf -Me filename	Modify an execution host from file filename.
qconf -de host,...	Delete one or more execution hosts.
qconf -sh	Show a list of all currently-configured administrative hosts.
qconf -ah host,...	Add one or more administrative hosts.
qconf -dh host,...	Delete one or more administrative hosts from the administrative host list.
qconf -ss	Show a list of all currently-configured submit hosts.
qconf -as host,...	Add one or more submit hosts.
qconf -ds host,...	Delete a submit host.
For more information, see Configuring Hosts.

Host Group Configuration
Command	Description
qconf -shgrp groupname	Show the configuration for the specified host group.
qconf -shgrpl	Show a list of all currently configured host groups.
qconf -ahgrp hostgroupname	Add a host group.
qconf -Ahgrp filename	Add a host group configuration from file filename.
qconf -mhgrp hostgroupname	Modify the specified host group using an editor.
qconf -Mhgrp filename	Modify a host group configuration from file filename.
For more information, see How to Configure Host Groups From the Command Line.

Parallel Environment Configuration
Command	Description
qconf -sp pename	Show the configuration for the specified parallel environment.
qconf -spl	Show a list of all currently configured parallel environments.
qconf -ap pename	Add a new parallel environment.
qconf -Ap filename	Add a parallel environment from file filename.
qconf -mp pename	Modify the specified parallel environment using an editor.
qconf -Mp filename	Modify a parallel environment from file filename.
qconf -dp pename	Delete the specified parallel environment.
For more information, see How to Configure Parallel Environments From the Command Line.

Project Configuration
Command	Description
qconf -sprj projectname	Show the configuration for the specified project.
qconf -sprjl	Show a list of all currently configured projects.
qconf -aprj	Add a new project.
qconf -Aprj filename	Add a new project from file filename.
qconf -mprj projectname	Modify the specified project using an editor.
qconf -Mprj filename	Modify a project from file filename.
qconf -dprj projectname	Delete a project.
For more information, see How to Configure Projects From the Command Line.


Queue Configuration

The most flexible way to automate the configuration of queue instances is to use the qconf command with the qselect command. With the combination of these commands, you can build up your own custom administration scripts.


Command	Description
qconf -sq wc_queue_list	Show one or multiple cluster queues or queue instances. aqconf -sql	Show a list of all currently configured cluster queues.
qconf -aq queuename	Add a new queue.
qconf -Aq filename	Add a queue from file filename.
qconf -mq queuename	Modify the specified queue using an editor.
qconf -Mq filename	Modify a queue from file filename.
qconf -dq queuename	Delete a queue.
	-purge allows you to delete an entire list attribute from the underlying queue instances of a cluster queue, whereas -dattr only deletes a value or an item from a list attribute.
For more information, see Configuring Queues.

Scheduler Configuration
Command	Description
qconf -ssconf	Show the current scheduler configuration.
qconf -msconf	Modify the scheduler configuration using an editor.
qconf -tsm	Trigger scheduler monitoring.
For more information, see Managing the Scheduler.

Sharetree Configuration
Command	Description
qconf -sstree	Show the sharetree.
qconf -sstnode nodelist	Show one or more sharetree node.
qconf -rsstnode nodelist	Show one or more sharetree nodes and their children.
qconf -astree	Add a sharetree.
qconf -Astree filename	Add a sharetree from filename.
qconf -astnode nodelist	Add one or more sharetree nodes.
qconf -mstree	Modify a sharetree.
qconf -Mstree filename	Modify a sharetree from filename.
qconf -dstree	Delete a sharetree.
qconf -dstnode nodelist	Delete or more sharetree nodes.

User Configuration
Command	Description
qconf -suser username,...	Show the configuration for one or more users.
qconf -suserl	Show a list of all currently-configured users.
qconf -auser	Add a user to the list of registered users.
qconf -Auser filename	Add a user from file filename.
qconf -muser username	Modify the specified user configuration using an editor.
qconf -Muser filename	Modify a user from file filename.
qconf -duser username,...	Delete one or more users.
qconf -sm	Show a list of all currently-configured managers.
qconf -am username	Add a user to the manager list.
qconf -dm username,...	Delete one or more managers.
qconf -so	Show a list of all currently-configured operators.
qconf -ao username	Adds a user to the operator list.
qconf -do username,...	Deletes one or more operators.
For more information, see Configuring User Access.

User Access List Configuration
Command	Description
qconf -su aclname [,...]	Displays the configuration for the specified access list.
qconf -sul	Displays a list of all currently configured user access lists.
qconf -au username [,...] accesslistname [,...]	Adds a user or users to an access list or lists.
qconf -Au filename	Adds a user access list from file filename.
qconf -mu aclname	Opens an editor to modify the specified access list configuration.
qconf -Mu filename	Modifies a user access list from file filename.
qconf -du username [,...] aclname [,...]	Deletes a user or users to an access list or lists.
qconf -dul aclname [,...]	Deletes one or more user access lists.
    
</entry>

<entry [Mon 2011:04:11 23:06:18 EST] USE #$ -pe threaded N TO ALLOCATE MULTIPLE CPUS TO JOB>

https://wiki.duke.edu/display/SCSC/Submitting+OpenMP+Jobs

SPECIFY 2 CPUS PER JOB:

    #!/bin/tcsh
    #
    #$ -S /bin/tcsh -cwd
    #$ -o simple.out -j y
    #$ -pe threaded 2
    cd /home/username/thread/simple
    myprog

SPECIFY A RANGE OF CPUS:

    #!/bin/tcsh
    #
    #$ -S /bin/tcsh -cwd
    #$ -o simple.out -j y
    #$ -pe threaded 2-8
    cd /home/username/thread/simple
    myprog

When the above script executes, SGE will guarantee that there are N open queue-slots (CPUs) on the machine, but it will only start one process, i.e. only one copy of 'myprog' will be started. The expectation is that the program itself will then spawn multiple threads to effectively use the multiple CPUs. SGE will identify the number of slots (CPUs) that it gave to the job in the environment variable $NSLOTS.

THEN USE $NSLOTS TO GET THE EXACT NUMBER OF CPUS ALLOCATED:

    #!/bin/tcsh
    #
    #$ -S /bin/tcsh -cwd
    #$ -o simple.out -j y
    #$ -pe threaded 2
    cd /home/username/thread/simple
    myprog --nthreads=$NSLOTS

Here, we are assuming that the program accepts an argument, --nthreads, which is the number of threads or CPUs to use. This is particularly important if you request a range of CPUs with "-pe threaded 2-8". In such a case, SGE could assign you any number of slots in that range, and you don't want to start an 8 CPU job if SGE put you on a 2 CPU machine.


</entry>


<entry [Mon 2011:04:11 22:57:42 EST] ADDING A threaded PARALLEL ENVIRONMENT TO A LIST OF PEs>


1. CREATE NEW threaded PE FILE:

emacs threaded.conf

    pe_name            threaded
    slots              3
    user_lists         arusers
    xuser_lists        NONE
    start_proc_args    /bin/true
    stop_proc_args     /bin/true
    allocation_rule    $pe_slots
    control_slaves     TRUE
    job_is_first_task  FALSE
    urgency_slots      min
    accounting_summary FALSE


ON COMMAND LINE, ADD threaded TO PE USING THE threaded.conf FILE:
(OR EDIT MANUALLY: qconf -ap threaded)

qconf -Ap threaded.conf


2. ADD threaded PE TO default QUEUE'S pe_list:

qconf -mq default

    qname                 default
    hostlist              hp
    seq_no                0
    load_thresholds       np_load_avg=1.75
    suspend_thresholds    NONE
    nsuspend              1
    suspend_interval      00:05:00
    priority              0
    min_cpu_interval      00:05:00
    processors            UNDEFINED
    qtype                 BATCH INTERACTIVE
    ckpt_list             NONE
    pe_list               make threaded     <=== HERE
    rerun                 FALSE
    slots                 3
    tmpdir                /tmp
    shell                 /bin/sh
    prolog                NONE
    epilog                NONE
    shell_start_mode      posix_compliant
    starter_method        NONE
    suspend_method        NONE
    resume_method         NONE
    terminate_method      NONE
    notify                00:00:60
    owner_list            NONE
    user_lists            NONE
    xuser_lists           NONE
    subordinate_list      NONE
    complex_values        NONE
    projects              NONE
    xprojects             NONE
    calendar              NONE
    initial_state         default
    s_rt                  INFINITY
    h_rt                  INFINITY
    s_cpu                 INFINITY


NOTES
-----

SOLUTION:

REMEMBER TO ADD SLOTS TO QUEUE AND arusers TO user_lists IN threaded.conf


PROBLEM:

ERRORS DUE TO MISSING PE IN PE LIST OR INCORRECT CONFIGURATION

PE NOT ADDED TO LIST:

qsub -t 1-1:1 -q default test.sh

    Unable to run job: job rejected: the requested parallel environment "threaded" does not exist.
    Exiting.


http://markmail.org/message/dxhx622g4yfcyv7k

qconf -ap threaded

    pe_name            threaded
    slots              0
    user_lists         NONE
    xuser_lists        NONE
    start_proc_args    /bin/true
    stop_proc_args     /bin/true
    allocation_rule    $pe_slots
    control_slaves     FALSE
    job_is_first_task  TRUE
    urgency_slots      min
    accounting_summary FALSE

http://www.nottingham.ac.uk/hpc/html/docs/draftuserguide/user/node54.html


ADD A NEW PARALLEL ENVIRONMENT
    
qmon --> PE Configuration --> Add 'threaded' and user group 'arusers'


NOW IT SUBMITS BUT DOES NOT RUN:

qsub -t 1-1:1 -q default test.sh
Your job-array 73.1-1:1 ("tophatBatchAlignment-chr22") has been submitted

qstat -j 73
    scheduling info:            cannot run in PE "threaded" because it only offers 0 slots


RECREATED 'threaded' PE BUT STILL SHOWING ERROR:

qstat -j 74

    scheduling info:            cannot run in queue "default" because PE "threaded" is not in pe list
                                cannot run in PE "threaded" because it only offers 0 slots


UBUNTU MANUALS

http://manpages.ubuntu.com/manpages/maverick/man5/sge_pe.5.html


ADD PeS TO pe LIST:

qconf -ap threaded

    

    
</entry>

<entry [Mon 2011:04:11 22:56:42 EST] USE sync -y MODE TO KILL ALL CHILDREN WHEN KILL PARENT PROCESS>

http://stackoverflow.com/questions/4883056/sge-qsub-fails-to-submit-jobs-in-sync-mode    

I have a perl script that prepares files for input to a binary program and submits the execution of the binary program to the SGE queueing system version 6.2u2.

The jobs are submitted with the -sync yoption to permit the parent perl script the ability to monitor the status of the submitted jobs with the waitpid function.

This is also very useful because sending a SIGTERM to the parent perl script propagates this signal to each of the children, who then forward this signal onto qsub, thus gracefully terminating all associated submitted jobs.

Thus, it is fairly crucial that I be able to submit jobs with this -sync y option.

Unfortunately, I keep getting the following error:

Unable to initialize environment because of error: range_list containes no elements

Notice the improper spelling of 'containes'. That is NOT a typo. It just shows you how poorly maintained this area of the code/error message must be.

The attempted submissions that produce this error fail to even generate the STDOUT and STDERR files *.e{JOBID} and *.o{JOBID}. The submission just completely fails.

Searching google for this error message only results in unresolved posts on obscure message board.

This error does not even occur reliably. I can rerun my script and the same jobs will not necessarily even generate the error. It also seems not to matter from which node I attempt to submit jobs.

My hope is that someone here can figure this out.

Answers to any of these questions would thus solve my problem:

Does this error persist in more recent versions of SGE?
Can I alter my command line options for qsub to avoid this?
What the hell is this error message talking about?



SOLUTION

I found a solution to this problem - or at the very least a workaround.

My goal was to get individual instances of qsub to remain in the foreground as the job that it submitted was still in the queue or running. This was achieved with the -sync option but resulted in the horribly unpredictable bug that I describe in my question.

The solution to this problem was to use the qrsh command with the now -n option. This causes the job to behave similar to qsub -sync in that my script can implicitly monitor whether a submitted job is running by using waitpid on the qrsh instance.

The only caveat to this solution is that the queue you are operating on must not make any distinction between interactive nodes (offered by qsub) and non-interactive nodes (accessible by qsub). Should a distinction exist (likely there are fewer interactive nodes than non-interactive) then this workaround may not help.

However, as I have found nothing even close to a solution to the qsub -sync problem that is anywhere as functional as this, let this post go out across the interwebs to any wayward soul caught in my similar situation.



PERL COOKBOOK EXPLAINS waitpid
http://docstore.mik.ua/orelly/perl/cookbook/ch16_20.htm    

16.19. Avoiding Zombie Processes

Problem

Your program forks children, but the dead children accumulate, fill up your process table, and aggravate your system administrator.

Solution

If you don't need to record the children that have terminated, use:

$SIG{CHLD} = 'IGNORE';
To keep better track of deceased children, install a SIGCHLD handler to call waitpid :

use POSIX ":sys_wait_h";  $SIG{CHLD} = \&REAPER; sub REAPER {     my $stiff;     while (($stiff = waitpid(-1, &WNOHANG)) > 0) {         # do something with $stiff if you want     }     $SIG{CHLD} = \&REAPER;                  # install *after* calling waitpid }
Discussion

When a process exits, the system keeps it in the process table so the parent can check its status - whether it terminated normally or abnormally. Fetching a child's status (thereby freeing it to drop from the system altogether) is rather grimly called reaping dead children. (This entire recipe is full of ways to harvest your dead children. If this makes you queasy, we understand.) It involves a call to wait or waitpid . Some Perl functions (piped open s, system , and backticks) will automatically reap the children they make, but you must explicitly wait when you use fork to manually start another process.

To avoid accumulating dead children, simply tell the system that you're not interested in them by setting $SIG{CHLD} to "IGNORE" . If you want to know which children die and when, you'll need to use waitpid .

The waitpid function reaps a single process. Its first argument is the process to wait for - use -1 to mean any process - and its second argument is a set of flags. We use the WNOHANG flag to make waitpid immediately return 0 if there are no dead children. A flag value of 0 is supported everywhere, indicating a blocking wait. Call waitpid from a SIGCHLD handler, as we do in the Solution, to reap the children as soon as they die.

The wait function also reaps children, but it does not have a non-blocking option. If you inadvertently call it when there are running child processes but none have exited, your program will pause until there is a dead child.

Because the kernel keeps track of undelivered signals using a bit vector, one bit per signal, if two children die before your process is scheduled, you will get only a single SIGCHLD. You must always loop when you reap in a SIGCHLD handler, and so you can't use wait .

Both wait and waitpid return the process ID that they just reaped and set $? to the wait status of the defunct process. This status is actually two 8-bit values in one 16-bit number. The high byte is the exit value of the process. The low 7 bits represent the number of the signal that killed the process, with the 8th bit indicating whether a core dump occurred. Here's one way to isolate those values:

$exit_value  = $? >> 8; $signal_num  = $? & 127; $dumped_core = $? & 128;
The standard POSIX module has macros to interrogate status values: WIFEXITED, WEXITSTATUS, WIFSIGNALLED, and WTERMSIG. Oddly enough, POSIX doesn't have a macro to test whether the process core dumped.

Beware of two things when using SIGCHLD. First, the system doesn't just send a SIGCHLD when a child exits; it also sends one when the child stops. A process can stop for many reasons - waiting to be foregrounded so it can do terminal I/O, being sent a SIGSTOP (it will wait for the SIGCONT before continuing), or being suspended from its terminal. You need to check the status with the WIFEXITED [ 1 ] function from the POSIX module to make sure you're dealing with a process that really died, and isn't just suspended.

[1] Not SPOUSEXITED , even on a PC.

use POSIX qw(:signal_h :errno_h :sys_wait_h);  $SIG{CHLD} = \&REAPER; sub REAPER {     my $pid;      $pid = waitpid(-1, &WNOHANG);      if ($pid == -1) {         # no child waiting.  Ignore it.     } elsif (WIFEXITED($?)) {         print "Process $pid exited.\n";     } else {         print "False alarm on $pid.\n";     }     $SIG{CHLD} = \&REAPER;          # in case of unreliable signals }
The second trap with SIGCHLD is related to Perl, not the operating system. Because system , open , and backticks all fork subprocesses and the operating system sends your process a SIGCHLD whenever any of its subprocesses exit, you could get called for something you weren't expecting. The built-in operations all wait for the child themselves, so sometimes the SIGCHLD will arrive before the close on the filehandle blocks to reap it. If the signal handler gets to it first, the zombie won't be there for the normal close. This makes close return false and set $! to "No child processes" . Then, if the close gets to the dead child first, waitpid will return 0 .

Most systems support a non-blocking waitpid . Use Perl's standard Config.pm module to find out:

use Config; $has_nonblocking = $Config{d_waitpid} eq "define" ||                    $Config{d_wait4}   eq "define";
System V defines SIGCLD, which has the same signal number as SIGCHLD but subtly different semantics. Use SIGCHLD to avoid confusion.



</entry>


<entry [Mon 2011:04:11 22:21:28 EST] qsub OPTIONS>

#$ -pe mvapich 4 
#$ -M [my email] 
#$ -m ea 
#$ -l h_rt=8:00:00 
#$ -R y 
#$ -j y 
#$ -notify 
#$ -cwd 

    
</entry>

<entry [Mon 2011:04:11 22:11:58 EST] GRID ENGINE ERROR MESSAGES>
    
ERROR MESSAGES:

ll /tmp/*messages*


SPOOL MESSAGES:

ll /var/spool/gridengine

tail /var/mail/root

        drwxr-xr-x 3 sgeadmin sgeadmin 4.0K 2011-04-08 13:34 execd
        drwxr-xr-x 3 sgeadmin sgeadmin 4.0K 2011-04-11 10:30 qmaster
        drwxr-xr-x 2 sgeadmin sgeadmin 4.0K 2011-04-11 15:44 spooldb
    
    MAIL MESSAGES:
    
    04/12/2011 05:10:08 [0:7318]: further messages are in "error" and "trace"
    04/12/2011 05:10:08 [0:7318]: using "/bin/bash" as shell of user "root"
    04/12/2011 05:10:08 [0:7318]: error: can't open output file "/home/nethome/syoung/agua/Project1/Workflow1/chr22/scripts/nethome/syoung/agua/Project1/Workflow1/chr22/scripts/test.out": No such file or directory
    04/12/2011 05:10:08 [121:7316]: wait3 returned 7318 (status: 6656; WIFSIGNALED: 0,  WIFEXITED: 1, WEXITSTATUS: 26)
    04/12/2011 05:10:08 [121:7316]: pe_start exited with exit status 26
    04/12/2011 05:10:08 [121:7316]: reaped "pe_start" with pid 7318
    04/12/2011 05:10:08 [121:7316]: pe_start exited not due to signal
    04/12/2011 05:10:08 [121:7316]: pe_start exited with status 26
    04/12/2011 05:10:08 [121:7316]: no tasker to notify
    04/12/2011 05:10:08 [121:7316]: exit states increased from 0 to 1
    04/12/2011 05:10:08 [121:7316]: failed starting pe_start
    04/12/2011 05:10:08 [121:7316]: no epilog script to start
    
    Shepherd error:
    04/12/2011 05:10:08 [0:7318]: error: can't open output file "/home/nethome/syoung/agua/Project1/Workflow1/chr22/scripts/nethome/syoung/agua/Project1/Workflow1/chr22/scripts/test.out": No such file or directory


    
</entry>


<entry [Fri 2011:04:08 14:27:33 EST] SGE CONFIGURATION COMMANDS>

ALSO SEE:

man queue_conf


Configuring Queues From the Command Line
http://wikis.sun.com/display/GridEngine/Configuring+Queues

To configure queues from the command line, type the following command with the appropriate options:

# qconf < options>
The qconf command has the following options:

 qconf -aq [cluster-queue]
The -aq option (add cluster queue) displays an editor containing a template for cluster queue configuration. The editor is either the default vi editor or an editor defined by the EDITOR environment variable. If cluster-queue is specified, the configuration of this cluster queue is used as template. Configure the cluster queue by changing the template and then saving it. See the queue_conf(5) man page for a detailed description of the template entries to change.
 qconf -Aq filename
The -Aq option (add cluster queue from file) uses the file filename to define a cluster queue. The definition file might have been produced by the qconf -sq queue command.
 qconf -cq queue [,...]
The -cq option (clean queue) cleans the status of the specified cluster queues, queue domains, or queue instances to be idle and free from running jobs. The status is reset without respect to the current status. This option is useful for eliminating error conditions, but you should not use it in normal operation mode.
 qconf -dq cluster-queue [,...]
The -dq option (delete cluster queue) deletes the cluster queues specified in the argument list from the list of available queues.
 qconf -mq cluster-queue
The -mq option (modify cluster queue) modifies the specified cluster queue. The -mq option displays an editor containing the configuration of the cluster queue to be changed. The editor is either the default vi editor or an editor defined by the EDITOR environment variable. Modify the cluster queue by changing the configuration and then saving your changes.
 qconf -Mq filename
The -Mq option (modify cluster queue from file) uses the file filename to define the modified cluster queue configuration. The definition file might have been produced by the qconf -sq queue command and subsequent modification.
 qconf -sq [queue[,...]]
The -sq option (show queue) without arguments displays the default template cluster queue, queue domain, or queue instance configuration. The -sq option with arguments displays the current configuration of the specified queues.
 qconf -sql
The -sql option (show cluster queue list) displays a list of all currently configured cluster queues.
The qconf command provides the following set of options that you can use to change specific queue attributes:

-aattr ? Add attributes
-Aattr ? Add attributes from a file
-dattr ? Delete attributes
-Dattr ? Delete attributes listed in a file
-mattr ? Modify attributes
-Mattr ? Modify attributes from a file
-rattr ? Replace attributes
-Rattr ? Replace attributes from a file
-sobjl ? Show list of configuration objects
For a description of how to use these options and for some examples of their use, see Using Files to Modify Queues, Hosts, and Environments. For detailed information about these options, see the qconf(1) man page.

    
</entry>


<entry [Fri 2011:04:08 00:34:09 EST] INSTALL GANGLIA>
GET GANGLIA:

aptitude search ganglia

    p   ganglia-monitor          - cluster monitoring toolkit - node daemon
    p   ganglia-webfrontend      - cluster monitoring toolkit - web front-end
    p   libganglia1              - cluster monitoring toolkit - shared libraries
    p   libganglia1-dev          - cluster monitoring toolkit - development libraries  

apt-get install ganglia-monitor ganglia-webfrontend libganglia1 libganglia1-dev

root@hp:~# locate ganglia
/etc/ganglia
/etc/ganglia-webfrontend
/etc/ganglia/gmetad.conf
/etc/ganglia/gmond.conf
/etc/ganglia-webfrontend/apache.conf
/etc/ganglia-webfrontend/private_clusters
/etc/init.d/ganglia-monitor
/etc/rc0.d/K20ganglia-monitor
/etc/rc1.d/K20ganglia-monitor
/etc/rc2.d/S20ganglia-monitor
/etc/rc3.d/S20ganglia-monitor
/etc/rc4.d/S20ganglia-monitor
/etc/rc5.d/S20ganglia-monitor
/etc/rc6.d/K20ganglia-monitor
/usr/include/ganglia.h
/usr/include/ganglia_gexec.h
/usr/lib/ganglia
/usr/lib/libganglia-3.1.7.so.0
/usr/lib/libganglia-3.1.7.so.0.0.0
/usr/lib/libganglia.a
/usr/lib/libganglia.la
/usr/lib/libganglia.so
/usr/lib/ganglia/modcpu.so
/usr/lib/ganglia/moddisk.so
/usr/lib/ganglia/modload.so
/usr/lib/ganglia/modmem.so
/usr/lib/ganglia/modmulticpu.so
/usr/lib/ganglia/modnet.so
/usr/lib/ganglia/modproc.so
/usr/lib/ganglia/modpython.so
/usr/lib/ganglia/modsys.so
/usr/share/ganglia-webfrontend
/usr/share/doc/ganglia-monitor
/usr/share/doc/ganglia-webfrontend
/usr/share/doc/libganglia1
/usr/share/doc/libganglia1-dev
/usr/share/doc/ganglia-monitor/NEWS.gz
/usr/share/doc/ganglia-monitor/README.Debian
/usr/share/doc/ganglia-monitor/changelog.Debian.gz
/usr/share/doc/ganglia-monitor/copyright
/usr/share/doc/ganglia-webfrontend/changelog.Debian.gz
/usr/share/doc/ganglia-webfrontend/copyright
/usr/share/doc/libganglia1/changelog.Debian.gz
/usr/share/doc/libganglia1/copyright
/usr/share/doc/libganglia1-dev/changelog.Debian.gz
/usr/share/doc/libganglia1-dev/copyright
/usr/share/ganglia-webfrontend/auth.php
/usr/share/ganglia-webfrontend/class.TemplatePower.inc.php
/usr/share/ganglia-webfrontend/cluster_view.php
/usr/share/ganglia-webfrontend/conf.php
/usr/share/ganglia-webfrontend/eval_config.php
/usr/share/ganglia-webfrontend/footer.php
/usr/share/ganglia-webfrontend/functions.php
/usr/share/ganglia-webfrontend/ganglia.php
/usr/share/ganglia-webfrontend/get_context.php
/usr/share/ganglia-webfrontend/get_ganglia.php
/usr/share/ganglia-webfrontend/graph.d
/usr/share/ganglia-webfrontend/graph.php
/usr/share/ganglia-webfrontend/grid_tree.php
/usr/share/ganglia-webfrontend/header.php
/usr/share/ganglia-webfrontend/host_view.php
/usr/share/ganglia-webfrontend/index.php
/usr/share/ganglia-webfrontend/meta_view.php
/usr/share/ganglia-webfrontend/physical_view.php
/usr/share/ganglia-webfrontend/pie.php
/usr/share/ganglia-webfrontend/show_node.php
/usr/share/ganglia-webfrontend/styles.css
/usr/share/ganglia-webfrontend/templates
/usr/share/ganglia-webfrontend/version.php
/usr/share/ganglia-webfrontend/graph.d/cpu_report.php
/usr/share/ganglia-webfrontend/graph.d/load_report.php
/usr/share/ganglia-webfrontend/graph.d/mem_report.php
/usr/share/ganglia-webfrontend/graph.d/metric.php
/usr/share/ganglia-webfrontend/graph.d/network_report.php
/usr/share/ganglia-webfrontend/graph.d/packet_report.php
/usr/share/ganglia-webfrontend/graph.d/sample_report.php
/usr/share/ganglia-webfrontend/templates/default
/usr/share/ganglia-webfrontend/templates/default/cluster_extra.tpl
/usr/share/ganglia-webfrontend/templates/default/cluster_view.tpl
/usr/share/ganglia-webfrontend/templates/default/footer.tpl
/usr/share/ganglia-webfrontend/templates/default/grid_tree.tpl
/usr/share/ganglia-webfrontend/templates/default/header-nobanner.tpl
/usr/share/ganglia-webfrontend/templates/default/header.tpl
/usr/share/ganglia-webfrontend/templates/default/host_extra.tpl
/usr/share/ganglia-webfrontend/templates/default/host_view.tpl
/usr/share/ganglia-webfrontend/templates/default/images
/usr/share/ganglia-webfrontend/templates/default/meta_view.tpl
/usr/share/ganglia-webfrontend/templates/default/node_extra.tpl
/usr/share/ganglia-webfrontend/templates/default/physical_view.tpl
/usr/share/ganglia-webfrontend/templates/default/show_node.tpl
/usr/share/ganglia-webfrontend/templates/default/images/cluster_0-24.jpg
/usr/share/ganglia-webfrontend/templates/default/images/cluster_25-49.jpg
/usr/share/ganglia-webfrontend/templates/default/images/cluster_50-74.jpg
/usr/share/ganglia-webfrontend/templates/default/images/cluster_75-100.jpg
/usr/share/ganglia-webfrontend/templates/default/images/cluster_overloaded.jpg
/usr/share/ganglia-webfrontend/templates/default/images/cluster_private.jpg
/usr/share/ganglia-webfrontend/templates/default/images/grid_0-24.jpg
/usr/share/ganglia-webfrontend/templates/default/images/grid_25-49.jpg
/usr/share/ganglia-webfrontend/templates/default/images/grid_50-74.jpg
/usr/share/ganglia-webfrontend/templates/default/images/grid_75-100.jpg
/usr/share/ganglia-webfrontend/templates/default/images/grid_overloaded.jpg
/usr/share/ganglia-webfrontend/templates/default/images/grid_private.jpg
/usr/share/ganglia-webfrontend/templates/default/images/logo.jpg
/usr/share/ganglia-webfrontend/templates/default/images/node_0-24.jpg
/usr/share/ganglia-webfrontend/templates/default/images/node_25-49.jpg
/usr/share/ganglia-webfrontend/templates/default/images/node_50-74.jpg
/usr/share/ganglia-webfrontend/templates/default/images/node_75-100.jpg
/usr/share/ganglia-webfrontend/templates/default/images/node_dead.jpg
/usr/share/ganglia-webfrontend/templates/default/images/node_overloaded.jpg
/var/cache/apt/archives/ganglia-monitor_3.1.7-1_amd64.deb
/var/cache/apt/archives/ganglia-webfrontend_3.1.7-1_all.deb
/var/cache/apt/archives/libganglia1-dev_3.1.7-1_amd64.deb
/var/cache/apt/archives/libganglia1_3.1.7-1_amd64.deb
/var/lib/ganglia
/var/lib/dpkg/info/ganglia-monitor.conffiles
/var/lib/dpkg/info/ganglia-monitor.list
/var/lib/dpkg/info/ganglia-monitor.md5sums
/var/lib/dpkg/info/ganglia-monitor.postinst
/var/lib/dpkg/info/ganglia-monitor.postrm
/var/lib/dpkg/info/ganglia-monitor.prerm
/var/lib/dpkg/info/ganglia-webfrontend.conffiles
/var/lib/dpkg/info/ganglia-webfrontend.config
/var/lib/dpkg/info/ganglia-webfrontend.list
/var/lib/dpkg/info/ganglia-webfrontend.md5sums
/var/lib/dpkg/info/ganglia-webfrontend.postinst
/var/lib/dpkg/info/ganglia-webfrontend.postrm
/var/lib/dpkg/info/ganglia-webfrontend.templates
/var/lib/dpkg/info/libganglia1-dev.list
/var/lib/dpkg/info/libganglia1-dev.md5sums
/var/lib/dpkg/info/libganglia1.list
/var/lib/dpkg/info/libganglia1.md5sums
/var/lib/dpkg/info/libganglia1.postinst
/var/lib/dpkg/info/libganglia1.postrm
/var/lib/dpkg/info/libganglia1.shlibs
/var/lib/ganglia/rrds
/var/lib/ganglia/rrds/__SummaryInfo__
/var/lib/ganglia/rrds/unspecified
/var/lib/ganglia/rrds/__SummaryInfo__/boottime.rrd
/var/lib/ganglia/rrds/__SummaryInfo__/bytes_in.rrd
/var/lib/ganglia/rrds/__SummaryInfo__/bytes_out.rrd
/var/lib/ganglia/rrds/__SummaryInfo__/cpu_aidle.rrd
/var/lib/ganglia/rrds/__SummaryInfo__/cpu_idle.rrd
/var/lib/ganglia/rrds/__SummaryInfo__/cpu_nice.rrd
/var/lib/ganglia/rrds/__SummaryInfo__/cpu_num.rrd
/var/lib/ganglia/rrds/__SummaryInfo__/cpu_speed.rrd
/var/lib/ganglia/rrds/__SummaryInfo__/cpu_system.rrd
/var/lib/ganglia/rrds/__SummaryInfo__/cpu_user.rrd
/var/lib/ganglia/rrds/__SummaryInfo__/cpu_wio.rrd
/var/lib/ganglia/rrds/__SummaryInfo__/disk_free.rrd
/var/lib/ganglia/rrds/__SummaryInfo__/disk_total.rrd
/var/lib/ganglia/rrds/__SummaryInfo__/load_fifteen.rrd
/var/lib/ganglia/rrds/__SummaryInfo__/load_five.rrd
/var/lib/ganglia/rrds/__SummaryInfo__/load_one.rrd
/var/lib/ganglia/rrds/__SummaryInfo__/mem_buffers.rrd
/var/lib/ganglia/rrds/__SummaryInfo__/mem_cached.rrd
/var/lib/ganglia/rrds/__SummaryInfo__/mem_free.rrd
/var/lib/ganglia/rrds/__SummaryInfo__/mem_shared.rrd
/var/lib/ganglia/rrds/__SummaryInfo__/mem_total.rrd
/var/lib/ganglia/rrds/__SummaryInfo__/part_max_used.rrd
/var/lib/ganglia/rrds/__SummaryInfo__/pkts_in.rrd
/var/lib/ganglia/rrds/__SummaryInfo__/pkts_out.rrd
/var/lib/ganglia/rrds/__SummaryInfo__/proc_run.rrd
/var/lib/ganglia/rrds/__SummaryInfo__/proc_total.rrd
/var/lib/ganglia/rrds/__SummaryInfo__/swap_free.rrd
/var/lib/ganglia/rrds/__SummaryInfo__/swap_total.rrd
/var/lib/ganglia/rrds/unspecified/__SummaryInfo__
/var/lib/ganglia/rrds/unspecified/hp
/var/lib/ganglia/rrds/unspecified/__SummaryInfo__/boottime.rrd
/var/lib/ganglia/rrds/unspecified/__SummaryInfo__/bytes_in.rrd
/var/lib/ganglia/rrds/unspecified/__SummaryInfo__/bytes_out.rrd
/var/lib/ganglia/rrds/unspecified/__SummaryInfo__/cpu_aidle.rrd
/var/lib/ganglia/rrds/unspecified/__SummaryInfo__/cpu_idle.rrd
/var/lib/ganglia/rrds/unspecified/__SummaryInfo__/cpu_nice.rrd
/var/lib/ganglia/rrds/unspecified/__SummaryInfo__/cpu_num.rrd
/var/lib/ganglia/rrds/unspecified/__SummaryInfo__/cpu_speed.rrd
/var/lib/ganglia/rrds/unspecified/__SummaryInfo__/cpu_system.rrd
/var/lib/ganglia/rrds/unspecified/__SummaryInfo__/cpu_user.rrd
/var/lib/ganglia/rrds/unspecified/__SummaryInfo__/cpu_wio.rrd
/var/lib/ganglia/rrds/unspecified/__SummaryInfo__/disk_free.rrd
/var/lib/ganglia/rrds/unspecified/__SummaryInfo__/disk_total.rrd
/var/lib/ganglia/rrds/unspecified/__SummaryInfo__/load_fifteen.rrd
/var/lib/ganglia/rrds/unspecified/__SummaryInfo__/load_five.rrd
/var/lib/ganglia/rrds/unspecified/__SummaryInfo__/load_one.rrd
/var/lib/ganglia/rrds/unspecified/__SummaryInfo__/mem_buffers.rrd
/var/lib/ganglia/rrds/unspecified/__SummaryInfo__/mem_cached.rrd
/var/lib/ganglia/rrds/unspecified/__SummaryInfo__/mem_free.rrd
/var/lib/ganglia/rrds/unspecified/__SummaryInfo__/mem_shared.rrd
/var/lib/ganglia/rrds/unspecified/__SummaryInfo__/mem_total.rrd
/var/lib/ganglia/rrds/unspecified/__SummaryInfo__/part_max_used.rrd
/var/lib/ganglia/rrds/unspecified/__SummaryInfo__/pkts_in.rrd
/var/lib/ganglia/rrds/unspecified/__SummaryInfo__/pkts_out.rrd
/var/lib/ganglia/rrds/unspecified/__SummaryInfo__/proc_run.rrd
/var/lib/ganglia/rrds/unspecified/__SummaryInfo__/proc_total.rrd
/var/lib/ganglia/rrds/unspecified/__SummaryInfo__/swap_free.rrd
/var/lib/ganglia/rrds/unspecified/__SummaryInfo__/swap_total.rrd
/var/lib/ganglia/rrds/unspecified/hp/boottime.rrd
/var/lib/ganglia/rrds/unspecified/hp/bytes_in.rrd
/var/lib/ganglia/rrds/unspecified/hp/bytes_out.rrd
/var/lib/ganglia/rrds/unspecified/hp/cpu_aidle.rrd
/var/lib/ganglia/rrds/unspecified/hp/cpu_idle.rrd
/var/lib/ganglia/rrds/unspecified/hp/cpu_nice.rrd
/var/lib/ganglia/rrds/unspecified/hp/cpu_num.rrd
/var/lib/ganglia/rrds/unspecified/hp/cpu_speed.rrd
/var/lib/ganglia/rrds/unspecified/hp/cpu_system.rrd
/var/lib/ganglia/rrds/unspecified/hp/cpu_user.rrd
/var/lib/ganglia/rrds/unspecified/hp/cpu_wio.rrd
/var/lib/ganglia/rrds/unspecified/hp/disk_free.rrd
/var/lib/ganglia/rrds/unspecified/hp/disk_total.rrd
/var/lib/ganglia/rrds/unspecified/hp/load_fifteen.rrd
/var/lib/ganglia/rrds/unspecified/hp/load_five.rrd
/var/lib/ganglia/rrds/unspecified/hp/load_one.rrd
/var/lib/ganglia/rrds/unspecified/hp/mem_buffers.rrd
/var/lib/ganglia/rrds/unspecified/hp/mem_cached.rrd
/var/lib/ganglia/rrds/unspecified/hp/mem_free.rrd
/var/lib/ganglia/rrds/unspecified/hp/mem_shared.rrd
/var/lib/ganglia/rrds/unspecified/hp/mem_total.rrd
/var/lib/ganglia/rrds/unspecified/hp/part_max_used.rrd
/var/lib/ganglia/rrds/unspecified/hp/pkts_in.rrd
/var/lib/ganglia/rrds/unspecified/hp/pkts_out.rrd
/var/lib/ganglia/rrds/unspecified/hp/proc_run.rrd
/var/lib/ganglia/rrds/unspecified/hp/proc_total.rrd
/var/lib/ganglia/rrds/unspecified/hp/swap_free.rrd
/var/lib/ganglia/rrds/unspecified/hp/swap_total.rrd
/var/lib/update-rc.d/ganglia-monitor

root@hp:~# ps aux | grep ganglia

    ganglia   8635  0.0  0.0  54912  2208 ?        Ss   00:31   0:00 /usr/sbin/gmond
    root      8918  0.0  0.0   8952   876 pts/0    S+   00:33   0:00 grep --color=auto ganglia


    
</entry>
<entry [Thu 2011:04:07 14:12:02 EST] INSTALLED SGE ON UBUNTU 10.10>

1. INSTALLED SGE

USED UBUNTU SOFTWARE CENTER
gridengine-master   Distributed resource management - Master Server
gridengine-exec     Distributed resource management - Execution Server
gridengine-common   Distributed resource management - common files (INSTALLED WITH ABOVE)
gridengine-client   Utilities for Grid Engine queue management
gridengine-qmon     Graphical utilities for Grid Engine queue management

ALTERNATELY, COULD HAVE RUN ON THE COMMAND LINE:

sudo apt-get install gridengine-master gridengine-exec gridengine-client gridengine-qmon gridengine-common


CHECK SGE IS RUNNING:
ps aux | grep sge
    sgeadmin  3646  0.0  0.1 159424  4844 ?        Sl   13:59   0:01 /usr/lib/gridengine/sge_qmaster
    sgeadmin  3818  0.0  0.0  65524  2012 ?        Sl   14:01   0:00 /usr/lib/gridengine/sge_execd
    syoung    4650  0.0  0.0   8952   876 pts/1    S+   15:11   0:00 grep --color=auto sge


BUT NO /common/sge FILE DIRECTORY!


PROBLEM:

GET THIS ERROR WHEN INSTALLING WHICH LEADS TO $SGE_ROOT DIRECTORY NOT BEING CREATED

    Setting up gridengine-exec (6.2u5-1ubuntu1) ...
    error: communication error for "hp/execd/1" running on port 6445: "can't bind socket"
    error: commlib error: can't bind socket (no additional information available)
    ..........................
    critical error: abort qmaster registration due to communication errors
    daemonize error: child exited before sending daemonize state


FULL ERROR OUTPUT:


sudo apt-get install gridengine-master gridengine-exec gridengine-client gridengine-qmon gridengine-common
    
    sh: getcwd() failed: No such file or directory
    sh: getcwd() failed: No such file or directory
    sh: getcwd() failed: No such file or directory
    Preconfiguring packages ...
    sh: getcwd() failed: No such file or directory
    sh: getcwd() failed: No such file or directory
    sh: getcwd() failed: No such file or directory
    sh: getcwd() failed: No such file or directory
    sh: getcwd() failed: No such file or directory
    Selecting previously deselected package gridengine-common.
    (Reading database ... 184002 files and directories currently installed.)
    Unpacking gridengine-common (from .../gridengine-common_6.2u5-1ubuntu1_all.deb) ...
    Selecting previously deselected package gridengine-client.
    Unpacking gridengine-client (from .../gridengine-client_6.2u5-1ubuntu1_amd64.deb) ...
    Selecting previously deselected package gridengine-exec.
    Unpacking gridengine-exec (from .../gridengine-exec_6.2u5-1ubuntu1_amd64.deb) ...
    Selecting previously deselected package gridengine-master.
    Unpacking gridengine-master (from .../gridengine-master_6.2u5-1ubuntu1_amd64.deb) ...
    Selecting previously deselected package gridengine-qmon.
    Unpacking gridengine-qmon (from .../gridengine-qmon_6.2u5-1ubuntu1_amd64.deb) ...
    Processing triggers for man-db ...
    Processing triggers for ureadahead ...
    Setting up gridengine-common (6.2u5-1ubuntu1) ...
    
    Creating config file /etc/default/gridengine with new version
    Setting up gridengine-client (6.2u5-1ubuntu1) ...
    Setting up gridengine-exec (6.2u5-1ubuntu1) ...
    error: communication error for "hp/execd/1" running on port 6445: "can't bind socket"
    error: commlib error: can't bind socket (no additional information available)
    ..........................
    critical error: abort qmaster registration due to communication errors
    daemonize error: child exited before sending daemonize state
    Setting up gridengine-master (6.2u5-1ubuntu1) ...
    Initializing cluster with the following parameters:
     => SGE_ROOT: /var/lib/gridengine
     => SGE_CELL: default
     => Spool directory: /var/spool/gridengine/spooldb
     => Initial manager user: sgeadmin
    Initializing spool (/var/spool/gridengine/spooldb)
    Initializing global configuration based on /usr/share/gridengine/default-configuration
    Initializing complexes based on /usr/share/gridengine/centry
    Initializing usersets based on /usr/share/gridengine/usersets
    Adding user sgeadmin as a manager
    Cluster creation complete
    Setting up gridengine-qmon (6.2u5-1ubuntu1) ...


SO TRIED WITH AMD 64-BIT VERSION DOWNLOADED FROM HERE:

http://pkgs.org/ubuntu-10.10/ubuntu-universe-amd64/11/

cd /home/syoung/software/sge
ll
    -rw-r--r--  1 syoung syoung 9536470 2011-04-07 21:52 gridengine-client_6.2u5-1ubuntu1_amd64.deb
    -rw-r--r--  1 syoung syoung 1545144 2011-04-07 21:47 gridengine-exec_6.2u5-1ubuntu1_amd64.deb
    -rw-r--r--  1 syoung syoung 5616934 2011-04-07 21:50 gridengine-master_6.2u5-1ubuntu1_amd64.deb
    -rw-r--r--  1 syoung syoung 1578394 2011-04-07 21:51 gridengine-qmon_6.2u5-1ubuntu1_amd64.deb

cd /home/syoung/software/sge
sudo dpkg -i gridengine-client_6.2u5-1ubuntu1_amd64.deb  gridengine-master_6.2u5-1ubuntu1_amd64.deb  gridengine-qmon_6.2u5-1ubuntu1_amd64.deb

    OK

sudo dpkg -i gridengine-exec_6.2u5-1ubuntu1_amd64.deb  

    GET SAME ERROR:

SO TRIED WITH 6.2u4 VERSION:

https://launchpad.net/ubuntu/maverick/+package/gridengine-client


DOWNLOADED FROM HERE:

https://launchpad.net/ubuntu/maverick/amd64/gridengine-exec/6.2u4-2ubuntu1

gridengine-common_6.2u4-2ubuntu1_all.deb


BUT SAME ERROR, SO COULD BE PORT 6445 IS BEING USED...

netstat -anp | grep 644

tcp        0      0 0.0.0.0:6444            0.0.0.0:*               LISTEN      6918/sge_qmaster
tcp        0      0 0.0.0.0:6445            0.0.0.0:*               LISTEN      3067/sge_execd  
tcp        0      0 192.168.0.102:42289     192.168.0.102:6444      ESTABLISHED 3067/sge_execd  
tcp        0      0 192.168.0.102:6444      192.168.0.102:42289     ESTABLISHED 6918/sge_qmaster

AND THERE ARE RUNNING INSTANCES OF execd AND qmaster:

ps aux | grep sge

    sgeadmin  3067  0.0  0.0  57332  2008 ?        Sl   19:19   0:03 /usr/lib/gridengine/sge_execd
    sgeadmin  6918  0.0  0.1 134848  4804 ?        Sl   22:14   0:00 /usr/lib/gridengine/sge_qmaster
    root      7178  0.0  0.0      0     0 pts/0    Z    22:21   0:00 [sge_execd] < defunct>
    root      7262  0.0  0.0   8956   876 pts/1    S+   22:31   0:00 grep --color=auto sge


SO KILLED THEM AND TRIED AGAIN:

sudo dpkg -i gridengine-exec_6.2u4-2ubuntu1_amd64.deb

    (Reading database ... 184440 files and directories currently installed.)
    Preparing to replace gridengine-exec 6.2u4-2ubuntu1 (using gridengine-exec_6.2u4-2ubuntu1_amd64.deb) ...
    Unpacking replacement gridengine-exec ...
    Setting up gridengine-exec (6.2u4-2ubuntu1) ...
    error: can't connect to service
    error: can't get configuration from qmaster -- backgrounding
    Processing triggers for man-db ...
    Processing triggers for ureadahead ...

    OK

THEN SUDDENLY GOT TWO WIRELESS PASSWORD PROMPTS...

netstat

    Active Internet connections (w/o servers)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State      
    tcp        0      0 hp:38309                yw-in-f139.1e100.ne:www ESTABLISHED
    tcp        0      0 hp:59992www ESTABLISHED
    tcp        0      0 hp:40355                               lon-g005.uk.intelli: a184-84-220-185.dep:www ESTABLISHED
    tcp        1      0 localhost.localdo:57853 localhost.localdo:59767 CLOSE_WAIT 
    tcp        0      0 hp:47074                mail.velocityreview:www ESTABLISHED
    tcp        0      0 hp:47078                mail.velocityreview:www ESTABLISHED
    tcp      415      0 hp:41260                a184-84-220-203.dep:www CLOSE_WAIT 
    tcp        0      0 hp:35775                ec2-184-73-240-165.:www ESTABLISHED
    tcp        0      0 hp:47076                mail.velocityreview:www ESTABLISHED
    tcp        0      0 hp:42196                yx-in-f120.1e100.ne:www ESTABLISHED
    tcp        0      0 hp:40353                a184-84-220-185.dep:www ESTABLISHED
    tcp        0      0 hp:54757                a.tribalfusion.com:www  ESTABLISHED
    tcp        0      0 hp:41259                a184-84-220-203.dep:www ESTABLISHED
    tcp        0      0 hp:47077                mail.velocityreview:www ESTABLISHED
    tcp        0      0 hp:54762                a.tribalfusion.com:www  ESTABLISHED
    tcp        0      0 localhost.localdo:41030 localhost.localdom:amqp ESTABLISHED
    tcp        0      0 hp:40354                a184-84-220-185.dep:www ESTABLISHED
    tcp        1      0 localhost.localdo:38792 localhost.localdo:59767 CLOSE_WAIT 
    tcp        0      0 hp:40364                a184-84-220-185.dep:www ESTABLISHED
    tcp        0      0 hp:47079                mail.velocityreview:www ESTABLISHED
    tcp        0      0 localhost.localdo:40710 localhost.localdom:4369 ESTABLISHED
    tcp        0      0 hp:41258                a184-84-220-203.dep:www ESTABLISHED
    tcp        0      0 hp:38516                yw-in-f125.:xmpp-client ESTABLISHED
    tcp        0      0 localhost.localdom:4369 localhost.localdo:40710 ESTABLISHED
    tcp        0      0 hp:45329                yw-in-f167.1e100.ne:www ESTABLISHED
    tcp        1      0 hp:57194                cdce.mia005.interna:www CLOSE_WAIT 
    tcp        0      0 hp:47075                mail.velocityreview:www ESTABLISHED
    tcp        1      0 localhost.localdo:38787 localhost.localdo:59767 CLOSE_WAIT 
    tcp        0      0 hp:50212                yw-in-f156.1e100.ne:www ESTABLISHED
    tcp        0      0 hp:44853                a96-17-147-123.depl:www ESTABLISHED
    tcp        0      0 hp:40357                a184-84-220-185.dep:www ESTABLISHED
    tcp        0      0 localhost.localdom:amqp localhost.localdo:41030 ESTABLISHED
    ^Z

AND ROUTER WENT DOWN...

AFTER IT GOT BACK UP:

qstat
    error: commlib error: got select error (Connection refused)
    error: unable to send message to qmaster using port 701 on host "hp": got send error


SO OPENED PORT 701 IN /etc/services:

sge_qmaster 701/tcp # Sun Grid Engine
sge_execd   702/tcp # Sun Grid Engine


CONFIRMED HOST INFO

LIST EXECUTION HOSTS
qconf -sel
    hp

LIST SUBMIT HOSTS
qconf -sh
    hp
    

SEARCHED FOR BOOTSTRAP SCRIPT:

head /var/lib/gridengine/default/common/bootstrap

    Version: 6.2
    admin_user              sgeadmin
    default_domain          none
    ignore_fqdn             false
    spooling_method         berkeleydb
    spooling_lib            libspoolb
    spooling_params         /var/spool/gridengine/spooldb
    binary_path             /usr/sbin
    qmaster_spool_dir       /var/spool/gridengine/qmaster
    security_mode           none


SO /var/lib/gridengine IS SGE_ROOT:

locate common | grep grid
    
    /var/lib/dpkg/info/gridengine-common.postinst
    /var/lib/dpkg/info/gridengine-common.postrm
    /var/lib/dpkg/info/gridengine-common.templates
    /var/lib/gridengine/default/common
    /var/lib/gridengine/default/common/act_qmaster
    /var/lib/gridengine/default/common/bootstrap


SO CHANGED $SGE_ROOT:

echo $SGE_ROOT
export SGE_ROOT=/var/lib/gridengine


LOCATED sge_qmaster:

locate /usr | grep sge

    /usr/sbin/sge_coshepherd
    /usr/sbin/sge_execd
    /usr/sbin/sge_qmaster
    /usr/sbin/sge_shadowd
    /usr/sbin/sge_shepherd


... AND STARTED QMASTER:

/usr/sbin/sge_qmaster/usr/lib/gridengine/sge_execd


CONFIRMED THAT qstat WORKS:

qstat 
    OK
    
    
RUN TEST JOB TO CHECK:

qmon: ADDED hp AS SUBMIT HOST AND CREATED QUEUE default WITH hp AS HOST (SEE BELOW)

emacs /root/test.sh
    
    #!/bin/sh
    
    echo "Starting..."
    echo "Sleep 60 seconds"
    sleep 60;
    echo "Completed"


cd /root
chmod 755 test.sh
qsub -q default test.sh

    OK

BUT JOBS AREN'T SUBMITTED TO THE default QUEUE, INSTEAD THEY HANG:

qstat
    job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID 
    -----------------------------------------------------------------------------------------------------------------
          1 0.75000 test.sh    root         qw    04/08/2011 00:19:44                                    1        
          2 0.72741 test.sh    root         qw    04/08/2011 00:21:40                                    1        
          3 0.28467 test.sh    root         qw    04/08/2011 00:59:33                                    1        
          4 0.25000 test.sh    root         qw    04/08/2011 01:02:31                                    1        

SO RESTARTED QMASTER AND EXEC DAEMONS TO SEE IF THAT WOULD ENABLE THE default QUEUE:

CORRECT SHUTDOWN ORDER (EXECD FIRST):

qconf -ke all
qconf -km

NB: NOT THIS ORDER
qconf -km
qconf -ke all
    error: commlib error: got select error (Connection reset by peer)
    ERROR: unable to send message to qmaster using port 701 on host "hp": got send error


CORRECT STARTUP ORDER (RUN SEPARATELY):

/usr/sbin/sge_qmaster
/usr/sbin/sge_execd

NB: NOT THIS ORDER:
#/usr/sbin/sge_execd
#/usr/sbin/sge_qmaster




    error: can't find connection
    error: can't get configuration from qmaster -- backgrounding

BUT THIS TIME EXECD GIVES AN ERROR (ABOVE) EVEN THOUGH IT APPEARS TO BE RUNNING:

ps aux | grep sge

    sgeadmin  9326  0.0  0.0  57304  1364 ?        Sl   01:22   0:00 /usr/lib/gridengine/sge_execd
    sgeadmin  9334  1.5  0.1 134848  5124 ?        Sl   01:22   0:00 /usr/lib/gridengine/sge_qmaster
    root      9348  0.0  0.0   8952   872 pts/0    S+   01:22   0:00 grep --color=auto sge



FOLLOWED THE STEP BELOW TO ADD USERS syoung AND root TO THE arusers GROUP:

Tab "Use access" -> allow access to user group arusers;


BUT STILL GOT THIS ERROR EVEN AFTER RESTARTING QMASTER AND EXECD:

root@hp:/tmp# qstat

    error: commlib error: got select error (Connection refused)
    error: unable to send message to qmaster using port 701 on host "hp": got send error


CHECKED ERROR LOG:

tail /tmp/execd_messages.2097 

    04/08/2011 12:46:58|  main|hp|E|getting configuration: denied: client (hp/execd/1) uses old GDI version 6.2u4 while qmaster uses newer version 6.2u5
    04/08/2011 12:48:30|  main|hp|E|commlib error: got read error (closing "hp/qmaster/1")



SOLUTION: REINSTALL WITH ALL 6.2u4 FILES (BECAUSE THEY INCLUDE THE *common FILE)

LIST ALL INSTALLED GRID ENGINE PACKAGES:

dpkg -l | grep gridengine

    ii  gridengine-client                    6.2u5-1ubuntu1                                    Utilities for Grid Engine queue management
    ii  gridengine-common                    6.2u4-2ubuntu1                                    Distributed resource management - common files
    ii  gridengine-exec                      6.2u4-2ubuntu1                                    Distributed resource management - Execution Server
    ii  gridengine-master                    6.2u5-1ubuntu1                                    Distributed resource management - Master Server
    ii  gridengine-qmon                      6.2u5-1ubuntu1                                    Graphical utilities for Grid Engine queue management



UNINSTALL 6.2u4*common AND OTHERS (common WOULD NOT UNINSTALL ON ITS OWN BECAUSE OF DEPENDENCIES):

dpkg -r gridengine-client gridengine-common gridengine-exec gridengine-master gridengine-qmon 
    Removing gridengine-client ...
    Removing gridengine-exec ...
    Removing gridengine-master ...
    Removing gridengine-qmon ...
    Removing gridengine-common ...
    Processing triggers for man-db ...
    Processing triggers for ureadahead ...
    ureadahead will be reprofiled on next reboot


CHECKED ALL PACKAGES WERE UNINSTALLED - SHOWS 'rc' (REMAINING CONFIGURATION):

sudo dpkg -l | grep gridengine

    rc  gridengine-client                    6.2u5-1ubuntu1                                    Utilities for Grid Engine queue management
    rc  gridengine-common                    6.2u4-2ubuntu1                                    Distributed resource management - common files
    rc  gridengine-exec                      6.2u4-2ubuntu1                                    Distributed resource management - Execution Server
    rc  gridengine-master                    6.2u5-1ubuntu1                                    Distributed resource management - Master Server
    rc  gridengine-qmon                      6.2u5-1ubuntu1                                    Graphical utilities for Grid Engine queue management


DOWNLOADED gridengine-common (THE 6.2u5 VERSION):
https://launchpad.net/ubuntu/maverick/amd64/gridengine-common/6.2u5-1ubuntu1
GENERAL:
https://launchpad.net/ubuntu/maverick/+package/gridengine-client


REINSTALLED WITH ALL 6.2u5:

dpkg -i gridengine-client_6.2u5-1ubuntu1_amd64.deb gridengine-common_6.2u5-1ubuntu1_all.deb gridengine-exec_6.2u5-1ubuntu1_amd64.deb gridengine-master_6.2u5-1ubuntu1_amd64.deb gridengine-qmon_6.2u5-1ubuntu1_amd64.deb 

    ...
    Setting up gridengine-exec (6.2u5-1ubuntu1) ...
    error: can't find connection
    error: can't get configuration from qmaster -- backgrounding
    Setting up gridengine-master (6.2u5-1ubuntu1) ...
    Processing triggers for ureadahead ...


CHECKED SGE_ROOT AND RUNNING PROCESSES:

echo $SGE_ROOT
/var/lib/gridengine

root@hp:/home/syoung/software/sge# ps aux | grep sge

    sgeadmin  3234  0.1  0.0  58356  2524 ?        Sl   13:34   0:00 /usr/lib/gridengine/sge_execd
    sgeadmin  3272  0.1  0.1 134848  5576 ?        Sl   13:34   0:00 /usr/lib/gridengine/sge_qmaster
    sgeadmin  3286  0.0  0.0  29776  2040 ?        S    13:34   0:00 /usr/lib/gridengine/sge_shepherd -bg
    root      3294  0.0  0.0   8952   876 pts/0    S+   13:34   0:00 grep --color=auto sge


AND QSTAT WORKS:

qstat
    
    OK!


SUBMIT JOB:

qsub -q default /root/test.sh
    

SUBMITS TO QUEUE BUT DOES NOT RUN:

qstat
job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID 
-----------------------------------------------------------------------------------------------------------------
      6 0.00000 test.sh    root         qw    04/08/2011 13:42:41                                    1        


qstat -j 6

    ==============================================================
    job_number:                 6
    exec_file:                  job_scripts/6
    submission_time:            Fri Apr  8 13:42:41 2011
    owner:                      root
    uid:                        0
    group:                      root
    gid:                        0
    sge_o_home:                 /root
    sge_o_log_name:             root
    sge_o_shell:                /bin/bash
    sge_o_workdir:              /home/syoung/software/sge
    sge_o_host:                 hp
    account:                    sge
    mail_list:                  root@hp
    notify:                     FALSE
    job_name:                   test.sh
    jobshare:                   0
    hard_queue_list:            default
    env_list:                   
    script_file:                /root/test.sh
    usage    1:                 cpu=00:00:00, mem=0.00000 GBs, io=0.00000, vmem=N/A, maxvmem=N/A
    scheduling info:            queue instance "default@hp" dropped because it is full
                                All queues dropped because of overload or full


HOWEVER, JOB RUNS AND COMPLETES:

ll test*
    -rw-r--r-- 1 root root  39 2011-04-08 13:46 test.out
    -rwxr-xr-x 1 root root 135 2011-04-08 13:45 test.sh
    -rwxr-xr-x 1 root root  81 2011-04-08 00:10 test.sh~
    -rw-r--r-- 1 root root   0 2011-04-08 13:34 test.sh.e1
    -rw-r--r-- 1 root root   0 2011-04-08 13:35 test.sh.e2
    -rw-r--r-- 1 root root   0 2011-04-08 13:36 test.sh.e3
    -rw-r--r-- 1 root root   0 2011-04-08 13:38 test.sh.e4
    -rw-r--r-- 1 root root   0 2011-04-08 13:42 test.sh.e6
    -rw-r--r-- 1 root root   0 2011-04-08 13:45 test.sh.e7
    -rw-r--r-- 1 root root 123 2011-04-08 13:35 test.sh.o1
    -rw-r--r-- 1 root root 123 2011-04-08 13:36 test.sh.o2
    -rw-r--r-- 1 root root 123 2011-04-08 13:37 test.sh.o3
    -rw-r--r-- 1 root root 123 2011-04-08 13:39 test.sh.o4
    -rw-r--r-- 1 root root 123 2011-04-08 13:43 test.sh.o6
    -rw-r--r-- 1 root root  84 2011-04-08 13:45 test.sh.o7


THE OUTPUT IS CORRECT:

cat test.out

    Starting...
    Sleep 60 seconds
    Completed


ALTHOUGH THE SGE OUTPUT FILE HAS THIS:

cat /root/test.sh.o7

    Warning: no access to tty (Bad file descriptor).
    Thus no job control in this shell.

Answer    : This warning is caused if you are using the tcsh or csh as shell for submitting job. It is safe to ignore this warning. Alternatively you can qsub -S /bin/sh to run your program in different shell.


ADDED #$ -S /bin/sh TO test.sh AND THE ABOVE OUTPUT DISAPPEARED BUT GOT THIS IN SGE ERROR FILE:

cat /root/test.sh.e10
    stdin: is not a tty


CHANGED QUEUE DEFAULT SHELL TO /bin/sh BUT STILL GOT SAME ERROR:

QMON -> Queue Configuration -> SELECT QUEUE default  -> Modify -> Shell -> /bin/sh


SOLUTION: RESTART?

STOP:
qconf -ke all
    sent shutdown notification to  execd host hp
qconf -km
    root@hp kills qmaster


START:
/usr/sbin/sge_qmaster 
root@hp:~# /usr/sbin/sge_execd 


CONFIRM RUNNING:

ps aux  | grep sge
    sgeadmin  3930  0.1  0.1 134848  5080 ?        Sl   14:20   0:00 /usr/lib/gridengine/sge_qmaster
    sgeadmin  3946  0.0  0.0  57332  1980 ?        Sl   14:20   0:00 /usr/lib/gridengine/sge_execd
    root      3953  0.0  0.0   8952   876 pts/0    S+   14:21   0:00 grep --color=auto sge


CAN SUBMIT AND RUN JOBS BUT ONLY RUNNING ONE JOB AT A TIME:

qconf -mq default

SET slots TO 3

NOW CAN RUN 3 CPUS:

qstat
job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID 
-----------------------------------------------------------------------------------------------------------------
     15 0.75000 test.sh    root         r     04/08/2011 14:36:54 default@hp                         1        
     16 0.50000 test.sh    root         r     04/08/2011 14:36:54 default@hp                         1        
     17 0.25000 test.sh    root         r     04/08/2011 14:36:57 default@hp                         1        
     18 0.00000 test.sh    root         qw    04/08/2011 14:37:00                                    1        


    OK!!
    
    
FIXED EMPTY SGE_ROOT:

PROBLEM: DESPITE THE FACT THAT SGE_ROOT IS SET IN .bash_profile, IT DOES NOT APPEAR IN THE PATH AFTER sudo su AND MUST BE SET (AGAIN) MANUALLY WITH:

SOLUTION: DISCOVERED THAT SGE_ROOT WAS RESET TO /common/sge LOWER DOWN IN MY .bash_profile!
REMOVING IT SOLVED THE PROBLEM.




NB: CAN ALSO PUT ENV VARIABLES INTO env_keep LIST IN /etc/sudoers:

visudo

Defaults env_keep += "SGE_CELL SGE_ARCH SGE_EXECD_PORT SGE_QMASTER_PORT SGE_ROOT"



ADDED www-data TO USERS:

User Configuration -> type: www-data -> Add
User Configuration -> Userset -> Highlight userset arusers --> Modify -> Input user name in User/Group field -> Click Ok to finish






2. CREATE A QUEUE
http://pka.engr.ccny.cuny.edu/~jmao/node/49

USING QMON

sudo qmon

Configure Host
--------------


Host Configuration -> Administration Host -> Add master node
Host Configuration -> Submit Host -> Add master node
Host Configuration -> Execution Host -> Add slave nodes such as node01, node02 
    OK
 

Configure Users
---------------
Users have to be added in order to submit jobs with SGE.
In this example, a user is added to an existing group and later this group will be allowed to submit jobs. Everything else is left as default values.

User Configuration -> Userset -> Highlight userset arusers --> Modify -> Input user name in User/Group field -> Click Ok to finish
    OK
 

Configure Queue
---------------
Host Configuration deals what computing resources are available
User Configuration defines who have access to the resources
Queue Control defines ways to connect hosts and users

Queue Control -> Hosts -> Confirm the execution hosts show up there. 
    OK - hp shows
    

# CHANGED SLOTS AND CPU TO: 3
    
Queue Control -> Cluster Queues -> Click on Add -> Name the queue, add execution nodes to Hostlist

User
User access -> allow access to user group arusers;
    OK

COMPLEX Configuration -> Field Slots -> SET TO 3

<!--Tab "General Configuration" -> Field "Slots" -> Raise the number to total CPU cores on slave nodes (ok to use a bigger number than actual CPU cores).-->


SKIPPED THIS:

Tab "Queue Control" -> Tab "Queue Instances" -> This is the place to manually assign hosts to queues, and control the state (active, suspend ...) of hosts.

Scheduler 
---------

Scheduler Configuration -> Schedule Interval --> 3



ALTERNATELY, DO IT ON THE COMMAND LINE:
http://www.machlea.com/bohemian/?p=8

EDIT CONFIG FILE:

export EDITOR="emacs -nw"
qconf -mq default

    qname                 default
    hostlist              hp
    seq_no                0
    load_thresholds       np_load_avg=1.75
    suspend_thresholds    NONE
    nsuspend              1
    suspend_interval      00:05:00
    priority              0
    min_cpu_interval      00:05:00
    processors            UNDEFINED
    qtype                 BATCH INTERACTIVE
    ckpt_list             NONE
    pe_list               make
    rerun                 FALSE
    slots                 1
    tmpdir                /tmp
    shell                 /bin/csh
    prolog                NONE
    epilog                NONE
    shell_start_mode      posix_compliant
    starter_method        NONE
    suspend_method        NONE
    resume_method         NONE
    terminate_method      NONE
    notify                00:00:60
    owner_list            NONE
    user_lists            NONE
    xuser_lists           NONE
    subordinate_list      NONE
    complex_values        NONE
    projects              NONE
    xprojects             NONE
    calendar              NONE
    initial_state         default
    s_rt                  INFINITY
    h_rt                  INFINITY
    s_cpu                 INFINITY
    h_cpu                 INFINITY
    s_fsize               INFINITY
    h_fsize               INFINITY
    s_data                INFINITY
    h_data                INFINITY
    s_stack               INFINITY
    h_stack               INFINITY
    s_core                INFINITY
    h_core                INFINITY
    s_rss                 INFINITY
    h_rss                 INFINITY
    s_vmem                INFINITY
    h_vmem                INFINITY


QCONF COMMANDS:

qconf -sel
    Show the list of execution hosts
    
qconf -sh
    Show administrative hosts 

Add administrative hosts 
   # qconf -ah < hostname >



Killing Daemons From the Command Line

qconf -ke[j] {< hostname>[,...] | all}
qconf -ks
qconf -km

    You must have manager or operator privileges to use these commands. See Managing Users Access for more information about manager and operator privileges.

qconf -ke
shuts down the execution daemons. However, it does not cancel active jobs. Jobs that finish while no sge_execd is running on a system are not reported to sge_qmaster until sge_execd is restarted. The job reports are not lost, however. 

qconf -kej
kills all currently active jobs and brings down all execution daemons. 
Use a comma-separated list of the execution hosts you want to shut down, or specify all to shut down all execution hosts in the cluster.

qconf -ks
shuts down the scheduler sge_schedd.

qconf -km
forces the sge_qmaster process to terminate.



qmod -dq {< cluster-queue> | < queue-instance> | < queue-domain>}

If you want to wait for any active jobs to finish before you run the shutdown procedure, use this command for each cluster queue, queue instance, or queue domain before you run the qconf sequence described above. For information about cluster queues, queue instances, and queue domains, see About Configuring Queues.

The qmod -dq command prevents new jobs from being scheduled to the disabled queue instances. You should then wait until no jobs are running in the queue instances before you kill the daemons.

Restarting Daemons From the Command Line
Log in as root on the machine on which you want to restart Grid Engine system daemons.
Type the following commands to run the startup scripts:


$SGE_ROOT/$SGE_CELL/common/sgemaster
$SGE_ROOT/$SGE_CELL/common/sgeexecd

These scripts looks for the daemons that are normally running on this host and then starts them.



SGE ERROR MESSAGES
------------------

/tmp/sge_qmaster_messages

OR

/tmp/sge_execd_messages

on the corresponding host.


NOTES
-----
http://astoryworthtelling.wordpress.com/2009/08/25/installing-sge-on-ubuntu-single-machine-local-install/

Installing SGE on ubuntu (single machine local install)

August 25, 2009 ? Joseph

I installed the torque queuing system on my local machine (quad core, so if I give it 3 slots I can still work normally with one core reserved for firefox, a media player, a text editor, a compiler and interactive runs). However the torque system is a total pain, both to set up and to use. So I uninstalled (saving my config files, so if for some reason I wanted to revert I could), and I switched to the SGE (Sun Grid Engine) queue. Installing is mostly a breeze, however I didn?t document my steps as I went along, so this might not be flawless. I?ll try again later just to check but it might be a while.
sudo apt-get install gridengine-master gridengine-exec gridengine-client gridengine-qmon gridengine-common
Then you?re going to want to fire up qmon with sudo permissions and create your queue. You?re going to want to go to queue control, add a new queue name as suits your fancy, add a host which is your machine, it needs to resolve, i.e. ping myhostname knows what you?re talking about. This can be accomplished by adding a line to /etc/hosts or probably by just using your hostname or 127.0.0.1. I set slots to 4, which means it can use up all the cpu power when it needs to, I found I was still able to work normally when the queue is loaded (i.e. cpu usage will be at 100% on each core for the next 24 hours at least). But I could see setting it to 3 if you have a quad core machine. You?re also going to want to go to ?host configuration? and add your machine as a submit host. This should allow you to submit jobs from the local machine to the queue on the local machine. It?s kind of a pseudoqueue, but it gets my work done faster, so I?m not complaining. Leave a comment if you have any problems, I may be able to help you out.
One thing that you might want to change from the default setup is schedule interval under scheduler in qmon. This is how often sge checks if there is an empty slot. If you submit say 1000 jobs that take only a 1 minute each that?s 1000 cpu minutes or over 4 hours on a 4 slot cluster. If the scheduling interval is 15 seconds, your jobs will wait on average 7.5 seconds before starting, making the total time 1000(60+7.5) or 1125 cpu minutes, which is 10% longer, admittedly it is rare that you submit one minute jobs in such quantities, but I find myself sometimes submitting a large number of short jobs and given that the cost of increasing the scheduling frequency is so low I changed it from 15 seconds to 5 seconds. I have since seen a nice uptick in cpu utilization when running batches of short jobs.


</entry>


<entry [Thu Feb 17 10:28:16 EST 2011] SGE RUNTIME ENVIRONMENT VARIABLES>

MY_HOST=`hostname`
MY_DATE=`date`
env
echo "================================================================"
echo JOB_NAME=\$JOB_NAME
echo JOB_ID=\$JOB_ID
echo SGE_TASK_ID=\$SGE_TASK_ID
echo SGE_TASK_FIRST=\$SGE_TASK_FIRST
echo SGE_TASK_LAST=\$SGE_TASK_LAST
echo NSLOTS=\$NSLOTS
echo QUEUE=\$QUEUE
echo SGE_CWD_PATH=\$SGE_CWD_PATH
echo PATH=\$PATH
echo SGE_STDIN_PATH=\$SGE_STDIN_PATH
echo SGE_STDOUT_PATH=\$SGE_STDOUT_PATH
echo SGE_STDERR_PATH=\$SGE_STDERR_PATH
echo SGE_O_HOST=\$SGE_O_HOST
echo SGE_O_PATH=\$SGE_O_PATH
echo MY_TEST=\$MY_TEST
echo "================================================================"
echo "Running job JOB_NAME=\$JOB_NAME task SGE_TASK_ID=\$SGE_TASK_ID on \$MY_HOST at \$MY_DATE" 
</entry>
<entry [Wed Feb  2 13:03:11 EST 2011] FIXED ERROR "error: can't open output file" ON EXEC NODE DUE TO MISSING $SGE_TASK_ID>

PROBLEM:
GET ERROR "error: can't open output file" WHEN EXEC NODE CAN'T FIND $TASKNUM

SOLUTION:

DO 'export' OF TASKNUM ALLOCATED FROM VALUE OF $SGE_TASK_ID
    export TASKNUM=\${SGE_TASK_ID}

SUMMARY OF ERROR MESSAGE (NOTE: END OF LINE IS TRUNCATED!!!):
/opt/sge6/bin/lx24-amd64/qsub -t 1-10 -q all.q /aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/scripts/bowtie-chr22.sh
    job-array tasks:            1-2:1
    error reason    1:          02/02/2011 21:21:39 [0:3206]: error: can't open output file "/aquarius/nethome/admin/.agua/Project1/
    error reason    2:          02/02/2011 21:21:39 [0:3208]: error: can't open output file "/aquarius/nethome/admin/.agua/Project1/
    scheduling info:            queue instance "all.q@ip-10-124-247-224.ec2.internal" dropped because it is full
FULL ERROR MESSAGE IS AS FOLLOWS:
tail /opt/sge6/default/spool/exec_spool_local/ip-10-124-247-224/messages 
    02/03/2011 06:04:39|  main|ip-10-124-247-224|E|02/03/2011 06:04:38 [0:5857]: error: can't open output file "/aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/stdout/$TASKNUM/bowtie-chr22-stdout.txt": No such file or directory
    02/03/2011 06:04:39|  main|ip-10-124-247-224|C|exec of mailer "/bin/mail" failed: "No such file or directory"
    02/03/2011 06:04:54|  main|ip-10-124-247-224|E|shepherd of job 130.9 exited with exit status = 26
    02/03/2011 06:04:54|  main|ip-10-124-247-224|E|can't open usage file "active_jobs/130.9/usage" for job 130.9: No such file or directory
    02/03/2011 06:04:54|  main|ip-10-124-247-224|E|02/03/2011 06:04:53 [0:5863]: error: can't open output file "/aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/stdout/$TASKNUM/bowtie-chr22-stdout.txt": No such file or directory
    02/03/2011 06:04:54|  main|ip-10-124-247-224|E|shepherd of job 130.10 exited with exit status = 26
    02/03/2011 06:04:54|  main|ip-10-124-247-224|C|exec of mailer "/bin/mail" failed: "No such file or directory"
    02/03/2011 06:04:54|  main|ip-10-124-247-224|E|can't open usage file "active_jobs/130.10/usage" for job 130.10: No such file or directory
    02/03/2011 06:04:54|  main|ip-10-124-247-224|E|02/03/2011 06:04:53 [0:5865]: error: can't open output file "/aquarius/nethome/admin/.agua/Project1/Workflow1/chr22/stdout/$TASKNUM/bowtie-chr22-stdout.txt": No such file or directory
    02/03/2011 06:04:54|  main|ip-10-124-247-224|C|exec of mailer "/bin/mail" failed: "No such file or directory"

NB: If an error log file is not accessible for some reason, the Grid Engine software tries to log the error message to the files /tmp/sge_qmaster_messages or /tmp/sge_execd_messages on the corresponding host.


</entry>
<entry [Wed Feb  2 13:03:11 EST 2011] EXCLUDE MASTER NODE FROM QUEUE>

http://wikis.sun.com/display/GridEngine/Configuring+Hosts+From+the+Command+Line
http://wikis.sun.com/display/gridengine62u2/qconf+Cheatsheet
1. REMOVE MASTER FROM EXEC HOST LIST
qconf -de ip-10-124-245-118.ec2.internal
    Host object "ip-10-124-245-118.ec2.internal" is still referenced in cluster queue "all.q"

2. REMOVE MASTER FROM CONFIGURATION LIST:
qconf -dconf ip-10-124-245-118.ec2.internal
    root@ip-10-124-245-118.ec2.internal removed "ip-10-124-245-118.ec2.internal" from configuration list

3. REMOVE MASTER FROM HOST LIST
GET CURRENT GROUP CONFIG
qconf -shgrp @allhosts
    group_name @allhosts
    hostlist ip-10-124-247-224.ec2.internal
SET GROUP CONFIG FROM FILE
emacs allhosts.group
    group_name @allhosts
    hostlist ip-10-124-245-118.ec2.internal ip-10-124-247-224.ec2.internal
qconf -Mhgrp allhosts.group
    root@ip-10-124-245-118.ec2.internal modified "@allhosts" in host group list
CHECK NEW GROUP CONFIG
qconf -shgrp @allhosts
    
    group_name @allhosts
    hostlist ip-10-124-245-118.ec2.internal ip-10-124-247-224.ec2.internal
RESTART sgemaster
/etc/init.d/sgemaster.starcluster stop
/etc/init.d/sgemaster.starcluster start
NB: DON'T NEED TO REMOVE master FROM all.q IF THE ABOVE STEPS HAVE BEEN COMPLETED
SHOW QUEUE
qconf -sq all.q
qname                 all.q
hostlist              @allhosts
seq_no                0
load_thresholds       np_load_avg=1.75
suspend_thresholds    NONE
nsuspend              1
suspend_interval      00:05:00
priority              0
min_cpu_interval      00:05:00
processors            UNDEFINED
qtype                 BATCH INTERACTIVE
ckpt_list             NONE
pe_list               make orte
rerun                 FALSE
slots                 1,[ip-10-124-247-224.ec2.internal=2]
tmpdir                /tmp
shell                 /bin/bash
prolog                NONE
epilog                NONE
shell_start_mode      posix_compliant
starter_method        NONE
suspend_method        NONE
resume_method         NONE
terminate_method      NONE
notify                00:00:60
owner_list            NONE
user_lists            NONE
xuser_lists           NONE
subordinate_list      NONE
complex_values        NONE
projects              NONE
xprojects             NONE
calendar              NONE
initial_state         default
s_rt                  INFINITY
h_rt                  INFINITY
s_cpu                 INFINITY
h_cpu                 INFINITY
s_fsize               INFINITY
h_fsize               INFINITY
s_data                INFINITY
h_data                INFINITY
s_stack               INFINITY
h_stack               INFINITY
s_core                INFINITY
h_core                INFINITY
s_rss                 INFINITY
h_rss                 INFINITY
s_vmem                INFINITY
h_vmem                INFINITY
LOAD QUEUE FROM FILE
qconf -Aq allhosts.queue

NOTES
-----
SHOW LIST OF ALL EXECUTION HOSTS:
qconf -sel
    ip-10-124-245-118.ec2.internal
    ip-10-124-247-224.ec2.internal
REMOVE MASTER FROM EXEC HOST LIST
qconf -de ip-10-124-245-118.ec2.internal
    Host object "ip-10-124-245-118.ec2.internal" is still referenced in cluster queue "all.q"
REMOVE MASTER FROM all.q QUEUE
qconf -mq all.q
CHANGE THIS:
slots                 1,[ip-10-124-245-118.ec2.internal=2],\
                    [ip-10-124-247-224.ec2.internal=2]  
                      
TO THIS:
slots                 1,[ip-10-124-247-224.ec2.internal=2]
    root@ip-10-124-245-118.ec2.internal modified "all.q" in cluster queue list

DELETE HOST FROM THE @allhosts HOST GROUP:
qconf -mhgrp @allhosts
CHANGE FROM THIS:
group_name @allhosts
hostlist ip-10-124-245-118.ec2.internal ip-10-124-247-224.ec2.internal
TO THIS:
hostlist ip-10-124-247-224.ec2.internal
    root@ip-10-124-245-118.ec2.internal modified "@allhosts" in host group list

REMOVE MASTER FROM CONFIGURATION LIST:
qconf -dconf ip-10-124-245-118.ec2.internal
    root@ip-10-124-245-118.ec2.internal removed "ip-10-124-245-118.ec2.internal" from configuration list


NOTES
-----
GET CONF INFO:
 grep configuration qc.txt 
   [-aconf host_list]                       add configurations
   [-Aconf file_list]                       add configurations from file_list
   [-dconf host_list]                       delete local configurations
   [-mconf [host_list|global]]              modify configurations
   [-Mconf file_list]                       modify configurations from file_list
   [-msconf]                                modify scheduler configuration
   [-Msconf fname]                          modify scheduler configuration from file
   [-sconf [host_list|global]]              show configurations
   [-sconfl]                                show a list of all local configurations
   [-ssconf]                                show scheduler configuration
[root@ip-10-127-158-202 ~]# qconf -sconf
GET GROUPS INFO:
[root@ip-10-127-158-202 ~]# qconf &>qc.txt
[root@ip-10-127-158-202 ~]# grep group qc.txt   
   [-ahgrp group]                           add new host group entry
   [-Ahgrp file]                            add new host group entry from file
   [-dhgrp group]                           delete host group entry
   [-mhgrp group]                           modify host group entry
   [-Mhgrp file]                            modify host group entry from file
   [-shgrp group]                           show host group
   [-shgrp_tree group]                      show host group and used hostgroups as tree
   [-shgrp_resolved group]                  show host group with resolved hostlist
   [-shgrpl]                                show host group list
obj_nm                  "queue"|"exechost"|"pe"|"ckpt"|"hostgroup"|"resource_quota"
SHOW ALL GROUPS:
qconf -shgrpl
    
    @allhosts

http://biowiki.org/HowToAdministerSunGridEngine
remove an exec host
Examples shown here are to remove the exec host sinclair.
Delete host from whatever queue it was in (e.g. the "regular_nodes queue):
$ qconf -mq regular_nodes.q
Delete host from its host group (e.g. the "allhosts" group):
$ qconf -mhgrp @allhosts
Remove host from exec host list:
$ qconf -de sinclair
Remove from configuration list:
$ qconf -dconf sinclair
Done... try flooding the queues with si

</entry>
<entry [Wed Feb  2 13:03:11 EST 2011] SGE 6.02 qstat OPTIONS>

http://manpages.ubuntu.com/manpages/maverick/man1/qstat.1.html
OR JUST qstat:
GE 6.2u5
usage: qstat [options]
        [-cb]                             view additional binding specific parameters
        [-ext]                            view additional attributes
        [-explain a|c|A|E]                show reason for c(onfiguration ambiguous), a(larm), suspend A(larm), E(rror) state
        [-f]                              full output
        [-F [resource_attributes]]        full output and show (selected) resources of queue(s)
        [-g {c}]                          display cluster queue summary
        [-g {d}]                          display all job-array tasks (do not group)
        [-g {t}]                          display all parallel job tasks (do not group)
        [-help]                           print this help
        [-j job_identifier_list ]         show scheduler job information
        [-l resource_list]                request the given resources
        [-ne]                             hide empty queues
        [-pe pe_list]                     select only queues with one of these parallel environments
        [-q wc_queue_list]                print information on given queue
        [-qs {a|c|d|o|s|u|A|C|D|E|S}]     selects queues, which are in the given state(s)
        [-r]                              show requested resources of job(s)
        [-s {p|r|s|z|hu|ho|hs|hd|hj|ha|h|a}] show pending, running, suspended, zombie jobs,
                                          jobs with a user/operator/system/array-dependency hold, 
                                          jobs with a start time in future or any combination only.
                                          h is an abbreviation for huhohshdhjha
                                          a is an abbreviation for prsh
        [-t]                              show task information (implicitly -g t)
        [-u user_list]                    view only jobs of this user
        [-U user_list]                    select only queues where these users have access
        [-urg]                            display job urgency information
        [-pri]                            display job priority information
        [-xml]                            display the information in XML-Format
pe_list                  pe[,pe,...]
job_identifier_list      [job_id|job_name|pattern]{, [job_id|job_name|pattern]}
resource_list            resource[=value][,resource[=value],...]
user_list                user|@group[,user|@group],...]
resource_attributes      resource,resource,...
wc_cqueue                wildcard expression matching a cluster queue
wc_host                  wildcard expression matching a host
wc_hostgroup             wildcard expression matching a hostgroup
wc_qinstance             wc_cqueue@wc_host
wc_qdomain               wc_cqueue@wc_hostgroup
wc_queue                 wc_cqueue|wc_qdomain|wc_qinstance
wc_queue_list            wc_queue[,wc_queue,...]

</entry>
<entry [Wed Feb  2 12:59:11 EST 2011] RESTART SGE IF GET qstat COMLIB ERROR ON MASTER AFTER REBOOT>

qstat
    error: commlib error: got select error (Connection refused)
    error: unable to send message to qmaster using port 63231 on host "ip-10-124-245-118.ec2.internal": got send error

RESTART SGE:
sgeexecd.starcluster   sgemaster.starcluster  
/etc/init.d/sgemaster.starcluster 
       starting sge_qmaster
/etc/init.d/sgeexecd.starcluster 
       starting sge_execd

qstat
    job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID 
    -----------------------------------------------------------------------------------------------------------------
        121 0.55500 bowtie-chr root         Eqw   02/02/2011 16:59:25                                    1 2

</entry>
<entry [Wed Feb  2 08:13:52 EST 2011] FIND SGE_TASK_ID>

USE INDIRECT METHOD TO GET $SGE_TASK_ID
TASKNUM=${SGE_TASK_ID}

SCRIPT:
cd ~
emacs sleep.sh
    #!/bin/bash
    
    #$ -N sleep
    #$ -cwd
    #$ -o /root/sleep.out.$JOB_ID.$SGE_TASK_ID
    #$ -e /root/sleep.err.$JOB_ID.$SGE_TASK_ID
    
    
    hostname -f 
    date
    
    MY_HOST=`hostname`
    MY_DATE=`date`
    env
    echo "================================================================"
    echo JOB_NAME=$JOB_NAME
    echo JOB_ID=$JOB_ID
    echo SGE_TASK_ID=$SGE_TASK_ID
    echo SGE_TASK_FIRST=$SGE_TASK_FIRST
    echo SGE_TASK_LAST=$SGE_TASK_LAST
    echo NSLOTS=$NSLOTS
    echo QUEUE=$QUEUE
    echo SGE_CWD_PATH=$SGE_CWD_PATH
    echo PATH=$PATH
    echo SGE_STDIN_PATH=$SGE_STDIN_PATH
    echo SGE_STDOUT_PATH=$SGE_STDOUT_PATH
    echo SGE_STDERR_PATH=$SGE_STDERR_PATH
    echo SGE_O_HOST=$SGE_O_HOST
    echo SGE_O_PATH=$SGE_O_PATH
    echo MY_TEST=$MY_TEST
    echo "================================================================"
    
    echo "Running job JOB_NAME=$JOB_NAME task SGE_TASK_ID=$SGE_TASK_ID on $MY_HOST at $MY_DATE" 
    echo "Running job JOB_NAME=$JOB_NAME task SGE_TASK_ID=$SGE_TASK_ID on $MY_HOST at $MY_DATE" > $MY_PREFIX.$SGE_TASK_ID
    
    
    #$ -l h_rt=0:30:00
    ####$ -pe orte 2
    
    SLEEP=$1;
    
    echo "Counting down from $SLEEP\n";
    echo "JOB_ID: " $JOB_ID > sleep.out.$SGE_TASK_ID
    echo "SGE_TASK_ID: " $SGE_TASK_ID >> sleep.out.$SGE_TASK_ID
    
    
    #while [ $SLEEP > 0 ];
    #do
    #    SLEEP = $SLEEP - 10;
    #    echo "sleeping 10 seconds (Remaining sleep: $SLEEP)"
    #    sleep 10;
    #done;
    #
    #echo "0\n";
    
    
    sleep $SLEEP;
    echo "Completed"

OUTPUT:
    ip-10-124-245-118.ec2.internal
    Wed Feb  2 13:09:47 UTC 2011
    MANPATH=/opt/sge6/man:/opt/sge6/man:/opt/sge6/man:/usr/share/man:/usr/local/share/man
    HOSTNAME=ip-10-124-245-118.ec2.internal
    SGE_TASK_STEPSIZE=1
    SGE_INFOTEXT_MAX_COLUMN=5000
    SHELL=/bin/bash
    TERM=rxvt
    NHOSTS=1
    XDG_SESSION_COOKIE=caab1f7f8bba6e8ffcee317d4b7c8599-1294323257.266132-1527820708
    SGE_O_WORKDIR=/root
    TMPDIR=/tmp/104.1.all.q
    SSH_CLIENT=10.127.158.202 58960 22
    SGE_O_HOME=/root
    SGE_ARCH=lx24-amd64
    SGE_CELL=default
    RESTARTED=0
    ARC=lx24-amd64
    USER=root
    SGE_TASK_LAST=2
    QUEUE=all.q
    SGE_TASK_ID=1
    SGE_BINARY_PATH=/opt/sge6/bin/lx24-amd64
    PATH=/tmp/104.1.all.q:/usr/local/bin:/bin:/usr/bin
    MAIL=/var/mail/root
    SGE_STDERR_PATH=/root/sleep.err.104.$SGE_TASK_ID
    PWD=/root
    SGE_STDOUT_PATH=/root/sleep.out.104.$SGE_TASK_ID
    SGE_ACCOUNT=sge
    CFG_EXE_SPOOL=/opt/sge6/default/spool
    SGE_EXECD_PORT=63232
    LANG=en_US.UTF-8
    JOB_SCRIPT=/opt/sge6/default/spool/exec_spool_local/ip-10-124-245-118/job_scripts/104
    JOB_NAME=sleep
    SGE_QMASTER_PORT=63231
    SGE_ROOT=/opt/sge6
    SGE_NOMSG=1
    REQNAME=sleep
    SGE_JOB_SPOOL_DIR=/opt/sge6/default/spool/exec_spool_local/ip-10-124-245-118/active_jobs/104.1
    ENVIRONMENT=BATCH
    GRIDLOCALEDIR=/opt/sge6/locale
    QMDIR=/opt/sge6/default/spool/qmaster
    HOME=/root
    SHLVL=2
    SGE_CWD_PATH=/root
    NQUEUES=1
    SGE_O_LOGNAME=root
    SGE_O_MAIL=/var/mail/root
    TMP=/tmp/104.1.all.q
    JOB_ID=104
    LOGNAME=root
    SSH_CONNECTION=10.127.158.202 58960 10.124.245.118 22
    SGE_TASK_FIRST=1
    SGE_O_PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/sge6/bin/lx24-amd64
    SGE_O_HOST=ip-10-124-245-118
    SGE_O_SHELL=/bin/bash
    SGE_CLUSTER_NAME=starcluster
    REQUEST=sleep
    NSLOTS=1
    SGE_STDIN_PATH=/dev/null
    _=/usr/bin/env
    ================================================================
    JOB_NAME=sleep
    JOB_ID=104
    SGE_TASK_ID=1
    SGE_TASK_FIRST=1
    SGE_TASK_LAST=2
    NSLOTS=1
    QUEUE=all.q
    SGE_CWD_PATH=/root
    PATH=/tmp/104.1.all.q:/usr/local/bin:/bin:/usr/bin
    SGE_STDIN_PATH=/dev/null
    SGE_STDOUT_PATH=/root/sleep.out.104.$SGE_TASK_ID
    SGE_STDERR_PATH=/root/sleep.err.104.$SGE_TASK_ID
    SGE_O_HOST=ip-10-124-245-118
    SGE_O_PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/sge6/bin/lx24-amd64
    MY_TEST=
    ================================================================
    Running job JOB_NAME=sleep task SGE_TASK_ID=1 on ip-10-124-245-118 at Wed Feb  2 13:09:47 UTC 2011
    Counting down from \n
    Completed
    root@ip-10-124-245-118:~# ll
    total 144K
</entry>

<entry [Tues Feb  1 17:41:31 EST 2011] SPECIFY NUMBER OF CPUS USING '#$ pe orte N'>

http://www.nd.edu/~hpcc/batch.html

ADD TO SCRIPT:
#$ pe orte N

WHERE 'N' IS THE NUMBER OF CPUS
NB: THE NUMBER OF CPUS PER JOB WILL BE SHOWN BY qstat!


CREATE SCRIPT:

emacs sleep.sh
    #!/bin/sh
    
    #$ -N sleep
    #$ -cwd
    hostname -f
    date
    #$ -l h_rt=0:30:00
    #$ -pe orte 2
    
    SLEEP=$1;
    echo "Counting down from $SLEEP\n";
    echo "JOB_ID: " $JOB_ID > sleep.out.$SGE_TASK_ID
    echo "SGE_TASK_ID: " $SGE_TASK_ID >> sleep.out.$SGE_TASK_ID
    
    #while $SLEEP > 0;
    while [ $SLEEP > 0 ];
    do
        SLEEP = $SLEEP - 10;
        echo "sleeping 10 seconds (Remaining sleep: $SLEEP)"
        sleep 10;
    done;
    echo "0\n";

SUBMIT ARRAY JOB:
qsub -t 1-5 sleep.sh 10

CHECK RUNNING:
    qstat 
   job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID 
   -----------------------------------------------------------------------------------------------------------------
        82 0.55500 get_time   root         r     02/02/2011 03:55:47 all.q@ip-10-124-247-224.ec2.in     2 1
        82 0.55500 get_time   root         r     02/02/2011 03:55:48 all.q@ip-10-124-247-224.ec2.in     2 2
        82 0.55500 get_time   root         qw    02/02/2011 03:55:46                                    2 3-5:1



http://www.lrz.de/services/compute/linux-cluster/batch/example_jobs/
the slots parameter defines the maximum number of jobs that a queue can run simultaneously and it is typically set to the number of CPUs on the execution host.
The -n parameter to mpiexec is required. SGE provides the actual number of CPUs assigned in the environment variable $NSLOTS.

NOTES
-----
http://bioit.dbi.udel.edu/howto/sge
Advanced Directives
SGE is an extremely flexible management system with a large number of options available for submitting scripts. Most of the options will never be used by any user at DBI. Some of these directives are useful in common practice however and these are listed below. More information is available in the qsub man page and related documentation. Any of the directives requesting resources (the -l keyword) can have either -hard or -soft added preceeding the -l. Using -hard makes the resource request a mandatory while -soft allows the request to be discarded if the resource is not immediately available.
#$ -pe threaded 2	Sets the parallel environment such that the requested number of slots are all allocated on the same compute node. The job will wait in the queue if the requisite number is not currently available. The minimum number of processors cannot logically be less than 2 and the maximum number currently supported on biowolf is 16. This PE should be used when running a purely multi-threaded application.
#$ -pe spread 2	Sets the parallel environment such that the requested number of slots are allocated across as many different nodes as possible. This PE is best used with an application that does not need tight communications between processes and each process may be very resource intensive.
#$ -pe mpi 2	Sets the parallel environment to fill the nodes in queue order. Processes may be mixed with two or more slots occupied per node but with multiple nodes used. Best general-use PE.
#$ -l arch=lx24-x86	Forces the script to execute on a x86 (32-bit) node.
#$ -l arch=lx24-amd64	Forces the script to execute on a amd64 (64-bit) node.
#$ -l hostname=biowolf000	Forces the script to run on node biowolf000. This directive can be repeated in the script with different hostnames with the effect that it will be scheduled on one or more of the named systems.
#$ -l mem_total=4.0G	Forces the script to run on a system with at least 4GB of installed memory.
#$ -M oneal@dbi.udel.edu	Sets a list of users to which the system will send mail about the job's execution.
#$ -m ea	Sets the circumstances under which mail is sent concerning the job's execution. Options include b, e, a, and s for job beginning, end, abort, or suspension, or n for no mail.
#$ -j yes	Specifies whether or not the job's standard error messages are merged with standard output.
#$ -cwd	Execute the job from the current working directory.
#$ -S /bin/bash	Sets the command interpreter for the remainer of the script.
#$ -a MMDDhhmm	Sets a date & time after which the job is eligible for execution.
Useful Shell Variables
The SGE system defines a large set of environment variables, again fully documented in the man pages. Some of the more useful ones are:

SGE_ARCH	The CPU architecture of the executing host - currently either lx24-x86 or lx24-amd64.
NHOSTS	The number of hosts being used in a parallel job.
NSLOTS	The number of queue slots used in a parallel job.
PE	The parallel environment selected by the job.
PE_HOSTFILE	The path of the file with the host information for the parallel virtual machine.
JOB_ID	The queue job id assigned to the job.
JOB_NAME	The name assigned to the job - generally this is the name of the submitted script.
SGE_TASK_ID	The index number of the current array job task.
SGE_TASK_FIRST	The index number of the first array job task.
SGE_TASK_LAST	The index number of the last array job task.

</entry>

<entry [Tue Jan 18 20:42:38 EST 2011] MADE AQUARIUS-7 A SUBMIT HOST ON MASTER>

CHECKED PORTS ON MASTER FROM AQ-7:
nmap -P0 10.124.245.118
    
    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2011-01-10 00:04 EST
    Interesting ports on ip-10-124-245-118.ec2.internal (10.124.245.118):
    Not shown: 1677 filtered ports
    PORT     STATE SERVICE
    22/tcp   open  ssh
    111/tcp  open  rpcbind
    2049/tcp open  nfs
    
    Nmap finished: 1 IP address (1 host up) scanned in 24.348 seconds
netstat -tulp | grep sge
    tcp        0      0 *:63232                 *:*                     LISTEN      4325/sge_execd  
    tcp        0      0 *:63231                 *:*                     LISTEN      3308/sge_qmaster
SO THE PORTS ARE 4325 AND 3308 (I.E., NOT 6444 AND 6445)!
SO OPEN THESE PORTS ON AQ-7 AND MASTER:
ec2-authorize default -p 3308 -P tcp
ec2-authorize default -p 3308 -P udp
ec2-authorize default -p 4325 -P tcp
ec2-authorize default -p 4325 -P udp
ec2-authorize @sc-masters -p 3308 -P tcp
ec2-authorize @sc-masters -p 3308 -P udp
ec2-authorize @sc-masters -p 4325 -P tcp
ec2-authorize @sc-masters -p 4325 -P udp


netstat -tulp | grep sge
    tcp        0      0 *:63232                 *:*                     LISTEN      4325/sge_execd  
    tcp        0      0 *:63231                 *:*                     LISTEN      3308/sge_qmaster


COPY /opt/sge6 DIRECTORY TO AQ-7

scp -i /nethome/admin/.starcluster/id_rsa-admin-key -r root@ip-10-124-245-118:/opt/sge6 /opt

ADD AQ-7 TO LIST OF SUBMIT HOSTS

http://ait.web.psi.ch/services/linux/hpc/merlin3/sge/admin/sge_hosts.html

ON MASTER:

CHECK CURRENT SUBMIT HOSTS
qconf -ss
    ip-10-124-245-118.ec2.internal
    ip-10-124-247-224.ec2.internal

ADD AQ-7 AS SUBMIT HOST
qconf -as ip-10-127-158-202.ec2.internal
    ip-10-127-158-202.ec2.internal added to submit host list
qconf -ss
    ip-10-124-245-118.ec2.internal
    ip-10-124-247-224.ec2.internal
    ip-10-127-158-202.ec2.internal

ADD AQ-7 AS ADMIN HOST
qconf -ah ip-10-127-158-202.ec2.internal
    ip-10-127-158-202.ec2.internal added to administrative host list
qconf -sh
    ip-10-124-245-118.ec2.internal
    ip-10-124-247-224.ec2.internal
    ip-10-127-158-202.ec2.internal

ON AQ-7:
/opt/sge6/bin/lx24-amd64/qconf -sh
    ^Xerror: could not get environment variable SGE_QMASTER_PORT or service "sge_qmaster"

export SGE_QMASTER_PORT=3308
export PATH=/opt/sge6/bin/lx24-amd64:$PATH

ON MASTER, GET LIST OF PORTS FOR SGE:
cat /etc/services | grep sge
    sge_qmaster     6444/tcp                        # Grid Engine Qmaster Service
    sge_qmaster     6444/udp                        # Grid Engine Qmaster Service
    sge_execd       6445/tcp                        # Grid Engine Execution Service
    sge_execd       6445/udp                        # Grid Engine Execution Service

OPEN PORTS ON EC2:
####ec2-authorize default -p 6444 -P tcp
####ec2-authorize default -p 6444 -P udp
####ec2-authorize default -p 6445 -P tcp
####ec2-authorize default -p 6445 -P udp
####
####ec2-authorize @sc-masters -p 6444 -P tcp
####ec2-authorize @sc-masters -p 6444 -P udp
####ec2-authorize @sc-masters -p 6445 -P tcp
####ec2-authorize @sc-masters -p 6445 -P udp

RUN TEST JOB:
qsub /data/agua/0.5/bin/apps/test/test1.sh \
-e /data/agua/0.5/bin/apps/test/test1.stderr \
-o /data/agua/0.5/bin/apps/test/test1.stdout
/opt/sge6/bin/lx24-amd64/qsub /scvolumes/data/agua/0.5/bin/apps/test/test1.sh -e /scvolumes/data/agua/0.5/bin/apps/test/test1.stderr -o /scvolumes/data/agua/0.5/bin/apps/test/test1.stdout
Unable to run job: denied: host "ip-10-127-158-202.ec2.internal" is no submit host.
Exiting.

ADD AQ-7 AS SUBMIT HOST:
qconf -ss
    ip-10-124-245-118.ec2.internal
    ip-10-124-247-224.ec2.internal
qconf -as ip-10-127-158-202.ec2.internal
    ip-10-127-158-202.ec2.internal added to submit host list
qconf -ss
    ip-10-124-245-118.ec2.internal
    ip-10-124-247-224.ec2.internal
    ip-10-127-158-202.ec2.internal
/opt/sge6/bin/lx24-amd64/qsub /scvolumes/data/agua/0.5/bin/apps/test/test1.sh -e /scvolumes/data/agua/0.5/bin/apps/test/test1.stderr -o /scvolumes/data/agua/0.5/bin/apps/test/test1.stdout
    Unable to run job: warning: root your job is not allowed to run in any queue
    Your job 2 ("test1.sh") has been submitted.
    Exiting.
qstat -f 
    
    ############################################################################
     - PENDING JOBS - PENDING JOBS - PENDING JOBS - PENDING JOBS - PENDING JOBS
    ############################################################################
          2 0.55500 test1.sh   root         qw    01/10/2011 01:30:56     1   

ENABLE COLLECTION OF SCHEDULER JOB INFORMATION:
qstat -j 2
==============================================================
job_number:                 2
exec_file:                  job_scripts/2
submission_time:            Mon Jan 10 01:30:56 2011
owner:                      root
uid:                        0
group:                      root
gid:                        0
sge_o_home:                 /root
sge_o_log_name:             root
sge_o_path:                 /opt/sge6/bin/lx24-amd64:/opt/sge6/bin/lx24-amd64:/home/ec2/bin:/usr/kerberos/sbin:/usr/kerberos/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/home/ec2/bin
sge_o_shell:                /bin/bash
sge_o_workdir:              /scvolumes/data/agua/0.5/bin/apps/test
sge_o_host:                 ip-10-127-158-202
account:                    sge
cwd:                        /scvolumes/data/agua/0.5/bin/apps/test
merge:                      y
mail_list:                  root@ip-10-127-158-202.ec2.internal
notify:                     FALSE
job_name:                   test1.sh
jobshare:                   0
shell_list:                 NONE:/bin/bash
env_list:                   PATH=/opt/sge6/bin/lx24-amd64:/opt/sge6/bin/lx24-amd64:/home/ec2/bin:/usr/kerberos/sbin:/usr/kerberos/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/home/ec2/bin
job_args:                   -e,/scvolumes/data/agua/0.5/bin/apps/test/test1.stderr,-o,/scvolumes/data/agua/0.5/bin/apps/test/test1.stdout
script_file:                /scvolumes/data/agua/0.5/bin/apps/test/test1.sh
scheduling info:            (Collecting of scheduler job information is turned off)
SET qconf -ssconf TO TRUE:
qconf -ssconf | grep schedd_job_info
    schedd_job_info                   false
qconf -help
    ...
    [-msconf]                                modify scheduler configuration
    ...
    

export SGE_ROOT=/opt/sge6


SET JOB SCHEDULER INFO TO TRUE: 
schedd_job_info                   true

... IN CONF:

qconf -msconf

algorithm                         default
schedule_interval                 0:0:15
maxujobs                          0
queue_sort_method                 load
job_load_adjustments              np_load_avg=0.50
load_adjustment_decay_time        0:7:30
load_formula                      np_load_avg
schedd_job_info                   true
flush_submit_sec                  0
flush_finish_sec                  0
params                            none
reprioritize_interval             0:0:0
halftime                          168
usage_weight_list                 cpu=1.000000,mem=0.000000,io=0.000000
compensation_factor               5.000000
weight_user                       0.250000
weight_project                    0.250000
weight_department                 0.250000
weight_job                        0.250000
weight_tickets_functional         0
weight_tickets_share              0
share_override_tickets            TRUE
share_functional_shares           TRUE
max_functional_jobs_to_schedule   200
report_pjob_tickets               TRUE
max_pending_tasks_per_job         50
halflife_decay_list               none
policy_hierarchy                  OFS
weight_ticket                     0.010000
weight_waiting_time               0.000000
weight_deadline                   3600000.000000
weight_urgency                    0.100000
weight_priority                   1.000000
max_reservation                   0
default_duration                  INFINITY

RESTARTED QMASTER
/etc/init.d/sgemaster.starcluster stop   

   shutting down Grid Engine qmaster

ps aux | grep sge
root      9273  0.0  0.4  10252  2716 pts/1    T    00:37   0:00 /bin/sh /opt/sge6/inst_sge -x
root     11726  0.0  0.0   6020   592 pts/1    R+   02:26   0:00 grep sge

/etc/init.d/sgemaster.starcluster start
   starting sge_qmaster

ps aux | grep sge
root      9273  0.0  0.4  10252  2716 pts/1    T    00:37   0:00 /bin/sh /opt/sge6/inst_sge -x
root     11845  9.8  5.0 605076 32360 ?        Sl   02:28   0:00 /opt/sge6/bin/lx24-amd64/sge_qmaster
root     11900  0.0  0.0   6024   596 pts/1    R+   02:28   0:00 grep sge

NOW SCHEDULING INFO IS AVAILABLE:
qstat -f
############################################################################
 - PENDING JOBS - PENDING JOBS - PENDING JOBS - PENDING JOBS - PENDING JOBS
############################################################################
      2 0.55500 test1.sh   root         qw    01/10/2011 01:30:56     1        
      3 0.55500 test1.sh   root         qw    01/10/2011 01:43:00     1        
[root@ip-10-127-158-202 test]# qstat -j 2
==============================================================
job_number:                 2
exec_file:                  job_scripts/2
submission_time:            Mon Jan 10 01:30:56 2011
owner:                      root
uid:                        0
group:                      root
gid:                        0
sge_o_home:                 /root
sge_o_log_name:             root
sge_o_path:                 /opt/sge6/bin/lx24-amd64:/opt/sge6/bin/lx24-amd64:/home/ec2/bin:/usr/kerberos/sbin:/usr/kerberos/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/home/ec2/bin
sge_o_shell:                /bin/bash
sge_o_workdir:              /scvolumes/data/agua/0.5/bin/apps/test
sge_o_host:                 ip-10-127-158-202
account:                    sge
cwd:                        /scvolumes/data/agua/0.5/bin/apps/test
merge:                      y
mail_list:                  root@ip-10-127-158-202.ec2.internal
notify:                     FALSE
job_name:                   test1.sh
jobshare:                   0
shell_list:                 NONE:/bin/bash
env_list:                   PATH=/opt/sge6/bin/lx24-amd64:/opt/sge6/bin/lx24-amd64:/home/ec2/bin:/usr/kerberos/sbin:/usr/kerberos/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/home/ec2/bin
job_args:                   -e,/scvolumes/data/agua/0.5/bin/apps/test/test1.stderr,-o,/scvolumes/data/agua/0.5/bin/apps/test/test1.stdout
script_file:                /scvolumes/data/agua/0.5/bin/apps/test/test1.sh
scheduling info:            All queues dropped because of overload or full

CHECK IF USER root IS INCLUDED IN USER LIST FOR QUEUE all.q
/opt/sge6/bin/lx24-amd64/qconf -sq all.q
qname                 all.q
hostlist              @allhosts
seq_no                0
load_thresholds       np_load_avg=1.75
suspend_thresholds    NONE
nsuspend              1
suspend_interval      00:05:00
priority              0
min_cpu_interval      00:05:00
processors            UNDEFINED
qtype                 BATCH INTERACTIVE
ckpt_list             NONE
pe_list               make
rerun                 FALSE
slots                 1
tmpdir                /tmp
shell                 /bin/csh
prolog                NONE
epilog                NONE
shell_start_mode      posix_compliant
starter_method        NONE
suspend_method        NONE
resume_method         NONE
terminate_method      NONE
notify                00:00:60
owner_list            NONE
user_lists            NONE
xuser_lists           NONE
subordinate_list      NONE
complex_values        NONE
projects              NONE
xprojects             NONE
calendar              NONE
ADD 'root' AS OPERATOR/USER:
/opt/sge6/bin/lx24-amd64/qconf -ao root
    root@ip-10-127-158-202.ec2.internal added "root" to operator list
/opt/sge6/bin/lx24-amd64/qconf -am root
    manager "root" already exists
AND RESTARTED SGEMASTER BUT STILL GET ERROR:
/opt/sge6/bin/lx24-amd64/qsub /scvolumes/data/agua/0.5/bin/apps/test/test1.sh -e /scvolumes/data/agua/0.5/bin/apps/test/test1.stderr -o /scvolumes/data/agua/0.5/bin/apps/test/test1.stdout -q all.q
    Unable to run job: warning: root your job is not allowed to run in any queue
    Your job 7 ("test1.sh") has been submitted.
    Exiting.

... BECAUSE root IS STILL NOT REGISTERED AS A USER OF THE all.q QUEUE
qconf -sconf | grep user_lists
    user_lists                   none

TRIED IT THE EASY WAY:
source /opt/sge6/default/common/settings.sh

ON AQ-7, CHANGE act_qmaster IN /opt/sge6/default/common FROM THIS:
[root@ip-10-127-158-202 common]# cat act_qmaster 
ip-10-127-158-202.ec2.internal
TO THIS (SAME AS ON MASTER:
/opt/sge6/default/common# cat act_qmaster 
ip-10-124-245-118.ec2.internal
CAN'T START SGEMASTER DAEMON:
/etc/init.d/sgemaster.starcluster start
    sge_qmaster didn't start!
    This is not a qmaster host!
    Check your /opt/sge6/default/common/act_qmaster file!
NOW qstat HANGS INSTEAD OF GIVING THIS ERROR:
qstat
    error: commlib error: got select error (Connection refused)
    error: unable to send message to qmaster using port 3308 on host "ip-10-127-158-202.ec2.internal": got send error

AND qsub GAVE THE SAME ERROR AS BEFORE:
qsub -q all.q /scvolumes/data/agua/0.5/bin/apps/test/test1.sh
    ^XUnable to run job: unable to send message to qmaster using port 3308 on host "ip-10-124-245-118.ec2.internal": got send error.
Exiting.
CHECKED PORTS ON AQ-7 FROM QMASTER:
nmap ip-10-127-158-202
    Starting Nmap 5.00 ( http://nmap.org ) at 2011-01-10 15:48 UTC
    Interesting ports on ip-10-127-158-202.ec2.internal (10.127.158.202):
    Not shown: 995 filtered ports
    PORT     STATE  SERVICE
    22/tcp   open   ssh
    80/tcp   open   http
    443/tcp  open   https
    3306/tcp open   mysql
    8443/tcp closed https-alt
    
    Nmap done: 1 IP address (1 host up) scanned in 9.40 seconds

CHECKED AQ-7 FROM ITSELF:
nmap localhost
    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2011-01-10 10:57 EST
    Interesting ports on localhost (127.0.0.1):
    Not shown: 1670 closed ports
    PORT     STATE SERVICE
    22/tcp   open  ssh
    25/tcp   open  smtp
    80/tcp   open  http
    111/tcp  open  rpcbind
    443/tcp  open  https
    690/tcp  open  unknown
    705/tcp  open  unknown
    757/tcp  open  unknown
    2049/tcp open  nfs
    3306/tcp open  mysql
    
    Nmap finished: 1 IP address (1 host up) scanned in 0.071 seconds

CHECKED PORTS ON MASTER FROM AQ-7:
nmap -P0 ip-10-124-245-118
    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2011-01-10 10:58 EST
    Interesting ports on ip-10-124-245-118.ec2.internal (10.124.245.118):
    Not shown: 1677 filtered ports
    PORT     STATE SERVICE
    22/tcp   open  ssh
    111/tcp  open  rpcbind
    2049/tcp open  nfs
    
    Nmap finished: 1 IP address (1 host up) scanned in 21.830 seconds

CHECKED PORTS ON MASTER FROM ITSELF:
nmap ip-10-124-245-118
    Starting Nmap 5.00 ( http://nmap.org ) at 2011-01-10 15:58 UTC
    Interesting ports on ip-10-124-245-118.ec2.internal (10.124.245.118):
    Not shown: 994 closed ports
    PORT      STATE SERVICE
    22/tcp    open  ssh
    80/tcp    open  http
    111/tcp   open  rpcbind
    2049/tcp  open  nfs
    4000/tcp  open  remoteanything
    52673/tcp open  unknown
    
    Nmap done: 1 IP address (1 host up) scanned in 0.20 seconds

GET CURRENTLY USED PORTS ON MASTER:
netstat -ntulp | grep sge
    tcp        0      0 0.0.0.0:63232           0.0.0.0:*               LISTEN      4325/sge_execd  
    tcp        0      0 0.0.0.0:63231           0.0.0.0:*               LISTEN      3308/sge_qmaster
netstat -ntulp
    Active Internet connections (only servers)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
    tcp        0      0 0.0.0.0:40000           0.0.0.0:*               LISTEN      12546/rpc.statd 
    tcp        0      0 0.0.0.0:4000            0.0.0.0:*               LISTEN      7846/rpc.statd  
    tcp        0      0 0.0.0.0:63232           0.0.0.0:*               LISTEN      4325/sge_execd  
    tcp        0      0 0.0.0.0:52673           0.0.0.0:*               LISTEN      -               
    tcp        0      0 0.0.0.0:2049            0.0.0.0:*               LISTEN      -               
    tcp        0      0 127.0.0.1:3306          0.0.0.0:*               LISTEN      1075/mysqld     
    tcp        0      0 0.0.0.0:111             0.0.0.0:*               LISTEN      12526/portmap   
    tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      1226/apache2    
    tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      15206/sshd      
    tcp        0      0 0.0.0.0:32767           0.0.0.0:*               LISTEN      12625/rpc.mountd
    tcp        0      0 0.0.0.0:63231           0.0.0.0:*               LISTEN      3308/sge_qmaster
    tcp6       0      0 :::22                   :::*                    LISTEN      15206/sshd      
    udp        0      0 0.0.0.0:2049            0.0.0.0:*                           -               
    udp        0      0 0.0.0.0:4000            0.0.0.0:*                           7846/rpc.statd  
    udp        0      0 0.0.0.0:814             0.0.0.0:*                           7846/rpc.statd  
    udp        0      0 0.0.0.0:40000           0.0.0.0:*                           12546/rpc.statd 
    udp        0      0 0.0.0.0:68              0.0.0.0:*                           839/dhclient3   
    udp        0      0 0.0.0.0:42059           0.0.0.0:*                           -               
    udp        0      0 0.0.0.0:59088           0.0.0.0:*                           612/avahi-daemon: r
    udp        0      0 0.0.0.0:850             0.0.0.0:*                           12546/rpc.statd 
    udp        0      0 0.0.0.0:5353            0.0.0.0:*                           612/avahi-daemon: r
    udp        0      0 0.0.0.0:111             0.0.0.0:*                           12526/portmap   
    udp        0      0 0.0.0.0:32767           0.0.0.0:*                           12625/rpc.mountd

AS EXPECTED, NO SGE APPS RUNNING ON AQ-7:
netstat -ntulp
    Active Internet connections (only servers)
    Proto Recv-Q Send-Q Local Address               Foreign Address             State       PID/Program name   
    tcp        0      0 0.0.0.0:705                 0.0.0.0:*                   LISTEN      13246/rpc.mountd    
    tcp        0      0 0.0.0.0:2049                0.0.0.0:*                   LISTEN      -                   
    tcp        0      0 0.0.0.0:37415               0.0.0.0:*                   LISTEN      -                   
    tcp        0      0 0.0.0.0:3306                0.0.0.0:*                   LISTEN      1233/mysqld         
    tcp        0      0 0.0.0.0:111                 0.0.0.0:*                   LISTEN      13167/portmap       
    tcp        0      0 0.0.0.0:690                 0.0.0.0:*                   LISTEN      13230/rpc.rquotad   
    tcp        0      0 0.0.0.0:757                 0.0.0.0:*                   LISTEN      13295/rpc.statd     
    tcp        0      0 127.0.0.1:25                0.0.0.0:*                   LISTEN      1049/master         
    tcp        0      0 :::80                       :::*                        LISTEN      1147/httpd          
    tcp        0      0 :::22                       :::*                        LISTEN      994/sshd            
    tcp        0      0 :::443                      :::*                        LISTEN      1147/httpd          
    udp        0      0 0.0.0.0:2049                0.0.0.0:*                               -                   
    udp        0      0 0.0.0.0:687                 0.0.0.0:*                               13230/rpc.rquotad   
    udp        0      0 0.0.0.0:702                 0.0.0.0:*                               13246/rpc.mountd    
    udp        0      0 0.0.0.0:68                  0.0.0.0:*                               871/dhclient        
    udp        0      0 0.0.0.0:751                 0.0.0.0:*                               13295/rpc.statd     
    udp        0      0 0.0.0.0:111                 0.0.0.0:*                               13167/portmap       
    udp        0      0 0.0.0.0:754                 0.0.0.0:*                               13295/rpc.statd     
    udp        0      0 0.0.0.0:33662               0.0.0.0:*                               -
GET THIS ERROR MESSAGE WITH qsub WHEN KILL AFTER IT HANGS:
qsub
    Unable to read script file because of error: no input read from stdin
    [root@ip-10-127-158-202 common]# qstat
    error: commlib error: got select error (Connection refused)
    error: unable to send message to qmaster using port 3308 on host "ip-10-127-158-202.ec2.internal": got send error
CHECKED OPEN PORTS ON EC2:
ec2-describe-group
GROUP   558277860346    default default group
PERMISSION      558277860346    default ALLOWS  all                     FROM    USER    558277860346    GRPNAMEdefault
PERMISSION      558277860346    default ALLOWS  tcp     22      22      FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    default ALLOWS  tcp     80      80      FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    default ALLOWS  tcp     443     443     FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    default ALLOWS  tcp     3306    3306    FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    default ALLOWS  tcp     3308    3308    FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    default ALLOWS  tcp     4325    4325    FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    default ALLOWS  tcp     6444    6444    FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    default ALLOWS  tcp     6445    6445    FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    default ALLOWS  tcp     8443    8443    FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    default ALLOWS  tcp     8773    8773    FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    default ALLOWS  udp     3308    3308    FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    default ALLOWS  udp     4325    4325    FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    default ALLOWS  udp     6444    6444    FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    default ALLOWS  udp     6445    6445    FROM    CIDR    0.0.0.0/0
GROUP   558277860346    @sc-smallcluster        Cluster requested at 201101060911
PERMISSION      558277860346    @sc-smallcluster        ALLOWS  tcp     1       65535   FROM    USER    558277860346    GRPNAME @sc-smallcluster
PERMISSION      558277860346    @sc-smallcluster        ALLOWS  udp     1       65535   FROM    USER    558277860346    GRPNAME @sc-smallcluster
PERMISSION      558277860346    @sc-smallcluster        ALLOWS  icmp    -1      -1      FROM    USER    558277860346    GRPNAME @sc-smallcluster
PERMISSION      558277860346    @sc-smallcluster        ALLOWS  tcp     22      22      FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-smallcluster        ALLOWS  tcp     111     111     FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-smallcluster        ALLOWS  udp     111     111     FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-smallcluster        ALLOWS  udp     60033   60033   FROM    CIDR    0.0.0.0/0
GROUP   558277860346    @sc-masters     StarCluster Master Nodes
PERMISSION      558277860346    @sc-masters     ALLOWS  tcp     22      22      FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  tcp     111     111     FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  tcp     2049    2049    FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  tcp     6444    6444    FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  tcp     6445    6445    FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  tcp     32767   32767   FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  tcp     33932   33932   FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  tcp     34982   34982   FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  tcp     36059   36059   FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  tcp     39970   39970   FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  tcp     43829   43829   FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  tcp     48830   48830   FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  tcp     57100   57100   FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  udp     111     111     FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  udp     2049    2049    FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  udp     6444    6444    FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  udp     6445    6445    FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  udp     32767   32767   FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  udp     33485   33485   FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  udp     34982   34982   FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  udp     36059   36059   FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  udp     44695   44695   FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  udp     45161   45161   FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  udp     60033   60033   FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  udp     60454   60454   FROM    CIDR    0.0.0.0/0
OPEN PORTS 3308 AND 4325 IN @sc-masters GROUP:
ec2-authorize @sc-masters -p 3308 -P udp
ec2-authorize @sc-masters -p 3308 -P tcp
ec2-authorize @sc-masters -p 4325 -P udp
ec2-authorize @sc-masters -p 4325 -P tcp
AND IN @sc-smallcluster GROUP:
ec2-authorize @sc-smallcluster -p 3308 -P udp
ec2-authorize @sc-smallcluster -p 3308 -P tcp
ec2-authorize @sc-smallcluster -p 4325 -P udp
ec2-authorize @sc-smallcluster -p 4325 -P tcp

QSTAT DOESN'T HANG NOW, INSTEAD IT GIVES THIS ERROR:
qstat
    error: commlib error: got select error (Connection refused)
    error: unable to send message to qmaster using port 3308 on host "ip-10-124-245-118.ec2.internal": got send error
SO CHECKED /etc/services AND FOUND THAT PORT 3308 IS RESERVED FOR tns-server
http://www.tns.lcs.mit.edu/about.html
SO COMMENTED OUT THIS ENTRY:
#tns-server     3308/tcp                        # TNS Server
#tns-server     3308/udp                        # TNS Server

CHECK MASTER'S EXPOSED PORTS FROM NODE 001:
ON MASTER SSH INTO NODE 001
ssh node001
nmap -P0 ip-10-124-245-118
    Starting Nmap 5.00 ( http://nmap.org ) at 2011-01-10 16:28 UTC
    Interesting ports on ip-10-124-245-118.ec2.internal (10.124.245.118):
    Not shown: 994 closed ports
    PORT      STATE SERVICE
    22/tcp    open  ssh
    80/tcp    open  http
    111/tcp   open  rpcbind
    2049/tcp  open  nfs
    4000/tcp  open  remoteanything
    52673/tcp open  unknown
    
    Nmap done: 1 IP address (1 host up) scanned in 0.20 seconds
netstat -tulp
    Active Internet connections (only servers)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
    tcp        0      0 *:63232                 *:*                     LISTEN      2635/sge_execd  
    tcp        0      0 *:nfs                   *:*                     LISTEN      -               
    tcp        0      0 *:39172                 *:*                     LISTEN      -               
    tcp        0      0 localhost.localdo:mysql *:*                     LISTEN      1122/mysqld     
    tcp        0      0 *:sunrpc                *:*                     LISTEN      608/portmap     
    tcp        0      0 *:www                   *:*                     LISTEN      1273/apache2    
    tcp        0      0 *:ssh                   *:*                     LISTEN      980/sshd        
    tcp        0      0 *:48823                 *:*                     LISTEN      1219/rpc.mountd 
    tcp        0      0 *:44989                 *:*                     LISTEN      635/rpc.statd   
    tcp6       0      0 [::]:ssh                [::]:*                  LISTEN      980/sshd        
    udp        0      0 *:nfs                   *:*                                 -               
    udp        0      0 *:42125                 *:*                                 1219/rpc.mountd 
    udp        0      0 *:811                   *:*                                 635/rpc.statd   
    udp        0      0 *:45878                 *:*                                 635/rpc.statd   
    udp        0      0 *:bootpc                *:*                                 886/dhclient3   
    udp        0      0 *:mdns                  *:*                                 677/avahi-daemon: r
    udp        0      0 *:49644                 *:*                                 -               
    udp        0      0 *:57327                 *:*                                 677/avahi-daemon: r
    udp        0      0 *:sunrpc                *:*                                 608/portmap     

ON MASTER, SHOW LIST OF QUEUES:
qconf -sql
    all.q
    
NOTE: MUST HAVE SGE MASTER AND EXECD ENTRIES IN /etc/services:
# Local services
sge_qmaster     3308/tcp                        # Grid Engine Qmaster Service
sge_qmaster     3308/udp                        # Grid Engine Qmaster Service
sge_execd       4325/tcp                        # Grid Engine Execution Service
sge_execd       4325/udp                        # Grid Engine Execution Service
OTHERWISE, qstat OR qsub WILL HANG AND GIVE ERROR:
qsub 
    ^Xerror: could not get environment variable SGE_QMASTER_PORT or service "sge_qmaster"
    
CHECK MASTER IS BEING LOOKED UP CORRECTLY:
/opt/sge6/utilbin/lx24-x86/gethostbyname ip-10-124-245-118
    
    Hostname: ip-10-124-245-118.ec2.internal
    Aliases:  
    Host Address(es): 10.124.245.118
/opt/sge6/utilbin/lx24-x86/gethostbyaddr   10.124.245.118
    
    Hostname: ip-10-124-245-118.ec2.internal
    Aliases:  
    Host Address(es): 10.124.245.118 
    
CHECK REVERSE DNS
ON AQ-7, MASTER AND NODE001:
host  ip-10-124-245-118
    ip-10-124-245-118.ec2.internal has address 10.124.245.118
nslookup ip-10-124-245-118
    Server:         172.16.0.23
    Address:        172.16.0.23#53
    
    Non-authoritative answer:
    Name:   ip-10-124-245-118.ec2.internal
    Address: 10.124.245.118

#
#You can use standard UNIX / Linux utilities such as nslookup, dig or hosts to find out reverse DNS of a given IP address.
#
#Task: Find Reverse DNS for IP 75.126.43.235 under Linux/UNIX
#
#host 75.126.43.235
#
#Output:
#
#235.43.126.75.in-addr.arpa domain name pointer cyberciti.org.
#
#IP 75.126.43.235 is reverse mapped to cyberciti.org.
#    
AQ-7 IS CONNECTED TO MASTER BY SSH AND NFS
netstat
    Active Internet connections (w/o servers)
    Proto Recv-Q Send-Q Local Address               Foreign Address             State      
    tcp        0      0 ip-10-127-158-202.ec2:35468 ip-10-124-245-118.ec2.i:ssh ESTABLISHED 
    tcp        0      0 ip-10-127-158-202.ec2.:1017 ip-10-124-245-118.ec2.i:nfs ESTABLISHED 
    tcp        0    532 ip-10-127-158-202.ec2.i:ssh ::ffff:129.171.150.19:44725 ESTABLISHED 
    tcp        0      0 ip-10-127-158-202.ec2.i:ssh ::ffff:129.171.150.19:29646 ESTABLISHED 
    Active UNIX domain sockets (w/o servers)
    Proto RefCnt Flags       Type       State         I-Node Path
    unix  2      [ ]         DGRAM                    780    @/org/kernel/udev/udevd
    unix  2      [ ]         DGRAM                    2717   @/org/freedesktop/hal/udev_event
    ...

GET SGE ERROR MESSAGES ON MASTER:
date
    Mon Jan 10 17:28:15 UTC 2011
tail /opt/sge6/default/spool/qmaster/messages
    01/10/2011 16:20:24|worker|ip-10-124-245-118|E|submithost "ip-10-127-158-202.ec2.internal" already exists
    01/10/2011 16:51:12|  main|ip-10-124-245-118|E|jvm thread is not running
    01/10/2011 16:51:21|  main|ip-10-124-245-118|I|controlled shutdown 6.2u5
    01/10/2011 16:51:33|  main|ip-10-124-245-118|I|read job database with 0 entries in 0 seconds
    01/10/2011 16:51:33|  main|ip-10-124-245-118|E|error opening file "/opt/sge6/default/spool/qmaster/./sharetree" for reading: No such file or directory
    01/10/2011 16:51:33|  main|ip-10-124-245-118|I|qmaster hard descriptor limit is set to 8192
    01/10/2011 16:51:33|  main|ip-10-124-245-118|I|qmaster soft descriptor limit is set to 8192
    01/10/2011 16:51:33|  main|ip-10-124-245-118|I|qmaster will use max. 8172 file descriptors for communication
    01/10/2011 16:51:33|  main|ip-10-124-245-118|I|qmaster will accept max. 99 dynamic event clients
    01/10/2011 16:51:33|  main|ip-10-124-245-118|I|starting up GE 6.2u5 (lx24-amd64)

TRIED SETTING SGE_QMASTER_PORT ON AQ-7 TO SAME VALUE AS IN settings.sh FILE:
cat /opt/sge6/default/common/settings.sh
    SGE_ROOT=/opt/sge6; export SGE_ROOT
    
    ARCH=`$SGE_ROOT/util/arch`
    DEFAULTMANPATH=`$SGE_ROOT/util/arch -m`
    MANTYPE=`$SGE_ROOT/util/arch -mt`
    
    SGE_CELL=default; export SGE_CELL
    SGE_CLUSTER_NAME=starcluster; export SGE_CLUSTER_NAME
    SGE_QMASTER_PORT=63231; export SGE_QMASTER_PORT
    SGE_EXECD_PORT=63232; export SGE_EXECD_PORT
    ...
... BECAUSE PORT 63231 and 63232 ARE ASSOCIATED WITH SGE LISTENING PROCESSES SHOWN BY netstat:
netstat -tulp | grep sge
    
    tcp        0      0 *:63232                 *:*                     LISTEN      4325/sge_execd  
    tcp        0      0 *:63231                 *:*                     LISTEN      16687/sge_qmaster 

netstat -tulp
    Active Internet connections (only servers)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
    tcp        0      0 *:40000                 *:*                     LISTEN      12546/rpc.statd 
    tcp        0      0 *:4000                  *:*                     LISTEN      7846/rpc.statd  
    tcp        0      0 *:63232                 *:*                     LISTEN      4325/sge_execd  
    tcp        0      0 *:52673                 *:*                     LISTEN      -               
    tcp        0      0 *:nfs                   *:*                     LISTEN      -               
    tcp        0      0 localhost.localdo:mysql *:*                     LISTEN      1075/mysqld     
    tcp        0      0 *:sunrpc                *:*                     LISTEN      12526/portmap   
    tcp        0      0 *:www                   *:*                     LISTEN      1226/apache2    
    tcp        0      0 *:ssh                   *:*                     LISTEN      15206/sshd      
    tcp        0      0 *:32767                 *:*                     LISTEN      12625/rpc.mountd
    tcp        0      0 *:63231                 *:*                     LISTEN      3308/sge_qmaster
    tcp6       0      0 [::]:ssh                [::]:*                  LISTEN      15206/sshd      
    udp        0      0 *:nfs                   *:*                                 -               
    udp        0      0 *:4000                  *:*                                 7846/rpc.statd  
    udp        0      0 *:814                   *:*                                 7846/rpc.statd  
    udp        0      0 *:40000                 *:*                                 12546/rpc.statd 
    udp        0      0 *:bootpc                *:*                                 839/dhclient3   
    udp        0      0 *:42059                 *:*                                 -               
    udp        0      0 *:59088                 *:*                                 612/avahi-daemon: r
    udp        0      0 *:850                   *:*                                 12546/rpc.statd 
    udp        0      0 *:mdns                  *:*                                 612/avahi-daemon: r
    udp        0      0 *:sunrpc                *:*                                 12526/portmap   
    udp        0      0 *:32767                 *:*                                 12625/rpc.mountd

OPEN PORT 63231 ON EC2 GROUP @sc-masters AND 
ec2-authorize @sc-masters -p 63231 -P udp
ec2-authorize @sc-masters -p 63231 -P tcp
(NEEDED FOR SUBMISSION), OPEN sge_execd PORT (NEEDED FOR qstat):
ec2-authorize @sc-masters -p 63232 -P udp
ec2-authorize @sc-masters -p 63232 -P tcp
SET ENVIRONMENT VARIABLES:
export SGE_QMASTER_PORT=63231
CHECK SUBMISSION HOSTS ON MASTER:
[root@ip-10-127-158-202 test]# qconf -ss
ip-10-124-245-118.ec2.internal
ip-10-124-247-224.ec2.internal
ip-10-127-158-202.ec2.internal
    OK!!!

CREATE MIRROR IMAGE STRUCTURE ON MASTER OF /cluster/data ON AQ-7:
(REM: /cluster/data ON AQ-7 IS MOUNT OF /data ON MASTER)
mkdir /cluster
ln -s /data /cluster/data
CREATE TEST SCRIPTS:
qsub /cluster/data/agua/0.5/bin/apps/test/test.sh
  #!/bin/sh
  
  echo `hostname`
  echo `date`
  
  /cluster/data/agua/0.5/bin/apps/test/test.pl \
  /cluster/data/agua/0.5/bin/apps/test/test.out \
  10
qsub /cluster/data/agua/0.5/bin/apps/test/test.pl
  #!/usr/bin/perl -w
  
  use strict;
  
  my $filename = $ARGV[0];
  my $times = $ARGV[1];
  my $sleep = $ARGV[2];
  $times = 5 if not defined $times;
  $sleep = 5 if not defined $sleep;
  
  
  open(OUT, ">$filename") or die "Can't open filename: $filename\n";
  print OUT `date`;
  
  my $counter = 0;
  while ( $counter < $times )
  {
      print OUT "$counter:  ";
      print OUT `date`;
      $counter++;
      
      sleep(5);
  }
  close(OUT) or die "Can't close filename: $filename\n";
  print "Completed $0\n";

ON AQ-7, RUN JOB:
qsub /cluster/data/agua/0.5/bin/apps/test/test.sh
    Your job 7 ("test1.sh") has been submitted
    OK!!
    
ON AQ-7, CHECK JOB IS RUNNING:
qstat
  job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID 
  -----------------------------------------------------------------------------------------------------------------
        9 0.00000 test1.sh   root         qw    01/18/2011 17:49:37                                    1        
ON AQ-7, CHECK OUTPUT:
cat /cluster/data/agua/0.5/bin/apps/test/test.out
    Tue Jan 18 23:31:48 UTC 2011
    0:  Tue Jan 18 23:31:48 UTC 2011
    1:  Tue Jan 18 23:31:53 UTC 2011
    2:  Tue Jan 18 23:31:58 UTC 2011
    3:  Tue Jan 18 23:32:03 UTC 2011
    4:  Tue Jan 18 23:32:08 UTC 2011
    5:  Tue Jan 18 23:32:13 UTC 2011
    6:  Tue Jan 18 23:32:18 UTC 2011
    7:  Tue Jan 18 23:32:23 UTC 2011
    8:  Tue Jan 18 23:32:28 UTC 2011
    9:  Tue Jan 18 23:32:33 UTC 2011


NOTES
-----


SGE Hosts
http://ait.web.psi.ch/services/linux/hpc/merlin3/sge/admin/sge_hosts.html
view the basic cluster and host configuration use the qconf -sconf command:
   qconf -sconf  [global]
   qconf -sconf  host_name
To modify the basic cluster or host specific configuration use the following commands:
   qconf -mconf  global
   qconf -mconf  host_name
To view and change the setup of hosts use qconf -XY [file] with the following options:
   =================================================================
                     HOST   execution   admin     submit  host_group 
                       Y      e          h          s
    ACTION        X 
   ----------------------------------------------------------------- 
   add (edit)     a           *          *          *         *
   add (file)     A           *                               *
   delete         d           *          *          *         *
   modify (edit)  m           *                               *
   modify (file)  M           *                               *
   show           s           *          *          *         *
   show list      sYl         *                               *
   ================================================================
   
qconf -help
-----------
/opt/sge6/bin/lx24-amd64/qconf -help    
GE 6.2u5
usage: qconf [options]
   [-aattr obj_nm attr_nm val obj_id_list]  add to a list attribute of an object
   [-Aattr obj_nm fname obj_id_list]        add to a list attribute of an object
   [-acal calendar_name]                    add a new calendar
   [-Acal fname]                            add a new calendar from file
   [-ackpt ckpt_name]                       add a ckpt interface definition
   [-Ackpt fname]                           add a ckpt interface definition from file
   [-aconf host_list]                       add configurations
   [-Aconf file_list]                       add configurations from file_list
   [-ae [exec_server_template]]             add an exec host using a template
   [-Ae fname]                              add an exec host from file
   [-ah hostname_list]                      add an administrative host
   [-ahgrp group]                           add new host group entry
   [-Ahgrp file]                            add new host group entry from file
   [-arqs [rqs_list]]                       add resource quota set(s)
   [-Arqs fname]                            add resource quota set(s) from file
   [-am user_list]                          add user to manager list
   [-ao user_list]                          add user to operator list
   [-ap pe-name]                            add a new parallel environment
   [-Ap fname]                              add a new parallel environment from file
   [-aprj]                                  add project
   [-Aprj fname]                            add project from file
   [-aq [queue_name]]                       add a new cluster queue
   [-Aq fname]                              add a queue from file
   [-as hostname_list]                      add a submit host
   [-astnode node_shares_list]              add sharetree node(s)
   [-astree]                                create/modify the sharetree
   [-Astree fname]                          create/modify the sharetree from file
   [-at thread_name]                        add/start qmaster thread
   [-au user_list listname_list]            add user(s) to userset list(s)
   [-Au fname]                              add userset from file
   [-auser]                                 add user
   [-Auser fname]                           add user from file
   [-clearusage]                            clear all user/project sharetree usage
   [-cq destin_id_list]                     clean queue
   [-dattr obj_nm attr_nm val obj_id_list]  delete from a list attribute of an object
   [-Dattr obj_nm fname obj_id_list]        delete from a list attribute of an object
   [-dcal calendar_name]                    delete calendar
   [-dckpt ckpt_name]                       delete ckpt interface definition
   [-dconf host_list]                       delete local configurations
   [-de host_list]                          delete exec host
   [-dh host_list]                          delete administrative host
   [-dhgrp group]                           delete host group entry
   [-drqs rqs_list]                         delete resource quota set(s)
   [-dm user_list]                          delete user from manager list
   [-do user_list]                          delete user from operator list
   [-dp pe-name]                            delete parallel environment
   [-dprj project_list]                     delete project
   [-dq destin_id_list]                     delete queue
   [-ds host_list]                          delete submit host
   [-dstnode node_list]                     delete sharetree node(s)
   [-dstree]                                delete the sharetree
   [-du user_list listname_list]            delete user(s) from userset list(s)
   [-dul listname_list]                     delete userset list(s) completely
   [-duser user_list]                       delete user(s)
   [-help]                                  print this help
   [-ke[j] host_list                        shutdown execution daemon(s)
   [-k{m|s}]                                shutdown master|scheduling daemon
   [-kec evid_list]                         kill event client
   [-kt thread_name]                        kill qmaster thread
   [-mattr obj_nm attr_nm val obj_id_list]  modify an attribute (or element in a sublist) of an object
   [-Mattr obj_nm fname obj_id_list]        modify an attribute (or element in a sublist) of an object
   [-mc ]                                   modify complex attributes
   [-mckpt ckpt_name]                       modify a ckpt interface definition
   [-Mc fname]                              modify complex attributes from file
   [-mcal calendar_name]                    modify calendar
   [-Mcal fname]                            modify calendar from file
   [-Mckpt fname]                           modify a ckpt interface definition from file
   [-mconf [host_list|global]]              modify configurations
   [-Mconf file_list]                       modify configurations from file_list
   [-me server]                             modify exec server
   [-Me fname]                              modify exec server from file
   [-mhgrp group]                           modify host group entry
   [-Mhgrp file]                            modify host group entry from file
   [-mrqs [rqs_list]]                       modify resource quota set(s)
   [-Mrqs fname [rqs_list]]                 modify resource quota set(s) from file
   [-mp pe-name]                            modify a parallel environment
   [-Mp fname]                              modify a parallel environment from file
   [-mprj project]                          modify a project
   [-Mprj fname]                            modify project from file
   [-mq queue]                              modify a queue
   [-Mq fname]                              modify a queue from file
   [-msconf]                                modify scheduler configuration
   [-Msconf fname]                          modify scheduler configuration from file
   [-mstnode node_shares_list]              modify sharetree node(s)
   [-Mstree fname]                          modify/create the sharetree from file
   [-mstree]                                modify/create the sharetree
   [-mu listname_list]                      modify the given userset list
   [-Mu fname]                              modify userset from file
   [-muser user]                            modify a user
   [-Muser fname]                           modify a user from file
   [-purge obj_nm3 attr_nm objectname]      deletes attribute from object_instance
   [-rattr obj_nm attr_nm val obj_id_list]  replace a list attribute of an object
   [-Rattr obj_nm fname obj_id_list]        replace a list attribute of an object
   [-sc]                                    show complex attributes
   [-scal calendar_name]                    show given calendar
   [-scall]                                 show a list of all calendar names
   [-sckpt ckpt_name]                       show ckpt interface definition
   [-sckptl]                                show all ckpt interface definitions
   [-sconf [host_list|global]]              show configurations
   [-sconfl]                                show a list of all local configurations
   [-se server]                             show given exec server
   [-secl]                                  show event client list
   [-sel]                                   show a list of all exec servers
   [-sep]                                   show a list of all licensed processors
   [-sh]                                    show a list of all administrative hosts
   [-shgrp group]                           show host group
   [-shgrp_tree group]                      show host group and used hostgroups as tree
   [-shgrp_resolved group]                  show host group with resolved hostlist
   [-shgrpl]                                show host group list
   [-sds]                                   show detached settings
   [-srqs [rqs_list]]                       show resource quota set(s)
   [-srqsl]                                 show resource quota set list
   [-sm]                                    show a list of all managers
   [-so]                                    show a list of all operators
   [-sobjl obj_nm2 attr_nm val]             show objects which match the given value
   [-sp pe-name]                            show a parallel environment
   [-spl]                                   show all parallel environments
   [-sprj project]                          show a project
   [-sprjl]                                 show a list of all projects
   [-sq [destin_id_list]]                   show the given queue
   [-sql]                                   show a list of all queues
   [-ss]                                    show a list of all submit hosts
   [-sss]                                   show scheduler state
   [-ssconf]                                show scheduler configuration
   [-sstnode node_list]                     show sharetree node(s)
   [-rsstnode node_list]                    show sharetree node(s) and its children
   [-sst]                                   show a formated sharetree
   [-sstree]                                show the sharetree
   [-su listname_list]                      show the given userset list
   [-suser user_list]                       show user(s)
   [-sul]                                   show a list of all userset lists
   [-suserl]                                show a list of all users
   [-tsm]                                   trigger scheduler monitoring
complex_list            complex[,complex,...]
destin_id_list          queue[,queue,...]
hostname_list           hostname[,hostname,...]
listname_list           listname[,listname,...]
rqs_list                rqs_name[,rqs_name,...]
node_list               node_path[,node_path,...]
node_path               [/]node_name[[/.]node_name...]
node_shares_list        node_path=shares[,node_path=shares,...]
user_list               user[,user,...]
obj_nm                  "queue"|"exechost"|"pe"|"ckpt"|"hostgroup"|"resource_quota"
attr_nm                 (see man pages)
obj_id_list             objectname [ objectname ...]
project_list            project[,project,...]
evid_list               all | evid[,evid,...]
host_list               all | hostname[,hostname,...]
obj_nm2                 "queue"|"queue_domain"|"queue_instance"|"exechost"
obj_nm3                 "queue"
thread_name             "scheduler"|"jvm"


qmaster USAGE
--------------
/etc/init.d/sgemaster.starcluster restart
Grid Engine start/stop script. Valid parameters are:
   (no parameters): start qmaster and shadow daemon if applicable
   "start"        dto.
   "stop"         shutdown local Grid Engine processes and jobs
   "-qmaster"     only start/stop qmaster (if applicable)
   "-shadowd"     only start/stop shadowd (if applicable)
   "-migrate"     shutdown qmaster if it's running on another
                    host and restart it on this host
                    Migration only works if this host is an admin host
   "-nosmf"       force no SMF
Only one of the parameters "start", "stop" or "softstop" is allowed.
Only one of the parameters beginning  with "-" is allowed. Does not 
apply to -nosmf.
Default argument is "start" for all components.
Default for "stop" is shutting down all components.

MODIFY CLUSTER CONFIG
---------------------
Modifying the Basic Cluster Configurations From the Command Line
Note 
You must be an administrator to use the qconf command to change cluster configurations.
Type one of the following commands:
% qconf -mconf global
% qconf -mconf host
The qconf -mconf global command modifies the global configuration.
The qconf -mconf host command modifies the local configuration of the specified execution host or master host.
The qconf commands that are described here are examples of the many available qconf commands. See the qconf(1) man page for others.
TAKE OUT A DISABLED NODE
------------------------
http://superuser.com/questions/218072/how-do-i-temporarily-take-a-node-out-from-sge-sun-grid-engine
Without knowing your SGE version I cannot say for certain that this will achieve the desired outcome, however, qconf -de foo will delete the execution host foo. qconf -ae foo will then add the host foo back to the execution list.
If you're running 6.1 or better, here's the best way. Create a new hostgroup called @disabled (qconf -ahgrp @disabled). Create a new resource quota set with "limit hosts @disabled to slots=0" (qconf -arqs). Now, to disable a host, just add it to the host group (qconf -aattr hostgroup hostlist MYHOST @disabled). To reenable the host, remove it from the host group (qconf -dattr hostgroup hostlist MYHOST @disabled). This process will stop new jobs from being scheduled to the machine and allow the currently running jobs to complete.
This does not seem to work. Jobs still get executed on the problematic. What can go wrong here? I can see it was added to @disbaled (using qconf -mhgrp @disabled) and I have enabled the quota set.  David B Dec 4 '10 at 12:16
By the way, the resource quota set looks like this: `{ name disabled_hosts description created by me enabled TRUE limit hosts @disabled to slots=0 }`  David B Dec 4 '10 at 12:19
By the way, this did work: { name disabled_hosts description created by me enabled TRUE limit hosts {my_bad_host} to slots=0 }, so I guess it has something to do with @disabled.
Using Path Aliasing
-------------------
In Solaris and in other networked UNIX environments, users often have the same home directory, or part of it, on different machines. For example, consider user home directories that are available across NFS and automounter. A user might have a home directory /home/foo on the NFS server. This home directory is accessible under this path on all properly installed NFS clients that are running automounter. However, /home/foo on a client is just a symbolic link to /tmp_mnt/home/foo. /tmp_mnt/home/foo is the actual location on the NFS server from where automounter physically mounts the directory.
A user on a client host might use the qsub -cwd command to submit a job from somewhere within the home directory tree. The -cwd flag requires the job to be run in the current working directory. However, if the execution host is the NFS server, the Grid Engine system might not be able to locate the current working directory on that host. The reason is that the current working directory on the submit host is /tmp_mnt/home/foo, which is the physical location on the submit host. This path is passed to the execution host. However, if the execution host is the NFS server, the path cannot be resolved, because its physical home directory path is /home/foo, not /tmp_mnt/home/foo.
Other occasions that can cause similar problems are the following:
Fixed NFS mounts with different mount point paths on different machines. An example is the mounting of home directories under /usr/people on one host and under /usr/users on another host.
Symbolic links from outside into a network-available file system.
To prevent such problems, the Grid Engine software enables both the administrator and the user to configure a path aliasing file. The locations of two such files are as follows:
 $SGE_ROOT/$SGE_CELL/common/sge_aliases  A global cluster path-aliasing file for the cluster
 $HOME/.sge_aliases  A user-specific path-aliasing file
	Note
Only an administrator should modify the global file.
Format of Path-Aliasing Files
Both path-aliasing files share the same format:
Blank lines and lines that begin with a # sign are skipped.
Each line, other than a blank line or a line preceded by #, must contain four strings separated by any number of blanks or tabs. The strings are as follows:
The first string specifies a source path.
The second string specifies a submit host.
The third string specifies an execution host.
The fourth string specifies the source path replacement.
Both the submit host and the execution host strings can be an * (asterisk), which matches any host.
How Path-Aliasing Files Are Interpreted
The files are interpreted in the following order:
After qsub retrieves the physical current working directory path, the global path-aliasing file is read, if present. 
The user path-aliasing file is read afterwards, as if the user path-aliasing file were appended to the global file. 
Lines not to be skipped are read from the top of the file, one by one. The translations specified by those lines are stored, if necessary.
A translation is stored only if both of the following conditions are true:
The submit host string matches the host on which the qsub command is run.
The source path forms the initial part either of the current working directory or of the source path replacements already stored. 
After both files are read, the stored path-aliasing information is passed to the execution host along with the submitted job. 
On the execution host, the path-aliasing information is evaluated. The source path replacement replaces the leading part of the current working directory if the execution host string matches the execution host. In this case, the current working directory string is changed. To be applied, subsequent path aliases must match the replaced working directory path. 
The following is an example of how the NFS automounter problem described earlier can be resolved with an aliases file entry.
Example  Path Aliasing File
# cluster global path aliases file
# src-path  subm-host   exec-host   dest-path
/tmp_mnt/   *           *           /


CAN'T EASILY EXPORT ENVIRONMENT VARIABLES WITH SSH COMMAND
----------------------------------------------------------
E.G., THIS DOESN'T WORK:
export SGE_ROOT=/opt/sge6;
ssh -i /nethome/admin/.starcluster/id_rsa-admin-key root@ip-10-124-245-118 \
-o SendEnv=SGE_ROOT \
echo $SGE_ROOT
    /opt/sge6
ssh -i /nethome/admin/.starcluster/id_rsa-admin-key root@ip-10-124-245-118 \
-o SendEnv=SGE_ROOT \
/opt/sge6/bin/lx24-amd64/qsub /data/agua/0.5/bin/apps/test/test1.sh \
-e /data/agua/0.5/bin/apps/test/test1.stderr \
-o /data/agua/0.5/bin/apps/test/test1.stdout \
    Unable to initialize environment because of error: Please set the environment variable SGE_ROOT.
Exiting.
ssh -i /nethome/admin/.starcluster/id_rsa-admin-key root@ip-10-124-245-118 \
"export SGE_ROOT=/opt/sge6; /opt/sge6/bin/lx24-amd64/qsub /data/agua/0.5/bin/apps/test/test1.sh \
-e /data/agua/0.5/bin/apps/test/test1.stderr \
-o /data/agua/0.5/bin/apps/test/test1.stdout "
    error: commlib error: got select error (Connection refused)
    Unable to run job: unable to send message to qmaster using port 6444 on host "ip-10-124-245-118.ec2.internal": got send error.
    Exiting.
EDIT .bashrc ON MASTER
export SGE_ROOT=/opt/sge6
export SGE_QMASTER_PORT=6444
export PATH=/opt/sge6/bin/lx24-amd64:$PATH
ADD PermitUserEnvironment TO SSH CONFIG:
echo "PermitUserEnvironment yes" >> /etc/ssh/sshd_config
RESTART SSH:
 * Restarting OpenBSD Secure Shell server sshd
   ...done.
CHECK REMOTE ENVIRONMENT VARIABLES
ssh -i /nethome/admin/.starcluster/id_rsa-admin-key root@ip-10-124-245-118 "env"
    Warning: Identity file /nethome/admin/.starcluster/id_rsa-admin-key not accessible: No such file or directory.
    SHELL=/bin/bash
    XDG_SESSION_COOKIE=caab1f7f8bba6e8ffcee317d4b7c8599-1294635529.862028-573376454
    SSH_CLIENT=10.124.245.118 43270 22
    USER=root
    MAIL=/var/mail/root
    PATH=/opt/sge6/bin/lx24-amd64:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
    PWD=/root
    LANG=en_US.UTF-8
    SGE_QMASTER_PORT=6444
    SGE_ROOT=/opt/sge6
    SHLVL=1
    HOME=/root
    LOGNAME=root
    SSH_CONNECTION=10.124.245.118 43270 10.124.245.118 22
    _=/usr/bin/env

BUT STILL GETTING ERROR:
ssh -i /nethome/admin/.starcluster/id_rsa-admin-key root@ip-10-124-245-118 \
"/opt/sge6/bin/lx24-amd64/qsub /data/agua/0.5/bin/apps/test/test1.sh \
-e /data/agua/0.5/bin/apps/test/test1.stderr \
-o /data/agua/0.5/bin/apps/test/test1.stdout"
    error: commlib error: got select error (Connection refused)
    Unable to run job: unable to send message to qmaster using port 6444 on host "ip-10-124-245-118.ec2.internal": got send error.
    Exiting.

</entry>
<entry [Tue Jan 18 17:32:26 EST 2011] INSTALL sge_master ON AQ-7 - IN THE END WAS NOT NECESSARY>
NB: INSTEAD OF THIS, WHAT WORKED WAS SIMPLY TO OPEN THE PORTS ON MASTER TO ALLOW AQ-7 TO SUBMIT TO IT
SEE apps/sge/install-aq7.xsl FOR INSTALL NOTES
</entry>