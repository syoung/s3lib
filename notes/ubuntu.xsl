ubuntu 



<entry [Sun 2015:08:30 09:55:08 EST] REMOVE ^M IN EMACS OUTPUT>

EDIT .emacs ADD:

;; REMOVE ^M IN BUFFER NAMES
(setq default-buffer-file-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8)
    
    
</entry>
<entry [Sun 2015:08:30 09:24:34 EST] AVOID ANNOYING LINK WARNING WHEN OPEN .profile WITH EMACS>

PROBLEM

GET THIS PROMPT WHEN DO gobash

    Symbolic link to Git-controlled source file; follow link? (y or n)

SOLUTION

emacs ~/.emacs

(setq vc-follow-symlinks t)


    
</entry>
<entry [Fri 2015:08:28 03:38:29 EST] INSTALLED jq ON MASTER>

GitHub returns nicely formatted JSON. For servers that don’t, it can be helpful to pipe the response through jq to pretty-print it.

1. WEBSITE
https://stedolan.github.io/jq/

2. INSTALL
apt-get install jq


3. USAGE

If you install jq, the command-line JSON parser, you can do this as a single line with bash's command substitution:

aws ec2 create-tags --resources `aws ec2 run-instances --image-id ami-3d50120d --instance-type t2.small --subnet-id subnet-xxxxxxx --security-group-ids sg-xxxxxxxx --key-name "MyKey" | jq -r ".Instances[0].InstanceId"` --tags "Key=Name,Value=development_webserver"

EXAMPLES

echo '[{"version":"1.7.0_51","package":"java"},{"package":"samtools","version":"0.1.19"},{"package":"bamtools","version":"v2.3.0"},{"package":"picard","version":"1.103"},{"package":"gatk","version":"3.3-0"},{"version":"0.9.3","package":"fastqc"}]' | jq '.[]'
{
  "package": "java",
  "version": "1.7.0_51"
}
{
  "version": "0.1.19",
  "package": "samtools"
}
{
  "version": "v2.3.0",
  "package": "bamtools"
}
{
  "version": "1.103",
  "package": "picard"
}
{
  "version": "3.3-0",
  "package": "gatk"
}
{
  "package": "fastqc",
  "version": "0.9.3"
}

echo '[{"version":"1.7.0_51","package":"java"},{"package":"samtools","version":"0.1.19"},{"package":"bamtools","version":"v2.3.0"},{"package":"picard","version":"1.103"},{"package":"gatk","version":"3.3-0"},{"version":"0.9.3","package":"fastqc"}]' | jq '[.[]]'


[
  {
    "package": "java",
    "version": "1.7.0_51"
  },
  {
    "version": "0.1.19",
    "package": "samtools"
  },
  {
    "version": "v2.3.0",
    "package": "bamtools"
  },
  {
    "version": "1.103",
    "package": "picard"
  },
  {
    "version": "3.3-0",
    "package": "gatk"
  },
  {
    "package": "fastqc",
    "version": "0.9.3"
  }
]


Use jq to extract just the first commit.

curl 'https://api.github.com/repos/stedolan/jq/commits?per_page=5' | jq '.[0]'

The | operator in jq feeds the output of one filter (.[0] which gets the first element of the array in the response) into the input of another ({...} which builds an object out of those fields). You can access nested attributes, such as .commit.message.

curl 'https://api.github.com/repos/stedolan/jq/commits?per_page=5' | jq '.[0] | {message: .commit.message, name: .commit.committer.name}'
    
    {
      "name": "David Tolnay",
      "message": "Add travis and coveralls badges to readme"
    }


.[] returns each element of the array returned in the response, one at a time, which are all fed into {message: .commit.message, name: .commit.committer.name}.

curl 'https://api.github.com/repos/stedolan/jq/commits?per_page=5' | jq '.[] | {message: .commit.message, name: .commit.committer.name}'


Get the output as a single array by wrapping the filter in square brackets:

curl 'https://api.github.com/repos/stedolan/jq/commits?per_page=5' | jq '[.[] | {message: .commit.message, name: .commit.committer.name}]'


Get the URLs of the parent commits out of the API results as well. In each commit, the GitHub API includes information about “parent” commits, e.g.:

"parents": [
  {
    "sha": "54b9c9bdb225af5d886466d72f47eafc51acb4f7",
    "url": "https://api.github.com/repos/stedolan/jq/commits/54b9c9bdb225af5d886466d72f47eafc51acb4f7",
    "html_url": "https://github.com/stedolan/jq/commit/54b9c9bdb225af5d886466d72f47eafc51acb4f7"
  },
  {
    "sha": "8b1b503609c161fea4b003a7179b3fbb2dd4345a",
    "url": "https://api.github.com/repos/stedolan/jq/commits/8b1b503609c161fea4b003a7179b3fbb2dd4345a",
    "html_url": "https://github.com/stedolan/jq/commit/8b1b503609c161fea4b003a7179b3fbb2dd4345a"
  }
]

Pull out all of the “html_url” fields inside that array of parent commits and make a simple list of strings to go along with the “message” and “author” fields we already have.

curl 'https://api.github.com/repos/stedolan/jq/commits?per_page=5' | jq '[.[] | {message: .commit.message, name: .commit.committer.name, parents: [.parents[].html_url]}]'


Here we’re making an object as before, but this time the parents field is being set to [.parents[].html_url], which collects all of the parent commit URLs defined in the parents object.


</entry>
<entry [Sun 2015:08:02 04:19:22 EST] FIX NETWORKING>

PROBLEM

CAN CONNECT TO WIRED OR WIRELESS BUT BROWSER DOESN'T CONNECT


DIAGNOSIS

/etc/resolv.conf IS A FILE WHEN IT SHOULD BE A SYMLINK TO /run/resolvconf/resolv.conf:

resolvconf -u
/etc/resolvconf/update.d/libc: Warning: /etc/resolv.conf is not a symbolic link to /run/resolvconf/resolv.conf

... AND /etc/hosts LOOKS OKAY:

cat /etc/hosts
    127.0.0.1	localhost
    127.0.1.1	comp3
    
    # The following lines are desirable for IPv6 capable hosts
    ::1     ip6-localhost ip6-loopback
    fe00::0 ip6-localnet
    ff00::0 ip6-mcastprefix
    ff02::1 ip6-allnodes
    ff02::2 ip6-allrouters
    
    #### DNS SERVER
    68.105.29.16    sgehuxps801.sgnl.local  sgehuxps801
    
    #### DESKTOP
    192.168.12.28   sgsyoxps801.sgnl.local  sgsyoxps801



SOLUTION

rm -fr /etc/resolv.conf
ln -s /run/resolvconf/resolv.conf /etc/resolv.conf
resolvconf -u
cat /etc/resolv.conf

    # Dynamic resolv.conf(5) file for glibc resolver(3) generated by resolvconf(8)
    #     DO NOT EDIT THIS FILE BY HAND -- YOUR CHANGES WILL BE OVERWRITTEN
    nameserver 127.0.1.1
    search fios-router.home

... AND CAN BROWSE NORMALLY WITH CHROME



    
</entry>
<entry [Fri 2015:06:12 16:26:48 EST] USE lsof -i TO MONITOR SERVER AND PORT>

http://www.linuxquestions.org/questions/*bsd-17/netstat-ntulp-for-freebsd-550915/

Linux netstat has several flags not on other *Nixes.

You can probably get what you're looking for with the "-t, -u" flags by doing the following:

Code:
netstat -an |egrep "^tcp|^udp"
The -p flag is unique to Linux so far as I know. To associate processes with ports you can use lsof:

Code:
lsof -i
lsof is a great utility that has many other uses. If you were looking for a certain port for example you could just do:

lsof -i : port

OR for a certain server:

lsof -i @server:

Or a certain port to a certain server:

lsof -i @server: port
    
</entry>
<entry [Sat 2015:05:30 15:09:44 EST] INSTALL SHOTWELL TO UPLOAD TO FLICKR>

1. INSTALL SHOTWELL 


2. CREAT FLICKR ACCOUNT


USER: stuartpeteryoung
PASS: D**********


Publishing to Facebook requires you to grant certain permissions to the Shotwell Connect Facebook application. You only need to grant these permissions once, when you first associate Shotwell Connect with your Facebook account.


3. ADD FLICKR PLUGIN



4. 
To publish selected photos in a collection, choose*Edit*▸*Preferences*and click on the*Plugins*tab to enable the plugin for the service you want to publish to. Next, choose,*File*▸*Publish, press the*Publish*toolbar button or useCtrl+P. You will see a dialog that lets you select a publishing service.


Similarly, publishing to Flickr requires you to log in and permit Shotwell Connect to access your account.

If you have a Google account, but have not yet used Picasa Web Albums, you will need to log in to Picasa using a browser once before you can publish to this service. Additionally, you cannot use Google hosted accounts for Picasa Web Albums. Google hosted accounts generally end in something other than @gmail.com.

</entry>
<entry [Sun 2015:04:26 01:25:54 EST] WATCH AMAZON PRIME>


OPTION 1
--------

sudo add-apt-repository ppa:mjblenner/ppa-hal
sudo apt-get update 
sudo apt-get install hal
Here is a post with more information LINK Post number 3

OPTION 2
--------

If after a reboot it wont work then copy paste this to a terminal, ONE LINE AT A TIME

sudo mkdir /etc/hal/fdi/preprobe
sudo add-apt-repository ppa:pipelight/stable
sudo apt-get update
sudo apt-get install --install-recommends pipelight-multi
sudo pipelight-plugin --update
sudo mkdir /etc/hal/fdi/information

/usr/sbin/hald --daemon=yes --verbose=yes

rm -rf ~/.adobe

Do not be worried by these commands enter them one at a time and tell me of any errors ,reboot when you are finished.


OPTION 3
--------

OK If this is not working for you we will try another way, open terminal run one at a time

sudo add-apt-repository ppa:pipelight/stable
sudo apt-get update
sudo apt-get install --install-recommends pipelight-multi
sudo pipelight-plugin --update
If a Microsoft core fonts licence screen comes up, first perss the tab key and then enter.

next run this command (this undoes what we first tried)

sudo apt-get remove --purge hal
And finally

sudo pipelight-plugin --enable flash
You could reboot here don't think you need to up to you.

Open your web browser and go to your video, the browser shoud automaticly try to download a plug in, give it permission if you have to.

When it is installed close your browser then open it again and it should work

To get silverlight close the browser

sudo pipelight-plugin --enable silverlight
Open the browser go to the video and the plug in will install then restart the browser.



    
</entry>
<entry [Tue 2015:04:14 14:24:31 EST] CHECK CPU USAGE>

http://www.cyberciti.biz/tips/how-do-i-find-out-linux-cpu-utilization.html

Find Linux CPU utilization using mpstat and other tools

Please note that you need to install special package called sysstat to take advantage of following commands. This package includes system performance tools for Linux (Red Hat Linux / RHEL includes these tools by default).

# apt-get install sysstat

Use up2date command if you are using RHEL:
# up2date sysstat

Display the utilization of each CPU individually using mpstat

If you are using SMP (Multiple CPU) system, use mpstat command to display the utilization of each CPU individually. It report processors related statistics. For example, type command:
# mpstat
Output:

Linux 2.6.15.4 (debian)         Thursday 06 April 2006
05:13:05  IST  CPU   %user   %nice    %sys %iowait    %irq   %soft  %steal   %idle    intr/s
05:13:05  IST  all   16.52    0.00    2.87    1.09    0.07    0.02    0.00   79.42    830.06
The mpstat command display activities for each available processor, processor 0 being the first one. Global average activities among all processors are also reported. The mpstat command can be used both on SMP and UP machines, but in the latter, only global average activities will be printed.:
# mpstat -P ALL

Output:

Linux 2.6.15.4 (wwwportal1.xxxx.co.in)         Thursday 06 April 2006
05:14:58  IST  CPU   %user   %nice    %sys %iowait    %irq   %soft  %steal   %idle    intr/s
05:14:58  IST  all   16.46    0.00    2.88    1.08    0.07    0.02    0.00   79.48    835.96
05:14:58  IST    0   16.46    0.00    2.88    1.08    0.07    0.02    0.00   79.48    835.96
05:14:58  IST    1   15.77    2.70    3.17    2.01    0.05    0.03    0.00   81.44    822.54
Another output from my HP Dual Opteron 64 bit server:
# mpstat -P ALL
Output:

Linux 2.6.5-7.252-smp (ora9.xxx.in)   04/07/06
07:44:18     CPU   %user   %nice %system %iowait    %irq   %soft   %idle    intr/s
07:44:18     all    3.01   57.31    0.36    0.13    0.01    0.00   39.19   1063.46
07:44:18       0    5.87   69.47    0.44    0.05    0.01    0.01   24.16    262.11
07:44:18       1    1.79   48.59    0.36    0.23    0.00    0.00   49.02    268.92
07:44:18       2    2.19   42.63    0.28    0.16    0.01    0.00   54.73    260.96
07:44:18       3    2.17   68.56    0.34    0.06    0.03    0.00   28.83    271.47
Report CPU utilization using sar command

You can display today’s CPU activity, with sar command:
# sar

Output:

Linux 2.6.9-42.0.3.ELsmp (dellbox.xyz.co.in)         01/13/2007
12:00:02 AM       CPU     %user     %nice   %system   %iowait     %idle
12:10:01 AM       all      1.05      0.00      0.28      0.04     98.64
12:20:01 AM       all      0.74      0.00      0.34      0.38     98.54
12:30:02 AM       all      1.09      0.00      0.28      0.10     98.53
12:40:01 AM       all      0.76      0.00      0.21      0.03     99.00
12:50:01 AM       all      1.25      0.00      0.32      0.03     98.40
01:00:01 AM       all      0.80      0.00      0.24      0.03     98.92
...
.....
..
04:40:01 AM       all      8.39      0.00     33.17      0.06     58.38
04:50:01 AM       all      8.68      0.00     37.51      0.04     53.78
05:00:01 AM       all      7.10      0.00     30.48      0.04     62.39
05:10:01 AM       all      8.78      0.00     37.74      0.03     53.44
05:20:02 AM       all      8.30      0.00     35.45      0.06     56.18
Average:          all      3.09      0.00      9.14      0.09     87.68
Comparison of CPU utilization
The sar command writes to standard output the contents of selected cumulative activity counters in the operating system. The accounting system, based on the values in the count and interval parameters. For example display comparison of CPU utilization; 2 seconds apart; 5 times, use:
# sar -u 2 5

Output (for each 2 seconds. 5 lines are displayed):

Linux 2.6.9-42.0.3.ELsmp (www1lab2.xyz.ac.in)         01/13/2007
05:33:24 AM       CPU     %user     %nice   %system   %iowait     %idle
05:33:26 AM       all      9.50      0.00     49.00      0.00     41.50
05:33:28 AM       all     16.79      0.00     74.69      0.00      8.52
05:33:30 AM       all     17.21      0.00     80.30      0.00      2.49
05:33:32 AM       all     16.75      0.00     81.00      0.00      2.25
05:33:34 AM       all     14.29      0.00     72.43      0.00     13.28
Average:          all     14.91      0.00     71.49      0.00     13.61
Where,

-u 12 5 : Report CPU utilization. The following values are displayed:
%user: Percentage of CPU utilization that occurred while executing at the user level (application).
%nice: Percentage of CPU utilization that occurred while executing at the user level with nice priority.
%system: Percentage of CPU utilization that occurred while executing at the system level (kernel).
%iowait: Percentage of time that the CPU or CPUs were idle during which the system had an outstanding disk I/O request.
%idle: Percentage of time that the CPU or CPUs were idle and the system did not have an outstanding disk I/O request.
To get multiple samples and multiple reports set an output file for the sar command. Run the sar command as a background process using.
# sar -o output.file 12 8 >/dev/null 2>&1 &

Better use nohup command so that you can logout and check back report later on:
# nohup sar -o output.file 12 8 >/dev/null 2>&1 &

All data is captured in binary form and saved to a file (data.file). The data can then be selectively displayed ith the sar command using the -f option.
# sar -f data.file

Task: Find out who is monopolizing or eating the CPUs

Finally, you need to determine which process is monopolizing or eating the CPUs. Following command will displays the top 10 CPU users on the Linux system.
# ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10

OR
# ps -eo pcpu,pid,user,args | sort -r -k1 | less

Output:

%CPU   PID USER     COMMAND
  96  2148 vivek    /usr/lib/vmware/bin/vmware-vmx -C /var/lib/vmware/Virtual Machines/Ubuntu 64-bit/Ubuntu 64-bit.vmx -@ ""
 0.7  3358 mysql    /usr/libexec/mysqld --defaults-file=/etc/my.cnf --basedir=/usr --datadir=/var/lib/mysql --user=mysql --pid-file=/var/run/mysqld/mysqld.pid --skip-locking --socket=/var/lib/mysql/mysql.sock
 0.4 29129 lighttpd /usr/bin/php
 0.4 29128 lighttpd /usr/bin/php
 0.4 29127 lighttpd /usr/bin/php
 0.4 29126 lighttpd /usr/bin/php
 0.2  2177 vivek    [vmware-rtc]
 0.0     9 root     [kacpid]
 0.0     8 root     [khelper]
Now you know vmware-vmx process is eating up lots of CPU power. ps command displays every process (-e) with a user-defined format (-o pcpu). First field is pcpu (cpu utilization). It is sorted in reverse order to display top 10 CPU eating process.

iostat command

You can also use iostat command which report Central Processing Unit (CPU) statistics and input/output statistics for devices and partitions. It can be use to find out your system's average CPU utilization since the last reboot.
# iostat
Output:

Linux 2.6.15.4 (debian)         Thursday 06 April 2006
avg-cpu:  %user   %nice %system %iowait  %steal   %idle
     16.36    0.00    2.99    1.06    0.00   79.59
Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
hda               0.00         0.00         0.00         16          0
hdb               6.43        85.57       166.74     875340    1705664
hdc               0.03         0.16         0.00       1644          0
sda               0.00         0.00         0.00         24          0 
You may want to use following command, which gives you three outputs every 5 seconds (as previous command gives information since the last reboot):
$ iostat -xtc 5 3

GUI tools for your laptops/desktops

Above tools/commands are quite useful on remote server. For local system with X GUI installed you can try out gnome-system-monitor. It allows you to view and control the processes running on your system. You can access detailed memory maps, send signals, and terminate the processes.
$ gnome-system-monitor

gnome-system-monitor - view and control the processes
(Click to enlarge image)

In addition, the gnome-system-monitor provides an overall view of the resource usage on your system, including memory and CPU allocation.
    
</entry>
<entry [Thu 2015:02:19 16:28:39 EST] LOG OF FAILED WIFI NETWORK CONNECTION>

Feb 19 16:22:53 comp3 avahi-daemon[745]: Joining mDNS multicast group on interface wlan0.IPv6 with address fe80::6a5d:43ff:fe56:ae0.
Feb 19 16:22:53 comp3 avahi-daemon[745]: New relevant interface wlan0.IPv6 for mDNS.
Feb 19 16:22:53 comp3 avahi-daemon[745]: Registering new address record for fe80::6a5d:43ff:fe56:ae0 on wlan0.*.
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> Activation (wlan0) starting connection 'maroontown'
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> (wlan0): device state change: disconnected -> prepare (reason 'none') [30 40 0]
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> NetworkManager state is now CONNECTING
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> Activation (wlan0) Stage 1 of 5 (Device Prepare) scheduled...
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> Activation (wlan0) Stage 1 of 5 (Device Prepare) started...
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> Activation (wlan0) Stage 2 of 5 (Device Configure) scheduled...
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> Activation (wlan0) Stage 1 of 5 (Device Prepare) complete.
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> Activation (wlan0) Stage 2 of 5 (Device Configure) starting...
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> (wlan0): device state change: prepare -> config (reason 'none') [40 50 0]
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> Activation (wlan0/wireless): access point 'maroontown' has security, but secrets are required.
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> (wlan0): device state change: config -> need-auth (reason 'none') [50 60 0]
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> Activation (wlan0) Stage 2 of 5 (Device Configure) complete.
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> Activation (wlan0) Stage 1 of 5 (Device Prepare) scheduled...
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> Activation (wlan0) Stage 1 of 5 (Device Prepare) started...
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> (wlan0): device state change: need-auth -> prepare (reason 'none') [60 40 0]
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> Activation (wlan0) Stage 2 of 5 (Device Configure) scheduled...
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> Activation (wlan0) Stage 1 of 5 (Device Prepare) complete.
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> Activation (wlan0) Stage 2 of 5 (Device Configure) starting...
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> (wlan0): device state change: prepare -> config (reason 'none') [40 50 0]
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> Activation (wlan0/wireless): connection 'maroontown' has security, and secrets exist.  No new secrets needed.
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> Config: added 'ssid' value 'maroontown'
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> Config: added 'scan_ssid' value '1'
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> Config: added 'key_mgmt' value 'WPA-PSK'
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> Config: added 'auth_alg' value 'OPEN'
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> Config: added 'psk' value '< omitted>'
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> Activation (wlan0) Stage 2 of 5 (Device Configure) complete.
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> Config: set interface ap_scan to 1
Feb 19 16:27:33 comp3 wpa_supplicant[1312]: message repeated 7 times: [ wlan0: CTRL-EVENT-SCAN-STARTED ]
Feb 19 16:27:37 comp3 wpa_supplicant[1312]: wlan0: SME: Trying to authenticate with 14:cf:e2:b4:70:50 (SSID='maroontown' freq=2412 MHz)
Feb 19 16:27:37 comp3 kernel: [  432.379087] wlan0: authenticate with 14:cf:e2:b4:70:50
Feb 19 16:27:37 comp3 kernel: [  432.382762] wlan0: send auth to 14:cf:e2:b4:70:50 (try 1/3)
Feb 19 16:27:37 comp3 wpa_supplicant[1312]: wlan0: Trying to associate with 14:cf:e2:b4:70:50 (SSID='maroontown' freq=2412 MHz)
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> (wlan0): supplicant interface state: disconnected -> authenticating
Feb 19 16:27:37 comp3 kernel: [  432.384696] wlan0: authenticated
Feb 19 16:27:37 comp3 kernel: [  432.387266] wlan0: associate with 14:cf:e2:b4:70:50 (try 1/3)
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> (wlan0): supplicant interface state: authenticating -> associating
Feb 19 16:27:37 comp3 kernel: [  432.397541] wlan0: RX AssocResp from 14:cf:e2:b4:70:50 (capab=0xc31 status=0 aid=7)
Feb 19 16:27:37 comp3 wpa_supplicant[1312]: wlan0: Associated with 14:cf:e2:b4:70:50
Feb 19 16:27:37 comp3 kernel: [  432.399866] wlan0: associated
Feb 19 16:27:37 comp3 kernel: [  432.399975] cfg80211: Calling CRDA for country: US
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> (wlan0): supplicant interface state: associating -> associated
Feb 19 16:27:37 comp3 kernel: [  432.404683] cfg80211: Regulatory domain changed to country: US
Feb 19 16:27:37 comp3 kernel: [  432.404689] cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp)
Feb 19 16:27:37 comp3 kernel: [  432.404692] cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), (300 mBi, 2700 mBm)
Feb 19 16:27:37 comp3 kernel: [  432.404695] cfg80211:   (5170000 KHz - 5250000 KHz @ 40000 KHz), (300 mBi, 1700 mBm)
Feb 19 16:27:37 comp3 kernel: [  432.404698] cfg80211:   (5250000 KHz - 5330000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
Feb 19 16:27:37 comp3 kernel: [  432.404700] cfg80211:   (5490000 KHz - 5600000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
Feb 19 16:27:37 comp3 kernel: [  432.404702] cfg80211:   (5650000 KHz - 5710000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
Feb 19 16:27:37 comp3 kernel: [  432.404706] cfg80211:   (5735000 KHz - 5835000 KHz @ 40000 KHz), (300 mBi, 3000 mBm)
Feb 19 16:27:37 comp3 kernel: [  432.404710] cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000 KHz), (N/A, 4000 mBm)
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> (wlan0): supplicant interface state: associated -> 4-way handshake
Feb 19 16:27:37 comp3 wpa_supplicant[1312]: wlan0: WPA: Key negotiation completed with 14:cf:e2:b4:70:50 [PTK=CCMP GTK=CCMP]
Feb 19 16:27:37 comp3 wpa_supplicant[1312]: wlan0: CTRL-EVENT-CONNECTED - Connection to 14:cf:e2:b4:70:50 completed [id=0 id_str=]
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> (wlan0): supplicant interface state: 4-way handshake -> completed
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> Activation (wlan0/wireless) Stage 2 of 5 (Device Configure) successful.  Connected to wireless network 'maroontown'.
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> Activation (wlan0) Stage 3 of 5 (IP Configure Start) scheduled.
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> Activation (wlan0) Stage 3 of 5 (IP Configure Start) started...
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> (wlan0): device state change: config -> ip-config (reason 'none') [50 70 0]
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> Activation (wlan0) Beginning DHCPv4 transaction (timeout in 45 seconds)
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> dhclient started with pid 3853
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> Activation (wlan0) Beginning IP6 addrconf.
Feb 19 16:27:37 comp3 avahi-daemon[745]: Withdrawing address record for fe80::6a5d:43ff:fe56:ae0 on wlan0.
Feb 19 16:27:37 comp3 avahi-daemon[745]: Leaving mDNS multicast group on interface wlan0.IPv6 with address fe80::6a5d:43ff:fe56:ae0.
Feb 19 16:27:37 comp3 avahi-daemon[745]: Interface wlan0.IPv6 no longer relevant for mDNS.
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> Activation (wlan0) Stage 3 of 5 (IP Configure Start) complete.
Feb 19 16:27:37 comp3 dhclient: Internet Systems Consortium DHCP Client 4.2.4
Feb 19 16:27:37 comp3 dhclient: Copyright 2004-2012 Internet Systems Consortium.
Feb 19 16:27:37 comp3 dhclient: All rights reserved.
Feb 19 16:27:37 comp3 dhclient: For info, please visit https://www.isc.org/software/dhcp/
Feb 19 16:27:37 comp3 dhclient: 
Feb 19 16:27:37 comp3 NetworkManager[952]: < info> (wlan0): DHCPv4 state changed nbi -> preinit
Feb 19 16:27:37 comp3 dhclient: Listening on LPF/wlan0/68:5d:43:56:0a:e0
Feb 19 16:27:37 comp3 dhclient: Sending on   LPF/wlan0/68:5d:43:56:0a:e0
Feb 19 16:27:37 comp3 dhclient: Sending on   Socket/fallback
Feb 19 16:27:37 comp3 dhclient: DHCPDISCOVER on wlan0 to 255.255.255.255 port 67 interval 3 (xid=0x4b1f4460)
Feb 19 16:27:38 comp3 avahi-daemon[745]: Joining mDNS multicast group on interface wlan0.IPv6 with address fe80::6a5d:43ff:fe56:ae0.
Feb 19 16:27:38 comp3 avahi-daemon[745]: New relevant interface wlan0.IPv6 for mDNS.
Feb 19 16:27:38 comp3 avahi-daemon[745]: Registering new address record for fe80::6a5d:43ff:fe56:ae0 on wlan0.*.
Feb 19 16:27:39 comp3 avahi-daemon[745]: Leaving mDNS multicast group on interface wlan0.IPv6 with address fe80::6a5d:43ff:fe56:ae0.
Feb 19 16:27:39 comp3 avahi-daemon[745]: Joining mDNS multicast group on interface wlan0.IPv6 with address 2606:6000:c4c2:9a00:6a5d:43ff:fe56:ae0.
Feb 19 16:27:39 comp3 avahi-daemon[745]: Registering new address record for 2606:6000:c4c2:9a00:6a5d:43ff:fe56:ae0 on wlan0.*.
Feb 19 16:27:39 comp3 NetworkManager[952]: < info> Activation (wlan0) Stage 3 of 5 (IP Configure Start) starting DHCPv6 as requested by IPv6 router...
Feb 19 16:27:39 comp3 avahi-daemon[745]: Withdrawing address record for fe80::6a5d:43ff:fe56:ae0 on wlan0.
Feb 19 16:27:39 comp3 NetworkManager[952]: < info> Activation (wlan0) Beginning DHCPv6 transaction (timeout in 45 seconds)
Feb 19 16:27:39 comp3 NetworkManager[952]: < info> dhclient started with pid 3856
Feb 19 16:27:39 comp3 dhclient: Internet Systems Consortium DHCP Client 4.2.4
Feb 19 16:27:39 comp3 dhclient: Copyright 2004-2012 Internet Systems Consortium.
Feb 19 16:27:39 comp3 dhclient: All rights reserved.
Feb 19 16:27:39 comp3 dhclient: For info, please visit https://www.isc.org/software/dhcp/
Feb 19 16:27:39 comp3 dhclient: 
Feb 19 16:27:39 comp3 dhclient: Bound to *:546
Feb 19 16:27:39 comp3 dhclient: Listening on Socket/wlan0
Feb 19 16:27:39 comp3 dhclient: Sending on   Socket/wlan0
Feb 19 16:27:39 comp3 avahi-daemon[745]: Registering new address record for 2606:6000:c4c2:9a00:f16f:7df6:762:3c35 on wlan0.*.
Feb 19 16:27:40 comp3 dhclient: XMT: Info-Request on wlan0, interval 1070ms.
Feb 19 16:27:40 comp3 dhclient: DHCPDISCOVER on wlan0 to 255.255.255.255 port 67 interval 6 (xid=0x4b1f4460)
Feb 19 16:27:41 comp3 dhclient: XMT: Info-Request on wlan0, interval 2070ms.
Feb 19 16:27:41 comp3 dhclient: DHCPREQUEST of 192.168.0.8 on wlan0 to 255.255.255.255 port 67 (xid=0x4b1f4460)
Feb 19 16:27:41 comp3 dhclient: DHCPOFFER of 192.168.0.8 from 192.168.0.1
Feb 19 16:27:41 comp3 dhclient: DHCPACK of 192.168.0.8 from 192.168.0.1
Feb 19 16:27:41 comp3 dhclient: bound to 192.168.0.8 -- renewal in 1636 seconds.
Feb 19 16:27:41 comp3 NetworkManager[952]: < info> (wlan0): DHCPv4 state changed preinit -> bound
Feb 19 16:27:41 comp3 NetworkManager[952]: < info>   address 192.168.0.8
Feb 19 16:27:41 comp3 NetworkManager[952]: < info>   prefix 24 (255.255.255.0)
Feb 19 16:27:41 comp3 NetworkManager[952]: < info>   gateway 192.168.0.1
Feb 19 16:27:41 comp3 NetworkManager[952]: < info>   hostname 'comp3'
Feb 19 16:27:41 comp3 NetworkManager[952]: < info>   nameserver '209.18.47.61'
Feb 19 16:27:41 comp3 NetworkManager[952]: < info>   nameserver '209.18.47.62'
Feb 19 16:27:41 comp3 NetworkManager[952]: < info> Activation (wlan0) Stage 5 of 5 (IPv4 Configure Commit) scheduled...
Feb 19 16:27:41 comp3 NetworkManager[952]: < info> Activation (wlan0) Stage 5 of 5 (IPv4 Commit) started...
Feb 19 16:27:41 comp3 avahi-daemon[745]: Joining mDNS multicast group on interface wlan0.IPv4 with address 192.168.0.8.
Feb 19 16:27:41 comp3 avahi-daemon[745]: New relevant interface wlan0.IPv4 for mDNS.
Feb 19 16:27:41 comp3 avahi-daemon[745]: Registering new address record for 192.168.0.8 on wlan0.IPv4.
Feb 19 16:27:42 comp3 NetworkManager[952]: < info> (wlan0): device state change: ip-config -> secondaries (reason 'none') [70 90 0]
Feb 19 16:27:42 comp3 NetworkManager[952]: < info> Activation (wlan0) Stage 5 of 5 (IPv4 Commit) complete.
Feb 19 16:27:42 comp3 NetworkManager[952]: < info> (wlan0): device state change: secondaries -> activated (reason 'none') [90 100 0]
Feb 19 16:27:42 comp3 NetworkManager[952]: < info> NetworkManager state is now CONNECTED_GLOBAL
Feb 19 16:27:42 comp3 NetworkManager[952]: < info> Policy set 'maroontown' (wlan0) as default for IPv4 routing and DNS.
Feb 19 16:27:42 comp3 NetworkManager[952]: < info> DNS: starting dnsmasq...
Feb 19 16:27:42 comp3 NetworkManager[952]: < warn> dnsmasq not available on the bus, can't update servers.
Feb 19 16:27:42 comp3 NetworkManager[952]: < error> [1424392062.785648] [nm-dns-dnsmasq.c:396] update(): dnsmasq owner not found on bus: Could not get owner of name 'org.freedesktop.NetworkManager.dnsmasq': no such name
Feb 19 16:27:42 comp3 NetworkManager[952]: < warn> DNS: plugin dnsmasq update failed
Feb 19 16:27:42 comp3 NetworkManager[952]: < info> Writing DNS information to /sbin/resolvconf
Feb 19 16:27:42 comp3 dnsmasq[3860]: started, version 2.68 cache disabled
Feb 19 16:27:42 comp3 dnsmasq[3860]: compile time options: IPv6 GNU-getopt DBus i18n IDN DHCP DHCPv6 no-Lua TFTP conntrack ipset auth
Feb 19 16:27:42 comp3 dnsmasq[3860]: DBus support enabled: connected to system bus
Feb 19 16:27:42 comp3 dnsmasq[3860]: warning: no upstream servers configured
Feb 19 16:27:42 comp3 NetworkManager[952]: < info> Activation (wlan0) successful, device activated.
Feb 19 16:27:42 comp3 dbus[519]: [system] Activating service name='org.freedesktop.nm_dispatcher' (using servicehelper)
Feb 19 16:27:42 comp3 NetworkManager[952]: < warn> dnsmasq appeared on DBus: :1.97
Feb 19 16:27:42 comp3 NetworkManager[952]: < info> Writing DNS information to /sbin/resolvconf
Feb 19 16:27:42 comp3 dnsmasq[3860]: setting upstream servers from DBus
Feb 19 16:27:42 comp3 dnsmasq[3860]: using nameserver 209.18.47.62#53
Feb 19 16:27:42 comp3 dnsmasq[3860]: using nameserver 209.18.47.61#53
Feb 19 16:27:42 comp3 dbus[519]: [system] Successfully activated service 'org.freedesktop.nm_dispatcher'
Feb 19 16:27:42 comp3 whoopsie[1256]: message repeated 24 times: [ offline]
Feb 19 16:27:43 comp3 whoopsie[1256]: online
Feb 19 16:27:43 comp3 dhclient: XMT: Info-Request on wlan0, interval 4100ms.
Feb 19 16:27:47 comp3 dhclient: XMT: Info-Request on wlan0, interval 7890ms.
Feb 19 16:27:49 comp3 ntpdate[3955]: adjust time server 91.189.94.4 offset -0.494484 sec
Feb 19 16:27:55 comp3 dhclient: XMT: Info-Request on wlan0, interval 16000ms.
^Z


	
</entry>
<entry [Wed 2015:02:18 11:50:44 EST] DATE/TIME NOT SHOWING IN TOP BAR>

sudo killall unity-panel-service

	
</entry>
<entry [Thu 2015:02:12 01:58:47 EST] FIXED PLAY MP4 IN FIREFOX>

PROBLEM

Ubuntu 14.04, problem when install gstreamer1.0-libav, unmet dependencies

SOLUTION

sudo apt-get install libopus0
sudo apt-get install gstreamer1.0-libav


	
</entry>
<entry [Fri 2015:01:23 08:38:12 EST] FIXED PROBLEM - HISTORY NOT SAVED>

1. CHECK IF hisappend COMMAND IS ON

shopt -s

	checkwinsize   	on
	cmdhist        	on
	complete_fullquote	on
	expand_aliases 	on
	extglob        	on
	extquote       	on
	force_fignore  	on
	histappend     	on
	interactive_comments	on
	progcomp       	on
	promptvars     	on
	sourcepath     	on

	
2. ADD TO .profile TO SAVE HISTORY IN EVERY NEW PROMPT

export PROMPT_COMMAND='history -a'



3. MAKE SURE .bash_history IS OWNED BY YOU

sudo chown syoung:syoung ~/.bash_history


</entry>
<entry [Sat 2015:01:17 02:12:09 EST] INSTALL tails>

https://tails.boum.org/download/index.en.html#download.verify-the-iso-image-using-the-command-line


	
</entry>
<entry [Fri 2014:12:19 11:15:24 EST] CHECK DRIVE IS SSD ON AWS>

Measure the speed of SSD and EBS volumes

1. INSTALL ioping

apt-get install ioping


2. TEST DRIVE SPEED

SSD TRANSFER RATE 	62 MBps (/dev/vxdb)
HDD TRANSFER RATE 	0.5 MBps - 7MBps

HDDs (xvda1, xvdd, xvdf, xvdg)
====

sudo ioping -R /dev/xvda1 -c 1000

-- /dev/xvda1 (device 10.0 GiB) ioping statistics ---
1.0 k requests completed in 558.0 ms, 1.8 k iops, 7.0 MiB/s
min/avg/max/mdev = 239 us / 556 us / 743 us / 53 us

sudo ioping -R /dev/xvdd -c 1000

--- /dev/xvdd (device 100.0 GiB) ioping statistics ---
403 requests completed in 3.0 s, 134 iops, 537.1 KiB/s
min/avg/max/mdev = 324 us / 7.4 ms / 10.5 ms / 1.4 ms

sudo ioping -R /dev/xvdf -c 1000

--- /dev/xvdf (device 1000.0 GiB) ioping statistics ---
697 requests completed in 3.0 s, 232 iops, 929.7 KiB/s
min/avg/max/mdev = 401 us / 4.3 ms / 10.4 ms / 3.2 ms

sudo ioping -R /dev/xvdg -c 1000

--- /dev/xvdg (device 1000.0 GiB) ioping statistics ---
1.0 k requests completed in 843.4 ms, 1.2 k iops, 4.6 MiB/s
min/avg/max/mdev = 442 us / 841 us / 9.6 ms / 1.5 ms


SSDs
====

sudo ioping -R /dev/xvdb -c 1000

--- /dev/xvdb (device 37.5 GiB) ioping statistics ---
1.0 k requests completed in 64.9 ms, 15.8 k iops, 61.8 MiB/s
min/avg/max/mdev = 48 us / 63 us / 329 us / 36 us

sudo ioping -R /dev/xvdc -c 1000

--- /dev/xvdc (device 37.5 GiB) ioping statistics ---
1.0 k requests completed in 62.8 ms, 16.4 k iops, 64.0 MiB/s
min/avg/max/mdev = 45 us / 61 us / 327 us / 41 us


</entry>
<entry [Fri 2014:12:19 11:11:10 EST] CHECK IF DRIVE IS SSD (NOT AWS)>

1. INSTALL smartmontools

apt-get install -y smartmontools


2. CHECK DRIVE

sudo smartctl -a /dev/sdb

	
</entry>
<entry [Sun 2014:12:14 12:58:44 EST] SET cua MODE IN EMACS FOR EASY COPY/PASTE>

http://www.emacswiki.org/emacs/CuaMode

1. CREATE .emacs FILE

(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour


2. START EMACS AND USE STANDARD CUT/PASTE SHORTKEYS

copy	CNTL + C
paste	CNTL + V
select	CNTL + ARROW
etc.

	
</entry>
<entry [Fri 2014:09:19 14:49:24 EST] USE PLAYTERM>


1. INSTALL

apt-get install -y ttyrec

2. SET TERMINAL SIZE

set your terminal size to 80x24 or 120x35

SET TO 132x44


3. RECORD SESSION

ttyrec

... do your terminal stuff

exit

CREATES A BINARY FILE IN SAME DIRECTORY

ttyrecord


4. UPLOAD ttyrecord FILE



5. EMBED IN CONFLUENCE

<!--
<div>
    <script id="playterm-MjAxNC0wOS90dHlyZWNvcmQtMTQxMTE4ODY5NXwxMjB4MzU="
        type="text/javascript"
        src="http://www.playterm.org/js/?hash=MjAxNC0wOS90dHlyZWNvcmQtMTQxMTE4ODY5NXwxMjB4MzU="
        class="size:80x24">
    </script>
</div>

-->
    
</entry>
<entry [Fri 2014:09:19 02:34:15 EST] VIEW PRINTER QUEUE AND CANCEL JOB>

lpq -a

    Rank    Owner   Job     File(s)                         Total Size
    1st     syoung  9       Amazon.com - Online Return Cent 208896 bytes

cancel 9

lpq -a
    no entries

    
</entry>
<entry [Wed 2014:09:17 11:15:50 EST] INSTALL CANON MP495 PRINTER DRIVER ON 14.04>

1. DOWNLOAD FILE

wget http://mirrors.kernel.org/ubuntu/pool/universe/t/tiff3/libtiff4_3.9.7-2ubuntu1_amd64.deb
dpkg -i libtiff4_3.9.7-2ubuntu1_amd64.deb

cnijfilter-mp495series-3.40-1-deb.tar.gz

2. UNZIP AND RUN install.sh

tar xvfz cnij*
cd cnij*
./install.sh

cd /home/syoung/software/drivers/canon-pixma-mp495/14.04/cnijfilter-mp495series-3.40-1-deb
./install.sh

    ==================================================
    
    Canon Inkjet Printer Driver Ver.3.40-1 for Linux
    Copyright CANON INC. 2001-2010
    All Rights Reserved.
    
    ==================================================
    Command executed = sudo dpkg -iG ./packages/cnijfilter-common_3.40-1_amd64.deb
    Selecting previously unselected package cnijfilter-common.
    (Reading database ... 211511 files and directories currently installed.)
    Preparing to unpack .../cnijfilter-common_3.40-1_amd64.deb ...
    Unpacking cnijfilter-common (3.40-1) ...
    Setting up cnijfilter-common (3.40-1) ...
    Processing triggers for libc-bin (2.19-0ubuntu6.3) ...
    Command executed = sudo dpkg -iG ./packages/cnijfilter-mp495series_3.40-1_amd64.deb
    Selecting previously unselected package cnijfilter-mp495series.
    (Reading database ... 211527 files and directories currently installed.)
    Preparing to unpack .../cnijfilter-mp495series_3.40-1_amd64.deb ...
    Unpacking cnijfilter-mp495series (3.40-1) ...
    Setting up cnijfilter-mp495series (3.40-1) ...
    Processing triggers for libc-bin (2.19-0ubuntu6.3) ...
    
    #=========================================================#
    #  Register Printer
    #=========================================================#
    Next, register the printer to the computer.
    Connect the printer, and then turn on the power.
    To use the printer on the network, connect the printer to the network.
    When the printer is ready, press the Enter key.
    > 
    
    #=========================================================#
    #  Connection Method
    #=========================================================#
     1) USB
     2) Network
    Select the connection method.[1]2
    
    Searching for printers...
    
    
    #=========================================================#
    #  Select Printer
    #=========================================================#
    Select the printer.
    If the printer you want to use is not listed, select Update [0] to search again.
    To cancel the process, enter [Q].
    -----------------------------------------------------------
     0) Update
    -----------------------------------------------------------
    Target printers detected (MAC address  IP address)
    1) Canon MP495 series (88-87-17-24-FF-F2 192.168.1.19)
    -----------------------------------------------------------
    Currently selected:[1] Canon MP495 series (88-87-17-24-FF-F2 192.168.1.19)
    Enter the value. [1]
    
    #=========================================================#
    #  Register Printer
    #=========================================================#
    Enter the printer name.[MP495LAN]
    Command executed = sudo /usr/sbin/lpadmin -p MP495LAN -m canonmp495.ppd -v cnijnet:/88-87-17-24-FF-F2 -E
    
    #=========================================================#
    #  Set as Default Printer
    #=========================================================#
    Do you want to set this printer as the default printer?
    Enter [y] for Yes or [n] for No.[y]
    
    #=========================================================#
    Installation has been completed.
    Printer Name : MP495LAN
    Select this printer name for printing.
    #=========================================================#



3. ADD PRINTER

Unity --> printer --> Add --> Canon MP 490


4. START NETWORKING ON PRINTER

Maintenance --> 'G' --> Hold down Black


5. PRINT TEST PAGE

    OK


    
</entry>
<entry [Mon 2014:09:15 10:17:29 EST] KEYBOARD SHORTCUTS TO OPEN TERMINAL AND KOMODO WINDOWS>


System Settings --> Keyboard --> Shortcuts --> Launchers --> Launch terminal --> SHIFT + CTRL + T
 
System Settings --> Keyboard --> Shortcuts --> Custom Shortcuts --> Add: komodo --> SHIFT + CTRL + K

    
</entry>
<entry [Sun 2014:09:14 14:40:31 EST] DISABLE 'ALT' KEY OPEN UNITY SEARCH>

SYSTEM SETTINGS --> Keyboard > Shortcuts > Launchers --> open hud for search (hit 'BACKSPACE' to disable)

    
</entry>
<entry [Thu 2014:09:11 04:10:28 EST] FIX BRIGHTNESS ON 14.04>
 
PROBLEM

CAN'T ADJUST THE SCREEN BRIGHTNESS ON UBUNTU 14.04
 

SOLUTION

1. VERIFY HAVE INTEL CARD

ls /sys/class/backlight/

If you see "intel_backlight", you probably have an Intel card.


2. CREATE INTEL CONF FILE

emacs /usr/share/X11/xorg.conf.d/20-intel.conf

    Section "Device"
        Identifier  "card0"
        Driver      "intel"
        Option      "Backlight"  "intel_backlight"
        BusID       "PCI:0:2:0"
    EndSection


3. LOG OUT AND BACK IN


</entry>
<entry [Thu 2014:09:11 04:09:30 EST] INSTALL CHROME>


sudo apt-get install -y libxss1 libappindicator1 libindicator7
mkdir -p ~/software/chrome
cd ~/software/chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb


</entry>
<entry [Sat 2014:08:30 16:13:59 EST] FIX 1024 OPEN FILES LIMIT ON LINUX>


LIST FILES CURRENTLY OPEN BY PROCESS

ls -l /proc/XXXXX/fd


COUNT NO. OF FILES OPENED BY PROCESS

ls -l /proc/XXXXX/fd | wc -l

Where XXXXX is the process id. 
Use this command to check if it reaches a top, and it stops growing after it gets frozen.
(By default 1024 or "ulimit -n").


TRACK ERRORS WITHOUT LOG

# strace -p process-id 

OR

dtruss


PROBLEM

In our company we are setting up a node.js server, connected to a Java Push server.

I'm using https module instead of http and SLL certificates.

The connection between node and clients is made by socket.io, in server and client.

At the same time the node.js server is client of the java server, this connection is being made with regular sockets (net.connect).

The idea is that users connect to the server, join some channels, and when some data arrive from java server, this is dispatched to the corresponding users.

Everything seems to work fine, but after a while, like randomly, having like between 450 and 700 users, the server's CPU reaches 100%, all the connections are broken, but the server is not crashed. The thing is that if you go to the https://... in the browser, you are not getting 404 or something like that but SSL connection error, and its really fast.

I tried to add logs everywhere, but there's not something like a pattern, its like random.

If anybody have the same problem or could bring me a clue, or a tip to debug better, I'll appreciate anything.

Thanks a lot.

edited May 10 '13 at 7:19


DIAGNOSIS

The reason was the default limit of files the Linux server had per each process.

Seems that ever single linux server comes with this limitation of 1024 files opened by each process, you can check your limit with:

ulimit -n


SOLUTION

INCREASE THE ulimit

ulimit -n 5000 (for example)

Each socket creates a new virtual file.

For some reason my server was not displaying any error, the server just got frozen, stopping the log and no signal or evidence of anything. It was when I set up a copy of the server in another machine, when it started to send

warn: error raised: Error: accept EMFILE
warn: error raised: Error: accept EMFILE
warn: error raised: Error: accept EMFILE
...
Be careful because if you are not root, you will only change this for the current session and not permanently.

	
</entry>
<entry [Fri 2014:08:29 16:51:48 EST] TRUNCATE LOG FILES>

*** HAVE NOT VERIFIED ***

You report that /var/log/apache seems "large". I do NOT recommend simply deleting the files. Instead, if you are very very sure that no-one will ever need to see any historical archives of the errors and accesses made, you can:

cd /var/log/apache
for f in *; do > $f; done


which will truncate the files. This will make it less likely to cause problems du
e to non-existant files or bad permissions or required rotation signaling.

If you might need these files in the future, we could talk about using logrotate to try and save them.


	
</entry>
<entry [Fri 2014:08:29 15:23:36 EST] RESTART SYSLOG>

service rsyslogd restart

tail -f /var/log/syslog

	
</entry>
<entry [Thu 2014:08:28 12:25:15 EST] REENABLE last COMMAND>


#Step 1: Recreate the file using the following command
sudo touch /var/log/wtmp

#Step 2: Set proper permissions
sudo chown root:utmp /var/log/wtmp
sudo chmod 0664 /var/log/wtmp

	
</entry>
<entry [Thu 2014:08:28 01:24:50 EST] FIXED WIFI CONNECT>

SUMMARY: DISABLED THEN RESET WEP PASSWORD ON ROUTER


PROBLEM

CAN'T CONNECT TO WIFI USING network-manager WINDOW


DIAGNOSIS

iwconfig wlan0


iwconfig wlan0

wlan0     IEEE 802.11bgn  ESSID:off/any  
          Mode:Managed  Access Point: Not-Associated   Tx-Power=16 dBm   
          Retry  long limit:7   RTS thr:off   Fragment thr:off
          Encryption key:off
          Power Management:off

AFTER DISABLED ENCRYPTION


iwconfig wlan0

wlan0     IEEE 802.11bgn  ESSID:"maroontown"  
          Mode:Managed  Frequency:2.417 GHz  Access Point: 20:E5:2A:62:FE:49   
          Bit Rate=65 Mb/s   Tx-Power=16 dBm   
          Retry  long limit:7   RTS thr:off   Fragment thr:off
          Power Management:off
          Link Quality=50/70  Signal level=-60 dBm  
          Rx invalid nwid:0  Rx invalid crypt:0  Rx invalid frag:0
          Tx excessive retries:179  Invalid misc:98   Missed beacon:0


SOLUTION

 am a newbie to both network and Linux. I am now trying to connect to a WEP wireless network by command line on my Ubuntu 8.10, because the Network Manager does not support 64 bit WEP.

(1) I firstly bring down the Network Manager and then try to connect to a wireless network, whose essid is candy and password is 5673212741. But it fails as shown in the following. The signal is not very strong, but I can connect to it in Windows 7. I wonder why and how to do it correctly for Ubuntu?

$ sudo /etc/init.d/NetworkManager stop  
 * Stopping network connection manager NetworkManager        [ OK ]   
$ sudo iwconfig wlan0 essid candy  
 opendo iwconfig wlan0 key 18018ce78e open  
$ sudo iwconfig wlan0 key 5673212741 open   
$ sudo  dhclient wlan0  
There is already a pid file /var/run/dhclient.pid with pid 9971  
killed old client process, removed PID file  
Internet Systems Consortium DHCP Client V3.1.1  
Copyright 2004-2008 Internet Systems Consortium.  
All rights reserved.  
For info, please visit http://www.isc.org/sw/dhcp/  

wmaster0: unknown hardware address type 801  
wmaster0: unknown hardware address type 801  
Listening on LPF/wlan0/00:0e:9b:cd:4e:18  
Sending on   LPF/wlan0/00:0e:9b:cd:4e:18  
Sending on   Socket/fallback  
DHCPDISCOVER on wlan0 to 255.255.255.255 port 67 interval 7  
DHCPDISCOVER on wlan0 to 255.255.255.255 port 67 interval 12  
DHCPDISCOVER on wlan0 to 255.255.255.255 port 67 interval 20  
DHCPDISCOVER on wlan0 to 255.255.255.255 port 67 interval 13  
DHCPDISCOVER on wlan0 to 255.255.255.255 port 67 interval 9  
No DHCPOFFERS received.  
No working leases in persistent database - sleeping.  
$ ping www.bbc.co.uk  
ping: unknown host www.bbc.co.uk
(2) A less important question: why the scan for wireless networ does not work after I bring down the Network Manager?

$ sudo /etc/init.d/NetworkManager stop  
 * Stopping network connection manager NetworkManager         [ OK ]   
$ sudo iwlist wlan0 scan  
wlan0     Interface doesn't support scanning : Network is down      
Thanks and regards!

ubuntu wifi wep
share|improve this question
edited May 15 '10 at 19:01

asked May 15 '10 at 18:55

Tim
49611120
add a comment
1 Answer
activeoldestvotes
up vote
2
down vote
accepted
sudo /sbin/ifconfig wlan0 up
sudo /sbin/iwlist wlan0 scan
sudo /sbin/iwconfig wlan0 essid "candy"
sudo /sbin/iwconfig wlan0 key 4104672851
sudo /sbin/iwconfig wlan0 enc on
then check using sudo /sbin/iwconfig wlan0 to make sure it looks configured, then sudo dhclient wlan0

2) scanning fails because bringing down Network Manager brings the interface wlan0 down. sudo /sbin/ifconfig wlan0 up will re-enable scanning.

share|improve this answer
edited May 15 '10 at 19:22

answered May 15 '10 at 19:03

cpbills
2,173810
  	  	
sometimes it helps to do another sudo /sbin/iwlist wlan0 scan, to make sure you get 'connected' to your access point (verify with iwconfig wlan0) if dhclient fails, it brings the interface down, that's why it was telling you it 'didn't support scanning' –  cpbills May 15 '10 at 19:07
  	  	
you can also look at using wicd i use it it has a console app and a gui control panel, etc... nice and simple, not sure if it supports 64bit WEP, but it does WPA2 just fine... –  cpbills May 15 '10 at 19:20
  	  	
Thanks, cpbills! It now connects to the wireless network. I was wondering what is the last command "sudo /sbin/iwconfig wlan0 enc on" for? Is it necessary? –  Tim May 15 '10 at 19:21
  	  	
it makes sure encryption is on, fairly redundant, since i believe setting a key enables encryption, by default. but just to be certain... –  cpbills May 15 '10 at 19:23
  	  	
I am not sure why I lost connection a few minutes after the connection was established. Is the connection not able to last long, or it may be the signal is not strong enough? If the connection is lost due to the signal not strong and stable enough, is it possible that the connection is built automatically instead of having to issue the commands everytime? I am considering command line way only. Thanks! –  Tim May 15 '10 at 19:33
show 1 more comment


SOLUTION

1. DISABLE ENCRYPTION

CONNECTS OKAY

iwconfig wlan0
wlan0     IEEE 802.11bgn  ESSID:"maroontown"  
          Mode:Managed  Frequency:2.417 GHz  Access Point: 20:E5:2A:62:FE:49   
          Bit Rate=65 Mb/s   Tx-Power=16 dBm   
          Retry  long limit:7   RTS thr:off   Fragment thr:off
          Power Management:off
          Link Quality=50/70  Signal level=-60 dBm  
          Rx invalid nwid:0  Rx invalid crypt:0  Rx invalid frag:0
          Tx excessive retries:179  Invalid misc:98   Missed beacon:0




	
</entry>
<entry [Thu 2014:08:21 12:33:26 EST] virt-sysprep INSTALLATION FIX>

We’ve verified that both virt-sysprep and guestfish works on linjump2.

The issue was that the kernel images under /boot wasn’t readable by non-root users.

Making those files readable allows non-root users to use libguestfs (the basis for virt-sysprep and guestfish) just fine.

	
</entry>
<entry [Mon 2014:08:18 16:54:09 EST] UPDATE SKYPE TO 4.3>

1. DOWNLOAD

skype.com/go/linux

~/software/skype/skype-ubuntu-precise_4.3.0.37-1_i386.deb

2. UNINSTALL OLD SKYPE


dpkg -r skype skype-bin


3. INSTALL SKYPE 4.3

dpkg -i skype-ubuntu-precise_4.3.0.37-1_i386.deb



</entry>
<entry [Mon 2014:08:18 02:54:46 EST] INSTALL DEB FILE TO LOCAL DIRECTORY>

dpkg-deb -x app.deb /path/to/target/dir/


	
</entry>
<entry [Mon 2014:08:18 02:42:58 EST] dpkg -l OUTPUT FORMAT>

<!--

dpkg -l | grep libc6
ii  libc6                            2.17-93ubuntu4                    Embedded GNU C Library: Shared libraries
iF  libc6-dev                        2.15-0ubuntu10.6                  Embedded GNU C Library: Development Libraries and Header Files
iU  libc6-dev:i386                   2.17-93ubuntu4                    Embedded GNU C Library: Development Libraries and Header Files

First column: Desired
u for Unknown
i for Install
r for Remove
p for Purge
h for Hold

Second column: Status
n for Not Installed
i for Installed
c for Config-files
u for Unpacked
f for Failed-config
h for Half-installed

Third column: Err? (error?) — If in uppercase, bad errors.
  for (none)
h for Hold
r for Reinst-required
x for both-problems

-->
	
</entry>
<entry [Fri 2014:07:18 06:01:35 EST] DEBUG dpkg>


dpkg -Dhelp
dpkg debugging option, --debug=< octal > or -D< octal >:

 Number  Ref. in source   Description
      1  general          Generally helpful progress information
      2  scripts          Invocation and status of maintainer scripts
     10  eachfile         Output for each file processed
    100  eachfiledetail   Lots of output for each file processed
     20  conff            Output for each configuration file
    200  conffdetail      Lots of output for each configuration file
     40  depcon           Dependencies and conflicts
    400  depcondetail     Lots of dependencies/conflicts output
  10000  triggers         Trigger activation and processing
  20000  triggersdetail   Lots of output regarding triggers
  40000  triggersstupid   Silly amounts of output regarding triggers
   1000  veryverbose      Lots of drivel about eg the dpkg/info directory
   2000  stupidlyverbose  Insane amounts of drivel

   
   
	
</entry>
<entry [Fri 2014:07:18 05:40:03 EST] CHANGE VERSION OF g++>

http://askubuntu.com/questions/26498/choose-gcc-and-g-version

1. LIST CURRENT VERSIONS

dpkg -l | grep gcc | awk '{print $2}'
	gcc
	gcc-4.4-base:i386
	gcc-4.6
	gcc-4.6-base:amd64
	gcc-4.8
	gcc-4.8-base:amd64
	gcc-4.8-base:i386
	gcc-4.9-base:amd64
	gcc-4.9-base:i386
	libgcc-4.8-dev:amd64
	libgcc1:amd64
	libgcc1:i386


2. ERASE CURRENT update-alternatives SETTINGS FOR gcc AND g++

sudo update-alternatives --remove-all gcc 
sudo update-alternatives --remove-all g++


3. INSTALL DESIRED VERSION

# sudo apt-get install gcc-4.3 gcc-4.4 g++-4.3 g++-4.4

apt-get install g++-4.4

	The following NEW packages will be installed:
	  cpp-4.4 g++-4.4 gcc-4.4 gcc-4.4-base libstdc++6-4.4-dev

	Setting up gcc-4.4-base:amd64 (4.4.7-8ubuntu1) ...
	Setting up cpp-4.4 (4.4.7-8ubuntu1) ...
	Setting up gcc-4.4 (4.4.7-8ubuntu1) ...
	Setting up g++-4.4 (4.4.7-8ubuntu1) ...
	Setting up libstdc++6-4.4-dev (4.4.7-8ubuntu1) ...


4. CHANGE PERMANENTLY - REPLACE /usr/bin/g++ SYMLINK

OR


5. SWITCH BETWEEN VERSIONS

Install Alternatives

Symbolic links cc and c++ are installed by default. We will install symbol links for gcc and g++, then link cc and c++ to gcc and g++ respectively.

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.3 10
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.4 20

	update-alternatives: using /usr/bin/gcc-4.4 to provide /usr/bin/gcc (gcc) in auto mode
	
#sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.3 10
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.4 20

	update-alternatives: using /usr/bin/g++-4.4 to provide /usr/bin/g++ (g++) in auto mode
	
sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 30
# sudo update-alternatives --set cc /usr/bin/gcc

sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 30
	
	update-alternatives: warning: forcing reinstallation of alternative /usr/bin/g++ because link group c++ is broken
	
sudo update-alternatives --set c++ /usr/bin/g++


Configure Alternatives

The last step is configuring the default commands for gcc, g++. It's easy to switch between 4.3 and 4.4 interactively:

sudo update-alternatives --config gcc
sudo update-alternatives --config g++
Or switch using script:

#!/bin/sh

if [ -z "$1" ]; then
    echo "usage: $0 version" 1>&2
    exit 1
fi

if [ ! -f "/usr/bin/gcc-$1" ] || [ ! -f "/usr/bin/g++-$1" ]; then
    echo "no such version gcc/g++ installed" 1>&2
    exit 1
fi

update-alternatives --set gcc "/usr/bin/gcc-$1"
update-alternatives --set g++ "/usr/bin/g++-$1"

	
</entry>
<entry [Fri 2014:07:18 05:35:27 EST] KEYBOARD SHORTCUT - LAUNCH TERMINAL WINDOW>

CNTL+ALT, T
	
</entry>
<entry [Thu 2014:07:17 16:13:24 EST] GET UBUNTU VERSION ON COMMAND LINE>
	
lsb_release -a


</entry>
<entry [Thu 2014:04:24 12:46:39 EST] OVERRIDE /etc/hosts>

You can use this hack in the meanwhile

http://unix.stackexchange.com/questions/57459/how-can-i-override-the-etc-hosts-file-at-user-level

In your Dockerfile:

ADD your_hosts_file /tmp/hosts
RUN mkdir -p -- /lib-override && cp /lib/x86_64-linux-gnu/libnss_files.so.2 /lib-override
RUN perl -pi -e 's:/etc/hosts:/tmp/hosts:g' /lib-override/libnss_files.so.2
ENV LD_LIBRARY_PATH /lib-override


Beside the LD_PRELOAD tricks. A simple alternative if you're not using nscd is to copy libnss_files.so to some location of your own like:

mkdir -p -- ~/lib &&
cp /lib/x86_64-linux-gnu/libnss_files.so.2 ~/lib
Binary-edit the copy to replace /etc/hosts in there to something the same length like /tmp/hosts.

perl -pi -e 's:/etc/hosts:/tmp/hosts:g' ~/lib/libnss_files.so.2
Edit /tmp/hosts to add the entry you want. And use

export LD_LIBRARY_PATH=~/lib
for nss_files to look in /tmp/hosts instead of /etc/hosts.

Instead of /tmp/hosts, you could also make it /dev/fd//3, and do

exec 3< ~/hosts
For instance which would allow different commands to use different hosts files.

$ cat hosts
1.2.3.4 asdasd
$ LD_LIBRARY_PATH=~/lib getent hosts asdasd 3< ~/hosts
1.2.3.4         asdasd
If nscd is installed and running, you can bypass it by doing the same trick, but this time for libc.so.6 and replace the path to the nscd socket (something like /var/run/nscd/socket) with some nonexistent path.


	
</entry>
<entry [Wed 2014:04:23 15:41:05 EST] UNCOMPLICATED FIREWALL>

https://help.ubuntu.com/community/UFW

sudo ufw allow ssh
sudo ufw enable


LIMIT REPEATED SSH ATTEMPTS
sudo ufw limit proto tcp port 22


PRINTOUT OF TABLE

root@sites:/home/syoung# sudo ufw enable
Command may disrupt existing ssh connections. Proceed with operation (y|n)? y
Firewall is active and enabled on system startup
root@sites:/home/syoung# iptables --list
Chain INPUT (policy DROP)
target     prot opt source               destination         
ACCEPT     udp  --  anywhere             anywhere             udp dpt:domain
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:domain
ACCEPT     udp  --  anywhere             anywhere             udp dpt:bootps
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:bootps
ufw-before-logging-input  all  --  anywhere             anywhere            
ufw-before-input  all  --  anywhere             anywhere            
ufw-after-input  all  --  anywhere             anywhere            
ufw-after-logging-input  all  --  anywhere             anywhere            
ufw-reject-input  all  --  anywhere             anywhere            
ufw-track-input  all  --  anywhere             anywhere            

Chain FORWARD (policy DROP)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             192.168.122.0/24     ctstate RELATED,ESTABLISHED
ACCEPT     all  --  192.168.122.0/24     anywhere            
ACCEPT     all  --  anywhere             anywhere            
REJECT     all  --  anywhere             anywhere             reject-with icmp-port-unreachable
REJECT     all  --  anywhere             anywhere             reject-with icmp-port-unreachable
ufw-before-logging-forward  all  --  anywhere             anywhere            
ufw-before-forward  all  --  anywhere             anywhere            
ufw-after-forward  all  --  anywhere             anywhere            
ufw-after-logging-forward  all  --  anywhere             anywhere            
ufw-reject-forward  all  --  anywhere             anywhere            
ufw-track-forward  all  --  anywhere             anywhere            

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         
ACCEPT     udp  --  anywhere             anywhere             udp dpt:bootpc
ufw-before-logging-output  all  --  anywhere             anywhere            
ufw-before-output  all  --  anywhere             anywhere            
ufw-after-output  all  --  anywhere             anywhere            
ufw-after-logging-output  all  --  anywhere             anywhere            
ufw-reject-output  all  --  anywhere             anywhere            
ufw-track-output  all  --  anywhere             anywhere            

Chain ufw-after-forward (1 references)
target     prot opt source               destination         

Chain ufw-after-input (1 references)
target     prot opt source               destination         
ufw-skip-to-policy-input  udp  --  anywhere             anywhere             udp dpt:netbios-ns
ufw-skip-to-policy-input  udp  --  anywhere             anywhere             udp dpt:netbios-dgm
ufw-skip-to-policy-input  tcp  --  anywhere             anywhere             tcp dpt:netbios-ssn
ufw-skip-to-policy-input  tcp  --  anywhere             anywhere             tcp dpt:microsoft-ds
ufw-skip-to-policy-input  udp  --  anywhere             anywhere             udp dpt:bootps
ufw-skip-to-policy-input  udp  --  anywhere             anywhere             udp dpt:bootpc
ufw-skip-to-policy-input  all  --  anywhere             anywhere             ADDRTYPE match dst-type BROADCAST

Chain ufw-after-logging-forward (1 references)
target     prot opt source               destination         
LOG        all  --  anywhere             anywhere             limit: avg 3/min burst 10 LOG level warning prefix "[UFW BLOCK] "

Chain ufw-after-logging-input (1 references)
target     prot opt source               destination         
LOG        all  --  anywhere             anywhere             limit: avg 3/min burst 10 LOG level warning prefix "[UFW BLOCK] "

Chain ufw-after-logging-output (1 references)
target     prot opt source               destination         

Chain ufw-after-output (1 references)
target     prot opt source               destination         

Chain ufw-before-forward (1 references)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere             ctstate RELATED,ESTABLISHED
ACCEPT     icmp --  anywhere             anywhere             icmp destination-unreachable
ACCEPT     icmp --  anywhere             anywhere             icmp source-quench
ACCEPT     icmp --  anywhere             anywhere             icmp time-exceeded
ACCEPT     icmp --  anywhere             anywhere             icmp parameter-problem
ACCEPT     icmp --  anywhere             anywhere             icmp echo-request
ufw-user-forward  all  --  anywhere             anywhere            

Chain ufw-before-input (1 references)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere            
ACCEPT     all  --  anywhere             anywhere             ctstate RELATED,ESTABLISHED
ufw-logging-deny  all  --  anywhere             anywhere             ctstate INVALID
DROP       all  --  anywhere             anywhere             ctstate INVALID
ACCEPT     icmp --  anywhere             anywhere             icmp destination-unreachable
ACCEPT     icmp --  anywhere             anywhere             icmp source-quench
ACCEPT     icmp --  anywhere             anywhere             icmp time-exceeded
ACCEPT     icmp --  anywhere             anywhere             icmp parameter-problem
ACCEPT     icmp --  anywhere             anywhere             icmp echo-request
ACCEPT     udp  --  anywhere             anywhere             udp spt:bootps dpt:bootpc
ufw-not-local  all  --  anywhere             anywhere            
ACCEPT     udp  --  anywhere             224.0.0.251          udp dpt:mdns
ACCEPT     udp  --  anywhere             239.255.255.250      udp dpt:1900
ufw-user-input  all  --  anywhere             anywhere            

Chain ufw-before-logging-forward (1 references)
target     prot opt source               destination         

Chain ufw-before-logging-input (1 references)
target     prot opt source               destination         

Chain ufw-before-logging-output (1 references)
target     prot opt source               destination         

Chain ufw-before-output (1 references)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere            
ACCEPT     all  --  anywhere             anywhere             ctstate RELATED,ESTABLISHED
ufw-user-output  all  --  anywhere             anywhere            

Chain ufw-logging-allow (0 references)
target     prot opt source               destination         
LOG        all  --  anywhere             anywhere             limit: avg 3/min burst 10 LOG level warning prefix "[UFW ALLOW] "

Chain ufw-logging-deny (2 references)
target     prot opt source               destination         
RETURN     all  --  anywhere             anywhere             ctstate INVALID limit: avg 3/min burst 10
LOG        all  --  anywhere             anywhere             limit: avg 3/min burst 10 LOG level warning prefix "[UFW BLOCK] "

Chain ufw-not-local (1 references)
target     prot opt source               destination         
RETURN     all  --  anywhere             anywhere             ADDRTYPE match dst-type LOCAL
RETURN     all  --  anywhere             anywhere             ADDRTYPE match dst-type MULTICAST
RETURN     all  --  anywhere             anywhere             ADDRTYPE match dst-type BROADCAST
ufw-logging-deny  all  --  anywhere             anywhere             limit: avg 3/min burst 10
DROP       all  --  anywhere             anywhere            

Chain ufw-reject-forward (1 references)
target     prot opt source               destination         

Chain ufw-reject-input (1 references)
target     prot opt source               destination         

Chain ufw-reject-output (1 references)
target     prot opt source               destination         

Chain ufw-skip-to-policy-forward (0 references)
target     prot opt source               destination         
DROP       all  --  anywhere             anywhere            

Chain ufw-skip-to-policy-input (7 references)
target     prot opt source               destination         
DROP       all  --  anywhere             anywhere            

Chain ufw-skip-to-policy-output (0 references)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere            

Chain ufw-track-forward (1 references)
target     prot opt source               destination         

Chain ufw-track-input (1 references)
target     prot opt source               destination         

Chain ufw-track-output (1 references)
target     prot opt source               destination         
ACCEPT     tcp  --  anywhere             anywhere             ctstate NEW
ACCEPT     udp  --  anywhere             anywhere             ctstate NEW

Chain ufw-user-forward (1 references)
target     prot opt source               destination         

Chain ufw-user-input (1 references)
target     prot opt source               destination         
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:ssh
ACCEPT     udp  --  anywhere             anywhere             udp dpt:ssh

Chain ufw-user-limit (0 references)
target     prot opt source               destination         
LOG        all  --  anywhere             anywhere             limit: avg 3/min burst 5 LOG level warning prefix "[UFW LIMIT BLOCK] "
REJECT     all  --  anywhere             anywhere             reject-with icmp-port-unreachable

Chain ufw-user-limit-accept (0 references)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere            

Chain ufw-user-logging-forward (0 references)
target     prot opt source               destination         

Chain ufw-user-logging-input (0 references)
target     prot opt source               destination         

Chain ufw-user-logging-output (0 references)
target     prot opt source               destination         

Chain ufw-user-output (1 references)
target     prot opt source               destination         
root@sites:/home/syoung# 

	
</entry>
<entry [Sat 2014:04:05 14:44:05 EST] WHAT IS Ssl STATUS IN ps aux OUTPUT>

S    Interruptible sleep (waiting for an event to complete)

For BSD formats and when the stat keyword is used, additional
characters may be displayed:
s    is a session leader
l    is multi-threaded (using CLONE_THREAD, like NPTL pthreads do)

	
</entry>
<entry [Fri 2014:04:04 12:28:27 EST] guestfish AUTOMATE REMOVE 70-persistent-net.rules>

1. SSH TO VM WITH IMAGE 
cd /mnt
ll
	biotools.centos64.v6.img


2. CREATE GUESTFISH COMMAND FILE

emacs -nw removerules.cmd

add biotools.centos64.v6.img
run
mount /dev/sda1 /
list-filesystems
ls /etc/udev/rules.d
rm /etc/udev/rules.d/70-persistent-net.rules
ls /etc/udev/rules.d


3. RUN GUESTFISH

guestfish < removerules.cmd

	
	
</entry>
<entry [Thu 2014:04:03 18:02:56 EST] diff LIST CHANGED FILES, IGNORE CONTENTS AND .git>

diff -q -r -B notes notes.broken -x "\.git"

</entry>    
<entry [Thu 2014:04:03 11:40:07 EST] USE guestfish TO EDIT MACHINE IMAGE>

http://libguestfs.org/guestfish.1.html

MOUNT AN IMAGE AND ACCESS ITS FILESYSTEM

guestfish
>

add worker-v1.img
run
list-filesystems
	/dev/sda1: ext4
mount /dev/sda1 /
ls /home
	ubuntu
	ls /home/ubuntu
	.bash_logout
	.bashrc
	.cache
	.profile
	.sudo_as_admin_successful
	.viminfo
	aligner
	aligner-nojava
	...

exit


MOUNT IMAGES AUTOMATICALLY
--------------------------

Use the -i option to automatically mount the disks from a virtual machine:

 guestfish --ro -a disk.img -i cat /etc/group

 guestfish --ro -d libvirt-domain -i cat /etc/group



EDIT A FILE INTERACTIVELY
-------------------------

Another way to edit /boot/grub/grub.conf interactively is:

 guestfish --rw -a disk.img -i edit /boot/grub/grub.conf
 
 
</entry>
<entry [Thu 2014:04:03 09:35:22 EST] USE parallel TO RUN LINUX COMMANDS IN PARALLEL>

https://www.gnu.org/software/parallel/


http://www.rankfocus.com/use-cpu-cores-linux-commands/

Instead of this:

cat bigfile.bin | bzip2 --best > compressedfile.bz2
Do this:

cat bigfile.bin | parallel --pipe --recend '' -k bzip2 --best > compressedfile.bz2
Especially with bzip2, GNU parallel is dramatically faster on multiple core machines. Give it a whirl and you will be sold.     GREP If you have an enormous text file, rather than this:

grep pattern bigfile.txt
do this:

cat bigfile.txt | parallel  --pipe grep 'pattern'
or this:

cat bigfile.txt | parallel --block 10M --pipe grep 'pattern'
These second command shows you using –block with 10 MB of data from your file — you might play with this parameter to find our how many input record lines you want per CPU core. I gave a previous example of how to use grep with a large number of files, rather than just a single large file. AWK Here’s an example of using awk to add up the numbers in a very large file. Rather than this:

cat rands20M.txt | awk '{s+=$1} END {print s}'
do this!

cat rands20M.txt | parallel --pipe awk \'{s+=\$1} END {print s}\' | awk '{s+=$1} END {print s}'
This is more involved: the –pipe option in parallel spreads out the output to multiple chunks for the awk call, giving a bunch of sub-totals. These sub totals go into the second pipe with the identical awk call, which gives the final total. The first awk call has three backslashes in there due to the need to escape the awk call for GNU parallel. WC Want to create a super-parallel count of lines in a file? Instead of this:

wc -l bigfile.txt
Do this:

cat bigfile.txt | parallel  --pipe wc -l | awk '{s+=$1} END {print s}'
This is pretty neat: What is happening here is during the parallel call, we are ‘mapping’ a bunch of calls to wc -l , generating sub-totals, and finally adding them up with the final pipe pointing to awk. SED Feel like using sed to do a huge number of replacements in a huge file? Instead of this:

sed s^old^new^g bigfile.txt
Do this:

cat bigfile.txt | parallel --pipe sed s^old^new^g
…and then pipe it into your favorite file to store the output.

Enjoy!

–Aris
	
</entry>
<entry [Mon 2014:03:31 17:15:47 EST] GET NUMBER OF CPUs>

cat /proc/cpuinfo | grep processor | wc -l
	
</entry>
<entry [Mon 2014:03:31 02:00:50 EST] CLEAR BASH HISTORY>

rm ~/.bash_history; history -c; logout
	
</entry>
<entry [Fri 2014:03:14 15:51:19 EST] VERIFY NETWORK BANDWIDTH WITH iperf>

http://www.techrepublic.com/blog/data-center/handy-iperf-commands-for-quick-network-testing/

TIP: USE iperf GUI TO TEST COMMAND LINE ARGUMENTS


Start an iperf server process
The first command line that would be a keeper is used to start an iperf server listener process for client connection. This is shown with the command below:

iperf.exe -s -P 2 -i 5 -p 5999 -f k

This will start an iperf listener on port 5999 (the default is port 5001, however), limit the iperf process to providing two connections, and finally report on the connections every 5 seconds. The two connections (-P value) is important, because after the second connection the server process will exit. Placing in a value of zero (0) will allow the iperf process to listen continually and without limit to the number of connections until closed. On a Windows host, when this is run, the listener process runs as shown in Figure A. Figure A Figure A
Click to enlarge.

Start an iperf client connection
The other half of iperf is the client that will make the connection to a listener. To launch a client connection to a server named s-network1.amcs.tld using port 5999 (the non-default used in the previous example) for 60 seconds with a 5-second display interval, enter the following command:

iperf.exe -c s-network1.amcs.tld -P 1 -i 5 -p 5999 -f B -t 60 -T 1

When this command is run, the s-network1 host is tested for network performance. Unlike the Jperf GUI with the pretty graphs, iperf will simply report the bandwidth in the unit of measure specified, in this case it is bytes (-f value). Figure B shows the bandwidth performance on the remote client to the s-network1 host. Figure B


	
</entry>
<entry [Wed 2014:02:26 22:30:17 EST] TURN OFF iptables>

service iptables save
service iptables stop
chkconfig iptables off
	
</entry>
<entry [Wed 2014:02:26 01:27:22 EST] LIBREOFFICE - TRACK CHANGES>

Open the document and choose Edit - Changes - Accept or Reject. The Accept or Reject Changes dialog appears.

</entry>
<entry [Mon 2014:02:24 14:19:48 EST] INSTALLED DROPBOX ON 13.04 ALIEN>


mkdir -p ~/software/dropbox
cd ~/software/dropbox
wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

Next, run the Dropbox daemon from the newly created .dropbox-dist folder.

~/.dropbox-dist/dropboxd

	
</entry>
<entry [Sat 2014:02:15 21:57:18 EST] ENABLE wget PORTS 20, 21 AND 80 IN IPTABLES>

STOP/START IPTABLES
/etc/init.d/iptables stop
/etc/init.d/iptables/start

iptables --list
Chain INPUT (policy ACCEPT)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere            state RELATED,ESTABLISHED 
ACCEPT     icmp --  anywhere             anywhere            
ACCEPT     all  --  anywhere             anywhere            
ACCEPT     tcp  --  anywhere             anywhere            state NEW tcp dpt:ssh 
REJECT     all  --  anywhere             anywhere            reject-with icmp-host-prohibited 

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination         
REJECT     all  --  anywhere             anywhere            reject-with icmp-host-prohibited 

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         


cat /etc/sysconfig/iptables

	# Firewall configuration written by system-config-firewall
	# Manual customization of this file is not recommended.
	*filter
	:INPUT ACCEPT [0:0]
	:FORWARD ACCEPT [0:0]
	:OUTPUT ACCEPT [0:0]
	-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
	-A INPUT -p icmp -j ACCEPT
	-A INPUT -i lo -j ACCEPT
	-A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
	-A INPUT -j REJECT --reject-with icmp-host-prohibited
	-A FORWARD -j REJECT --reject-with icmp-host-prohibited

EDIT TO ALLOW PORTS 80, 20 AND 21

vi /etc/sysconfig/iptables

-A INPUT -m state --state NEW -m tcp -p tcp --dport 20 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 21 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT


service iptables restart
	iptables: Flushing firewall rules:                         [  OK  ]
	iptables: Setting chains to policy ACCEPT: filter          [  OK  ]
	iptables: Unloading modules:                               [  OK  ]
	iptables: Applying firewall rules:                         [  OK  ]


	
</entry>
<entry [Thu 2014:01:30 19:34:43 EST] INSTALL TMUX>

apt-get install tmux

	
</entry>
<entry [Thu 2014:01:30 19:29:38 EST] SHARING SCREENS WITH tmux AND screen>

http://www.howtoforge.com/sharing-terminal-sessions-with-tmux-and-screen

SAME USER

screen
In one terminal create a new session for screen, where foobar is the name of your screen session:
screen -S foobar

Then in the other terminal, attach to that session.
screen -x foobar

tmux
In the first terminal, start tmux where shared is the session name:
tmux new-session -s shared

Then in the second terminal attach to the shared session.
tmux attach-session -t shared


DIFFERENT USER
1. CREATE A COMMON GROUP TO WHICH BOTH USERS BELONG

2. In the first terminal, start tmux where shared is the session name and shareds is the name of the socket:
tmux -S /tmp/shareds new -s shared

3. chgrp THE SOCKET TO THE SHARED GROUP
In this example, joint is the group that both users share. If there are other users in the group, then they also have access. So it might be recommended that the group have only the two members.
chgrp joint /tmp/shareds

In the second terminal attach using that socket and session.
tmux -S /tmp/shareds attach -t shared

OR THE SECOND USER CAN VOLUNTARILY WORK READ-ONLY
tmux -S /tmp/shareds attach -t shared -r


NOTES
-----

Sharing between two different accounts with screen
If you are logged in as two different users, there are three prerequisites to using screen. First, screen must be set SUID and it is necessary to remove group write access from /var/run/screen. The safety of using SUID in this context is something to consider. Then you must use screen's ACLs to grant permission to the second user.

sudo chmod u+s /usr/bin/screen
sudo chmod 755 /var/run/screen

In the first user's terminal, start screen as in the basic sharing above, where foobar is the name of the screen session. Then turn on multiuser mode and add user2 to the ACL, where user2 is the second account to be sharing the session.

screen -S foobar
^A:multiuser on
^A:acladd user2

The session can be made read-only for the second user by entering the following ACL change: ^A:aclchg user2 -w "#?"

Then in the other terminal, attach to the first user's session.

screen -x user1/foobar

It is also possible to put multiuser on and acladd user2 into .screenrc to have it take effect automatically upon starting screen. If the changes are not desired in all screen sessions, then a separate .screenrc configuration file can be specified by using the -c option when starting screen.







NOTES
-----

Sharing Terminal Sessions With Tmux And Screen
 
tmux and GNU Screen are well-known utilities which allow multiplexing of virtual consoles. Using either, it is possible to start a session, detach, move to a different machine and resume the session in uninterrupted progress. It's also possible to use these tools to share a single session between more than one user at the same time.

 

Basic Sharing with a Single Account
If an account is held jointly between two or more users, then the sharing of the terminal console is very simple. Neither tmux nor screen require anything out of the ordinary for basic sharing between a single account logged in multiple times. Basic sharing is very easy if you are both logged in as the same user.

 

Basic sharing with screen
In one terminal create a new session for screen, where foobar is the name of your screen session:

screen -S foobar

Then in the other terminal, attach to that session.

screen -x foobar

That's it, there were just two steps.

 

Basic sharing with tmux
Again, there are only two steps. In the first terminal, start tmux where shared is the session name:

tmux new-session -s shared

Then in the second terminal attach to the shared session.

tmux attach-session -t shared

That's it.

 

Sharing Between Two Different Accounts

For different users, you have to set the permissions on the tmux socket so that both users can read and write it. There is only one prerequiste, that there be a group in common between the two users. If such a group does not exist it will be necessary to create one.

In the first terminal, start tmux where shared is the session name and shareds is the name of the socket:

tmux -S /tmp/shareds new -s shared

Then chgrp the socket to a group that both users share in common. In this example, joint is the group that both users share. If there are other users in the group, then they also have access. So it might be recommended that the group have only the two members.

chgrp joint /tmp/shareds

In the second terminal attach using that socket and session.

tmux -S /tmp/shareds attach -t shared

That's it. The session can be made read-only for the second user, but only on a voluntary basis. The decision to work read-only is made when the second user attaches to the session.

tmux -S /tmp/shareds attach -t shared -r

 

Sharing between two different accounts with screen
If you are logged in as two different users, there are three prerequisites to using screen. First, screen must be set SUID and it is necessary to remove group write access from /var/run/screen. The safety of using SUID in this context is something to consider. Then you must use screen's ACLs to grant permission to the second user.

sudo chmod u+s /usr/bin/screen
sudo chmod 755 /var/run/screen

In the first user's terminal, start screen as in the basic sharing above, where foobar is the name of the screen session. Then turn on multiuser mode and add user2 to the ACL, where user2 is the second account to be sharing the session.

screen -S foobar
^A:multiuser on
^A:acladd user2

The session can be made read-only for the second user by entering the following ACL change: ^A:aclchg user2 -w "#?"

Then in the other terminal, attach to the first user's session.

screen -x user1/foobar

It is also possible to put multiuser on and acladd user2 into .screenrc to have it take effect automatically upon starting screen. If the changes are not desired in all screen sessions, then a separate .screenrc configuration file can be specified by using the -c option when starting screen.

 

Afterthought
Be careful when exiting. If you just exit the shell, it will end the terminal session for all parties. If you instead detach the session then the other user can continue working uninterrupted. In tmux that is ^B-d and in screen that is ^A-d

	
</entry>
<entry [Mon 2014:01:27 16:00:07 EST] ADD USER>

sudo groupadd mdauser
sudo useradd --create-home mdauser -g mdauser
sudo passwd
	
	OK
	
</entry>
<entry [Sat 2014:01:18 08:17:19 EST] SET MACHTYPE (E.G., INSTALLING blat)>

SET MACHTYPE

GET MACHTYPE
set | grep MACHTYPE
MACHTYPE=x86_64

INCORRECT MACHTYPE

echo $MACHTYPE
	x86_64-redhat-linux-gnu

... DOES NOT MATCH /usr/bin FOLDERS

ll /usr/bin | grep x86
lrwxrwxrwx.   1 root root          7 Jan 16 02:40 x86_64 -> setarch
-rwxr-xr-x.   4 root root     267888 Nov 21 18:08 x86_64-redhat-linux-c++
-rwxr-xr-x.   4 root root     267888 Nov 21 18:08 x86_64-redhat-linux-g++
-rwxr-xr-x.   2 root root     263952 Nov 21 18:08 x86_64-redhat-linux-gcc

export MACHTYPE=x86_64


</entry>
<entry [Fri 2013:12:20 23:49:39 EST] THE SIX STAGES OF THE LINUX BOOT>

http://www.thegeekstuff.com/2011/02/linux-boot-process/


1. BIOS

BIOS stands for Basic Input/Output System
Performs some system integrity checks
Searches, loads, and executes the boot loader program.
It looks for boot loader in floppy, cd-rom, or hard drive. You can press a key (typically F12 of F2, but it depends on your system) during the BIOS startup to change the boot sequence.
Once the boot loader program is detected and loaded into the memory, BIOS gives the control to it.
So, in simple terms BIOS loads and executes the MBR boot loader.
2. MBR

MBR stands for Master Boot Record.
It is located in the 1st sector of the bootable disk. Typically /dev/hda, or /dev/sda
MBR is less than 512 bytes in size. This has three components 1) primary boot loader info in 1st 446 bytes 2) partition table info in next 64 bytes 3) mbr validation check in last 2 bytes.
It contains information about GRUB (or LILO in old systems).
So, in simple terms MBR loads and executes the GRUB boot loader.
3. GRUB

GRUB stands for Grand Unified Bootloader.
If you have multiple kernel images installed on your system, you can choose which one to be executed.
GRUB displays a splash screen, waits for few seconds, if you don’t enter anything, it loads the default kernel image as specified in the grub configuration file.
GRUB has the knowledge of the filesystem (the older Linux loader LILO didn’t understand filesystem).
Grub configuration file is /boot/grub/grub.conf (/etc/grub.conf is a link to this). The following is sample grub.conf of CentOS.
#boot=/dev/sda
default=0
timeout=5
splashimage=(hd0,0)/boot/grub/splash.xpm.gz
hiddenmenu
title CentOS (2.6.18-194.el5PAE)
          root (hd0,0)
          kernel /boot/vmlinuz-2.6.18-194.el5PAE ro root=LABEL=/
          initrd /boot/initrd-2.6.18-194.el5PAE.img
As you notice from the above info, it contains kernel and initrd image.
So, in simple terms GRUB just loads and executes Kernel and initrd images.
4. Kernel

Mounts the root file system as specified in the “root=” in grub.conf
Kernel executes the /sbin/init program
Since init was the 1st program to be executed by Linux Kernel, it has the process id (PID) of 1. Do a ‘ps -ef | grep init’ and check the pid.
initrd stands for Initial RAM Disk.
initrd is used by kernel as temporary root file system until kernel is booted and the real root file system is mounted. It also contains necessary drivers compiled inside, which helps it to access the hard drive partitions, and other hardware.
5. Init

Looks at the /etc/inittab file to decide the Linux run level.
Following are the available run levels
0 – halt
1 – Single user mode
2 – Multiuser, without NFS
3 – Full multiuser mode
4 – unused
5 – X11
6 – reboot
Init identifies the default initlevel from /etc/inittab and uses that to load all appropriate program.
Execute ‘grep initdefault /etc/inittab’ on your system to identify the default run level
If you want to get into trouble, you can set the default run level to 0 or 6. Since you know what 0 and 6 means, probably you might not do that.
Typically you would set the default run level to either 3 or 5.
6. Runlevel programs

When the Linux system is booting up, you might see various services getting started. For example, it might say “starting sendmail …. OK”. Those are the runlevel programs, executed from the run level directory as defined by your run level.
Depending on your default init level setting, the system will execute the programs from one of the following directories.
Run level 0 – /etc/rc.d/rc0.d/
Run level 1 – /etc/rc.d/rc1.d/
Run level 2 – /etc/rc.d/rc2.d/
Run level 3 – /etc/rc.d/rc3.d/
Run level 4 – /etc/rc.d/rc4.d/
Run level 5 – /etc/rc.d/rc5.d/
Run level 6 – /etc/rc.d/rc6.d/
Please note that there are also symbolic links available for these directory under /etc directly. So, /etc/rc0.d is linked to /etc/rc.d/rc0.d.
Under the /etc/rc.d/rc*.d/ directories, you would see programs that start with S and K.
Programs starts with S are used during startup. S for startup.
Programs starts with K are used during shutdown. K for kill.
There are numbers right next to S and K in the program names. Those are the sequence number in which the programs should be started or killed.
For example, S12syslog is to start the syslog deamon, which has the sequence number of 12. S80sendmail is to start the sendmail daemon, which has the sequence number of 80. So, syslog program will be started before sendmail.
There you have it. That is what happens during the Linux boot process.

	
</entry>
<entry [Thu 2013:12:19 07:57:46 EST] MONITOR APACHE WITH tcpdump>

http://www.unixmen.com/managing-your-services-and-processes-in-linux/

indentify what is being sent and received from port 80 and we know that httpd is using the TCP protocol, so we can use a packet sniffer called tcpdump to view the raw information being sent from port 80.  Enter the following command in your terminal to sniff the data being sent and received from port 80:

tcpdump port 80 –w dump.txt


Next open up Firefox and browse to your default apache web page by typing in

http://127.0.0.1


for the local address of the web server.  If you were able to display the default apache web page, go back to your tcpdump and hit ctrl + c to stop it from running. Now we can take a look at what is being sent and received from this process.  The first thing you will see when you open up dump.txt is the request to display HTML information from the client.


GET / / HTTP/1.1
Host: 127.0.0.1
User-Agent: Mozilla/5.0 Firefox/5.0

Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8 
Accept-Language: en-us,en;q=0.5 
Accept-Encoding: gzip, deflate 
Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7 
Connection: keep-alive 
Cookie: testing=1  Below that you will find the servers response.  HTTP/1.1 200 OK 
Date: Wed, 29 Jun 2011 
14:46:12 GMT 
Server: Apache/2.2.13 (Fedora) 
Content-Length: 900 
Connection: close 
Content-Type: text/html;charset=UTF-8


Then shortly after the response is the HTML for the web page to be displayed. So we now know exactly what httpd is sending and receiving to be able to indentify if the service is harmless or malicious.

	
</entry>
<entry [Thu 2013:12:19 07:57:12 EST] MONITOR SERVICES WITH services --status-all>

http://www.unixmen.com/managing-your-services-and-processes-in-linux/


	
</entry>
<entry [Sat 2013:12:07 14:45:37 EST] WACOM INTUOS DRIVER>

https://launchpad.net/ubuntu/+source/xf86-input-wacom

	
</entry>
<entry [Sat 2013:12:07 12:17:30 EST] ONLINE SOURCES LIST GENERATOR>

http://repogen.simplylinux.ch/generate.php

	
</entry>
<entry [Thu 2013:12:05 06:13:47 EST] USE dpkg TO LIST INSTALLED PACKAGES AND GET FILE LOCATIONS>

LIST INSTALLED PACKAGES 

dpkg --get-selections


GET FILE LOCATIONS

dpkg -L dkms


</entry>
<entry [Mon 2013:12:02 04:14:42 EST] BOOT INTO SINGLE USER MODE ON UBUNTU 12.04>

1. GET TO BOOT SELECTION

CHOOSE 'UBUNTU', THEN 'e'


2. EDIT BOOT CONFIGURATION

REPLACE

ro quiet splash $vt_handoff

WITH

rw init=/bin/bash

	
</entry>
<entry [Sun 2013:11:24 19:02:54 EST] DOWNLOAD FILE WITH LYNX>

1. START LYNX
lynx

2. GO TO URL:
g

3. ENTER FILENAME:
https://annaisystems.atlassian.net/webdav/backupmanager/Confluence-backup-20131125.zip

4. AUTHENTICATE THEN DOWNLOAD


5. SMALL FILES (LESS THAN 1GB?) WILL BE DOWNLOADED TO THE CURRENT DIR


6. LARGE FILES WILL BE DOWNLOADED TO /tmp/lynx* DIRECTORY

ll -tr /tmp/lynxXXXXDNpzQQ/L3914-713TMP.zip 

	-rw------- 1 ubuntu ubuntu 1147298174 2013-11-25 03:11 /tmp/lynxXXXXDNpzQQ/L3914-713TMP.zip

COPY TO DESTINATION

cp /tmp/lynxXXXXDNpzQQ/L3914-713TMP.zip /home/ubuntu/software/atlassian/annai-confluence-backup-20131125.zip


</entry>
<entry [Wed 2013:11:20 13:55:01 EST] BACKUP .bash_profile>


# User specific aliases and functions
#
   if [ -z "$1" ]; then 
	exit; 
    fi

    pid=$(netstat -ntulp | grep $1 | xargs -n 1 | grep node | sed "s/\/node//");
    echo "DOING kill -9 " $pid
    kill -9 $pid;
}


#### TESTING
alias testenv='source /home/syoung/notes/agua/private/conf/envars.sh'
alias testenv-aguadev='source /home/syoung/notes/agua/private/conf/envars-aguadev.sh'

#### NODE
knode() { echo `ps aux | grep "node server.js"` | kill -9 `awk '{print $2}'`;  }

#### HOSTS
export svdev='10.14.152.132'
export sydev='10.14.154.120'
alias gosvdev='ssh syoung1@10.14.152.132'
alias gosydev='ssh syoung@10.14.154.120'
alias gocp='ssh syoung1@uscp-prd-lndt.illumina.com'
ushw='ushw-dev-lngt01.illumina.com'
ussd='ussd-prd-lndt.illumina.com'
uscp='uscp-prd-lndt.illumina.com'

#### TESTING
alias testenv='source /home/syoung/notes/agua/private/conf/envars.sh'
alias testenv-aguadev='source /home/syoung/notes/agua/private/conf/envars-aguadev.sh'
export installdir=/aguadev

#### ANNAI
alias proxy='ssh -C -D 1080 stuart@132.249.228.6'
alias ann='cd ~/annai'
alias ssha='ssh trial_user\@tenant23.biocomputefarm.com'
alias sshc='ssh stuarty@cgbuild-1.annailabs.com'
alias sshp='ssh -C -D 1080 stuart@132.249.228.6'

#### ANNAI CONFLUENCE
export CONIP=ec2-54-241-50-146.us-west-1.compute.amazonaws.com
alias con='ssh -X ubuntu@ec2-54-241-50-146.us-west-1.compute.amazonaws.com'


#### XY
alias mqx='mysql -u xy -p1234 xy'
alias xy='cd /xy'
alias htmlx='cd /xy/html'
alias plugx='cd /xy/html/plugins'
alias binx='cd /xy/bin'
alias libx='cd /xy/lib'
alias cgix='cd /xy/cgi-bin'
alias confx='cd /xy/conf'


#### XY NODE                                                                   
export xy=i-2c67c640
export XYIP=ec2-54-226-110-48.compute-1.amazonaws.com
alias xy='ssh root@$XYIP'


#### BASH FUNCTIONS
source /home/syoung/notes/bash/functions/setkey.sh
source /home/syoung/notes/bash/functions/repos.sh
source /home/syoung/notes/bash/functions/ec2key.sh

#### EC2
ec2env() {  env | egrep -e "(EC2|AWS)"; }
getExternal () { ec2din $1 | grep INSTANCE | cut -f 4; }
ec2syoung() { source /home/syoung/notes/agua/keypair/syoung/ec2/exports.sh; }
ec2invasionmoo() { source /home/syoung/notes/agua/keypair/invasionmoo/ec2/exports.sh; }


#### VOLUMES
alias killvols='ec2dvol | grep available | cut -f 2 | xargs -n 1 ec2-delete-volume'

#### HEADNODE 1
export head=i-a20527cb
#i-cf86f0b2
export HEADIP=ec2-54-211-93-247.compute-1.amazonaws.com
alias hn='ssh ec2_user@$HEADIP'

#### HEADNODE 2
#export head2=i-dda13aa0
#export HEADIP2=ec2-67-202-19-143.compute-1.amazonaws.com
#alias hn2='ssh root@$HEADIP2'

sf () { scp $1 root@$HEADIP:`pwd`/$1; }
sd () { scp -r $1 root@$HEADIP:`pwd`/$1; }
getfile () { scp root@$HEADIP:`pwd`/$1 .; }
getdir () { scp -r root@$HEADIP:`pwd`/$1 .; }

sf2 () { scp $1 root@$HEADIP2:`pwd`/$1; }
sd2 () { scp -r $1 root@$HEADIP2:`pwd`/$1; }
getfile2 () { scp root@$HEADIP2:`pwd`/$1 .; }
getdir2 () { scp -r root@$HEADIP2:`pwd`/$1 .; }


#### ec2
export PATH=/usr/bin:$PATH
export EC2_HOME=/usr/
export JAVA_HOME=/usr
alias listec2='ls $EC2_HOME/bin/ec2-* | grep -v cmd'



#### GROOVY
export GROOVY_HOME=~/software/groovy/groovy-2.1.3

#### 
#alias ipython='ipython --profile=default'

#### node
knode() { echo `ps aux | grep "node server.js"` | kill -9 `awk '{print $2}'`;  }

####
alias soft='sudo software-properties-gtk'

#### DEVTOOLS-SAVE/DEPOT TOOLS
export PATH=$PATH:/home/syoung/software/depottools/depot_tools


#### KOMODO
export PATH="/home/syoung/software/komodo/8.0.0/bin:$PATH"


#### HOSTS
export svdev='10.14.152.132'
export sydev='10.14.154.120'
alias sydev='ssh syoung1@10.14.152.42'
alias servdev='ssh syoung1@10.14.154.64'
alias gocp='ssh syoung1@uscp-prd-lndt.illumina.com'
ushw='ushw-dev-lngt01.illumina.com'
ussd='ussd-prd-lndt.illumina.com'
uscp='uscp-prd-lndt.illumina.com'


#### AGUADEV
alias biorepo='cd /aguadev/repos/public/agua/biorepository'
alias repo='cd /aguadev/repos/private/syoung'
alias scrip='cd /aguadev/bin/scripts'
alias lig='cd /aguadev/lib/Agua'
alias lib='cd /aguadev/lib'
alias lic='cd /aguadev/lib/Agua/Common'
alias ag='cd /aguadev'

#### INFUSIONDEV
alias bini='cd /infusiondev/bin'
alias libi='cd /infusiondev/lib'
alias cgii='cd /infusiondev/cgi-bin'
alias htmli='cd /infusiondev/html'
alias ti='cd /infusiondev/t'
alias inf='cd /infusiondev'
alias plugi='cd /infusiondev/html/plugins'

#### BIOAPPS UTILS
alias bioapps='cd /aguadev/apps/bioapps'
PATH=/aguadev/apps/bioapps/bin/utils:$PATH

#### MINECRAFT
alias minecraft='cd /usr/bin; java -Xmx1024M -Xms512M -cp minecraft.jar net.minecraft.LauncherFrame'

#### IPTABLES
blockip() { /sbin/iptables -I INPUT -s $1 -j DROP; }


#### GIT
if [ -f /aguadev/bin/scripts/repos.sh ]; then source /aguadev/bin/scripts/repos.sh; fi
alias gitmatch='git config --global push.default matching'
alias gitedit='git config core.editor "emacs -nw" --global'
alias gitinit='git init; git config --bool core.bare true'
alias gitrem='git remote '
alias gitlock='rm -fr ./.git/index.lock'
alias gitstat='git status'
alias gitdiff='git diff --name-status'
alias gitdif='git diff HEAD'
alias gitcom='git commit'
alias gitcomm='git commit -a'
alias gitdesc='git describe --abbrev=0 --tags'
alias gitlog='git log --format=format:"%ar %h %s%n%b" --graph --decorate'
#alias gitlog='git log --decorate --graph --oneline'
alias gitstatus='git status -sb'
alias gitwhich='git symbolic-ref -q HEAD'
gittags() { git for-each-ref --sort='*authordate' --format='%(tag)' refs/tags; }
gittrack() { git ls-files $1 --error-unmatch; }


alias shrd='shred -f -v -z -u'
alias modin='ec2-modify-instance-attribute --instance-type '
alias llH='ls -alh | egrep -v -e "\s+\.\S*$"'
alias sas='service apache2 restart; killall /usr/bin/perl;'
alias se='service apache2 stop'
alias sb='service apache2 restart'
alias pg='ps aux | grep '
alias master='sc sshmaster admin-smallcluster'
alias pf='ps auxf'
alias soft='cd ~/software'
alias lsdir='ll | egrep -e "^d"'
alias llHdir='ls -alh | egrep -v "\s+\.\S*$" | egrep -e "^d"'

#### PERL DEV KIT
export PATH=/opt/pdk/bin:$PATH


#### TURN ON COLOURS
export CLICOLOR=1

#### CONVERT IMAGES
convertImages () {
echo "Changing to directory: $1";
cd $1;                     
for img in *.png
 do
    echo "BEFORE img:  $img"
     img=${img//.png/}

     echo "AFTER img: $img"
     convert "$img.png" "$img.jpg"
 done

}


#### GET DATA
getData() { echo '{"username":"'$1'","sessionid":"9999999999.9999.999","mode":"getData","module":"Agua::Workflow"} | /var/www/cgi-bin/aguadev/agua.pl;' ; echo '{"username":"'$1'","sessionid":"9999999999.9999.999","mode":"getData","module":"Agua::Workflow"}' | /var/www/cgi-bin/aguadev/agua.pl; }

getTable () { echo '{"username":"'$2'","sessionId":"9999999999.9999.999","database":"agua","mode":"getTable","table":"'$1'","module":"Agua::Workflow"} | /var/www/cgi-bin/aguadev/agua.pl'; echo '{"username":"admin","sessionId":"9999999999.9999.999","database":"agua","mode":"getTable","table":"'$1'","module":"Agua::Workflow"}' | /var/www/cgi-bin/aguadev/agua.pl; }

testit() { echo 'git push; git push --tags; git push bit; git push --tags bit; git push lin; git push --tags lin;' ; git push; git push --tags; git push bit; git push --tags bit; git push lin; git push --tags lin; }


#### MULTIPLE GITHUB SSH KEYS
setssh() { ssh-add ~/.ssh/$1/github/id_rsa; ssh-add ~/.ssh/$1/bitbucket/id_rsa; cp ~/.ssh/config-$1 ~/.ssh/config; }
#ssh-add ~/.ssh/idents/github.com/agua/id_rsa &> /dev/null


#### EC2 ELASTIC LOAD BALANCING
export AWS_ELB_HOME=/data/apps/ec2/loadbal/1.0.14.3

clr () { for ((  i = 0 ;  i <= 50;  i++  )) do    echo "";  done; }

#### ALIASES
alias gitpush='git push bit; git push bit --tags; git push git; git push git --tags;'
alias gitpushtags='bit push --tags; git push bit --tags;'
alias gitadd='git add --ignore-errors .'
alias priv='cd /agua/private'
alias p='ps auxf'
alias pgp='ps aux | grep '
alias gitdesc='git describe --abbrev=0 --tag'

#### SUBDUED COLOURS
export LS_COLORS='di=33:fi=0:ln=95:pi=5:so=5:bd=5:cd=5:or=37:mi=0:ex=31:*.rpm=90'

#### HOT PERMISSIONS
#alias hot='find ./ -type d -exec chown syoung:www-data {} \;; find ./ -type d -exec chmod 0775 {} \;; find ./ -type f -exec chmod 0664 {} \;'
enableExec() { find ./ -type f -name $1 -exec chmod 0755 {} \;; }
hot() { find ./ -type d -exec chmod 0777 {} \;; find ./ -type f -exec chmod 0666 {} \;; }
warm() { find ./ -type d -exec chmod 0775 {} \;; find ./ -type f -exec chmod 0664 {} \;; }
cold() { find ./ -type d -exec chmod 0755 {} \;; find ./ -type f -exec chmod 0644 {} \;; }
freeze() { find ./ -type d -exec chmod 0555 {} \;; find ./ -type f -exec chmod 0444 {} \;; }
zero()  { find ./ -type d -exec chmod 0500 {} \;; find ./ -type f -exec chmod 0400 {} \;; }

#### git
gitbash() {
cp /root/.bash_profile /home/syoung/notes/bash/root/.bash_profile;
cp /home/syoung/.bash_profile /home/syoung/notes/bash/syoung/.bash_profile;
cp /var/www/.bash_profile /home/syoung/notes/bash/www-data/.bash_profile;
cd /home/syoung/notes/bash;
git add .;
git commit -a -m "$1"
git push;
git push linode;
}


#### GIT-AWARE


#### LINODE
export linodeip=173.230.142.248
alias linode='ssh root@$linodeip'
function gitlin () {
    if [ -z "$1" ]; then
        echo "Missing argument: name of repo"
	exit;
    fi
    
    git push root@$linodeip:/srv/git/private/syoung/$1 master;
}

#### AGUA SHORTCUTS
alias suu='sudo su'
alias app='cd /aguadev/bioapps'
alias plug='cd /aguadev/html/plugins'
alias scrip='cd /aguadev/bin/scripts'
alias bin='cd /aguadev/bin'
alias conf='cd /aguadev/conf'
alias t='cd /aguadev/t'
alias html='cd /var/www/html/aguadev'
alias cgi='cd /var/www/cgi-bin/aguadev'
alias lig='cd /aguadev/lib/Agua'
alias lip='cd /aguadev/lib/Agua/Common/Package'
alias lic='cd /aguadev/lib/Agua/Common'
alias lio='cd /aguadev/lib/Agua/Ops'
alias lib='cd /aguadev/lib'
alias notes='cd /home/syoung/notes'
alias jobs='cd /home/syoung/jobs'
alias misc='cd /home/syoung/misc'
alias ww='cd /var/www/cgi-bin/aguadev; sudo su www-data -'
#alias ag='cd /aguadev'


#### KOMODO
export PATH="/home/syoung/software/komodo/7.1.1-10623/bin:$PATH"
#export PATH="/home/syoung/software/komodo/6.1.3-8844/bin:$PATH"


#### MOUNTS
rpc () { rpcinfo -p | awk -F " " '{print $3 "\t" $4 "\t" $5}' | sort | uniq | grep -v proto; }


#### STARCLUSTER
alias sc='starcluster -c /nethome/admin/.starcluster/config sshmaster smallcluster'
alias stail=' echo >>  /tmp/starcluster-debug-root.log ; echo >>  /tmp/starcluster-debug-root.log ; date >>  /tmp/starcluster-debug-root.log ; echo >>  /tmp/starcluster-debug-root.log ; tail -f /tmp/starcluster-debug-root.log;'

#### AGUA
PATH=/aguadev/bin/apps/logic:$PATH
alias flow='/aguadev/bin/apps/logic/workflow.pl'

### SGE
export SGE_EXECD_PORT=63232;
export SGE_QMASTER_PORT=63231
export SGE_ROOT=/opt/sge6
export PATH=/opt/sge6/bin/lx24-amd64:$PATH

# DATE
alias DATE='date'

# FIX DOS LINE ENDINGS
alias fle="perl -pi -e 's/\r//g' "
alias fle2="perl -pi -e 's/\r/\n/g' "

# turn on color file listing
export CLICOLOR=1

# ALIASES
alias perlenv="perl -e 'foreach my $key(sort keys(%ENV)){print qq|$key = $ENV{$key}\n|;}'"
alias pl='perl Makefile.PL'
alias tx='tar xvfz'
alias mk='make; make install'
alias perl='/usr/bin/perl'
alias q='qstat'
alias sqlite='sqlite3'
alias mod='chmod 755 *'
alias now='date "+DATE: %m/%d/%y%nTIME: %H:%M:%S"'
alias psg='ps aux | grep'
alias llhg='ls -alh | grep'
alias llg='ls -al | grep'
alias lg='ls | grep'
alias xpl='chmod 755 *.pl *.cgi *.t'
alias mq='mysql -u root -p1234 aguadev'
alias mqt='mysql -u root -p1234 aguatest'

alias em='emacs -nw'
alias me='emacs -nw'
alias gobash='emacs -nw ~/.bash_profile'
alias sobash='source ~/.bash_profile'
alias er='tail -f -n 100 /var/log/apache2/error.log'
alias ac='tail -f -n 100 /var/log/apache2/access.log'
alias myer='tail -100 /var/log/mysqld.log'
alias cl='clear; ls; pwd'
alias apps='cd /data/apps'
alias updb='updatedb'

alias l='ls'
alias df='df -ah'
alias rm='rm -i'
alias mv='mv -i'
alias LL='ls -alh'
alias ll='ls -alh'
alias llh='ls -alh'
# -l = list view
# -a = all views, even hidden
# -h = human-readable sizes, e.g. 900B, 15K, 1.2MB

# keeps pico from line wrapping
alias pico="/usr/bin/pico -w"

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


	
</entry>
<entry [Tue 2013:11:12 16:44:49 EST] FIXED cpanm ERROR 'You probably need to have make'>

PROBLEM

CPANM INSTALL FAILS WITH ERROR MESSAGE IN LOG FILE:
    
    "! Can't configure the distribution. You probably need to have 'make'. See /home/derp/.cpanm/build.log for details."


SOLUTION

sudo apt-get install build-essential


</entry>
<entry [Tue 2013:11:12 14:56:12 EST] USE find TO FIND FILES LARGER THAN 50MB>

find . -type f -size +50000k


find {/path/to/directory} -type f -size +{file-size-in-kb}k -exec ls -lh {} \; | awk '{ print $8 ": " $5 }'
    
</entry>
<entry [Sat 2013:10:19 19:40:17 EST] CHANGE HOSTNAME PERMANENTLY>

To change the hostname, execute the following (with the appropriate hostname) and then log out and back in again (so that the prompt will be updated), e.g.:

sudo /sbin/sysctl kernel.hostname=cgbuild-2

sudo vim /etc/sysconfig/network # change HOSTNAME to ‘cgbuild-2’

    
</entry>
<entry [Tue 2013:10:15 01:30:58 EST] Install Oracle Java 7 in Ubuntu via PPA>


This package provides Oracle Java JDK 7 (which includes Java JDK, JRE and the Java browser plugin). However, you can't only install Oracle JRE - the PPA only provides the full Oracle JDK7 package.


To add our PPA and install the latest Oracle Java 7 in Ubuntu (supports Ubuntu 13.10, 13.04, 12.10, 12.04 and 10.04), use the commands below:
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java7-installer

After the installation finishes, if you wish to see if it was successful, you can run the following command:
java -version
It should return something like this:
java version "1.7.0_10"
Java(TM) SE Runtime Environment (build 1.7.0_10-b18)
Java HotSpot(TM) 64-Bit Server VM (build 23.6-b04, mixed mode)

The package installs all the Java binaries, so you can also try "javac -version" which should return "javac 1.7.0_10" and so on (the "_10" part of the version can be different because I'm constantly updating the PPA with the latest Oracle Java 7 version). The current JDK version in the PPA is Oracle Java 7 Update 10 (7u10).

If for some reason, the Java version in use is not 1.7.0, you can try to run the following command:
sudo update-java-alternatives -s java-7-oracle

Update: the installer now requires you accept the Oracle license before the installation begins. This is only required once. If for some reason you need the installation to be automated, you can run the following command to automatically accept the Oracle license:for ( my $i = 0; $i < @$files; $i++ )
sudo echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections


Setting Java environment variables


To automatically set up the Java 7 environment variables, you can install the following package:
sudo apt-get install oracle-java7-set-default

If you've already installed oracle-java6-set-default or oracle-java8-set-default, they will be automatically removed when installing oracle-java7-set-default (and the environment variables will be set for Oracle Java 7 instead).


Removing Oracle Java 7


If you don't want to use Oracle Java (JDK) 7 anymore and want to go back to OpenJDK, all you have to do is remove the Oracle JDK7 Installer and the previous Java (OpenJDK, etc.) version will be used:
sudo apt-get remove oracle-java7-installer
    
    
</entry>
<entry [Tue 2013:10:08 05:01:34 EST] DISABLED ANNOYING KEYRING PASSWORD PROMPT>

How do I get rid of the keyring password prompt?
There are two common scenarios where you will be prompted for your keyring password:

You are set to auto-login (no login prompt when you start your computer)
Your keyring password is different than your login password
For #1, if you want to remove the keyring password prompt, it is recommended you setup a login for Ubuntu and set the keyring password to be the same as your Ubuntu login password.

For #2 you can change the keyring password to be the same as your login password by:

Open Applications->Accessories->Passwords And Encryption Keys or on Ubuntu 11.04 press the "super key" (Windows key on most keyboards) and type "Passwords" then click on "Passwords and Encryption Keys"
Right-click on the "Passwords" folder and select "Change Password"
Set the new keyring password to be the same as your login password

    
</entry>
<entry [Tue 2013:10:08 03:32:44 EST] ENABLED OFFICE 365 ACCOUNT IN THUNDERBIRD>

Server: pod51010.outlook.com
Port: 993 
User Name: StuartY@annaisystems.com
Use secure connection: SSL encryption
Authentication Type: Password
Check the Remember Password box.
Click the Continue button




1. INPUT Identity info

Enter the following:
Full Name: Your 
display name
Email Address: Your 
full @student.ysu.edu 
(for Students) or 
@ysu.edu (for Faculty 
and Staff) email 
address
Leave the other fields 
blank and click the 
Continue button


2. INPUT Incoming Server Settings

Choose IMAP+ from the Server 
Type and enter the following:

Server: pod51010.outlook.com
Port: 993 
User Name: StuartY@annaisystems.com
Use secure connection: SSL encryption
Authentication Type: Password
Check the Remember Password box.
Click the Continue button


3. INPUT Receiving Options
This page has the following 
settings that may be useful to 
change or modify:
Check for new messages every --
minutes: Check this box and enter a 
time if you would like Evolution to 
check your email automatically
Check for new messages in all folders: 
Check this box if you have would like 
Evolution check for new messages in all 
of your folders on Office 365, not just 
the Inbox.
Click the Continue button


4. INPUT Outgoing Server Settings

Choose SMTP from the Server 
Type and enter the following:
Server: pod51010.outlook.com
Port: 587
Use secure connection: TLS encryption
Authentication Type: Login
User Name: Your full 
@student.ysu.edu (for Students) or 
@ysu.edu (for Faculty and Staff) email 
address
If you would like your mail password to 
be remembered when sending mail, 
check the Remember Password box.
Click the Continue button.


5. INPUT Account Information

Enter the Name that you want 
your account to be referred to as 
in the Evolution mail client.
Click the Continue button.
Apply.

    
</entry>
<entry [Sun 2013:10:06 21:37:33 EST] CREATED A PGP KEY AND EXTRACTED PUBLIC PGP KEY>

1. CREATED PGP KEY

seahorse --> Create PGP Key --> Password: @************


KEY ID: CAB93D5C


2. GET FINGERPRINT

A77C 568D 1678 ED0D B08E
4683 D839 8A04 CAB9 3D5C



OR


1. CREATE ON COMMAND LINE WITH gpg

gpg --gen-key


2. CHECK KEY PRESENT

<!--

gpg --list-keys

    /home/syoung/.gnupg/pubring.gpg
    -------------------------------
    pub   2048R/CAB93D5C 2013-10-07         <-- THIS IS THE FINGERPRINT: CAB93D5C
    uid                  Stuart Young <stuartpyoung@gmail.com>
    sub   2048R/AEF24B86 2013-10-07

-->



    
</entry>
<entry [Thu 2013:10:03 04:17:20 EST] KEYBOARD SETTINGS>

1. RESPONSIVENESS

Settings --> Keyboard --> Repeat Keys --> Delay: 10%

Settings --> Keyboard --> Repeat Keys --> Speed: 100%


2. KEYBOARD SHORTCUTS

Settings --> Keyboard --> Shortcuts --> Add


    
</entry>
<entry [Thu 2013:10:03 03:41:54 EST] FIXED TOUCHPAD SENSITIVITY>

PROBLEM

TOUCHPAD IS TOO SENSITIVE - CURSOR JUMPS AROUND WHILE TYPING IF GRAZED BY PALM OR SLEEVE

    - "DISABLE TOUCHPAD WHILE TYPING" NOT PRESENT IN Settings --> Mouse & Touchpad

    - ADJUSTING SETTINGS DIDN'T WORK
    
        -   Settings --> Mouse & Touchpad --> Double-click

        -   Settings --> Mouse & Touchpad --> zzPointer speed


SOLUTION

1. GET INPUT DEVICES

 xinput list
⎡ Virtual core pointer                    	id=2	[master pointer  (3)]
⎜   ↳ Virtual core XTEST pointer              	id=4	[slave  pointer  (2)]
⎜   ↳ HOLTEK USB Keyboard                     	id=11	[slave  pointer  (2)]
⎜   ↳ PS/2 Generic Mouse                      	id=14	[slave  pointer  (2)]
⎣ Virtual core keyboard                   	id=3	[master keyboard (2)]
    ↳ Virtual core XTEST keyboard             	id=5	[slave  keyboard (3)]
    ↳ Power Button                            	id=6	[slave  keyboard (3)]
    ↳ Video Bus                               	id=7	[slave  keyboard (3)]
    ↳ Power Button                            	id=8	[slave  keyboard (3)]
    ↳ Sleep Button                            	id=9	[slave  keyboard (3)]
    ↳ HOLTEK USB Keyboard                     	id=10	[slave  keyboard (3)]
    ↳ Laptop_Integrated_Webcam_HD             	id=12	[slave  keyboard (3)]
    ↳ AT Translated Set 2 keyboard            	id=13	[slave  keyboard (3)]
    ↳ Dell WMI hotkeys                        	id=15	[slave  keyboard (3)]


2. ALTERNATIVE SOLUTIONS:


A) SET "Device Accel Constant Deceleration" PROPERTY OF TOUCHPAD (I.E., "PS/2 Generic Mouse")

xinput --set-prop "PS/2 Generic Mouse" "Device Accel Constant Deceleration" 1

    SOME IMPROVEMENT BUT NOT FIXED

    
    
xinput list-props "PS/2 Generic Mouse"


Device 'PS/2 Generic Mouse':
	Device Enabled (133):	1
	Coordinate Transformation Matrix (135):	1.000000, 0.000000, 0.000000, 0.000000, 1.000000, 0.000000, 0.000000, 0.000000, 1.000000
	Device Accel Profile (255):	0
	Device Accel Constant Deceleration (256):	1.000000
	Device Accel Adaptive Deceleration (257):	1.000000
	Device Accel Velocity Scaling (258):	10.000000
	Device Product ID (250):	2, 1
	Device Node (251):	"/dev/input/event9"
	Evdev Axis Inversion (259):	0, 0
	Evdev Axes Swap (261):	0
	Axis Labels (262):	"Rel X" (143), "Rel Y" (144)
	Button Labels (263):	"Button Left" (136), "Button Middle" (137), "Button Right" (138), "Button Wheel Up" (139), "Button Wheel Down" (140)
	Evdev Middle Button Emulation (264):	0
	Evdev Middle Button Timeout (265):	1000
	Evdev Third Button Emulation (266):	0
	Evdev Third Button Emulation Timeout (267):	1000
	Evdev Third Button Emulation Button (268):	3
	Evdev Third Button Emulation Threshold (269):	20
	Evdev Wheel Emulation (270):	0
	Evdev Wheel Emulation Axes (271):	0, 0, 4, 5
	Evdev Wheel Emulation Inertia (272):	10
	Evdev Wheel Emulation Timeout (273):	200
	Evdev Wheel Emulation Button (274):	4
	Evdev Drag Lock Buttons (275):	0


TEST IT WORKS

xinput test "PS/2 Generic Mouse"

    OK
    



B) UPDATE POINTING DEVICES SOFTWARE

sudo apt-get upgrade gpointing-device-settings


RUN ON COMMAND LINE

gpointing-device-settings

    Use Middle Button Emulation
    
        timeout: Long
    
    
C) FIX 'TOUCHPAD SHOWS AS PS2/MOUSE'

    gpointing-device-settings


... THEREFORE DON'T SEE palm detection OPTIONS:

 . Set the range all the way to low and the pressure to high. Then close it out. If that doesn't fix the problem respond.


cat /proc/bus/input/devices

    I: Bus=0011 Vendor=0002 Product=0001 Version=0000
    N: Name="PS/2 Generic Mouse"
    P: Phys=isa0060/serio1/input0
    S: Sysfs=/devices/platform/i8042/serio1/input/input9
    U: Uniq=
    H: Handlers=mouse1 event9 
    B: PROP=0
    B: EV=7
    B: KEY=70000 0 0 0 0
    B: REL=3


D) DISABLE 'TAP TO CLICK' WITH PATCH


https://bugs.launchpad.net/ubuntu/+source/linux/+bug/550625/comments/307


E) 'Unknown ALPS touchpad' IN dmesg OUTPUT

[    2.313937] psmouse serio1: alps: Unknown ALPS touchpad: E7=73 03 50, EC=73 02 02



F) MAKE TOUCHPAD APPEAR IN MOUSE SETTINGS


/liob/modules/2.6.31-14-generic/kernel/drivers/input/mouse/


STOP/START MOUSE

sudo rmmod psmouse
sudo modprobe psmouse

   
</entry>
<entry [Wed 2013:10:02 01:11:49 EST] ADD SECOND SSD TO INSPIRON 17R 5720>


BOUGHT ON EBAY ADAPTOR WHICH REPLACES DVD DRIVE:

2nd HDD /SSD Caddy, DELL Inspiron 17R 5720

$20.98 

Payment confirmation sent to: youngstuart@hotmail.com
Order number: 3894-8565-3088-4053
This transaction will appear on your statement as PayPal *eBay

    
</entry>
<entry [Tue 2013:10:01 11:03:08 EST] DISABLE DIALOG: 'Unlock Login Keyring >

PROBLEM

Keyring prompt that says “The login keyring did not get unlocked when you logged into your computer” or “The password you use to login to your computer no longer matches that of your login keyring”.


SOLUTION

1. Open Passwords and Keys utility from Unity Dash.


In next window menu, go to View -> tick By keyring. So that you get the sidebar. Right click on Login and choose Change Password


Input original password (the password you set when user created), set new password to be the same as your Ubuntu login password.

For auto-login user, set new keyring password to none by leaving it empty.
    
    
</entry>
<entry [Thu 2013:09:26 17:37:26 EST] INSTALL KAZAM SCREEN CAPTURE/RECORDER>

sudo add-apt-repository ppa:kazam-team/stable-series
sudo apt-get update
sudo apt-get install kazam

    
</entry>
<entry [Sun 2013:09:22 19:27:31 EST] CHECK SYSTEMS IS 64 BIT>


file /sbin/init
 
    /sbin/init: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.24, BuildID[sha1]=0x7aa29ded613e503fb09fb75d94026f3256f01e7a, stripped 



   
</entry>
<entry [Sun 2013:09:22 17:30:56 EST] INSTALL JAVA + JAVA PLUGIN FOR CHROME>



**** REMOVE OPEN JDK ***
sudo apt-get purge openjdk-\*




The best solution I found, (none of these suggestions worked for me), is as followings: First install Icedtead pluging by:

1) sudo apt-get install icedtea-7-plugin
Then in your chrome browser go to:

2) chrome-> Settings-> Show Advanced Settings-> Privacy then click on Content Settings -> Plug-ins then click on Disable Individual Plug-in
3) Disable both "IceTea-Web Plugin" and "Java(TM)"
4) Restart the browser.
5) chrome-> Settings-> Show Advanced Settings-> Privacy then click on Content Settings -> Plug-ins then click on Disable Individual Plug-in
6) Enable only "IceTea-Web Plugin"
7) Enjoy !



sudo apt-get install icedtea-7-plugin


Then link icedtea in to chromium plugin folder thusly


cd /usr/lib/chromium-browser/plugins

and link

sudo ln -s /usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/IcedTeaPlugin.so



sudo mkdir -p /usr/local/java




    
</entry>
<entry [Wed 2013:09:18 09:49:47 EST] FIXED VIRTUALBOX WIN7 INSTALL FAILURE PROBLEM: 'Status: 0xc0000225'>

Re: [SOLVED] Windows 7 fails to install; Status: 0xc0000225
Postby dbwhitaker » 3. Mar 2011, 22:29

I solved this same problem by modifying these VM settings:

changed chipset from PIIX3 to ICH9
enabled IO APIC
enabled absolute pointing device (although this is probably not important)
    
</entry>
<entry [Mon 2013:09:16 21:48:28 EST] REDUCE SENSITIVITY OF INSPIRON TOUCHPAD>


syoung@computer:/mnt/software/confluence/fisheye/fecru-3.1.3$ xinput list
⎡ Virtual core pointer                    	id=2	[master pointer  (3)]
⎜   ↳ Virtual core XTEST pointer              	id=4	[slave  pointer  (2)]
⎜   ↳ HOLTEK USB Keyboard                     	id=11	[slave  pointer  (2)]
⎜   ↳ PS/2 Generic Mouse                      	id=14	[slave  pointer  (2)]
⎣ Virtual core keyboard                   	id=3	[master keyboard (2)]
    ↳ Virtual core XTEST keyboard             	id=5	[slave  keyboard (3)]
    ↳ Power Button                            	id=6	[slave  keyboard (3)]
    ↳ Video Bus                               	id=7	[slave  keyboard (3)]
    ↳ Power Button                            	id=8	[slave  keyboard (3)]
    ↳ Sleep Button                            	id=9	[slave  keyboard (3)]
    ↳ HOLTEK USB Keyboard                     	id=10	[slave  keyboard (3)]
    ↳ Laptop_Integrated_Webcam_HD             	id=12	[slave  keyboard (3)]
    ↳ AT Translated Set 2 keyboard            	id=13	[slave  keyboard (3)]
    ↳ Dell WMI hotkeys                        	id=15	[slave  keyboard (3)]



xinput list-props "Virtual core XTEST pointer"


1. Adjust the mouse sensitivity

System->Preferences->Mouse


OR


2. Install Pointing Devices.

http://screenshots.debian.net/package/gpointing-device-settings

sudo apt-get install gpointing-device-settings
    OK


    
</entry>
<entry [Sat 2013:09:07 19:47:29 EST] REMOVE biolinux INSTALLED ON UBUNTU, FREE UP SPACE>

1. COPY DATA TO EXTERNAL DRIVE

FROM

/mnt

TO:

mkdir -p /media/syoung/My\ Passport/DATA/130907


2. IMAGE UBUNTU OS

time fsarchiver -j3 -o savefs /media/syoung/My\ Passport/DATA/backups/u1304.inspiron.130907.fsa /dev/sda1

    10 mins
    20 GB


3. DELETE biolinux-INSTALLED UBUNTU 

gparted &

DELETE /dev/sda3


4. UPDATE BOOT MENU

sudo update-grub

    syoung@computer:~$ sudo update-grub
    Generating grub.cfg ...
    Found linux image: /boot/vmlinuz-3.8.0-29-generic
    Found initrd image: /boot/initrd.img-3.8.0-29-generic
    Found linux image: /boot/vmlinuz-3.8.0-27-generic
    Found initrd image: /boot/initrd.img-3.8.0-27-generic
    Found linux image: /boot/vmlinuz-3.8.0-26-generic
    Found initrd image: /boot/initrd.img-3.8.0-26-generic
    Found linux image: /boot/vmlinuz-3.8.0-25-generic
    Found initrd image: /boot/initrd.img-3.8.0-25-generic
    Found linux image: /boot/vmlinuz-3.8.0-23-generic
    Found initrd image: /boot/initrd.img-3.8.0-23-generic
    Found linux image: /boot/vmlinuz-3.8.0-19-generic
    Found initrd image: /boot/initrd.img-3.8.0-19-generic
    Found memtest86+ image: /boot/memtest86+.bin
    done

    
5. RESIZE DATA

gparted &




NOTES
-----

http://askubuntu.com/questions/204218/how-to-remove-dual-boot-menu

UPDATE BOOT MENU

Open the terminal application and enter

sudo update-grub
This probes for other existing OSes and writes a new grub configuration; since you deleted the windows partition, it shouldn't be in the menu anymore on the next boot.

You can also disable the Grub Os Prober if you like. Just add GRUB_DISABLE_OS_PROBER=true to /etc/default/grub and run sudo update-grub again.

To disable the display of the menu:

Edit /etc/default/grub with elevated rights

and set GRUB_TIMEOUT=0

Run sudo update-grub again.


    
</entry>
<entry [Sun 2013:08:18 21:45:22 EST] CONVERT *.aiff AUDIO FILES TO *.mp3>

1. INSTALL ffmpeg

sudo apt-get install ffmpeg

2. CONVERT FROM *.aiff TO *.mp3

for i in *.aiff; do ffmpeg -i "$i" -f mp3 -acodec libmp3lame -ab 192000 -ar 44100 "$i.mp3"; done

    
</entry>
<entry [Sun 2013:07:21 03:37:18 EST] FIXED SEAGATE MOUNT ERROR: 'Failed to mount '/dev/sdd1': Input/output error'>

PROBLEM

GET THIS ERROR WHEN TRY TO MOUNT Seagate GoFlex EXTERNAL HARD DRIVE

mount -t ntfs-3g /dev/sdd1 /media/syoung/goflex

    $MFTMirr does not match $MFT (record 0).
    Failed to mount '/dev/sdd1': Input/output error
    NTFS is either inconsistent, or there is a hardware fault, or it's a
    SoftRAID/FakeRAID hardware. In the first case run chkdsk /f on Windows
    then reboot into Windows twice. The usage of the /f parameter is very
    important! If the device is a SoftRAID/FakeRAID then first activate
    it and mount a different device under the /dev/mapper/ directory, (e.g.
    /dev/mapper/nvidia_eahaabcc1). Please see the 'dmraid' documentation
    for more details.


SOLUTION

1. INSTALL ntfs-3g NTFS UTILITIES ON UBUNTU

apt-get install ntfs-3g


2. RUN ntfsfix TO FIX EXTERNAL DRIVE

ntfsfix /dev/sdd1

    ...
    NTFS volume version is 3.1.
    NTFS partition /dev/sdd1 was processed successfully.


3. MOUNT AS TYPE ntfs-3g

mount -t ntfs-3g /dev/sdd1 /media/syoung/goflex

    OK
    
ll /media/syoung/goflex

    OK

    
</entry>
<entry [Thu 2013:07:11 09:09:43 EST]  USE seahorse TO DISABLE 'unlock login keyring' MESSAGE ON BOOT>


COMMAND LINE

python -c "import gnomekeyring;gnomekeyring.change_password_sync('login', '***MYPASSWORD***', '');"


USE SEAHORSE:

1. START THE Gnome Keyring Manager (Seahorse)

Press Alt+F2, type seahorse and press Enter to start the Gnome Keyring Manager

Alternately, open a terminal with Ctrl+F2+T, type seahorse & and press Enter.

2. CHANGE PASSWORD TO EMPTY

The "Passwords and Keys" window should come up as shown below. Under the Passwords tab, select login, right-click on it, and then click on Change Password:

The "Change Keyring Password" box will come up. Type your old password, and then leave the new/confirm password fields blank. Then press OK, and the information box shown below will pop-up; read it, and then click on Use Unsafe Storage to not have to enter your password at each login:


3. CLOSE KEYRING MANAGER

After you log out/reboot, you won't be asked for your password any more.



    
</entry>
<entry [Fri 2013:07:05 03:21:10 EST] INSTALL CHROME>

http://www.liberiangeek.net/2011/12/install-google-chrome-using-apt-get-in-ubuntu-11-10-oneiric-ocelot/

1. INSTALL SIGNING KEY

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -


2. ADD REPOSITORY

When added, run the command below.

sudo gedit /etc/apt/sources.list.d/google.list


copy and paste the line below into the file and save.

deb http://dl.google.com/linux/chrome/deb/ stable main

3. UPDATE APT-GET

 After saving the file, run the commands below to update your system.

sudo apt-get update


4. INSTALL CHROME

Finally,  run the commands below to install Google Chrome Stable version.

sudo apt-get install google-chrome-stable



NB: To install the beta version (latest version) run the commands below:

sudo apt-get install google-chrome-beta
    
</entry>
<entry [Sun 2013:06:16 12:45:12 EST] INSTALL PICASA>

Updated 18/Sept. 2012 :   For 64 bit Ubuntu:

sudo apt-get install wine winetricks
cd ~/ && wget http://dl.google.com/picasa/picasa39-setup.exe
WINEARCH=win32 winecfg
wine ~/picasa39-setup.exe
WINEARCH=win32 winetricks -q ie6


1.Open a terminal by pressing Ctl+Alt+t or search terminal in Dash ,then install wine and winetricks using below command

sudo apt-get install wine winetricks
2.Download picasa 3.9 from google use below command

cd ~/ && wget http://dl.google.com/picasa/picasa39-setup.exe
3.Install picasa 3.9 via wine use below command

wine ~/picasa39-setup.exe
4.Install IE6 via winetricks

WINEARCH=win32 WINEPREFIX=~/.wine sh winetricks -q ie6
5.Done,You launch Picasa 3.9 by searching picasa in Dash now

 

    
</entry>
<entry [Sat 2013:06:15 04:06:16 EST] INSTALL DVD CODECS>

sudo apt-get install ubuntu-restricted-extras
sudo apt-get install libdvdread4
sudo /usr/share/doc/libdvdread4/install-css.sh


ENABLE PLAY DUAL LAYER DISCS -- USE XINE!!!

sudo wget --output-document=/etc/apt/sources.list.d/medibuntu.list http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list && sudo apt-get --quiet update && sudo apt-get --yes --quiet --allow-unauthenticated install medibuntu-keyring && sudo apt-get --quiet update
sudo apt-get install libdvdcss2




</entry>
<entry [Thu 2013:05:30 23:47:40 EST] ENABLE WORKSPACES IN UBUNTU 13.04>

SETTINGS --> APPEARANCE --> ENABLE WORKSPACES

    
</entry>
<entry [Thu 2013:05:30 23:28:27 EST] ENABLE SECOND MONITOR USING HDMI PORT ON LAPTOP>

LAPTOP:     HP E1 1200
VGA CARD:   AMD Radeon HD 7310


1. INSTALL UBUNTU 13.04

2. GET HDMI-TO-VGI CABLE FOR SECOND MONITOR

3. CONNECT ET VOILA!
    
</entry>
<entry [Mon 2013:04:22 22:49:50 EST] FLUSH DNS CACHE>

1. INSTALL nscd

apt-get install nscd


2. RESTART nscd

service nscd restart
    
     * Restarting Name Service Cache Daemon nscd                                                                                                                                                                  [ OK ] 

    
</entry>
<entry [Mon 2013:04:22 16:08:32 EST] RESET COMPIZ>

1. INSTALL unity-reset

sudo add-apt-repository ppa:amith/ubuntutools
sudo apt-get update
sudo apt-get install unity-reset


2. RUN unity-reset

unity-reset

    OK


</entry>
<entry [Mon 2012:12:31 10:34:51 EST] INSTALLED TRUE TYPE FONT>


1. OPEN FONT VIEWER
sudo gnome-font-viewer

2. BROWSE TO *.ttf FILE AND 'Install'


1. MOVE TO FONT DIR

cd /usr/local/share/fonts

2. CREATE myfonts DIRECTORY


mkdir -p /usr/local/share/fonts/truetype


3. COPY FONT FILE TO myfonts DIRECTORY

cd /usr/local/share/fonts/truetype
cp /home/syoung/archive/images/confluence/fonts/04812_BITCBLKAD.ttf .


4. INSTALL FONTS

sudo chown root fontname.ttf
sudo mkfontdir


5. SAVE FONT

sudo fc-cache


    
</entry>
<entry [Sat 2012:12:22 02:59:15 EST] RECURRING NAUTILUS SEGFAULT ERROR **** DID NOT WORK *****>

PROBLEM

NAUTILUS FAILS, LEAVES THIS IN /var/log/syslog

Dec 22 02:56:18 syoung-Satellite-C675D udisksd[2427]: Mounted /dev/sdb1 at /media/syoung/EXCHANGE on behalf of uid 1000
Dec 22 02:56:22 syoung-Satellite-C675D ntfs-3g[6521]: Version 2012.1.15AR.5 external FUSE 29
Dec 22 02:56:22 syoung-Satellite-C675D ntfs-3g[6521]: Mounted /dev/sdb2 (Read-Write, label "LaCie", NTFS 3.1)
Dec 22 02:56:22 syoung-Satellite-C675D ntfs-3g[6521]: Cmdline options: rw,nosuid,nodev,uhelper=udisks2,uid=1000,gid=1000,dmask=0077,fmask=0177
Dec 22 02:56:22 syoung-Satellite-C675D ntfs-3g[6521]: Mount options: rw,nosuid,nodev,uhelper=udisks2,allow_other,nonempty,relatime,default_permissions,fsname=/dev/sdb2,blkdev,blksize=4096
Dec 22 02:56:22 syoung-Satellite-C675D ntfs-3g[6521]: Global ownership and permissions enforced, configuration type 7
Dec 22 02:56:22 syoung-Satellite-C675D udisksd[2427]: Mounted /dev/sdb2 at /media/syoung/LaCie on behalf of uid 1000
Dec 22 02:57:12 syoung-Satellite-C675D kernel: [45503.050244] show_signal_msg: 6 callbacks suppressed
Dec 22 02:57:12 syoung-Satellite-C675D kernel: [45503.050263] nautilus[2394]: segfault at 6c ip 00007f0c106a63b1 sp 00007fff876f71a0 error 4 in libc-2.15.so[7f0c1065b000+1b5000]


SOLUTION

**** DID NOT WORK *****

UPGRADE NAUTILUS FROM 3.4.2 (STANDARD IN 12.10) TO 3.6

http://ubuntuguide.net/install-nautilus-3-6-in-ubuntu-12-10

Ubuntu 12.10 Quantal Quetzal ships with  Gnome Nautilus 3.4.2. This simple tutorial will show you how to install the Nautilus 3.6 in Ubuntu 12.10.

1. ADD gnome3-team ppa TO REPOSITORY

Ubuntu Software Center: Edit -> Software Sources… -> Other Software

ppa:gnome3-team/gnome3


2. UPDATE apt-get 

sudo apt-get update

3. INSTALL NAUTILUS 3.6


sudo apt-get install nautilus


4. LOG OUT/IN OR

killall nautilus 


    
</entry>
<entry [Fri 2012:12:21 03:18:38 EST] GET MEMORY USAGE FOR A PROCESS USING 'ps -v'>

The ps v PID command provides the most comprehensive report on memory-related statistics for an individual process, such as:

Page faults
Size of working segment that has been touched
Size of working segment and code segment in memory
Size of text segment
Size of resident set
Percentage of real memory used by this process


The following is an example:

ps v
   PID    TTY STAT  TIME PGIN  SIZE   RSS   LIM  TSIZ   TRS %CPU %MEM COMMAND
 36626  pts/3 A     0:00    0   316   408 32768    51    60  0.0  0.0 ps v

    
</entry>
<entry [Sat 2012:12:15 07:38:56 EST] INSTALLED extundelete ON TOSHIBA>

SEE [Wed 2011:04:13 03:12:16 EST] UNDELETE FILE REMOVED USING rm ON COMMAND LINE
    
    
</entry>
<entry [Thu 2012:12:13 19:54:52 EST] FIX COMMAND LINE AUTOCOMPLETE WITH FORWARD SLASH>

SUMMARY

COMMENT OUT COMPLETION-RELATED LINES IN ~/.bashrc


PROBLEM

COMMAND LINE AUTOCOMPLETE DOESN'T GIVE FORWARD SLASH


DIAGNOSIS

BUG IN BASH COMPLETION


SOLUTION

COMMENT OUT THESE LINES IN ~/.bashrc


# enable bash completion in interactive shells
#if ! shopt -oq posix; then
#  if [ -f /usr/share/bash-completion/bash_completion ]; then
#    . /usr/share/bash-completion/bash_completion
#  elif [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi


NOTES
-----

EDIT /usr/share/bash-completion/bash_completion WHICH IS SOURCED BY AN OTHERWISE EMPTY /etc/bash_completion

cat  /etc/bash_completion
    . /usr/share/bash-completion/bash_completion

emacs -nw /usr/share/bash-completion/bash_completion

LINE 1587 OR 1579

CHANGE

-o default

TO

-o filenames




I believe there is a bug on line 1587 of /etc/bash_completion, the "-o default" on that line should be changed to "-o filenames".

I haven't checked if 10.10 had "-o default". If it did, then I expect the changed behaviour was due to a change in the readline library. "-o default" means "tell readline to do what it thinks is default", and that may have worked in 10.10 but not in 11.04, due to a readline library change. So I think it's better to say "-o filenames" which tells readline what we want.

The reason why it works OK for root but not for the normal user is, the /etc/bash-completion script is called by $HOME/.bashrc, and this call is present in the user's .bashrc but commented out in root's .bashrc (at least on the system that I recently upgraded from 10.10 to 11.04).

I'm getting bash completion problems and I never had acroread installed on this system, so it can't be acroread in my case.

<!--

With "-o default", if I type: less /t <tab>
it expands to: less /tmp (space)
instead of less /tmp/
(but "cd /t <tab>" is OK)

-->

"complete" is documented in "man bash" under the heading SHELL BUILTIN COMMANDS. For "-o default", it says "Use readline's default filename completion if the compspec generates no matches." For "-o filenames", it says "Tell readline that the compspec generates filenames, so it can perform any filename-specific processing (like adding a slash to directory names, quoting special characters, or suppressing trailing spaces)."

I tried changing the "-o default" to "-o filenames" and everything worked as expected.

I have not experienced a problem with "cd", only with "less" etc.


    
</entry>
<entry [Wed 2012:11:21 21:28:34 EST] FIXED NAUTILUS ERROR 'segfault ... libc-2.15.so'>

PROBLEM:

NAUTILUS CRASHES JUST AFTER STARTING UP OR WHEN USB DRIVE IS INSERTED

syoung@syoung-Satellite-C675D:/mnt/home/syoung$ nautilus 

    Nautilus-Share-Message: Called "net usershare info" but it failed: 'net usershare' returned error 255: net usershare: cannot open usershare directory /var/lib/samba/usershares. Error No such file or directory
    Please ask your system administrator to enable user sharing.
    
    Segmentation fault (core dumped)

KEYS:

#nautilus segfault libc-2.15.so ubuntu
nautilus "cannot open usershare directory /var/lib/samba/usershares."
ubuntu enable user sharing


DIAGNOSIS

ERROR IN /var/log/syslog AFTER INSERTING USB DRIVE:

tail /var/log/syslog

    Nov 21 21:22:22 syoung-Satellite-C675D kernel: [25198.543018] sd 7:0:0:0: >[sdb] No Caching mode page present
    Nov 21 21:22:22 syoung-Satellite-C675D kernel: [25198.543038] sd 7:0:0:0: >[sdb] Assuming drive cache: write through
    Nov 21 21:22:22 syoung-Satellite-C675D kernel: [25198.564486]  sdb: sdb1
    Nov 21 21:22:22 syoung-Satellite-C675D kernel: [25198.568555] sd 7:0:0:0: >[sdb] No Caching mode page present
    Nov 21 21:22:22 syoung-Satellite-C675D kernel: [25198.568571] sd 7:0:0:0: >[sdb] Assuming drive cache: write through
    Nov 21 21:22:22 syoung-Satellite-C675D kernel: [25198.568581] sd 7:0:0:0: >[sdb] Attached SCSI removable disk
    Nov 21 21:22:22 syoung-Satellite-C675D udisksd[2385]: Mounted /dev/sdb1 at /media/syoung/USB DISK on behalf of uid 1000
    Nov 21 21:22:38 syoung-Satellite-C675D kernel: [25215.091581] nautilus[4341]: segfault at 6c ip 00007f177e0fb3b1 sp 00007fffce48c730 error 4 in libc-2.15.so[7f177e0b0000+1b5000]
    Nov 21 21:22:49 syoung-Satellite-C675D kernel: [25225.748219] nautilus[4370]: segfault at 6c ip 00007ff0ae0633b1 sp 00007fffa4bb6d50 error 4 in libc-2.15.so[7ff0ae018000+1b5000]


SOLUTION

1. INSTALL SAMBA

Software center --> samba --> install

    OK
    
NOW NAUTILUS STILL FAILS BUT DOES NOT GIVE SAMBA-RELATED ERROR MESSAGE:

syoung@syoung-Satellite-C675D:/mnt/home/syoung$ nautilus 
    Segmentation fault (core dumped)


tail /var/log/syslog
    Nov 21 23:32:02 syoung-Satellite-C675D kernel: [32978.778643] nautilus[10571]: segfault at 6c ip 00007fc6e11923b1 sp 00007fff153c5860 error 4 in libc-2.15.so[7fc6e1147000+1b5000]


2. REINSTALL UBUNTU DESKTOP --
IS THIS NECESSARY?? - nautilus COMMAND ON COMMAND LINE STILL FAILS BUT WHEN REINSERTED USB DRIVE NAUTILUS DOESN'T CRASH!!

sudo apt-get update
sudo apt-get install --reinstall ubuntu-desktop
sudo apt-get install unity




N0TES
-----

NB: USER syoung WAS ALREADY IN sambashare GROUP:

tail -f /etc/group

    colord:x:117:
    lightdm:x:118:
    nopasswdlogin:x:119:
    avahi:x:120:
    pulse:x:121:
    pulse-access:x:122:
    saned:x:123:
    syoung:x:1000:
    sambashare:x:124:syoung
    mysql:x:125:

SO NO NEED TO ADD GROUP sambashare:
#sudo groupadd sambashare
#sudo adduser `whoami` sambashare


    
    
<!--BUILD WITH apt-get

apt-get build-dep pidgin
-->

-->


Pidgin won’t start. So I run it through command line. Get the message “Segfault”. Run it with the --debug switch. Get more info, but nothing conclusive. Check logs, find kernel describing a library problem with libc.

[   57.444660] pidgin[2211]: segfault at 0 ip 00007fc78073966a sp 00007fffee194710 error 4 in libc-2.15.so[7fc7806af000+1b3000] 

Okay, that's bad but my system updated libc a week ago. Why the problem now? Try for a while but can't discover exact cause of problem.
 
My solution? Compile Pidgin myself, to see if that will fix the problem. Short answer: Yes, that fixed the problem.

I enabled software-sources in my apt-repository list, ran apt-get build-dep pidgin, manually download the pidgin source and compiled that sucker. Works fine, and I could remove all the extra packages installed by the apt-get build-dep move, with the exception of libfarstream, which is how Pidgin does it's sound.



    
</entry>
<entry [Wed 2012:11:14 02:19:37 EST] GET PROCESS MEMORY USAGE AND LEAKS>

http://web.archive.org/web/20110614010958/http://ktown.kde.org/~seli/memory/analysis.html

If you want to analyse memory usage of the whole system or to thoroughly analyse memory usage of one application (not just its heap usage), use exmap. For whole system analysis, find processes with the highest effective usage, they take the most memory in practice, find processes with the highest writable usage, they create the most data (and therefore possibly leak or are very ineffective in their data usage). Select such application and analyse its mappings in the second listview. See exmap section for more details. Also use xrestop to check high usage of X resources, especially if the process of the X server takes a lot of memory. See xrestop section for details.

If you want to detect leaks, use valgrind or possibly kmtrace.

If you want to analyse heap (malloc etc.) usage of an application, either run it in memprof or with kmtrace, profile the application and search the function call tree for biggest allocations. See their sections for more details.
    
</entry>
<entry [Sun 2012:11:04 21:35:19 EST] FIXED ERROR 'bash: ./XXXXXX: No such file or directory'>

SUMMARY: REINSTALL lib32 LIBS


PROBLEM

SYSTEM CAN'T FIND 32 BIT KOMODO PYTHON EXECUTABLE ALTHOUGH ITS THERE

cd /mnt/syoung/software/komodo/Komodo-Edit-6.1.2-8334-linux-libcpp6-x86/INSTALLDIR/lib/python/bin
ll

    drwxr-xr-x 2 syoung syoung 4.0K Nov  4 21:31 .
    drwxr-xr-x 6 syoung syoung 4.0K Nov  4 21:31 ..
    -rwxr-xr-x 1 syoung syoung  188 Jul  6  2011 2to3
    -rwxr-xr-x 1 syoung syoung  161 Jul  6  2011 pydoc
    -rwxr-xr-x 1 syoung syoung 3.7K Jul  6  2011 python
    -rwxr-xr-x 1 syoung syoung 1.5K Jul  6  2011 python-config
    -rwxr-xr-x 1 syoung syoung  18K Jul  6  2011 smtpd.py
    -rwxr-xr-x 1 root   root     31 Nov  4 21:31 test.sh

./python

    bash: ./python: No such file or directory



SOLUTION

apt-get install libc6-i386 lib32gcc1 lib32z1 lib32stdc++6 ia32-libs

    
</entry>
<entry [Sun 2012:11:04 14:57:39 EST] TOSHIBA REPAIR AUTHORISATION NUMBER>

toshiba authorisation no.
TP-10276099


    
</entry>
<entry [Sun 2012:10:28 00:34:51 EST] MAKE UBUNTU FASTER AND QUIETER>

https://sites.google.com/site/easylinuxtipsproject/tips#TOC-Disable-the-keyring-password-on-you

4. This is an important thing you can do, in order to improve the performance of Ubuntu: turn off the three-dimensional visual effects.

Log out. In the logon window, click on the gear-wheel next to your user name. Select Ubuntu 2D. Log in again.
    
</entry>
<entry [Sun 2012:10:28 00:33:29 EST] FIXED ERROR 'Enter password to unlock your login keyring'>

https://sites.google.com/site/easylinuxtipsproject/tips#TOC-Disable-the-keyring-password-on-you

Disable the keyring password on your laptop

10. The keyring password can be especially irritating when you use automatic login. Restart with a clean slate: wipe the current keyring and start a new one. Then leave the password blank (simply click OK and agree to unsafe storage).

Wipe the current one as follows:

Locations - Personal Folder

toolbar: View - Show Hidden Files

Double-click the folder .gnome2

Double-click the folder keyrings

Delete the file default.keyring and / or the file login.keyring

Restart your computer.

When prompted for a password, leave the password field blank (simply click OK and agree to unsafe storage).

The warning you get, is exaggerated: there is hardly any risk involved. Only people with physical access to your computer could see the wireless keys. Provided that they know where to look for them....
    
</entry>
<entry [Sat 2012:10:27 17:2.6.0-5:01 EST] FIXED ERROR: 'UBUNTU 12.10 HAS EXPERIENCED AN INTERNAL ERROR'>

Executable Path
/usr/lib/evolution/evolution-calendar-factory

Package
evolution-data-server 3.6.0-oubunto3


    
</entry>
<entry [Thu 2012:10:25 04:32:21 EST] SORT FILES BY NAME AFTER PHOTOREC>


http://www.cgsecurity.org/wiki/After_Using_PhotoRec

Sort files by extension

builtBackwards created an open source standalone executable script for Windows with AutoIt v3 called PhotoRec Sorter.
PhotoRec Sorter is executed from the same directory as the "recup_dir" folders and moves each file into a new folder matching the name of the file extension (in upper case, ex. PDF, DOC, PPT) You end up with all the recovered files being sorted into folders by file extension.
Download Source and Compiled Executable: PhotoRec Sorter Project Page --BuiltBackwards 02:10, 25 October 2008 (UTC)
You can use this Python script to sort found files by extension.
Save the following code as a file (recovery.py) and then run it with the parameters of 'source' & 'destination'
Example: $ python recovery.py /home/me/recovered_files /home/me/sorted_files
#!/usr/bin/env python
import os
import os.path
import shutil
import sys

source = sys.argv[1]
destination = sys.argv[2]

while not os.path.exists(source):
    source = raw_input('Enter a valid source directory\n')
while not os.path.exists(destination):
    destination = raw_input('Enter a valid destination directory\n')

for root, dirs, files in os.walk(source, topdown=False):
    for file in files:
        extension = os.path.splitext(file)[1][1:].upper()
	destinationPath = os.path.join(destination,extension)
  	
	if not os.path.exists(destinationPath):
            os.mkdir(destinationPath)
	if os.path.exists(os.path.join(destinationPath,file)):
            print 'WARNING: this file was not copied :' + os.path.join(root,file)
	else:
	    shutil.copy2(os.path.join(root,file), destinationPath)
If you are only interested in files with a specific extension (e.g. only .jpg) you can use the following *nix command to find all files in the recovered directories and copy them to a new location:
$ find /path/to/recovered/directories -name \*.jpg -exec cp {} /path/to/new/folder/ \;
JPEG

JPEG file sorting using Exif meta-data.
Canon PowerShot models store their image sequence numbers in the Exif data, so using a program that can dump Exif data to text like jhead, and the following Perl script, you can essentially restore all the JPG files to their original names. --Vees 01:59, 8 January 2007 (CET)
$working_dir = '.';
$jhead_bin = '/usr/local/bin/jhead';

@recovered_files = `ls $working_dir`;
foreach $file (@recovered_files) {
        chomp $file;
        @exif = `$jhead_bin -v $working_dir/$file`;
        foreach $line (@exif) { 
                if ($line =~ /Canon maker tag 0008 Value = 100(\d{1,8})$/) {
                        system("mv $working_dir/$file $working_dir/IMG_$1.JPG");
                        print "IMG_$1.JPG from $file\n";
                        last;
                }
        }
}
Or use this script to list all directories, search for files of a certain size, and place them in a date-based directory:
$working_dir = '/home/myhome/';
$result_dir = '/home/myhome/photos/'
$jhead_bin = '/usr/bin/jhead';

@rec_dirs = `ls ${working_dir} | grep recup_dir`;
foreach $recup_dir (@rec_dirs) {
	print "Scanning ${recup_dir}...";
	chomp $recup_dir;
	@photos_in_recup = `find ${working_dir}${recup_dir}/*jpg -type f -size +800k`;
	foreach $photo_file (@photos_in_recup) {
		chomp $photo_file;
#print "IMG $photo_file in $recup_dir\n";
		@exif = `$jhead_bin -v $photo_file`;
#print "$jhead_bin -v $photo_file\n";
		foreach $line (@exif) {
			if ($line =~ /Time\s*:\s*([0-9]{4}):([0-9]{2}):([0-9]{2})\s[0-9:]{8}$/) {
				print "IMG $photo_file $1-$2-$3\n";
				system("mkdir ${result_dir}$1-$2-$3");
#				system("mv $photo_file $result_dir/$1-$2-$3/");
				last;
			}
		}

	}
}
The following command recreates the original directory layout and file names present on the card (for Canon cameras, tested with numerous photos from an EOS 20D), using the file number EXIF info. ExifTool works under both Windows and Linux.
exiftool -r "-FileName< IMG_${FileIndex}%c.%e" DIR
It uses FileIndex from EXIF information in file to rename to original filename, the %c is checking for duplicate names and appends other digit to the name. And it works recursively (-r).
Issue the following command using Exiv2 to rename all JPEGs to their respective date (the program will ask what to do if conflicts occur):
$ exiv2 -t rename *.jpg
Finding duplicate

 FSlint Duplicate file finder for Linux (very simple to handle, includes a GUI)
  Under Linux or Mac OS X (or with perl and 'sum'), you can find duplicates in a hierarchy using find_dup.
  Under Linux or Mac OSX, md5sum can used to find duplicate files (maybe just md5'ing only the first x bytes).
In this example, we check for the first 80k of recup_dir*/*.sib
for file in recup_dir.*/*.sib; do MD5=`dd count=20 bs=4k if="$file" 2> /dev/null|md5sum`; echo "$MD5 $file"; done|sort
1a07198de3486ff2ecab7859612fe7ba  - Box Clever.sib
33105f4a7997b2e2681e404b3ac895f2  - Random, Matching - 2 bars.sib
376e0c53e78e56ba6f2858d9680f8c6b  - 01aIdentifyCommonInst.sib
b0b40a516a1e26660748a0a09cdf3207  - 01ArticulationFlashcards.sib
Each checksum is unique - there are no duplicates.
 On Windows you can use the fc utility to find duplicates - the following batch file (does not work on Win9x/ME) might help: --Joey 08:36, 17 July 2008 (CEST)
@echo off
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
SET FILELIST=
FOR %%i IN (*) DO (
	FOR %%j IN (!FILELIST!) DO (
		IF %%~zi EQU %%~zj (
			fc /b "%%~i" "%%~j">NUL && echo "%%~i" = "%%~j"
		)
	)
	SET FILELIST=!FILELIST! "%%~i"
)
ENDLOCAL
On Windows you may add a "/r" (without the quotes) after both "for"s in the above batch file.
On Unix machines, you can use fdupes and the following script to generate a shell script with rm statements to remove all duplicate files:
#!/bin/sh
OUTF='rm-dups.sh'

if [ -e $OUTF ]; then
  echo "File $OUTF already exists."
  exit 1;
fi

echo "#!/bin/sh" > $OUTF
fdupes -r -f . | sed -r 's/(.+)/rm \"&\"/' >> $OUTF
chmod +x $OUTF


    
</entry>
<entry [Thu 2012:10:25 04:19:55 EST] CREATED 'PARTED MAGIC' DISC>

http://sourceforge.net/projects/partedmagic/files/partedmagic/Parted%20Magic%202012_10_10/pmagic_2012_10_10_x86_64.iso/download
    
</entry>
<entry [Thu 2012:10:25 04:08:13 EST] 'ADD PARTITION' IN TESTDISK>


Re: How to Recover Accidentally Deleted ext4 Partition?
Quote:
Originally Posted by Jamie Jackson  
Thanks for the reply. Will start reading the reference while I wait.

Code:
jamie@mercury:~$ sudo fdisk -lu

    Disk /dev/sda: 320.1 GB, 320072933376 bytes
    255 heads, 63 sectors/track, 38913 cylinders, total 625142448 sectors
    Units = sectors of 1 * 512 = 512 bytes
    Disk identifier: 0x3072f6f1
    
       Device Boot      Start         End      Blocks   Id  System
    /dev/sda2   *          63      224909      112423+  83  Linux


OK, looking at this (have highlighted the interesting bits in bold) we can determine that your missing partition is between sector 224909 and 625142448

First, will see if parted is capable of recovering it, you will need to turn off swap.
Code:
sudo swapoff -a

Then load parted
Code:

sudo parted /dev/sda

You will be brought to a new "(parted) " prompt. Paste in the following to run a rescue on the affected area.
Code:

rescue 224909 625142448
And if it can find it - it will prompt you for recovery.

Regards
Iain




Re: How to Recover Accidentally Deleted ext4 Partition?
While I was reading the link you sent, I read about testdisk, BTW.

It seems to have found my missing partition(s). I want to show you what it displays, in case having a partition of LVM partitions complicates matters:

Code:
TestDisk 6.11, Data Recovery Utility, April 2009
Christophe GRENIER <grenier@cgsecurity.org>
http://www.cgsecurity.org

  TestDisk is free software, and
comes with ABSOLUTELY NO WARRANTY.

Select a media (use Arrow keys, then press Enter):
Disk /dev/sda - 320 GB / 298 GiB - ATA WDC WD3200BEKT-0
Disk /dev/mapper/lvmvolume-home - 161 GB / 150 GiB - WDC WD3200BEKT-00F3T0
Disk /dev/mapper/lvmvolume-root - 53 GB / 50 GiB - WDC WD3200BEKT-00F3T0
Disk /dev/mapper/lvmvolume-swap - 8589 MB / 8192 MiB - WDC WD3200BEKT-00F3T0

[Proceed ]  [  Quit  ]

Note: Disk capacity must be correctly detected for a successful recovery.
If a disk listed above has incorrect size, check HD jumper settings, BIOS
detection, and install the latest OS patches and disk drivers.
That looks pretty promising. With this in mind, should I still pursue your "recover" command, or might this be a better tack? Just checking.

Thanks again,
Jamie
  	
 January 9th, 2010	   #6
Jamie Jackson
Skinny Soy Caramel Ubuntu

 
Join Date: Oct 2006
Location: Falls Church, VA
Beans: 691
Ubuntu 9.10 Karmic Koala

Re: How to Recover Accidentally Deleted ext4 Partition?
Oh, and FWIW, it was sda3 that I deleted in gparted. (That's the partition that held these logical volumes.)
  	
 January 9th, 2010	   #7
ibuclaw
i [ˈbut͡swaf]
CD
 

 
Join Date: Jan 2008
Beans: 4,726
Re: How to Recover Accidentally Deleted ext4 Partition?
Quote:
Originally Posted by Jamie Jackson  
While I was reading the link you sent, I read about testdisk, BTW.
Hmm... an LVM may complicate things. (Lookup LVM recovery, and you'll see why).

Testdisk would have been my first tool to try out, but given it's extensive features, I'd thought I'd experiment with other simpler tools first. 

You can try the parted way first by all means - it won't do any damage if it can't find anything.

Regards
Iain
__________________
GNU D Compiler Project | AirSpeed Velocity of a Swallow

  	
 January 9th, 2010	   #8
Jamie Jackson
Skinny Soy Caramel Ubuntu

 
Join Date: Oct 2006
Location: Falls Church, VA
Beans: 691
Ubuntu 9.10 Karmic Koala

Re: How to Recover Accidentally Deleted ext4 Partition?
Quote:
You can try the parted way first by all means - it won't do any damage if it can't find anything.
You meant "testdisk" instead of "parted," right? Never mind, sorry. I re-read, and you meant exactly what you wrote.

BTW, testdisk is looking pretty good so far:

Code:
TestDisk 6.11, Data Recovery Utility, April 2009
Christophe GRENIER <grenier@cgsecurity.org>
http://www.cgsecurity.org

Disk /dev/sda - 320 GB / 298 GiB - CHS 38913 255 63
     Partition               Start        End    Size in sectors
* Linux                    0   1  1    13 254 63     224847
P Linux LVM               14   0  1 38912 254 63  624912435

Structure: Ok.  Use Up/Down Arrow keys to select partition.
Use Left/Right Arrow keys to CHANGE partition characteristics:
*=Primary bootable  P=Primary  L=Logical  E=Extended  D=Deleted
Keys A: add partition, L: load backup, T: change type, 
     Enter: to continue
LVM2, 319 GB / 297 GiB
Last edited by Jamie Jackson; January 9th, 2010 at 05:58 AM..
  	
 January 9th, 2010	   #9
ibuclaw
i [ˈbut͡swaf]

 

 
Join Date: Jan 2008
Beans: 4,726
Re: How to Recover Accidentally Deleted ext4 Partition?
Quote:
Originally Posted by Jamie Jackson  
You meant "testdisk" instead of "parted," right?
I actually meant parted. Although as stated - testdisk is a pretty (awesome) comprehensive tool, and if you are halfway through figuring out recovery now, you might as well continue using testdisk.

Quote:
Originally Posted by Jamie Jackson  
BTW, testdisk is looking pretty good so far:
Excellent. Let me know how it goes. =)

If you aren't aware - once you have all partitions listed, you can use the Left and Right arrow keys to change the partition status. (Green = Recover)
If you are unsure whether or not the partition is the correct one, you can use P to list all files and directories.
Once you are happy with the listings, you can select Write to save the partition table.

http://www.cgsecurity.org/wiki/TestDisk_Step_By_Step
__________________
GNU D Compiler Project | AirSpeed Velocity of a Swallow

Last edited by ibuclaw; January 9th, 2010 at 06:07 AM..
  	
 January 9th, 2010	   #10
Jamie Jackson
Skinny Soy Caramel Ubuntu

 
Join Date: Oct 2006
Location: Falls Church, VA
Beans: 691
Ubuntu 9.10 Karmic Koala

Re: How to Recover Accidentally Deleted ext4 Partition?
Thanks for all the help so far.

parted's recover didn't seem to do anything, BTW:
Code:
jamie@mercury:~$ sudo parted /dev/sda
GNU Parted 1.8.8.1.159-1e0e
Using /dev/sda
Welcome to GNU Parted! Type 'help' to view a list of commands.
(parted) rescue 224909 625142448                                          
(parted) rescue 224847 625142448                                      
(parted)
I've chosen to write what testdisk found, and it wants me to reboot, so I'm about to do so with my fingers crossed...







Re: How to Recover Accidentally Deleted ext4 Partition?
No dice. I got a grub error 17 on reboot. 

I went out and bought a big external HD, so now I've got to figure out how to back up the internal and try again to restore the partition.

Update: I'm back up and running. 

The scoop: When I recovered the partition with testdisk, it showed up as sda2, whereas it used to exist as sda3. This must have confused GRUB2. I reinstalled GRUB2 from a live cd session, and now I'm all set.

----------------------------



Re: Testdisk - how to add partition
In response to my previous queries (figured it out):

You can successfully add the partition by ensuring that you make the starting head = 1.

You should have the following in the partition table :

0 1 1 #### 254 63

#### = dependent on drive size

Also added MBR to the start of the disk.
Now it cant be seen, but still cant be accessed - any ideas ?
This Windows machine is asking me if I want to format it when I want to access the drive.
I doubt I will have any different luck when I put it on my machine (in linux).


Help ?
Thx in advance,


    
</entry>
<entry [Thu 2012:10:25 03:44:13 EST] RECOVERING LOST PARTITIONS WITH testdisk, fdisk AND parted>
    
3.3 Recovering lost partitions (testdisk, gpart, fdisk)

It can happen that you did something stupid or something inexplicable happened and your partition table has gone or is corrupted.

To recover your partition tables, there are a few methods.

Fdisk
I'm not referring to the Microsoft dos version of fdisk, but to the fdisk on Linux.

Actually what you do with this is to manually redesign your partition table. Of course, the risk here is that you have absolutely no idea how your partition table looked before or even if you had more than one partition. So this is a good strategy in the case of a disk having only a single partition.

Let us say, in this case, that the partition contains an NTFS filesystem on /dev/hda1

Make sure nothing is mounted (run umountallfs)

Run fdisk:
-'fdisk /dev/hda'
-In fdisk: press 'p' to print your actual partition table

If your actual partition table is a bad one, erase by removing each partition with 'd' and answer with the right partition number (in case of logical drives, first remove everything equal and above 5).
-'n' for new partition

Choose primary partition, press enter for start and end sector. Fdisk automatically assigns it as a Linux native partition.
-'t' to toggle the partition type. Ntfs is '7'
-'a' to make it active (choose '1'), since it's probably the bootpartition
-'w' to write your changes

If this was your previous partition layout, you should now already be able to mount the ntfs partition. If not, you probably won't be able to boot from it either. But it should be, since this is the way to do it when the problem was simply a lost partition table.

Testdisk
This is the more advanced method of recovering partitions. Run 'testdisk' at the command line, the rest speaks for itself (Intel partition table => Analyze => etc.). Read the testdisk documentation atwww.cgsecurity.org 
Testdisk is also very nice to repair bootsectors. Just play with it a little on a test machine to see what it all does. I have played around with it myself, and although there is no guarantee that you will be able to repair the bootsector every time, it still did a pretty good job where others failed. 

Another thing I can recommend to you about testdisk: if it does not find all of your partitions in the first minute, there is probably not much left but some free disk space without a valid filesystem. It is safe to cancel already if you think it found all you need.


Cfdisk
A menu based fdisk replacement, easier to use than the standard fdisk


Gpart
Guess partitions: a utility that might recover your partitions too. However, it has not been maintained for a few years and I have not yet tested it myself.
Updated: July 28, 2010


    
</entry>
<entry [Thu 2012:10:25 01:41:14 EST] FIXED lsb-release PROBLEM WHEN INSTALLING diffuse-merge>

PROBLEM

WHEN TRYING TO INSTALL diffuse-merge

apt-get install diffuse-merge

   Error in function: 
   dpkg: error processing lsb-release (--configure):
    Package is in a very bad inconsistent state - you should
    reinstall it before attempting configuration.

    
SOLUTION

sudo apt-get --reinstall install lsb-release

</entry>
<entry [Thu 2012:10:25 01:40:54 EST] INSTALLED diffuse-merge>

apt-get install diffuse-merge
    

    
</entry>
<entry [Thu 2012:10:25 01:35:19 EST] CHECK WHAT VIDEO CARD I HAVE>
    
lspci | grep VGA
00:02.0 VGA compatible controller: Intel Corporation Mobile 4 Series Chipset Integrated Graphics Controller (rev 07)

AND

lshw -C video



*-display:0             
       description: VGA compatible controller
       product: Mobile 4 Series Chipset Integrated Graphics Controller
       vendor: Intel Corporation
       physical id: 2
       bus info: pci@0000:00:02.0
       version: 07
       width: 64 bits
       clock: 33MHz
       capabilities: msi pm vga_controller bus_master cap_list rom
       configuration: driver=i915 latency=0
       resources: irq:44 memory:d0000000-d03fffff memory:c0000000-cfffffff ioport:5110(size=8)
  *-display:1 UNCLAIMED
       description: Display controller
       product: Mobile 4 Series Chipset Integrated Graphics Controller
       vendor: Intel Corporation
       physical id: 2.1
       bus info: pci@0000:00:02.1
       version: 07
       width: 64 bits
       clock: 33MHz
       capabilities: pm bus_master cap_list
       configuration: latency=0
       resources: memory:d3400000-d34fffff



</entry>
<entry [Thu 2012:10:25 01:33:40 EST] ADDED PPA FOR INTEL VGA DRIVERS>

---**** NO PACKAGE FOR QUANTAL !!!!! *****----

STABLE

ADD X-UPDATES TO APT-GET SOFTWARE SOURCES
add-apt-repository ppa:ubuntu-x-swat/x-updates
    OK

# UPDATE SOURCES
sudo apt-get update

# install all recent updates(include your card drivers). 
sudo apt-get dist-upgrade

#DEVEL
#echo "deb-src http://ppa.launchpad.net/xorg-edgers/ppa/ubuntu quantal main" | sudo tee /etc/apt/sources.list.d/intel-src-ppa.list
#echo "deb http://ppa.launchpad.net/xorg-edgers/ppa/ubuntu quantal main" | sudo tee /etc/apt/sources.list.d/intel-ppa.list


How do I use software from a PPA?

To start installing and using software from a Personal Package Archive, you first need to tell Ubuntu where to find the PPA.
Important: The contents of Personal Package Archives are not checked or monitored. You install software from them at your own risk.
If you're using the most recent version of Ubuntu (or any version from Ubuntu 9.10 onwards), you can add a PPA to your system with a single line in your terminal.

Step 1: On the PPA's overview page, look for the heading that reads Adding this PPA to your system. Make a note of the PPA's location, which looks like:

ppa:gwibber-daily/ppa

Step 2: Open a terminal and enter:

sudo add-apt-repository ppa:user/ppa-name

Replace ppa:user/ppa-name with the PPA's location that you noted above.

Your system will now fetch the PPA's key. This enables your Ubuntu system to verify that the packages in the PPA have not been interfered with since they were built.

Step 3: Now, as a one-off, you should tell your system to pull down the latest list of software from each archive it knows about, including the PPA you just added:

sudo apt-get update

        
</entry>
<entry [Sat 2012:10:13 20:53:47 EST] INSTALL figlet FOR COMMAND LINE ART (ASCII ART)>

apt-get install figlet
figlet "ubuntu";echo -n 'Hello '; whoami; echo ''

showfigfonts agua
showfigfonts auga # for ivrit font

figlet -f ivrit auga
                                
         __ _  __ _ _   _  __ _ 
        / _` |/ _` | | | |/ _` |
       | (_| | (_| | |_| | (_| |
        \__,_|\__, |\__,_|\__,_|
              |___/            



sudo aptitude install git-core figlet toilet fortune cowsay

    
</entry>
<entry [Tue 2012:09:18 10:10:54 EST] RIP DVDS>

http://superuser.com/questions/49358/ubuntu-9-04-ripping-cds-with-grip
    
</entry>
<entry [Tue 2012:09:18 10:04:37 EST] SEND MESSAGE TO DESKTOP>

notify-send "The CD-ROM is at  /media/cdrom !!"

    
</entry>
<entry [Tue 2012:09:18 09:57:59 EST] LOCATE MOUNT POINT FOR CDROM>

Audio CDs are a bit different - there's no actual filesystem there and as such they can't be mounted. Gnome's gvfs subsystem (which stands for "virtual filesystem") provides a file-like view of tracks on the audio CD, but it does it by directly accessing the device, without actually mounting it. So the tracks on the Audio CD look like files, but in fact they're not. They don't have real filenames, file size in bytes or other attributes of normal files.

cd ~/.gvfs
syoung@syoung-Satellite-C675D:~/.gvfs$ ll
total 12
drwx------  1 syoung syoung     0 Dec 31  1969 cdda mount on sr0/

ll cdda\ mount\ on\ sr0/
    -r-------- 1 syoung syoung 168937218 Dec 31  1969 Track 1.wav
    -r-------- 1 syoung syoung 289162050 Dec 31  1969 Track 2.wav
    -r-------- 1 syoung syoung 318084594 Dec 31  1969 Track 3.wav


You can convert those tracks to normal .mp3 or .ogg files using CD-ripping software if you need.

The "mount points" for gvfs (though they're not real mount points) are created in ~/.gvfs folder. There's supposedly also gvfs-mount command which can list/manage the mounts

Googling for "gvfs cdda" will provide you with additional information if you're still curious.



http://superuser.com/questions/49358/ubuntu-9-04-ripping-cds-with-grip

You don't mount a music CD. No. Never. Don't. They're not files. There's no filesystem. It's not iso9660. Or UDF. It's 16-bit stereo PCM at 44.1kHz, with a teensy bit of data overhead for track breaks, lead-in, lead-out, etc. You can't mount it. Stop trying. No, seriously, stop.

(If you've got a data section on an Audio/Data mixed-mode CD, you'll need to mount that to access the data, but for most audio CDs that's not necessary. Or, ya know, possible.)





1. GET LIST OF DEVICES

sudo wodim --devices

    wodim: Overview of accessible drives (1 found) :
    -------------------------------------------------------------------------
     0  dev='/dev/sg1'	rwrw-- : 'TSSTcorp' 'CDDVDW SN-208AB'
    -------------------------------------------------------------------------

ll /dev | grep cd

    lrwxrwxrwx   1 root root           3 Sep 18 09:45 cdrom -> sr0
    lrwxrwxrwx   1 root root           3 Sep 18 09:45 cdrw -> sr0
    crw-rw----+  1 root cdrom    21,   1 Sep 17 19:11 sg1
    brw-rw----+  1 root cdrom    11,   0 Sep 18 09:45 sr0

    
2. MOUNT CDROM

S

sudo mount /dev/sg1 /cdrom

    mount: /dev/sg1 is not a block device    

    
    
</entry>
<entry [Fri 2012:08:17 23:51:27 EST] GET CURRENT UBUNTU VERSION>

lsb_release -a 
    
OR

top-right --> System Settings --> Details


</entry>
<entry [Fri 2012:08:10 13:29:49 EST] BATCH CONVERT PNG TO JPEG WITH phatch>

USING .bash_profile METHOD
--------------------------

1. INSTALL imagemagick

sudo apt-get install imagemagick


2. CREATE .bash_profile METHOD

#### CONVERT IMAGES                                                                          
convertImages () {
echo "Changing to directory: $1";
cd $1;
for img in *.png
 do
    echo "BEFORE img:  $img"
     img=${img//.png/}

     echo "AFTER img: $img"
     convert "$img.png" "$img.jpg"
 done

}


3. RUN METHOD

cd misc/mcb/application-2012/png
convertImages `pwd`

    OK


USING SHELL SCRIPT
------------------

1. INSTALL imagemagick

sudo apt-get install imagemagick


2. CREATE BATCH SCRIPT IN *.png FILES DIRECTORY

emacs -nw convert.sh

#!/bin/bash

for img in *.png
    do
       echo "BEFORE img:  $img"
        img=${img//.png/}
    
        echo "AFTER img: $img"
        convert "$img.png" "$img.jpg"
    done

 
 
3. RUN BATCH SCRIPT

chmod 755 convert.sh
phatch convert.sh

    OK
    
</entry>
<entry [Tue 2012:07:24 20:48:24 EST] ENABLED CANON MP495 SCANNER (WITHOUT WIRELESS) ON 12.04>


1. RESET WIRELESS SETTINGS ON PRINTER

HIT 'TOOLS' KEY 12 TIMES UNTIL GET THE LETTER "t" THEN PRESS THE COLOR KEY


2. RESTART WIRELESS ON PRINTER

HIT 'TOOLS' KEY 11 TIMES UNTIL GET THE LETTER 'G' THEN PRESS THE COLOR KEY


3. UNITY --> SCAN --> ScanGear --> SEE PRINTER --> OK --> SCAN!!


BUT WIRELESS NOT WORKING


1. REMOVE USB CABLE

2. UNITY --> scangear --> Update Scanner List --> DOESN'T FIND IT!

In Ubuntu 12.04 the wireless-printer IS SUPPOSED TO WORK out of the box by

Printers->Add new printer->Network Printer.


Then selecting the right printer model and it is important using URI

lpd://[printer-ip]:515

BUT CAN'T GET PRINTER IP USING ANGRY IP SCANNER EVEN AFTER SCANNING

192.168.33.1    ROUTER
192.168.33.100  TOSHIBA
192.168.33.102  IPAD



</entry>
<entry [Tue 2012:07:24 21:04:29 EST] INSTALLED PRINTER AND SCANNER DRIVERS FOR CANON MP495 ON 12.04>
    
    
SOURCES
http://ubuntuforums.org/showthread.php?t=1602839&page=11
http://askubuntu.com/questions/145700/canon-mp495-scanner-not-working


1. DOWNLOAD

https://code.launchpad.net/~michael-gruz/+archive/canon-trunk/+packages

12.04 PRINTER DRIVER
cnijfilter-common_3.60.2-0~15~precise1_amd64.deb
cnijfilter-mp495series_3.60.2-0~15~precise1_amd64.deb

12.04 SCANNER DRIVER
scangearmp-common - 1.80-0~11~precise1


2. INSTALL PRINTER DRIVER

cd /home/syoung/software/drivers/canon-pixma-MP595/12.04
sudo dpkg -i cnijfilter-common_3.60.2-0~15~precise1_amd64.deb  cnijfilter-mp495series_3.60.2-0~15~precise1_amd64.deb 

    OK

3. INSTALL SCANNER DRIVER

cd /home/syoung/software/drivers/canon-pixma-MP595/12.04
sudo dpkg -i scangearmp-common_1.80-0~11~precise1_amd64.deb scangearmp-mp495series_1.80-0~11~precise1_amd64.deb 

    OK


</entry>
<entry [Sat 2012:07:21 01:22:09 EST] USE UNITY 2D TO SPEED UP 12.04>

1. ADD REPOSITORY

sudo add-apt-repository ppa:unity-2d-team/unity-2d-daily

    This will install all of the necessary dependencies to run Unity 2D, including a "Unity 2D" session that you'll need to login with.
    
    Then do the following:
     * log out
     * log back in and choose the "Unity 2D" session in the drop-down menu at the bottom of the login screen
     * you will then be running Unity 2D


2. UPDATE APT-GET

sudo apt-get update


3. INSTALL UNITY 2D

sudo apt-get install unity-qt-default-settings


4. ENABLE COMPIZ CONFIGURATION OF UNITY 2D

Open Unity 2D's session settings:

gksudo gedit /usr/share/gnome-session/sessions/ubuntu-2d.session

CHANGE metacity

[GNOME Session]
Name=Ubuntu 2D
RequiredComponents=gnome-settings-daemon;
RequiredProviders=windowmanager;panel;launcher;
DefaultProvider-windowmanager=metacity
DefaultProvider-panel=unity-2d-panel
DefaultProvider-launcher=unity-2d-launcher

DesktopName=Unity


TO compiz

[GNOME Session]
Name=Ubuntu 2D
RequiredComponents=gnome-settings-daemon;
RequiredProviders=windowmanager;panel;launcher;
DefaultProvider-windowmanager=compiz
DefaultProvider-panel=unity-2d-panel
DefaultProvider-launcher=unity-2d-launcher

DesktopName=Unity


5. RESTART lightdm:

sudo restart lightdm



6. LOG OUT/IN


    
</entry>
<entry [Fri 2012:07:20 22:59:05 EST] SET APACHE2 UMASK>

I.E., SET IT TO 077 SO THAT NON-APACHE USERS HAVE NO ACCESS TO OTHER PEOPLE'S VIEW FEATURE FILES

IF SETTING /etc/apache2/envvars DOES NOT WORK, DO:

apt-get update
apt-get upgrade
reboot

ALTERNATELY, DO:

I am setting up a LAMP server and would like to set Apache's umask setting to 002 so that all Apache-created files have the group write permission bit set (so members of the same group can overwrite the files).

Does anyone know how to do this? I know that on Ubuntu, you can use the

/etc/apache2/envvars

file to configure the umask, but the server is running CentOS.

Apache inherits its umask from its parent process (i.e. the process starting Apache); this should typically be the /etc/init.d script. So put a umask command in that script.

    
</entry>
<entry [Fri 2012:07:20 22:50:56 EST] FIXed 'apt-get install -y' DOESN'T WORK>


SOLVED] Silent apt-get install nis
I have figured out how to install NIS silently, bypassing the NIS Domain prompt.

On a test system, do the normal install of NIS
$ apt-get install nis

Then, install the debconf-utils package to read the variables it set during install
$ apt-get install debconf-utils
$ debconf-get-selections | grep nis

You will see a line in there similar to this
nis nis/domain string yourdomain.com

Now, on any system you want to install NIS on, copy that line, and put it in a file, like /tmp/nis.seed
Then run these commands

$ sudo debconf-set-selections /tmp/nis.seed 
sudo apt-get install -y nis

It won't prompt you anymore, so you're free to add this into a script.

I'm not sure if you can just type
$ sudo debconf-set-selections "nis nis/domain string yourdomain.com"

I will have to do some testing.


    
</entry>
<entry [Thu 2012:07:19 21:29:09 EST] 10 THINGS TO DO AFTER INSTALLING UBUNTU>


http://blog.sudobits.com/2012/04/14/10-things-to-do-after-installing-ubuntu-12-04/


SYNAPTIC
sudo apt-get install synaptic


PROPRIETARY VGA DRIVER
SEE [Sat 2012:07:14 02:00:05 EST] FIXED VERY SLOW AFTER FRESH INSTALL OF 12.04 ON NEW TOSHIBA


VLC MEDIA PLAYER
sudo apt-get install vlc
    
GIMP
sudo apt-get install gimp

CHROME
    -   SYNC 
        Spanner --> Sign into Chrome --> stuartpyoungbookmarks@ s****

    -   LOAD BOOKMARKS
        Spanner --> Bookmarks --> Bookmark Manager --> Organise --> Import bookmarks from HTML file


Update #1 :  I’ve written a simple shell script to automate the installation process of most important programs that you often need to install after a fresh install of Ubuntu. Download this programs-installer.sh script and execute it -


emacs -nw programs-installer.sh

    #!/bin/sh
    
    # A simple shell script for installing my favorite stuffs on
    # Ubuntu 12.04 LTS
    # License : MIT
    
    # update your system
    sudo apt-get update
    sudo apt-get upgrade
    
    echo "System Updated Successfully"
    
    # install proprietary codecs/libraries
    sudo apt-get -y install ubuntu-restricted-extras
    sudo apt-get -y install libdvdread4
    sudo /usr/share/doc/libdvdread4/install-css.sh
    
    # Install Cheese for Webcam
    sudo apt-get -y install cheese
    
    # Install Gnome Shell and Tweak Tool for Gnome 3 Desktop
    sudo apt-get -y install gnome-shell
    sudo apt-get -y install gnome-tweak-tool
    
    # install synaptic package Manager
    sudo apt-get -y install synaptic
    
    # Install Cool Applications like VLC, pidgin, Pinta Image Editor
    sudo apt-get -y install vlc
    sudo apt-get -y install pinta
    sudo apt-get -y install pidgin
    
    echo "That's All Enjoy :)"


sudo chmod +x programs-installer.sh
./programs-installer.sh



</entry>
<entry [Thu 2012:07:19 14:20:51 EST] UBUNTU TIPS AND TRICKS>
    
http://www.techsupportalert.com/content/ubuntu-tips-and-tricks.htm

</entry>
<entry [Thu 2012:07:19 14:10:34 EST] MADE PANEL (SYSTRAY) TRANSPARENT>


http://www.linuxandlife.com/2012/05/ubuntu-panel-transparent.html

Compiz Config Settings Manager --> Unity Plugin --> Experimental --> Panel Opacity -> 0

    OK!!!

    
</entry>
<entry [Thu 2012:07:19 12:48:51 EST] CREATED A PPA REPOSITORY>

1. INSTALL SUN JAVA

http://www.liberiangeek.net/2012/04/install-oracle-java-jdk-7-in-ubuntu-12-04-precise-pangolin/

DOWNLOAD FROM HERE
http://www.oracle.com/technetwork/java/javase/downloads/jdk-7u4-downloads-1591156.html




2. SET UP PPA ACCOUNT

https://help.launchpad.net/Packaging/PPA/

stuartpyoung@gmail.com
o*t

    
</entry>
<entry [Thu 2012:07:19 12:43:53 EST] INSTALLED SUN JAVA JDK NEEDED FOR MAIN MENU INSTALL TO ADD LAUNCHER TO UNITY>

sudo rm /var/lib/dpkg/info/oracle-java7-installer* 
sudo apt-get purge oracle-java7-installer* 
sudo rm /etc/apt/sources.list.d/*java* 
sudo apt-get update 
sudo add-apt-repository ppa:webupd8team/java 
sudo apt-get update 
sudo apt-get install oracle-java7-installer

    Oracle JRE 7 browser plugin installed

    
</entry>
<entry [Mon 2012:07:16 20:52:38 EST] INSTALL APP THROUGH 'apt:appName' LINK ON WEB PAGE>

CLICKING ON THIS OPENS software-manager TO INSTALL Xpad:

<!--
	
	<h3>Thankfully an application called <a title="Click here to install Xpad" href="apt:xpad" target="_blank">Xpad</a></h3>

-->    

</entry>
<entry [Mon 2012:07:16 20:51:36 EST] LAUNCHPAD FREE REPOSITORY FOR *.deb PACKAGES>

Launchpad free 1GB repository for open-source ubuntu apps
https://launchpad.net/

Developers upload packages to a PPA and have it built for multiple architectures against the current version of Ubuntu. Each user gets up to 1GB of Personal Package Archive space, which works as a standard Ubuntu software package repository. Free PPAs are available only for free ("libre") software packages.
So you don't need to set up your own repository, Launchpad will take care of that for you. This feature is currently available.



article on Launchpad service
http://www.desktoplinux.com/news/NS5056230026.html

Launchpad PPA Service: Software Development the Ubuntu Way
Jul. 24, 2007

During the Ubuntu Live Conference in Portland, Ore., Canonical announced the beta release of its Launchpad PPA (Personal Package Archive) service, a new way for developers to build and publish packages of their code, documentation, artwork, themes and other contributions to free software. 

Canonical, the company that backs Ubuntu, uses Launchpad to help develop Ubuntu. The Launchpad program itself is a set of integrated tools that support collaboration and community formation. These include a team management tool, a bug tracker, code hosting, translations, a blueprint tracker, and an answer tracker. Its best feature, the bug-tracker, works by trying to track separate conversations about the same bug in external project bug trackers, such as Bugzilla, Roundup, SourceForge, and the Debian Bug Tracking System.

 
</entry>
<entry [Mon 2012:07:16 20:45:22 EST] HOW TO CREATE A *.deb PACKAGE>

USE epm

You can find out more about epm here: http://www.easysw.com/epm/


Here is one way to create a .deb file, using the program epm. First, install epm with the command
Code:
$ sudo apt-get install epm
As an example, I will create a package for a very simple python program called helloworld.py:
Code:
#!/usr/bin/env python

#
# helloworld.py
#

print 'Hello, World!'
In the directory that contains helloworld.py, create a file called helloworld.list that looks like this:
Code:
%product Hello World
%copyright 2007 by Yours Truly
%vendor Yours Truly
%description This program prints "Hello, World!"
%version 0.1
%readme README
%license LICENSE
%requires python

f 755 root sys /usr/bin/helloworld.py helloworld.py
Then, in the same directory, create the files README and LICENSE. At a minimum, do this:
Code:
$ touch README
$ touch LICENSE
(Of course, you should really put useful information in those files.)

Finally, we use epm to create the package:
Code:
$ epm -f deb helloworld
You might see this warning:
Code:
epm: Warning - file permissions and ownership may not be correct
     in Debian packages unless you run EPM as root!
but the package will work fine (well, it has for me so far).

The package will be created in a subdirectoy; the name of the subdirectory and the package depend on the architecture of your computer. On an Intel computer (running the 2.6 kernel), the directory is linux-2.6-intel, and the package is helloworld-0.1-linux-2.6-intel.deb.

If you don't want to include "linux-2.6-intel" in the filename of the package, you can use the -n option:
Code:
epm -n -f deb helloworld
This will create a package called helloworld-0.1.deb. (It will still be in the directory linux-2.6-intel.)

</entry>
<entry [Sat 2012:07:14 17:13:04 EST] REMOVE ANNOYING 'AMD UNSUPPORTED HARDWARE' IMAGE IN BOTTOM RIGHT CORNER OF SCREEN>

http://askubuntu.com/questions/25519/how-to-remove-amd-unsupported-hardware-without-reinstalling-the-driver

1. CREATE AND RUN FIX WATERMARK SCRIPT

emacs -nw fixwatermark.sh

#!/bin/sh

DRIVER=/usr/lib/fglrx/xorg/modules/drivers/fglrx_drv.so
for x in $(objdump -d $DRIVER|awk '/call/&&/EnableLogo/{print "\\x"$2"\\x"$3"\\x"$4"\\x"$5"\\x"$6}'); do
sed -i "s/$x/\x90\x90\x90\x90\x90/g" $DRIVER
done


chmod 755  fixwatermark.sh
sudo ./fixwatermark.sh



2. LOG OUT AND LOG IN



    
</entry>
<entry [Sat 2012:07:14 04:18:40 EST] ATTEMPTED TO MAKE SYSTRAY TRANSPARENT>

*** DID NOT WORK ****


http://www.howtogeek.com/?post_type=post&p=43673


1. COPY FILES FOR YOUR CURRENT THEME TO ~/.themes

ll /usr/share/themes/Ambiance ~/.themes

    drwxr-xr-x  3 root root  4096 Jul  8 16:52 gtk-2.0/
    drwxr-xr-x  4 root root  4096 Jul  8 16:52 gtk-3.0/
    -rw-r--r--  1 root root   247 Feb  8 10:18 index.theme
    drwxr-xr-x  2 root root 12288 Jul  8 16:52 metacity-1/
    drwxr-xr-x  2 root root  4096 Jul  8 16:52 unity/


cp -R /usr/share/themes/Ambiance ~/.themes


2. Open your file manager and navigate to your home folder then do to .themes folder.
If you can’t see it then you probably have disabled the “View hidden files” option. Press Ctrl+H to enable it.

GO TO  FOLDER ~/.themes/gtk-2.0:

There you may find a file named “panel.rc”, which is a configuration file that tells your panel how it should look like.
If you find it there then rename it to “panel.rc.bak”.
If you don’t find don’t panic! There’s nothing wrong with your system, it’s just that your theme decided to put the panel configurations in the “gtkrc” file.

COULDN'T FIND THE apps/gnome-panel.rc FILE AS DESCRIBED BELOW:

Open this file with your favorite text editor and at the end of the file there is line that looks like this “include “apps/gnome-panel.rc””. Comment out this line by putting a hash mark # in front of it. Now it should look like this “

#include "apps/gnome-panel.rc"


OR THIS ENTRY IN THE gtkrc FILE:

You must search for the line of text below:
bg_pixmap[NORMAL] = "panel_bg.png"
 
and you must insert a “#” symbol with a space at the beginning of the line, like so:
# bg_pixmap[NORMAL] = "panel_bg.png"


BUT DID FIND THIS FILE:

/usr/share/themes/Ambiance/gtk-3.0/apps/gnome-panel.css



CHANGED TO OTHER THEME THEN SWITCH BACK - NEW PANEL SHOULD BE TRANSPARENT


    
</entry>
<entry [Sat 2012:07:14 04:02:30 EST] CREATED NEW PARTITION WITH gparted AND MOUNTED AT /mnt>

1. USED GPARTED CD TO SHRINK SINGLE PARTITION TO 60GB AND CREATED /dev/sda3

2. CONFIGURED /etc/fstab TO MOUNT /dev/sda3

blkid /dev/sda3
    /dev/sda3: UUID="db8ef721-c627-4730-9f2e-e7f783d171b0" TYPE="ext4" 

NEW /etc/fstab

<!--    # Use 'blkid' to print the universally unique identifier for a                                                                                                                     
    # device; this may be used with UUID= as a more robust way to name devices                                                                                                         
    # that works even if disks are added and removed. See fstab(5).                                                                                                                    
    #                                                                                                                                                                                  
    # <file system> <mount point>   <type>  <options>       <dump>  <pass>                                                                                                             
    proc            /proc           proc    nodev,noexec,nosuid 0       0
    # / was on /dev/sda1 during installation                                                                                                                                           
    UUID=e1b4c4e1-1c4d-4e5b-bbf8-837066d432fb /               ext4    errors=remount-ro 0       1
    # swap was on /dev/sda5 during installation                                                                                                                                        
    UUID=79e71f42-e13d-4cf0-a981-7bc09075eeaf none            swap    sw              0       0
    
    # MOUNT DATA PARTITION /dev/sda3                                                                                                                                                   
    UUID=db8ef721-c627-4730-9f2e-e7f783d171b0       /mnt    ext4    rw,errors=remount-ro    0       0

-->


MOUNT AT /mnt

mount /mnt
ll /mnt
    total 40
    drwxr-xr-x  7 root   root  4096 Jul 13 23:16 ./
    drwxr-xr-x 26 root   root  4096 Jul 14 02:12 ../
    drwxr-xr-x 12 syoung root  4096 Jul 13 07:30 agua/
    drwxr-xr-x  6 root   root  4096 Jul 13 05:00 data/
    drwx------  2 root   root 16384 Jul 13 22:31 lost+found/
    drwxr-xr-x  4 root   root  4096 Jul 13 02:04 nethome/
    drwxr-xr-x  4 root   root  4096 Jul 14 00:53 repos/



    
</entry>
<entry [Sat 2012:07:14 02:00:05 EST] FIXED VERY SLOW AFTER FRESH INSTALL OF 12.04 ON NEW TOSHIBA>


SUMMARY: MANUALLY INSTALLED PROPRIETARY VGA DRIVER



CHECKED VIDEO HARDWARE

unity -> details -> Graphics

PROCESSOR: AMD E-300 APU WITH RADEON HD GRAPHICS (x2)
GRAPHICS: DRIVER UNKNOWN



CHECKED VIDEO DRIVERS:

jockey-text -l

    xorg:fglrx_updates - ATI/AMD proprietary FGLRX graphics driver (post-release updates) (Proprietary, Disabled, Not in use)
    xorg:fglrx - ATI/AMD proprietary FGLRX graphics driver (Proprietary, Disabled, Not in use)


INSTALLED ATI/AMI PROPRIETARY DRIVER

System -> Additional Drivers -> Activate


BUT INSTALL FAILED AND GAVE THIS ERROR IN LOG:

/var/log/jockey.log

    "/sys/module/fglrx_updates/drivers does not exist"
    

CHECKED fglrx IS WORKING:

fglrxinfo
    display: :0  screen: 0
    OpenGL vendor string: X.Org
    OpenGL renderer string: Gallium 0.4 on AMD PALM
    OpenGL version string: 1.4 (2.1 Mesa 8.0.2)

!!! THIS IS A PROBLEM !!! If fglrx is installed and working well you should see an output similar to:

fglrxinfo

    display: :0  screen: 0
    OpenGL vendor string: Advanced Micro Devices, Inc.
    OpenGL renderer string: ATI Radeon HD 4300/4500 Series       
    OpenGL version string: 3.3.11399 Compatibility Profile Context
    

fgl_glxgears

    OK - 3-D GEARS


    

MANUALLY INSTALL AMD DRIVER:

https://help.ubuntu.com/community/BinaryDriverHowto/ATI

That is, instead of using jockey (i.e., the Ubuntu GUI for third-party driver installation) to install the latest FGLRX drivers, I did it manually by creating the necessary *.deb packages myself. 
With the manual method, this works flawlessly, and I am now running the AMD Catalyst 12.2 drivers on my machine.

lspci | grep -i vga

00:01.0 VGA compatible controller: Advanced Micro Devices [AMD] nee ATI Wrestler [Radeon HD 6310]

#### other user --> 01:00.0 VGA compatible controller: ATI Technologies Inc Cayman PRO [AMD Radeon 6900 Series]

1. DOWNLOADED AMD DRIVER FROM WEBSITE

ll /home/syoung/software/drivers/toshiba-amd-proprietary-VGA

    amd-driver-installer-12-6-x86.x86_64.run


2. UNINSTALLED ATI/AMD proprietary fglrx graphics DRIVER AND REBOOTED SYSTEM

Download the drivers found at the AMD/ATI website. To avoid complications later on, save it inside an empty folder.


3. Enable the Source Code repository in Synaptic Package Manger

apt-get install synaptic

    OK

synaptic (POPS UP WINDOW) --> SETTINGS --> UBUNTU SOFTWARE --> SELECT 'Source Code'



4. UPDATE APT-GET:

sudo apt-get update


5. INSTALL dh-make LIBRARIES: 

sudo apt-get install dh-make dh-modaliases execstack


6. CREATE *.deb PACKAGES FROM DOWNLOADED DRIVER

cd /home/syoung/software/drivers/toshiba-amd-proprietary-VGA
sudo sh amd-driver-installer-12-6-x86.x86_64.run --buildpkg Ubuntu/precise

ll
-rw-rw-r-- 1 syoung syoung 106660241 Jul 14 02:36 amd-driver-installer-12-6-x86.x86_64.run
-rw-r--r-- 1 root   root    65785070 Jul 14 03:03 fglrx_8.980-0ubuntu1_amd64.deb
-rw-r--r-- 1 root   root     5969254 Jul 14 03:03 fglrx-amdcccle_8.980-0ubuntu1_amd64.deb
-rw-r--r-- 1 root   root       63768 Jul 14 03:03 fglrx-dev_8.980-0ubuntu1_amd64.deb
-rw-rw-r-- 1 root   root        1597 Jul 14 03:04 fglrx-installer_8.980-0ubuntu1_amd64.changes


If it is required, a package manager window will open and install some dependencies and after a while create the following four .deb packages:
fglrx_8.980-0ubuntu1_amd64.deb  
fglrx-amdcccle_8.980-0ubuntu1_amd64.deb  
fglrx-dev_8.980-0ubuntu1_amd64.deb

Note: It will also create a file called fglrx-installer_8.980-0ubuntu1_amd64.changes. If you wish you can read this file to know the changes that have been effected through AMD/ATI Catalyst 12.6 and related information. 

7. INSTALL fglrx (AND UNINSTALL fglrx-driver)

apt-get install fglrx

Reading package lists... Done
Building dependency tree       
Reading state information... Done
You might want to run 'apt-get -f install' to correct these:
The following packages have unmet dependencies:
 fglrx : Conflicts: fglrx-driver
 fglrx-updates : Recommends: fglrx-amdcccle-updates but it is not going to be installed
                 Conflicts: fglrx-driver
E: Unmet dependencies. Try 'apt-get -f install' with no packages (or specify a solution).
root@syoung-Satellite-C675D:/home/syoung/software/drivers/toshiba-amd-proprietary-VGA# apt-get -f install


8. INSTALL .deb FILES:


sudo dpkg -i *.deb


Note: In case any of the packages are broken, open Synaptic Package Manager and go to Edit -> Fix Broken Packages. In case you are new to Ubuntu, broken here means that some dependent packages are not yet installed. Once you sort out the issue as indicated above through the Synaptic Package Manager, the problem of broken packages should be resolved.

9. GENERATE NEW ATI CONFIG FILE

sudo aticonfig --initial


10. CONFIRM INSTALLED

fglrxinfo
    display: :0  screen: 0
    OpenGL vendor string: Advanced Micro Devices, Inc.
    OpenGL renderer string: AMD Radeon HD 6310 Graphics
    OpenGL version string: 4.2.11733 Compatibility Profile Context

    OK!

After this command, reboot your system. If all is right, the fglrx driver that corresponds to AMD/ATI Catalyst 12.3 will be installed and working on your system. To confirm the drivers are working open a terminal and type:


fglrxinfo


You should get an output similar to the following:

fglrxinfo 
display: :0  screen: 0
    OpenGL vendor string: Advanced Micro Devices, Inc.
    OpenGL renderer string: AMD Radeon HD 6300M Series
    OpenGL version string: 4.2.11733 Compatibility Profile Context


Note: If you see any mention of MESA in the output, the fglrx drivers have not been installed correctly. See the troubleshooting section for more details

You can make configuration changes through the AMD/ATI Catalyst Control Center, it can either be found in your Application menu or you can launch it through a terminal like this: 


#sudo amdcccle
gksudo amdcccle

Display Manager --> for each display, enable and select "Multi-display desktop with display(s)


To read more about the AMD/ATI Catalyst Control Center click here. Keep in mind that all configuration options for the ATI Catalyst Control Center mentioned there may not be available for your Ubuntu system. 

Troubleshooting
You may see a message like this:

Xlib:  extension "XFree86-DRI" missing on display ":1.0
This message does not necessarily indicate a problem. It can be fixed however...

Open /etc/X11/xorg.conf and add the following line to Section "Module": 

load "dri"
MESA "error"
If fglrxinfo gives you the following output, your installation is not completed correctly:

$ fglrxinfo
display: :0.0  screen: 0
OpenGL vendor string: Mesa project: www.mesa3d.org
OpenGL renderer string: Mesa GLX Indirect
OpenGL version string: 1.2 (1.5 Mesa 6.4.1)
In this case, watch for these things:

Make sure that the restricted-modules package installed correspond to the kernel your are running and that you can load the fglrx driver, whether by issuing the command sudo modprobe fglrx or by verifying that the module appears in the list of loaded modules, by issuing the command lsmod.

It may be necessary to establish a symbolic link for the /usr/lib/dri folder, by issuing the following command: sudo ln -s /usr/lib/dri /usr/lib/xorg/modules/dri.

You may have to deload the radeon and dri modules, by issuing sudo rmmod radeon}} and {{{sudo rmmod dri.

Make sure you deload the module ati-agp by issuing sudo rmmod ati-agp and blacklist it in /etc/modprobe.d/blacklist.

Make sure you've added Load "dri" to /etc/X11/xorg.conf under Section "Module".

Ubuntu 11.10 - Crash or hang on switching users
Switching between X users on AMD driver v12.3 on amd64 for ATI Radeon HD6800 may cause display freeze.

Reference: 

http://ati.cchtml.com/show_bug.cgi?id=343 "Ubuntu 11.10 logout/login fails on desktop with Radeon HD6450, but OK on EeePC" on Unofficial AMD Linux Bugzilla (which is linked from AMD's driver page)

https://bugs.launchpad.net/ubuntu/+source/fglrx-installer-updates/+bug/876242 "Crash with fglrx and fast user switching"

Option 1

It is reported on http://ubuntuforums.org/showthread.php?p=11781573 that switching from Unity to Gnome Classic solves the problem:

To enable Gnome classic interface, install gnome-shell, 

sudo apt-get install gnome-shell
then select Gnome Classic on login screen.

Option 2

Switch to open source driver, see RadeonDriver.

HDTV underscan
If you experience underscan when outputting video to an HDTV, this may resolve the issue:

sudo aticonfig --set-pcs-val=MCIL,DigitalHDTVDefaultUnderscan,0
sudo reboot
This sets the default underscan setting to false.








    
    
sudo apt-get install fglrx-modaliases





</entry>
<entry [Sat 2012:07:14 00:20:52 EST] NEW TOSHIBA UBUNTU 12.04 WINDOW BORDERS MISSING>
    
1. INSTAL ccsm

Compiz Config Settings Manager

2. Check the "Window Decoration" section.

Under command I had "emerald --replace" listed as the command and had to reset it to the default for window decorations to reappear. It may work this way for you too.
    
    
</entry>
<entry [Fri 2012:07:06 01:36:46 EST] FIXED GNOME-TERMINAL SLOW>

PROBLEM:

SLOW TO SELECT/PASTE AND SLOW TO SCRAPE


DIAGNOSIS:

http://askubuntu.com/questions/71664/the-gnome-terminal-is-very-slow-in-gnome-3

SOME KIND OF MEMORY LEAK OR BUG - RESTARTING GNOME FIXES IT


SOLUTION:

ALT + F2 --> restart


    
</entry>
<entry [Wed 2012:06:06 03:01:19 EST] INSTALLED TEAMVIEWER>

http://debianhelp.wordpress.com/2011/12/23/teamviewer-7-beta-available-for-linux-remote-desktop-tool/

/mnt/home/syoung/software/teamviewer$ sudo dpkg -i teamviewer_linux_x64.deb 
Selecting previously unselected package teamviewer7.
(Reading database ... 211139 files and directories currently installed.)
Unpacking teamviewer7 (from teamviewer_linux_x64.deb) ...
dpkg: dependency problems prevent configuration of teamviewer7:
 teamviewer7 depends on lib32asound2; however:
  Package lib32asound2 is not installed.
 teamviewer7 depends on lib32z1; however:
  Package lib32z1 is not installed.
 teamviewer7 depends on ia32-libs; however:
  Package ia32-libs is not installed.
dpkg: error processing teamviewer7 (--install):
 dependency problems - leaving unconfigured
Errors were encountered while processing:
 teamviewer7


    
</entry>
<entry [Wed 2012:06:06 03:00:22 EST] INSTALLED DRAFTSIGHT CAD SOFTWARE>


1. DESCARGAR DRAFTSIGHT Y EXTRAER LO

http://www.3ds.com/products/draftsight/download-draftsight/

cd /home/nombre/carpeta/DraftSight


2. COPIAR LAS CARPETAS /opt Y /var EN EL DIRECTORIO DEL SISTEMA 

Ahora debemos copiar el contenido de las carpetas opt y var en el directorio del sistema (para hacer esto es necesario tener privilegios de administrador):

cd /mnt/home/syoung/software/draftsight
sudo mv ./opt/dassault-systemes /opt
sudo mv ./var/opt/dassault-systemes /var/opt


3. INSTALAR DRAFTSIGHT

-dependency problem:
 dassault-systemes-draftsight:i386 pre-depends on libexpat1 (>= 2.0.1-4)


cd DEBIAN

sudo ./preinst

Al ejecutarlo se mostrará la pantalla donde se debe aceptar la licencia del programa, solo se debe aceptar para continuar

sudo ./postinst

Si hicimos los pasos bien, entonces ya debemos tener el programa instalado. Podemos ejecutarlo presionando la tecla super y escribiendo draftsight.


NOTES
=====
http://www.ggsalas.com.ar/instalar-draftsight-en-ubuntu-11-04-x64/

Instalar DraftSight en Ubuntu 11.04 x64
Posted on 9 mayo 2011 by gabriel

 
Gracias a Juan José Alca Machaca, uno de los lectores de este blog, tenemos la manera de instalar DraftSight en Ubuntu 11.04 de 64 bits.

Lo primero que se debe hacer es extraer el archivo .deb a una carpeta. En mi caso presiono el botón derecho y selecciono “Extraer aquí”. Esto crea una carpeta llamada DraftSight con tres carpetas dentro: DEBIAN, opt y var.

Ahora debemos copiar el contenido de las carpetas opt y var en el directorio del sistema, para hacer esto es necesario tener privilegios de administrador, para facilitar la tarea vamos a usar la línea de comandos.

1. Abrimos la terminal presionando el bortón Super (windows) y escribiendo terminal y enter

2. Ubicamos la Terminal en el directorio donde se descargó el programa, para esto escribimos:

cd '/home/nombre usuario/carpeta/DraftSight/'
(nombre de usuario es el de tu computadora y carpeta es el directorio donde la descargaste)
También se puede escribir “cd” y luego seleccionar la carpeta Draftsight y arrastrarla hasta la terminal, soltar y la ruta se escribe de manera automática.
3. Copiar y pegar las siguientes líneas de código, una a la vez:

sudo mv ./opt/dassault-systemes /opt
sudo mv ./var/opt/dassault-systemes /var/opt
4. Ahora vamos al directorio DEBIAN, dentro de DraftSight con:

cd DEBIAN
5. Ejecutamos dos órdenes:

sudo ./preinst
Al ejecutarlo se mostrará la pantalla donde se debe aceptar la licencia del programa, solo se debe aceptar para continuar

sudo ./postinst
Si hicimos los pasos bien, entonces ya debemos tener el programa instalado. Podemos ejecutarlo presionando la tecla super y escribiendo draftsight.

Más info en el Foro de Ubuntu




    
</entry>
<entry [Wed 2012:06:06 02:59:58 EST] UBUNTU 12.04 IS SLOW >

http://debianhelp.wordpress.com/2012/03/09/to-do-list-after-installing-ubuntu-12-04-lts-aka-precise-pangolin/


    
</entry>
<entry [Fri 2012:04:27 23:24:24 EST] REINSTALLED software-center AFTER IT KEPT ON CRASHING>

sudo apt-get purge software-center

sudo apt-get install software-center

    WARNING:softwarecenter.db.update:The file: '/usr/share/app-install/desktop/kde-telepathy-send-file:kde4__ktp-send-file.desktop' could not be read correctly. The application associated with this file will not be included in the software catalog. Please consider raising a bug report for this issue with the maintainer of that application
    Software catalog update was successful.


</entry>
<entry [Thu 2012:04:19 00:48:26 EST] >

DOWNLOADED FLASH PLAYER LATEST VERSION FROM www.adobe.com/downloads

install_flash_player_11_linux.x86_64.tar.gz

INSTALL FLASH PLAYER

cd /mnt/home/syoung/software/flash
ll
    -rw-rw-r--  1 syoung syoung  7224826 Apr 19 00:25 install_flash_player_11_linux.x86_64.tar.gz
    -rw-rw-r--  1    501    501 19216752 Apr 11 18:12 libflashplayer.so
    -rw-rw-r--  1    501    501     3622 Apr 11 18:12 readme.txt
    drwxrwxr-x  5    501    501     4096 Apr 11 18:12 usr/


mkdir -p /opt/google/chrome/plugins
cd /opt/google/chrome/plugins
cp libflashplayer.so  /opt/google/chrome/plugins


cd /opt/google/chrome/plugins
sudo cp -r usr/* /usr


NOTES
=====
readme.txt

Installing using the plugin tar.gz:

o Copy libflashplayer.so to the appropriate browser plugins directory.  At the prompt type:

    + cp libflashlayer.so < BrowserPluginsLocation>


o Copy the Flash Player Local Settings configurations files to the /usr directory.
    
At the prompt type:

sudo cp -r usr/* /usr

    
</entry>
<entry [Mon 2012:04:16 23:36:55 EST] UNLIMITED TERMINAL BUFFER>

IN TERMINAL

Edit -> Profiles -> Edit -> Scrolling tab -> Unlimited
    
</entry>
<entry [Tue 2012:04:03 19:06:26 EST] START COMPIZ SETTINGS MANAGER ON COMMAND LINE>

ccsm

The program 'ccsm' is currently not installed.  You can install it by typing:

apt-get install compizconfig-settings-manager

    
</entry>

<entry [Mon 2012:04:02 23:01:14 EST] CONFIGURE WIRELESS NETWORK ON COMMAND LINE>


dconf-editor


The program 'dconf-editor' is currently not installed.  You can install it by typing:


apt-get install dconf-tools



COMMAND LINE TOOL FOR NETWORK MANAGER
cmcc help


indicator-network


INSTALL network-manager:

apt-get install network-manager



nmcli



NOT THE FOLLOWING:


1. INITIAL CHECK

nm-tool


2. CHECK RECOGNITION OF WIRELESS ADAPTER

sudo lshw -C network

    ...
       description: Wireless interface
       product: AR242x / AR542x Wireless Network Adapter (PCI-Express)
       vendor: Atheros Communications Inc.
       physical id: 0
       bus info: pci@0000:03:00.0
       logical name: wlan0
       version: 01
       serial: 00:24:d2:70:67:72
       width: 64 bits
       clock: 33MHz
       capabilities: pm msi pciexpress msix bus_master cap_list ethernet physical wireless
       configuration: broadcast=yes driver=ath5k driverversion=3.0.0-12-generic firmware=N/A latency=0 link=no multicast=yes wireless=IEEE 802.11bg
       resources: irq:17 memory:d4600000-d460ffff


3. CHECK DRIVER IS COMMUNICATING WITH THE KERNEL

IF THE OUTPUT OF lshw -C network SHOWED A DRIVER BOUND TO THE DEVICE let's test to make sure it's communicating with the kernel

SEE IF DRIVER IS LOADED WITY lsmod
sudo lsmod | grep ath

    ath5k                 156371  0 
    ath                    24067  1 ath5k
    mac80211              310872  1 ath5k
    cfg80211              199587  3 ath5k,ath,mac80211

If you did not see the driver module in the list then use sudo modprobe to load it.

CHECK DRIVER IS CORRECTLY IDENTIFYING DEVICE TO KERNEL WITH iwconfig

sudo iwconfig

    lo        no wireless extensions.    
    eth0      no wireless extensions.
    wlan0     IEEE 802.11bg  ESSID:off/any  
              Mode:Managed  Access Point: Not-Associated   Tx-Power=20 dBm   
              Retry  long limit:7   RTS thr:off   Fragment thr:off
              Encryption key:off
              Power Management:off

If you see output like in the example in the command section then the driver is at least identifying the device as a wireless device to the kernel.


SCAN FOR WIRELESS ACCESS POINT WITH iwlist 

iwlist 
    ...
              [interface] frequency 
              [interface] channel 

    (NO ACCESS POINT IDENTIFIED)

Run the command sudo scan to scan for a wireless access point. If an access point is identified, the card is probably working properly as it can complete a wireless interface task.








NOTES
=====


1. Perform an initial check

Our first step will be to verify some basic network connectivity information.
Make sure that your laptop is not connected to a wired internet connection.
If you have an external wireless adapter (such as a wireless-USB adapter, or a PCMCIA card), make sure that it is inserted into the proper slot on your computer.
If your wireless card is inside your computer, make sure that your wireless adapter switch is turned on.
Click the network menu on the top panel and make sure that the Enable Wireless setting is checked.
Open a terminal window (such as gnome-terminal), and enter the following command:
nm-tool
The nm-tool program will display information about your network hardware and connection status. If output from the wireless connection section contains the text, State: Connected, it means that your wireless adapter is working and it is connected to your wireless router.
If you are connected to your wireless router, but you still cannot access the internet, your router may not be set up correctly, or your Internet Service Provider (ISP) may be experiencing some technical problems. Review your router and ISP setup guides, or contact your ISP for support.
If the output from the nm-tool command did not indicate that you were connected to the network, proceed to the next portion of the troubleshooting guide.


2. CHECK WIRELESS ADAPTER

Let's see if your computer recognizes your wireless adapter.
Open a terminal window, and enter sudo lshw -C network.
If you get no response, you may need to install the lshw program on your computer; you can install it by typing sudo apt-get install lshw in a terminal.
Read the output from the command, and check for the Wireless interface section. If your wireless adapter is detected, the output should look similar to this:
*-network
       description: Wireless interface
       product: PRO/Wireless 3945ABG [Golan] Network Connection
       vendor: Intel Corporation
       physical id: 0
       bus info: pci@0000:03:00.0
       logical name: wlan0
       version: 02
       serial: 00:1b:77:11:5a:a7
       width: 32 bits
       clock: 33MHz
       capabilities: pm msi pciexpress bus_master cap_list ethernet physical wireless
       configuration: broadcast=yes driver=iwl3945 driverversion=2.6.38.2-9.fc15.i686
       firmware=15.32.2.9 ip=192.168.1.42 latency=0 link=yes multicast=yes
       wireless=IEEE 802.11abg
       resources: irq:46 memory:edf00000-edf00fff
If a wireless device is listed, then continue to the Device Drivers page.
If a wireless device is not listed, the next steps will help you to locate the hardware information.If you get no response, you may need to install the lshw program on your computer; you can install it by typing sudo apt-get install lshw in a terminal.
Read the output from the command, and check for the Wireless interface section. If your wireless adapter is detected, the output should look similar to this:
*-network
       description: Wireless interface
       product: PRO/Wireless 3945ABG [Golan] Network Connection
       vendor: Intel Corporation
       physical id: 0
       bus info: pci@0000:03:00.0
       logical name: wlan0
       version: 02
       serial: 00:1b:77:11:5a:a7
       width: 32 bits
       clock: 33MHz
       capabilities: pm msi pciexpress bus_master cap_list ethernet physical wireless
       configuration: broadcast=yes driver=iwl3945 driverversion=2.6.38.2-9.fc15.i686
       firmware=15.32.2.9 ip=192.168.1.42 latency=0 link=yes multicast=yes
       wireless=IEEE 802.11abg
       resources: irq:46 memory:edf00000-edf00fff
If a wireless device is listed, then continue to the Device Drivers page.
If a wireless device is not listed, the next steps will help you to locate the hardware information.


3. CHECK DRIVER IS COMMUNICATING WITH KERNEL

Check Driver
If you ran lshw -C network and saw a driver bound to the device then let's test to make sure it's communicating with the kernel. You can also go back to the Initial Check page to check for any signs of connectivity.
Run sudo lsmod to see if the driver is loaded. Look for the driver name that was listed in the "configuration" line output of lshw.
If you did not see the driver module in the list then use sudo modprobe to load it.
Run sudo iwconfig. If you see output like in the example in the command section then the driver is at least identifying the device as a wireless device to the kernel.
Run the command sudo iwlist scan to scan for a wireless access point. If an access point is identified, the card is probably working properly as it can complete a wireless interface task.



    
</entry>
<entry [Fri 2012:03:23 10:36:42 EST] REMOVE TOP BAR>

1. REMOVE GLOBAL MENU PACKAGE

sudo apt-get remove appmenu-gtk3 appmenu-gtk appmenu-qt


2. RESTART

PROBLEM:
No system tray detected on this system. Unable to start. Exiting
SOLUTION:
Remove 'HPLIP' using software-center


NOTES
=====

http://www.addictivetips.com/ubuntu-linux-tips/how-to-disable-global-menu-in-ubuntu-11-10-tip/

To disable the Global Menu, use the following Terminal command. Once done, log out or restart your system for changes to take effect.

sudo apt-get remove appmenu-gtk3 appmenu-gtk appmenu-qt
This process is completely revertible and the changes can be undone by re-installing the package from the below given command. Once the package is installed, restart your computer.

sudo apt-get install appmenu-gtk3 appmenu-gtk appmenu-qt

    
</entry>
<entry [Fri 2012:03:23 10:36:16 EST] REMOVE OVERLAY SCROLLBAR>

http://www.addictivetips.com/ubuntu-linux-tips/how-to-get-classic-scrollbar-back-in-ubuntu-11-04-tip/

1. INSTALL Synaptic Package Manager

sudo apt-get install synaptic

2. OPEN Synaptic Package Manager AND REMOVE PACAKAGE



apt-get remove liboverlay-scrollbar


3. RESTART




</entry>
<entry [Tue 2012:03:20 02:48:00 EST] INSTALL CANON PIXMA MP495 PRINTER DRIVER>

Get the Canon Pixma MP495 working in 10.10 (Maverick)
http://ubuntuforums.org/showthread.php?t=1602839

For setting your MP495 printer up on your network without the use of a Windows or Mac machine (Fresh out of the box with Ubuntu) you will need to match your Routers SSID to the printers default SSID, and remove any security you have enabled. This will allow the printer to connect to your network.

Printer Defaults:
SSID: BJNPSETUP
IP ADDRESS: Automatic



1. INSTALL angryiprscan

FOUND PRINTER ON NETWORK
192.168.0.101

BROWSED TO PRINTER AND CHECKED SSID
maroontown


2. INSTALL PRINTER DIRVER

DOWNLOAD  cnijfilter-mp495series-3.40-1-deb.tar.gz


INSTALL

cd ~/software/drivers/canon-pixma-mp495
tar xvfz  cnijfilter-mp495series-3.40-1-deb.tar.gz 
cd cnijfilter-mp495series-3.40-1-deb/packages/
cd ~/software/drivers/canon-pixma-mp495/printer/cnijfilter-mp495series-3.40-1-deb
chmod 755 install.sh 
./install.sh 

    Command executed = sudo dpkg -iG ./packages/cnijfilter-common_3.40-1_amd64.deb
    (Reading database ... 160033 files and directories currently installed.)
    Preparing to replace cnijfilter-common 3.40-1 (using .../cnijfilter-common_3.40-1_amd64.deb) ...
    Unpacking replacement cnijfilter-common ...
    Setting up cnijfilter-common (3.40-1) ...
    Processing triggers for libc-bin ...
    ldconfig deferred processing now taking place
    Command executed = sudo dpkg -iG ./packages/cnijfilter-mp495series_3.40-1_amd64.deb
    (Reading database ... 160033 files and directories currently installed.)
    Preparing to replace cnijfilter-mp495series 3.40-1 (using .../cnijfilter-mp495series_3.40-1_amd64.deb) ...
    Unpacking replacement cnijfilter-mp495series ...
    Setting up cnijfilter-mp495series (3.40-1) ...
    Processing triggers for libc-bin ...
    ldconfig deferred processing now taking place
    
    #=========================================================#
    #  Register Printer
    #=========================================================#
    Next, register the printer to the computer.
    Connect the printer, and then turn on the power.
    To use the printer on the network, connect the printer to the network.
    When the printer is ready, press the Enter key.
    > 
    
    #=========================================================#
    #  Connection Method
    #=========================================================#
     1) USB
     2) Network
    Select the connection method.[1]2
    
    Searching for printers...
    
    
    #=========================================================#
    #  Select Printer
    #=========================================================#
    Select the printer.
    If the printer you want to use is not listed, select Update [0] to search again.
    To cancel the process, enter [Q].
    -----------------------------------------------------------
     0) Update
    -----------------------------------------------------------
    Target printers detected (MAC address  IP address)
    1) Canon MP495 series (88-87-17-24-FF-F2 192.168.0.101)
    -----------------------------------------------------------
    Currently selected:[1] Canon MP495 series (88-87-17-24-FF-F2 192.168.0.101)
    Enter the value. [1]
    
    #=========================================================#
    #  Register Printer
    #=========================================================#
    Enter the printer name.[MP495LAN]
    Command executed = sudo /usr/sbin/lpadmin -p MP495LAN -m canonmp495.ppd -v cnijnet:/88-87-17-24-FF-F2 -E
    
    #=========================================================#
    #  Set as Default Printer
    #=========================================================#
    Do you want to set this printer as the default printer?
    Enter [y] for Yes or [n] for No.[y]
    
    #=========================================================#
    Installation has been completed.
    Printer Name : MP495LAN
    Select this printer name for printing.
    #=========================================================#



3. INSTALL SCANNER DRIVER

cd ~/software/drivers/canon-pixma-mp495/scanner
tar xvfz scangearmp-mp495series-1.60-1-deb.tar.gz 
cd scangearmp-mp495series-1.60-1-deb/packages/
cd ~/software/drivers/canon-pixma-mp495/scanner/scangearmp-mp495series-1.60-1-deb
chmod 755 install.sh 
./install.sh 
    Command executed = sudo dpkg -iG ./packages/scangearmp-common_1.60-1_amd64.deb
    (Reading database ... 160033 files and directories currently installed.)
    Preparing to replace scangearmp-common 1.60-1 (using .../scangearmp-common_1.60-1_amd64.deb) ...
    Unpacking replacement scangearmp-common ...
    Setting up scangearmp-common (1.60-1) ...
    Processing triggers for libc-bin ...
    ldconfig deferred processing now taking place
    Command executed = sudo dpkg -iG ./packages/scangearmp-mp495series_1.60-1_amd64.deb
    (Reading database ... 160033 files and directories currently installed.)
    Preparing to replace scangearmp-mp495series 1.60-1 (using .../scangearmp-mp495series_1.60-1_amd64.deb) ...
    Unpacking replacement scangearmp-mp495series ...
    Setting up scangearmp-mp495series (1.60-1) ...
    Processing triggers for libc-bin ...
    ldconfig deferred processing now taking place
    Installation has been completed.


NOTES
=====

http://ubuntuforums.org/showthread.php?t=1602839

Get the Canon Pixma MP495 working in 10.10 (Maverick)

I have finaly gotten the Canon Pixma MP495 working under Ubuntu 10.10, with full resolution capabilities of the printer.
This printer is only advirtised as having a max resolution of 4800x1200 DPI. However, I called Canon to get the full range of print resolutions and was informed that this printer is capable of 9600x2400 DPI.

I haven't tested this below Ubuntu 10.04 but it should work fine.


For setting your MP495 printer up on your network without the use of a Windows or Mac machine (Fresh out of the box with Ubuntu) you will need to match your Routers SSID to the printers default SSID, and remove any security you have enabled. This will allow the printer to connect to your network.

Printer Defaults:
SSID: BJNPSETUP
IP ADDRESS: Automatic

Once you have done that you will need to activate the wireless lan on the printer.

Press the Maintenance button on the printer 13 times until you see what looks like a capital G without the middle line. Then press the color start button. (refer to page 10 of your Network Setup Troubleshooting manual for an actual picture of the symbol) You should see the wifi light on the front of the printer turn on and be solid not be blinking. (If it is blinking check your routers SSID settings and match the Default SSID of the printer as listed above.

Now download angryipscanner AngryIPScanner and install it by double clicking it. It should open in the Software center or with the Gdebi installer. (this may take a few minutes to install.)

Once you have installed AngryIPScanner, run it and change the ip range to include from 1 - 254 in the last octet. Then click start. 

When it finishes look for an active connection with a Hostname like A001BF000000.local. Yours may be different but should be very simular.

The IP address given for that hostname is the IP address of your printer. Open Firefox and type that address in the address bar and press enter. From there you can configure you printer for the SSID, and encryption that you had on your router before the change, and set a static IP for the printer so you can manage it easily.
After you change the SSID and encryption on the printer you will have to go back to your router and change the SSID and encryption back to what it was before so your printer can connect again.

Now your network should be back the way it was and your printer should be connected

Now that you have successfully connected the printer to your wireless network continue with the rest of the installation.

Download the drivers for the MP495 .

You will be downloading cnijfilter-mp495series-3.40-1-deb.tar.gz. 

Try this method first!
Extract cnijfilter-mp495series-3.40-1-deb.tar.gz to your Home directory.
Change the permissions of the install.sh file to run and an executable by Right licking on install.sh and then left clicking Properties.
Click on the Permissions tab and put a check mark in the Allow Executing file as program box.
Then open a terminal and type:
[CODE]sudo ./install.sh[CODE]
Follow the prompts and if you are using the printer over the network select network when prompted. I you are using it via USB choose USB.
Don't forget to scroll down to complete setting up your printer to use full resolution and set up the scanner.

If the first method didnt work try this.
Open a terminal and enter
Code:
cd /home/*/cnijfilter-mp495series-3.40-1-deb/packages
. (Enter your username where the astride is.)

Quote:
For 64 bit systems you need to replace cnijfilter-common_3.40-1_i386.deb, and cnijfilter-mp495series_3.40-1_i386.deb with cnijfilter-common_3.40-1_amd64.deb, and
cnijfilter-mp495series_3.40-1_amd64.deb. For the printer setup.
For the scanner replace scangearmp-common_1.60-1_i386.deb, and scangearmp-mp495series_1.60-1_i386.deb with scangearmp-common_1.60-1_amd64.deb, scangearmp-mp495series_1.60-1_amd64.deb. Everything else is the same.
Now enter
Code:
sudo dpkg -i cnijfilter-common_3.40-1_i386.deb
and press enter.

Now enter
Code:
sudo dpkg -i cnijfilter-mp495series_3.40-1_i386.deb
and press enter.

After that is complete go to System-Administration-Printing and click on Add.

If you have set up your printer on your network you should find it listed under Network Printing after a moment. (It takes a second for Ubuntu to find it on the network.)
Select the Canon-MP495-series_XX-XX-XX-XX-XX then click [Forward].
It will tell you that it is searching for Drivers. (wait for it.....)
In just a second a new window will appear asking for the Description of the Printer. Give it a name in the Location Field.

Now that you have a functioning MP495 printer, printing at a meager 600 DPI, lets make it better!

Change the Available Resolutions for Printing

Open another terminal and edit the first of two postscript files for this printer.

Code:
gksudo gedit /etc/cups/ppd/Canon-MP495.ppd
Find: *OpenUI *Resolution/Output Resolution: PickOne

Then we are going to replace the text

from:

*OpenUI *Resolution/Output Resolution: PickOne

to:

*CloseUI: *Resolution


With: 

*OpenUI *Resolution/Output Resolution: PickOne
*DefaultResolution: 4800dpi
*Resolution 600dpi/600 DPI: "< < /HWResolution[600 600]>>setpagedevice"
*Resolution 1200dpi/1200 DPI: "< < /HWResolution[1200 1200]>>setpagedevice"
*Resolution 2400dpi/2400 DPI: "< < /HWResolution[2400 2400]>>setpagedevice"
*Resolution 2400dpi/4800 DPI: "< < /HWResolution[2400 4800]>>setpagedevice"
*Resolution 2400dpi/9600 DPI: "< < /HWResolution[2400 9600]>>setpagedevice"
*CloseUI: *Resolution

Save and close gedit. 

Open another terminal and edit the second postscript file for this printer.
Code:
gksudo gedit /usr/share/ppd/canonmp495.ppd
Find: *OpenUI *Resolution/Output Resolution: PickOne

Then we are going to replace the text from: *OpenUI *Resolution/Output Resolution: PickOne to: *CloseUI: *Resolution
With: 
*OpenUI *Resolution/Output Resolution: PickOne
*DefaultResolution: 4800dpi
*Resolution 600dpi/600 DPI: "< < /HWResolution[600 600]>>setpagedevice"
*Resolution 1200dpi/1200 DPI: "< < /HWResolution[1200 1200]>>setpagedevice"
*Resolution 2400dpi/2400 DPI: "< < /HWResolution[2400 2400]>>setpagedevice"
*Resolution 2400dpi/4800 DPI: "< < /HWResolution[2400 4800]>>setpagedevice"
*Resolution 2400dpi/9600 DPI: "< < /HWResolution[2400 9600]>>setpagedevice"
*CloseUI: *Resolution

Save and close gedit.

Now restart the cups service.
with
Code:
sudo service cups restart
in Ubuntu 10.10 and I think 10.04 too.
or
Code:
sudo /etc/init.d/cups restart
in previous verions.

You can now print with resolutions ranging from 600 DPI to 9600 DPI!
Enjoy.

For getting the scanner working download the drivers from here.

extract scangearmp-mp495series-1.60-1-deb.tar.gz into your home directory.
Open terminal and type. (Replace the astride with your user name.)
Code:
cd /home/*/scangearmp-mp495series-1.60-1-deb
Code:
sudo ./install.sh
Then to use your scanner, open terminal and type.
Code:
scangearmp
A Big thanks goes to BartmanMN for finding the Scanner drivers.
Enjoy!
Last edited by modsbyus; March 27th, 2011 at 10:01 PM.. Reason: corrected mistake on turning on wifi.
    
</entry>
<entry [Thu 2012:03:01 10:32:38 EST] ENABLE AUTO HIDE top bar>

1. INSTALL GNOME TOPBAR EXTENSION

sudo add-apt-repository ppa:webupd8team/gnome3
sudo apt-get update
sudo apt-get install gnome-shell-extensions-autohidetopbar



2. RELOAD GNOME SHELL

Restart GNOME without rebooting the computer

Save and close all open applications.

Use the Ctrl-Alt-Backspace shortcut keys to restart GNOME.

If Ctrl-Alt-Backspace is disabled, type

DIDN'T WORK
####sudo /etc/init.d/gdm restart
    sudo: /etc/init.d/gdm: command not found

killall gnome-panel



3. INSTALL ADVANCED SETTINGS (GNOME TWEAK TOOL)

software-center

Search: tweak --> Install: Advanced Settings (for Gnome)


UNITY --> advanced-settings


3. ACTIVATE EXTENSION USING GNOME Tweak Tool

If toggling autohide on/off doesn't work properly or you just want to change the value, open "extension.js":
gksu gedit /usr/share/gnome-shell/extensions/autohidetopbar2@werewolves.us/extension.js




3. 



http://www.webupd8.org/2011/11/autohide-top-bar-extension-finally.html

AUTOHIDE TOP BAR EXTENSION FINALLY AVAILABLE FOR GNOME SHELL 3.2 (BONUS: HAMSTER AND OVERLAY ICONS EXTENSIONS)
 
WebUpd8 reader KRK has updated the GNOME Shell Autohide Top Bar extension for GNOME Shell 3.2.

The extension, initially created by fpmurphy, lets you hide the GNOME Shell top bar by double clicking it. To disable autohiding, double click the top bar again.

Here's a video I've recorded a while back demoing GNOME Shell Autohide Top Bar extension - it's an old video, but the updated extension works in the same way:

The extension is available in the WebUpd8 GNOME 3 PPA - add the PPA and install it using the commands below:

sudo add-apt-repository ppa:webupd8team/gnome3
sudo apt-get update
sudo apt-get install gnome-shell-extensions-autohidetopbar

If you've installed the original Autohide Top Bar extension, remove it before installing this one!

Once installed, reload GNOME Shell and activate the extension using GNOME Tweak Tool.

If toggling autohide on/off doesn't work properly or you just want to change the value, open "extension.js":
gksu gedit /usr/share/gnome-shell/extensions/autohidetopbar2@werewolves.us/extension.js

And increase the "const TIME_DELTA" value to something that works for you.

If you're not using Ubuntu, download the extension from HERE, extract it and place the folder under /usr/share/gnome-shell/extensions (or ~/.local/share/gnome-shell/extensions).



Notes
=====

gconftool-2 -s /apps/panel/toplevels/panel_0/auto_hide --type Boolean true

    
</entry>
<entry [Wed 2012:02:29 23:08:32 EST] HIDE DOCK>
    
INSTALL

    docky

OR
    
    cairo-dock
    
</entry>
<entry [Wed 2012:02:29 22:32:03 EST] DISABLE UNITY LAUNCHER AUTOHIDE>

OPEN UNITY AND TYPE 'ccsm'    
    CCSM is started

click on the Ubuntu Unity plugin and set Hide Launcher to Autohide
click on the Reveal Mode button (the button with the word Left) and click on the green coloured edge to disable it.

When the reveal mode is disabled it turns from green to red.

close CCSM and to reveal the launcher panel just click on the SuperKey.
 
</entry>
<entry [Wed 2012:02:15 22:24:23 EST] FIX MISSING ICONS IN UNITY MENU>

CHANGE THEME FROM AMBIANCE TO RADIANCE OR HIGH CONTRAST

UNITY --> search 'THEME' --> radiance



    
</entry>
<entry [Tue 2012:02:14 10:48:06 EST] ADD LAUNCHERS TO UNITY AND REARRANGE UNITY LAUNCHERS>

1. use the "main menu" to create your launcher

2. when you use it right click the icon-> keep
    
    
</entry>
<entry [Sat 2011:12:24 10:42:25 EST] INSTALLED BROTHER DCP-J715N PRINTER DRIVER deb PACKAGE>

cd ~/software/drivers/brother-dcp-j715N 
sudo dpkg i dcpj715ncupswrapper-1.1.3-1.i386

    OK

    
</entry>
<entry [Wed 2011:11:16 11:31:48 EST] FIXED ERROR 'sudo: /etc/sudoers is owned by'>
    
FRIDAY, JANUARY 25, 2008

sudo: /etc/sudoers is owned by

 Right about now you're probably looking at somthing similar to this.
sudo: /etc/sudoers is owned by gid 1000, should be 0


Maybe you accidently chown'd or chmod'd files recursively where the etc directory was effected. Maybe you did the same thing I did & chowned /etc/sudoers to root:mygroup instead of root:root like it's supposed to be.

In any event you're looking at a message like the one above and you can't use sudo anymore. This is because the sudo application wants things exactly right or it assumes there's been a compromise.
The file /etc/sudoers should be owned by root:root and should not be readable by anyone other than root.

Unless for some reason you allow remote root logins, you will need to physically have the server in front of you to fix this issue. If you don't have a monitor hooked up to the system, you better find a monitor to hookup now.

If you have the root password, login as root & chown the file to root:root.
root@box:~$ chown root:root /etc/sudoers

Then chmod the /etc/sudoers to 0440.
root@box:~$ chmod 0440 /etc/sudoers


If you, like I, never set a root password, you'll need to reboot the system, press ESC during boot, & select the recovery mode from the boot options. That will give you a terminal logged in as root you can use to run the chown and chmod commands.

Once the proper ownership & permissions are set on that file you can restart the system as usual & sudo should be up and running again.
Posted by Joe Kovar at 2:37 AM
Labeled/Tagged as Command Line, linux, server, Ubuntu


</entry>
<entry [Thu 2011:10:13 22:35:32 EST] MESSAGE OF THE DAY>

The contents of /etc/motd are displayed by login after a successful login but just before it executes the login shell.

The abbreviation “motd” stands for “message of the day”, and this file has been traditionally used for exactly that (it requires much less disk space than mail to all users).
If you want to change this message in ubuntu server follow this procedure first you need to edit /etc/motd.tail file

sudo vi /etc/motd.tail

Enter your message save and exit the file

Now you can restart your ubuntu server to check your changes are working or not

For Ubuntu Intrepid Users

There is a new package that provides this functionality with more options, called update-motd, available in Ubuntu Universe for Intrepid.

Install update-motd in Ubuntu Intrepid

sudo aptitude install update-motd

This will complete the installation

This package seeks to make the /etc/motd (Message of the Day) more dynamic and valuable, by providing a simple, clean framework for defining scripts whose output will regularly be written to /etc/motd.

The update-motd package creates a directory, /etc/update-motd.d, and installs a cronjob, /etc/cron.d/update-motd, which calls /usr/sbin/update-motd every 10 minutes (by default).

/usr/sbin/update-motd uses run-parts to execute each script in /etc/update-motd.d in lexigraphic order, concatenating the results with the message-of-the-day header, /etc/motd.tail.

In this way, users, or even other packages can drop scripts into /etc/update-motd.d to affect the MOTD.

Example

create a script, such as /etc/update-motd.d/10-stats

sudo vi /etc/update-motd.d/10-stats

add the following lines and save the file.

#!/bin/sh
echo
date
echo
who
echo

Make sure you chmod +x /etc/update-motd.d/10-stats.Then, you can either run /usr/bin/update-motd, or uptimeWait ~10 minutes and then log in.

This is very simple and great idea where you can see whatever information you want when you login in to your server.    
    
</entry>
<entry [Sun 2011:08:28 07:01:17 EST] INSTALLED TRADITIONAL CHINESE INPUT>


1. INSTALLED USING COMMAND LINE START OF software-center:

sudo software-center

INSTALLED ALL scim-RELATED PACKAGES


2. START SCIM ON COMMAND LINE
scim -d


3. MAKE SCIM START AUTOMATICALLY ON RE-LOGIN (RESTART X)
Step 2: Go to "System" -> "Perferences", and select "Sessions". In "Startup Programs", add the command "scim -d".





NOTES
-----

HOWTO: Making Your Ubuntu Support Traditional Chinese in 3 Steps

Step 1: In the root terimal:


echo "deb ftp://ftp.hk.debian.org/unofficial/dlot-apt unstable main" 
>> /etc/apt/sources.list
apt-get update
apt-get install scim

#apt-get install

scim-chinese scim-chewing scim-config-socket scim-frontend-socket 
scim-gtk2-immodule scim-server-socket xfonts-intl-chinese 
ttf-arphic-gbsn00lp ttf-arphic-gkai00mp ttf-arphic-bkai00mp 
ttf-arphic-bsmi00lp

or if you want to install them manually, these packages are needed: 

(NOTE: Be sure to add the site first "deb ftp://ftp.hk.debian.org/unofficial/dlot-apt unstable main" in your /etc/apt/sources.list)

scim 
scim-chinese 
scim-chewing 
scim-config-socket 
scim-frontend-socket 
scim-gtk2-immodule 
scim-server-socket 
xfonts-intl-chinese 
ttf-arphic-gbsn00lp 
ttf-arphic-gkai00mp 
ttf-arphic-bkai00mp 
ttf-arphic-bsmi00lp


Step 2: Go to "System" -> "Perferences", and select "Sessions". In "Startup Programs", add the command "scim -d".


Step 3: Restart X (Ctrl+Alt+BackSpace)
    
</entry>
<entry [Wed 2011:08:10 04:27:54 EST] MAKE APACHE START AT BOOT>

ADD STARTUP COMMAND TO /etc/init.d/rc.local 

/etc/init.d/apache2 restart
    
    OK

### This does not work:
###chkconfig --level 345 apache on

</entry>
<entry [Thu 2011:07:21 18:37:54 EST] CONFIGURE SWITCH WORKSPACES HOTKEYS>
        
Preferences -> Keyboard Shortcuts --> Window Management -> Switch to workspace #.


</entry>
<entry [Mon 2011:05:23 05:01:15 EST] USING cut WITH SPACE DELIMITERS>

using "tr -s ' '" will sqeeze extra spaces to a single space letting cut work properly with a space as the delimiter:

ls -l | tr -s ' ' | cut -d' ' -f1,8-

    
</entry>
<entry [Sat 2011:05:14 21:54:01 EST] ENABLED BOOT LOG ON HP AND aquarius-8-cluster>

HOWTO: Log Boot Messages
http://ubuntuforums.org/showthread.php?t=49925
At times I find it very difficult to see what has succesfully loaded or not during boot up, and at those times I wish I could have a log to look over in calm. 


emacs /etc/default/bootlogd

CHANGE:

        BOOTLOGD_ENABLE=No
        
TO:

        BOOTLOGD_ENABLE=Yes


Now, everytime you restart, /var/log/boot will be created, and it will contain a log of all your boot messages. You need to be root to open it, so you can easily open it up again with sudo.

        
</entry>

<entry [Sun 2011:04:24 02:47:22 EST] FILEZILLA - HOW TO ADD SSH KEYFILE>
    
FILEZILLA: Edit --> Settings --> Connection --> SFTP --> Add Keyfile

CONVERT *pem FILE TO *ppk:

/home/syoung/22-agua/cloud/AWS/keypair/syoung/agua.ppk


USING THE SAME *pem FILE USED TO ssh TO AQ7 AND NEW CLUSTERS:
 /etc/init.d/rc.local 
ssh -i /home/syoung/22-agua/cloud/AWS/keypair/agua.pem root@ec2-174-129-109-161.compute-1.amazonaws.com

ALTERNATELY , SE TTHE SSH_AUTH_SOCK:

ssh-agent
SSH_AUTH_SOCK=/tmp/ssh-snjEZz8717/agent.8717; export SSH_AUTH_SOCK;
SSH_AGENT_PID=8718; export SSH_AGENT_PID;
echo Agent pid 8718;


    
</entry>


<entry [Sat 2011:04:23 10:14:24 EST] FIREWALLS AND LOGGING>

https://help.ubuntu.com/8.04/serverguide/C/firewall.html
Logs
Firewall logs are essential for recognizing attacks, troubleshooting your firewall rules, and noticing unusual activity on your network. You must include logging rules in your firewall for them to be generated, though, and logging rules must come before any applicable terminating rule (a rule with a target that decides the fate of the packet, such as ACCEPT, DROP, or REJECT).

If you are using ufw, you can turn on logging by entering the following in a terminal:

sudo ufw logging on
To turn logging off in ufw, simply replace on with off in the above command.

If using iptables instead of ufw, enter:

sudo iptables -A INPUT -m state --state NEW -p tcp --dport 80 -j LOG --log-prefix "NEW_HTTP_CONN: "
A request on port 80 from the local machine, then, would generate a log in dmesg that looks like this:

[4304885.870000] NEW_HTTP_CONN: IN=lo OUT= MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=127.0.0.1 DST=127.0.0.1 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=58288 DF PROTO=TCP SPT=53981 DPT=80 WINDOW=32767 RES=0x00 SYN URGP=0
The above log will also appear in /var/log/messages, /var/log/syslog, and /var/log/kern.log. This behavior can be modified by editing /etc/syslog.conf appropriately or by installing and configuring ulogd and using the ULOG target instead of LOG. The ulogd daemon is a userspace server that listens for logging instructions from the kernel specifically for firewalls, and can log to any file you like, or even to a PostgreSQL or MySQL database. Making sense of your firewall logs can be simplified by using a log analyzing tool such as fwanalog, fwlogwatch, or lire.

    
    
</entry>

<entry [Fri 2011:04:22 12:56:52 EST] RESTRICT ACCESS TO APACHE>

http://serverfault.com/questions/215660/how-to-limit-server-to-specific-ip-addresses-with-mod-authz-host

EDIT:

/etc/apache2/sites-enabled/000-default 

TO LOOK LIKE THIS:

<!--
        <Directory /var/www/html>
                Options Indexes FollowSymLinks MultiViews
                AllowOverride None

#               Order allow,deny
#               allow from all

                Order deny,allow
                Deny from all
                Allow from 127.0.0.0/255.0.0.0 ::1/128

        </Directory>

-->

NOTES
-----

For example, this will allow only the subnet 192.168.0.0/24 to access your web server.

<!--

<Directory /var/www/>
   Options Indexes FollowSymLinks MultiViews
   AllowOverride None
   Order allow,deny
   allow from 192.168.0.0/24
</Directory>

-->
    
</entry>
<entry [Wed 2011:04:20 20:29:09 EST] ASIAN LANGUAGE SUPPORT WITH SCIM>


    
</entry>

<entry [Wed 2011:04:20 13:28:34 EST] LIST USERS AND GROUPS>

http://www.linuxforums.org/forum/red-hat-fedora-linux/41672-command-view-list-all-users-groups.html    

SHOW ALL GROUPS:
cat /etc/group |cut -d: -f1

SHOW ALL USERS:
cat /etc/passwd | cut -d: -f1


</entry>


<entry [Wed 2011:04:13 03:12:16 EST] UNDELETE FILE REMOVED USING rm ON COMMAND LINE>

1. DOWNLOAD extundelete 

HOME PAGE
http://extundelete.sourceforge.net/
http://talk.maemo.org/showthread.php?t=47360

DOWNLOAD
http://sourceforge.net/projects/extundelete/files/latest/download
wget http://downloads.sourceforge.net/project/extundelete/extundelete/0.2.3/extundelete-0.2.3.tar.bz2?r=http%3A%2F%2Fextundelete.sourceforge.net%2F&ts=1355574832&use_mirror=voxel

2. INSTALL DEPENDENCIES
apt-get install e2fslibs-dev

3. INSTALL
cd 0.1.8
make
make install

4. REBOOT TO RESCUE MODE --> ROOT ON COMMAND LINE

5. RESTORE ALL RECOVERABLE INODES TO /root/RECOVERED_FILES
extundelete --restore-all

6. REBOOT TO NORMAL MODE AND COPY RECOVERED FILE
cp /root/RECOVERED_FILES/syoung/0.6/bin/apps/t/Cluster/01.Loop.t \
/home/syoung/0.6/bin/apps/t/Cluster

</entry>

<entry [Thu 2011:04:07 21:56:46 EST] INSTALL MULTIPLE .deb FILES AT THE SAME TIME>

INSTALL A LIST OF PACKAGES:

sudo dpkg -i list_of_packages


OR ALL PACKAGES IN A DIRECTORY:

sudo dpkg -i -R dir_name

   
OTHER .deb FILE COMMANDS:
http://www.cyberciti.biz/howto/question/linux/dpkg-cheat-sheet.php

Syntax	Description	Example

dpkg -i {.deb package}	Install the package
    dpkg -i zip_2.31-3_i386.deb

dpkg -i {.deb package}	Upgrade package if it is installed else install a fresh copy of package
    dpkg -i zip_2.31-3_i386.deb

dpkg -R {Directory-name}	Install all packages recursively from directory
    dpkg -R /tmp/downloads

dpkg -r {package}	Remove/Delete an installed package except configuration files
    dpkg -r zip

dpkg -P {package}	Remove/Delete everything including configuration files
    dpkg -P apache-perl

dpkg -l	List all installed packages, along with package version and short description
    dpkg -l
    dokg -l | less
    dpkg -l '*apache*'
    dpkg -l | grep -i 'sudo'

dpkg -l {package}	List individual installed packages, along with package version and short description
    dpkg -l apache-perl

dpkg -L {package}	Find out files are provided by the installed package i.e. list where files were installed
    dpkg -L apache-perl
    dpkg -L perl

dpkg -c {.Deb package}	List files provided (or owned) by the package i.e. List all files inside debian .deb package file, very useful to find where files would be installed
    dpkg -c dc_1.06-19_i386.deb

dpkg -S {/path/to/file}	Find what package owns the file i.e. find out what package does file belong
    dpkg -S /bin/netstat
    dpkg -S /sbin/ippool

dpkg -p {package}	Display details about package package group, version, maintainer, Architecture, display depends packages, description etc
    dpkg -p lsof

dpkg -s {package} | grep Status	Find out if Debian package is installed or not (status)
    dpkg -s lsof | grep Status

</entry>

<entry [Thu 2011:04:07 21:53:36 EST] IMAGED CURRENT GOOD SETUP WITH fsarchiver BEFORE INSTALL SGE>

IMAGED FILE WITH fsarchiver:

mkdir /mnt/data
mount /dev/sda3 /mnt/data
fsarchiver savefs /mnt/data//home/u1010.110407.good-presge.fsa

CREATES THIS FILE:

/home/u1010.110407.good-presge.fsa

TO RESTORE:

mkdir /mnt/data
mount /dev/sda3 /mnt/data
fsarchiver restfs /mnt/data//home/u1010.110407.good-presge.fsa id=0,dest=/dev/sda1

    
</entry>
<entry [Tue 2011:04:05 17:11:51 EST] IMAGE LINKS FOR UPCOMING UBUNTU RELEASES>

<!--
NATTY NARWHAL

LARGE
<a href="http://picomol.de/2010/12/23/der-weg-zu-natty-narwhal/"><img class="aligncenter" title="Counter Ubuntu 11.04" src="http://picomol.de/counter/i.png" alt="" width="200" height="200"></a>

SMALL
<a href="http://picomol.de/2010/12/23/der-weg-zu-natty-narwhal/"><img class="aligncenter" title="Counter Ubuntu 11.04" src="http://picomol.de/counter/i_s.png" alt="" width="200" height="50"></a>


ONEIRIC 0CELOT

<a href="http://picomol.de/2011/03/11/ubuntu-11-10-oneiric-ocelot-countdown"><img class="aligncenter" title="Counter Ubuntu 11.10" src="http://picomol.de/ubuntu-oneiric-counter/150_purple.png" alt="" width="150" height="150"></a>

<a href="http://picomol.de/2011/03/11/ubuntu-11-10-oneiric-ocelot-countdown"><img class="aligncenter" title="Counter Ubuntu 11.10" src="http://picomol.de/ubuntu-oneiric-counter/234.png" alt="" width="234" height="60"></a>


-->    
</entry>

<entry [Tue 2011:04:05 17:05:52 EST] RESTORE Desktop FOLDER>

Restore your Desktop folder in Ubuntu

If u you have accidentally deleted the Desktop folder, it will be placed in Trash. Unfortunately you can't restore to the actual location. Don't worry. Try this steps and you can restore it to the existing location(recommended) or even you can change the location.


ADD THIS LINE:

XDG_DESKTOP_DIR="$HOME/Desktop"

TO THIS FILE:

emacs ~/.config/user-dirs.dirs


I.E., IT SHOULD LOOK LIKE THIS:

    # This file is written by xdg-user-dirs-update
    # If you want to change or add directories, just edit the line you're
    # interested in. All local changes will be retained on the next run
    # Format is XDG_xxx_DIR="$HOME/yyy", where yyy is a shell-escaped
    # homedir-relative path, or XDG_xxx_DIR="/yyy", where /yyy is an
    # absolute path. No other format is supported.
    #
    XDG_DESKTOP_DIR="$HOME/Desktop"
    XDG_DOWNLOAD_DIR="$HOME/"
    XDG_TEMPLATES_DIR="$HOME/"
    XDG_PUBLICSHARE_DIR="$HOME/"
    XDG_DOCUMENTS_DIR="$HOME/"
    XDG_MUSIC_DIR="$HOME/"
    XDG_PICTURES_DIR="$HOME/"
    XDG_VIDEOS_DIR="$HOME/"


    
</entry>


<entry [Wed 2011:03:30 18:08:56 EST] INSTALLED PACKAGES>

apt-get install zsh

    
</entry>

