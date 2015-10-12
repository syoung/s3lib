python



<entry [Thu 2014:11:06 05:59:03 EST] USE guppy TO GET MEMORY ALLOCATED TO ALL OBJECTS>


1. INSTALL python-dev

apt-get install python-dev


2. INSTALL guppy

easy_install -U guppy


3. USE heapy IN GUPPY

emacs heapy.py

	from guppy import hpy;
	
	hp=hpy()
	
	h = hp.heap()
	
	print h


python heapy.py


	
</entry>
<entry [Thu 2014:11:06 05:40:54 EST] USE MEMORY PROFILER TO GET IN-MEMORY SIZE OF STRUCTURE>

http://stackoverflow.com/questions/1331471/in-memory-size-of-python-stucture

MEMORY PROFILER
https://pypi.python.org/pypi/memory_profiler

1. INSTALL SETUPTOOLS

sudo su
apt-get install python-setuptools


2. INSTALL PROFILER

easy_install -U memory_profiler

OR

pip install -U memory_profiler


OR FROM SOURCE:

python setup.py install


3. INSTALL psutil (FOR SPEED)

easy_install -U psutil


4. USE PROFILER

emacs -nw example.py

	@profile
	def my_func():
		a = [1] * (10 ** 6)
		b = [2] * (2 * 10 ** 7)
		del b
		return a
	
	if __name__ == '__main__':
		my_func()


python -m memory_profiler example.py

	Line #    Mem usage  Increment   Line Contents
	==============================================
		 3                           @profile
		 4      5.97 MB    0.00 MB   def my_func():
		 5     13.61 MB    7.64 MB       a = [1] * (10 ** 6)
		 6    166.20 MB  152.59 MB       b = [2] * (2 * 10 ** 7)
		 7     13.61 MB -152.59 MB       del b
		 8     13.61 MB    0.00 MB       return a
	
</entry>
<entry [Mon 2014:11:03 02:00:30 EST] PYTHON ONLINE BOOK: Test-driven Development with Python>


1. INSTALL PYTHON PACKAGES

#### Django 1.7
sudo pip3 install django==1.7

This is our web framework. You should make sure you have version 1.7 installed and that you can access the django-admin.py executable from a command line. The Django documentation has some installation instructions if you need help.

#### Selenium
sudo pip3 install --upgrade selenium

a browser automation tool that we’ll use to drive what are called functional tests. Make sure you have the absolute latest version installed. Selenium is engaged in a permanent arms race with the major browsers, trying to keep up with the latest features. If you ever find Selenium misbehaving for some reason, the answer is often that it’s a new version of Firefox and you need to upgrade to the latest Selenium …
	
</entry>
<entry [Mon 2014:11:03 01:36:06 EST] PYTHON DECORATORS USING @ SIGN>

https://wiki.python.org/moin/PythonDecorators

http://stackoverflow.com/questions/6392739/what-does-the-at-symbol-do-in-python

A decorator is the name used for a software design pattern. Decorators dynamically alter the functionality of a function, method, or class without having to directly use subclasses or change the source code of the function being decorated.


The "decorators" we talk about with concern to Python are not exactly the same thing as the DecoratorPattern described above. A Python decorator is a specific change to the Python syntax that allows us to more conveniently alter functions and methods (and possibly classes in a future version). This supports more readable applications of the DecoratorPattern but also other uses as well.


COMMON DECORATORS:

@property

@classmethod

@staticmethod
	

</entry>
<entry [Tue 2014:05:13 11:00:54 EST] REINSTALL BROKEN PYTHON 2.7>

1. REMOVE OLD PYTHON

sudo dpkg --force-all -P python2.7
   

2. REINSTALL
#sudo apt-get install python2.7

DOWNLOAD SOURCE

wget https://www.python.org/ftp/python/2.7.6/Python-2.7.6.tgz
tar xvfz Python-*
./configure --prefix=/usr
make

    ...    
    Python build finished, but the necessary bits to build these modules were not found:
    _bsddb             _sqlite3           _tkinter        
    bsddb185           bz2                dbm             
    dl                 gdbm               imageop         
    readline           sunaudiodev                        
    To find the necessary bits, look in setup.py in detect_modules() for the module's name.
    ...
    
make install

    OK


3. INSTALL setuptools

mkdir -p /home/ubuntu/software/python
cd /home/ubuntu/software/python
wget https://pypi.python.org/packages/source/s/setuptools/setuptools-3.6.tar.gz#md5=8f3a1dcdc14313c8334eb6af4f66ea0a
tar xvfz setuptools*
cd setuptools*
python setup.py install

    OK

    
4. INSTALL pip

cd /home/ubuntu/software/python
wget https://pypi.python.org/packages/source/p/pip/pip-1.5.5.tar.gz
# md5=7520581ba0687dec1ce85bd15496537b
tar xvfz pip*
cd pip*
python setup.py install

    OK



</entry>
<entry [Sun 2014:03:16 15:05:44 EST] FIXED ERROR: 'ImportError: No module named CommandNotFound'>

http://unix.stackexchange.com/questions/9580/why-is-this-python-error-message-generated-whenever-i-type-a-nonsense-command

PROBLEM

note
    Traceback (most recent call last):
      File "/usr/lib/command-not-found", line 27, in < module >
        from CommandNotFound.util import crash_guard
    ImportError: No module named 'CommandNotFound'


DIAGNOSIS

MESSED UP PYTHON INSTALLATION

which python
    /usr/bin/python

python
sys.path

    ['', '/usr/bin/lib/python2.7/site-packages/distribute-0.6.49-py2.7.egg', '/usr/bin/lib/python27.zip', '/usr/bin/lib/python2.7', '/usr/bin/lib/python2.7/plat-linux2', '/usr/bin/lib/python2.7/lib-tk', '/usr/bin/lib/python2.7/lib-old', '/usr/bin/lib/python2.7/lib-dynload', '/usr/bin/lib/python2.7/site-packages', '/usr/bin/lib/python2.7/site-packages/setuptools-0.6c11-py2.7.egg-info']
    
    
SOLUTION

ADD TO .bash_profile

unset -f command_not_found_handle
 
 
    
</entry>
<entry [Fri 2013:04:19 16:16:19 EST] INSTALL pip AND setuptools ON UBUNTU>


On Ubuntu:

sudo apt-get install python-pip git-core

On Debian:

sudo apt-get install python-setuptools git-core
sudo easy_install pip


On Windows: To install easy_install, run the MS Windows Installer for setuptools

easy_install pip
pip install pika==0.9.8


        
</entry>
<entry [Thu 2012:09:13 03:58:03 EST] STRING REPLACE>

        #master_ip = master.private_ip_address
        #log.info("sge.CreateCell.getHostname    master_ip: %s", master_ip)
        #hostname = "ip-" + string.replace(master_ip, '.', '-');
        #hostname += ".ec2.internal"
        #log.info("sge.CreateCell.getHostname    hostname: %s", hostname)
        #return hostname

    
</entry>
<entry [Fri 2012:09:07 01:38:35 EST] PIP REPLACES easy_install AND CAN UNINSTALL>

INSTALL PIP
easy_install pip

    Searching for pip
    Best match: pip 0.3.1
    Adding pip 0.3.1 to easy-install.pth file
    
    Using /usr/lib/python2.6/dist-packages
    Processing dependencies for pip
    Finished processing dependencies for pip

    

DOWNLOAD AND INSTALL PIP

mkdir -p /data/starcluster/pip
cd /data/starcluster/pip    
wget http://pypi.python.org/packages/source/p/pip/pip-0.7.2.tar.gz
tar xzf pip-0.7.2.tar.gz
cd pip-0.7.2
python setup.py install

    ...    
    Processing pip-0.7.2-py2.6.egg
    creating /usr/local/lib/python2.6/dist-packages/pip-0.7.2-py2.6.egg
    Extracting pip-0.7.2-py2.6.egg to /usr/local/lib/python2.6/dist-packages
    Adding pip 0.7.2 to easy-install.pth file
    Installing pip script to /usr/local/bin
    
    Installed /usr/local/lib/python2.6/dist-packages/pip-0.7.2-py2.6.egg
    Processing dependencies for pip==0.7.2
    Finished processing dependencies for pip==0.7.2

    
    
Pip Installs Python (Pip)
Pip is an installer for Python packages written by Ian Bicking. It can install packages, list installed packages, upgrade packages and uninstall packages.

The pip application is a replacement for easy_install. It uses mostly the same techniques for finding packages, so packages that were made easy_installable should be pip-installable as well.

See also Pip Documentation and Pip PyPI description
Note ??? Pip requirements
Installing Pip
The Pip installer can be installed using the source tarball or using easy_install. The source tarball is the recommended method of installation.

The latest version of the source tarball can be obtained from PyPI:

$ wget http://pypi.python.org/packages/source/p/pip/pip-0.7.2.tar.gz
$ tar xzf pip-0.7.2.tar.gz
$ cd pip-0.7.2
$ python setup.py install
Or the easy_install application can be used:

$ easy_install pip
The pip application is now installed.

Note pip is complementary with Virtual Environments, and it is encouraged that you use Virtual Environments to isolate your installation.
Installing a package
Let’s install the Markdown package:

$ pip install Markdown
Markdown is now installed; you can import and use it:

$ python -c "import markdown; print markdown.markdown('**Excellent**')"
Listing installed packages
To list installed packages and versions, use the freeze command:

$ pip freeze
Markdown==2.0.3
wsgiref==0.1.2

Note The wsgiref package is a part of the Python standard library. Currently it is the only standard library package that includes package metadata, so it is the only standard library package whose presence pip reports.
Installing specific versions
You can also give pip a version specifier for a package using one or more of ==, >=, >, <, <=:

<!--

$ pip install 'Markdown<2.0'

-->
This will find your current installation of Markdown 2.0.3, automatically uninstall it, and install Markdown 1.7 (the latest version in the 1.x series) in its place. You can even combine version specifiers with a comma:

<!--

$ pip install 'Markdown>2.0,<2.0.3'

-->

Upgrading
If you want to upgrade a package to its most recent available version, use the -U or --upgrade flag:

$ pip install -U Markdown
Uninstalling
Now let’s uninstall Markdown:

$ pip uninstall Markdown
After showing you which files/directories will be removed and requesting confirmation, pip will uninstall everything installed by the Markdown package.


Note Pip inside a Virtual Environment will only uninstall packages installed within that virtual environment. For instance, if you try to pip uninstall wsgiref it will refuse, because the reference is within the global Python’s standard library.

    
</entry>
<entry [Fri 2012:09:07 01:34:09 EST] UNINSTALL AN EGG>

TO UNINSTALL AN EGG

1. rm -rf the egg (it might be a directory)

2. remove the matching line from site-packages/easy-install.pth

    
</entry>
<entry [Sun 2012:03:18 01:19:15 EST] FindBin FOR PYTHON>


import os
import sys
bindir = os.path.abspath(os.path.dirname(sys.argv[0]))

OR

import os
bindir = os.path.abspath(os.path.dirname(__file__))


That will give you the absolute path of the current file's directory.
    
</entry>
<entry [Mon 2011:09:05 02:00:13 EST] DEBUGGING WITH ipython>

SUMMARY:

1. SUPPRESSED starcluster TRACEBACK IN logger.py

    import sys
    sys.tracebacklimit = 0

2. ADDED ERROR FILTER TO StarCluster.pm

	my $tail = `tail -$l
    ines $outputfile`;
	$tail =~ s/^(Traceback|ValueError)[^\n]+\n//msg;


DEBUG LOAD BALANCER

ipython -logfile /tmp/ipython.log
(OR %logstart)

%pdb

%run /data/starcluster/0.91-316/bin/starcluster -c /nethome/admin/.starcluster/syoung-smallcluster.config bal syoung-smallcluster -m 5 -n 1 -w 100 -s 30 -k 10 -i 10 

%run /data/starcluster/0.91-316/bin/starcluster -c /nethome/admin/.starcluster/syoung-smallcluster.config bal syoung-smallcluster -m 5 -n 1 -i 30 -w 100 -s 30 -k 10

RERUN LOGGED COMMANDS TO RETURN TO STATE

ipython -logplay shell



cd /nethome/admin/.starcluster/plugins

/data/starcluster/0.91-316/bin/starcluster \
-c /nethome/admin/.starcluster/syoung-smallcluster.config \
bal syoung-smallcluster \
-m 5 -n 1 -i 30 -w 100 -s 30 -k 10 \
shell


# CONFIRM cfg OBJECT HAS PLUGIN INFO:
cfg.get_plugin('sge')

clus = cluster.ClusterManager(cfg)
#cluster.ClusterManager.run_plugin(clus, 'automount', 'smallcluster')
clus.add_node("syoung-smallcluster")



An introductory tutorial about IPython
http://onlamp.com/pub/a/python/2005/01/27/ipython.html

Introspection
Python has several built-in functions that facilitate introspection. IPython has access to all of the standard Python functions as well as some extras built into the shell.

A typical introspective technique with the standard Python shell is using the built-in dir() function:

<!--

>>> import SimpleXMLRPCServer
>>> dir(SimpleXMLRPCServer.SimpleXMLRPCServer)
['__doc__', '__init__', '__module__', '_dispatch',
'_marshaled_dispatch', 'address_family', 'allow_reuse_address',
'close_request', 'fileno', 'finish_request', 'get_request',
'handle_error', 'handle_request', 'process_request',
'register_function', 'register_instance',
'register_introspection_functions', 'register_multicall_functions',
'request_queue_size', 'serve_forever', 'server_activate', 'server_bind',
'server_close', 'socket_type', 'system_listMethods',
'system_methodHelp', 'system_methodSignature', 'system_multicall',
'verify_request']

Well, that's nice. Very helpful, in fact. I have done just that for years now and have been very pleased with it. This is a nice list of all of SimpleXMLRPCServer.SimpleXMLRPCServer's methods, classes, modules, and so on. Because dir() is a built-in function, IPython can do the same thing, but its ? and ?? operators are more powerful:

In [1]: import SimpleXMLRPCServer

In [2]: ? SimpleXMLRPCServer.SimpleXMLRPCServer
Type:           classobj
String Form:    SimpleXMLRPCServer.SimpleXMLRPCServer
Namespace:      Interactive
File:           /usr/local/python24/lib/python2.4/SimpleXMLRPCServer.py
Docstring:
    Simple XML-RPC server.

    Simple XML-RPC server that allows functions and a single instance
    to be installed to handle requests. The default implementation
    attempts to dispatch XML-RPC calls to the functions or instance
    installed in the server. Override the _dispatch method inherited
    from SimpleXMLRPCDispatcher to change this behavior.

Constructor information:
Definition:     SimpleXMLRPCServer.SimpleXMLRPCServer(self, addr, 
                     requestHandler=<class
				SimpleXMLRPCServer.SimpleXMLRPCRequestHandler at 
				     0xf6b2c5cc>, logRequests=1)
                     
If long strings are present, the ? operator will trim them. The ?? will not trim long strings, and it will display syntax highlighted source code if the source is available.

-->

http://ipython.org/ipython-doc/dev/interactive/tutorial.html

Tab completion

TAB-completion, especially for attributes, is a convenient way to explore the structure of any object you’re dealing with. Simply type object_name.< TAB> and a list of the object’s attributes will be printed (see the readline section for more). Tab completion also works on file and directory names, which combined with IPython’s alias system allows you to do from within IPython many of the things you normally would need the system shell for.

Explore your objects

object_name?:
print all sorts of details about any object, including docstrings, function definition lines (for call arguments) and constructor details for classes.

The magic commands %pdoc, %pdef, %psource and %pfile will respectively print the docstring, function definition line, full source code and the complete file for any object (when they can be found). If automagic is on (it is by default), you don’t need to type the ‘%’ explicitly. See this section for more.


run:
run any python script and load all of its data directly into the interactive namespace. Since the file is re-read from disk each time, changes you make to it are reflected immediately (in contrast to the behavior of import). I rarely use import for code I am testing, relying on %run instead. See this section for more on this and other magic commands, or type the name of any magic command and ? to get details on it. See also this section for a recursive reload command. %run also has special flags for timing the execution of your scripts (-t) and for executing them under the control of either Python’s pdb debugger (-d) or profiler (-p). With all of these, %run can be used as the main tool for efficient interactive development of code which you write in your editor of choice.


pdb:
toggle on and off the automatic invocation of an IPython-enhanced pdb debugger (with coloring, tab completion and more) at any uncaught exception.

The advantage of this is that pdb starts inside the function where the exception occurred, with all data still available. You can print variables, see code, execute statements and even walk up and down the call stack to track down the true source of the problem (which often is many layers in the stack above where the exception gets triggered). Running programs with %run and pdb active can be an efficient to develop and debug code, in many cases eliminating the need for print statements or external debugging tools. I often simply put a 1/0 in a place where I want to take a look so that pdb gets called, quickly view whatever variables I need to or test various pieces of code and then remove the 1/0. Note also that ‘%run -d’ activates pdb and automatically sets initial breakpoints for you to step through your code, watch variables, etc. The output caching section has more details.

Use the output cache

All output results are automatically stored in a global dictionary named Out and variables named _1, _2, etc. alias them. For example, the result of input line 4 is available either as Out[4] or as _4.

_, __ and ___ : the last three results. This allows you to recall any previous result and further use it for new calculations. See the output caching section for more.

Suppress output
Put a ‘;’ at the end of a line to suppress the printing of output.


Input cache
A similar system exists for caching input. All input is stored in a global list called In , so you can re-execute lines 22 through 28 plus line 34 by typing ‘exec In[22:29]+In[34]’ (using Python slicing notation). If you need to execute the same set of lines often, you can assign them to a macro with the %macro function. See here for more.

hist:
show all previous input, without line numbers if desired (option -n) so you can directly copy and paste code either back in IPython or in a text editor. You can also save all your history by turning on logging via %logstart; these logs can later be either reloaded as IPython sessions or used as code for your programs.

rep:
repeat a command or get a command to the input line for further editing:

$ l = ["hei", "vaan"]
$ "".join(l)
==> heivaan
$ %rep
$ heivaan_ < == cursor blinking
For more details, type %rep? as usual.


    
</entry>

<entry [Sun 2011:09:04 08:52:43 EST] GET OUTPUT FROM SYSTEM COMMAND WITH p.open>


p = os.popen('env')
print p.read()

    
</entry>
<entry [Mon 2011:08:29 01:47:16 EST] CREATE LOCAL EXECUTABLES FOR MULTIPLE VERSIONS OF STARCLUSTER>

1. CREATED NEW /data/starcluster/0.92.rc2/bin/starcluster

2. CREATED NEW /data/starcluster/0.92.rc1/bin/starcluster

PROBLEM: EXECUTABLE CREATED BY easy_install POINTS TO 0.92.rc2 BUT IS IN /usr/local/bin (I.E., APPLICATION IS NOT CONFINED TO /data DIR):

cat /usr/local/bin/starcluster 

    #!/usr/bin/python
    # EASY-INSTALL-DEV-SCRIPT: 'StarCluster==0.92rc2','starcluster'
    __requires__ = 'StarCluster==0.92rc2'
    from pkg_resources import require; require('StarCluster==0.92rc2')
    del require
    __file__ = '/data/starcluster/0.92.rc2/bin/starcluster'
    execfile(__file__)


BUT EXECUTABLE IN LOCAL INSTALLATION DOES NOT WORK:

cat /data/starcluster/0.92.rc2/bin/starcluster

    #!/usr/bin/python
    # EASY-INSTALL-DEV-SCRIPT: 'StarCluster==0.92rc2','starcluster'
    __requires__ = 'StarCluster==0.92rc2'
    from pkg_resources import require; require('StarCluster==0.92rc2')
    del require
    __file__ = '/data/starcluster/0.92.rc2/bin/starcluster'
    execfile(__file__)

/data/starcluster/0.92.rc1/bin/starcluster -c /nethome/admin/.starcluster/syoung-microcluster.config start syoung-microcluster
    FAILS


SOLUTION: MERGE THE TWO AND REPLACE EXECUTABLE IN LOCAL DISTRIBUTION

cd /data/starcluster/0.92.rc2/bin
mv starcluster starcluster.bkp.no-import
mv starcluster starcluster.bkp.no-import
/usr/local/bin/starcluster.0.92.rc2
starcluster.0.92.rc2

cat /data/starcluster/0.92.rc2/bin/starcluster

    #!/usr/bin/python
    # EASY-INSTALL-DEV-SCRIPT: 'StarCluster==0.92rc2','starcluster'
    __requires__ = 'StarCluster==0.92rc2'
    from pkg_resources import require; require('StarCluster==0.92rc2')
    del require
    ####__file__ = '/data/starcluster/0.92.rc2/bin/starcluster'
    ####execfile(__file__)
    
    from starcluster import cli
    
    if __name__ == '__main__':
        try:
            cli.main()
        except KeyboardInterrupt:
            print "Interrupted, exiting."




2. INSTALLED VERSION 0.92.rc1 TO EXECUTABLE /usr/local/bin/starcluster.0.92.rc1


#### NB: MUST MOVE INTO UNZIPPED DIR TO AVOID easy_install TRYING TO DOWNLOAD 0.92rc2
cd /data/starcluster/0.92.rc1
easy_install -m StarCluster==0.92rc1

    Searching for StarCluster==0.92rc1
    Best match: StarCluster 0.92rc1
    
    Using /data/starcluster/0.92.rc1
    
    Because this distribution was installed --multi-version, before you can
    import modules from this package in an application, you will need to
    'import pkg_resources' and then use a 'require()' call similar to one of
    these examples, in order to select the desired version:
    
        pkg_resources.require("StarCluster")  # latest installed version
        pkg_resources.require("StarCluster==0.92rc1")  # this exact version
        pkg_resources.require("StarCluster>=0.92rc1")  # this version or higher
    
    Processing dependencies for StarCluster==0.92rc1
    Finished processing dependencies for StarCluster==0.92rc1



NEW EXECUTABLE POINTS TO 0.92.rc1 EXECUTABLE IN bin DIRECTORY OF DISTRIBUTION:

cat /usr/local/bin/starcluster 

    #!/usr/bin/python
    # EASY-INSTALL-DEV-SCRIPT: 'StarCluster==0.92rc1','starcluster'
    __requires__ = 'StarCluster==0.92rc1'
    from pkg_resources import require; require('StarCluster==0.92rc1')
    del require
    __file__ = '/data/starcluster/0.92.rc1/bin/starcluster'
    execfile(__file__)


MERGE WITH EXECUTABLE IN bin DIRECTORY OF DISTRIBUTION:

mv /data/starcluster/0.92.rc1/bin/starcluster /data/starcluster/0.92.rc1/bin/starcluster-original
cat /data/starcluster/0.92.rc1/bin/starcluster.original

    #!/usr/bin/env python
    from starcluster import cli
    
    if __name__ == '__main__':
        try:
            cli.main()
        except KeyboardInterrupt:
            print "Interrupted, exiting."


TO CREATE:

em /data/starcluster/0.92.rc1/bin/starcluster

    #!/usr/bin/python
    # EASY-INSTALL-DEV-SCRIPT: 'StarCluster==0.92rc1','starcluster'
    __requires__ = 'StarCluster==0.92rc1'
    from pkg_resources import require; require('StarCluster==0.92rc1')
    del require
    #__file__ = '/data/starcluster/0.92.rc1/bin/starcluster'
    #execfile(__file__)

    from starcluster import cli
    
    if __name__ == '__main__':
        try:
            cli.main()
        except KeyboardInterrupt:
            print "Interrupted, exiting."


/data/starcluster/0.92.rc1/bin/starcluster --help
    
    OK
    

NB: CAN RUN THE LAST INSTALLED VERSION (0.92.rc1) BUT NOT THE FIRST INSTALLED (0.92.rc2):

0.92.rc1
--------
starcluster.0.92.rc1 -c /nethome/admin/.starcluster/syoung-microcluster.config start syoung-microcluster
StarCluster - (http://web.mit.edu/starcluster) (v. 0.92rc1)
Software Tools for Academics and Researchers (STAR)
Please submit bug reports to starcluster@mit.edu

>>> 0.92.rc1    config.__init__    caller: parse_subcommands, module: /data/starcluster/0.92.rc1/starcluster/cli.py
>>> 0.92.rc1    config.__init__    config_file: /nethome/admin/.starcluster/syoung-microcluster.config
>>> 0.92.rc1    config.__init__    self.cfg_file: /nethome/admin/.starcluster/syoung-microcluster.config
>>> 0.92.rc1    config.__init__    caller: addopts, module: /data/starcluster/0.92.rc1/starcluster/commands/start.py
>>> 0.92.rc1    config.__init__    config_file: None
>>> 0.92.rc1    config.__init__    self.cfg_file: /root/.starcluster/config
>>> Using default cluster template: syoung-microcluster




0.92.rc2
--------
starcluster.0.92.rc2 -c /nethome/admin/.starcluster/syoung-microcluster.config start syoung-microcluster
Traceback (most recent call last):
  File "/usr/local/bin/starcluster.0.92.rc2", line 4, in < module>
    from pkg_resources import require; require('StarCluster==0.92rc2')
  File "/usr/lib/python2.6/dist-packages/pkg_resources.py", line 2655, in < module>
    working_set.require(__requires__)
  File "/usr/lib/python2.6/dist-packages/pkg_resources.py", line 648, in require
    needed = self.resolve(parse_requirements(requirements))
  File "/usr/lib/python2.6/dist-packages/pkg_resources.py", line 546, in resolve
    raise DistributionNotFound(req)
pkg_resources.DistributionNotFound: StarCluster==0.92rc2





    
</entry>
<entry [Fri 2011:08:26 05:11:49 EST] 'DEVELOP' INSTALLATION OF STARCLUSTER 0.92.rc2>

THE PROBLEM WITH THE develop OPTION:

    1. IT STILL RELIES UPON THE PATH TO THE INSTALLED APPLICATION BEING WRITTEN TO THE sys.path INSIDE THE site-packages DIRECTORY.
develop 
    2. BECAUSE OF THIS, THERE CAN BE NO MULTI-VERSIONING (EXCEPT USING MULTIPLE PYTHONS

SUMMARY:

'develop' installs a package without moving it into 'site-packages/'

INSTEAD, A LINK IS CREATED FROM THE ./setup.py DIRECTORY TO 'PACKAGENAME.egg-link'

DEVELOP ADDS AN ENTRY INTO 'easy-install.pth' POINTING TO THE LOCAL PACKAGE DIRECTORY 

WITH DEVELOP, Python finds '.pth' files in 'site-packages' and adds their contents to 'sys.path'

NB: CAN USE --exclude-scripts ARGUMENT TO SKIP INSTALLING SCRIPTS, I.E, /usr/local/bin/starcluster

    python setup.py develop --exclude-scripts 



'DEVELOP' INSTALLATION OF 0.92.rc2

cd /data/starcluster/0.92.rc2
python setup.py develop

    running develop
    running egg_info
    creating StarCluster.egg-info
    writing requirements to StarCluster.egg-info/requires.txt
    writing StarCluster.egg-info/PKG-INFO
    writing top-level names to StarCluster.egg-info/top_level.txt
    writing dependency_links to StarCluster.egg-info/dependency_links.txt
    writing manifest file 'StarCluster.egg-info/SOURCES.txt'
    reading manifest file 'StarCluster.egg-info/SOURCES.txt'
    reading manifest template 'MANIFEST.in'
    writing manifest file 'StarCluster.egg-info/SOURCES.txt'
    running build_ext
    Creating /usr/local/lib/python2.6/dist-packages/StarCluster.egg-link (link to .)
    Adding StarCluster 0.92rc2 to easy-install.pth file
    Installing starcluster script to /usr/local/bin
    
    Installed /data/starcluster/0.92.rc2
    Processing dependencies for StarCluster==0.92rc2
    Searching for paramiko==1.7.7.1
    Reading http://pypi.python.org/simple/paramiko/
    Reading http://www.lag.net/~robey/paramiko/
    Reading http://www.lag.net/paramiko/
    Best match: paramiko 1.7.7.1
    Downloading http://www.lag.net/paramiko/download/paramiko-1.7.7.1.zip
    Processing paramiko-1.7.7.1.zip
    Running paramiko-1.7.7.1/setup.py -q bdist_egg --dist-dir /tmp/easy_install-1364gm/paramiko-1.7.7.1/egg-dist-tmp-QfZild
    zip_safe flag not set; analyzing archive contents...
    Removing paramiko 1.7.6 from easy-install.pth file
    Adding paramiko 1.7.7.1 to easy-install.pth file
    
    Installed /usr/local/lib/python2.6/dist-packages/paramiko-1.7.7.1-py2.6.egg
    Searching for workerpool==0.9.2
    Best match: workerpool 0.9.2
    Processing workerpool-0.9.2-py2.6.egg
    workerpool 0.9.2 is already the active version in easy-install.pth
    
    Using /usr/local/lib/python2.6/dist-packages/workerpool-0.9.2-py2.6.egg
    Searching for boto==2.0b4
    Best match: boto 2.0b4
    Processing boto-2.0b4-py2.6.egg
    boto 2.0b4 is already the active version in easy-install.pth
    Installing bundle_image script to /usr/local/bin
    Installing sdbadmin script to /usr/local/bin
    Installing lss3 script to /usr/local/bin
    Installing route53 script to /usr/local/bin
    Installing s3put script to /usr/local/bin
    Installing fetch_file script to /usr/local/bin
    Installing kill_instance script to /usr/local/bin
    Installing pyami_sendmail script to /usr/local/bin
    Installing list_instances script to /usr/local/bin
    Installing taskadmin script to /usr/local/bin
    Installing cq script to /usr/local/bin
    Installing launch_instance script to /usr/local/bin
    Installing elbadmin script to /usr/local/bin
    Installing cfadmin script to /usr/local/bin
    
    Using /usr/local/lib/python2.6/dist-packages/boto-2.0b4-py2.6.egg
    Searching for pycrypto==2.3
    Best match: pycrypto 2.3
    Processing pycrypto-2.3-py2.6-linux-x86_64.egg
    pycrypto 2.3 is already the active version in easy-install.pth
    
    Using /usr/local/lib/python2.6/dist-packages/pycrypto-2.3-py2.6-linux-x86_64.egg
    Finished processing dependencies for StarCluster==0.92rc2

running develop
running egg_info
creating StarCluster.egg-info
writing requirements to StarCluster.egg-info/requires.txt
writing StarCluster.egg-info/PKG-INFO
writing top-level names to StarCluster.egg-info/top_level.txt
writing dependency_links to StarCluster.egg-info/dependency_links.txt
writing manifest file 'StarCluster.egg-info/SOURCES.txt'
reading manifest file 'StarCluster.egg-info/SOURCES.txt'
reading manifest template 'MANIFEST.in'
writing manifest file 'StarCluster.egg-info/SOURCES.txt'
running build_ext
Creating /usr/local/lib/python2.6/dist-packages/StarCluster.egg-link (link to .)
Adding StarCluster 0.92rc1 to easy-install.pth file
Installing starcluster script to /usr/local/bin

Installed /data/starcluster/0.92.rc1
Processing dependencies for StarCluster==0.92rc1
Searching for workerpool==0.9.2
Best match: workerpool 0.9.2
Processing workerpool-0.9.2-py2.6.egg
workerpool 0.9.2 is already the active version in easy-install.pth

Using /usr/local/lib/python2.6/dist-packages/workerpool-0.9.2-py2.6.egg
Searching for boto==2.0b4
Best match: boto 2.0b4
Processing boto-2.0b4-py2.6.egg
boto 2.0b4 is already the active version in easy-install.pth
Installing bundle_image script to /usr/local/bin
Installing sdbadmin script to /usr/local/bin
Installing lss3 script to /usr/local/bin
Installing route53 script to /usr/local/bin
Installing s3put script to /usr/local/bin
Installing fetch_file script to /usr/local/bin
Installing kill_instance script to /usr/local/bin
Installing pyami_sendmail script to /usr/local/bin
Installing list_instances script to /usr/local/bin
Installing taskadmin script to /usr/local/bin
Installing cq script to /usr/local/bin
Installing launch_instance script to /usr/local/bin
Installing elbadmin script to /usr/local/bin
Installing cfadmin script to /usr/local/bin

Using /usr/local/lib/python2.6/dist-packages/boto-2.0b4-py2.6.egg
Searching for paramiko==1.7.7.1
Best match: paramiko 1.7.7.1
Processing paramiko-1.7.7.1-py2.6.egg
paramiko 1.7.7.1 is already the active version in easy-install.pth

Using /usr/local/lib/python2.6/dist-packages/paramiko-1.7.7.1-py2.6.egg
Searching for pycrypto==2.3
Best match: pycrypto 2.3
Processing pycrypto-2.3-py2.6-linux-x86_64.egg
pycrypto 2.3 is already the active version in easy-install.pth

Using /usr/local/lib/python2.6/dist-packages/pycrypto-2.3-py2.6-linux-x86_64.egg
Finished processing dependencies for StarCluster==0.92rc1


cat /usr/local/bin/starcluster

    #!/usr/bin/python
    # EASY-INSTALL-DEV-SCRIPT: 'StarCluster==0.92rc1','starcluster'
    __requires__ = 'StarCluster==0.92rc1'
    from pkg_resources import require; require('StarCluster==0.92rc1')
    del require
    __file__ = '/data/starcluster/0.92.rc1/bin/starcluster'
    execfile(__file__)


    
</entry>
<entry [Fri 2011:08:26 03:22:02 EST] MULTIPLE VERSIONS OF STARCLUSTER, LATEST VERSION: 0.92.rc2>

**** LATEST VERSION IS INSTALLED: 0.92.rc2 **** 

cd /data/starcluster/0.92rc2/
sudo python setup.py develop --multi-version




NB: PYTHON DOCUMENTATION ON THIS IS NOT VERY COHERENT PROBABLY DUE TO IT BEING OUT-OF-DATE

AIM:

1. INSTALL DIFFERENT VERSIONS OF STARCLUSTER USING 'setup.py develop --multi-version'

2. ALLOW DIFFERENT VERSIONS TO BE CALLED USING DIFFERENT EXECUTABLES



METHOD:

1. USE sudo python setup.py develop --multi-version

2. CHANGE ACTIVE VERSION BY RERUNNING sudo python setup.py develop --multi-version

THIS WILL INSTALL A LOCAL DISTRIBUTION WHICH CAN BE EDITED BUT CANNOT BE RUNNABLE CONCURRENTLY WITH ANOTHER VERSION, I.E., THE ONE INSTALLED LAST WORKS:

cd /data/starcluster/0.92rc1/bin
./starcluster -c /nethome/admin/.starcluster/syoung-microcluster.config listclusters

    -------------------------------------------------------------
    syoung-microcluster (security group: @sc-syoung-microcluster)
    -------------------------------------------------------------
    Launch time: 2011-08-27 04:59:16
    Uptime: 04:18:37
    Zone: us-east-1a
    Keypair: id_rsa-admin-key
    EBS volumes: N/A
    Cluster nodes:
         master running i-d94f46b8 ec2-184-73-37-171.compute-1.amazonaws.com
    Total nodes: 1


... AND THE OTHER GIVES THIS ERROR:

cd /data/starcluster/0.92rc2/bin
./starcluster -c /nethome/admin/.starcluster/syoung-microcluster.config listclusters

    Traceback (most recent call last):
      File "./starcluster", line 4, in < module>
        from pkg_resources import require; require('StarCluster==0.92rc2')
      File "/usr/lib/python2.6/dist-packages/pkg_resources.py", line 2655, in < module>
        working_set.require(__requires__)
      File "/usr/lib/python2.6/dist-packages/pkg_resources.py", line 648, in require
        needed = self.resolve(parse_requirements(requirements))
      File "/usr/lib/python2.6/dist-packages/pkg_resources.py", line 546, in resolve
        raise DistributionNotFound(req)
    pkg_resources.DistributionNotFound: StarCluster==0.92rc2




1. INSTALLED VERSION 0.92.rc2

cd /data/starcluster/0.92rc2/
sudo python setup.py develop --multi-version

easy_install -m StarCluster==0.92rc2

    easy_install -m StarCluster==0.92rc2
    Searching for StarCluster==0.92rc2
    Reading http://pypi.python.org/simple/StarCluster/
    Reading http://web.mit.edu/starcluster
    Best match: StarCluster 0.92rc2
    Downloading http://pypi.python.org/packages/source/S/StarCluster/StarCluster-0.92rc2.tar.gz#md5=982e6525502def9ee1bc9335d67cde7d
    Processing StarCluster-0.92rc2.tar.gz
    Running StarCluster-0.92rc2/setup.py -q bdist_egg --dist-dir /tmp/easy_install-mnmRGr/StarCluster-0.92rc2/egg-dist-tmp-Uob9Q7
    Installing starcluster script to /usr/local/bin
    
    Installed /usr/local/lib/python2.6/dist-packages/StarCluster-0.92rc2-py2.6.egg
    
    Because this distribution was installed --multi-version, before you can
    import modules from this package in an application, you will need to
    'import pkg_resources' and then use a 'require()' call similar to one of
    these examples, in order to select the desired version:
    
        pkg_resources.require("StarCluster")  # latest installed version
        pkg_resources.require("StarCluster==0.92rc2")  # this exact version
        pkg_resources.require("StarCluster>=0.92rc2")  # this version or higher
    lLGPL
    Processing dependencies for StarCluster==0.92rc2
    Finished processing dependencies for StarCluster==0.92rc2


NB: DOESN'T WORK USING --allow-hosts=None

cd /data/starcluster/0.92rc2
easy_install  --allow-hosts=None --multi-version StarCluster==0.92rc2

    Searching for StarCluster==0.92rc2
    
    Link to http://pypi.python.org/simple/StarCluster/ ***BLOCKED*** by --allow-hosts
    
    Couldn't retrieve index page for 'StarCluster'
    Scanning index of all packages (this may take a while)
    
    Link to http://pypi.python.org/simple/ ***BLOCKED*** by --allow-hosts
    
    No local packages or download links found for StarCluster==0.92rc2
    error: Could not find suitable distribution for Requirement.parse('StarCluster==0.92rc2')




# NB: PREVIOUS INSTALLATION USED THE LOCAL DIRECTORY INSTEAD OF THE DOWNLOAD (NNB: VERSION USED WAS 0.92.rc2 RATHER THAN CURRENTLY USED 0.92rc2)
#
#    Searching for StarCluster==0.92.rc2
#    Best match: StarCluster 0.92rc2
#    Removing StarCluster 0.92rc2 from easy-install.pth file
#    
#    Using /data/starcluster/0.92.rc2
#    
#    Because this distribution was installed --multi-version, before you can
#    import modules from this package in an application, you will need to
#    'import pkg_resources' and then use a 'require()' call similar to one of
#    these examples, in order to select the desired version:
#    
#        pkg_resources.require("StarCluster")  # latest installed version
#        pkg_resources.require("StarCluster==0.92rc2")  # this exact version
#        pkg_resources.require("StarCluster>=0.92rc2")  # this version or higher
#    
#    Processing dependencies for StarCluster==0.92.rc2
#    Finished processing dependencies for StarCluster==0.92.rc2
#



2. INSTALLED VERSION 0.92.rc1


cd /data/starcluster/0.92rc1/
sudo python setup.py develop --multi-version

FULL INSTALL OUTPUT HERE:
/home/syoung/notes/apps/starcluster/starcluster-0.92rc1-develop-install

EXCERPT IS HERE:

    sudo: unable to resolve host domU-12-31-38-07-1A-E1
    running develop
    running egg_info
    writing requirements to StarCluster.egg-info/requires.txt
    writing StarCluster.egg-info/PKG-INFO
    writing top-level names to StarCluster.egg-info/top_level.txt
    writing dependency_links to StarCluster.egg-info/dependency_links.txt
    reading manifest file 'StarCluster.egg-info/SOURCES.txt'
    reading manifest template 'MANIFEST.in'
    writing manifest file 'StarCluster.egg-info/SOURCES.txt'
    running build_ext
    Creating /usr/local/lib/python2.6/dist-packages/StarCluster.egg-link (link to .)
    Installing starcluster script to /usr/local/bin
    
    Installed /data/starcluster/0.92rc1
    
    Because this distribution was installed --multi-version, before you can
    import modules from this package in an application, you will need to
    'import pkg_resources' and then use a 'require()' call similar to one of
    these examples, in order to select the desired version:
    
        pkg_resources.require("StarCluster")  # latest installed version
        pkg_resources.require("StarCluster==0.92rc1")  # this exact version
        pkg_resources.require("StarCluster>=0.92rc1")  # this version or higher
    
    Processing dependencies for StarCluster==0.92rc1
    Searching for workerpool==0.9.2
    Best match: workerpool 0.9.2
    Processing workerpool-0.9.2-py2.6.egg
    Removing workerpool 0.9.2 from easy-install.pth file
    
    Using /usr/local/lib/python2.6/dist-packages/workerpool-0.9.2-py2.6.egg
    
    Because this distribution was installed --multi-version, before you can
    import modules from this package in an application, you will need to
    'import pkg_resources' and then use a 'require()' call similar to one of
    these examples, in order to select the desired version:




NOTES
------


http://svn.colorstudy.com/home/ianb/setuptools-presentation/setuptools-slides.txt

Installing in Isolation
=======================

Use "multi-version"::

    $ sudo python setup.py easy_install --multi-version

* **Does not** add the package to ``sys.path``

* You must ``require`` the specific version; more on that later

* Doesn't effect anyone else on the machine (as long as you are using
  good version numbers)


  
USING --multi-version REMOVES STARCLUSTER FROM easy-install.pth FILE:

cat /usr/local/lib/python2.6/dist-packages/easy-install.pth 

    import sys; sys.__plen = len(sys.path)
    ./drmaa-0.4b3-py2.6.egg
    ./dumbo-0.21.29-py2.6.egg
    ./typedbytes-0.3.6-py2.6.egg
    ./ctypedbytes-0.1.6-py2.6-linux-x86_64.egg
    ./workerpool-0.9.2-py2.6.egg
    ./boto-2.0b4-py2.6.egg
    ./pycrypto-2.3-py2.6-linux-x86_64.egg
    ./pythonbrew-1.0-py2.6.egg
    ./paramiko-1.7.7.1-py2.6.egg
    import sys; new=sys.path[sys.__plen:]; del sys.path[sys.__plen:]; p=getattr(sys,'__egginsert',0); sys.path[p:p]=new; sys.__egginsert = p+len(new)


SO THE LOCAL INSTALLATION IS USED:

/data/starcluster/0.92.rc2


AND THE INSTALLATION IN THE PYTHON PACKAGES DIR IS SIMPLY A LINK TO THE LOCAL INSTALLATION:

/usr/local/lib/python2.6/dist-packages/StarCluster-0.9999-py2.6.egg


AND YOU CAN MAKE VERSION-SPECIFIC EXECUTABLES:

http://packages.python.org/distribute/easy_install.html

EasyInstall’s default behavior means that you can normally only run scripts from one version of a package at a time. If you want to keep multiple versions of a script available, however, you can simply use the --multi-version or -m option, and rename the scripts that EasyInstall creates. This works because EasyInstall installs scripts as short code stubs that require() the matching version of the package the script came from, so renaming the script has no effect on what it executes.

For example, suppose you want to use two versions of the rst2html tool provided by the docutils package. You might first install one version:
em 
easy_install -m docutils==0.3.9

then rename the rst2html.py to r2h_039, and install another version:

easy_install -m docutils==0.3.10

This will create another rst2html.py script, this one using docutils version 0.3.10 instead of 0.3.9.

You now have two scripts, each using a different version of the package. (Notice that we used -m for both installations, so that Python won’t lock us out of using anything but the most recently-installed version of the package.)


    
</entry>
<entry [Fri 2011:08:26 03:05:40 EST] INSTALLED PYTHONBREW TO USE MULTIPLE PYTHON VERSIONS>


1. INSTALLED PYTHON BREW

sudo easy_install pythonbrew
    Searching for pythonbrew
    Reading http://pypi.python.org/simple/pythonbrew/
    Reading https://github.com/utahta/pythonbrew
    Best match: pythonbrew 1.0
    Downloading http://pypi.python.org/packages/source/p/pythonbrew/pythonbrew-1.0.tar.gz#md5=202951bccccaf722a1e75fc3f5f3f387
    Processing pythonbrew-1.0.tar.gz
    Running pythonbrew-1.0/setup.py -q bdist_egg --dist-dir /tmp/easy_install-k6bZwG/pythonbrew-1.0/egg-dist-tmp-FEW6nZ
    Adding pythonbrew 1.0 to easy-install.pth file
    Installing pythonbrew_install script to /usr/local/bin
    
    Installed /usr/local/lib/python2.6/dist-packages/pythonbrew-1.0-py2.6.egg
    Processing dependencies for pythonbrew

pythonbrew_install

    Well-done! Congratulations!
    
    The pythonbrew is installed as:
        
      /root/.pythonbrew
    
    Please add the following line to the end of your ~/.bashrc
    
      source /root/.pythonbrew/etc/bashrc
    
    After that, exit this shell, start a new one, and install some fresh
    pythons:
    
      pythonbrew install 2.7.2
      pythonbrew install 3.2
    
    For further instructions, run:
    
      pythonbrew help
    
    The default help messages will popup and tell you what to do!
    
    Enjoy pythonbrew at /root/.pythonbrew!!


2. ADDED PYTHONBREW PATH TO .bash_profile

source /root/.pythonbrew/etc/bashrc



3. INSTALLED PYTHON 2.6.6 (CURRENT VERSION IS 2.6.5)

pythonbrew install 2.6.6

    ERROR: Failed to install Python-2.6.6. See /root/.pythonbrew/log/build.log


cat /root/.pythonbrew/log/build.log

    ...
    NFO: Can't locate Tcl/Tk libs and/or headers
    
    Failed to find the necessary bits to build these modules:
    _bsddb             _curses            _curses_panel
    _tkinter           bsddb185           bz2
    dbm                dl                 gdbm
    imageop            readline           sunaudiodev
    To find the necessary bits, look in setup.py in detect_modules() for the mod\
    ule's name.
    ...
    
    
SO SKIPPED THIS IN FAVOUR OF USING 'easy_install --multi-version' (SEE ABOVE)


4. LIST OF PYTHONBREW COMMANDS

check or list the installed Python versions
pythonbrew list

check or list the available Python Versions to install
pythonbrew list -k

Uninstall any of the installed Python version (for example to uninstall Python 2.7)
pythonbrew uninstall 2.7

Update the Pythonbrew
pythonbrew update


Disable the Pythonbrew and activate the default version
pythonbrew off


    
</entry>
<entry [Mon 2011:06:20 05:28:36 EST] SUPPRESS TRACEBACK ERROR INFO>

http://effbot.org/pyref/sys.tracebacklimit.htm

USED IN starcluster/logger.py TO SUPPRESS TRACEBACK BUT LEAVE ERROR:


    def format(self, record):
        #log.info("ConsoleLogger.format    ConsoleLogger.format(self, record)")
        ## CAN'T SHOW record OBJECT - TOO MUCH RECURSION

        import sys
        sys.tracebacklimit = 0


sys.tracebacklimit
tracebacklimit

When this variable is set to an integer value, it determines the maximum number of levels of traceback information printed when an unhandled exception occurs. The default is 1000. When set to 0 or less, all traceback information is suppressed and only the exception type and value are printed.
    
</entry>

<entry [Mon 2011:06:20 02:26:49 EST] GET CALLER WITH inspect.stack>

11 January, 2007 - 15:22

Categories: programming python

With the python module inspect, one can inspect (no kidding) the run-time python stack. Among other things, this makes it possible to get the name of the current function or callers. Handy for logging or debugging purposes. A simple script to illustrate:

import inspect
# functions
def whoami():
    return inspect.stack()[1][3]
def whosdaddy():
    return inspect.stack()[2][3]
def foo():
    print "hello, I'm %s, daddy is %s" % (whoami(), whosdaddy())
    bar()
def bar():
    print "hello, I'm %s, daddy is %s" % (whoami(), whosdaddy())
johny = bar
# call them!
foo()
bar()
johny()
output:

hello, I'm foo, daddy is ?
hello, I'm bar, daddy is foo
hello, I'm bar, daddy is ?
hello, I'm bar, daddy is ?
How does it work?

inspect.stack() returns a list with frame records.

In function whoami(): inspect.stack()[1] is the frame record of the function that calls whoami, like foo() and bar().
The fourth element of the frame record (inspect.stack()[1][3]) is the function name.
The rest should be obvious (check the python docs on inspect for more information), except that johny() thinks he's function bar(). That's because johny actually just points to the code of bar() and the function name bar is associated with the code and not with the variables.

    
</entry>
<entry [Mon 2011:06:20 00:28:04 EST] PRINT OBJECT CONTENTS IN ipython SHELL>

Explore your objects

object_name?

will print all sorts of details about any object, including docstrings, function definition lines (for call arguments) and constructor details for classes.

The magic commands %pdoc, %pdef, %psource and %pfile will respectively print the docstring, function definition line, full source code and the complete file for any object (when they can be found).

If automagic is on (it is by default), you don’t need to type the ‘%’ explicitly. See this section for more.


    
</entry>
<entry [Sun 2011:05:15 23:42:23 EST] CAST int TO string>
print int("42"), str(42)         # convert from/to string

print "spam" + str(42)         # force concatenation
    
</entry>
<entry [Sat 2011:05:14 03:22:12 EST] Command - MASK ERROR BY REDIRECT STDOUT AND STDERR>

CREATE THIS CLASS:

class NullDevice():
    def write(self, s):
        pass


THEN IN THE MAIN CLASS:

        original_stdout = sys.stdout
        sys.stdout = NullDevice()  
        master.ssh.execute(envars + command)
        sys.stdout = original_stdout



DIDN'T USE THIS BUT MIGHT BE USEFUL LATER:

class Command(object):
    """Run a command and capture it's output string, error string and exit status"""
 
    def __init__(self, command):
        self.command = command 
 
    def run(self, shell=True):
        import subprocess as sp
        process = sp.Popen(self.command, shell = shell, stdout = sp.PIPE, stderr = sp.PIPE)
        self.pid = process.pid
        self.output, self.error = process.communicate()
        self.failed = process.returncode
 
        log.info("sge.Command    self.command: %s", self.command)
        log.info("sge.Command    self.output: %s", self.output)
        log.info("sge.Command    self.error: %s", self.error)
        log.info("sge.Command    self.failed: %s", self.failed)
 
        return self
 
    @property
    def returncode(self):
        return self.failed

    
</entry>

<entry [Wed 2011:05:11 10:56:13 EST] PYTHON EXCEPTIONS HIERARCHY>
Standard Exception Classes in Python 1.5

(updated for Python 1.5.2 -baw)
User-defined Python exceptions can be either strings or Python classes. Since classes have many nice properties when used as exceptions, it is desirable to migrate to a situation where classes are used exclusively. Prior to Python 1.5 alpha 4, Python's standard exceptions (IOError, TypeError, etc.) were defined as strings. Changing these to classes posed some particularly nasty backward compatibility problems.

In Python versions 1.5 and later, the standard exceptions are Python classes, and a few new standard exceptions have been added. The obsolete AccessError exception has been deleted. Because it is possible (although unlikely) that this change broke existing code, the Python interpreter can be invoked the command line option -X to disable this feature, and use string exceptions like before. This option is a temporary measure - eventually the string-based standard exceptions will be removed from the language altogether. It hasn't been decided whether user-defined string exceptions will be allowed in Python 2.0.

The Standard Exception Hierarchy

Behold the standard exception hierarchy. It is defined in the new standard library module exceptions.py. Exceptions that were new since Python 1.5 are marked with (*).

Exception(*)
 |
 +-- SystemExit
 +-- StandardError(*)
      |
      +-- KeyboardInterrupt
      +-- ImportError
      +-- EnvironmentError(*)
      |    |
      |    +-- IOError
      |    +-- OSError(*)
      |
      +-- EOFError
      +-- RuntimeError
      |    |
      |    +-- NotImplementedError(*)
      |
      +-- NameError
      +-- AttributeError
      +-- SyntaxError
      +-- TypeError
      +-- AssertionError
      +-- LookupError(*)
      |    |
      |    +-- IndexError
      |    +-- KeyError
      |
      +-- ArithmeticError(*)
      |    |
      |    +-- OverflowError
      |    +-- ZeroDivisionError
      |    +-- FloatingPointError
      |
      +-- ValueError
      +-- SystemError
      +-- MemoryError

The root class for all exceptions is the new exception Exception. From this, two additional classes are derived, StandardError, which is the root class for all standard exceptions, and SystemExit. It is recommended that user-defined exceptions in new code be derived from Exception, although for backward compatibility reasons, this is not required. Eventually this rule will be tightened.

SystemExit is derived from Exception because while it is an exception, it is not an error.

Most standard exceptions are direct descendants of StandardError. Some related exceptions are grouped together using an intermediate class derived from StandardError; this makes it possible to catch several different exceptions in one except clause, without using the tuple notation.

We looked into introducing more groups of related exceptions, but couldn't decide on the best grouping. In a language as dynamic as Python, it's hard to say whether TypeError is a "program error", a "runtime error" or an "environmental error", so we decided to leave it undecided. It could be argued that NameError and AttributeError should be derived from LookupError, but this is questionable and depends entirely on the application.


    
</entry>

<entry [Wed 2011:05:11 06:13:39 EST] SEPARATE STDERR AND STDOUT WHEN RUNNING COMMAND>

http://www.daniweb.com/software-development/python/code/257449

class Command(object):
    """Run a command and capture it's output string, error string and exit status"""
 
    def __init__(self, command):
        self.command = command 
 
    def run(self, shell=True):
        import subprocess as sp
        process = sp.Popen(self.command, shell = shell, stdout = sp.PIPE, stderr = sp.PIPE)
        self.pid = process.pid
        self.output, self.error = process.communicate()
        self.failed = process.returncode
        return self
 
    @property
    def returncode(self):
        return self.failed
  
Example:
 
>>> import random
>>> com = Command("python " + random.__file__).run()
>>> com.command
'python /usr/lib64/python2.6/random.pyc'
>>> com.failed  # This is the same as com.returncode
0
>>> com.error   # a string containing the command's output to sderr
''
>>> com.output  # a string containing the command's output to stdout
'2000 times random\n0.002 sec, avg 0.500354, stddev 0.286243, min 4.19235e-05, max 0.999824\n2... 
"""
    
</entry>
<entry [Tue 2011:05:10 23:35:01 EST] HANDLE ExpatError>

SEE TEST FILE:
/home/syoung/0.6/starcluster/tests/expaterror.py

syoung@hp:~/0.6/starcluster/tests$ ./expaterror.py 
balancers.sge.__init__.parse_qhost    
balancers.sge.__init__.parse_qhost    ExpatError: incorrect XML format. Returning self.hosts
balancers.sge.__init__.parse_qhost    Inside 'finally'. Returning self.hosts
hosts:  []


MUST IMPORT xml.parsers.expat AND USE FULL NAME xml.parsers.expat.ExpatError

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
    
</entry>
<entry [Tue 2011:05:10 15:02:12 EST] REGEX AND DEALING WITH None>

ADDED TO starcluster/balancers/sge/__init__.py

<!--        import re
        match = re.search('^error', string)
        log.info("createCell.run    error match: %s", match);
        if match:
            log.info("balancers.sge.__init__.parse_qhost    USING DUMMY BECAUSE FOUND ERROR in XML string: %s", string)

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
            log.info("balancers.sge.__init__.parse_qhost    DUMMY string: %s", string)

            #return self.hosts
        else:
            log.info("balancers.sge.__init__.parse_qhost    NO ERRORS in XML string: %s", string)
            
-->
    
</entry>

<entry [Mon 2011:05:09 14:40:36 EST] LOOPING THROUGH HASHES>

CREATE A HASH:

tel = {'jack': 4098, 'sape': 4139}
tel = dict([('sape', 4139), ('guido', 4127), ('jack', 4098)])
tel = dict(sape=4139, guido=4127, jack=4098)


dict([(x, x**2) for x in (2, 4, 6)])     # use a list comprehension
{2: 4, 4: 16, 6: 36}

LOOP THROUGH A HASH:

knights = {'gallahad': 'the pure', 'robin': 'the brave'}
for k, v in knights.iteritems():
...     print k, v
...

for k in knights.keys():
    print k

</entry>
<entry [Mon 2011:05:09 14:40:35 EST] LOOPING THROUGH ARRAYS>

LOOP THROUGH ARRAY:

for i, v in enumerate(['tic', 'tac', 'toe']):
...     print i, v
    ...
    0 tic
    1 tac
    2 toe

LOOP THROUGH TWO ARRAYS:

>>> questions = ['name', 'quest', 'favorite color']
>>> answers = ['lancelot', 'the holy grail', 'blue']
>>> for q, a in zip(questions, answers):
...     print 'What is your {0}?  It is {1}.'.format(q, a)
...
    What is your name?  It is lancelot.
    What is your quest?  It is the holy grail.
    What is your favorite color?  It is blue.

LOOP ARRAY IN REVERSE:

>>> for i in reversed(xrange(1,10,2)):
...     print i
...


LOOP IN SORTED ORDER:

>>> basket = ['apple', 'orange', 'apple', 'pear', 'orange', 'banana']
>>> for f in sorted(set(basket)):
...     print f
    apple
    banana
    orange
    pear

    
</entry>
<entry [Mon 2011:05:09 10:01:00 EST] ENVIRONMENT VARIABLES>

os.environ['SGE_QMASTER_PORT']  = self.qmasterport
os.environ['SGE_EXECD_PORT']    = self.execdport
os.environ['SGE_ROOT']          = self.root
os.environ['SGE_CELL']          = self.cell
    
</entry>
<entry [Sat 2011:05:07 14:52:18 EST] REPLACE CONTENTS IN A FILE>
    
# /data ip-10-124-247-224.ec2.internal(async,no_root_squash,no_subtree_check,rw)
f = open("/etc/exports", 'rb')
contents = f.read()
f.close()
#print "createCell._removeFromExports     contents of /etc/exports BEFORE: "
#print contents

insert = sourcedir + "  " + node.private_ip_address + "(async,no_root_squash,no_subtree_check,rw)\n"
 contents = string.replace(contents, insert,"")
#print "createCell._removeFromExports     contents of /etc/exports AFTER: "
#print contents

f = open("/etc/exports", 'w')
f.write(contents)
f.close()        

</entry>
<entry [Sat 2011:05:07 14:51:49 EST] SLEEP>

log.info("Sleeping  %s seconds" % interval)
time.sleep(float(interval))
    
</entry>
<entry [Mon 2011:05:02 12:27:15 EST] OPEN FILE AND REGEX>
    
import os
import re

put, get = os.popen4("du -s /Users/*")

for user in get.readlines():
       if re.match(r'^\d',user): print user,

</entry>
<entry [Fri 2011:04:22 14:57:09 EST] PYTHON DUMP>

json
    http://docs.python.org/library/json.html


    import json
    print json.dumps(i)

import json
print json.dumps({'4': 5, '6': 7}, sort_keys=True, indent=4)
{
    "4": 5, 
    "6": 7
}

simplejson
    http://pypi.python.org/pypi/simplejson/

    import simplejson as json
    print json.JSONEncoder().encode(i)
    for chunk in json.JSONEncoder().iterencode(i):
        print (chunk)


repr(object)
    http://docs.python.org/library/functions.html#repr    


Return a string containing a printable representation of an object. This is the same value yielded by conversions (reverse quotes). It is sometimes useful to be able to access this operation as an ordinary function. For many types, this function makes an attempt to return a string that would yield an object with the same value when passed to eval(), otherwise the representation is a string enclosed in angle brackets that contains the name of the type of the object together with additional information often including the name and address of the object. A class can control what this function returns for its instances by defining a __repr__() method.


NB: LIBRARY OF PYTHON FUNCTIONS
http://docs.python.org/library/functions.html


NOTES
-----

http://stackoverflow.com/questions/2540567/is-there-a-python-equivalent-to-perls-datadumper
For serialization, there are many options.

One of the best is JSON, which is a language-agnostic standard for serialization. It is available in 2.6 in the stdlib json module and before that with the same API in the third-party simplejson module.

You do not want to use marshal, which is fairly low-level. If you wanted what it provides, you would use pickle.

I avoid using pickle the format is Python-only and insecure. Deserializing using pickle can execute arbitrary code.

If you did use pickle, you want to use the C implementation thereof. (Do import cPickle as pickle.)
For debugging, you usually want to look at the object's repr or to use the pprint module.
    
</entry>
<entry [Thu 2011:04:21 13:41:07 EST] SYSTEM CALL exit>
        import sys;
        sys.exit();
    
</entry>
<entry [Thu 2011:04:21 13:40:49 EST] GET THE caller SUBROUTINE WITH inspect>
    
http://stefaanlippens.net/python_inspect

        import inspect;
        log.debug("caller: %s" , inspect.stack()[1][3]);
        log.debug('doing exit')
    
</entry>
<entry [Sun Dec 19 20:45:29 EST 2010] DATA::DUMPER WITH pp.pprint>

import pprint
pp = pprint.PrettyPrinter(indent=4)
pp.pprint(< variableNameHere>)

</entry>
<entry [Sun Dec 19 20:44:29 EST 2010] SHOW PATH VARIABLES>

A short code to show PYTHONPATH ...
Python Syntax (Toggle Plain Text)
# show the system path for Python --> PYTHONPATH
 
import sys
 
print "These are the directories Python looks into for modules and source files:"
for folder in sys.path:
    print folder
 
print "-"*30  # print 30 dashes
 
print "This would be your present working folder/directory:"
print sys.path[0]


</entry>