Notes-apps-opscode.txt


<entry [Fri 2011:04:22 00:52:59 EST] ANOTHER chef-RELATED LOG ROTATE ERROR MESSAGE>

tail /var/mail/root
Message-Id: < 20110422045132.E030D60C5A@hp>
Date: Fri, 22 Apr 2011 00:51:32 -0400 (EDT)

/etc/cron.daily/logrotate:
error: stat of /var/log/chef/server.log failed: No such file or directory
error: stat of /var/log/chef/merb*log failed: No such file or directory
error: stat of /var/log/chef/server-webui.log failed: No such file or directory
error: stat of /var/log/chef/merb-webui*log failed: No such file or directory
run-parts: /etc/cron.daily/logrotate exited with return code 1

    
</entry>

<entry [Tue 2011:04:12 10:18:09 EST] FIX server ERROR>

tail /var/mail/root

    /etc/cron.daily/logrotate:
    error: stat of /var/log/chef/server.log failed: No such file or directory
    error: stat of /var/log/chef/merb*log failed: No such file or directory
    error: stat of /var/log/chef/server-webui.log failed: No such file or directory
    error: stat of /var/log/chef/merb-webui*log failed: No such file or directory
    run-parts: /etc/cron.daily/logrotate exited with return code 1

    
</entry>


<entry [Wed 2011:04:20 17:13:11 EST] SETUP chef ON EC2 AMI>

http://wiki.opscode.com/display/chef/Amazon+EC2+AMIs+with+Chef


1. Login and Start
Log into the instance as ubuntu, make sure history will not be saved and su to root.

export HISTSIZE=0
sudo su -
export HISTSIZE=0
vi /etc/motd.tail #=>
Canonical Ubuntu 10.04 AMI customized by Opscode for use with Chef 0.9.8
http://www.opscode.com/chef
Edit the sources and enable multiverse.

vi /etc/apt/sources.list


2. Install Ruby and RubyGems
We install Ruby from packages, but RubyGems from source, same as the Installation instructions for RubyGems. We also install the ec2-ami-tools, which come from multiverse.

apt-get update
apt-get install -y ruby ruby1.8-dev libopenssl-ruby1.8 rdoc \
  ri irb build-essential wget ssl-cert ec2-ami-tools
cd /tmp
wget http://production.cf.rubygems.org/rubygems/rubygems-1.3.7.tgz
tar zxf rubygems-1.3.7.tgz
cd rubygems-1.3.7
ruby setup.rb --no-format-executable
cd


3. Install Chef
Install the Chef gem. We only need the client. You could opt to install Chef from distribution packages if you wish.

gem install chef --no-ri --no-rdoc # installs the latest version of Chef
Configure Chef Client
This section could also be handled with the normal RubyGems Bootstrap, but doing it manually leaves fewer artifacts to clean up . We use the following config file for the client that reads the user data for the instance.

/etc/chef/client.rb
mkdir -p /etc/chef
vi /etc/chef/client.rb
We use Runit to manage the chef-client service with a RubyGems installation. Runit uses a 'run' script and a 'log/run' script.

/etc/sv/chef-client/run
#!/bin/bash
exec 2>&1
exec /usr/bin/env chef-client -i 1800 -s 20 -L /var/log/chef/client.log
/etc/sv/chef-client/log/run
#!/bin/bash
exec svlogd -tt ./main


4. Install runit and set up the chef-client service:

apt-get install runit -y
mkdir -p /var/log/chef /var/chef /etc/sv/chef-client/log/main
vi /etc/sv/chef-client/log/run 
vi /etc/sv/chef-client/run 
chmod +x  /etc/sv/chef-client/log/run /etc/sv/chef-client/run
ln -s /etc/sv/chef-client /etc/service/chef-client
ln -s /usr/bin/sv /etc/init.d/chef-client
sleep 5
sv stop chef-client
Clean up
rm ~root/.ssh/authorized_keys 
rm ~ubuntu/.ssh/authorized_keys
rm ~root/.gemrc ~ubuntu/.gemrc
rm -rf ~/.gem /tmp/rubygems*
rm /var/cache/apt/archives/*deb
rm /etc/sv/chef-client/log/main/current /var/log/chef/client.log


5. Copy EC2 Configuration
You will need to copy your EC2 certificates over with a config file.

mkdir -p /mnt/ec2
vi -o /mnt/ec2/pk.pem /mnt/ec2/cert.pem /mnt/ec2/config
The pk.pem and cert.pem should be the contents of the appropriate files for your EC2 credentials. The config file should have the following values set:

KEY_FILE_NAME=/mnt/ec2/pk.pem
CERT_FILE_NAME=/mnt/ec2/cert.pem
EC2_PRIVATE_KEY=$KEY_FILE_NAME
EC2_CERT=$CERT_FILE_NAME
AWS_ACCOUNT_ID="your account ID"
AWS_ACCESS_KEY_ID="your access key"
AWS_SECRET_ACCESS_KEY="your secret access key"
AMAZON_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
AMAZON_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
 
export EC2_PRIVATE_KEY EC2_CERT AWS_ACCOUNT_ID KEY_FILE_NAME CERT_FILE_NAME \
  AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AMAZON_ACCESS_KEY_ID AMAZON_SECRET_ACCESS_KEY
Source the EC2 config and set up some helper variables for creating the AMI name. Be sure to specify the correct ARCH for the instance type you're creating.

. /mnt/ec2/config
export NAME="ubuntu-10.04-chef-0.9.8"
export ARCH="i386"
#export ARCH="x86_64"
export VERSION="client1"
echo ${NAME}-${ARCH}-${VERSION}

6. Create the AMI Bundle
ec2-bundle-vol -c /mnt/ec2/cert.pem -k /mnt/ec2/pk.pem --user "$AWS_ACCOUNT_ID" \
      -r $ARCH -p ${NAME}-${ARCH}-${VERSION}
ec2-upload-bundle --acl public-read -b opscode-public-amis \
      -m /tmp/${NAME}-${ARCH}-${VERSION}.manifest.xml \
      -a "$AMAZON_ACCESS_KEY_ID" -s "$AMAZON_SECRET_ACCESS_KEY"
Register and Release
These steps use programs that are included in the ec2-api-tools. You will need to install these for your local workstation's Operating System.

On your local workstation, repeat the variable export from above. Also make sure you are using the correct EC2 configuration. Then register the AMI manifest to generate a machine ID.

ec2-register opscode-public-amis/${NAME}-${ARCH}-${VERSION}.manifest.xml -n ${NAME}-${ARCH}-${VERSION}
Finally, if you are making the AMI available for anyone to use, set public permission.

ec2-modify-image-attribute $AMI_ID --launch-permission -a all

    
</entry>
<entry [Tue 2011:04:05 18:03:46 EST] COOKBOOK TO ENABLE SSL WITH APACHE>

http://wiki.opscode.com/display/chef/Opscode+Chef+Cookbook

    
</entry>
<entry [Tue 2011:04:05 17:42:42 EST] FIXED rabbitmq FAILURE PROBLEM>

PROBLEM:

rabbitmq FAILS WITH THE FOLLOWING ERROR:

emacs /var/log/rabbitmq/rabbit\@hp.log


    =INFO REPORT==== 5-Apr-2011::16:53:03 ===
    Limiting to approx 924 file handles
    
    =INFO REPORT==== 5-Apr-2011::16:53:03 ===
    Memory limit set to 1527MB.
    
    =ERROR REPORT==== 5-Apr-2011::16:53:03 ===
    FAILED
    Reason: {{badmatch,
                 {error,
                     {{{case_clause,
                           {error,
                               {not_a_log_file,
                                   "/var/lib/rabbitmq/mnesia/rabbit@hp/rabbit_persister.LOG"}}},
                       [{rabbit_persister,init,1},
                        {gen_server,init_it,6},
                        {proc_lib,init_p_do_apply,3}]},
                      {child,undefined,rabbit_persister,
                          {rabbit_persister,start_link,
                              [[{resource,<<"/chef">>,queue,
                                    <<"chef-index-consumer-default">>}]]},
                          transient,4294967295,worker,
                          [rabbit_persister]}}}},
             [{rabbit_sup,start_child,3},
              {rabbit_invariable_queue,start,1},
              {rabbit_amqqueue,start,0},
              {rabbit,'-run_boot_step/1-lc$^1/1-1-',1},
              {rabbit,run_boot_step,1},
              {rabbit,'-start/2-lc$^0/1-0-',1},
              {rabbit,start,2},
              {application_master,start_it_old,4}]}
    
    =INFO REPORT==== 5-Apr-2011::16:53:04 ===
        application: rabbit
        exited: {bad_return,{{rabbit,start,[normal,[]]},
                             {'EXIT',{rabbit,failure_during_boot}}}}
        type: temporary
    
    =INFO REPORT==== 5-Apr-2011::16:53:04 ===
        application: mnesia
        exited: stopped
        type: temporary
    
    =INFO REPORT==== 5-Apr-2011::16:53:04 ===
        application: os_mon
        exited: stopped
        type: temporary


THIS POST PROVIDES A FIX:

http://playground.mekensleep.com/pipermail/playground-dev/2010-April/000124.html

The following command allowed to restart it:

mv /var/lib/rabbitmq/mnesia/rabbit at localhost/rabbit_persister.LOG /var/lib/rabbitmq/mnesia/rabbit at localhost/rabbit_persister.LOG.1
mv /var/lib/rabbitmq/mnesia/rabbit at localhost/rabbit_persister.LOG.previous /var/lib/rabbitmq/mnesia/rabbit at localhost/rabbit_persister.LOG.previous.1


mv /var/lib/rabbitmq/mnesia/rabbit@hp/rabbit_persister.LOG /var/lib/rabbitmq/mnesia/rabbit@hp/rabbit_persister.LOG.1
mv /var/lib/rabbitmq/mnesia/rabbit@hp/rabbit_persister.LOG.previous /var/lib/rabbitmq/mnesia/rabbit@hp/rabbit_persister.LOG.previous.1


RESTART rabbitmq:

/etc/init.d/rabbitmq-server restart
    Restarting rabbitmq-server: No nodes running
    SUCCESS
    rabbitmq-server.

    OK
    
</entry>
<entry [Mon 2011:04:05 05:28:31 EST] CONFIGURE A REMOTE NODE>

GOOD GETTING STARTED GUIDE
http://www.themomorohoax.com/2010/07/31/ruby-chef-tutorial

1. INSTALL chef CLIENT ON THE NODE

ON THE CHEF SERVER OR WORKSTATION:

gem install net-ssh-multi
knife bootstrap 172.x.x.x 


2. RUN RECIPES ON NODE

ON THE NODE:

chef-client


3. CREATE A ROLE

USE opscode web ui OR CREATE THE JSON FILE:

emacs roles/base.json

{
    "name": "base",
    "default_attributes": {
      "chef": {
        "server_url": "https://api.opscode.com/organizations/#{YOUR COMPANY!}",
        "cache_path": "/var/chef/cache",
        "backup_path": "/var/chef/backup",
        "validation_client_name": "#{YOUR COMPANY!}-validator",
        "run_path": "/var/chef"
      }
    },
    "json_class": "Chef::Role",
    "run_list": [
      "recipe[ubuntu::default]",
      "recipe[build-essential::default]",
      "recipe[openssl::default]",
      "recipe[chef::client]",
      "recipe[chef::delete_validation]",
      "recipe[git::default]"
    ],
    "description": "Basic Server",
    "chef_type": "role",
    "override_attributes": {
    }
  }


UPLOAD THE ROLE TO THE CHEF SERVER:

knife role from file roles/base.json 


ADD NODE TO RUN LIST ON CHEF SERVER

(I think you are missing the step where you add the base role to your run list?
I needed this step: )

knife node run_list add < hostname > "role[base]"


DOWNLOAD THE cookbooks FROM THEIR VARIOUS SOURCES TO THE NODE

ON THE NODE, for each of the items in the run_list array above, do:

knife cookbook site vendor #{name}

E.G.:

knife cookbook site vendor ubuntu

This will download the cookbooks to your chef-repo and create a git commit.


UPLOAD THE NODE'S COOKBOOKS TO THE CHEF SERVER

ON THE NODE:

knife cookbook upload -a    # uploads chef cookbooks with knife

# OR

rake upload_cookbooks



Congratulations! You’re cooking with Chef.

From here on, the workflow for me is basically just:

[workstation] knife cookbook site vendor #{cookbook} -d

# The -d flag will install dependencies


[workstation] knife cookbook upload #{cookbook}
[workstation] add the recipe from the cookbook that you want to use to the base role
[workstation] update the base role with the command above (from file)
[node] run chef-client [node] check out what errors you get
[workstation] try to fix them



For many recipies, especially the 37signals ones here there is basically no documentation. This means that you will often have to read through the entire cookbook to figure out how you need to configure it. It’s very much trial and error. The best strategy is to read through the cookbook, creating a json hash for whatever data you’ll need.


The 37signals users cookbook is really great, so I will quickly run through how to set it up, as an example of how to figure out undocumented recipes.

First, grab this gist. and put in your chef repo in chef-repo/tasks and add the rake file stuff to your chef-repo’s rakefile.

DOWNLOAD gist FILE:


That gist will help you deal with databags sanely.

For the 37signals users recipe, clone the 37s cookbooks repo and then copy the users cookbook to your cookbooks directory in your chef-repo.



Matt · 26 weeks ago
You mentioned setting up mysql slaves -- Any chance you could post how you did that? The only thing I can find is the 'database' cookbook, but that's only for ec2 instances and frankly I haven't been able to decipher how it actually sets up a slave (it doesn't ever seem to write any configuration or do anything with mysql) 

I'm sure, given enough time, I could come up with something, but I'm blanking on how I'd figure out the master's information


NOTES
-----

http://www.themomorohoax.com/2010/07/31/ruby-chef-tutorial

The problem with the getting started guide is that it doesn’t tell you how to actually configure a node outside of your own machine. Doing this is actually pretty easy, but somewhat undocumented.

First, get a blank server somewhere. Note that if you’re using your local machine, it didn’t work for me to just use VMWare Fusion virtual machines. The Opscode platform wouldn’t recognize them.

Instead, I recommend just creating a small server on Linode/Rackspace/Slicehost. I used Ubuntu Lucid, so I’d recommend that as well if you want to follow along. However, any Chef supported distro should work. Once the new server is imaged and you get your root password, do the following:

gem install net-ssh-multi
knife bootstrap 172.x.x.x 


The net-ssh-multi gem will save you from a confusing error.

Knife, as you learned in the getting started guide, is the Chef command line tool. Shef is to Chef as script/console is to Rails while Knife is a bit more like Capistrano, sorta.

The knife bootstrap command will try to login to the given IP as root (you’ll need the password, unless you’re using ec2 or something where keys are set). It will then setup the node (the server) to run chef-client. If you followed the getting started guide correctly, it will also upload the ssl stuff.

Once knife bootstrap is finished, login to the server using ssh.

Then run


chef-client

This will connect to your opscode Chef server and run any recipes that you’ve specified. At this point, you should not have specified any recipes, so it should run cleanly.

</entry>

<entry [Mon 2011:04:05 02:28:31 EST] INSTALL CHEF SERVER ON CENTOS>

*** NOTE: MUST OPEN PORT 4000 ****

http://wiki.opscode.com/display/chef/Hello+World+example
The goal of this page is to give a minimalistic example of an installation.

This will install zsh, git and screen on a remote server (node).

Assuming:

one server for the main chef repository (cookbooks,...) at: my.chefserver.com
one server where the three above packages will be installed at: my.node.com
This was run on CentOS 5.4 servers fully updated (4/28/2010)

1- Chef server setup
1.1- Installing RPMs
Following: http://wiki.opscode.com/display/chef/Installation+on+RHEL+and+CentOS+5+with+RPMs, we are installing chef-server AND chef-client on my.chefserver.com

# rpm -Uvh http://download.fedora.redhat.com/pub/epel/5/i386/epel-release-5-3.noarch.rpm
# rpm -Uvh http://download.elff.bravenet.com/5/i386/elff-release-5-3.noarch.rpm
 
# yum install chef-server
# for svc in couchdb rabbitmq-server chef-solr chef-solr-indexer chef-server
do
  /sbin/service $svc start
  /sbin/chkconfig $svc on
done
 
# yum install chef-server-webui
# /sbin/service chef-server-webui start
# /sbin/chkconfig chef-server-webui on
 
 
# yum install chef
# sudo /sbin/service chef-client start
# sudo /sbin/chkconfig chef-client on
The configuration files under /etc/chef/*.rb are left as-is. In particular the
chef_server_url is left pointing to "http://localhost:4000"

The server port 4000 must be opened.
</entry>

<entry [Wed 2011:03:30 02:28:31 EST] RUBY FOR chef>

http://wiki.opscode.com/display/chef/Just+Enough+Ruby+for+Chef

Firstly, it's useful to know how to check the syntax of a ruby file
(like a cookbook):

$ ruby -c my_cookbook_file.rb
Syntax OK
IN

Ruby Quick Reference for Clever Sysadmins
# anything after # is a comment.
 
# assigning a local variable:
x = 1
 
# some basic arithmetic:
1 + 2           # => 3
2 * 7           # => 14
5 / 2           # => 2   (because both arguments are whole numbers)
5 / 2.0         # => 2.5 (because one of the numbers had a decimal place)
1 + (2 * 3)     # => 7   (you can use parens to group expressions)
 
# strings
'single quoted' # => "single quoted"
"double quoted" # => "double quoted"
'It\'s alive'   # => "It's alive!"
 
# a string with embedded ruby
x = "Bob"
"Hi, #{x}"      # => "Hi, Bob"
'Hello, #{x}'   # => "Hello, \#{x}" Notice that single quotes don't work with #{}
 
# some basic truths
true            # => true
false           # => false
nil             # => nil
1 == 1          # => true ( == tests for equality )
1 == true       # => false ( == tests for equality )
 
# ! means not
!true           # => false
!false          # => true
!nil            # => true
1 != 2          # => true (1 is not equal to 2)
1 != 1          # => false (1 is not not equal to itself)
 
# !! (not not) converts something to either true or false
!!true          # => true
!!false         # => false
!!nil           # => false (when pressed, nil is false)
!!0             # => true (zero is NOT false).
 
# arrays are lists
x = ["a", "b", "c"] # => ["a", "b", "c"]
x[0]                # => "a" (zero is the first index)
x.first             # => "a" (see?)
x.last              # => "c"
x + "d"             # => ["a", "b", "c", "d"]
x                   # => ["a", "b", "c"] ( x is unchanged)
x = x + d           # => ["a", "b", "c", "d"]
x                   # => ["a", "b", "c", "d"]
 
# a hash is a list with keys and values
# - but no set order (!)
h = {
  "first_name" => "Bob",
  "last_name"  => "Jones"
}
# => { "first_name => "Bob", "last_name" => "Jones" }
h.keys              # => ["first_name", "last_name"]
h["first_name"]     # => "Bob"
h["last_name"]      # => "Jones"
h["age"] = 23
k.keys              # => ["first_name", "age", "last_name"]
k.values            # => ["Jones", "Bob", 23]
 
# perl-style regular expressions
"I believe"  =~ /I/                       # => 0 (matches at the first character)
"I believe"  =~ /lie/                     # => 4 (matches at the 5th character)
"I am human" =~ /bacon/                   # => nil (no match - bacon comes from pigs)
"I am human" !~ /bacon/                   # => true (correct, no bacon here)
/give me a ([0-9]+)/ =~ "give me a 7"     # => 0 (matched)
 
# you can do things conditionally
 
# with an if statement
if false
  # this won't happen
elsif nil
  # this won't either
else
  # code here will run though
end
 
# or a case statement
x = "dog"
case x
when "fish"
  # this won't happen
when "dog", "cat", "monkey"
  # this will run
else
  # the else is an optional catch-all
end
 
# def defines a method (functions, if you like)
 
def do_something_useless( first_argument, second_argument)
  puts "You gave me #{first_argument} and #{second_argument}"
end
 
do_something_useless( "apple", "banana")
# => "You gave me apple and banana"
do_something_useless 1, 2
# => "You gave me 1 and 2"
# see how the parens are optional if there's no confusion about what to do
 
# call a method on something with .method_name()
x = "My String"
x.split(" ")            # => ["My", "String"]
x.split(" ").join(", ") # => "My, String"

    
</entry>

<entry [Wed 2011:03:30 00:37:41 EST] THIRD STEP: CONFIGURE knife TO CONNECT TO OPSCODE COOKBOOKS>
    
HOW TO GET STARTED (CONT.)
http://wiki.opscode.com/pages/viewpage.action?pageId=10387523

1. INSTALLED ruby gems, E.G.:

cd /tmp
wget http://production.cf.rubygems.org/\
rubygems/rubygems-1.3.7.tgz -O- | tar zxf -
cd rubygems-1.3.7 && sudo ruby setup.rb
ln -svf /usr/bin/gem1.8 /usr/bin/gem

2. INSTALL chef WITH gem

gem install chef

    OK


3. CONFIGURE knife TO FIND VALIDATION KEY

knife configure

    No knife configuration file found
    Where should I put the config file? [~/.chef/knife.rb] 
    Please enter the chef server URL: [http://localhost:4000] 
    Please enter an existing username or clientname for the API: [syoung] 
    Please enter the validation clientname: [chef-validator] 
    Please enter the location of the validation key: [/etc/chef/validation.pem] 
    Please enter the path to a chef repository (or leave blank): 
    WARN: *****
    WARN: 
    WARN: You must place your client key in:
    WARN:   /home/syoung/.chef/syoung.pem
    WARN: Before running commands with Knife!
    WARN: 
    WARN: *****
    WARN: 
    WARN: You must place your validation key in:
    WARN:   /etc/chef/validation.pem
    WARN: Before generating instance data with Knife!
    WARN: 
    WARN: *****
    WARN: Configuration file written to /home/syoung/.chef/knife.rb
     

cat ~/.chef/knife.rb

    log_level                :info
    log_location             STDOUT
    node_name                'syoung'
    client_key               '/home/syoung/.chef/syoung.pem'
    validation_client_name   'chef-validator'
    validation_key           '/etc/chef/validation.pem'
    chef_server_url          'http://localhost:4000'
    cache_type               'BasicFile'
    cache_options( :path => '/home/syoung/.chef/checksums' )




<!--COPIED VALIDATION KEY TO /etc/chef/validation.pem-->


COPIED PRIVATE KEY:

cp /home/syoung/agua/cloud/opscode/aguadev-validator.pem \
/home/syoung/.chef/syoung.pem

chmod 600 /home/syoung/.chef/syoung.pem


TEST PRIVATE KEY BY TRYING TO DOWNLOAD SOMETHING:

BEFORE COPY KEY:

knife cookbook site download zsh
    FATAL: Failed to read the private key /home/syoung/.chef/syoung.pem:

AFTER COPY KEY:

mkdir -p ~/software/opscode/cookbooks
cd ~/software/opscode/cookbooks
knife cookbook site download zsh
    OK
    INFO: Downloading zsh from the cookbooks site at version 0.7.0
    INFO: Cookbook saved: /home/syoung/zsh-0.7.0.tar.gz


CHEF REPOSITORY




CREATE GIT REPOSITORY FOR OPSCODE

cd ~/software/opscode
git clone http://github.com/opscode/chef-repo.git
cd chef-repo


ADD cookbook_path ENVIRONMENT VARIABLE PATH TO CONFIGURATION FILE:

emacs ~/.chef/knife.rb

ADD (FROM README.md IN DISTRIBUTION):

cookbook_path ["./cookbooks"]
cookbook_copyright "Example, Com."
cookbook_email     "cookbooks@example.com"
cookbook_license   "apachev2"

Supported values for `cookbook_license` are "apachev2" or "none". These settings are used\
 to prefill comments in the default recipe, and the corresponding values in the metadata.\
rb. You are free to change these in those files.



CREATE A COOKBOOK

knife cookbook create COOKBOOK

This will create all the cookbook directory components. You don't need to use them all, a\
nd can delete the ones you don't need. It also creates a README file, metadata.rb and def\
ault recipe.



CHECK GITHUB RECIPES:

https://github.com/opscode/cookbooks/tree/master/apache2/recipes



DOWNLOAD A RECIPE/COOKBOOK:
Download cookbooks directly from the Opscode Cookbook Site.

knife cookbook site vendor COOKBOOK

This will:

* Download the cookbook tarball from cookbooks.opscode.com.
* Ensure its on the git master branch.
* Checks for an existing vendor branch, and creates if it doesn't.
* Checks out the vendor branch (chef-vendor-COOKBOOK).
* Removes the existing (old) version.
* Untars the cookbook tarball it downloaded in the first step.
* Adds the cookbook files to the git index and commits.
* Creates a tag for the version downloaded.
* Checks out the master branch again.
* Merges the cookbook into master.

The last step will ensure that any local changes or modifications you have made to the co\
okbook are preserved, so you can keep your changes through upstream updates.


ALTERNATE METHOD (NOT USING git):
Use knife's site download subcommand to download the tarball.

knife cookbook site download COOKBOOK

This creates the COOKBOOK.tar.gz from in the current directory (e.g., `~/chef-repo`).

Follow a workflow similar to the above for your version control tool.

http://wiki.opscode.com/display/chef/Recipes



</entry>

<entry [Wed 2011:03:30 00:40:15 EST] SECOND STEP: DOWNLOAD *-validator.pem PRIVATE KEY FROM OPSCODE PLATFORM>

SAVED HERE:

/home/syoung/agua/cloud/opscode/aguadev-validator.pem

    -----BEGIN RSA PRIVATE KEY-----
    MIIEpQIBAAKCAQEAyvY2n9+fYIUfgcIg1lLY5ZsZQCkBjFb2PtTP13WNKgle6xMx
    hSdIhZkt6Bw20s3lUiU4JF6SMvjayeJWOXR6c8YirAa1bjVk8iccYUX/sZtLBrRy
    4cgsLTH9iswhDZ2DPijGZn+AIpWSJjJ1V3QYhoE1zyrdVIlKw0LlDCXnlKkNQfBz
    wbxgVJsFODQqwXe47lmatfQTAu7HwYGZubCUs8XTtra/AtqafCRoekU+HS/V0+6i
    aGEmjiF8Pg4qxjlbQzA+pFWJJULmAUB/NY2i1K8t2guozhJclEY9WscmTYjTAK92
    pGBu5ncuId5OZO3NSwVp+XxvTo9mFpBPMOtJYQIDAQABAoIBAQCQJs1nQXm+IO7e
    x1VxQ8hfU4hcpIM//OfKenXgLtKDP8KVrb0nOF5u3PvY9mkN0kUE0gCM/EpUP6GN
    b98T0aHDJr+rdNxZmTzILHUgtYnEyGpCKdnKeNS/iNjuQstbEzuK44T+eaI1bgwu
    avoikgd1SMJCEMzAZP6frpxlw2o2j5Jm+mM31kr/KzJhhYLfTT0FU4MUvPQZ1jJ9
    h5fKXtK15LwhFMQ8zjZ2Y1zVgEVmYoF6fBK2UtHjxkJtNY4L9jrPbCP4VdZcdHIX
    sxdN+GADHQjX0CWkekXGP0dHKO7u7lLVGEWi8f21QkcErVgr0phcgGFT0M80z3w1
    nzGnlmFNAoGBAPYbMP5aBzIvhAK7anUnP4tY4sTP+B4ImCPIdMzKo3UKwq/HOP+x
    njqF31gWpbWDz4GECfiximCFJXu9r3Sq0CzJxeWDrnl9Lt9T+4UUpDy70pfHmMXl
    OWxpDw3oKXi8uzssHK61hkGm4DDb0lWf7VG5kWjPbI4VSghtebP92gFnAoGBANMe
    //LJ6N+7QBW3Y5plVo1BbI9EskVyZdcYXCk/mSSgywf25mg4FSuxpN6fPwHAQUib
    yDu6CAuWiEjhyGfK1kb0tIFqpe90GbtcjZi8yg+as3sXPqK2VmpEdDVbjGyvXqK0
    6nR+fM7qBhK5IOIFeNb1RrhRcgpXqiZgMQaeHDn3AoGADGGH0HP1ArhTOtP04hns
    X3VES0RvJgumo7406gyTtpKpArDSFEL6Q9VyS/svsPcFnG1pFwLPhFWOcjAzwHnL
    aUVpWEeMon4Cuqd98s78CDYmvQ4EiIgkoGiUok14sKNGBA8PDlcBfxIHG04jwbz+
    8mqUfyJYQrmddNkVE1IFAqcCgYEAp4hEB0AeYdxPwGvkyFJ+Wl1+bjpPVTiwg/26
    tKjZN+2477sHn9BRTHkNofOwpg0QQTQNsweu9rMftuYkh+i4HVp2GvSsdNYmzT1m
    x7uYhMV4g8cwVyJmdLGZnfXl+yE28dqq6oKtO+0NoLHz3CgHelztH7rRyk9CoG1Y
    ui2hrIUCgYEAnfXY+u3CqLhzhyJlaaVQZhXHqpyxwHCuGw/v3xRLA4A6Pjp4xHvo
    Kb9J89654lxCerpVtlfIHCQLjM35VQBeAR13KLs1iPSKh3NBeJE6SWjKiqeH8cSg
    6quuJQFwIqO1mj2TTp6QicwI3+y8hPCuz+mxQuWoYZRgiXURdJlxWkI=
    -----END RSA PRIVATE KEY-----

    
</entry>

<entry [Tue 2011:03:29 18:29:17 EST] INSTALLED PERL PROTOTYPE FOR chef>
    
Perl Prototype
A working Perl prototype exists, that works for just recipes
http://wiki.opscode.com/display/chef/Writing+Chef+Recipes+in+various+languages

1. DOWNLOAD AND INSTALL PERL Chef MODULE 
...and its dependencies. (Moose and JSON:-:Any)

mkdir -p /home/syoung/software/chef/archive
cd /home/syoung/software/chef/archive
wget http://search.cpan.org/CPAN/authors/id/H/HO/HOLOWAY/Chef-0.01.tar.gz
tar xvfz *; cd *
perl Makefile.pl
make
make install
    OK

2. DOWNLOAD perl cookbook TO YOUR chef REPOSITORY

cd /home/syoung/software/chef/archive
wget https://github.com/adamhjk/chef-perl/tarball/aaa8d7990ef96129d1a2cb076c028562454c1a41


# tarball
# https://github.com/adamhjk/chef-perl/tarball/aaa8d7990ef96129d1a2cb076c028562454c1a41

# github page
# http://github.com/adamhjk/chef-perl/tree/aaa8d7990ef96129d1a2cb076c028562454c1a41/cookbook


3. Put your perl recipes in the cookbooks files/default/perl_recipes directory, and watch in amazement as they get executed.

Example:

  use Chef;
  
  resource file => '/tmp/foo', sub {
    my $r = shift;
    $r->owner('adam');
    $r->action('create');
  };
  
  resource file => '/tmp/' . node->{attributes}->{hostname} . "_created_with_perl", sub {
    my $r = shift;
    $r->action('create');
  };

Would create a file called /tmp/foo, and one called /tmp/HOSTNAME_created_with_perl. (Where HOSTNAME is, well, your hostname).

To use this module, you will need to install Chef, place the included cookbook in your cookbook repository, and place your perl based recipes in files/default/perl_recipes.
    
</entry>

<entry [Sun 2011:03:27 12:50:40 EST] COOKBOOK FILE CONTAINS PLATFORM-SPECIFIC PATHS>

http://wiki.opscode.com/display/chef/Resources

Cookbook File

Cookbook File transfers files from the files/ directory of a cookbook to a specified path on the host running chef-client or solo. The file in the cookbook is selected according to file specificity, which allows you to use a different source file based on hostname, host platform (OS or distro, as appropriate), or specific platform version.

Files under

COOKBOOK_NAME/files/default

will be used if a more specific version is not available.

</entry>


<entry [Sun 2011:03:27 12:45:37 EST] FIRST STEP: PREPARATION FOR INSTALLING THE Opscode APT REPOSITORY>
    
1. ADD OPSCODE REPOSITORY INFO TO opscode.list FILE:

echo "deb http://apt.opscode.com/ lucid main" | sudo tee /etc/apt/sources.list.d/opscode.list

ADD GPG KEY AND Update Index


2. ADD THE Opscode GPG KEY TO apt:

wget -qO - http://apt.opscode.com/packages@opscode.com.gpg.key | sudo apt-key add -
sudo apt-get update


SECOND STEP (SEE ABOVE): DOWNLOAD *-validator.pem PRIVATE KEY FROM OPSCODE PLATFORM





NOTES
-----

NB: THIS WILL USE MAVERICK WHICH WE DON'T WANT

echo "deb http://apt.opscode.com/ `lsb_release -cs` main" | sudo tee /etc/apt/sources.list.d/opscode.list

Replace codename with the distribution codename per the list at the top of this page, or in distribution configuration (canonical straight from the repo).


If you would like to be able to download source packages, add a deb-src line.

Copy and paste this
echo "deb http://apt.opscode.com/ `lsb_release -cs` main" | sudo tee /etc/apt/sources.list.d/opscode.list

Codenames available

The latest distribution codenames can be found by accessing the apt repo's distributions file.


Ubuntu:

lucid
karmic
jaunty
intrepid
hardy
Maverick is not available yet. Use lucid on Maverick.

Debian:

sid / unstable
squeeze / stable
lenny / oldstable

Add the GPG Key and Update Index
Before you install the packages, make sure you add the Opscode GPG key to apt.

wget -qO - http://apt.opscode.com/packages@opscode.com.gpg.key | sudo apt-key add -
sudo apt-get update

</entry>


<entry [Thu Dec  9 18:21:06 UTC 2010] CRAIG W OPSCODE COOKBOOKS>


CRAIG W OPSCODE COOKBOOKS

https://github.com/craigw/cookbooks

INCLUDES LOGROTATE

https://github.com/craigw/cookbooks/tree/master/logrotate

