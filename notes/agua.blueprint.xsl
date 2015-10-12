agua.blueprint



<entry [Sat 2015:08:29 22:30:32 EST] SIPHON QUEUE ARCHITECTURE>

MASTER NODE

Role
- SEND JOBS TO WORKERS ON TASK QUEUE
- DIRECT WORKERS TO:
    - DEPLOY APPS
    - SHUTDOWN WHEN NO LONGER NEEDED

Daemons
agua 	    - 	RECEIVE AND RUN COMMANDS FROM WEB USER INTERFACE
master      - 	BALANCE NODES TO OPTIMIZE RESOURCES
            -   MAINTAIN FLOW OF JOBS IN TASK QUEUE 
listener    -   RECEIVE HEARTBEAT AND STORE IN DATABASE
            -   RECEIVE PROGRESS UPDATES FROM WORKERS

WORKER NODE

Daemons
worker      -	RECEIVES JOBS ON TASK QUEUE, HANDLES ONE JOB AT A TIME
            -   SEND JOB STATUS UPDATES
            -   SHUT DOWN IF DIRECTED BY MASTER
heartbeat   -   SEND HEARTBEATS
            -   MONITOR/RESTART worker DAEMON



monitor	-	workers SEND UPDATES (TASK STATUS, RESTART, RESOURCES) TO manager AND agua



TO DO:

-	agua PUSHES update.client TOPIC MESSAGES TO CLIENT 



    
</entry>
<entry [Fri 2015:08:28 15:27:57 EST] USED cpanm -L TO CREATE LOCAL PERL MODULES LIB>

cd /a
cat  /a/bin/install/resources/agua/perlmods | xargs -L1 cpanm -L extlib

cd /a/extlib
tree
.
├── bin
│   ├── config_data
│   ├── dbilogstrip
│   ├── dbiprof
│   ├── dbiproxy
│   ├── findrule
│   ├── lwp-download
│   ├── lwp-dump
│   ├── lwp-mirror
│   ├── lwp-request
│   ├── moose-outdated
│   ├── package-stash-conflicts
│   ├── prove
│   └── xsubpp
├── lib
│   └── perl5
│       ├── Algorithm
│       │   ├── cdiff.pl

    
</entry>
<entry [Thu 2015:08:20 09:23:16 EST] ENABLE RECEIVE EMAIL>

1. ENABLE POP ON GMAIL

    1. Sign in to Gmail.
    2. Goto Setting.
    3. Click on Forwarding and POP/IMAP
    4. Enable POP and IMAP on all messages 


2. ALLOW ACCESS TO GMAIL BY LESS SECURE APPS 

https://support.google.com/accounts/answer/6010255?hl=en


3. USE GMail::Checker


use GMail::Checker;

#my $gwrapper = new GMail::Checker();
my $gwrapper = new GMail::Checker(USERNAME => $username, PASSWORD => $password);
print "gwrapper: \n";
print Dumper $gwrapper;

# Let's log into our account (using SSL)
$gwrapper->login($username,$password);

# Get the number of messages in the maildrop & their total size
my ($nb, $size) = $gwrapper->get_msg_nb_size();
print "nb: $nb\n";
print "size: $size\n";

# Do we have new messages ?
my $alert =  $gwrapper->get_pretty_nb_messages(ALERT => "TOTAL_MSG");
print "alert: $alert\n";

# Get the headers for a specific message (defaults to last message)
#my @headers = $gwrapper->get_msg_headers(HEADERS => "FULL", MSG => 74);
my @headers = $gwrapper->get_msg_headers(HEADERS => "FULL", MSG => 10);
print "headers: @headers\n";

# Get a message size
my ($msgnb, $msgsize) = $gwrapper->get_msg_size(MSG => 10);
print "msgnb: $msgnb\n";
print "msgsize: $msgsize\n";


# Retrieve a specific message
my @msg = $gwrapper->get_msg(MSG => 10);
print $msg[0]->{content}, "\n";
print $msg[0]->{body};

# Retrieve UIDL for a message
my @uidl = $gwrapper->get_uidl(MSG => 10);


  
    
</entry>
<entry [Mon 2015:07:27 05:35:09 EST] PERLMODS REVISITED - EXTRACT ALL WITH CPANM --local>

http://search.cpan.org/~miyagawa/App-cpanminus-1.7039/bin/cpanm

-l, --local-lib
Sets the local::lib compatible path to install modules to. You don't need to set this if you already configure the shell environment variables using local::lib, but this can be used to override that as well.

-L, --local-lib-contained
Same with --local-lib but with --self-contained set. All non-core dependencies will be installed even if they're already installed.

For instance,

  cpanm -L extlib Plack
would install Plack and all of its non-core dependencies into the directory extlib, which can be loaded from your application with:

  use local::lib '/path/to/extlib';
Note that this option does NOT reliably work with perl installations supplied by operating system vendors that strips standard modules from perl, such as RHEL, Fedora and CentOS, UNLESS you also install packages supplying all the modules that have been stripped. For these systems you will probably want to install the perl-core meta-package which does just that.

--self-contained
When examining the dependencies, assume no non-core modules are installed on the system. Handy if you want to bundle application dependencies in one directory so you can distribute to other machines.

    
</entry>
<entry [Tue 2015:07:14 22:49:10 EST] EMAIL FEEDBACK - RECEIVE>

1. RUN EMAIL DAEMON

/a/bin/daemon/email


2. SEND MESSAGE

Subject:
Sample < SAMPLE > failed to pass FastQC in Project1:Workflow1" [aguadev:Project1:Workflow1|type:|action:runStage|stagenumber:5]

Message:
Continue


3. EMAIL DAEMON RECEIVES MESSAGE

    - GET ACTION FROM SUBJECT ANNOTATION [username:Project:Workflow|type:continue|action:runStage|stagenumber:5]
    - IF TYPE = continue:
        GET ACTION = runWorkflow
        GET STAGENUMBER = 5
        RUN 



    
</entry>
<entry [Tue 2015:t07:14 22:20:36 EST] EMAIL FEEDBACK - SEND>

/a/bin/logic/email HAS THE FOLLOWING STRUCTURE:

To:
aguadev@gmail.com

Subject:
Sample < SAMPLE > failed to pass FastQC in Project1:Workflow1" [aguadev:Project1:Workflow1|continue:Stage5]
Message:
Processing of sample < SAMPLE> in workflow 'Project1:Workflow1' has stopped.
Error/output logs are in folder Project1/Workflow1/FastQC/stdout labeled with the prefix 'NA12878'.
The FASTQC output file is here: Project1/Workflow1/FastQC/NA12878.fastqc.out.

To continue processing sample < SAMPLE > regardless, reply to this message with the word 'Continue' only.


ALTERNATE MESSAGES:

The workflow has completed loop number < LOOPNUMBER > / etc.


    
</entry>
<entry [Tue 2015:07:14 22:01:35 EST] ADDED /a/bin/logic/email>

SEE [Sun 2015:01:25 03:59:27 EST] SEND EMAIL

SUCCESSFUL EMAIL SEND WITHOUT sendmail USING aguanoreply@gmail.com

    #!/usr/bin/perl
    
    use strict;
    use warnings;
    use Email::Send;
    #use Email::Send::Gmail;
    #use Email::Simple::Creator;
    
    my $from	=	"aguanoreply\@gmail.com";
    my $to 		= "stuartpyoung\@gmail.com";
    
    my $email = Email::Simple->create(
        header => [
            From    => 	$from,
            To      => 	$to,
            Subject => 	"Email::Send::Gmail TEST 2 from $from to $to",
        ],
        body => 'Test email',
    );
    
    my $sender = Email::Send->new(
        {
            mailer      => 'Gmail',
            mailer_args => [
                username => 'aguanoreply',
                password => 'norepagua',
            ]
        }
    );
    eval { $sender->send($email) };
    die "Error sending email: $@" if $@;

	
</entry>
<entry [Tue 2015:07:14 21:31:10 EST] ADDED /a/bin/logic/fork>

MODULE: Logic::Fork

PURPOSE:

    1. SELECT ONE OR MORE WORKFLOW PATHS BASED ON ONE OR BOTH OF THE FOLLOWING:
    
        - CONTENTS OF INPUT FILE (USING --inputfile OPTION)
    
        - CONTENTS OF DATABASE (USING --modfile OPTION)

    2. SELECT BRANCH(ES) BY:

        - INDEX FOUND IN FIRST LINE OF INPUT FILE (DEFAULT, USING --inputfile OPTION)

        - INSTRUCTIONS LOADED DYNAMICALLY FROM *.pm FILE (--modfile OPTION)

        - STAGES AS ARGUMENTS:
        
            --if
            --elsif
            --else
            
        
        - MULTIPLE --regex AND --branch OPTIONS
        
            WHERE --branch IS A STRING OF FORMAT 'Project:Workflow:StageNumber:StageName'

        - 


FastQC Workflow Forks
---------------------

- Stage1 = FastQC

/a/apps/dnaseq/bin/fastqc \
--inputfile Project1/Workflow1/NA121878.fastq \
--outputfile Project1/Workflow1/fastqc.out


- Stage2 = FastQCFork

/a/apps/dnaseq/bin/fastqcfork \
--inputfile Project1/Workflow1/fastqc.out \
--outputfile Project1/Workflow1/fastqc.fork

WHICH DYNAMICALLY LOADS:

/a/apps/dnaseq/lib/FastqcFork.pm

WHICH HANDLES FILE PARSING AND BRANCH SELECTION:

    - OUTPUT TO FILE Project1/Workflow1/fastqc.fork
    
    - UPDATE DATABASE (POPULATE stage TABLE next ENTRIES)


OUTPUT *.fork FILE FORMAT

path    appnumber   appname    
0       3           email
1       4           fixMates


WHERE
path = 0 INDICATES APPLICATION IS NOT ON THE PATH (WILL NOT BE EXECUTED)
path = 1 INDICATES APPLICATION IS ON THE PATH (WILL BE EXECUTED)


- Stage3 = email

/a/bin/logic/email \
--inputfile Project1/Workflow1/fastqc.fork \
--subject "Sample < SAMPLE > failed to pass FastQC in Project1:Workflow1"
--message "Processing stopped.\nError/output logs are in folder Project1/Workflow1/FastQC/stdout.\nFASTQC output file is Project1/Workflow1/FastQC/fastqc.out"
--recipient aguadev@gmail.com \


- Stage4 = fixMates

/a/apps/dnaseq/bin/fixmates \
...


    
</entry>
<entry [Thu 2014:09:25 09:33:40 EST] REDUCED AGUA STAGING TO 3 STAGES>

emacs -nw /a/stager.conf

[defaults]
PACKAGE     agua
OUTPUTDIR   /tmp


[stage 1]
REPODIR     /mnt/repos/private/syoung/aguadev
    
[stage 2]
REPODIR     /mnt/repos/public/agua/aguadev

[stage 3]
REPODIR     /mnt/repos/public/agua/agua

    
</entry>
<entry [Sat 2014:08:30 12:08:28 EST] RUN node.js WEBSERVER>

1. INSTALL node-inspector

npm install node-inspector


2. START DAEMONS

cd /agua/bin/daemon/https
node https.js
 
cd /agua/apps
node /agua/apps/node-amqp/node_modules/rabbit.js/example/socketio/https.js


netstat -ntulp
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 0.0.0.0:443             0.0.0.0:*               LISTEN      22423/node      
tcp        0      0 127.0.0.1:55132         0.0.0.0:*               LISTEN      23786/Brackets-node
tcp        0      0 0.0.0.0:902             0.0.0.0:*               LISTEN      1630/vmware-authdla
tcp        0      0 0.0.0.0:40970           0.0.0.0:*               LISTEN      2015/beam.smp   
tcp        0      0 127.0.0.1:3306          0.0.0.0:*               LISTEN      1393/mysqld     
tcp        0      0 127.0.0.1:55249         0.0.0.0:*               LISTEN      23786/Brackets-node
tcp        0      0 0.0.0.0:4369            0.0.0.0:*               LISTEN      1939/epmd       
tcp        0      0 127.0.0.1:9234          0.0.0.0:*               LISTEN      23754/Brackets --la
tcp        0      0 127.0.1.1:53            0.0.0.0:*               LISTEN      20618/dnsmasq   
tcp        0      0 127.0.0.1:631           0.0.0.0:*               LISTEN      1228/cupsd      
tcp6       0      0 :::5672                 :::*                    LISTEN      2015/beam.smp   
tcp6       0      0 ::1:631                 :::*                    LISTEN      1228/cupsd      
udp        0      0 0.0.0.0:5353            0.0.0.0:*                           5226/chrome     
udp        0      0 0.0.0.0:5353            0.0.0.0:*                           1180/avahi-daemon: 
udp        0      0 0.0.0.0:5756            0.0.0.0:*                           20592/dhclient  
udp        0      0 0.0.0.0:48786           0.0.0.0:*                           1180/avahi-daemon: 
udp        0      0 127.0.1.1:53            0.0.0.0:*                           20618/dnsmasq   
udp        0      0 0.0.0.0:68              0.0.0.0:*                           20592/dhclient  
udp6       0      0 :::5353                 :::*                                1180/avahi-daemon: 
udp6       0      0 :::28293                :::*                                20592/dhclient  
udp6       0      0 :::47170                :::*                                1180/avahi-daemon: 



	
</entry>
<entry [Fri 2014:06:20 00:16:57 EST] BLUEPRINT: SGE WITH STARCLUSTER>

FROM Agua/Starcluster.pm


	PACKAGE		StarCluster

    PURPOSE
    
        1. START A CLUSTER, MOUNT AQUARIUS /data AND /nethome
		
			ON ITS NODES
    
        2. USERS CAN RUN small, medium, large OR CUSTOM CLUSTERS
            (ALL USERS USE admin USER'S CONFIG FILE)
        
        3. EACH WORKFLOW USES A SINGLE CLUSTER TO RUN ALL ITS STAGES
		
		4. MORE THAN ONE WORKFLOW CAN USE A CLUSTER AT THE SAME TIME
		
        5. THE CLUSTER SHUTS DOWN WHEN THERE ARE NO RUNNING WORKFLOWS
        
	NOTES
	
		THIS MODULE WORKS WITH OPERATIONAL CLUSTERS CONFIGURED BY
		
		THE automount.py STARCLUSTER PLUGIN, WHICH DOES THE FOLLOWING:
		
			1. OPEN NFS AND SGE PORTS IN SECURITY GROUP
	
			2. SETUP SHARES FROM HEAD
	
			3. MOUNT SHARES ON MASTER AND ALL NEW NODES
	
			4. SET THE DEFAULT QUEUE ON MASTER
	
			5. SET threaded PARALLEL ENVIRONMENT ON MASTER

			6. ADDITIONAL SGE CONFIGURATION


		StarCluster.pm IS BASED ON THE FOLLOWING METHODOLOGY:

	    1. A NEW SGE CELL IS CREATED ON THE AGUA HEAD NODE FOR EACH
		
			CLUSTER THAT IS STARTED E.G., /opt/sge6/syoung-smallcluster

	    2. WITHIN EACH CELL, A NEW QUEUE IS CREATED FOR EACH WORKFLOW
    
	        E.G., syoung-project1-workflow1

		3. ADD THE threaded PARALLEL ENVIRONMENT TO EACH QUEUE SO THAT
		
			JOBS CAN USE MULTIPLE CPUS (LATER: CHECK IF NECESSARY)
		
		
    TO DO

        1. ALLOW USERS TO SPECIFY MAX NUMBER OF NODES, AMIs, ETC.
        
            BY EDITING USER-SPECIFIC CONFIG FILES CONTAINING
			
			[cluster myClusterName] SECTIONS	

            USERNAME    CONFIGFILE
            admin       /home/admin/.starcluster/config
            jgilbert    /home/jgilbert/.starcluster/config

        2. ALLOW USER TO SPECIFY A CLUSTER FOR EACH WORKFLOW
    
            (ALL STAGES IN THE SAME WORKFLOW USE THE SAME CLUSTER)
        
        3. IMPLEMENT AUTO-LEVELLING TO AUTOMATICALLY 

            INCREASE/DECREASE THE NUMBER OF NODES BASED ON
            
            THE NUMBER OF QUEUED JOBS	

	
</entry>
<entry [Tue 2014:06:17 16:42:46 EST] ADDED DEPLOY KEY deploy1 TO GITHUB aguadev FOR EASY READ-ONLY DEPLOYMENT>


1. CREATED KEY

~/notes/agua/keypair/syoung/deploy1$ ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/home/syoung/.ssh/id_rsa): ./id_rsa
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in ./id_rsa.
Your public key has been saved in ./id_rsa.pub.
The key fingerprint is:

a4:fe:09:50:de:6f:92:16:69:95:2d:9c:4c:90:1a:07 syoung@comp2

The key's randomart image is:
+--[ RSA 2048]----+
|      E..o.      |
|      . o+ +     |
|      .+. B .    |
|     o.+ o .     |
|    . o S        |
|     o . +       |
|      o + o      |
|       + +       |
|        o        |
+-----------------+


cat id_rsa
-----BEGIN RSA PRIVATE KEY-----
MIIEpQIBAAKCAQEAwsAqkq8i3g4rSe3Diq1PZO9GFQamJS516R915DVFOs5gY5F0
U1yGmvx5KG87o8m3ZANEAA6P3DBl6LqOO/mMQnfCxj+grMrrPeHMJrHZCQXf9n1d
ne6dYaUObEzLvSrcZyX/Y7VTmPJ8OC2oL9OumxJ+3Gq/U0ulaADxE+4V57rIU9Yc
UrzbyuT8gwaTmovzJHOODITJHChdgKQZZ0ZjCaH05vyPJsxqWh9coiz4kPoX7WfW
Cu8z+gxqd/eXxA43GifcaylxApY0A3o+drs8kKcYH423FS81JNce3M68boGsUig3
QfOyIAm2iaReIeV4rart+0lgGtsI4dhzuy7zmwIDAQABAoIBAQC9MNWq3fyvX3Bq
R1J4+9hvI4sfjfAFmtbs+6UZZy6z7BzzXTB2cyJImhBRWY3ElYdU319F9t+GdnXp
2qGmXc0GHTXYRaOfeRmCakJbLNa8zzo9SJiTfmThoOkcCJa8VFD824r4oARwRtCp
+qCypZ+wAg2/ruvizVAIczG/vMEG9VbD+vVtpFdnjjfj1fosFnKkugfnfb7JJJDD
7pa9ka30CbbAdRGLdF9BKHfScbW/SDrv9LZWV8MRfm3NgM5K7iHadVGsifnJrf48
+aQ4dA8gKn0wKLNh/9mqbc+1/oeV/p6CNRL3Mz/Aka4/6Sg1d5Clv1vddoYJg2Av
BKBW6b/hAoGBAPf5fZ0VXma7JrE/xdBNz1PBoi7tHLGvzz5F2Nsq5WT3jVnd4oYh
ULsi1rKmuBvWJz5FOObW88bQiLxMNAR/wnizXQdJGT8F1U233R6W61T9eWpqUa0J
x4xAJTLNQZU5qhXr8EcmXFpWJhpuDuMR4YZirO2kifGmCEJVqYX4duqzAoGBAMkN
tPMrmu29XOhxWZ7ejzDJwqkHwa+bG1PvSlwcc1idxVUurKwooHtMhAiuSaLIjSZL
0p6T/JxnV9KBPVbrwIi8L23TlUW/cUKjLNqThE/QYy0jbRCevKP8kt8bHWEnnL4N
COVOamJty3TbRlCprJon3WaW1SmyhhB//Qn5RGd5AoGAQ8RE1cbfM4f1vP7GmnSJ
MkR6hAR8kPqQ0l3YM5z3b65PTL3ch/dWzq1oqw3wxnqx4sycDkmz+SNIGt1gYdJg
XQf3ZmRNp/F6J3EV1qQ7z9AtfC1uALHpfKSTBd0eDR/jIXaHBYqwNmfQpexp2Rgr
38Pbql4K7KUJIMe0Ok56gQ0CgYEAvBxM/2//Bw0zzm+vkItfoiBEN26Ac9NF4GR1
SHV+Hp2PMkH3YSSp8nMG3jBjySCnn/s1VxXTNmsiqlwtjhQKEmUwYyuh8J5MVDLk
FqYLF7o78NHCi9hZW31H1eNCu9IaP19mwVV7CBj+UZmP0ozOZ3WBGylozBiyguGd
WSWWMNECgYEAq1wiYpDYVnSQNa+5raoOBgYnW9xPpFX2rOy3b/VrWZkfGe9LkrgD
EDMeZhRCb5UhJ9hWbRD7w+WX98VUvJN1UuNbFCGcgLB71MfE6biFWqlsai1TZ2md
4fnN2Xb/BDtcOWG77X+yBYPHTIXSABLbsB2cn0wuykLTSjli+ScK7Fo=
-----END RSA PRIVATE KEY-----

cat id_rsa.*
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDCwCqSryLeDitJ7cOKrU9k70YVBqYlLnXpH3XkNUU6zmBjkXRTXIaa/HkobzujybdkA0QADo/cMGXouo47+YxCd8LGP6Csyus94cwmsdkJBd/2fV2d7p1hpQ5sTMu9KtxnJf9jtVOY8nw4Lagv066bEn7car9TS6VoAPET7hXnushT1hxSvNvK5PyDBpOai/Mkc44MhMkcKF2ApBlnRmMJofTm/I8mzGpaH1yiLPiQ+hftZ9YK7zP6DGp395fEDjcaJ9xrKXECljQDej52uzyQpxgfjbcVLzUk1x7czrxugaxSKDdB87IgCbaJpF4h5Xitqu37SWAa2wjh2HO7LvOb syoung@comp2


2. ADDED TO GITHUB

aguadev --> Settings --> Deploy keys

	deploy1 (a4:fe:09:50:de:6f:92:16:69:95:2d:9c:4c:90:1a:07)


3. ADDED TO master INSTANCE IN BCF

/root/.ssh/id_rsa

	
</entry>
<entry [Sun 2014:05:11 18:46:39 EST] BLUEPRINT: SOCKET.IO WITH RABBITMQ CONNECTING CLIENT TO SERVER AND CLUSTER>
	
1. ALL COMMUNICATION IS OVER SSL

2. node.js IMPLEMENTATION USES rabbitjs:

SEE node.xsl
[Sun 2014:04:20 19:42:19 EST] TROUBLESHOOTING socket.io WITH AGUA

node -v
	v0.10.15
npm -v
	1.3.5

RUN https.js

node /aguadev/apps/node-amqp/node_modules/rabbit.js/example/socketio/https.js


<!--

var http = require('https');
var url = require('url');
var fs = require('fs');
var io = require('socket.io');
var context = require('../../index').createContext();

// This line is from the Node.js HTTPS documentation.
var options = {
  key: fs.readFileSync('/etc/apache2/ssl.key/server.key'),
  cert: fs.readFileSync('/etc/apache2/ssl.key/server.crt')
};

var httpserver = http.createServer(options, handler);
var socketioserver = io.listen(httpserver);

socketioserver.sockets.on('connection', function(connection) {
    var pub = context.socket('PUB');
    var sub = context.socket('SUB');

	connection.on('disconnect', function() {
		pub.destroy();
		sub.destroy();
	});

	// NB we have to adapt between the APIs
	sub.setEncoding('utf8');
	connection.on('message', function(msg) {
		pub.write(msg);
	});
	sub.on('data', function(msg) {
		connection.send(msg);
	});
	sub.connect('chat');
	pub.connect('chat');
});

console.log("BEFORE httpserver.listen(8080, '0.0.0.0')");

httpserver.listen(8080, '0.0.0.0');

console.log("AFTER httpserver.listen(8080, '0.0.0.0')");

// ==== boring detail

function handler(req, res) {
  var path = url.parse(req.url).pathname;

  console.log("handler    path: " + path);
  
  switch (path){
  case '/':
    path = '/index.html';
  case '/index.html':
    fs.readFile(__dirname + '/index.html', function(err, data){


      if (err) return send404(res);

		console.log("err: " + err)
		
      res.writeHead(200, {
		'Content-Type': 'text/html',
		'Access-Control-Allow-Origin' : '*'
		});
      res.write(data, 'utf8');
      res.end();
    });
    break;
  default: send404(res);
  }
}

function send404(res){
  res.writeHead(404);
  res.write('404');
  res.end();
}

-->

AND index.html:

<!--
<!doctype html>
<html>
  <head>
    <title>rabbit.js and Socket.IO publish/subscribe example</title>
    <script src="/socket.io/socket.io.js"></script>
  </head>
  <body>

    <p>
      If you <a href="index.html">open the page</a> in more than one
      tab or window, you'll see published messages are sent to each
      and every subscriber (but only the messages since it subscribed,
      of course).
    </p>

    <script>
      function message(obj){
        var el = document.createElement('p');
        el.innerHTML = '<em>' + esc(obj) + '</em>'
        document.getElementById('chat').appendChild(el);
        document.getElementById('chat').scrollTop = 1000000;
      }

      console.log("index.html    io: ");
      console.dir({io:io});
      console.log("index.html    io.version: " + io.version);

      var conn = io.connect('https://localhost:8080');

      function send(){
        var val = document.getElementById('text').value;
        conn.send(val);
      }

      function esc(msg){
        return msg.replace(/</g, '&lt;').replace(/>/g, '&gt;');
      };

      conn.on('message', function(obj){
        message(obj);
      });
    </script>

    <div id="chat"></div>
    <form id="form" onsubmit="send(); return false">
      <input type="text" autocomplete="off" id="text"><input type="submit" value="Send">
    </form>

    <style>
      #chat { height: 200px; overflow: auto; width: 400px; border: 1px solid #eee; font: 13px Helvetica, Arial; }
      #chat p { padding: 8px; margin: 0; }
      #chat p:nth-child(odd) { background: #F6F6F6; }
      #form { width: 380px; background: #333; padding: 5px 10px; }
      #form input[type=text] { width: 300px; padding: 5px; background: #fff; border: 1px solid #fff; }
      #form input[type=submit] { cursor: pointer; background: #999; border: none; padding: 6px 8px; -moz-border-radius: 8px; -webkit-border-radius: 8px; margin-left: 5px; text-shadow: 0 1px 0 #fff; }
      #form input[type=submit]:hover { background: #A2A2A2; }
      #form input[type=submit]:active { position: relative; top: 2px; }
    </style>
    
  </body>
</html>

-->
LISTEN ON:

https://localhost:8080


</entry>
<entry [Sun 2014:05:04 20:17:59 EST] QUEUEING ALGORITHM>

1. START OFF WITH A PREDEFINED DISTRIBUTION OF RESOURCES, E.G.:

			Nodes (n)	CPUs (C)	Total CPUs (T)
	STAGE1	5 			8 			40
	STAGE2	10 			1 			10
	STAGE3	10 			8 			80

	where T1 + T2 + T3 = TOTAL = 130 nodes

		n1.C1 + n2.C2 + n3.C3 = 130
	
	
2. MEASURE THE AVERAGE DURATION AND HOURLY THROUGHPUT OF JOBS IN EACH STAGE, E.G.:

			D			t
	STAGE1	2 HOURS		5
	STAGE2	4 HOURS		2.5
	STAGE3	24 HOURS	10/24

	where t1 = n1/D1, i.e., throughput = duration / no. of nodes
	

3. REDEPLOY RESOURCES TO ENSURE THE SAME JOB THROUGHPUT FOR EACH STAGE
(SUCH THAT EFFICIENCY IS MAXIMISED)

	t1 = t2 = t3
	
	n1/D1 = n2/D2 = n3/D3

	
</entry>
<entry [Sun 2014:05:04 20:12:49 EST] BLUEPRINT: queue AND provenance TABLES>

The queue table maintains a growing list of sample IDs that are being processed.

The provenance table keeps track of the current state of the samples, including the version of software used to run them.


queue TABLE

- HOLDS THE LIST OF SAMPLES WITH CURRENT STATES IN QUEUES

- Queue::Manager ADDS SAMPLES FROM SYNAPSE LIST, VIA Synapse.pm, TO FILL QUEUES


provenance TABLE

- DETAILED LOG OF EACH STAGE

	- LAST STATE
	
	- VERSION AND INSTALLDIR OF APPLICATION, PACKAGE NAME

	
</entry>
<entry [Fri 2014:05:02 11:24:41 EST] Net::RabbitFoot IMPLEMENTATION OF QUEUES>

TOPICS

Topic exchange is powerful and can behave like other exchanges.

When a queue is bound with "#" (hash) binding key - it will receive all the messages, regardless of the routing key - like in fanout exchange.

When special characters "*" (star) and "#" (hash) aren't used in bindings, the topic exchange will behave just like a direct one



FROM rabbit.xsl
[Fri 2013:04:19 16:20:14 EST] Net::RabbitFoot WORKING


TUTORIAL 1: Hello World
-----------------------

    perl send.pl
    perl receive.pl

./receive.pl 
    [*] Waiting for messages. To exit press CTRL-C
    [x] Received Hello World!

./send.pl


rabbitmqctl list_queues

    Listing queues ...
    hello	0
    amq.gen-wi6sL8D0waBqwa4mXVxwhJ	0
    ...done.

	
TUTORIAL 2: WORK QUEUES
-----------------------

    perl new_task.pl "A very hard task which takes two seconds.."
    perl worker.pl

./worker.pl 
 
    [*] Waiting for messages. To exit press CTRL-C
    [x] Received A very hard task which takes two seconds..
    [x] Done
    [x] Received A second task
    [x] Done
    [x] Received DO IT
    [x] Done

perl new_task.pl "A very hard task which takes two seconds.."
 
    [x] Sent 'A very hard task which takes two seconds..'
./new_task.pl "A second task"
    [x] Sent 'A second task'
./new_task.pl "DO IT"
    [x] Sent 'DO IT'

 
TUTORIAL 3: PUBLISH / SUBSCRIBE
-------------------------------

    perl receive_logs.pl
    perl emit_log.pl "info: This is the log message"

RAN receive_logs.pl THEN emitlog.pl

./receive_logs.pl 
    [*] Waiting for logs. To exit press CTRL-C
    [x] info: Hello World!

 
./emitlog.pl 
    [x] Sent info: Hello World!


TUTORIAL 4: ROUTING
-------------------

    perl receive_logs_direct.pl info
    perl emit_log_direct.pl info "The message"


perl receive_logs_direct.pl info
 [*] Waiting for logs. To exit press CTRL-C
 [x] info: The message

perl emit_log_direct.pl info "The message"
 [x] Send info: The message

    
TUTORIAL 5: TOPICS
------------------

    perl receive_logs_topic.pl "*.rabbit"
    perl emit_log_topic.pl red.rabbit Hello

perl receive_logs_topic.pl "*.rabbit"
 [*] Waiting for logs. To exit press CTRL-C
 [x] red.rabbit:Hello

perl emit_log_topic.pl red.rabbit Hello
 [x] Sent red.rabbit:Hello
 
 
TUTORIAL 6: RPC
---------------

    perl rpc_server.pl
    perl rpc_client.pl

	
</entry>
<entry [Fri 2014:05:02 11:22:34 EST] CLIENT QUEUES DESCRIPTION in Agua.Exchange>

FROM plugins/core/Agua/Exchange.js

SUMMARY:
		Process the data in the client based on the type of message queue, whether the
		client is the original sender, filtering by topic pattern, etc.

		The following inputs are required:

			queue		:	Type of message queue, defined as follows:
				
				fanout	:	Run callback on all clients except the sender
				work	:	Only one of the waiting workers will run each job in the queue
				routing	:	Run callback only in the sender client
				publish	:	Run callback in all clients that have subscribed to the topic
				topic	:	Run callback in all clients that pattern match the topic
				request	:	All clients ignore except queue master

			token		:	Token of the originating client
			callback	:	Function to be called
			data		:	A data hash to be passed to the callback function
			id			:	ID of web component on which to run callback
			
		NB: The above queues will be gradually implemented and may be changed or added to
	
</entry>
<entry [Fri 2014:05:02 11:12:01 EST] BLUEPRINT: WORKER STATUS UPDATES>

IMPLEMENTATION:

-	manager SENDS FANOUT ping.status TOPIC TO ALL WORKER NODES

-	worker SENDS REPORT TO reply.status TOPIC

	-	NAME AND IP ADDRESS OF WORKER
	
	-	IS agua DAEMON RUNNING?
	
	-	RESOURCE USAGE:
		
		-	MEMORY
		
		-	CPU
		
		-	DISK

</entry>
<entry [Thu 2014:05:01 21:05:43 EST] BLUEPRINT: UPDATE AGUA AND RESTART DAEMONS>

REQUIREMENTS:

	1. UPDATE SOFTWARE ON worker SO TASKS ARE RUN WITH LATEST VERSION
	
		-	Agua BUG FIXES/IMPROVEMENTS
		
		-	PACKAGE BUG FIXES/IMPROVEMENTS: PanCancer TOOLS, BIOINFORMATICS TOOLS, ETC.
		

	1. UPDATE Agua AND OTHER SOFTWARE IN BETWEEN JOBS ON worker
	
	2. ALTERNATELY: DELETE WORKER AFTER JOB HAS ENDED, SPIN UP NEW WORKER AND REPROVISION


RECREATE VS UPDATE:

	1. RECREATE MUST WAIT FOR CURRENT TASK TO COMPLETE AND REQUIRES SOME DOWNTIME, UPDATE DOES NOT AFFECT RUNNING TASK AND REQUIRES NO DOWNTIME
	
	2. UPDATE MUST BE ABLE TO ROLLBACK ON UPDATE FAILURE
	
	3. RECREATE MAY BE SLIGHTLY SLOWER IF ORIGINAL IMAGE REQUIRES MANY SOFTWARE UPDATES
	
	4. RECREATE REQUIRES AUTOMATED NODE RESTART/PROVISIONING CODE, UPDATE REQUIRES A HANDOFF BETWEEN agua AND worker
	
	5. SAME RISK OF FAILURE, BUT UPDATE SENDS MESSAGES TO manager SO CAN RESPOND

	6. PACKAGE MANAGER (Agua) IS THE SAME:
	
		HEAD agua ADDS NEW ENTRY IN update TABLE FOR EACH UPDATE:
		
		-	worker NODE, PACKAGE, VERSION, OUTCOME, DATETIME


RECREATE PROCESS:
	
	1. manager SENDS HALT MESSAGE TO NODE

	2. worker HALTS AT END OF CURRENT TASK
		
		-	SENDS update.node.status MESSAGE TO manager

			-	NODE HALTED
			
	3. manager DESTROYS NODE, CREATES NEW NODE
	
	4. NEW NODE PROVISIONS
	
		FAILURE:
		
			-	manager 'TIMEOUT' ACTIVATES IF NO 'DEPLOY SUCCESS' MESSAGE

			-	DESTROY NODE, REDEPLOY OR MANUAL INTERVENTION ?
			
	5. worker SENDS update.deploy.status MESSAGE TO manager
	
		-	DEPLOY SUCCESS
		
	6. worker WAITS FOR A NEW TASK

	
UPDATE PROCESS:
	
	1. agua DAEMON DOES git UPDATE TO LATEST VERSION OF AGUA
	
	2. worker SENDS update.restart TOPIC MESSAGES INFORMING OF ITS STATUS
	
		-	INSTALLATION COMPLETE
		
		-	DOING RESTART agua
	
	3. worker RESTARTS agua DAEMON
	
		FAILURE:
		
			-	worker SENDS update.restart ERROR MESSAGE TO manager
		
			-	worker ROLLS BACK TO PREVIOUS git TAG, RESTARTS agua DAEMON
			
			FAILURE:
			
				-	worker SENDS update.restart ERROR MESSAGE TO manager
	
					-	manager RESTARTS NODE
			
					-	manager FLAGS FOR MANUAL TROUBLESHOOTING
			
					-	HEAD agua SENDS UPDATE TO CLIENT
			
	4. 	agua SENDS update.restart MESSAGES TO manager
			
			-	RESTART SUCCESS

			-	RESTARTING worker
				
	5. agua RESTARTS worker DAEMON
			
		FAILURE:
	
		-	agua SENDS update.node.restart ERROR MESSAGE TO manager
		
		-	agua ROLLS BACK TO PREVIOUS git TAG
		
		-	agua RESTARTS worker DAEMON
		
		FAILURE:
			
		-	agua SENDS update.restart ERROR MESSAGE TO manager

			-	manager RESTARTS NODE AND/OR
	
			-	manager FLAGS FOR MANUAL TROUBLESHOOTING
	
			-	HEAD agua SENDS UPDATE TO CLIENT

	6. worker SENDS update.restart MESSAGE TO manager
	
		-	RESTART SUCCESS

	7. worker WAITS FOR A NEW TASK
	

</entry>
<entry [Thu 2014:05:01 20:46:45 EST] BLUEPRINT: DAEMONS AND QUEUES>

DAEMONS

agua 	- 	INTERACTS WITH USER INTERFACE TO ENABLE MANAGEMENT OF WORKFLOWS

manager - 	MANAGES QUEUES TO OPTIMIZE PERFORMANCE WITH MANY SAMPLES RUNNING CONCURRENTLY

worker	- 	HANDLES TASKS AND REPORTS BACK ON PROGRESS


QUEUES

work  	-	manager SENDS JOBS TO workers, WHICH HANDLE ONE JOB AT A TIME

update	-	workers SEND UPDATES (TASK STATUS, RESTART, RESOURCES) TO manager AND agua

		-	manager USES UPDATES TO MANAGE QUEUES

		-	agua PUSHES update.client TOPIC MESSAGES TO CLIENT 

ping	-	manager REQUESTS REPLY FROM ALL NODES


</entry>
<entry [Sun 2014:04:20 22:05:07 EST] BLUEPRINT: QUEUES>


IMPLEMENT THE FOLLOWING QUEUES:

work QUEUES
-----------

QUEUE TYPE: TASK

EXCHANGE TYPE: fanout

PURPOSE:

	1. ONE JOB PER CONSUMER/WORKER NODE

	2. EXECUTE WORKFLOWS

	3. WORKER REPORTS BACK ON COMPLETION/ERROR TO update.task.status TOPIC

	4. POLL FOR STATUS OF WORKFLOW (UUID) JOBS


DETAILS:

	1. QUEUE NAMING FORMAT:

	username.project.workflow
	
		e.g., syoung.pancancer.align
		

update QUEUE
-----------

QUEUE TYPE: TOPICS
EXCHANGE TYPE: topic

PURPOSE: 


PUBLISH (MASTER SUBSCRIBES, WORKERS PUBLISH)
	
	1. PUSH FROM HOSTS ON JOB STATE CHANGE

	2. SHUTDOWN JOBS
	
	3. SHUTDOWN SERVERS AFTER FINAL JOBS HAVE COMPLETED


THIS WILL BE USED BY Queue::Master TO ACHIEVE LOAD BALANCING:

	- THROUGHPUT (UUIDS STATES) IS EVEN ACROSS SEVERAL DIFFERENT STAGES
	
	- EACH STAGE HAS DIFFERENT HARDWARE REQUIREMENTS
	
	- ENABLES SHIFTING OF RESOURCES TO WHERE THE BOTTLENECK IS


</entry>
<entry [Fri 2014:04:18 22:39:20 EST] PERLBREW - HOW TO INSTALL>

http://perlbrew.pl/


Install, quickly

Copy & Paste this line into your terminal:

\curl -L http://install.perlbrew.pl | bash
Or, if your system does not have curl but something else:

# Linux
\wget -O - http://install.perlbrew.pl | bash

# FreeBSD
\fetch -o- http://install.perlbrew.pl | sh
If you prefer to install with cpan, there are two steps:

sudo cpan App::perlbrew
perlbrew init
If it is installed with cpan, the perlbrew executable should be installed as /usr/bin/perlbrew or /usr/local/bin/perlbrew. For all users who want to use perlbrew, a prior perlbrew init needs to be executed.

The default perlbrew root directory is ~/perl5/perlbrew, which can be changed by setting PERLBREW_ROOT environment variables before the installation and initialization. For more advanced installation process, please read the perlbrew document.

What is perlbrew

perlbrew is a tool to manage multiple perl installations in your $HOME directory. They are completely isolated perl universes. This approach has many benefits:

No need to run sudo to install CPAN modules, any more.
Try the monthly released new perls.
Learn new language features.
Test your production code against different perl versions.
Leave vendor perl (the one that comes with OS) alone
Vendor perl usually serves its own purposes, and it might be a bad idea to mess it up too much.
Especially PITA when trying to upgrade system perl.
Some vendors introduced their own perl bugs, twice!
Hacking perl internals.
Just to keep up with fashion.
While the default is good enough, you may customize it to install to alternative places, or even let multiple users share the whole perlbrew environment.

perlbrew is simple

To install the latest stable release, and use it permanently:

perlbrew install perl-5.16.0
perlbrew switch perl-5.16.0
To play with the bleeding-edge version, but only in the current shell:

perlbrew install perl-blead
perlbrew use perl-blead
Runs myprogram.pl against all installations of perl, especially helpful when running tests:

perlbrew exec perl myprogram.pl
For more descriptions about commands,

perlbrew help

</entry>
<entry [Fri 2014:04:18 22:33:11 EST] PERLBREW - REINSTALL ALL MODULES ON NEW PERL>

How To Reinstall All Modules On New Perl

Sometimes when you install a new perl version, you want to put all the modules you were using on a previous version onto your new perl install.

You can easily get the list of modules in the current perl installation with list-modules command:

perlbrew use perl-5.8.8@foo-project
perlbrew list-modules
That simply prints out module names that you can use latter.

This one-liner can install everything in that output to a diferrent perl installation:

perlbrew list-modules | perlbrew exec --with perl-5.16.2@foo-project cpanm
The exec command is particularly helpful to run any program as if it is in the environment of the specified perl installations. Understand it more by running perlbrew help exec.
	
</entry>
<entry [Thu 2014:04:17 12:56:23 EST] ADD switchperl.sh SCRIPT TO /etc/profile>

SUMMARY

ADD TO BOTTOM OF .bash_profile

#### SET PATH FOR AGUA PACKAGED PERL                                                     
export PATH=/agua/apps/perl/5.18.2/bin:$PATH
export PERL5LIB=/agua/apps/perl/5.18.2/lib/5.18.2/lib/perl5:/agua/apps/perl/5.18.2/lib/5\
.18.2/lib/perl5/x86_64-linux-gnu-thread-multi



SUMMARY

1.	Determine the default locations of the Perl binary, modules, and manpages.

2.	Create set and unset functions for this version of Perl. Place them in perl.sh.

3.	Install new versions of Perl, taking care to isolate them in highly version-numbered directory structures.

4.	Determine the locations of the Perl binary, modules, and manpages for the new version.

5.	Create set and unset functions for this version of Perl. Place them in perl.sh.

6.	Add swap_perl to perl.sh. Add a command to swap in the default version at the bottom of perl.sh. Place perl.sh in /etc/profile.d.

7.	Call swap_perl in your process before executing Perl scripts.

8.	Change the shebang line of Perl scripts to use the env command, which will search the PATH for the desired version of Perl.


root FAILS TO FIND MooseX::Declare

Can't locate MooseX/Declare.pm in @INC (you may need to install the MooseX::Declare module) (@INC contains:

/agua/lib
/aguadev/lib
/mnt/repos/private/syoung/aguadev/cgi-bin/lib
/agua/apps/pcap/PCAP-core/lib
/agua/apps/pcap/0.3.0/lib/perl5/x86_64-linux-gnu-thread-multi
/agua/apps/pcap/0.3.0/lib/perl5
/agua/apps/perl/5.18.2/lib/site_perl/5.18.2/x86_64-linux
/agua/apps/perl/5.18.2/lib/site_perl/5.18.2
/agua/apps/perl/5.18.2/lib/5.18.2/x86_64-linux
/agua/apps/perl/5.18.2/lib/5.18.2

.) at /agua/lib/Agua/Workflow.pm line 1.

perl -e 'print @INC, "\n"'


/agua/apps/pcap/PCAP-core/lib
/agua/apps/pcap/0.3.0/lib/perl5/x86_64-linux-gnu-thread-multi
/agua/apps/pcap/0.3.0/lib/perl5
/agua/apps/perl/5.18.2/lib/site_perl/5.18.2/x86_64-linux
/agua/apps/perl/5.18.2/lib/site_perl/5.18.2
/agua/apps/perl/5.18.2/lib/5.18.2/x86_64-linux
/agua/apps/perl/5.18.2/lib/5.18.2.


syoung USER CAN RUN aguad OKAY:


perl -e 'print join "\n", @INC, "\n"'

/agua/apps/perl/5.18.2/lib/5.18.2/lib/perl5/x86_64-linux
/agua/apps/perl/5.18.2/lib/5.18.2/lib/perl5
/agua/apps/perl/5.18.2/lib/5.18.2/lib/perl5/x86_64-linux-gnu-thread-multi
/agua/apps/perl/5.18.2/lib/site_perl/5.18.2/x86_64-linux
/agua/apps/perl/5.18.2/lib/site_perl/5.18.2
/agua/apps/perl/5.18.2/lib/5.18.2/x86_64-linux
/agua/apps/perl/5.18.2/lib/5.18.2




NOTES
-----

ENVARS SET IN .bash_profile

	#### SET PATH FOR AGUA PACKAGED PERL                                            
	export PATH=/agua/apps/perl/5.18.2/bin:$PATH
	export PERL5LIB=/agua/apps/perl/5.18.2/lib/5.18.2/lib/perl5:/agua/apps/perl/5.18.2/lib/5.18.2/lib/perl5/x86_64-linux-gnu-thread-multi


@INC AVAILABLE TO USER

    PERL5LIB="/agua/apps/perl/5.18.2/lib/5.18.2/lib/perl5:/agua/apps/perl/5.18.2/lib/5.18.2/lib/perl5/x86_64-linux-gnu-thread-multi"
  @INC:
    /agua/apps/perl/5.18.2/lib/5.18.2/lib/perl5/x86_64-linux
    /agua/apps/perl/5.18.2/lib/5.18.2/lib/perl5
    /agua/apps/perl/5.18.2/lib/5.18.2/lib/perl5/x86_64-linux-gnu-thread-multi
    /agua/apps/perl/5.18.2/lib/site_perl/5.18.2/x86_64-linux
    /agua/apps/perl/5.18.2/lib/site_perl/5.18.2
    /agua/apps/perl/5.18.2/lib/5.18.2/x86_64-linux
    /agua/apps/perl/5.18.2/lib/5.18.2


ENVIRONMENT VARIABLES IN envars.sh 

	#!/bin/bash
	
	#### ENVIRONMENT VARIABLES
	export PATH=/agua/apps/pcap/0.3.0:$PATH
	export PATH=/agua/apps/python/2.7.3:$PATH
	export PATH=/agua/apps/samtools/0.1.19:$PATH
	export PATH=/agua/apps/pcap/0.2/bin:$PATH
	export PATH=/agua/apps/bwa/0.1.19:$PATH
	export PATH=/agua/apps/biobambam/0.0.129/src:$PATH
	export PYTHONPATH=/usr/local/lib/python2.7/:$PYTHONPATH
	export PYTHONPATH=/usr/local/lib/python2.7/lib-dynload:$PYTHONPATH
	export LD_LIBRARY_PATH=/agua/apps/biobambam/libmaus-0.0.108-release-20140319092837/src/.libs
	export PERL5LIB=/agua/apps/pcap/0.3.0/lib/perl5:$PERL5LIB
	export PERL5LIB=/agua/apps/pcap/0.3.0/lib/perl5/x86_64-linux-gnu-thread-multi:$PERL5LIB
	export PERL5LIB=/agua/apps/pcap/PCAP-core/lib:$PERL5LIB

SHORTCUT TO PERL BINARY IN .bash_profile

	alias agperl='/agua/apps/perl/5.18.2/bin/perl'



SCRIPT TO SET/UNSET DIFFERENT PERL VERSIONS:

http://www.drdobbs.com/web-development/juggling-perl-versions/184415973

<!--

# -*- ksh -*-
# =====================================================================
# $Source: /home/cvs/repository/profiles/path_funcs.sh,v $
# $Revision: 1.1 $
# $Date: 2002/07/20 02:46:53 $
# $Author: matthew $
# $Name:  $ - the cvs tag, if any
# $State: Exp $
# $Locker:  $
# =====================================================================

##
## Functions to manipulate paths safely
##
PD=${PERL_DEFAULT:-/usr/bin/perl}

addpath()
{

  ## Get the path option. Figure out the pathvar and its value and
  ## pass both down to the Perl code. Why? Because if the pathvar is
  ## NOT exported, it does not end up in Perl %ENV and you will end
  ## up always redefining it instead of adding to it.

  ## Inits
  parg=''
  oarg=''

  ## Sharing OPTIND within a function call
  oldOPTIND=$OPTIND
  OPTIND=1

  while getopts ':hvp:fb' opt
  do
    case $opt in
      p )
	  pvar=$OPTARG
	  eval pval=\$$pvar
	  parg="-p $pvar=$pval"
	  ;;

      h | v | f | b )
		      oarg="$oarg -$opt"
		      ;;
    esac
  done

  shift `expr $OPTIND - 1`

  if [ "$parg" = "" ]
  then
    if [ ! "$1" = "" ]
    then
      pvar=$1
      eval pval=\$$pvar
      parg="-p $pvar=$pval"
      shift
    fi
  fi

  OPTIND=$oldOPTIND

  ## We hardcode perl just incase we are trying to run swap_perl,
  ## which will take perl out of the PATH at some point before
  ## putting the new version in. The default in /usr/local/bin will
  ## be sufficient for this script.

  ## If you export PATH_FUNCS_DEBUG=-d, you get the debugger. -d:ptkdb
  ## works even better

  results=$($PD $PATH_FUNCS_DEBUG -we'

##
## Options/arg processing section. Straight-forward
##
use Getopt::Std;

my %opts = ();
my @verbose = ();
my $usage = <<EOUSAGE;
Usage: addpath [-p] <pathvar> [-h] [-v] [-f|-b] <dirspec> [<dirspec> ...]
       Idempotently adds <dirspec> to <pathvar>
       -p specifies <pathvar>. -p is optional
       -h prints usage
       -v prints messages about the status of the command
       -f adds <dirspec> to front of <pathvar>
       -b adds <dirspec> to back of <pathvar>
EOUSAGE
;

## Process options
if (!getopts(q{hvp:fb},\%opts)) {
    die "$usage\n";
}

if ($opts{h}) {
    print STDERR "$usage\n";
    exit 0;
}

if(!defined($opts{p})) {
    die "No pathvar defined\n$usage\n";
}

if (defined($opts{f}) and defined($opts{b})) {
    die "-f and -b options are mutually exclusive\n$usage";
}

## Process args
if (!scalar(@ARGV)) {
    die "\nNo dirspec specified.\n$usage\n"
}

## Pull the pathvar and value out of the option
my $pathvar = undef;
my $pathval = undef;
($pathvar, $pathval) = split(/=/,$opts{p});

## $pathsep may be able to be pulled out of Config.pm on a per-platform
## basis. For now, default to UNIX.
my $pathsep=":";

## Hash-out the current sub-paths for easy comparison.
my %pathsubs=();
my $pathfront=0;
my $pathback=0;
if(!defined($pathval) ||
   !length($pathval)) {
    push @verbose, "$pathvar does not exist, initial assignment";
    $pathval = ""; ## Shuts up -w undef complaint later.
} else {
    %pathsubs = map { $_ => $pathback++} split($pathsep,$pathval);
    $pathback--;
}

## Start checking each path arg
for my $argv (@ARGV) {

    ## This is a complete comparison, no need to take care
    ## of your path posssibly being a portion of an existing path.
    if(defined($pathsubs{$argv})) {
	push @verbose, "$argv already present in $pathvar";
    } else {
	## Stick it where it belongs
	if(defined($opts{f})) {
	    $pathsubs{$argv} = --$pathfront;
	    push @verbose, "Pre-pended path $argv";
	} else {
	    $pathsubs{$argv} = ++$pathback;
	    push @verbose, "Appended path $argv";
	}
    }
}

## Put humpty dumpty back together again
$pathval = join ($pathsep,
		 sort {$pathsubs{$a} <=> $pathsubs{$b}} keys %pathsubs);

print STDERR join("\n",@verbose) if (defined($opts{v}));

## The shell will eval this:
print "$pathvar=$pathval";

' -- $parg $oarg $*)
eval eval $results
}





Listing 2
 delpath()
{
  ## Get the path option. Figure out the pathvar and its value and
  ## pass both down to the Perl code. Why? Because if the pathvar is
  ## NOT exported, it does not end up in Perl %ENV and you will end
  ## up always redefining it instead of adding to it.

  ## Inits
  parg=''
  oarg=''

  ## Sharing OPTIND within a function call
  oldOPTIND=$OPTIND
  OPTIND=1

  while getopts ':hvp:en' opt
  do
    case $opt in
      p )
	  pvar=$OPTARG
	  eval pval=\$$pvar
	  parg="-p $pvar=$pval"
	  ;;

      h | v | e | n )
		      oarg="$oarg -$opt"
		      ;;
    esac
  done

  shift `expr $OPTIND - 1`

  if [ "$parg" = "" ]
  then
    if [ ! "$1" = "" ]
    then
      pvar=$1
      eval pval=\$$pvar
      parg="-p $pvar=$pval"
      shift
    fi
  fi

  OPTIND=$oldOPTIND

  ## We hardcode perl just incase we are trying to run swap_perl,
  ## which will take perl out of the PATH at some point before
  ## putting the new version in. The default in /usr/local/bin will
  ## be sufficient for this script.

  ## If you export PATH_FUNCS_DEBUG=-d, you get the debugger. -d:ptkdb
  ## works even better

  results=$($PD $PATH_FUNCS_DEBUG -we'

##
## Options/arg processing section. Straight-forward
##
use Getopt::Std;

my %opts = ();
my @verbose = ();
my $usage = <<EOUSAGE;
Usage: delpath [-p] <pathvar> [-h] [-v] [-e] [-n] <dirspec> [<dirspec> ...]
       Removes <dirspec> from <pathvar>
       -p specifies <pathvar>. -p is optional
       -h prints usage
       -v prints messages about the status of the command
       -e <dirspec> is used as a regexp
       -n removed non-existent directories from <pathvar>
EOUSAGE
;

## Process options
if (!getopts(q{hvp:en},\%opts)) {
    die "$usage\n";
}

if ($opts{h}) {
    print STDERR "$usage\n";
    exit 0;
}

if(!defined($opts{p})) {
    die "No pathvar defined.\n$usage\n";
}

## Process args
if (!scalar(@ARGV)) {
    die "\nNo dirspec specified.\n$usage\n"
}

# Pull the pathvar and value out of the option
my $pathvar = undef;
my $pathval = undef;
($pathvar, $pathval) = split(/=/,$opts{p});

## $pathsep may be able to be pulled out of Config.pm on a per-platform
## basis. For now, default to UNIX.
my $pathsep=":";

## Hash-out the current sub-paths for easy comparison.
my %pathsubs=();
my $pathfront=0;
my $pathback=0;
if(!defined($pathval) ||
   !length($pathval)) {
    push @verbose, "$pathvar does not exist, nothing to do";
    $pathval = ""; ## Shuts up -w undef complaint later.
    goto NOTHING_TO_DO;
} else {
    %pathsubs = map { $_ => $pathback++} split($pathsep,$pathval);
    $pathback--;
}

## Start checking each path arg
for my $argv (@ARGV) {

    my @matches = ();
    my $msg = undef;
    if(defined($opts{e})) {
	$msg = 'Regexp';
	@matches = grep {$_ =~ /$argv/} keys %pathsubs;
    } else {
	$msg = 'Path';
	@matches = grep {$_ eq $argv} keys %pathsubs;
    }
    if(scalar(@matches)) {
	delete @pathsubs{@matches};
	push @verbose, "Deleted paths ", join(",",@matches);
    } else {
	push @verbose, "$msg $argv not found";
    }
}

## Check for empties
if(defined($opts{n})) {
    @matches = grep {! -d $_} keys %pathsubs;
    if(scalar(@matches)) {
	delete @pathsubs{@matches};
	push @verbose, "Deleted non-existent paths ", join(",",@matches);
    }
}

## Put humpty dumpty back together again
$pathval = join ($pathsep,
		 sort {$pathsubs{$a} <=> $pathsubs{$b}} keys %pathsubs);

NOTHING_TO_DO:
print STDERR join("\n",@verbose) if (defined($opts{v}));

## The shell will eval this:
print "$pathvar=$pathval";

' -- $parg $oarg $*)
eval eval $results
}
Back to Article

Listing 3
 swap_perl()
{
  ## Validate the version argument
  to=$1
  case $to in
    5.6.1 | 5.8.0 )
	    ok=1
	    ;;
    *)
       echo "Your choices are 5.6.1 and 5.8.0. Bye."
       return 1
       ;;
  esac
  shift

  ## Determine what version is to be swapped out and do so, if 
  ## possible

  if [ "$PERL_CURRENT_VERSION" = "" ]
  then
    echo "No PERL_CURRENT_VERSION defined to swap out. Continuing..."
  elif [ "$PERL_CURRENT_VERSION" = "initial" ]
  then
    echo "Silently skip unsetting Perl" > /dev/null
  elif [ "$PERL_CURRENT_VERSION" = "$to" ]
  then
    echo "Current Perl version is already $to. Exiting."
    return
  else
    echo "Swapping out $PERL_CURRENT_VERSION..."

    ## Multiple levels of string interpolation simplify our job here...
    unset_perl_$PERL_CURRENT_VERSION
  fi

  echo "Swapping in $to..."

  ## and here...
  set_perl_$to

  ## Any other argument given to the function is treated as a 
  ## potential location for modules. You can add your own local
  ## libraries to the PERL5LIB variable by specifying the root
  ## directories as arguments after the version number.

  adds="$*"
  if [ ! "$adds" = "" ]
  then
    for i in $adds
    do
      add_perl5lib $i
    done
  fi
}

-->


NOTES
-----

Juggling Perl Versions
By Matthew O. Persico, January 01, 2003

Post a Comment

Juggling Perl Versions
Juggling Perl Versions
The Perl Journal January 2003

By Matthew O. Persico
Matthew is currently a vice president in the IT department of Lazard Asset Management in New York City. He can be reached at persicom@acedsl.com.

Managing change when you maintain a sizable Perl installation isn't easy. Inevitably, one \of your colleagues will come to you and say, "I was looking at CPAN and you know, I could save myself two weeks of work if I could install the Foo::Bar module for use in my Yadayadayada project. Can we get it installed?"

"Sure," you reply. "I'll get right on it." You download the tarball from CPAN, execute:

gtar zxvf Foo-Bar-1.68.tar.gz

cd Foo-Bar-1.68

perl Makefile.PL

and then it hits you:

Perl v5.8.0 required—this is only v5.6.1, stopped at Bar.pm line 2.

Okay, now what? Well, you can try to find a version of Foo::Bar that works with 5.6.1, but the odds are there isn't one. Even if there is such a version, it is probably old enough that it is missing needed functionality or has bugs that are fixed in later versions.

You could say, "Sorry, we can't support it," and you might even get away with that for just one module or just one project.

Eventually, however, the modules you support are going to be upgraded, new modules will be required, and your version of Perl is not going to support them.

That's the point where you start to consider an upgrade of Perl.

However, by this time, you've discovered that there are hundreds of Perl scripts and modules used in production. Every one of them will have to be regression tested before upgrading. Regression testing takes time away from development. Try selling that to your end users.

The cost of upgrading any programming language environment is not trivial. You must make sure that every program works in the new environment in the same manner as it did in the old environment before you switch over to the new one. In addition, as more and more operating systems (at least in the *NIX and Linux worlds) come with default installations of Perl that are critical to the smooth operation of the system, upgrading Perl or its default modules can negatively impact the operating system's performance.

It seems nearly impossible to safely upgrade Perl without a massive amount of testing. But there is a solution. Instead of upgrading Perl, you can "side-grade" it. This article will describe how to install and maintain multiple versions of Perl on a machine in a transparent and flexible manner. In this manner, you can port scripts on an as-needed basis and maintain multiple versions for testing on your development machines.

Principles
In order to maintain multiple versions of Perl in an environment, we set down the following principles:

Do no harm. A user or process that knows nothing about our Perl-swapping environment should be presented with the default Perl environment that comes "out-of-the-box." This means that all paths should have default values that allow a process to use Perl without having to explicitly call any special functions or explicitly set any special environment variables.
No pain, all gain. The method for changing Perl versions should be as painless as possible. Ideally, one command should do it.
You can go back. There is no reason why the default version of Perl shouldn't be considered just another version of Perl to be swapped. You should be able to switch back to the default version of Perl as easily as to any other version.
To this end, we will create a shell script called "perl.sh," to be placed in the /etc/profile.d directory and called from /etc/profile upon login. It will create all functions needed to set a particular version of Perl in the environment, and it will set the default environment when first invoked.

I'll describe how to build perl.sh step by step. This is the easiest way to show you how to build the environment yourself, which will probably be necessary—your Perl may be in a different place, your modules may be scattered over multiple directories, and you may have a different version of Perl than I am describing here. Use this article and its code as a template—do not expect to drop this version of perl.sh onto your system without alteration.

Standardizing the Default Perl Version
The first step is to get the default version of Perl properly set up using perl.sh. This will take a bit of work because the default version of Perl is already set up, so we do not want to clobber it when perl.sh is invoked the first time around. However, we must make sure that we can get back to the default version from another installed version if needed.

Determine Locations
We need to get the locations of the Perl binary, modules, and manpages. One could use perldoc instead of manpages, but having the Perl manpages available is convenient if you are using GUI man tools.

First, execute the command which perl. In this case, the result is /usr/bin/perl, which tells us two things:

1.	Where the Perl binary lives.

2.	It is on a directory in the PATH.

Next, execute perl -V. We ignore the build information for the moment and focus on the tail end of the output, which is shown in Example 1.

What this tells us is that there are no other known locations for Perl modules other than the default locations. Practically, that means that PERL5LIB is not set and that all modules added to the system must be installed into /usr/lib/perl5.

My personal philosophy on the subject of installation locations is simple: If I didn't build it, I won't write to it. I install all modules added to the system into another directory, even those that are upgrades of modules that are part of the out-of-the-box installation. Upgrading the default version of Perl or its modules in place could cause operating-system components to fail (as previously discussed). Furthermore, if you need to rebuild your system, you will have yet another item to attend to—rebuilding all the modules you added to or updated in the default location. If these modules are installed elsewhere, then when you restore the same version of Perl under which the modules were originally installed to the default location, the add-on modules should be immediately available (assuming you unmounted and did not reformat that partition in the rebuild). Finally, one can, if necessary, cut off access to the upgraded versions by removing the directory from PERL5LIB and allow usage of the default modules since they still exist in the original Perl tree.

I am going to establish /opt/perl/lib as the location for my new modules. I am doing this because I consider Perl to be a product unto itself. /usr and /usr/local are good places to stash shared objects like libraries or executables. Perl, however, has a pretty intricate directory structure of its own. Isolating the structure makes it easier to do our environment modifications to swap versions later.

The exact setting of PERL5LIB that is needed to produce a valid @INC seems to have changed from release 5.004_04 through 5.005, 5.6.0, 5.6.1, and 5.8.0. Furthermore, the end result is highly dependent on where and how Perl is configured and installed in the first place. Rather than try to determine the settings via the documentation, I suggest you determine it empirically with these steps:

1.	Create /opt/perl.

2.	Grab any module from CPAN.

3.	Unwind the tarball and perform the magic incantations:

perl Makefile.PL
make test install PREFIX=/opt/perl
4.	Take note of where the module is installed.

You'll notice that I set PREFIX at installation time. This is a result of the environment in which I was trained. By setting PREFIX at install time instead of Makefile at creation time, I can use the same tarball tree to install to a local testing area, a global testing area, and a production area without having to reexecute perl Makefile.PL each time. You may feel differently. Feel free to specify PREFIX at perl Makefile.PL time. The only caveat is that you must be consistent. Pick one method and stick with it. I vaguely recall that in one version of Perl, the end location of the module was different depending on which method was used. This is another example of why I am demonstrating the empirical method of building this framework.

Finally, test man capabilities. When I try man perl, the manpage appears. This indicates that we can get to the manpages in Section 1 for Perl commands. When I try man ExtUtils::MakeMaker, the manpage does not appear. A quick check of the environment reveals that there is no MANPATH environment variable set. Therefore, man is using its own heuristics to determine where manpages are located. By reexamining the top of the perl -V output, we see the information in Example 2.

The flag -Dman3dir defines a location for module manpages that is not going to appear in a default manpath due to its location, which is not "near" a PATH entry. Even if this path did appear in the default manpath, it would not help us. Without a MANPATH variable to manipulate, we are not going to be able to swap in manpages that correspond to the version of Perl that we want to change. So, the first order of business is to fix this.

In most versions of man, setting MANPATH completely overrides man's heuristics; it does not add new paths to the default ones. This is not a problem, however. There is usually a program manpath that will print the default paths used by man in the absence of a MANPATH variable. So, we create man.sh and put it in /etc/profile.d. This ensures that the variable is set for each login process. The contents of man.sh are simply:

MANPATH='manpath'
export MANPATH
This is strict Bourne Shell syntax. Korn or bash users can try:

export MANPATH=$(manpath)
I will use bash shell syntax from now on. Bourne Shell users can make the necessary adjustments.

Now we will be able to alter the man environment to match our Perl environment. It might be argued that setting MANPATH to override man's heuristics defeats the purpose of having them. In truth, the only time it matters is when installing new software. Without a MANAPTH set, man will automatically find the new man directory if it is "close" to a directory on the PATH. But a new PATH entry is only available to processes that log in after installation, unless a process (or more likely a user) resets PATH. Logging out and in again should rerun the /etc/profile.d files, including our new manpath.sh, which will reexecute the manpath call and pick up any newly installed manpages if they follow the heuristics.

Create the set and unset Functions

We will create a function named set_perl_5.6.1. It will perform three functions:

1.	Set PATH so that the 5.6.1 version of Perl is on the path.

2.	Set PERL5LIB so that any extra libraries are found.

3.	Set MANPATH so that the Perl manpages are located.

Here is the code:

set_perl_5.6.1()
{
  export PERL_CURRENT_VERSION=5.6.1
  addpath -f PATH /opt/perl/bin
  add_perl5lib /opt/perl
  addpath -f MANPATH /usr/lib/perl5/man
  addpath -f MANPATH /opt/perl/lib/perl5/man
}
Take a look at the line addpath -f MANPATH /usr/lib/perl5/man. Given that this is the default version of Perl, you might be tempted to add it to /etc/man.config. It is even possible that the line is already in man.config, waiting to be uncommented. Do not do it. We need to get rid of this part of the path when swapping in a new version; making it part of the default will prevent its removal.

PERL_CURRENT_VERSION is defined in order to keep track of what version we are currently running. addpath is a function that will add a directory to a PATH-like environment variable. It makes use of the PERL_DEFAULT variable. See Listing 1 for the code. addpath and delpath are translations of shell scripts and are described in the following Linux Journal articles: http://www .linuxjournal.com/article.php?sid=3645, http://www.linuxjournal .com/article.php?sid=3768, and http://www.linuxjournal.com/ article.php?sid=3935.

In this case, we add /opt/perl/bin to PATH because there are modules (such as DBI) that create binaries. This is where they will end up when installed. Why not /opt/perl/bin/5.6.1 or /opt/ perl/5.6.1/bin? Because when we execute make install PREFIX=/opt/perl, the remainder of the paths are taken from Perl's current configuration, and the configuration, in this case, is to put all binaries into $PREFIX/bin. add_perl5lib is another function, presented in Example 3 with its relatives.

We find the directories corresponding to the current version of Perl under the requested top-level directory and add or delete them from the PERL5LIB environment variable.

The corresponding unset function is:

unset_perl_5.6.1()
{
  delpath -f MANPATH /opt/perl/lib/perl5/man 
  delpath -f MANPATH /usr/lib/perl5/man
  del_perl5lib /opt/perl
  delpath -f PATH /opt/perl/bin
  unset PERL_CURRENT_VERSION
}
delpath is a function that will add a directory to a PATH-like environment variable; see Listing 2. Detailed discussion of the function is beyond the scope of this article.

You will notice that the actions in the unset function are performed in inverse order of the corresponding set actions. Although this is not strictly required, it is imperative that the setting and unsetting of PERL_CURRENT_VERSION be the first and last actions of their respective functions. All of the other functions make use of the value of PERL_CURRENT_VERSION, so it must be available to execute the actions.

Add all of this code to perl.sh and all the defaults are now defined for your out-of-the-box version of Perl.

As a last note, notice that we do not add or delete the default path for Perl from PATH. There are a number of reasons. In most cases, the path for the default version of Perl is shared. In this case, removing /usr/bin from PATH would have dire consequences. A similar argument applies to the default MANPATH entry /usr/share/man where the section 1 manpages live.

You always want to leave a minimum version of Perl in the PATH because the addpath and delpath utilities use Perl to do their magic.

Up to this point, this all has been an interesting exercise, but without a second version of Perl, there is really no reason to have gone through all this work. Let's install another version of Perl.

Build a New Version of Perl
I will demonstrate by installing version 5.8.0 into /opt/perl. During the configure phase (which I invoke using sh Configure), I take all the default values except for the prompts shown in Example 4. Subsequent questions will have their defaults altered based on these answers. (For example, we will not need to explicitly set the man directory for modules [section 3]. Configure is smart enough to change the default to /opt/perl/man/5.8.0/man3 given the setting of man1.) I do not show those questions here since all you have to do is hit RETURN to take the now modified defaults. In order to make installation a bit smoother, create the directory

/opt/perl/bin/5.8.0

and unset PERL5LIB (if you've set it) before starting Configure. Example 4 shows the questions for which you must override the defaults.

Notice that we chose the location for the version number in /opt/perl/bin/5.8.0 and /opt/perl/man/5.8.0/man1 in order to mimic the structure of the lib directory that this version of Perl builds. This is not standard practice. It does, however, make our swapping code much easier to create.

Once configured, complete the installation with

make test install
Determine Locations
We now need to get the location of the 5.8.0 Perl binary, modules and manpages.

The location of perl is easy since we specified it: /opt/perl/ bin/5.8.0. Make sure that PERL5LIB is unset and execute /opt/perl/ bin/5.8.0/perl -V. Again, we are only interested in the tail; see Example 5.

Now, unlike our 5.6.1 installation, we can proceed without setting PERL5LIB and allow modules to be installed right into /opt/perl/lib/site_perl. After all, we built this version and, therefore, have no default installation to preserve.

Create the set and unset Functions

We will create a function named set_perl_5.8.0. It will perform three functions:

1.	Set PATH so that the 5.8.0 version of Perl is on the path.

2.	Set PERL5LIB so that any extra libraries are found.

3.	Set MANPATH so that the Perl manpages are located.

Here is the code:

set_perl_5.8.0()
{
  export PERL_CURRENT_VERSION=5.8.0
  addpath -f PATH /opt/perl/bin/5.8.0
  addpath -f MANPATH /opt/perl/man/5.8.0
}
The corresponding unset function is:
unset_perl_5.8.0()
{
  delpath -f MANPATH /opt/perl/man/5.8.0
  delpath -f PATH /opt/perl/bin/5.8.0
  unset PERL_CURRENT_VERSION
}
Add these two functions to perl.sh and we're almost finished.

Create the swap_perl Function
The last function to consider is the one that actually does the swapping. You could always code something like

unset_perl_${PERL_CURRENT_VERSION}
swap_perl_5.8.0
before all calls to Perl, but that gets tedious after a while and is highly error prone. Listing 3 shows the function swap_perl with commentary. In order to use the function, simply call it before executing any Perl script:

swap_perl 5.8.0
perl foobar.pl
If you keep project-specific library locations, you can add them via arguments to swap_perl:

swap_perl 5.8.0 /opt/myCompany/yadayadayada

The last lines in perl.sh should set the default Perl environment. Example 6 shows the specifics of our installation.

Perl Version Selection and the Shebang Line
Perl scripts are usually executed by setting their protection mode to executable (+x in the *NIX and Linux worlds) and invoking the script directly. By placing a shebang line at the top of the script, the shell will invoke the specified program in order to process the script. The usual shebang line is something like:

#!/usr/local/bin/perl

The problem with this is that it totally defeats the mechanism of putting the desired Perl executable in the PATH. One way around this is to modify the shebang line:

#!/usr/bin/env perl

From the manpage header:

env - run a program in a modified environment 
In this usage, we do not modify the environment with the assignment of any variables; we simply use env's PATH-searching capabilities to find the version of Perl we desire.

Shell Game
In order to swap versions of Perl on a case-by-case basis, you have to invoke swap_perl before any call to Perl. For at jobs, you must either call swap_perl in the job definition or in your own environment before the at job is created. For cron jobs or commercial job schedulers such as AutoSys, you may have to wrap the command in a shell that calls swap_perl before invoking the Perl script.

Never Look Back
One of the potential disadvantages of having multiple versions of Perl is the need to install new modules in both places. I avoid that problem with the following policy: Once a new version of Perl has been tested enough to go into production, it is placed there with the latest version of all modules that have been installed with the last version. Any new module installations are performed on the new version only. If a developer wants/needs a new module or a module upgrade, he must migrate to the latest Perl version in order to access the module. An exception to this policy can be made for a show-stopping production bug. However, the developer will be highly encouraged to migrate immediately.

You should suggest that your developers put a swap_perl statement in their profiles (.bash_profile in bash) so that they are always working in the latest version.

Perl Versions Prior to 5.6.0
The directory layout of Perl has evolved over the years. If any of the versions of Perl that you are dealing with are earlier than 5.6.0, you may have to do some more experimentation in setting PERL5LIB in order to have @INC properly set. This may, in turn, require you to put version-specific code in the add_perl5lib function. Add_perl5lib can be useful in its own right—I use add_perl5lib and del_perl5lib at the command line to temporarily choose between multiple versions of a module that I have installed in separate local trees in order to test the effect of upgrading a modules.

Conclusion
Here is a summary of the steps needed to maintain multiple versions of Perl:

1.	Determine the default locations of the Perl binary, modules, and manpages.

2.	Create set and unset functions for this version of Perl. Place them in perl.sh.

3.	Install new versions of Perl, taking care to isolate them in highly version-numbered directory structures.

4.	Determine the locations of the Perl binary, modules, and manpages for the new version.

5.	Create set and unset functions for this version of Perl. Place them in perl.sh.

6.	Add swap_perl to perl.sh. Add a command to swap in the default version at the bottom of perl.sh. Place perl.sh in /etc/profile.d.

7.	Call swap_perl in your process before executing Perl scripts.

8.	Change the shebang line of Perl scripts to use the env command, which will search the PATH for the desired version of Perl.

TPJ

Listing 1

</entry>
<entry [Sun 2014:04:13 22:53:24 EST] CREATE Openstack::Nova, Queue::Manager AND Sample::Tracker>

Openstack::Nova

- GET LIST OF IPs, FILTER BY SERVER NAME


Queue::Manager

- FOR EACH SERVER
	
	GET CURRENT WORKFLOW STATE (COMPLETED, EXITED)
	
	SHUTDOWN CURRENT WORKFLOW
	
	START NEW WORKFLOW
	
- IMPLEMENTATION:
	
	NOW	- USE SSH TO PARSE LOGS AND PERFORM SSH COMMANDS
	
	LATER - USE QUEUES:
	
		WORKERS REPORT STATUS TO MANAGER
	
		MANAGER DIRECT WORKERS TO:
		
			- DEPLOY APPS
			
			- PROVIDE WORKFLOW STATUS
			
			- STOP/START WORKFLOWS


Sample::Tracker

- TRACK SAMPLES

	- KNOWS ORDER OF SAMPLE STATES AND DATETIME TRANSITIONED
	
	- FILLS IN WITH NEXT DATETIME IF STATES ARE SKIPPED
	
	- FLAGS SAMPLE AS ERROR:STATE IF DURATION EXCEEDS MAX FOR STATE
	
		- MAX DURATION TIME FOR EACH STATE IS DETERMINED BEFOREHAND
		
			- LATER: UPDATE MAX DURATION BASED ON CURRENT DURATION DATA

				USE STANDARD DEVIATION, SIZE OF INPUT FILES, ETC.
			
	- RESTARTS FAILED STATE	
		
	

Synapse

INTERACT WITH SYNAPSE:

-	CLEAR ERROR STATES

	clearError
	
	setState

		source	aligned:error
		
		target
	
-	GET MORE bamFilesForWork

	getwork() {
		source /agua/apps/bioapps/bin/pancancer/envars.sh
		/agua/apps/bioapps/bin/pancancer/synapseICGCMonitor getBamForWork ucsc_biofarm --count=50;
	}

-	VIEW ASSIGNMENTS
	
	assign() {
		source /agua/apps/bioapps/bin/pancancer/envars.sh
		/agua/apps/bioapps/bin/pancancer/synapseICGCMonitor	getAssignments ucsc_biofarm;
	}
	

	
</entry>
<entry [Sun 2014:04:13 22:47:46 EST] USE MooX::Declare TO SPEED UP Agua::Cli>

MooX::Declare IN PACKAGED PERL AT /agua/apps/perl

TEST MooX::Declare LOAD TIME VERSUS MooseX::Declare


	
</entry>
<entry [Sun 2014:03:09 15:17:51 EST] BLUEPRINT: USE 'VERSION RANGES' FROM CPAN META SPECIFICATION>

http://search.cpan.org/~dagolden/CPAN-Meta-2.140640/lib/CPAN/Meta/Spec.pm#Version_Ranges

At least version 2.4 must be present:

2.4

Any version is okay:

0

Version 2.0 or earlier is required:

< 2.0

Version that must be at least 1.2, less than 2.0, and not equal to 1.5:

>= 1.2, != 1.5, < 2.0 


	
</entry>
<entry [Sun 2013:10:27 04:29:44 EST] BLUEPRINT: AMD FORMAT HTML TEST TO INCLUDE VARIABLES>

1. AMD FORMAT PASSES DndSource

2. USE parser.parse() TO INSTANTIATE SUBWIDGETS


require([
	"dojo/_base/declare",
	"dijit/registry",
	"dojo/dom",
	"dojo/parser",
	"doh/runner",
	"t/doh/util",
	"t/doh/Agua",
	"plugins/apps/ParameterRow",
	"plugins/form/DndSource",
	"dojo/ready",
	"dojo/domReady!",
	"dojo/dnd/Source"
],

function (declare, registry, dom, parser, doh, util, Agua, ParameterRow, DndSource, ready) {

window.Agua = Agua;
console.dir({Agua:Agua});

////}}}}}

doh.register("plugins.apps.ParameterRow", [

////}}}}}

{

////}}}}}

	name: "new",
	setUp: function(){
		// ENSURE attachPoint __WIDGET__ IS INSTANTIATED
		parser.parse();
		
		//Agua.data = new Object;
		//Agua.data.parameters = util.fetchJson("./parameters.json");
	},
	runTest : function(){
		console.log("# new");
		
		var dndSource = new DndSource({});

		var node 	=	dom.byId("attachPoint");
		console.log("new    node: " + node);
		console.dir({node:node});

		dndSource.initialiseDragSource(node);
		dndSource.rowClass 	=	"plugins.apps.ParameterRow";		
		dndSource.formInputs = {
		// FORM INPUTS AND TYPES (word|phrase)
			locked: "",
			name: "word",
			argument: "word",
			valuetype: "word",
			category: "word",
			value: "word",
			ordinal: "word",
			discretion: "word",
			description: "phrase",
			paramtype: "paramtype",
			format: "word",
			args: "word",
			inputParams: "phrase",
			paramFunction: "phrase"
		};
		console.log("new    dndSource:");
		console.dir({dndSource:dndSource});

		var itemArray = util.fetchJson("./sleep.json");
		console.log("new    itemArray:");
		console.dir({itemArray:itemArray});

		dndSource.loadDragItems(itemArray);
	

		console.log("new    instantiated");
		//doh.assertTrue(true);
	},
	tearDown: function () {}
}


]);

	//Execute D.O.H. in this remote file.
	doh.run();
});




</entry>
<entry [Tue 2013:10:22 17:47:59 EST] BLUEPRINT: TEST ENVIRONMENT VARIABLES>

ENVIRONMENT VARIABLES REQUIRED FOR ALL TESTS:

installdir      The location of the Agua installation dir, e.g., export installdir=/agua


ENVIRONMENT VARIABLES REQUIRED FOR SOME TESTS:

login           GitHub login ID
token           40-character GitHub token, e.g., 1234567890abcdef1234561234567890abcdef12
keyfile         Location of AWS X.509 private key file for SSH access to instances



RUN TESTS PROCEDURE
-------------------

1. SET ENVIRONMENT VARIABLES

source /home/syoung/notes/agua/private/conf/.repos/github/syoung/envars

    #!/bin/sh
    
    export installdir=/aguadev
    export keyfile=/aguadev/conf/.repos/github/syoung/id_rsa
    export login=syoung
    export token=81a0635a3738ee7e399114d34ede7833ba3fd3a6

    
2. RUN unit TESTS

cd /aguadev/t
make unit

    
    
</entry>
<entry [Tue 2013:10:22 17:01:30 EST] BLUEPRINT: TEST CATEGORIES - unit, integration AND acceptance>

Unit            Regression tests, 'small' a la Google
Integration     Two or more components, cloud (AWS), remote repo (GitHub)
Acceptance      Feature tests, UI or command line, e.g., usage tests




NB: GOOGLE SEPARATES TESTS INTO 3 CATEGORIES:

SMALL   Unit tests
MEDIUM  Integration tests - Network, database, filesystem, sleep, system properties tests
LARGE   Integration tests & Acceptance tests


Feature	                Small	Medium	        Large
Network access	        No	    localhost only	Yes
Database	            No	    Yes	            Yes
File system access	    No	    Yes	            Yes
Use external systems	No	    Discouraged	    Yes
Multiple threads	    No	    Yes	            Yes
Sleep statements	    No	    Yes	            Yes
System properties	    No	    Yes	            Yes
Time limit (seconds)	60	    300	            900+





http://googletesting.blogspot.com/2010/12/test-sizes.html

y Simon Stewart

What do you call a test that tests your application through its UI? An end-to-end test? A functional test? A system test? A selenium test? I’ve heard all them, and more. I reckon you have too. Tests running against less of the stack? The same equally frustrating inconsistency. Just what, exactly, is an integration test? A unit test? How do we name these things?

Gah!
y Simon Stewart

What do you call a test that tests your application through its UI? An end-to-end test? A functional test? A system test? A selenium test? I’ve heard all them, and more. I reckon you have too. Tests running against less of the stack? The same equally frustrating inconsistency. Just what, exactly, is an integration test? A unit test? How do we name these things?

Gah!

It can be hard to persuade your own team to settle on a shared understanding of what each name actually means. The challenge increases when you encounter people from another team or project who are using different terms than you. More (less?) amusingly, you and that other team may be using the same term for different test types.  “Oh! That kind of integration test?” Two teams separated by a common jargon.

Double gah!

The problem with naming test types is that the names tend to rely on a shared understanding of what a particular phrase means. That leaves plenty of room for fuzzy definitions and confusion. There has to be a better way. Personally, I like what we do here at Google and I thought I’d share that with you.

Googlers like to make decisions based on data, rather than just relying on gut instinct or something that can’t be measured and assessed. Over time we’ve come to agree on a set of data-driven naming conventions for our tests. We call them “Small”, “Medium” and “Large” tests. They differ like so:

Feature	                Small	Medium	        Large
Network access	        No	    localhost only	Yes
Database	            No	    Yes	            Yes
File system access	    No	    Yes	            Yes
Use external systems	No	    Discouraged	    Yes
Multiple threads	    No	    Yes	            Yes
Sleep statements	    No	    Yes	            Yes
System properties	    No	    Yes	            Yes
Time limit (seconds)	60	    300	            900+

Going into the pros and cons of each type of test is a whole other blog entry, but it should be obvious that each type of test fulfills a specific role. It should also be obvious that this doesn’t cover every possible type of test that might be run, but it certainly covers most of the major types that a project will run.

A Small test equates neatly to a unit test, a Large test to an end-to-end or system test and a Medium test to tests that ensure that two tiers in an application can communicate properly (often called an integration test).

The major advantage that these test definitions have is that it’s possible to get the tests to police these limits. For example, in Java it’s easy to install a security manager for use with a test suite (perhaps using @BeforeClass) that is configured for a particular test size and disallows certain activities. Because we use a simple Java annotation to indicate the size of the test (with no annotation meaning it’s a Small test as that’s the common case), it’s a breeze to collect all the tests of a particular size into a test suite. 

We place other constraints, which are harder to define, around the tests. These include a requirement that tests can be run in any order (they frequently are!) which in turn means that tests need high isolation --- you can’t rely on some other test leaving data behind. That’s sometimes inconvenient, but it makes it significantly easier to run our tests in parallel. The end result: we can build test suites easily, and run them consistently and as as fast as possible.

Not “gah!” at all.
It can be hard to persuade your own team to settle on a shared understanding of what each name actually means. The challenge increases when you encounter people from another team or project who are using different terms than you. More (less?) amusingly, you and that other team may be using the same term for different test types.  “Oh! That kind of integration test?” Two teams separated by a common jargon.

Double gah!

The problem with naming test types is that the names tend to rely on a shared understanding of what a particular phrase means. That leaves plenty of room for fuzzy definitions and confusion. There has to be a better way. Personally, I like what we do here at Google and I thought I’d share that with you.

Googlers like to make decisions based on data, rather than just relying on gut instinct or something that can’t be measured and assessed. Over time we’ve come to agree on a set of data-driven naming conventions for our tests. We call them “Small”, “Medium” and “Large” tests. They differ like so:
Feature	Small	Medium	Large
Network access	No	localhost only	Yes
Database	No	Yes	Yes
File system access	No	Yes	Yes
Use external systems	No	Discouraged	Yes
Multiple threads	No	Yes	Yes
Sleep statements	No	Yes	Yes
System properties	No	Yes	Yes
Time limit (seconds)	60	300	900+

Going into the pros and cons of each type of test is a whole other blog entry, but it should be obvious that each type of test fulfills a specific role. It should also be obvious that this doesn’t cover every possible type of test that might be run, but it certainly covers most of the major types that a project will run.

A Small test equates neatly to a unit test, a Large test to an end-to-end or system test and a Medium test to tests that ensure that two tiers in an application can communicate properly (often called an integration test).

The major advantage that these test definitions have is that it’s possible to get the tests to police these limits. For example, in Java it’s easy to install a security manager for use with a test suite (perhaps using @BeforeClass) that is configured for a particular test size and disallows certain activities. Because we use a simple Java annotation to indicate the size of the test (with no annotation meaning it’s a Small test as that’s the common case), it’s a breeze to collect all the tests of a particular size into a test suite. 

We place other constraints, which are harder to define, around the tests. These include a requirement that tests can be run in any order (they frequently are!) which in turn means that tests need high isolation --- you can’t rely on some other test leaving data behind. That’s sometimes inconvenient, but it makes it significantly easier to run our tests in parallel. The end result: we can build test suites easily, and run them consistently and as as fast as possible.

Not “gah!” at all.

    
</entry>
<entry [Sun 2013:03:17 00:57:56 EST] BLUEPRINT: SET GROUP OR APP PRIVACY>

http://dojofoundation.org/packages/dgrid/tutorials/transferbox/


1. SET GROUP PRIVACY

    -   USE CAN SET GROUP PRIVACY AS 'PUBLIC' OR 'PRIVATE'
 
    -   JSON FILES OF PROJECTS IN NEWLY PUBLIC GROUPS ARE MOVED TO THE USER'S biorepo
            
            IMPLEMENTATION WITH TRANSFERBOX
            http://dojofoundation.org/packages/dgrid/tutorials/transferbox/
    
    -   JSON FILES OF PROJECTS IN NEWLY PRIVATE GROUPS ARE MOVED TO THE USER'S private REPO
    
    -   IMMEDIATE SYNC WITH HUB
    


2. SET APP PRIVACY

AS ABOVE, EXCEPT REPLACE:

'GROUP' WITH 'APP'

'PROJECT' WITH 'THE APP'S *.pm AND OTHER FILES'


    
</entry>
<entry [Thu 2013:02:28 15:24:49 EST] GIT COMMIT MESSAGE FORMAT - UPDATED AND PUT IN ILLUMINA CONFLUENCE>

https://ukch-confluence.illumina.com/display/servicesSD/Git+Commit+Messages

Git Commit Messages

Added by Young, Stuart, last edited by Young, Stuart on Feb 28, 2013  (view change) Go to start of metadata

A standardized git message format enables automated 'change list' generation and can help reduce the 'switching time' for developers changing from one task to another. This can be useful for large projects, projects lasting longer than a few weeks, and even projects with only one developer. The following schema is meant to be flexible while providing 'tramlines' to guide developers to share a common vocabulary and approach to writing git commit messages.

A git commit message consists of a summary line and an optional detailed description. To avoid errors with 'git rebase' message parsing, there should be a blank line between the summary and details. In this way, the first line can be treated as the subject of an email and the rest of the text as the body.

The Summary
[+/-][Keyword]: [Summary] (generally less than 50 characters)
+ or - symbol indicating whether it should be included in a release 'change list'

Keyword is chosen to indicate the type of commit:

Keyword
Description
Fix 	bug fix, include Bug ID if available
Add	
Add new feature or file
Del	
Remove new feature or file
Onw	Currently working on a change, e.g., Fix is not complete
NB: You can add other keywords but the total number should be limited for ease of memorization.

Use the present tense to match up with commit messages generated by commands like git merge and git revert.

e.g.,  "Fix bug" and not "Fixed bug"
Examples

+Fix lib/Config.pm: Fix file input no error when input file is missing 
-Fix lib/Config.pm: Fix file input warning when file is empty
The Details

More detailed explanatory text, e.g., technical details that cannot be expressed in the summary.
Bullet points: hyphen preceded by a single space, no blank line in between

Paragraph headings
Change Description
Code Reviewed by
Unit Tested
Target Release Label
Examples

-Fix: html/progress/progress.html: Fix progress.html dimensions
 
Squashed progress pane squashed.
Progress pane height and width:
- home.css: .home .dijitContentPaneError
- Added image for load error
-Fix: html/progress/js/Home.js 
 
Bug #2345. Progress pane load error message.
- Home.js: Added override of FloatingPane onDownloadError
Notes
The following are examples of Git parsing the summary line (and often truncating messages that are too long):

git log --pretty=oneline shows a terse history mapping containing the commit id and the summary
git rebase --interactive provides the summary for each commit in the editor it invokes
git add --interactive  interactively adding a file or directory
git shortlog uses summary lines in the changelog-like output it produces
git format-patch, git send-email, and related tools use it as the subject for emails
reflogs, a local history accessible with git reflog intended to help you recover from stupid mistakes, get a copy of the summary
gitk has a column for the summary
GitHub uses the summary in various places in the user interface

NB: Set config option 'merge.summary' to merge the summaries from all merged commits into the merge commit message
    
</entry>
<entry [Thu 2013:02:28 13:16:32 EST] SEMANTIC VERSIONING - UPDATED AND PUT IN ILLUMINA CONFLUENCE>

https://ukch-confluence.illumina.com/display/servicesSD/Semantic+Versioning

Semantic Versioning

Added by Young, Stuart, last edited by Young, Stuart on Feb 28, 2013  (view change) Go to start of metadata

Semantic versioning (http://semver.org/) is a simple set of rules and requirements that give a clear indication to developer users about the kinds of changes a new version. These changes are categorised as 1) non-backwards-compatible changes or new features, 2) backwards-compatible changes or new features, and 3) bug fixes. This is important for identifying changes that affect other packages which interface with the software based on its public API. The public API should be a clear and precise description of the inputs and outputs for the various publicly accessible methods of the software package.

The version format is X.Y.Z (Major.Minor.Patch), e.g., 1.8.2, and communicate changes to the API. Going from low to high in the version number, the patch number is incremented for bug fixes that do not affecting the API. The minor version number is incremented for backwards compatible API additions or changes. The major number is incremented for backwards incompatible API changes.

Here is a quick summary of the main points of semantic versioning:

1. Software using Semantic Versioning MUST declare a public API. This API could be declared in the code itself or exist strictly in documentation.

2. A normal version number MUST take the form X.Y.Z where

X is the major version - backwards incompatible changes are introduced to the public API
Y is the minor version - new, backwards compatible functionality and bug fixes
Z is the patch version - backwards compatible bug fixes

Increase by increments of one. For instance: 1.9.0 -> 1.10.0 -> 1.11.0.

3. When a major version number is incremented, the minor version and patch version MUST be reset to zero. When a minor version number is incremented, the patch version MUST be reset to zero.

For instance: 1.1.3 -> 2.0.0 and 2.1.7 -> 2.2.0.

4. Major version zero (0.y.z) is for initial development. Anything may change at any time. The public API should not be considered stable.

5. Version 1.0.0 defines the public API. The way in which the version number is incremented after this release is dependent on this public API and how it changes.

6. Pre-release version has a lower precedence than the associated normal version.

Examples: 1.0.0-alpha < 1.0.0-alpha.1 < 1.0.0

7. Build version has a higher precedence than the associated normal version

Examples: 1.0.0 < 1.0.0+build.1, 1.3.7+build.11.e0f985a.

8. Precedence is calculated as follows

build > major > minor > patch > pre-release

Numeric identifiers always have lower precedence than non-numeric identifiers:

Example: 1.0.0-alpha < 1.0.0-alpha.1 < 1.0.0-beta.2 < 1.0.0-beta.11 < 1.0.0-rc.1 < 1.0.0-rc.1+build.1 < 1.0.0 < 1.0.0+0.3.7 < 1.3.7+build < 1.3.7+build.2.b8f12d7 < 1.3.7+build.11.e0f985a.

    
</entry>
<entry [Tue 2013:01:29 23:44:31 EST] BLUEPRINT: SOURCES ARE TIED TO SNAPSHOTS TO ALLOW THEIR USE IN WORKFLOWS>


SCENARIO 1
----------

USER COPIES agua SHARED WORKFLOW THAT USES agua SOURCE DATA

1. USER COPIES WORKFLOW FROM 'Shared Workflows' IN THE WORKFLOW PANE

2. THE COPIED WORKFLOW HAS INPUTS THAT ARE IN SHARED SOURCES, e.g, /data/sequence/reference

3. THE SOURCES SHOULD HAVE THE CORRECT LOCATION, EVEN IF THE SOURCE VOLUME MOUNTPOINT DIFFERS


SOLUTION

1. TO IDENTIFY THE INPUTS, THE SOURCE INFORMATION INCLUDES:

    -   SOURCE OWNER    |
                        |---> TO DISAMBIGUATE SOURCE
    -   SOURCE NAME     |
    
    -   SOURCE SNAPSHOT ID   ***ADD THIS***
    
    -   RELATIVE LOCATION OF INPUTFILE/DIR IN SOURCE 


2. TO POPULATE AGUA SOURCES, CREATE SOURCE FILES IN biorepository/agua/bioapps/sources

    -   FILE CONTAINS ALL FIELDS OF SOURCE TABLE
    
    
3. ON INSTALL bioapps, LOAD SOURCES FROM FILE

    -   CHECK /data VOLUME IS LOADED, IF NOT LOAD IT
    
    -   USE /data VOLUME MOUNTPOINT TO SET LOCATIONS OF SOURCES 
    

SCENARIO 2
----------

ADMIN USER WANTS TO SAVE SOURCES TO GITHUB

1. CREATE VOLUME

2. POPULATE WITH SOURCE DATA

3. MAKE SNAPSHOT

4. SYNC SOURCES



    
</entry>
<entry [Fri 2013:01:04 04:34:25 EST] BLUEPRINT: UPDATING apps AND workflows IN agua BIOREPOSITORY>


1. ADMIN USER (syoung GITHUB LOGIN) CREATES APPS IN App PANE


2. CLICK 'SYNC' BUTTON IN Apps PANE:

    -   WRITE apps (AND workflows) TO BIOREPODEV

    -   SYNC TO GITHUB

    
3. INCREMENT VERSION ON syoung:biorepodev, DO STAGE 1-2. REPEAT UNTIL READY


4. IF CODE IS READY FOR DEV RELEASE, DO STAGE 3-4

NOTE: agua WORKFLOW FILES NOT PRESENT IN admin USER WILL REMAIN UNAFFECTED

ADMIN       AGUA        --->    AGUA
-----       -----               ----
A           A'                  A
            B'                  B'
C           C'                  C
            D'                  D'


    
</entry>
<entry [Thu 2013:01:03 21:19:05 EST] BLUEPRINT: bioapps SPECIFIED IN default.conf, apps BY ADMIN USER>


1. USE default.conf FILE TO STORE bioapps NAME

APPSPACKAGE bioapps


2. DISPLAYED BY Apps.js AS 'Bioapps' PACKAGE APPS



3. ADMIN USER CREATES AND ADMINISTERS PACKAGE/APPS IN Apps PANE

    -   ONE OR MORE PACKAGES SHARED BY THE ADMIN USER


4. EACH PACKAGE IS DISPLAYED IN ITS OWN SharedApps.js OBJECT


</entry>
<entry [Sat 2012:12:01 13:15:36 EST] BLUEPRINT: REVISITED default.conf AND PACKAGE *.conf FILES>

REQUIREMENTS:

    1. DISAMBIGUATE BETWEEN DIFFERENT INSTALLED VERSIONS OF THE SAME PACKAGE
    
    2. PROVIDE THE MOUNT POINT OF THE DATA/APPLICATIONS VOLUME IF EXISTS

    3. ADD TO default.conf AS SECTION [package   PACKAGENAME:VERSION]
    
    E.G.:
    
        [package    bioapps:0.8.0]
        AUTHOR                  syoung
        DATAVOLUME              aquarius-8
        INSTALLDIR              /agua/apps/bioapps
        VERSION                 0.8.0

    4. ALSO LOADED INTO package TABLE
    
    5. LOAD APPLICATION'S CONFIG INTO default.conf
    
    E.G.:
    
       [aquarius-8  applications]
        BINARYDATA              /data/bioapps/binary
        BOWTIE                  /data/apps/bowtie/0.12.2
        BOWTIESOURCE            /data/apps/bowtie/0.12.7-src
        CASAVA                  /data/apps/casava/1.6.0/bin
        CROSSMATCH              /data/apps/crossmatch/0.990329/cross_match
        CUFFLINKS               /data/apps/cufflinks/0.8.2
        DELTAFILTER             /data/apps/mummer/delta-filter
        EC2                     /usr/bin
        ERANGE                  /data/pipeline/erange2
        GATK                    /data/apps/gatk/1.0.4705
        IAM                     /usr/share/iam/1.2.0/bin
        JBROWSE                 /data/apps/jbrowse/100511/bin
        MAQ                     /data/apps/maq/0.7.1
        MIRA                    /data/apps/mira/bin/mira
        NOVOALIGN               /data/apps/novoalign/2.05.33
        NUCMER                  /data/apps/mummer/nucmer
        PYTHON                  /data/apps/python/2.6.1/bin/python
        REPMASK                 /data/apps/erange2/data/repMask/rmask.db
        RUNMAPPING              /data/apps/454/2.0.00.20-64/bin/runMapping
        SAMTOOLS                /data/apps/samtools/0.1.6
        SHOWCOORDS              /data/apps/mummer/show-coords
        SQUASH                  /data/apps/GAPipeline/1.5.1/bin/squashGenome
        TANDEMREPEATSFINDER     /data/apps/tandemrepeats/4.04/trf
        TOPHAT                  /data/apps/tophat/1.0.12/bin
        VCAKE                   /data/apps/vcake/VCAKE_1.0.pl
        VELVET                  /data/apps/velvet/velvet
        
        [aquarius-8 data]
        BIOAPPS                 /data/apps/bioapps
        HUMAN                   /data/sequence/reference/human
        HUMANLATESTBUILD        hg19
        JBROWSEDATA             /data/jbrowse/species
        MOUSE                   /data/sequence/reference/mouse
        MOUSELATESTBUILD        mm9
        RAT                     /data/sequence/reference/rat
        RATLATESTBUILD          rn4
        SAMTOOLSHUMAN           /data/sequence/reference/human/hg19/samtools
        SAMTOOLSMOUSE           /data/sequence/reference/mouse/mm9/samtools
        SAMTOOLSRAT             /data/sequence/reference/rat/rn4/samtools

 
    
    
    
</entry>
<entry [Thu 2012:11:29 07:31:54 EST] COMPLETED STAGE 1 MIGRATION OF Agua::Common::SGE>

**** STAGE 1 COMPLETED ****

SEE [Thu 2012:11:29 22:29:16 EST] POST-REFACTOR ROLE Agua::Common::SGE UML USAGE REPORT


RATIONALE
---------

MANY COMMANDS IN Agua::Common::SGE OUTSOURCED TO ops() ALREADY

USING master->ops AND head->ops AVOIDS NEED TO SPECIFY head|master

E.G, COMMANDS LIKE sgebinCommand WILL NOT NEED AN ARGUMENT TO DETERMINE WHETHER TO USE $self->head()->ops() OR $self->master()->ops()

STAGES
------

#### DONE ####
STAGE 1 - RESTRICT USAGE OF Agua::Common::SGE SOLELY TO Agua::Workflow

-   MOVE USAGE BY Agua::StarCluster TO Agua::Workflow

-   MOVE COMMONLY-USED getEnvars FROM Agua::Common::SGE TO Agua::Common::Util


STAGE 2 -   SHIFT Agua::Common::SGE INTO Agua::Ops::Sge

-   Agua::Workflow RETAINS METHODS WHICH USE BOTH self->head() AND self->master

-   SHIFT REMAINING METHODS FROM Agua::Common::SGE TO Agua::Ops::Sge


    
</entry>
<entry [Thu 2012:10:25 23:03:20 EST] BLUEPRINT: VERSION TAGS>

SUMMARY:
    FIRST, COMMIT WITH VERSION MESSAGE    
    SECOND, ADD TAG
    
TESTED:

1. CREATE NEW GIT REPO
cd /tmp
mkdir temp
cd temp
git init
    Initialized empty Git repository in /tmp/temp/.git/

2. ADD FILE, COMMIT AND THEN ADD TAG

touch test
gitadd
git commit -a -m "First commit"
    [master (root-commit) 1c8cdd1] First commit
     0 files changed
     create mode 100644 test
git tag -a "0.0.1"
gitlog
    * 1c8cdd1 (HEAD, tag: 0.0.1, master) First commit
git tag
    0.0.1

3. REPEAT 2

touch test2
gitadd
git commit -a "[0.0.2] Second commit"
    fatal: Paths with -a does not make sense.
git commit -a -m "[0.0.2] Second commit"
    [master 61ec949] [0.0.2] Second commit
     0 files changed
     create mode 100644 test2
gitlog
    * 61ec949 (HEAD, master) [0.0.2] Second commit
    * 1c8cdd1 (tag: 0.0.1) First commit
git tag -a "Second tag"
    fatal: 'Second tag' is not a valid tag name.
git tag -a "0.0.2"
gitlog
    * 61ec949 (HEAD, tag: 0.0.2, master) [0.0.2] Second commit
    * 1c8cdd1 (tag: 0.0.1) First commit

4. REPEAT 2

touch test3
gitadd
git commit -a -m "Third commit"
    [master a3941db] Third commit
     0 files changed
     create mode 100644 test3
gitlog
    * a3941db (HEAD, master) Third commit
    * 61ec949 (tag: 0.0.2) [0.0.2] Second commit
    * 1c8cdd1 (tag: 0.0.1) First commit

5. RESET TO PREVIOUS TAG TO CHECK MESSAGE IS OK

git reset 0.0.1
gitlog
    * 1c8cdd1 (HEAD, tag: 0.0.1, master) First commit
git reset 0.0.2
gitlog
    * 61ec949 (HEAD, tag: 0.0.2, master) [0.0.2] Second commit
    * 1c8cdd1 (tag: 0.0.1) First commit
git reset HEAD
gitlog
    * 61ec949 (HEAD, tag: 0.0.2, master) [0.0.2] Second commit
    * 1c8cdd1 (tag: 0.0.1) First commit
git reset a3941db
gitlog
    * a3941db (HEAD, master) Third commit
    * 61ec949 (tag: 0.0.2) [0.0.2] Second commit
    * 1c8cdd1 (tag: 0.0.1) First commit

5. ADD FINAL TAG

git tag -a 0.0.3
gitlog
    * a3941db (HEAD, tag: 0.0.3, master) Third commit
    * 61ec949 (tag: 0.0.2) [0.0.2] Second commit
    * 1c8cdd1 (tag: 0.0.1) First commit

    
    OK!
    
    
</entry>
<entry [Thu 2012:10:25 04:05:00 EST] BLUEPRINT: UML GENERATOR FOR Moose ROLES>
    
APPLICATION     uml

PURPOSE

	1. GENERATE TABLES OF ROLE-BASED METHOD INHERITANCE
	
		HIERARCHIES THAT CAN BE USED TO CREATE UML DIAGRAMS
	
NOTES

		1. ASSUMES MOOSE CLASS SYNTAX A LA 'MooseX::Declare'
		
		2. ROLE USAGE AND INHERITANCE LISTS CAN BE ON SEPARATE
		
			LINES OR JOINED TOGETHER, E.G.,
						
			class Agua::StarCluster with (Agua::Common::Aws,
				Agua::Common::Base,
				Agua::Common::Balancer,
				Agua::Common::Cluster,
				Agua::Common::SGE,
            
            AND
                
			class Agua::StarCluster with (Agua::Common::Aws, Agua::Common::Base, Agua::Common::Balancer, Agua::Common::Cluster, ...

				
		3. FOLLOW CALLS TO A ROLE THROUGH ALL OTHER ROLES USED BY THE CLASS:
		
            class A USES role B
            
            role B CALLS role C
            
            --> class A CALLS role C
		
USAGE

./uml.pl               \
 < --mode String>       \
 [--sourcefile String] \
 [--targetfile String] \
 [--sourcedir String]  \
 [--targetdir String]  \
 [--outputfile String] \
 [--help]

 --mode          :   Defines the scope of the UML hierarachy:
	roleUser     : specified user (targetfile) of the Role (sourcefile)
	roleUsers    : all users of a Role (sourcefile)
	allRoleUsers : all users in the targetdir of all Roles in sourcedir
	userRoles    : specified user (targetfile) of all Roles in sourcedir
 --sourcefile : File containing a single Role
 --targetfile : File containing a single Role-using Class
 --sourcedir  : Directory containing one or more sourcefiles
                (all files in subdirs will also be included)
 --targetdir  : Directory containing one or more targetfiles
                (all files in subdirs will also be included)
 --urlprefix     :   Prefix to URL
 --help          :   Print help info


EXAMPLES

ONE ROLE, ONE USER:
 ./uml.pl \
 --sourcefile /agua/lib/Agua/Common/Cluster.pm \
 --targetfile /agua/lib/Agua \
 --outputfile /agua/log/one-to-one-uml.tsv \
 --mode roleUser

ONE ROLE, MANY USERS:
 ./uml.pl \
 --sourcefile /agua/lib/Agua/Common/Cluster.pm \
 --targetdir /agua/lib/Agua \
 --outputfile /agua/log/one-to-many-uml.tsv \
 --mode roleUsers

MANY ROLES, ONE USER:
 ./uml.pl \
 --sourcedir /agua/lib/Agua \
 --targetfile /agua/lib/Agua/Workflow.pm \
 --outputfile /agua/log/many-to-one-uml.tsv \
 --mode allRoleUsers

MANY ROLES, MANY USERS:
 ./uml.pl \
 --sourcedir /agua/lib/Agua \
 --targetdir /agua/lib/Agua \
 --outputfile /agua/log/many-to-many-uml.tsv \
 --mode userRoles

    
</entry>
<entry [Thu 2012:10:25 02:42:55 EST] BLUEPRINT: /agua/conf DIRECTORY CONTENTS>


conf/curl.*     GITHUB OAUTH TOKEN FILE FOR TESTING
conf/envars.*   ENVIRONMENT VARIABLES FOR TESTING

conf/.ec2/admin CREATED BY init.pl, CONTAINS private AND public KEYS
conf/.github
conf/.https     CA CERTIFICATE CREATED BY init.pl FOR HTTPS


/nethome/USERNAME/.starcluster

                CONTAINS id_rsa-USERNAME-key FILE

    
nethome/USERNAME/.starcluster/plugins

                CONTAINS STARCLUSTER PLUGIN FILES:
                        automount
                        sge.py
                        startup.py
    
    
</entry>
<entry [Mon 2012:10:15 01:39:09 EST] BLUEPRINT: HOW TO FIX ERRORS IN PROBLEMS STAGES>

SUPPOSE STAGES 1 AND 2 WORK FINE BUT STAGE 3 HAS A PROBLEM:

1. EXTRANEOUS FILES PRESENT IN STAGE 3 - MANUALLY REMOVE

    E.G., REMOVE syoung DIR FROM STAGE 3:

    USE git rm -r THEN COMMIT WITH A NEW BUILD, E.G., 0.8.0-alpha.1+build.7

    RESTAGE 2-3 WITH 'BUMPED' BUILD, E.G., 0.8.0-alpha.1+build.8

    
2. NON-MANUAL STAGING PROBLEMS, I.E., PROBLEMS IN stager.pm THAT
    
    CAUSE PROBLEMS IN STAGE 3 CAN BE FIXED IN STAGE 1 

    
3. NON-MANUAL NON-STAGING PROBLEMS, I.E., PROBLEMS IN lib/Agua THAT
    
    CAUSE PROBLEMS IN STAGE 3 CAN BE FIXED IN STAGE 3 BUT ***_MUST BE COPIED
    
    TO STAGE 1 AND THEN STAGED IN ORDER TO BECOME FIXED_***.
    
    THIS AVOIDS THE PROBLEM OF USING A 'BUMPED' BUILD FOR EARLIER STAGES


    
</entry>
<entry [Sat 2012:10:13 23:47:12 EST] Ops::Stage FOR SIMPLE STAGING>

A TOOL TO SIMPLIFY THE TASK OF STAGING FROM DEVEL --> PRODUCTION REPOSITORIES
    
    -   SIMPLE COMMAND TO STAGE ANY REPO
    
    -   ALLOW MULTILINE COMMIT MESSAGE
    
./stager.pl \
--stagefile /repos/private/syoung/biorepodev/stage.pm \
--mode 1-2 \
--version 0.8.0-alpha.1+build.2 \
--message "First line
(EMPTY LINE)
(EMPTY LINE)
Second line
Third line"


    -   stage.pm DOES FILE MANIPULATIONS, RENAMING, ETC.

package stager;
use Moose::Role;
use Method::Signatures::Simple;

method preTargetCommit {
    my $mode = $self-mode();
    $self->logDebug("mode", $mode);
    return if $mode ne "2-3";
    
    my $installdir = $self->installdir();
    my $source = "$installdir/syoung";
    my $target = "$installdir/agua";
    return if not -d $source;
    `mkdir -p $target` if not -d $target;
    $self->logDebug("Can't create target dir", $target) if not -d $target;

    my $command = "rsync -av --safe-links $source/* $target";
    $self->logDebug("command", $command);
    my $result = `$command`;
    $self->logDebug("result", $result);
}


    -   stage.conf (Agua::Conf FORMAT) STORES STAGE INFO

[default]
PACKAGE     biorepository
OUTPUTDIR   /home/syoung/RELEASE

[stage 1]
REPODIR     /repos/private/syoung/biorepodev
    
[stage 2]
REPODIR     /repos/private/syoung/biorepostage

[stage 3]
REPODIR     /repos/public/agua/biorepodev

[stage 4]
REPODIR     /repos/public/agua/biorepository


-   ADD stage.conf AND stage.pm TO .gitattributes TO KEEP FROM PROD REPO

    
</entry>
<entry [Sat 2012:10:13 00:22:35 EST] STAGING: STARCLUSTER>

WHY STARCLUSTER IS SEPARATE FROM THE AGUA DISTRIBUTION:

1. ALLOWS FOR PATCHED 'SNAPSHOTS' OF STARCLUSTER RELEASES

2. PROVIDE TWO-LEVEL PUBLIC RELEASES - 'DEVEL' AND 'STABLE'

3. FOLLOWS SEMVER BUILD/PATCH/MINOR INCREMENT SYSTEM


PROCEDURE 1-2:

    1. ADD CHANGES AS INCREMENT BUILD/PATCH/MINOR VERSION

    2. RUN TESTS ON REMOTE
    
    
PROCEDURE 2-3:

    1. VERIFY INSTALLTION WORKS WITH agua USER
    
    2. INCREMENT BUILD/PATCH/MINOR VERSION
    
    3. 'DEVEL' RELEASE
    

PROCEDURE 3-4:

    1. INCREMENT VERSION (major, minor, patch, alpha/beta/rc AND BUILD)

        WHY BUILD? BECAUSE WE ARE CONSTRAINED BY HAVING TO SHADOW THE
        
        VERSION NUMBER OF STARCLUSTER, I.E., 0.92.0-rc.2
    
    2. 'STABLE' RELEASE

    

1   syoung:starclusterdev (PRIVATE)
    Ongoing patches of StarCluster to fix bugs and enable Agua
    /agua/starcluster --> /repos/private/syoung/starclusterdev

    git remote add bit ssh://git@bitbucket.org/stuartpyoung/starclusterdev.git
    git remote add github git@github.com:syoung/starclusterdev
    git remote add lin ssh://root@173.230.142.248/srv/git/private/syoung/starclusterdev
    git remote add upstream https://github.com/jtriley/StarCluster.git


2   syoung:starcluster (PRIVATE)
    Staging area for patches of StarCluster to fix bugs and enable Agua
    /repos/private/syoung/starcluster

    git remote add bit ssh://git@bitbucket.org/stuartpyoung/starcluster.git
    git remote add github git@github.com:syoung/starcluster
    git remote add lin ssh://root@173.230.142.248/srv/git/private/syoung/starcluster

    
3   agua:starclusterdev (PUBLIC, builds)
    'Devel' release of patched StarCluster for Agua cloud workflows platform
    /repos/public/agua/starclusterdev

    git remote add github git@github.com:agua/StarClusterDev
    git remote add lin ssh://root@173.230.142.248/srv/git/public/agua/starclusterdev
    git remote add bit ssh://git@bitbucket.org/aguadev/starclusterdev.git


4   agua:starcluster (PUBLIC, major, minor, patch - production)
    'Stable' release of patched StarCluster for Agua cloud workflows platform
    /repos/public/agua/starcluster

    git remote add github git@github.com:agua/StarCluster
    git remote add lin ssh://root@173.230.142.248/srv/git/public/agua/starcluster
    git remote add bit ssh://git@bitbucket.org/aguadev/starcluster.git

    
</entry>
<entry [Wed 2012:10:10 02:06:52 EST] INSTALL & UPGRADE: package VS repository>

MOTIVATION:



WANT TO BE ABLE TO:

1. INSTALL biorepository PACKAGE FROM DEVEL biorepodev REPOSITORY

2. INSTALL bioapps PACKAGE FROM DEVEL bioappsdev REPOSITORY

3. INSTALL FIRST USING STANDARD INPUTS AND THEN MANUALLY CHANGE package TABLE AND UPGRADE USING CUSTOM REPOSITORY

OR

INSTALL USING CUSTOM INPUTS, I.E., CAN'T DO IT WITH SIMPLE

./install.pl --mode installOpsRepo
./install.pl --mode installBioApps


SOLUTION:

1. ADD 'repository' FIELD TO package TABLE

owner       : syoung
privacy     : private
repository  : bioappsdev
package     : biorepository
installdir  : /repos/public/agua/biorepository/agua
opsdir      : /repos/private/syoung/biorepodev/syoung/biorepository

WHERE:

package     = THE NAME TO BE USED IN package TABLE
repository  = THE NAME OF THE REMOTE REPOSITORY FROM WHICH package IS FETCHED
owner       = LOGIN FOR THE REMOTE REPOSITORY


2. INSTALL BIOREPOSITORY TO CANONICAL installdir USING CUSTOM opsdir


3. INSTALL BIOAPPS USING bioapps.pm FILE IN CANONICAL opsdir

owner: syoung
privacy: private
repository: bioappsdev
package: bioapps
installdir: /agua
opsdir: /repos/public/agua/biorepository/agua


4. MODIFY Upgrade TO GET opsdir FIRST FROM package TABLE



SUCH THAT OPSDIR IS BASED ON THE package ALONE:

opsdir = /repos/public/agua/biorepository/agua/bioapps

    
</entry>
<entry [Tue 2012:09:25 01:41:52 EST] BLUEPRINT: AMIs LINEAGE>

1. AGUA AMI

ERIDANUS-0.8.0-alpha.2 --> AQUARIUS-0.8.0-alpha.2

ami-b3bd0fda ERIDANUS-0.8.0-alpha.2
    POST install.pl (Perlmods, R, etc.)
    POST config.pl
    POST deploy.pl

2. STARCLUSTER AMI

#ami-999d49f0    64-BIT EBS STARCLUSTER IMAGE
#ami-c6a877af    ERIDANUS-8 (POST ./install.pl, R)
ami-11c67678    ERIDANUS-0.8.0-alpha


    
</entry>
<entry [Sun 2012:09:09 03:10:42 EST] BLUEPRINT: starcluster GIT REPO SHADOWS agua VERSIONS>

1. CREATED starcluster GIT REPO IN

/data/starcluster/0.92rc2/starcluster 


2. starcluster VERSION SHADOWS agua VERSION

CHANGES TO STARCLUSTER-RELATED METHODS IN AGUA --> NEW agua VERSION IS X.Y.Z

--> RELATED CHANGES IN starcluster --> SET STARCLUSTER VERSION TO X.Y.Z


</entry>
<entry [Mon 2012:08:13 23:19:17 EST] BLUEPRINT: package TABLE HAS TWO KEYS - USERNAME AND PACKAGE>

CHANGED package TABLE KEY FROM owner-package-installdir TO username-package


THE USERNAME AND THE PACKAGE NAME ARE THE UNIQUE IDENTIFIER

    -   THE SAME PACKAGE NAME *** CANNOT *** BE USED MORE THAN ONCE FOR ANY USER

    -   DISAMBIGUATES PACKAGES IN THE Admin Apps TABLE LIST OF PACKAGES


REASONS FOR PREVIOUS USE OF owner-package-installdir TABLE KEY:

    -   ALLOWS MULTIPLE PACKAGES WITH THE SAME NAME BUT DIFFERENT INSTALLDIRS

    -   FOR TESTING WHERE PACKAGE NAME IS UNCHANGED BUT LOCATION DIFFERS

        -   DON'T NEED TO DO THIS WITH aguatest AS DATABASE IS LOADED EVERY TIME
    
        -   INSTALL FROM DIFFERENT SOURCES AT DIFFERENT TIMES:
        
            -   E.G., syoung:aguatestdev, syoung:aguatest OR agua:aguatestdev
            
            -   UPGRADE USES FORCED PULL SO OLD HISTORY IS WRITTEN OVER
            
            -   NO CLASHES WITH HISTORY OF INSTALLING PACKAGE 

    -   FOR MULTIPLE VERSIONS OF AN EXTERNAL PACKAGE
    
        -   USE NAME WITH VERSION SUFFIX INSTEAD
    

</entry>
<entry [Sat 2012:08:11 11:54:38 EST] BIOREPOSITORY: COPY APPS/WORKFLOWS FROM agua OR OTHER USER'S biorepository>

NB: PRIVATE WORKFLOWS - USE ORGANISATIONS AND FORKS ???

USE STRATEGY 2 TO COPY APPS OR WORKFLOWS FROM ANOTHER USER (INCLUDING THE agua USER):

--- STRATEGY 1 ---

    1. stash save, FORK PULL FROM MASTER ??? THEN OVERWRITE BY apply stash
    
    2. PUSH TO biorepository


--- STRATEGY 2 ---

    1. UPDATE agua/OTHERUSER BIOREPOSITORY TO LATEST VERSION IN
    
        repos/public/agua/biorepository
        repos/public/OTHERUSER/biorepository
    
    2. CHECKOUT DESIRED VERSION AND COPY APP/WORKFLOW FILES OVER TO USER's biorepository

    
</entry>
<entry [Thu 2012:08:02 23:16:44 EST] BIOREPOSITORY: ENCOMPASSES WORKFLOWS AND APPS>

WHY KEEP workflows, apps AND EXTERNAL APPLICATIONS ALL TOGETHER IN biorepository?

THIS IS THE BASIC PREMISE:

1. EACH USER HAS A FORKED COPY OF biorepository

2. CHANGES IN THE FORKS APPEAR IN THE NETWORK OF ALL FORKS

3. CHANGES MADE TO THE USER'S workflows AND apps ARE DISCOVERABLE

4. USERS CAN SHARE BETWEEN USERS AND REQUEST PULL TO agua's biorepository

5. WORKFLOWS AND APPS ARE CONNECTED SO BEST KEPT TOGETHER

6. EXTERNAL APPS ARE ALSO CONNECTED TO WORKFLOWS AND APPS SO SHOULD ALSO BE INCLUDED

    
</entry>
<entry [Thu 2012:08:02 02:25:09 EST] BIOREPOSITORY: COMPONENTS AND SYNCING>

INITIALISE GITHUB REPOSITORIES
------------------------------

ONCE USER CLICKS 'SYNC'

1. QUIT IF NO GITHUB LOGIN OR TOKEN IN hub TABLE

2. FORK FROM AGUA biorepository IF NOT isRepo

3. CREATE private REPO IF NOT isRepo


INITIALISE USER'S LOCAL REPOS
-----------------------------

    1. CLONE ALL FROM FORKED biorepository TO USER'S PUBLIC REPOS DIR
        cd /agua/repos/public/admin/
        git clone admin@github.com:biorepository
    
        THIS WILL CREATE THE FOLLOWING FILESYSTEM INSIDE THE REPODIR
        /agua/repos/public/admin/biorepository/admin/apps
        /agua/repos/public/admin/biorepository/admin/bioapps
        /agua/repos/public/admin/biorepository/admin/workflows


    2. CREATE private LOCAL GIT REPOSITORY

        /agua/repos/private/admin/private/.git
    
    
SYNC USER'S biorepository AND private REPOS
-------------------------------------------

SYNCING biorepository WITH SINGLE CLIENT IS STRAIGHTFORWARD:

    FOR EACH SUBSEQUENT SYNC, SIMPLY PUSH CHANGES UP TO REMOTE 

    SYNC WORKFLOWS:
    
        1. WIPE PUBLIC PROJECT FILES AND PRINT ANEW
        
        2. PUSH TO biorepository
        
    SYNC APPS:
    
        1. WIPE PUBLIC APP FILES AND PRINT ANEW
        
        2. PUSH TO biorepository


    REPEAT FOR PRIVATE REPOS, PUSHING TO private

    
SYNCING biorepository WITH MULTIPLE CLIENTS IS TRICKIER:

    DIFFERENT CHANGES MAY EXIST ON MULTIPLE CLIENTS --> PROBLEMS WHEN PUSHING
        
    SOLUTION: IMPLEMENT STRATEGY 2   
    
STRATEGY        ---1---                     ---2---
    
DESCRIPTION STASH CHANGES               IGNORE CHANGES ON REMOTE
            PULL FROM REMOTE            FORCE PUSH TO REMOTE
            
PROS        INCLUDES REMOTE CHANGES     IGNORES REMOTE CHANGES

CONS        IGNORES LOCAL *DELETIONS*   POSSIBLE ZIG-ZIG COMMIT HISTORY (OKAY???)


</entry>
<entry [Sun 2012:07:29 22:13:31 EST] KEYS: INSTANCE LAUNCH/SSH, EC2-API AND GITHUB ACCESS KEYS>


EC2-API TOOLS           X.509 Certificates	    private.pem AND public.pem
LAUNCH/SSH TO INSTANCE  Amazon EC2 Key Pairs    GENERATED AUTOMATICALLY
GITHUB                  RSA PRIVATE KEY         private.pem AND 

    
</entry>
<entry [Mon 2012:07:16 18:18:52 EST] UPDATED PUBLIC AND PRIVATE REPOS >

AGUATEST

* = existing
+ = added

PRIVATE

syoung:biorepodev
    aguatest*
    aguatestdev +

agua:biorepodev
    aguatest
    aguatestdev

PUBLIC

syoung:biorepository
    aguatest*
    aguatestdev

agua:biorepository
    aguatest
    aguatestdev

    
    



3 OF 8 FOUND - IDENTICAL COPIES. DEPLOYED SAME TO ALL






    
</entry>

<entry [Sun 2012:07:15 23:37:43 EST] EC2/GITHUB KEYS UPDATE: MOVE ALL INTO conf>

1. CONSOLIDATE ALL KEYS INTO A SINGLE DIRECTORY

conf/.ec2/USERNAME          -   EC2 KEYS (private.pem, public.pem)
conf/.repos/github/USERNAME -   GITHUB KEYS (id_rsa, id_rsa.pub)
conf/.starcluster/USERNAME  -   STARCLUSTER KEYPAIR (id_rsa-USERNAME)


2. PROTECT WHEN UPGRADING BY MOVING TO /temp-conf

BEFORE UPGRADE AGUA

mkdir /temp-conf
mv /agua/conf /temp-conf


AFTER UPGRADE AGUA

chmod 700 /agua/conf
mv /temp-conf/conf/.ssh         /agua/conf
mv /temp-conf/conf/.starcluster /agua/conf
mv /temp-conf/conf/.https       /agua/conf

UPDATE CONFIG:

ADD NEW ENTRIES FROM CLONED default.conf INTO EXISTING default.conf


3. MASK FROM GIT WITH .gitignore

em .gitignore

conf/.ec2
conf/.github
conf/.starcluster

    
</entry>
<entry [Sun 2012:07:15 21:41:01 EST] USE EC2-GENERATED *.pem KEY TO ACCESS STARCLUSTER AND GITHUB>

SUMMARY
-------

/agua/conf/.ssh/USERNAME   /nethome/USERNAME/.starcluster  /root/.ssh/idents/github/USERNAME

 EC2                        STARCLUSTER                     GITHUB
  |                               |                            | 
  |                               |                            |
  V                               V                            |
private.pem ---->   StarCluster id_rsa-KEYNAME                 |
public.pem                                                     |
                                                               |
private.pem ---->   id_rsa (COPIED)                            V
                    id_rsa.pub (CONVERTED)  ---->      GITHUB DEPLOY KEY
                                                            REPOS:
                                                            apps
                                                            biorepository
                                                            workflows
                                                            
                                ALTERNATELY ---->       GITHUB USER KEY
                                                            REPOS:
                                                            ALL

                                                            
STEP-BY-STEP
------------

1. USER GENERATES *.pem PRIVATE KEY ON AWS SECURITY PAGE

    - USER SAVES PRIVATE KEY TO FILE private.pem 

    - USER SAVES PUBLIC CERT TO FILE public.pem 

    
2. USER PASTES private.pem AND public.pem INTO AGUA Admin Settings PANEL


3. AGUA PRINTS KEY AND CERT TO FILES INSIDE conf DIR

private.pem ---->  	/agua/conf/USERNAME/.keypairs/private.pem
public.pem  ---->   /agua/conf/USERNAME/.keypairs/public.pem


4. AGUA GENERATES EC2 KEYPAIR FILE

private.pem + public.pem ---->  ec2-add-keypair  ---->  id_rsa-KEYNAME

StarCluster::generateKeypair CALLED BY Init.pm:

cd /agua/conf/USERNAME/.keypairs/
ec2-add-keypair \
-K private.pem \
-C public.pem \
id_rsa-KEYNAME > id_rsa-KEYNAME


*** USER MUST VERIFY IN Init.pm LOG THAT KEYPAIR WAS SUCCESSFULLY CREATED ***


5. AGUA COPIES EC2 KEYPAIR FILE TO StarCluster CONFIG FOLDER

cp /agua/conf/USERNAME/.keypairs/id_rsa-KEYNAME


6. AGUA COPIES private.pem TO ROOT SSH DIR

cp /agua/conf/USERNAME/.keypairs/private.pem /root/.ssh/idents/github/LOGIN/id_rsa

*** DON'T NEED /root/.ssh/id_rsa BECAUSE admin USER HAS ROOT ROLE IN AGUA ADMINISTRATION ***


7. AGUA GENERATES RSA-FORMAT CERTIFICATE FROM private.pem

cd /root/.ssh/idents/github/LOGIN
ssh-keygen -y -f ~/.ssh/id_rsa > ~/.ssh/id_rsa.pub


8. AGUA STORES NEW id_rsa.pub IN aws TABLE AS publiccert

9. AGUA PROVIDES id_rsa.pub IN response.data
#### OLD: USER EXITS AND LOGS BACK INTO AGUA

10. USER GETS id_rsa.pub FROM Admin Settings PANEL AND PASTES INTO GITHUB

AS DEPLOY KEY:

https://github.com/LOGIN/apps 
https://github.com/LOGIN/biorepository 
https://github.com/LOGIN/workflows 

    Admin --> Deplay Keys --> Add Deploy Key


AS USER KEY:

https://github.com/USERNAME

    Edit Your Profile --> SSH Keys --> Add SSH Key



    
</entry>
<entry [Sat 2012:07:14 21:00:28 EST] USERS PROVIDE DEPLOY KEYS FOR workflows, apps AND biorepository REPOS>

https://help.github.com/articles/managing-deploy-keys

FOR ADDITIONAL SECURITY, INSTEAD OF USING A USER KEY (WHICH ALLOWS ACCESS TO ALL REPOS), USERS PROVIDE A DEPLOY KEY


1. USER CREATES A GITHUB ACCOUNT

2. USER CREATES REPO 'biorepository'

3. USER CREATES EC2 SSH PRIVATE KEY AND PUBLIC CERTIFICATE IN AWS CONSOLE
    
    #### *** I.E., NOT THIS: ***
    #### https://help.github.com/articles/generating-ssh-keys

4. USER REGISTERS EC2 PRIVATE KEY AS biorepository DEPLOY KEY

    SEE THIS PAGE FOR DETAILS:
    https://help.github.com/articles/managing-deploy-keys

    SUMMARY:
    a. Instead of going to your account settings, go to the 'biorepository' repo's admin page.

    b. Go to "Deploy Keys" and click "Add deploy key".

    c. Paste in the ***PUBLIC CERTIFICATE*** (NOT THE PRIVATE KEY) and submit



Deploy keys

A deploy key is an SSH key that is stored on the server and grants access to a single repo on GitHub. This key is attached directly to the repo instead of to a user account.

Pros

Anyone with access to the server has access to deploy the repo
Users don't have to change their local SSH settings

Cons

Deploy keys only grant access to a single repo, more complex projects may have many repos to pull to the same server

The key has full read/write access to the repo

Deploy keys are usually not protected by a passphrase, making the key easily accessible if the server is compromised


    
</entry>
<entry [Sat 2012:06:30 01:44:36 EST] IMP: annotation by incremental mismatch probability>

DEFAULT INSTALLATION LOCATION:

/agua/imp/
        bin
        cgi-bin
        html
        lib
        t

CREATES THE FOLLOWING DATABASE:

mysql:imp


WHICH CONTAINS THE FOLLOWING TABLES:

swissprot
...
match


AND PRODUCES THE FOLLOWING WEB PAGES:

ec2-XXX-XXX-XXX-XXX/agua/plugins/site/imp


WHICH IS RUN BY THE FOLLOWING PLUGIN:

plugins/plugins.site.Site.js

    -   GENERATES/EMBEDS HOME PAGE (FROM TEMPLATE)

    -   HOME PAGE QUERIES CUSTOM CGI SCRIPT, E.G., agua/imp.cgi
    
    -   CUSTOM CGI SCRIPT QUERIES CUSTOM DB, E.G., mysql:imp

    -   GENERATES HTML RESPONSE AND HTML FILES

    
</entry>
<entry [Sat 2012:06:30 00:20:23 EST] DISAMBIGUATE DEVELOPMENT REPOS FOR biorepository FROM syoung's AUTOMATICALLY-GENERATED biorepository REPO>

NOTE: bioapps DOES NOT NEED THE SAME ACCOMODATION BECAUSE A bioapps REPO IS NOT AUTOMATICALLY CREATED BY AGUA

agua:biorepository DEVELOPMENT CHAIN
++++++++++++++++++++++++++++++++++++

LOCAL                       REMOTE
-----                       ------
syoung:biorepodev           PRIVATE
syoung:biorepo              PRIVATE
agua:biorepodev             PUBLIC
agua:biorepository          PUBLIC


syoung:biorepository DEVELOPMENT CHAIN
++++++++++++++++++++++++++++++++++++++

LOCAL                       REMOTE
-----                       ------
syoung:biorepository-daily  PRIVATE     commits
syoung:biorepository        PUBLIC      builds

RULES
-----

1. EACH syoung:biorepository CHANGE INSIDE AGUA BY DEFAULT INCREMENTS THE BUILD VERSION (OPTIONAL: SELECT INCREMENT major-minor-patch VERSION)

2. SIMILAR SETUP FOR THE AGUA-GENERATED private REPO:

syoung:private-daily        PRIVATE     commits
syoung:private              PUBLIC      builds


MOTIVATION
----------
syoung GITHUB ACCOUNT NEEDS TO ACCOMODATE AGUA-CREATED biorepository AND ALSO DEVELOPMENT REPOS DESTINED FOR agua GITHUB biorepository REPO

AGUA CREATES A biorepository AND A private REPO FOR EACH GITHUB USER:

biorepository/
            apps
            myPublicApp -- Information on how to install 'myPublicApp'
            workflows

private/
        apps
        myPrivateApp
        workflows


THE USER'S GITHUB ACCOUNT WOULD ALSO TYPICALLY CONTAIN THEIR OWN REPOS:

GENERIC                         EXAMPLE
-------                         -------
username:myPrivateApp           syoung:impdev
username:myPublicApp            syoung:imp



    
</entry>
<entry [Fri 2012:06:29 01:19:33 EST] CREATED insert-package.tsv FILE TO AUTOMATE TESTING aguatest, ETC. ON REMOTE USING syoung REPOS>


/agua/t/dump
cat insert-package.tsv 

syoung	admin	agua	ready	0.8.0-alpha.1+build9	/agua/repos/public/agua/biorepository/agua/biorepository	/agua				2012-06-28 05:40:43
syoung	admin	aguatest	ready	0.7.1	/agua/repos/public/agua/biorepository/agua/aguatest	/agua/t				2012-06-29 05:17:03
syoung	syoung	apps	ready	0.0.1	/agua/repos/public/biorepository/syoung/nethome/syoung/agua/.repos/public/apps/syoung	Public apps of syoung		http://www.aguadev.org/confluence	0000-00-00 00:00:00
syoung	admin	bioapps	ready	0.7.2	/agua/repos/public/agua/biorepository/agua/bioapps	/agua/bioapps				2012-02-25 20:16:28
syoung	admin	biorepository	ready	0.7.5+build5		/agua/repos/public/agua/biorepository				2012-02-25 23:52:01
syoung	syoung	workflows	ready	0.0.1	/agua/repos/private/biorepository/syoung	/nethome/syoung/agua/.repos/private/workflows/syoung	Private workflows of user syoung		http://www.aguadev.org/confluence	0000-00-00 00:00:00



select * from package where username != 'syoung'\G
*************************** 1. row ***************************
      owner: syoung
   username: admin
    package: agua
     status: ready
    version: 0.8.0-alpha.1+build9
     opsdir: /agua/repos/public/agua/biorepository/agua/biorepository
 installdir: /agua
description: 
      notes: 
        url: 
   datetime: 2012-06-28 05:40:43
*************************** 2. row ***************************
      owner: syoung
   username: admin
    package: biorepository
     status: ready
    version: 0.7.5+build5
     opsdir: 
 installdir: /agua/repos/public/agua/biorepository
description: 
      notes: 
        url: 
   datetime: 2012-02-25 23:52:01
*************************** 3. row ***************************
      owner: syoung
   username: admin
    package: aguatest
     status: ready
    version: 0.7.1
     opsdir: /agua/repos/public/agua/biorepository/agua/aguatest
 installdir: /agua/t
description: 
      notes: 
        url: 
   datetime: 2012-06-29 05:17:03
*************************** 4. row ***************************
      owner: syoung
   username: admin
    package: bioapps
     status: ready
    version: 0.7.2
     opsdir: /agua/repos/public/agua/biorepository/agua/bioapps
 installdir: /agua/bioapps
description: 
      notes: 
        url: 
   datetime: 2012-02-25 20:16:28

    
</entry>
<entry [Wed 2012:06:27 01:11:35 EST] STAGING: AGUATEST>

WHY AGUATEST IS SEPARATE:

1. INITIALLY, TO ALLOW CONCURRENT DEVELOPMENT OF MORE COMPLETE TESTS FOR EXISTING FUNCTIONALITY WHILST DEVELOPING NEW AGUA FUNCTIONALITY

2. SEPARATE THE LARGE TEST FILES FROM THE AGUA DISTRIBUTION (BUT NOW ACTUALLY SHIFTED OVER TO /data)

3. LATER - REINTEGRATE TESTS INTO AGUA TO SAVE ON DUPLICATION?

4. 'DEVEL' REPO OF agua:aguatest NEEDED TO MIRROR AGUA 'DEVEL' REPO


AGUATEST STAGING MIRRORS AGUA STAGING:

1. TESTS MAY BE ADDED WITH EACH BUILD/PATCH/MINOR INCREMENT

2. TESTS MUST BE BACKWARDS-COMPATIBLE TO THE SAME MAJOR VERSION OF AGUA
    
    (I.E., THE TESTS DEFINE THE API, SO THEY MUST BE COMPATIBLE WITH ALL SAME-VERSION CODE WHERE THE API IS UNCHANGED)

3. FOR EACH AGUA BUILD, CREATE A MATCHING AGUATEST BUILD  


PROCEDURE 1-2:

    1. ADD TESTS AS INCREMENT BUILD/PATCH/MINOR VERSION

    2. FOR EACH AGUA BUILD, CREATE A COMPLEMENTARY AGUATEST BUILD USING transfer.pl
    
    3. RUN TESTS ON REMOTE
    
    
PROCEDURE 2-3:

    1. transfer.pl
    
    2. REMOVE TAG

    3. RUN SCRIPTS OR MAKE CHANGES syoung --> agua

    4. RESTORE TAG
    
    5. RUN TESTS ON REMOTE
    

PROCEDURE 3-4:

    1. transfer.pl (major, minor, patch, alpha/beta/rc.N - no build)
    

1   syoung:aguatestdev (PRIVATE)
    Daily ongoing development of tests for Agua cloud workflow platform
    /agua/t --> /repos/private/syoung/aguatestdev

    git remote add bit ssh://git@bitbucket.org/stuartpyoung/aguatestdev.git
    git remote add github git@github.com:syoung/aguatestdev
    git remote add linode ssh://root@173.230.142.248/srv/git/private/syoung/aguatestdev


2   syoung:aguatest (PRIVATE)
    Tests for development (unstable) code for Agua cloud workflow platform
    /repos/private/syoung/aguatest

    git remote add bit ssh://git@bitbucket.org/stuartpyoung/aguatest.git
    git remote add github git@github.com:syoung/aguatest
    git remote add linode ssh://root@173.230.142.248/srv/git/private/syoung/aguatest


3   agua:aguatestdev (PUBLIC, builds)
    Daily ongoing development of tests for Agua cloud workflow platform
    /repos/public/agua/aguatestdev

    git remote add github git@github.com:agua/aguatestdev
    git remote add linode ssh://root@173.230.142.248/srv/git/public/agua/aguatestdev
    git remote add bit ssh://git@bitbucket.org/agua/aguatestdev.git


4   agua:aguatest (PUBLIC, major, minor, patch - production)
    Tests for Agua cloud workflow platform
    /repos/public/agua/aguatest

    git remote add github git@github.com:agua/aguatest
    git remote add linode ssh://root@173.230.142.248/srv/git/public/agua/aguatest
    git remote add bit ssh://git@bitbucket.org/agua/aguatest.git
    

</entry>
<entry [Wed 2012:06:27 01:10:38 EST] STAGING: BIOREPOSITORY>

PROCEDURE 1-2:
    1. DEVELOP NEW PACKAGE IN syoung:biorepodev
    2. RUN TESTS ON REMOTE, E.G. UPLOAD CHANGES TO agua.pm, bioapps.pm
    3. WHEN CHANGES ARE COMPLETE, STOP AND INCREMENT PATCH
    4. COPY TO syoung:biorepostage WITH SAME VERSION

PROCEDURE 2-3:
    1. EDIT PACKAGES BY DELETING MANUALLY IN syoung:biorepostage
    2. EDIT WORKFLOWS BY DELETING MANUALLY IN syoung:biorepostage
    3. FIX EDITS INTO REPO USING git commit --amend
    4. stager.pm CHANGES VARIABLES IN THE WORKFLOWS, E.G., OWNER syoung --> agua
    5. stager.pm CHANGES THE NAME OF THE WORKFLOWS PARENT DIR, E.G., syoung --> agua
    6. VERIFY THAT VERSION INSTALLS AND WORKS OK
    
PROCEDURE 3-4:
    1. TRANSFER TO agua:biorepository WHEN CHANGES ARE READY FOR PRIMETIME
    (major, minor, patch, alpha/beta/rc.N - AND build, E.G., FIXES FOR NEW FUNCTIONALITY)


1   syoung:biorepodev (PRIVATE)
    /repos/private/syoung/biorepodev
    Various *.pm scripts for installing bioinformatics packages.
    Development for agua biorepository (biorepository.pm).
    Development for Agua and Bioapps installation: agua.pm, bioapps.pm, emboss.pm, etc.

    git remote add github git@github.com:syoung/biorepodev
    git remote add lin ssh://root@173.230.142.248/srv/git/private/syoung/biorepodev
    git remote add bit ssh://git@bitbucket.org/stuartpyoung/biorepodev.git

    
2   syoung:biorepostage (PRIVATE)
    Staging point for debugging discrete build increments of 'biorepository'.
    /repos/public/syoung/biorepostage

    git remote add github git@github.com:syoung/biorepostage
    git remote add lin ssh://root@173.230.142.248/srv/git/private/syoung/biorepostage
    git remote add bit ssh://git@bitbucket.org/stuartpyoung/biorepostage.git

    
3   agua:biorepodev (PUBLIC)
    Public 'development' builds of 'biorepository' life sciences software and data sources.
    /repos/public/agua/biorepodev

    git remote add github git@github.com:agua/biorepodev
    git remote add lin ssh://root@173.230.142.248/srv/git/public/agua/biorepodev
    git remote add bit ssh://git@bitbucket.org/aguadev/biorepodev.git


4   agua:biorepository (PUBLIC)
    Public repository (stable version) of life sciences software and data sources.
    /repos/public/agua/biorepository

    git remote add github git@github.com:agua/biorepository
    git remote add lin ssh://root@173.230.142.248/srv/git/public/agua/biorepository
    git remote add bit ssh://git@bitbucket.org/aguadev/biorepository.git


    

NOTE: syoung's BIOREPOSITORY IS HERE:

1   syoung:private (PRIVATE)
    (syoung's private repository of life sciences software and data sources)
    /repos/private/syoung/private

    git remote add github git@github.com:syoung/private
    git remote add lin ssh://root@173.230.142.248/srv/git/private/syoung/private
    git remote add bit ssh://git@bitbucket.org/stuartpyoung/private.git


2   syoung:biorepository (PUBLIC)
    (syoung's public repository of life sciences software and data sources)
    /repos/public/syoung/biorepository

    git remote add github git@github.com:syoung/biorepository
    git remote add lin ssh://root@173.230.142.248/srv/git/public/syoung/biorepository
    git remote add bit ssh://git@bitbucket.org/stuartpyoung/biorepository.git


    
</entry>
<entry [Wed 2012:06:27 01:09:53 EST] STAGING: BIOAPPS>
 
WHY IS BIOAPPS SEPARATE FROM AGUA?

1. SEPARATION OF PURPOSES - EASIER TO MAINTAIN

2. bioapps CAN HAVE MULTIPLE CONTRIBUTORS ALTHOUGH PRINCIPALLY CODE IS TESTED BY syoung (AVAILABLE PUBLICLY THROUGH biorepository) THEN ADDED TO agua USER COPY OF bioapps


PROCEDURE 1-2: (PRIVATE DEVEL)
    1. ADD TESTS AS INCREMENT BUILD/PATCH/MINOR VERSION
    2. RUN TESTS ON REMOTE

PROCEDURE 2-3: (PUBLIC DEVEL)
    1. transfer.pl
    2. REMOVE TAG
    3. RUN SCRIPTS OR MAKE CHANGES syoung --> agua
    4. RESTORE TAG
    5. RUN TESTS ON REMOTE
    
PROCEDURE 3-4: (PUBLIC RELEASE)
    1. transfer.pl (major, minor, patch, alpha/beta/rc.N - no build)


1   syoung:bioappsdev (PRIVATE)
    /repos/private/syoung/bioappsdev --> /agua/bioapps

    git remote add github git@github.com:syoung/bioappsdev
    git remote add linode ssh://root@173.230.142.248/srv/git/private/syoung/bioappsdev


2   syoung:bioapps (PRIVATE)
    /repos/private/syoung/bioapps

    git remote add bit git@bitbucket.org:stuartpyoung/bioapps.git
    git remote add github git@github.com:syoung/bioapps
    git remote add lin ssh://root@173.230.142.248/srv/git/private/syoung/bioapps

   
3   agua:bioappsdev                  OK
    /repos/public/agua/bioappsdev  

    git remote add bit git@bitbucket.org:aguadev/bioappsdev.git
    git remote add github git@github.com:agua/bioappsdev
    git remote add lin ssh://root@173.230.142.248/srv/git/public/agua/bioappsdev

    git remote add github git@github.com:agua/bioappsdev
    git remote add linode ssh://root@173.230.142.248/srv/git/public/agua/bioappsdev


4   agua:bioapps                     OK
    /repos/public/agua/bioapps  

    git remote add github git@github.com:agua/bioapps
    git remote add linode ssh://root@173.230.142.248/srv/git/public/agua/bioapps

 
</entry>
<entry [Wed 2012:06:27 01:09:26 EST] STAGING: AGUA>
  

MOTIVATION:

1. HIDE THE INDIVIDUAL COMMITS BUT RETAIN THE PAPERTRAIL IN THE DEV REPO
    (NB: FILES IN .gitignore AND .gitattributes ARE NOT IN THE CLONED agua)

2. ONLY SHOW VERSION CHANGES (BUILDS, PATCHES, ETC.) IN THE NEXT REPO

3. NEED VERSIONS TO INSTALL BUILDS/PATCHES WITH REMOTE 'UPGRADE' TOOL

4. TRANSFER TO AGUA DEVEL USING COMPATIBLE VERSION SYSTEM

5. MAINTAIN A TWO-LEVEL RELEASE - DEVEL (UNSTABLE) AND PRODUCTION (STABLE)


    
PROCEDURE 1-2 (TEST DEVEL ON REMOTE):

    1. MAKE CHANGES, COMMITTING REGULARLY
    
    2. WHEN READY TO TEST ON REMOTE, transfer.pl AND INCREMENT BUILD
    
    3. TEST ON REMOTE
    
    4. INCREMENT PATCH WHEN CHANGES ARE COMPLETE

git push
git push --tags
git push bit
git push bit --tags
git push linode
git push linode --tags

PROCEDURE 2-3 (PUBLISH DEVEL):

    1. transfer.pl (INCREMENT BUILD)
    
    2. REMOVE TAG

    3. RUN SCRIPTS OR MAKE CHANGES syoung --> agua

    4. RESTORE TAG
    
    5. RUN TESTS ON REMOTE

    
PROCEDURE 3-4 (PUBLISH PRODUCTION):

    1. transfer.pl (major, minor, patch, alpha/beta/rc.N - no build)

    
1   syoung:aguadev (PRIVATE, builds)
    Builds of Agua (Transfer to private repo syoung:agua for testing)
    /repos/private/syoung/aguadev --> /agua
    
    git remote add github git@github.com:syoung/aguadev
    git remote add lin ssh://root@173.230.142.248/srv/git/private/syoung/aguadev
    git remote add bit ssh://git@bitbucket.org/stuartpyoung/aguadev.git

2   syoung:agua (PRIVATE, builds)
    Development (unstable) code for Agua cloud workflow platform
    /repos/private/syoung/agua

    git remote add github git@github.com:agua/aguadev
    git remote add lin ssh://root@173.230.142.248/srv/git/private/syoung/agua
    git remote add bit ssh://git@bitbucket.org/stuartpyoung/agua.git

3   agua:aguadev (PUBLIC, builds)
    Development (unstable) code for Agua cloud workflow platform
    /repos/public/agua/aguadev

    git remote add github git@github.com:agua/aguadev
    git remote add lin ssh://root@173.230.142.248/srv/git/public/agua/aguadev
    git remote add bit ssh://git@bitbucket.org/agua/aguadev.git

4   agua:agua (PUBLIC, major, minor, patch - production)
    Stable release of Agua cloud workflow platform 
    (NB: Patches are released often, similar to nightly build)
    /repos/public/agua/agua

    git remote add github git@github.com:agua/agua
    git remote add lin ssh://root@173.230.142.248/srv/git/public/agua/agua
    git remote add bit ssh://git@bitbucket.org/syoung/agua.git

    
</entry>
<entry [Thu 2012:06:14 23:26:35 EST] DOWNLOAD TARBALL FROM GITHUB USING login AND password>

http://stackoverflow.com/questions/10046027/having-trouble-downloading-git-archive-tarballs-from-private-repo

For public repo, you have [this gist][1] listing some examples:

    wget --no-check-certificate https://github.com/sebastianbergmann/phpunit/tarball/3.5.5 -O ~/tmp/cake_phpunit/phpunit.tgz

For a private repo, try passing your credential information in a post directive:

    wget --quiet --post-data="login=${login}&token=${token}" --no-check-certificate https://github.com/$ACCOUNT/$PRIVATE_REPO/tarball/0.2.0.257m

Or use a curl command as in SO question "[git equivalent to `svn export` or github workaround][2]", also explained in great details in:  
"[**A curl tutorial using GitHub's API**][3]".

-----

The [OP Steven Jp][4] reports having made the `curl` command work:

> The final curl command ended up looking something like this:

    curl -sL --user "${username}:${password}" https://github.com/$account/$repo/tarball/$tag_name > tarball.tar

(in multiple lines for readability)

    curl -sL --user "${username}:${password}" 
      https://github.com/$account/$repo/tarball/$tag_name
      > tarball.tar


  [1]: https://gist.github.com/758124
  [2]: http://stackoverflow.com/a/9329607/6309
  [3]: https://gist.github.com/2288960
  [4]: http://stackoverflow.com/users/1317806/steven-jp
  
    
</entry>
<entry [Thu 2012:06:14 14:21:36 EST] REFACTOR: USE OAUTH ACCESS TOKENS FOR GITHUB AUTHENTICATION>
    
AGUA USES 4 TYPES OF GITHUB AUTHENTICATION:

1. NO AUTHENTICATION
--------------------

1. GET PUBLIC REPO INFO, TAGS, FORKS


2. GITHUB login/password (TRANSIENT)
------------------------------------

OVER HTTPS, USER SUPPLIES GITHUB login AND password TO DO THE FOLLOWING:

1. CREATE/EDIT THE USER'S SOLE OAUTH ACCESS TOKEN

2. DELETE THE OAUTH ACCESS TOKEN


3. GITHUB OAUTH TOKEN
---------------------

DEFAULT: scopes: ["public_repo","repo"])

OPTIONAL delete_repo SCOPE

    OTHERWISE, MUST DELETE MANUALLY AT www.github.com

    
1. GET PUBLIC REPO INFO, TAGS, FORKS

    E.G., SHARED APPS, WORKFLOWS


2. GET PRIVATE REPO INFO, TAGS, FORKS 

    E.G., PRIVATE APPS, WORKFLOWS


3. CREATE/EDIT/DELETE REPOS

    SCOPE IS public_repo FOR PUBLIC REPOS 

    SCOPE IS repo FOR PRIVATE REPOS
    


4. SSH KEY
----------

1. PUSH/PULL WORKFLOWS TO/FROM GITHUB

2. PUSH/PULL APPS TO/FROM GITHUB


    
</entry>
<entry [Tue 2012:06:05 21:07:36 EST] APPS AND WORKFLOWS DIRECTORY STRUCTURE>

1. THE repos DIRECTORY CONTAINS private AND public REPO FOLDERS:

    - USER'S PUBLIC AND PRIVATE PACKAGES ARE KEPT SEPARATE

    - 'OPSREPO' (biorepository|private) PACKAGE CONTAINS:

        - USER'S OWN APPS AND WORKFLOWS
        
        - APPS AND WORKFLOWS FROM OTHER USERS IN USER-NAMED SUBDIRS

    
2. OPSREPO PACKAGES INCLUDE:

    - USER'S PACKAGES, E.G., myApp
    
    - COPIED PACKAGES, E.G., forkedApp

    - SUBFOLDERS CONTAINING *.ops/*.pm FILES TO INSTALL USER'S

        -   PACKAGES

        -   APPS

        -   WORKFLOWS


3. USER PACKAGES

PRIVATE PACKAGES

/nethome/username/repos/private/username/myAppDev


PUBLIC PACKAGES (USER'S AND EXTERNAL PACKAGES)

/nethome/username/repos/public/username/myApp
/nethome/username/repos/public/otheruser/forkedApp


4. OPSREPO (private|biorepository) PACKAGES

    -   *.ops AND *.pm FILES FOR INSTALLING APPS
    
    -   *.flow WORKFLOW FILES FOR USER AND FORKED FROM OTHER USERS
    
    -   *.app APP CONFIGURATION FILES FOR USER AND FORKED FROM OTHER USERS


PRIVATE APPS/WORKFLOWS/PACKAGES:

repos/private/username/private/username/apps
repos/private/username/private/username/myApp
repos/private/username/private/username/workflows

... UPLOAD TO username:private REPOSITORY


EXAMPLE DIRECTORY STRUCTURE:

/agua/t/bin/Agua/Common/Package/Sync/outputs/repos/private/username/private/username/workflows/
            workflows.ops
            workflows.pm
            projects/
                    Project1/
                            Project1.proj
                            1-Workflow1.work
                            2-Workflow2.work

/agua/t/bin/Agua/Common/Package/Sync/outputs/repos/private/username/private/OTHERUSER/workflows/
            workflows.ops
            workflows.pm
            projects/
                    ...

                    
PUBLIC APPS/WORKFLOWS/PACKAGES:

repos/public/username/biorepository/username/apps
repos/public/username/biorepository/username/myApp
repos/public/username/biorepository/username/workflows

... UPLOAD TO username:biorepository REPOSITORY


EXAMPLE DIRECTORY STRUCTURE:

/agua/t/bin/Agua/Common/Package/Sync/outputs/repos/public/username/biorepository/username/workflows/
            workflows.ops
            workflows.pm
            projects/
                    Project1/
                            Project1.proj
                            1-Workflow1.work
                            2-Workflow2.work



USER PACKAGES
=============

THE *.ops FILE for THE USER'S PRIVATE myApps PACKAGE:

repos/private/username/private/username/myApp/myApps.ops



THE *.pm FILE INSTALLS myApp FROM GITHUB:

repos/private/username/private/username/myApp/myApp.pm

    use MooseX::Declare;
    class apps extends Agua::Ops {
        #### MOST MINIMAL *.pm FILE
    }


THE myApp.ops FILE CONTAINS INFORMATION TO BE USED BY myApp.pm:

repos/private/username/private/username/myApp/myApp.ops

{
    "name"              :   "myApp",
    "version"           :   "0.7.2",
    "description"       :   "myApp Bioinformatics application",
    "type"              :   "application",
    "source"            :   "git",
    "keywords"          :   ["bioinformatics", "workflows", "OTHER", "KEYWORDS"],
    "url"               :   "http://WEBSITE.org",
    "installtype"       :   "ops",
    "opsfile"           :   "https://api.github.com/repos/username/private/username/myApp/myApp.ops",
    "installfile"       :   "https://api.github.com/repos/username/private/username/myApp/myApp.pm",
    "appdir"            :   "https://api.github.com/repos/username/private/username/myApp/apps",
    "licensefile"       :   "https://api.github.com/repos/username/private/username/myApp/LICENSE",
    "readmefile"        :   "https://api.github.com/repos/username/private/username/myApp/README",
    "installtype"       :   "ops",
    "author"            :   [{
        "name": "FIRSTNAME",
        "surname": "LASTNAME",
        "email": "EMAIL@gmail.com",
        "url": "http://WEBSITE.org"
    }],
    "publication"       :   [],
    "organisation"      :   [],
    "ISA"               :   {},
    "acknowledgements"  :   [],
    "citations"         :   [],
    "resources"         :   {
        "datavolume"         :   {
                "id"            :   "snap-XXXXXXXX",
                "name"          :   "VOLUME NAME",
                "description"   :   "THIS VOLUME CONTAINS THE FOLLOWING DATA AND APPLICATIONS: ... "
        },
        "configfile"    :   "conf/default.conf"
    }
}

    
</entry>
<entry [Tue 2012:05:22 19:34:34 EST] BLUEPRINT: agua USER JBROWSE FEATURES ON /data VOLUME>


1. USE dumpUser.pl TO DUMP ONLY features TABLE TO /data/dump


2. INSTALLATION OF bioapps LOADS /data VOLUME:

    -   LOAD /data/conf/bioapps.conf
    
    -   LOAD JBROWSE FEATURES IN bioapps/conf/tsv/feature.tsv
    
    -   LOAD AGUA WORKFLOWS IN /data/dump/agua.insert.dump
    
    mysql -u root -p agua < /data/dump/agua.insert.dump

    
</entry>
<entry [Sun 2012:03:04 23:51:13 EST] BLUEPRINT: PACKAGE DEPENDENCIES>
    
Examples:

agua 1.0.0 requires bioapps 0.8.0-1.*   (0.8.0 - 1.X.Y)
agua 1.1.0 requires bioapps 1.+          ( >1.0.0)

    
HANDLE PACKAGE DEPENDENCIES:


1. EACH PACKAGE HAS OPTIONAL dependencies SLOT

    dependency      NAME
    versions        X-Y:Z1,Z2,Z3-Z10
    lazy            true|false
        
2. IF dependencies PRESENT, ADD ENTRIES TO dependencies TABLE 

    username
    owner
    package
    installdir
    dependency
    versions        X-Y:Z1,Z2,Z3-Z10
        

3. WHEN PACKAGE IS UPGRADED, CHECK DEPENDENCIES

IF DEPENDENCY NOT PRESENT:

    -   COMPLIE LIST OF DEPENDENCIES OF EACH DEPENDENCY

    -   PROMPT USER TO INSTALL ALL DEPENDENCIES OR QUIT
    
    -   INSTALL/UPGRADE DEPENDENCIES TO LATEST OR MAX REQUIRED VERSION
        
    

</entry>
<entry [Sun 2012:03:04 23:50:55 EST] BLUEPRINT: LOAD agua WORKFLOWS IN biorepository>

1. UPGRADE BIOREPOSITORY

    --> Agua::Common::Package::loadProjectFiles LOADS agua'S PROJECT FILES 


2. CREATE AGUA USER IF NOT PRESENT


3. COPY admin PROJECT FILES TO agua BIOREPOSITORY ACCOUNT

    -   REPLACE admin OWNER WITH agua


4.  ON UPGRADE, biorepository.pm LOADS agua BIOREPOSITORY PROJECTS INTO DATABASE

    THE METHOD SIGNATURE:

        method loadProjectFiles ($username, $package, $installdir, $workflowdir)  
        
    WHERE THE ARGUMENTS ARE AS FOLLOWS:
        
        my $username    =   "agua";
        my $package     =   "bioapps";
        my $installdir  =   $self->conf()->getKey("bioapps", "INSTALLDIR");
        my $opsdir = "$basedir/repos/public/biorepository";
        
        ### SET WORKFLOW DIR
    	my $workflowdir = 	$self->setWorkflowDir($opsdir, $username);
    	$self->logDebug("workflowdir", $workflowdir);

        
5. APPEND/UPDATE PROJECT ENTRY IN access TABLE

    -   OPEN ACCESS FOR ALL agua PROJECTS (E.G., chmod 755)
    
    -   USERS CAN VIEW PROJECTS IN 'Shared Projects' PANE OF STAGES PANEL
    
    -   USERS CAN COPY PROJECTS OR WORKFLOWS TO OWN ACCOUNT

    -   USER SYNCS TO UPDATE OWN WORKFLOWS IN PRIVATE & PUBLIC BIOREPOSITORIES
    
    
6. INCREMENT biorepository VERSION WITH EACH UPGRADE OF admin PROJECT FILES

    -   admin USER CAN UPGRADE TO NEWER biorepository VERSIONS IN Home PANE


    
</entry>
<entry [Fri 2012:02:24 12:36:47 EST] BLUEPRINT: GIT COMMIT MESSAGE FORMAT>

SUMMARY LINE
------------

[+/-][Keyword]: [Summary] (less than 50 characters)

The general format can be enforced with a commit hook.

+ or - symbol indicates whether it should be included in a release change list. The change list (or at least a first draft) can then be auto-generated from the revision control log. 

Keyword chosen from a finite set to indicate the type of commit: Fix (bug fix), Add (new feature), Tidy, etc.).

Use present tense: "Fix bug" and not "Fixed bug" to match up with commit messages generated by
commands like git merge and git revert. Interactive rebasing (git rebase -i) and interactive adding (git add -i) are easier to read when commit messages use a short summary and a present tense voice.

The subject line is used all over Git, oftentimes in truncated form if too long of a message was used. The following are just a handful of examples of where it ends up:
    git log --pretty=oneline shows a terse history mapping containing the commit id and the summary
    git rebase --interactive provides the summary for each commit in the editor it invokes
    if the config option merge.summary is set, the summaries from all merged commits will make their way into the merge commit message
    git shortlog uses summary lines in the changelog-like output it produces
    git format-patch, git send-email, and related tools use it as the subject for emails
    reflogs, a local history accessible with git reflog intended to help you recover from stupid mistakes, get a copy of the summary
    gitk has a column for the summary
    GitHub uses the summary in various places in their user interface



DESCRIPTION
-----------

More detailed explanatory text, e.g., technical details that cannot be expressed in the summary.

Blank line between the summary and details so that the first line can be treated as the subject of an email and the rest of the text as the body. 'git rebase' can get confused if you run the
two together.

Max line length: 72 characters 
    -   'git log' doesn’t wrap commit messages
    -   'git format-patch --stdout'
        -   converts a series of commits to a series of emails
        -   uses the messages for the message body

Blank line between each paragraph

Bullet points: hyphen preceded by a single space, no blank line in between

Paragraph headings:

    Change Description:
    Code Reviewed by:
    Unit Tested:
    Target Release Label:


COMMIT MESSAGE EXAMPLES
-----------------------

Fix: Progress pane squashed. 

Progress pane height and width:

 - home.css: .home .dijitContentPaneError
 - Added image for load error



Fix: Bug #2345. Progress pane load error message.

Load error:
 - Home.js: Added override of FloatingPane onDownloadError





NOTES
=====


Give details
http://drupal.org/node/52287

Provide at least a short summary of what is contained in the commit. Most often, the issue title can be re-used. Otherwise, try to summarize the change.

Usually, commit messages start with the (past tense) verb

Added (new feature)
Fixed (bug fix)
Changed (task)
Updated (task, due to changes in third-party code)
It may not be trivial to phrase a summary starting with one of those verbs. But if used consistently, you will get used to it. When not using these verbs, make sure you prefix the commit message with the issue category.

Either way allows users of your module to determine whether a new release contains only bug fixes or maybe also new features and other stuff that may require testing on an existing production site.

The following hint might help you in writing comprehensive summaries:

Try to keep the commit message to something like the title of the issue or a single sentence describing what was fixed. Do not to describe what was really wrong, just say what was fixed.


Wording Style
http://wiki.phonegap.com/w/page/28618615/Git%3A%20Commit%20Message%20Format

It is good idea to use the imperative present tense in the summary message. Think of it as telling it what to do.
 
Good Example (Assertive)
 
Add tests for accelerometer.
 
Bad Examples (Wimpy)
 
I added some test to accelerometer.
 
Added tests to accelerometer.
 
Why use Imperative Present Tense?
 
Some Git commands like interactive rebasing (git rebase -i) and interactive adding (git add -i) are easier to read when commit messages use a short summary and a present tense voice.



50/72 RULE
http://stackoverflow.com/questions/43598/suggestions-for-a-good-commit-message-format-guideline

I'm at the beginning of a new project, and I'm trying to set up the repository in a smart fashion and establish some code style guidelines for everyone to be able to concentrate on code.

Most of it is done, but I'm still unsure about the format I should enforce for commit messages. I'm all for freedom and just telling people to make them clear and thorough, but I've that it rarely works, people having very different notions of "clear" :).

And so far, I've never found a satisfying scheme. What I most often do is: a one line summary of the commit, then bullet points describing each change in more detail.

But often it's kind of hard to decide what deserves a bullet point and what doesn't, and some sort of classification, by features, file, or minor/major changes would seem appropriate. Sadly each time I try to do that, I end up writing stupidly long commit messages for trivial changes...

How do you do it?


I think you have to rely on people actually being able to think for themselves. You can provide some basic guidelines, like the ones you outlined, but in the end people must understand them in order to follow them.

Here's an extract from my recommended best practices for version control:

Always write a comment when committing something to the repository. Your comment should be brief and to the point, describing what was changed and possibly why. If you made several changes, write one line or sentence about each part. If you find yourself writing a very long list of changes, consider splitting your commit into smaller parts, as described earlier. Prefixing your comments with identifiers like Fix or Add is a good way of indicating what type of change you did. It also makes it easier to filter the content later, either visually, by a human reader, or automatically, by a program.

If you fixed a specific bug or implemented a specific change request, I also recommend to reference the bug or issue number in the commit message. Some tools may process this information and generate a link to the corresponding page in a bug tracking system or automatically update the issue based on the commit.

Here are some examples of good commit messages:

Changed paragraph separation from indentation to vertical space.
    ...
    Fix: Extra image removed.
    Fix: CSS patched to give better results when embedded in javadoc.
    Add: A javadoc {@link} tag in the lyx, just to show it's possible.
    ...
    - Moved third party projects to ext folder.
    - Added lib folder for binary library files.
    ...
    Fix: Fixed bug #1938.
    Add: Implemented change request #39381.
In my experience, you have to follow up on people and give them directions whenever they don't follow the commit rules. You could of course implement a script to enforce some of the rules (like the prefixing and bug referencing), but that will not catch the lazy people who don't bother to write anything meaningful. I think it's important to explain why you want these conventions and how they will benefit the development team.

Setting up a commit e-mail list and monitor it for message is a good way to keep track of what people are doing. Whenever someone is committing something without a satisfactory message, you will know so and can tell them. I guess is the same way as with coding conventions, for them to be successful, somebody has to follow up on them.

link|improve this answer
answered Sep 4 '08 at 12:33

Anders Sandvig
4,84253355
I was looking around for additional prefixes and drupal.org/node/52287 suggests: added, fixed, changed, and updated. Originally I liked your "Prefix: " but "Fix: Fixed bug #1938." shows the issue with that (and I'd argue the bug title should be included in the message as well). – James Skemp Jun 23 '11 at 13:40
Nicely written! I have used a similar notion to your prefixes for years, so your comments resonate strongly with me. As to @James' comment, my suggestion would be to simply use "Fix: bug #1938" to get the point across with no loss of clarity. – msorens Aug 4 '11 at 21:48
Having implemented pieces of the answers to this question, I've personally recommended we do something like "Fixed (short explanation of issue). See (name of our reporting system) #(number of issue)." It seems to have worked rather well for us, and allows easy searching of the commit logs (allowing search of what was fixed, not just that an issue was fixed). – James Skemp Aug 5 '11 at 16:34
Was this post useful to you?     

up vote
16
down vote
Some rules I try to follow:

First line of the description is a short summary of the change. Many source control systems let you see a list of changes that show this line, so it gives you a rough summary.
Include bug ID and bug title. Don't make people look it up!
Make the Bug ID be a URL to open the bug, if your bug tracking supports it.
Say what you changed.
Say why you made this change, instead of taking some other approach.
Be very detailed.
Making each change small makes it easier to follow the history + easier to write & read a good commit description.
When a change is strictly a refactoring, I start the first line with "REFACTORING:". This lets me ignore that change when looking for a deliberate functional change. (Of course, accidental functional changes, aka bugs, can still be in these.)
For an example of a highly-detailed commit message, see this blog post from my old friend Cyrus: http://blogs.msdn.com/cyrusn/archive/2005/03/27/402729.aspx

link|improve this answer
edited Apr 12 '10 at 17:53

answered Sep 20 '08 at 14:35

Jay Bazuzi
14k13986
feedback
up vote
9
down vote
I'm trying to follow these rules:

Be concise
Describe why you do, not what you do
Usual format for my commit messages is:

Issue: #[issue number] [short description]
If you have some kind of bug tracking system, provide issue number in commit message.
I found that many developers just write something like "Added X. Removed Y" but I can find this info looking at the code diff. If there is no issue number attached it can be hard to know why developer made some change.

link|improve this answer
answered Sep 4 '08 at 12:22

aku
30.8k791136
feedback
up vote
5
down vote
Bug ID: (If applicable)
Change Description:
Code Reviewed by:
Unit Tested:
Target Release Label:
link|improve this answer
answered Sep 4 '08 at 12:21

Prakash
11.3k115384
feedback
up vote
3
down vote
My 5 cents, the following link is for git, but anyway, could prove to be useful:

http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html

The basic thing (according to that article) is to write first a short description (50 characters) and then you can detail more stuff, staying always less than 72 character width.

link|improve this answer
answered Dec 3 '10 at 12:52

PaBLoX
1117
feedback
up vote
2
down vote
We use Altassian JIRA as a bug tracker, and Subversion for our source control -- JIRA has a nice feature wherein it can track the commits related to that bug, and put it in the bug resolution history.

As such, the format we usually take is:

PROJECTCODE - 1234 : Reasonably detailed description of changes made

By "reasonably detailed" what I mean is that you don't just put "fixed bug" or "changed implementation", you usually put in a description that is not very specific bug still tells what was actually done, e.g., "Sorting strategy for SortingMethod() was changed from bubble sort to quicksort to improve performance".

link|improve this answer
answered Sep 4 '08 at 13:03

Jon Limjap
28.9k850101
feedback
up vote
1
down vote
We don't really care about the free text, but everyone is required to enter the bugtracking ticket id of the task the commit belongs to and who peer reviewed his code.

The first one may generate a little overhead for quick fixes but it can be a life saver. Having the actual reason of every single line of code handy is very valuable.

The second one just encourages to do peer reviews.

link|improve this answer
answered Sep 4 '08 at 12:21

Maximilian
1,17241117
feedback
up vote
1
down vote
One ting I always do, is if the changed is triggered by some sort of bug/tracker-software is to include the bugid in a consistent way. That way it is easer to track all changes related to a bug at a later stage.

Example:

BugID: 2345 Added validation of user input to avoid exploit.

link|improve this answer
answered Sep 4 '08 at 12:23

Espo
15.6k14379
feedback
up vote
1
down vote
I think bug id (if there is one) is a good idea.

One of my favorite features about FogBugz is that you can set up a hook script so that, when you enter the bug id in the commit log, the commit information gets added to the FogBugz case.

 Image from here


Beyond that, just write something meaningful about why you made the changes you made.

link|improve this answer
edited Sep 4 '08 at 12:39

answered Sep 4 '08 at 12:24

Mark Biek
19.8k961113
N.B. tracking issue ids in commit messages feature is not specific to FogBugz, actually I think every other issue tracking system also supports this – dolzenko Jun 24 '09 at 7:23
feedback
up vote
0
down vote
I find it rather hard to get commit messages right. Why not propose this:

Each commit message must start with the Bug/Task ID that is resolved by the commit. Anything else is just chatter...

link|improve this answer
answered Sep 4 '08 at 12:22

Daren Thomas
14.7k104298
Because we memorize what every bug in the tracker is, amirite? – Xiong Chiamiov Nov 8 '09 at 8:21
No, because the tracker can be consulted whenever you really need to find out. Also, this emphasises keeping commit granularity at bug/task level. – Daren Thomas Nov 10 '09 at 8:27
feedback
up vote
0
down vote
We prefix each comment line with a + or - symbol to indicate whether it should be included in a release change list. The change list (or at least a first draft) can then be auto-generated from our revision control log.

Beyond that, we have a keyword (chosen from a finite set) to indicate the type of commit (bug fix, new feature, tidy, etc.), and then a shortish comment describing the change, with links to our issue tracking system.

[+/-][Keyword]: [Description] 
The general format can be enforced with a commit hook, but the descriptions still need to be human-verified to make sure everyone is making useful commit messages.

link|improve this answer
answered Jun 14 '11 at 6:11

Ergwun
1,922515
feedback
Your Answer







http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html

A Note About Git Commit Messages

19 Apr 2008

I want to take a moment to elaborate on what makes a well formed commit message. I think the best practices for commit message formatting is one of the little details that makes Git great. Understandably, some of the first commits to rails.git have messages of the really-long-line variety, and I want to expand on why this is a poor practice.

Here’s a model Git commit message:

Capitalized, short (50 chars or less) summary

More detailed explanatory text, if necessary.  Wrap it to about 72
characters or so.  In some contexts, the first line is treated as the
subject of an email and the rest of the text as the body.  The blank
line separating the summary from the body is critical (unless you omit
the body entirely); tools like rebase can get confused if you run the
two together.

Write your commit message in the present tense: "Fix bug" and not "Fixed
bug."  This convention matches up with commit messages generated by
commands like git merge and git revert.

Further paragraphs come after blank lines.

- Bullet points are okay, too

- Typically a hyphen or asterisk is used for the bullet, preceded by a
  single space, with blank lines in between, but conventions vary here

- Use a hanging indent
Let’s start with a few of the reasons why wrapping your commit messages to 72 columns is a good thing.

git log doesn’t do any special special wrapping of the commit messages. With the default pager of less -S, this means your paragraphs flow far off the edge of the screen, making them difficult to read. On an 80 column terminal, if we subtract 4 columns for the indent on the left and 4 more for symmetry on the right, we’re left with 72 columns.
git format-patch --stdout converts a series of commits to a series of emails, using the messages for the message body. Good email netiquette dictates we wrap our plain text emails such that there’s room for a few levels of nested reply indicators without overflow in an 80 column terminal. (The current rails.git workflow doesn’t include email, but who knows what the future will bring.)
Vim users can meet this requirement by installing my vim-git runtime files, or by simply setting the following option in your git commit message file:

:set textwidth=72
For Textmate, you can adjust the “Wrap Column” option under the view menu, then use ^Q to rewrap paragraphs (be sure there’s a blank line afterwards to avoid mixing in the comments). Here’s a shell command to add 72 to the menu so you don’t have to drag to select each time:

$ defaults write com.macromates.textmate OakWrapColumns '( 40, 72, 78 )'
More important than the mechanics of formatting the body is the practice of having a subject line. As the example indicates, you should shoot for about 50 characters (though this isn’t a hard maximum) and always, always follow it with a blank line. This first line should be a concise summary of the changes introduced by the commit; if there are any technical details that cannot be expressed in these strict size constraints, put them in the body instead. The subject line is used all over Git, oftentimes in truncated form if too long of a message was used. The following are just a handful of examples of where it ends up:

git log --pretty=oneline shows a terse history mapping containing the commit id and the summary
git rebase --interactive provides the summary for each commit in the editor it invokes
if the config option merge.summary is set, the summaries from all merged commits will make their way into the merge commit message
git shortlog uses summary lines in the changelog-like output it produces
git format-patch, git send-email, and related tools use it as the subject for emails
reflogs, a local history accessible with git reflog intended to help you recover from stupid mistakes, get a copy of the summary
gitk has a column for the summary
GitHub uses the summary in various places in their user interface
The subject/body distinction may seem unimportant but it’s one of many subtle factors that makes Git history so much more pleasant to work with than Subversion.

    
</entry>
