ssh



<entry [Tue 2014:09:09 05:55:25 EST] SSH TUNNELLING>

#alias sshp='sshkey syoung; ssh -C -D 1080 stuart@132.249.228.6'

OR

alias sshp='sshkey syoung; ssh -L 3389:10.2.12.250:3390 -L 8080:10.2.12.64:80 stuarty@132.249.228.6'

    
</entry>
<entry [Fri 2014:08:29 10:32:38 EST] GET KEY FINGERPRINT WITH ssh-keygen>

ssh-keygen -lf

	
</entry>
<entry [Sun 2014:08:17 11:08:22 EST] START SSH-AGENT>

ssh-agent bash
	
</entry>
<entry [Mon 2014:04:07 20:45:31 EST] FIXED ERROR: scp STOPPED WORKING AFTER EDITED .bash_profile>
	
PROBLEM

SCP FAILS ALTHOUGH SSH STILL WORKS

syoung@comp2:~/annai/projects/access/keypairs$ scp annai-cghub.key ubuntu@132.249.227.100: 
HOMEDIR: /home

DIAGNOSIS

THE "HOMEDIR: /home" IS PRINTED OUT BY .bash_profile

THIS INTERRUPTS THE SCP CONNECTION (SCP IS BASICALLY SSH PASSING)

http://superuser.com/questions/395356/scp-doesnt-work-but-ssh-does

scp, under the hood, sets up a tunnel using ssh, and then transfers the file over that tunnel, with a ssh command on the far end to catch the file as it comes over. This is illustrated by the use of tar and ssh to copy a directory structure preserving ownership and creation times with the following commands:

  tar czf - ./* | ssh jf@otherserver.com tar xzf - -C ~/saved_tree
to send it over, and

ssh jf@otherserver.com "tar czf - ~/saved_tree" | tar xzvf - -C ./
to get it back.


SOLUTION

COMMENT OUT ANY 'echo' CALLS IN .bash_profile

	
	
</entry>
<entry [Fri 2014:04:04 11:42:59 EST] SSH FORWARDING / SSH TUNNELLING>

https://help.github.com/articles/using-ssh-agent-forwarding

1. VERIFY KEY WORKS

ssh -T git@github.com

	Hi username! You've successfully authenticated, but GitHub does not provide
	shell access.

2. EDIT ~/.ssh/config

ADD SECTION

Host < IP OR FDQN OF HOST>
  ForwardAgent yes

Warning: DON'T use a wildcard like Host * to just apply this setting to all SSH connections. They won't have direct access to the keys, but they will be able to use them while the connection is established.

3. VERIFY THAT SSH AGENT FORWARDING IS WORKING ON THE SERVER

SSH TO SERVER AND RUN

ssh -T git@github.com

SHOULD GET THE SAME PROMPT AS IN STEP 1

VERIFY FURTHER THAT IT'S NOT THE LOCAL KEY BY INSPECTING THE 'SSH_AUTH_SOCK' VARIABLE:

echo "$SSH_AUTH_SOCK"

IF AGENT FORWARDING IS WORKING, SHOULD GET OUTPUT LIKE THIS:

	# Print out the SSH_AUTH_SOCK variable
	# /tmp/ssh-4hNGMk8AZX/agent.79453

IF IT'S NOT WORKING, SHOULD GET NO OUTPUT FROM THE ABOVE COMMAND AND GITHUB LOGIN WILL FAIL:

ssh -T git@github.com
	# Try to SSH to github
	# Permission denied (publickey).

	
	

	
SSH keys must work locally

Before you can make your keys work through agent forwarding, they must work locally first. Check out this guide for help setting up your local SSH keys

Local SSH must allow forwarding

Not only do you need to enable agent forwarding in your user's SSH config (see above), but you may need to set it in your system's SSH settings as well. You can check if a system config file is being used by running ssh -v example.com and checking the first few lines of the output. Make sure you use your server's domain name or IP, of course.

ssh -v example.com
# Connect to example.com with verbose debug output
# OpenSSH_5.6p1, OpenSSL 0.9.8r 8 Feb 2011
# debug1: Reading configuration data /Users/you/.ssh/config
# debug1: Applying options for example.com
# debug1: Reading configuration data /etc/ssh_config
# debug1: Applying options for *
Don't forget to exit to return to your local system!

In the example above, the file ~/.ssh/config is loaded first, then /etc/ssh_config. We can inspect that file to see if it's overriding our options.

cat /etc/ssh_config
# Print out the /etc/ssh_config file

Host *
  SendEnv LANG LC_*
  ForwardAgent no
What do we have here? Our system settings file is overriding the ForwardAgent setting. We can edit this file and remove that line.

Server must allow forwarding on inbound connections

Agent forwarding may be blocked on the server's side. Make sure AllowAgentForwarding is set in sshd_config

Your local ssh-agent must be running

On most systems the OS will automatically launch ssh-agent for you. On windows, however, you need to do this manually. Check out this guide for details on how to run ssh-agent automatically when you open Git Bash.

To check to see if ssh-agent is running, inspect the SSH_AUTH_SOCK variable:

echo "$SSH_AUTH_SOCK"
# Print out the SSH_AUTH_SOCK variable
# /tmp/launch-kNSlgU/Listeners
Your key must be available to ssh-agent

You can check with:

ssh-add -L
And if no identity is available:

ssh-add yourkey

	
</entry>
<entry [Tue 2014:04:01 23:13:21 EST] SSH TIMES OUT>

PROBLEM

SSH TIMES OUT AFTER A FEW MINUTES, NEED TO KILL TERMINAL AND START A NEW ONE


SOLUTION

ON THE CLIENT, EDIT 

/etc/ssh/ssh_config

ADD

ServerAliveInterval 5

	
</entry>
<entry [Mon 2014:03:31 13:12:13 EST] FIXED: SSH IS SLOW ON UBUNTU>

PROBLEM

LOGIN TO VM TAKES AGES


DIAGNOSIS

THE SSH CLIENT IS WAITINF FOR GSSAPI authentication TO TIME OUT


SOLUTION

EDIT FILE ON CLIENT:

/etc/ssh/ssh_config

ADD LINE:

#GSSAPIAuthentication yes
GSSAPIAuthentication no

sshv 91
	
	INSTANT CONNECTION!


</entry>
<entry [Fri 2014:01:31 10:12:30 EST] GENERATE FINGERPRINT FOR PUBLIC KEY>

ssh-keygen -lf id_rsa.pub
	
</entry>
<entry [Sat 2013:11:23 23:48:07 EST] FIXED: REMOVE A HOST FROM known_hosts>

PROBLEM

GET THIS ERROR WHEN TRY TO SSH TO A HOST

Add correct host key in /home/syoung/.ssh/known_hosts to get rid of this message.
Offending ECDSA key in /home/syoung/.ssh/known_hosts:58

SOLUTION

REMOVE HOST ENTRY FROM known_hosts
  
ssh-keygen -f "/home/syoung/.ssh/known_hosts" -R 184.169.161.14
	
</entry>
<entry [Wed 2013:09:18 14:34:00 EST] GENERATE A PUBLIC KEY FROM A PRIVATE KEY>

THIS IS THE CORRECT FORMAT TO PUT IN THE authorized_keys FILE

cd ~/.ssh/annai/ec2
ssh-keygen -y -f ./id_rsa > ./id_rsa.pub



THIS RECREATES THE TRADITIONAL id_rsa.pub FILE

openssl rsa -in id_rsa -pubout > id_rsa.pub
    
    writing RSA key

    -r-------- 1 syoung syoung 1.7K Sep 25 00:36 id_rsa
    -rw-rw-r-- 1 syoung syoung  451 Sep 25 00:42 id_rsa.pub

    
</entry>
<entry [Tue 2012:10:30 01:33:41 EST] PASSWORDLESS SSH>
    
1. copy the public key to every host you will connect TO:
* this should prompt you for a password

scp ~/.ssh/id_dsa.pub my_user_id@1.2.3.4:~/.ssh/id_dsa.pub


2. shell into the remote machine

ssh my_user_id@1.2.3.4


3. authorize the key by adding it to the list of authorized keys

cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys


4. log out of the current shell
    OK
    
</entry>
<entry [Tue 2012:03:13 12:28:07 EST] SOLVED: WHY SSH COMMAND HAS LESS ENVIRONMENT VARIABLES>

SUMMARY

1. SSH COMMAND DOES NOT SOURCE /etc/bashrc

2. PUT NEEDED ENVIRONMENT VARIABLES INTO /etc/profile


http://stackoverflow.com/questions/216202/why-does-an-ssh-remote-command-get-fewer-environment-variables-then-when-run-man

QUESTION

Why does an SSH remote command get fewer environment variables then when run manually?

I have a command that runs fine if I ssh to a machine and run it, but fails when I try to run it using a remote ssh command like :

ssh user@IP < command>

Comparing the output of "env" using both methods resutls in different environment variables. When I manually login to the machine and run env, I get much more environment variables then when I run :

ssh user@IP "env"
Any idea why ?


ANSWER

There are different types of shells. The SSH command execution shell is a non-interactive shell, whereas your normal shell is either a login shell or an interactive shell. Description follows, from man bash:

       A  login  shell  is  one whose first character of argument
       zero is a -, or one started with the --login option.

       An interactive shell is  one  started  without  non-option
       arguments  and  without the -c option whose standard input
       and error are both connected to terminals  (as  determined
       by  isatty(3)), or one started with the -i option.  PS1 is
       set and $- includes i if bash is interactive,  allowing  a
       shell script or a startup file to test this state.

       The  following  paragraphs  describe how bash executes its
       startup files.  If any of the files exist  but  cannot  be
       read,  bash reports an error.  Tildes are expanded in file
       names as described below  under  Tilde  Expansion  in  the
       EXPANSION section.

       When  bash is invoked as an interactive login shell, or as
       a non-interactive shell with the --login option, it  first
       reads and executes commands from the file /etc/profile, if
       that file exists.  After reading that file, it  looks  for
       ~/.bash_profile,  ~/.bash_login,  and  ~/.profile, in that
       order, and reads and executes commands from the first  one
       that  exists  and is readable.  The --noprofile option may
       be used when the shell is started to inhibit  this  behav­
       ior.

       When a login shell exits, bash reads and executes commands
       from the file ~/.bash_logout, if it exists.

       When an interactive shell that is not  a  login  shell  is
       started,  bash reads and executes commands from ~/.bashrc,
       if that file exists.  This may be inhibited by  using  the
       --norc  option.   The --rcfile file option will force bash
       to  read  and  execute  commands  from  file  instead   of
       ~/.bashrc.

       When  bash  is  started  non-interactively, to run a shell
       script, for example, it looks for the variable BASH_ENV in
       the  environment,  expands  its value if it appears there,
       and uses the expanded value as the name of a file to  read
       and  execute.   Bash  behaves  as if the following command
       were executed:
              if [ -n "$BASH_ENV" ]; then . "$BASH_ENV"; fi
       but the value of the PATH variable is not used  to  search
       for the file name.

link|improve this answer
answered Oct 19 '08 at 9:20

Vinko Vrsalovic
63.3k11131228
2	  
Great answer, this was exactly the problem, the needed environment variables resided in /etc/bashrc, which is not sourced in non interactive mode. Moving them to /etc/profile solved the problem. Thank you very much! – Tom Feiner Oct 19 '08 at 9:29
feedback

up vote
10
down vote
How about sourcing the profile before running the command?

ssh user@host "source /etc/profile; /path/script.sh"

You might find it best to change that to ~/.bash_profile, ~/.bashrc, or whatever.

(As here (linuxquestions.org))

link|improve this answer
edited Jun 1 '11 at 8:44

answered Sep 24 '09 at 15:29

Ian Vaughan
1,009818
Had this problem, this solution worked great. – Sam152 May 25 '11 at 4:25
feedback
up vote
3
down vote
I had similar issue, in the end, I found out that ~/.bashrc was all I needed.

However, in Ubuntu, I had to comment the line that stops processing ~/.bashrc :

If not running interactively, don't do anything
[ -z "$PS1" ] && return
link|improve this answer
answered Nov 13 '10 at 17:11

tb_selleo
466
Was this post useful to you?


I found an easy resolution for this issue was to add source /etc/profile to the top of the script.sh file I was trying to run on the target system. On the systems here, this caused the environmental variables which were needed by script.sh to be configured as if running from a login shell.

In one of the prior responses it was suggested that ~/.bashr_profile etc... be used. I didn't spend much time on this but, the problem with this is if you ssh to a different user on the target system than the shell on the source system from which you log in it appeared to me that this causes the source system user name to be used for the ~.

link|improve this answer
answered Jan 5 '11 at 19:13

Chuck
111
feedback
up vote
0
down vote
Just export the environment variables you want above the check for a non-interactive shell in ~/.bashrc.

link|improve this answer
answered Feb 15 at 6:27

schlick
293
Was this post useful to you?     

    
</entry>
<entry [Tue 2012:03:13 12:20:30 EST] USE -t ARGUMENT TO PASS ENVIRONMENT VARIABLES>

http://ericholscher.com/blog/2009/feb/15/incredibly-useful-ssh-flag/

ncredibly useful SSH flag
So at work we have a lot of different django environments, scattered across varies servers. All of this information is kept in a central resource. We have the pythonpath, settings file, and the remote server that the client is on. So every time that I want to go do work on a different site, I have to ssh into that server, set the PYTHONPATH and DJANGO_SETTINGS_MODULE environmental variable, and then do what I want to do. This is not a huge deal, but it is annoying when you're doing it 10-20 times a day.

So I went along and tried to figure out the best way to handle this situation. One of the popular ways to achieve this type of functionality is a simple shell script on the remote client, that sets the environment. You ssh into the client, change into the clients directory, and source it into bash to get into your environment. This didn't really solve my problem, because it's basically what I was already doing.

It would be really nice to be able to run an ssh command, to the remote server, and have it executed. SSH has this ability, simply by passing a command after your connect string.

$ ssh ericholscher.com uptime
19:11:28 up 69 days, 21:29,  1 user,  load average: 0.00, 0.00, 0.00
However, this simply executes and returns. I want to be able to set up my environment on the remote side. With the -t command to SSH, this allows you to do exactly that. It sets up a psuedo-tty on the remote side, which then lets you execute commands! So you can do something like this:

$ ssh ericholscher.com -t DJANGO_SETTINGS_MODULE=test.settings bash
eric@Odin:~$ env |grep DJ
DJANGO_SETTINGS_MODULE=test.settings

$ ssh ericholscher.com -t PYTHONPATH='$HOME/Python' django-admin.py dbshell
SQLite version 3.5.9
Enter ".help" for instructions
sqlite>

$ ssh ericholscher.com -t PYTHONPATH='$HOME/Python' django-admin.py shell
[..ipython startup truncated..]
In [1]: import django

In [2]: django.VERSION
Out[2]: (1, 1, 0, 'alpha', 0)
Note that the PYTHONPATH variable is quoted. This is because I am using the $HOME variable, if you don't quote it, it will be evaluated on the client side. If you quote it, it gets passed to the server to be set.

I have written a datastore backend that keeps all of my sites settings and pythonpaths (along with other information), and then I wrote a simple wrapper script around that. I will hopefully be releasing this code in the near future, but it allows me to do things along these lines.

$ ./assume.py production my_site shell
$ ./assume.py production test_project shell
$ ./assume.py staging my_site dbshell
$ ./assume.py local my_site syncdb
and end up in the correct place.

A really neat part of this is that when you do something like dbshell, you are sent to the remote site, and you can perform an action. However, when you leave that command, you are brought back to the local environment that you were already working in. This makes it really easy to be able to do simple one off actions on a remote site (like fixing a bug). This comes up a lot at work, eg: someone is reporting X on server Y, can you please check the database over there really quick.

This gives you a lot of value because you are connected to the database with the credentials in the settings. It really allows you to abstract the knowledge that is in your settings files and build commands around them. Any custom management commands that are defined on the remote server are also really easy to activate as well. This allows you to think "I need to reindex the search on client Z", you simply do something like ./assume.py Z reindex, and then go on about your previously scheduled activity. You don't have to think what server the client is running on, what version of django, where the code lives, or anything like that.

I'd love to hear other ideas that people have for this kind of system. I think that a simple reusable app that keeps track of your different servers and commands would be really neat and useful. Perhaps integrating it into Fabric or something would be possible as well.

Twitter this | Reddit this | Add to Delicious | Subscribe RSS
Comments
1 codekoala says...
Thanks for this tip!! I've never considered using this part of SSH, but I'm sure I'll start doing it all the time now.

Posted at 4:06 a.m. on February 16, 2009

2 Julian says...
Why don't you just add export PYTHONPATH=$HOME/Python to your .bashrc file on the server?

Posted at 6:15 a.m. on February 16, 2009

3 Eric Holscher says...
@Julian: The whole point is to be able to dynamically add these settings on the remote host. You may have two seperate projects on that server that have different PYTHONPATH and DJANGO_SETTINGS_MODULE variables. The above was merely a trivial example, showing the functionality.

Posted at 6:24 a.m. on February 16, 2009

4 Tracy Reed says...
I have been using this trick for a long time. But I use it to automatically install my ssh key in ~/.ssh/authorized_keys for every account I log into. This is very handy for my sysadmin work. The only problem is that I have a shell script which is 10 lines long with each line separated by a ; instead of a n which has my public key embedded in it which I execute on the remote end using the -t trick. This whole script shows up in the ps output on the remote end which makes a mess of the ps output. It's only aesthetic but I'm annoyed that it is there. I would love to hear if anyone knows how to correct this.

Posted at 7:14 a.m. on February 16, 2009

5 Eric Holscher says...
@Tracy: I would checkout ssh-copy-id. It sounds like what you want, and isn't as hacky :)

Posted at 8:44 a.m. on February 16, 2009

6 lamby says...
You don't actually need -t to solve this - just execute 'env' on the remote server. e.g:

$ ssh ericholscher.com env DJANGO_SETTINGS_MODULE=test.settings bash

Posted at 10:02 a.m. on February 16, 2009

7 Eric Holscher says...
@Iamby: I don't know if you tried this, but on my end it just ends up with a stuck ssh client. That is the point of -t, to allow you to interact on the other end like it is a teminal. Perhaps you have your ssh configured differently?

Posted at 3:50 p.m. on February 16, 2009

8 Michal Migurski says...
The reliance on environment variables seems like a bit of a minefield to me, a design problem in the framework - do you ever forget which site you're working on because you've confused your terminals? Neat trick though.

Posted at 7:52 p.m. on February 16, 2009

9 travis parker says...
i solved the same issue at my job by creating .bashrc files in my home directory on each server I might ssh into. at the end of them, I even use 'cd' so that I just say 'ssh servername' and my environment gets set up and i start in the right directory.

Posted at 9:21 p.m. on February 16, 2009

10 Michal Migurski says...
Second thought: what if you used entirely separate user accounts for each site, with .bashrc or .cshrc files for the environment vars as others have suggested? It's a bit more upfront overhead, but serverside permissions would keep you from clobbering the wrong client file.

Posted at 9:24 p.m. on February 16, 2009

11 macdet says...
@Fabric or something would be possible as well.

that was my first idea :) before read the line!

great post anyway!

i`ll like to see the code

Posted at 12:30 p.m. on March 16, 2009

Comment are disabled for this post.
    
</entry>
<entry [Sat 2012:03:10 20:27:38 EST] SSH CONFIGURATION FOR SPECIFIC HOST AND USER>

http://stackoverflow.com/questions/3225862/multiple-github-accounts-ssh-config

1. ADD Host github.com LINES TO SSH CONFIG FILE

emacs -nw ~/.ssh/config

    # SSH config file                                                                        
    
    #### GITHUB agua                                                                         
    Host github.com
    HostName github.com
    IdentityFile ~/.ssh/idents/github.com/agua/id_rsa
    User agua
    
    #### GITHUB syoung AND EC2                                                               
    Host github.com
    HostName github.com
    IdentityFile ~/.ssh/idents/github.com/syoung/id_rsa
    User syoung
    
    
    #### GITHUB GENERAL                                                                      
    IdentityFile ~/.ssh/idents/%h/id_rsa
    IdentityFile ~/.ssh/idents/%h/id_dsa
    IdentityFile ~/.ssh/id_rsa
    
    #### GENERAL AQUARIUS PRIVATE KEY                                                        
    IdentityFile ~/.ssh/id_dsa





*** BELOW IS NOT NEEDED ***


2. ADD SSH-KEY TO SSH WITH ssh-add

ssh-add ~/.ssh/idents/github.com/agua/id_rsa

    Identity added: /home/syoung/.ssh/idents/github.com/agua/id_rsa (/home/syoung/.ssh/idents/github.com/agua/id_rsa)

ssh-add ~/.ssh/idents/github.com/syoung/id_rsa

    Identity added: /home/syoung/.ssh/idents/github.com/syoung/id_rsa (/home/syoung/.ssh/idents/github.com/syoung/id_rsa)


3. CONFIRM USING -vT OPTION FOR ssh

ssh -vT agua@github.com
    ...    
    debug1: Authentications that can continue: publickey
    debug1: Next authentication method: publickey
    debug1: Offering RSA public key: /home/syoung/.ssh/idents/github.com/agua/id_rsa
    debug1: Remote: Forced command: gerve agua d7:a8:b2:a4:33:d8:af:e5:3f:d3:f5:b8:a6:2c:48:5d





NOTES
=====

http://aperiodic.net/phil/ssh/

Key management with an agent is done via the ssh-add program. 

Adding keys 

ssh-add ~/.ssh/id_rsa 

Listing 

ssh-add -l 
    1024 75:a4:2c:9b:b1:58:8f:9c:96:d8:99:77:fc:01:0d:8a /home/user/.ssh/id_rsa (RSA) 

Removing keys 

ssh-add -d ~/.ssh/id_rsa 
    Identity removed: /home/user/.ssh/id_rsa (/home/user/.ssh/id_rsa.pub) 





http://www.ibm.com/developerworks/aix/library/au-spunixpower.html

Shhh . . . secrets about SSH
Secure Shell (SSH) is a rich subsystem used to log in to remote systems, copy files, and tunnel through firewalls—securely. Since SSH is a subsystem, it offers plenty of options to customize and streamline its operation. In fact, SSH provides an entire "dot directory", named $HOME/.ssh, to contain all its data. (Your .ssh directory must be mode 600 to preclude access by others. A mode other than 600 interferes with proper operation.) Specifically, the file $HOME/.ssh/config can define lots of shortcuts, including aliases for machine names, per-host access controls, and more.

Here is a typical block found in $HOME/.ssh/config to customize SSH for a specific host:

Host worker
HostName worker.example.com
IdentityFile ~/.ssh/id_rsa_worker
User joeuser

Each block in ~/.ssh/config configures one or more hosts. Separate individual blocks with a blank line. This block uses four options: Host, HostName, IdentityFile, and User. Host establishes a nickname for the machine specified by HostName. A nickname allows you to type ssh worker instead of ssh worker.example.com. Moreover, the IdentityFile and User options dictate how to log in to worker. The former option points to a private key to use with the host; the latter option provides the login ID. Thus, this block is the equivalent of the command:
ssh joeuser@worker.example.com -i ~/.ssh/id_rsa_worker

A powerful but little-known option is ControlMaster. If set, multiple SSH sessions to the same host share a single connection. Once the first connection is established, credentials are not required for subsequent connections, eliminating the drudgery of typing a password each and every time you connect to the same machine. ControlMaster is so handy, you'll likely want to enable it for every machine. That's accomplished easily enough with the host wildcard, *:
Host *
ControlMaster auto
ControlPath ~/.ssh/master-%r@%h:%p

As you might guess, a block tagged Host * applies to every host, even those not explicitly named in the config file. ControlMaster auto tries to reuse an existing connection but will create a new connection if a shared connection cannot be found. ControlPath points to a file to persist a control socket for sharing. %r is replaced by the remote login user name, %h is replaced by the target host name, and %p stands in for the port used for the connection. (You can also use %l; it is replaced with the local host name.) The specification above creates control sockets with file names akin to:
master-joeuser@worker.example.com:22

Each control socket is removed when all connections to the remote host are severed. If you want to know which machines you are connected to at any time, simply type ls ~/.ssh and look at the host name portion of the control socket (%h).
The SSH configuration file is so expansive, it too has its own man page. Type man ssh_config to see all possible options. And here's a clever SSH trick: You can tunnel from a local system to a remote one via SSH. The command line to use looks something like this:
$ ssh example.com -L 5000:localhost:3306

This command says, "Connect via example.com and establish a tunnel between port 5000 on the local machine and port 3306 [the MySQL server port] on the machine named 'localhost.'" Because localhost is interpreted on example.com as the tunnel is established, localhost is example.com. With the outbound tunnel—formally called a local forward—established, local clients can connect to port 5000 and talk to the MySQL server running on example.com.
This is the general form of tunneling:
$ ssh proxyhost localport:targethost:targetport

Here, proxyhost is a machine you can access via SSH and one that has a network connection (not via SSH) to targethost. localport is a non-privileged port (any unused port above 1024) on your local system, and targetport is the port of the service you want to connect to.
The previous command tunnels out from your machine to the outside world. You can also use SSH to tunnel in, or connect to your local system from the outside world. This is the general form of an inbound tunnel:
$ ssh user@proxyhost -R proxyport:targethosttargetport

When establishing an inbound tunnel—formally called a remote forward—the roles of proxyhost and targethost are reversed: The target is your local machine, and the proxy is the remote machine. user is your login on the proxy. This command provides a concrete example:
$ ssh joe@example.com -R 8080:localhost:80

The command reads, "Connect to example.com as joe, and connect the remote port 8080 to local port 80." This command gives users on example.com a tunnel to Joe's machine. A remote user can connect to 8080 to hit the Web server on Joe's machine.
In addition to -L and -R for local and remote forwards, respectively, SSH offers -D to create an HTTP proxy on a remote machine. See the SSH man page for the proper syntax.
Back to top
Rewriting with history
If you spend a lot of time at the shell prompt, recording shell history can save time and typing. But there are a few annoyances with history, if left unmodified: History records duplicate commands, and multiple shell instances can clobber each other's history. Both complications are easily overcome. Add two lines to your .bashrc:
export HISTCONTROL=ignoreboth
shopt -s histappend

The first line removes consecutive duplicate commands from your shell history. If you want to remove all duplicates independent of sequence, change ignoreboth to erasedups. The second line appends a shell's history to your history file when the shell exits. By default, the Bash history file is named (yes, a dot file) ~/~/.bash_history. You can change its location by setting (yes, an environment variable) HISTFILE. If you want to save a shell's most recent 10,000 commands in a history file with 100,000 entries, add export HISTSIZE=10000 HISTFILESIZE=100000 to your shell startup file. To see a shell's history, type history at any prompt.
Saving a history of commands is of little use if you cannot recall it. That's the purpose of the shell !, or bang, operator:
!! ("bang bang") repeats the last command in its entirety.
!:0 is the name of the previous command.
!^ is the first argument of the previous command. !:2, !:3, and so on, ending with !$ are the second, third, and eventually the last argument of the previous command.
!* is all the arguments of the last command, except the command name.
!n repeats the command numbered n in history.
!handle repeats the last command that begins with the string of characters in handle. For example, !ca would repeat the last command that began with the characters ca, such as cat README.
!?handle repeats the last command that contains the string of characters in handle. For example, !?READ would also match cat README.
^original^substitution replaces the first occurrence of original with substitution. For example, if the previous command was cat README, the command ^README^license.txt would yield a new command cat license.txt.
!:gs/original/substitution replaces all occurrences of original with substitution. (!:gs means "global substitution.")
!-2 is the penultimate command, !-3 is third most recent command, and so on.
You can even combine history expressions to yield sigil soup such as !-2:0 -R !^ !-3:2, which would expand to the command name of the penultimate command, followed by -R, the first argument of the previous command, and the second argument of the third most recent command. To make such cryptic commands more readable, you can expand history references as you type. Type the command bind Space:magic-space at any prompt, or add it to a startup file to bind the Space key to the function magic-space, which expands history substitutions inline.
    
</entry>
<entry [Mon 2011:08:29 05:43:36 EST] USE '-o StrictHostKeyChecking EQUALS no' TO AVOID PROMPT CONNECTING TO NEW HOST>

USE -o StrictHostKeyChecking=no:

ssh -o StrictHostKeyChecking=no -i KEYPAIRFILE root@IP_ADDRESS

</entry>
<entry [Wed 2011:05:04 12:50:17 EST] SSH ENVIRONMENT VARIABLES>

SEE apps.starcluster
[Wed 2011:05:04 19:23:52 EST] SETTING SSH ENV VARS FOR SOURCING settings.sh


http://www.netexpertise.eu/en/ssh/environment-variables-and-ssh.html

To run a program calling libs from an unusual location, we’d need to redefine the LD_LIBRARY_PATH variable for instance.

This can be achieved in 2 steps:

1. Add ‘PermitUserEnvironment yes’ to your sshd_config file and restart the ssh service.
Rem: Default value is set to ‘No’.

2. Define your environment variables in .ssh/environment on the target host.

eg LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib


    
</entry>