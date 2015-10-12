vagrant




<entry [Mon 2015:02:02 12:24:41 EST] FIXED PORT FORWARDING ON cypher1>

PROBLEM

CAN'T SEE localhost:8000 FORWARDED FROM cypher1 VM


DIAGNOSIS

Vagrantfile CONTENTS:

	...
	# Create a forwarded port mapping which allows access to a specific port
	# within the machine from a port on the host machine. In the example below,
	# accessing "localhost:8080" will access port 80 on the guest machine.
	# config.vm.network :forwarded_port, guest: 80, host: 8080

	config.vm.network :forwarded_port, guest: 8000, host: 8000
	config.vm.network :forwarded_port, guest: 80, host: 8080	 

	# Create a private network, which allows host-only access to the machine
	# using a specific IP.
	
	config.vm.network :private_network, ip: "192.168.33.10"

ON VM:

curl http://localhost:8000

	{"detail": "Authentication credentials were not provided."}


ON HOST:

curl http://localhost:8000
	HANGS


SOLUTION

IF PORT CLASH, USE DIFFERENT PORT AND RELOAD

vagrant reload --provision


Vagrant cannot forward the specified ports on this VM, since they
would collide with some other application that is already listening
on these ports. The forwarded port to 8001 is already in use
on the host machine.

To fix this, modify your current projects Vagrantfile to use another
port. Example, where '1234' would be replaced by a unique host port:

  config.vm.network :forwarded_port, guest: 8001, host: 1234

Sometimes, Vagrant will attempt to auto-correct this for you. In this
case, Vagrant was unable to. This is usually because the guest machine
is in a state which doesn't allow modifying port forwarding.
~/dev/vagrant user$ 
You are actually not only using the Vagrantfile from ~/dev/vagrant but also the one from your "box" distribution .box file which is typically located here:

~/.vagrant.d/boxes/trusty/0/virtualbox/Vagrantfile
	
</entry>
<entry [Mon 2014:11:03 01:51:51 EST] INSTALLED VAGRANT ON comp3>

1. INSTALL VIRTUALBOX

apt-get install virtualbox
VBoxManage --version
	4.3.10_Ubuntur93012


2. INSTALL VAGRANT

apt-get install vagrant
vagrant --version
	Vagrant 1.4.3


3. FAILED TO ADD osx BOX

vagrant box add osx-10.9.2  /home/syoung/software/osx/osx-mavericks-0.1.0.box

	Downloading box from URL: file:/home/syoung/software/osx/osx-mavericks-0.1.0.box
	Extracting box...te: 105M/s, Estimated time remaining: --:--:--)
	The box failed to unpackage properly. Please verify that the box
	file you're trying to add is not corrupted and try again. The
	output from attempting to unpackage (if any):
	
	x ./box-disk1.vmdk: truncated gzip input
	bsdtar: Error exit delayed from previous errors.


4. ADDED UBUNTU 14.04 BOX

vagrant box add u14.04-server https://cloud-images.ubuntu.com/vagrant/trusty/20141031.1/trusty-server-cloudimg-i386-vagrant-disk1.box


	
</entry>
<entry [Sat 2014:10:04 00:49:55 EST] DOWNLOADED MAC 10.9.2 BOX>

NB: Mac OS X guests only work with one CPU assigned to the VM


1. DOWNLOADED

wget -c http://files.dryga.com/boxes/osx-mavericks-0.1.0.box 




2. GITHUB SITE

https://github.com/AndrewDryga/vagrant-box-osx-mavericks

Mac OS X Mavericks Vagrant box for VirtualBox
This is a issue tracker for OS X Mavericks Vagrant box, which can be found on direct link, but it might be slow. (VagrantCloud refused to host this package.)

Box was tested only on VirtualBox. Mainly, I made it to build our iOS applications via CI-server.

Hosting issues

I can't host this image on VagrantCloud anymore, since Apple didn't let them to distribute VMs with their softare, you can use direct link to the box instead.

Warning

VirtualBox support for Mac OS X is experimental. More information can be found in official docs.


What's included?

Homebrew
Homebrew Cask
Puppet (without puppetmaster)
XCode 5.1
XCode Command Line Tools
Known issues

Do not turn 3D acceleration on, or your Box will start retuning aborted condition and would not start in headless mode
VirtualBox doen's have Guest additions for Mac OS X, so you can't have shared folders. Instead you can use normal network shared folders
Apple's EULA states that you can install your copy on your actual Apple-hardware, plus up to two VMs running on your Apple-hardware. So using this box on another hardware is may be illigal
If you face VM freezed on message hfs mounted macintosh hd on device root_device then you need to set cpuidset inside your Vagrantfile: vb.customize ["modifyvm", :id, "--cpuidset", "1","000206a7","02100800","1fbae3bf","bfebfbff"]


3. VIRTUALBOX SITE
    
https://www.virtualbox.org/manual/ch03.html#intro-macosxguests
    
3.1.1. Mac OS X guests

Starting with version 3.2, VirtualBox has experimental support for Mac OS X guests. This allows you to install and execute unmodified versions of Mac OS X on supported host hardware.

Whereas competing solutions perform modifications to the Mac OS X install DVDs (e.g. different boot loader and replaced files), VirtualBox is the first product to provide the modern PC architecture expected by OS X without requiring any "hacks".

You should be aware of a number of important issues before attempting to install a Mac OS X guest:

Mac OS X is commercial, licensed software and contains both license and technical restrictions that limit its use to certain hardware and usage scenarios. It is important that you understand and obey these restrictions.

In particular, for most versions of Mac OS X, Apple prohibits installing them on non-Apple hardware.

These license restrictions are also enforced on a technical level. Mac OS X verifies whether it is running on Apple hardware, and most DVDs that that come with Apple hardware even check for an exact model. These restrictions are not circumvented by VirtualBox and continue to apply.

Only CPUs known and tested by Apple are supported. As a result, if your Intel CPU is newer than the build of Mac OS X, or if you have a non-Intel CPU, it will most likely panic during bootup with an "Unsupported CPU" exception. It is generally best to use the Mac OS X DVD that came with your Apple hardware.

The Mac OS X installer expects the harddisk to be partitioned so when it does not offer a selection, you have to launch the Disk Utility from the "Tools" menu and partition the hard disk. Then close the Disk Utility and proceed with the installation.

In addition, as Mac OS X support in VirtualBox is currently still experimental, please refer also to Chapter 14, Known limitations.


https://www.virtualbox.org/manual/ch14.html

Mac OS X guests:

Mac OS X guests can only run on a certain host hardware. For details about license and host hardware limitations, please see Section 3.1.1, “Mac OS X guests” and check the Apple software license conditions.

VirtualBox does not provide Guest Additions for Mac OS X at this time.

The graphics resolution currently defaults to 1024x768 as Mac OS X falls back to the built-in EFI display support. See Section 3.12.1, “Video modes in EFI” for more information on how to change EFI video modes.

Mac OS X guests only work with one CPU assigned to the VM. Support for SMP will be provided in a future release.

Depending on your system and version of Mac OS X, you might experience guest hangs after some time. This can be fixed by turning off energy saving (set timeout to "Never") in the system preferences.

By default, the VirtualBox EFI enables debug output of the Mac OS X kernel to help you diagnose boot problems. Note that there is a lot of output and not all errors are fatal (they would also show on your physical Mac). You can turn off these messages by issuing this command:

VBoxManage setextradata "VM name" "VBoxInternal2/EfiBootArgs" "  "
To revert to the previous behavior, use:

VBoxManage setextradata "VM name" "VBoxInternal2/EfiBootArgs" ""
It is currently not possible to start a Mac OS X guest in safe mode by specifying "-x" option in "VBoxInternal2/EfiBootArgs" extradata.



</entry>
<entry [Mon 2014:04:21 19:20:49 EST] FIXED ERROR: 'cannot execute binary file'>


PROBLEM

CAN'T EXECUTE perl ALTHOUGH EXECUTES FINE ON HOST

/agua/apps/perl/5.18.2/bin/perl ./agua --showlog 4
	
	bash: /agua/apps/perl/5.18.2/bin/perl: cannot execute binary file


SOLUTION

INSTALL LINUX COMPAT




	
</entry>
<entry [Mon 2014:04:21 19:08:41 EST] OPEN PORTS ON VM>

SHOULD BE JUST AS IN UBUNTU MACHINE, NO NEED TO OPEN PORTS UNLESS BLOCKED

CHECK PORT IS OPEN

telnet localhost 5672


PORT FORWARDING IS TO SUBSCRIBE TO PORTS ON THE HOST:

 config.vm.network :forwarded_port, guest: 80, host: 8081

	
</entry>
<entry [Fri 2014:04:04 05:32:34 EST] GET HOST IP ON VM>

netstat -rn | grep "^0.0.0.0 " | cut -d " " -f10

	10.0.2.2	


</entry>
<entry [Mon 2014:03:31 11:38:03 EST] FIXED ERROR: "The box 'centos-6.4-guest-4.3.2' could not be found">


PROBLEM

vagrant up
	Bringing machine 'default' up with 'virtualbox' provider...
	There are errors in the configuration of this machine. Please fix
	the following errors and try again:
	
	vm:
	* The box 'centos-6.4-guest-4.3.2' could not be found.

	
SOLUTION

USE ROOT

sudo su
vagrantup

	OK
	
</entry>
<entry [Mon 2014:03:31 11:36:22 EST] DOWNLOADED centos 6.5 GUEST ADDITIONS 4.3.2>

http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20131103.box


</entry>
<entry [Tue 2014:03:18 12:46:58 EST] INSTALLED UBUNTU 14.04 TRUSTY TAHR BOX>

vagrant box add ubuntu-14.04-box https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box


	
</entry>
<entry [Thu 2014:03:13 14:37:39 EST] FIXED VIRTUALBOX: 'guru meditation'>

PROBLEM

VIRTUALBOX HANGS WITH 'guru meditation' STATE


SOLUTION

VBoxManage controlvm < ID > 

vagrant destroy

kill -9 < process ids >

	
</entry>
<entry [Fri 2014:03:07 14:04:54 EST] INSTALLED VAGRANT WITH KAIXIONG (CORNELL)>
	
1. INSTALL VIRTUALBOX

sudo apt-get install virtualbox


2. INSTALL VAGRANT VERSION 1.4

wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.4.0_x86_64.deb
cd ~/software/vagrant
dpkg -i vagrant_1.4.0_x86_64.deb


3. INITIALIZE VM

vagrant init


4. DOWNLOAD BOX

vagrant box add centos64_x64 http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-i386-v20130731.box

#/home/stuarty/centos64_x64.box


5. ADD THE BOXNAME TO Vagrantfile

emacs -nw Vagrantfile

	Vagrant::Config.run do |config|
		config.vm.box = "centos64_x64"
	end


</entry>
<entry [Mon 2014:01:20 17:46:54 EST] ADDED ANNAI CENTOS 6.4 BOX TO DEV SERVER>
	
vagrant box add centos64_x64 /home/stuarty/centos64_x64.box
	
	
</entry>
<entry [Mon 2014:01:20 17:19:32 EST] ADD ANNAI CENTOS 6.4 BOX>

ADD BOX
vagrant box add annai-centos64_x64 /home/syoung/software/annai/packages/vagrant/centos64_x64.box


LAUNCH VM
cd /home/syoung/software/annai/packages/genetorrent


ON HOST
ln -s /home/syoung/software/virtualbox/VBoxGuestAdditions_4.3.2.iso /home/syoung/software/annai/packages/vagrant/centos


ON VM
mount -t iso9660 /vagrant/VBoxGuestAdditions_4.3.2.iso -o loop /mnt

	
</entry>
<entry [Sun 2013:12:22 09:59:57 EST] BOOT VM TO GUI/DESKTOP>

http://stackoverflow.com/questions/18878117/using-vagrant-to-run-virtual-machines-with-desktop-environment

I just got this working with basically three steps. The advice from askubuntu.com didn't quite work for me, so try this simplified version:

Get a basic Ubuntu image working. You should be able to boot it and vagrant ssh.
Next, enable the VirtualBox display, which is off by default. Halt the VM and uncomment these lines in Vagrantfile:
config.vm.provider :virtualbox do |vb|
  vb.gui = true
end
Boot the VM and observe the new display window. Now you just need to install and start xfce4. Use vagrant ssh and:
sudo apt-get xfce4
sudo startxfce4&
That's it, you should be landed in a xfce4 session.


	
</entry>
<entry [Sat 2013:12:14 21:30:46 EST] FIXED: VAGRANT UP FAILS ON CENTOS>

PROBLEM

ssh KEEPS TRYING TO CONNECT AT 'Trying' GUEST OPERATING SYSTEM STAGE:

	DEBUG guest: Trying: suse


SOLUTION

1. INSTALL VAGRANT LATEST VERSION (1.4)



2. DESTROY VM BUILT WITH OLD VERSION (1.3.2)

cd /data2/vagrant/centos
vagrant destroy
rm -fr .vagrant

3. RE-UP NEW VM

cd /data2/vagrant/centos
vagrant up -provision
	OK

4. CONNECT TO NEW VM

vagrant ssh

	OK

	
</entry>
<entry [Sat 2013:12:14 21:00:47 EST] DEFAULT VIRTUALBOX GUEST ADDITIONS .iso LOCATION>

vagrant up
	
	...
	Default Guest Additions ISO:     /usr/share/virtualbox/VBoxGuestAdditions.iso

	
</entry>
<entry [Thu 2013:12:12 15:33:30 EST] FIXED ERROR: 'invalid resource type file_line'>
	
PROBLEM

WHEN RUN site.pp TO INSTALL BASE PACKAGES (EMACS, etc) AND LINKS TO .bash_profile, etc. ON CENTOS VM:

puppet apply /home/vagrant/notes/backup/puppet/manifests/site.pp

... AND IT COMES TO THE file_line COMMAND TO INSERT A LINE:

	Notice: Scope(Bash::Copybash[username]): copyBash    DOING copy_vagrant_bash_profile
	Notice: Scope(Bash::Copybash[username]): copyBash    DOING insert_vagrant_bashrc
	Error: Puppet::Parser::AST::Resource failed with error ArgumentError: Invalid resource type file_line at /home/vagrant/notes/backup/puppet/manifests/classes/bash.pp:29 on node vagrant-centos.example.com
	Error: Puppet::Parser::AST::Resource failed with error ArgumentError: Invalid resource type file_line at /home/vagrant/notes/backup/puppet/manifests/classes/bash.pp:29 on node vagrant-centos.example.com


SOLUTION




</entry>
<entry [Sun 2013:12:08 13:12:41 EST] CREATE OSX BOX WITH packer>

https://github.com/timsutton/osx-vm-templates

http://grahamgilbert.com/blog/2013/08/23/creating-an-os-x-base-box-for-vagrant-with-packer/



SEE [Wed 2013:12:04 06:00:51 EST] INSTALL packer

1. DOWNLOAD Maverick AND CREATE IMAGE (DMG) ON OSX (REQUIRES hdiutil)
(Extract a Packer compatible image from the OSX installer)

git clone https://github.com/timsutton/osx-vm-templates
cd osx-vm-templates
sudo prepare_iso/prepare_iso.sh "Install-Maverick.app" out


2. TRANSFER DMG TO UBUNTU AND CONVERT TO IMG

/data2/software/vagrant/osx/OSX_InstallESD_10.9_13A603.dmg

apt-get install dmg2img

cd /data2/software/vagrant/osx
dmg2img OSX_InstallESD_10.9_13A603.dmg 

	dmg2img v1.6.2 is derived from dmg2iso by vu1tur (to@vu1tur.eu.org)
	
	OSX_InstallESD_10.9_13A603.dmg --> OSX_InstallESD_10.9_13A603.img
	
	reading property list, 1366236 bytes from address 5312953284 ...
	
	decompressing:
	opening partition 0 ...             100.00%  ok
	opening partition 1 ...             100.00%  ok
	opening partition 2 ...             100.00%  ok
	opening partition 3 ...             100.00%  ok
	
	Archive successfully decompressed as OSX_InstallESD_10.9_13A603.img
	
	You should be able to mount the image [as root] by:
	
		modprobe hfsplus
		mount -t hfsplus -o loop OSX_InstallESD_10.9_13A603.img /mnt

3. GET MD5SUM FOR IMAGE

cd /data2/software/vagrant/osx
md5sum OSX_InstallESD_10.9_13A603.img 

	88011729d8ce87a19fc94cb141a65c3b  OSX_InstallESD_10.9_13A603.img

cd /data2/software/vagrant/osx
modprobe hfsplus
mount -t hfsplus -o loop OSX_InstallESD_10.9_13A603.img /mnt2

	

3. MOVE OUT OLD VMWARE template.json:

mkdir -p /data2/software/vagrant/osx/osx-vm-templates/packer/vmware
cd /data2/software/vagrant/osx/osx-vm-templates/packer/vmware
cp ../template.* .


4. DOWNLOAD VIRTUALBOX template.json

mkdir -p /data2/software/vagrant/osx/osx-vm-templates/packer/virtualbox

COPY

https://github.com/riywo/packer-example/blob/master/template.json


5. EDIT packer/template.json

emacs -nw /data2/software/vagrant/osx/osx-vm-templates/packer/virtualbox/template.json

CHANGE LINES: 

    "iso_checksum": "88011729d8ce87a19fc94cb141a65c3b",
	"iso_checksum_type":"md5", 
    "iso_url": "file:////data2/software/vagrant/osx/OSX_InstallESD_10.9_13A\
603.img",
 
TO CREATE:
<!--
{
  "provisioners": [
    {
      "type": "shell",
      "scripts": [
        "../../scripts/vagrant.sh",
        "../../scripts/virtualbox.sh",
        "../../scripts/xcode-cli-tools.sh"
      ],
      "override": {
        "virtualbox": {
          "execute_command": "echo 'vagrant'|sudo -S sh '{{.Path}}'"
        }
      }
    }
  ],
  "builders": [
    {
      "type": "virtualbox",
      "boot_command": [
        "<esc><esc><enter><wait>",
        "/install/vmlinuz noapic preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg <wait>",
        "debian-installer=en_US auto locale=en_US kbd-chooser/method=us <wait>",
        "hostname=vagrant <wait>",
        "fb=false debconf/frontend=noninteractive <wait>",
        "keyboard-configuration/modelcode=SKIP keyboard-configuration/layout=USA keyboard-configuration/variant=USA console-setup/ask_detect=false <wait>",
        "initrd=/install/initrd.gz -- <enter><wait>"
      ],
      "boot_wait": "4s",
      "disk_size": 10140,
      "guest_os_type": "Ubuntu_64",
      "http_directory": "http",

      "iso_checksum": "4e109fad38a49e85c50ba36baf8312ae",
      "iso_checksum_type":"md5", 
      "iso_url": "file:////data2/software/vagrant/osx/OSX_InstallESD_10.9_13A603.dmg",

     "ssh_username": "vagrant",
      "ssh_password": "vagrant",
      "ssh_port": 22,
      "ssh_wait_timeout": "10000s",
      "shutdown_command": "echo 'shutdown -P now' > shutdown.sh; echo 'vagrant'|sudo -S sh 'shutdown.sh'",
      "guest_additions_path": "VBoxGuestAdditions_{{.Version}}.iso",
      "virtualbox_version_file": ".vbox_version",
      "vboxmanage": [
        [
          "modifyvm",
          "{{.Name}}",
          "--memory",
          "512"
        ],
        [
          "modifyvm",
          "{{.Name}}",
          "--cpus",
          "4"
        ]
      ]
    }
  ],
  "post-processors": ["vagrant"]
}
-->
 
6. CREATE virtualbox.sh SCRIPT

https://github.com/riywo/packer-example/blob/master/scripts/virtualbox.sh

<!--	
	# Without libdbus virtualbox would not start automatically after compile
	apt-get -y install --no-install-recommends libdbus-1-3
	
	# The netboot installs the VirtualBox support (old) so we have to remove it
	/etc/init.d/virtualbox-ose-guest-utils stop
	rmmod vboxguest
	aptitude -y purge virtualbox-ose-guest-x11 virtualbox-ose-guest-dkms virtualbox-ose-guest-utils
	aptitude -y install dkms
	
	# Install the VirtualBox guest additions
	VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
	VBOX_ISO=VBoxGuestAdditions_$VBOX_VERSION.iso
	mount -o loop $VBOX_ISO /mnt
	yes|sh /mnt/VBoxLinuxAdditions.run
	umount /mnt
	
	#Cleanup VirtualBox
	rm $VBOX_ISO\
-->

6. REMOVE SCRIPTS FROM LIST OF PROVISIONERS

	"provisioners": [
	  {
		"destination": "/private/tmp/kcpassword",
		"source": "../scripts/support/kcpassword",
		"type": "file"
	  },
	  {
		"execute_command": "chmod +x {{ .Path }}; sudo {{ .Vars }} {{ .Path }}",
		"scripts": [
		  "../scripts/vagrant.sh",
		  "../scripts/xcode-cli-tools.sh"
  #        "../scripts/chef-omnibus.sh",
  #        "../scripts/puppet.sh"
		],
		"type": "shell"
	  },



5. CREATE A NEW BOX

cd /data2/software/vagrant/osx/osx-vm-templates/packer

packer build template.json


    virtualbox: Download progress: 99%
==> virtualbox: Downloading or copying ISO
    virtualbox: Downloading or copying: file:///data2/software/vagrant/osx/OSX_InstallESD_10.9_13A603.dmg
==> virtualbox: Starting HTTP server on port 8456
==> virtualbox: Creating virtual machine...
==> virtualbox: Creating hard drive...
==> virtualbox: Error attaching ISO: VBoxManage error: VBoxManage: error: Could not get the storage format of the medium '/data2/software/vagrant/osx/OSX_InstallESD_10.9_13A603.dmg' (VERR_NOT_SUPPORTED)
==> virtualbox: VBoxManage: error: Details: code VBOX_E_IPRT_ERROR (0x80bb0005), component Medium, interface IMedium, callee nsISupports
==> virtualbox: VBoxManage: error: Context: "OpenMedium(Bstr(pszFilenameOrUuid).raw(), enmDevType, enmAccessMode, fForceNewUuidOnOpen, pMedium.asOutParam())" at line 178 of file VBoxManageDisk.cpp
==> virtualbox: VBoxManage: error: Invalid UUID or filename "/data2/software/vagrant/osx/OSX_InstallESD_10.9_13A603.dmg"
==> virtualbox: Unregistering and deleting virtual machine...
==> virtualbox: Deleting output directory...
Build 'virtualbox' errored: Error attaching ISO: VBoxManage error: VBoxManage: error: Could not get the storage format of the medium '/data2/software/vagrant/osx/OSX_InstallESD_10.9_13A603.dmg' (VERR_NOT_SUPPORTED)
VBoxManage: error: Details: code VBOX_E_IPRT_ERROR (0x80bb0005), component Medium, interface IMedium, callee nsISupports
VBoxManage: error: Context: "OpenMedium(Bstr(pszFilenameOrUuid).raw(), enmDevType, enmAccessMode, fForceNewUuidOnOpen, pMedium.asOutParam())" at line 178 of file VBoxManageDisk.cpp
VBoxManage: error: Invalid UUID or filename "/data2/software/vagrant/osx/OSX_InstallESD_10.9_13A603.dmg"

==> Some builds didn't complete successfully and had errors:
--> virtualbox: Error attaching ISO: VBoxManage error: VBoxManage: error: Could not get the storage format of the medium '/data2/software/vagrant/osx/OSX_InstallESD_10.9_13A603.dmg' (VERR_NOT_SUPPORTED)
VBoxManage: error: Details: code VBOX_E_IPRT_ERROR (0x80bb0005), component Medium, interface IMedium, callee nsISupports
VBoxManage: error: Context: "OpenMedium(Bstr(pszFilenameOrUuid).raw(), enmDevType, enmAccessMode, fForceNewUuidOnOpen, pMedium.asOutParam())" at line 178 of file VBoxManageDisk.cpp
VBoxManage: error: Invalid UUID or filename "/data2/software/vagrant/osx/OSX_InstallESD_10.9_13A603.dmg"

==> Builds finished but no artifacts were created.



ADD OSX BOX TO VAGRANT

vagrant box add osx packer_vmware_vmware.box


USE VAGRANT TO START OSX VM


git clone https://github.com/hiremaga/spike-vagrant-osx
Start vagrant using this repo's Vagrantfile

cd spike-vagrant-osx
vagrant up --provider vmware_fusion
Run specs

bundle install
bundle exec rspec
If everything is setup correctly the output should be:

→ bundle exec rspec

Command "uname"
  should return stdout "Darwin"

  

OR

Using the VM in Vagrant

We’re going to make a quick Vagrant configuration using your newly built box.

$ mkdir -p ~/Desktop/osx_test
$ cd ~/Desktop/osx_test
$ vagrant init osx
You’re probaly going to want a GUI when it boots, so open up ~/Desktop/osx_test/Vagrantfile in your text editor of choice and find the next section.

# config.vm.provider :virtualbox do |vb|
#   # Don't boot with headless mode
#   vb.gui = true
#
#   # Use VBoxManage to customize the VM. For example to change memory:
#   vb.customize ["modifyvm", :id, "--memory", "1024"]
# end
And change it to read

config.vm.provider :vmware_fusion do |v|
#   # Don't boot with headless mode
   v.gui = true
#
#   # Use VBoxManage to customize the VM. For example to change memory:
#   vb.customize ["modifyvm", :id, "--memory", "1024"]
end
Unfortunately there isn’t any support for OS X in the official Vagrant release (yet), but good old Tim Sutton has sorted that out for us. We’re going to clone his repository, switch to the branch with his changes and copy the needed files into the main Vagrant installation. Hopefully his changes will be merged into a future of Vagrant, but for now:

$ cd ~/src/Others
$ git clone https://github.com/timsutton/vagrant.git timsutton-vagrant
$ cd ~/src/Others/timsutton-vagrant
$ git checkout guest-plugin-osx
$ sudo cp -R ~/src/Others/timsutton-vagrant/plugins/guests/osx /Applications/Vagrant/embedded/gems/gems/vagrant-1.2.7/plugins/guests/osx
We’re ready to boot the thing now – make it so, number one.

$ cd ~/Desktop/osx_test
$ vagrant up --provider vmware_fusion
You should see VMWare Fusion open if it’s not already running and your VM boot after a little while.





TROUBLESHOOTING
---------------

1. GUEST OS TYPE

PROBLEM

packer build template.json

	==> virtualbox: Error creating VM: VBoxManage error: VBoxManage: error: Guest OS type 'DARWIN_64BITS' is invalid


SOLUTION

REMOVE LINE:

      "guest_os_type": "DARWIN_64BITS",

	
2. STORAGE FORMAT OF MEDIUM

PROBLEM

packer build template.json

	VBoxManage error: VBoxManage: error: Could not get the storage format of the medium '/data2/software/vagrant/osx/OSX_InstallESD_10.9_13A603.dmg' (VERR_NOT_SUPPORTED)


SOLUTION




NOTES
-----

https://github.com/hiremaga/spike-vagrant-osx

Creating an OSX box for Vagrant with Packer

An experiment with getting an OSX guest running with Vagrant so this might eventually be used to test Sprout.

Dependencies

Vmware Fusion
Packer
Vagrant 1.3+
Vagrant's Vmware Fusion Provider
Tim Sutton's osx-vm-templates for building an OSX box with Packer
ServerSpec


Clone Tim Sutton's osx-vm-templates

git clone https://github.com/timsutton/osx-vm-templates

Extract a Packer compatible image from the OS X Mountain Lion installer

Caveat: The installer can't to be downloadable on newer Macbook Airs running OS X 10.8.4 (12E3067)

cd osx-vm-templates
sudo prepare_iso/prepare_iso.sh "/Applications/Install OS X Mountain Lion.app" out

Take note of the checksum of the generated image and its full path from the output of this command, you'll need this in a moment.


Edit the Packer template packer/template.json

Change iso_checksum to the checksum of the image generated earlier
Change iso_url to the absolute path of the image generated earlier, keep the file:/// prefix.
Remove the chef-omnibus.sh and puppet.sh scripts from the list of provisioners
Don't forget to save the file!
Create a new box with Packer

cd packer
packer template.json
Add the box generated earlier to Vagrant

vagrant box add osx packer_vmware_vmware.box
Starting the OSX guest with Vagrant

Clone this repo

git clone https://github.com/hiremaga/spike-vagrant-osx
Start vagrant using this repo's Vagrantfile

cd spike-vagrant-osx
vagrant up --provider vmware_fusion
Run specs

bundle install
bundle exec rspec
If everything is setup correctly the output should be:

→ bundle exec rspec

Command "uname"
  should return stdout "Darwin"

  
  
	
</entry>
<entry [Sat 2013:12:07 16:56:29 EST] CREATE NEW UBUNTU BOX WITH GUEST ADDITIONS 4.3.2>

http://docs-v1.vagrantup.com/v1/docs/base_boxes.html

1. FOLLOW INSTRUCTIONS AT ABOVE URL

SSH PORTS, SUDO FOR ADMIN USERS, INSTALL PUPPET, ETC.

DEFAULT PRIVATE KEY
COPY VAGRANT 'INSECURE' PUBLIC CERT TO ~/.ssh/authorized_keys (INSECURE PRIVATE KEY IS USED BY DEFAULT BY VAGRANT)

CUSTOM PRIVATE KEY
ADD PUBLIC CERT OF CUSTOM KEY PAIR. Users of your box can then specify the private key you created by setting config.ssh.private_key_path.

SPEED UP SSH CONNECTION
In order to keep SSH access speedy even when your host computer can't access the internet, disable DNS lookup of clients connecting to the server

EDIT FILE

/etc/ssh/sshd_config

ADD LINE

UseDNS no


2. CREATE NEW BOX

GET VIRTUALBOX ID FOR RUNNING VM YOU WANT TO BOX UP

VBoxManage list vms

	"test_default_1385014853" {df476bff-cca4-4d83-a96c-536894a744e6}
	"centos_default_1386244996" {85039552-4db9-4c1b-a48d-c1b4bec1ca82}
	"centos2_default_1386441626" {fe9106e7-9b98-4e0b-9375-f78eadf7c034}
	"ubuntu2_default_1386463832" {c19687ce-a642-49fb-badf-9d0fe9c330db}


3. CREATE PACKAGE

vagrant package --base ubuntu2_default_1386463832

NB: IF CREATED A Vagrantfile
vagrant package --base my_base_box --vagrantfile Vagrantfile 



$ vagrant box add my_box package.box
$ mkdir test_environment
$ cd test_environment
$ vagrant init my_box
$ vagrant up
$ vagrant ssh


4. ADD BOX TO VAGRANT

vagrant box add ubuntu-13.10-guest-4.3.2 /home/syoung/software/vagrant/ubuntu-13.10-guest-4.3.2.box

CONFIRM ADDITION

vagrant box list

	centos-6.4-guest-4.3.2   (virtualbox)
	centos-6.4-x86-64        (virtualbox)
	ubuntu-13.10-guest-4.3.2 (virtualbox)
	ubuntu-13.10-i386        (virtualbox)


NOTES
-----

http://docs.vagrantup.com/v2/cli/package.html

PACKAGE
Command: vagrant package

This packages a currently running VirtualBox environment into a re-usable box. This command cannot be used with any other provider. A future version of Vagrant will address packaging boxes for other providers. Until then, they must be made by hand.

OPTIONS

--base NAME - Instead of packaging a VirtualBox machine that Vagrant manages, this will package a VirtualBox machine that VirtualBox manages. NAME should be the name or UUID of the machine from the VirtualBox GUI.

--output NAME - The resulting package will be saved as NAME. By default, it will be saved as package.box.

--include x,y,z - Additional files will be packaged with the box. These can be used by a packaged Vagrantfile (documented below) to perform additional tasks.

--vagrantfile FILE - Packages a Vagrantfile with the box, that is loaded as part of the Vagrantfile load order when the resulting box is used.

A common misconception is that the --vagrantfile option will package a Vagrantfile that is used when vagrant init is used with this box. This is not the case. Instead, a Vagrantfile is loaded and read as part of the Vagrant load process when the box is used. For more information, read about the Vagrantfile load order.

	
</entry>
<entry [Sat 2013:12:07 12:31:16 EST] FIXED: VAGRANT cgi-bin DIR PERMISSIONS PROBLEM>

PROBLEM

CAN'T CHANGE PERMISSIONS IN cgi-dir

cd /var/www/cgi-bin/aguadev
chown root:root agua*
ll

	-rwxr-xr-x 1 vagrant vagrant 9.0K Sep 12 04:28 agua.cgi
	-rwxr-xr-x 1 vagrant vagrant 4.2K Sep 12 04:28 agua.pl



SOLUTION

Disable SELinux in the guest, it's useless to a development env

EDIT FILE

/etc/selinux/config

Change SELINUX to disabled

SELINUX=disabled

Reboot the vagrant box => vagrant reload

See if #1 with #2 helps.

	
</entry>
<entry [Sat 2013:12:07 09:59:43 EST] FIXED: CENTOS APACHE NOT PORT FORWARDING>

http://wiki.centos.org/HowTos/Network/IPTables

PROBLEM

HAVE CORRECTLY CONFIGURED PORT FORWARDING IN Vagrantfile:

  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 8080, host: 8081


WORKS ON UBUNTU BUT CAN'T ACCESS ON CENTOS. THIS COMMAND HANGS IN BROWSER ON HOST:

localhost:8080


AND THE APACHE LOGS ON THE VM SHOW NO ACCESS:

tail -f /var/log/httpd/*


DIAGNOSIS

LIST IPTABLES RULES BY NUMBER:

service iptables status

	Table: filter
	Chain INPUT (policy ACCEPT)
	num  target     prot opt source               destination         
	1    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED 
	2    ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           
	3    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           
	4    ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           state NEW tcp dpt:22 
	5    REJECT     all  --  0.0.0.0/0            0.0.0.0/0           reject-with icmp-host-prohibited 
	
	Chain FORWARD (policy ACCEPT)
	num  target     prot opt source               destination         
	1    REJECT     all  --  0.0.0.0/0            0.0.0.0/0           reject-with icmp-host-prohibited 
	
	Chain OUTPUT (policy ACCEPT)
	num  target     prot opt source               destination


CHECK SELINUX

cat /etc/sysconfig/selinux
	# This file controls the state of SELinux on the system.
	# SELINUX= can take one of these three values:
	#       enforcing - SELinux security policy is enforced.
	#       permissive - SELinux prints warnings instead of enforcing.
	#       disabled - SELinux is fully disabled.
	SELINUX=permissive
	# SELINUXTYPE= type of policy in use. Possible values are:
	#       targeted - Only targeted network daemons are protected.
	#       strict - Full SELinux protection.
	SELINUXTYPE=targeted
	
	# SETLOCALDEFS= Check local definition changes
	SETLOCALDEFS=0


CHECK LOOPBACK

POSSIBLY APACHE CONFIG ON VM BINDING TO 127.0.0.1, which is loopback

IF SO, CHANGE CONFIG TO BIND TO 0.0.0.0 so that all interfaces can access it.

Some built-in app servers such as Django's development servers and some Ruby servers default to 127.0.0.1 by default so this is something to watch out for.

Other than that, what Steve said holds true: Make sure it works from within the VM and try some other simple servers to try and figure out if it is a configuration problem.

0.0.0.0 binds to all IP addresses. Any other address binds to that particular interface.

Binding to 0.0.0.0 means to listen to all interfaces.
Binding to 127.0.0.1 means to listen to the loopback interface.


SOLUTION

ON THE VM:

LIST IPTABLES

service iptables status

	Table: filter
	Chain INPUT (policy ACCEPT)
	num  target     prot opt source               destination         
	1    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED 
	2    ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           
	3    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           
	4    ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           state NEW tcp dpt:22 
	5    REJECT     all  --  0.0.0.0/0            0.0.0.0/0           reject-with icmp-host-prohibited 
	
	Chain FORWARD (policy ACCEPT)
	num  target     prot opt source               destination         
	1    REJECT     all  --  0.0.0.0/0            0.0.0.0/0           reject-with icmp-host-prohibited 
	
	Chain OUTPUT (policy ACCEPT)
	num  target     prot opt source               destination


DELETING IPTABLES RULES:

iptables -D INPUT 5


FLUSH RULES

iptables -F

Allow SSH connections on tcp port 22

iptables -A INPUT -p tcp --dport 22 -j ACCEPT
Set default policies for INPUT, FORWARD and OUTPUT chains

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT
Set access for localhost

iptables -A INPUT -i lo -j ACCEPT
Accept packets belonging to established and related connections

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
Save settings

/sbin/service iptables save

List modified rules

iptables -L -v

ON THE HOST:

curl localhost:8080

OR IN BROWSER:

localhost:8080



</entry>
<entry [Thu 2013:12:05 04:50:09 EST] CREATE NEW CENTOS BOX WITH UPDATED GUEST ADDITIONS>

http://docs-v1.vagrantup.com/v1/docs/base_boxes.html

1. GET LIST OF VMS

VBoxManage list vms

	"test_default_1385014853" {df476bff-cca4-4d83-a96c-536894a744e6}
	"test2_default_1385679353" {40314e0e-d212-4192-8783-2413c756c021}
	"centos_default_1386244996" {85039552-4db9-4c1b-a48d-c1b4bec1ca82}


2. CREATE NEW BOX

vagrant package --base centos_default_1386244996

	[centos_default_1386244996] Attempting graceful shutdown of VM...
	[centos_default_1386244996] Clearing any previously set forwarded ports...
	[centos_default_1386244996] Creating temporary directory for export...
	[centos_default_1386244996] Exporting VM...
	[centos_default_1386244996] Compressing package to: /data2/vagrant/centos/package.box

CREATED package.box FILE

	-rw-r--r-- 1 root   root   665M Dec  5 04:55 package.box


3. MOVE NEW BOX TO software/vagrant

mv package.box /home/syoung/software/vagrant/centos-6.4-guest-4.3.2.box


4. ADD BOX TO VAGRANT

vagrant box add centos-6.4-guest-4.3.2 /home/syoung/software/vagrant/centos-6.4-guest-4.3.2.box

CONFIRM ADDITION

vagrant box list
	centos-6.4-guest-4.3.2 (virtualbox)
	centos-6.4-x86-64      (virtualbox)
	ubuntu-13.10-i386      (virtualbox)


5. VERIFY NEW BOX

mkdir -p /data2/vagrant/centos2
cd /data2/vagrant/centos2
vagrant init 

EDIT VAGRANT FILE

	config.vm.box = "centos-6.4-guest-4.3.2"

vagrant up
vagrant ssh



</entry>
<entry [Thu 2013:12:05 04:25:32 EST] UPDATE GUEST ADDITIONS ON centos VM>

http://www.if-not-true-then-false.com/2010/install-virtualbox-guest-additions-on-fedora-centos-red-hat-rhel/


1. LIST INSTALLED PACKAGES

yum list installed | grep virtualbox

	NONE


#REMOVE OLD VIRTUALBOX GUEST ADDITIONS
#
#apt-get remove virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
#


2. UPDATE KERNEL

ON VAGRANT VM
yum update kernel*

ON HOST
vagrant halt
vagrant up


3. INSTALL epel DEPENDENCY

## CentOS 6 and Red Hat (RHEL) 6 ##
rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

	OK
 
## CentOS 5 and Red Hat (RHEL) 5 ##
rpm -Uvh http://dl.fedoraproject.org/pub/epel/5/i386/epel-release-5-4.noarch.rpm


4. INSTALL OTHER DEPENDENCIES

yum install gcc kernel-devel kernel-headers dkms make bzip2 perl


5. SET KERNEL ENVIRONMENT VARIABLES

## Current running kernel on Fedora, CentOS 6 and Red Hat (RHEL) 6 ##
KERN_DIR=/usr/src/kernels/`uname -r`
 
## Current running kernel on CentOS 5 and Red Hat (RHEL) 5 ##
KERN_DIR=/usr/src/kernels/`uname -r`-`uname -m`
 
## Fedora example ##
KERN_DIR=/usr/src/kernels/2.6.33.5-124.fc13.i686
 
## CentOS and Red Hat (RHEL) example ##
KERN_DIR=/usr/src/kernels/2.6.18-194.11.1.el5-x86_64
 
## Export KERN_DIR ##
export KERN_DIR


6. INSTALL GUEST ADDITIONS

ON HOST, LINK TO VIRTUALBOX 4.3.2 GUEST ADDITIONS *.iso IN SHARED FOLDER

ln -s /home/syoung/software/virtualbox/VBoxGuestAdditions_4.3.2.iso /data2/vagrant/centos


ON VAGRANT VM, MOUNT *.iso FILE

mount -t iso9660 /vagrant/VBoxGuestAdditions_4.3.2.iso -o loop /mnt


INSTALL GUEST ADDITIONS

/mnt/VBoxLinuxAdditions.run


CONFIRM NEW VERSION ON VM

ll /opt
	drwxr-xr-x 2 root root 4096 Dec  5 12:48 VBoxGuestAdditions-4.2.16
	drwxr-xr-x 9 root root 4096 Dec  5 12:49 VBoxGuestAdditions-4.3.2


</entry>
<entry [Thu 2013:12:05 04:06:49 EST] CURRENT vagrant-centos VAGRANTFILE>

# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.

  config.vm.box = "centos-6.4-x86-64"
#  config.vm.box = "base"

  config.vm.hostname = "vagrant-centos.example.com"


#  config.vm.provision :puppet do |puppet|
#	#puppet.module_path = %w(/etc/puppet/modules), 
#	puppet.manifests_path = %w(/etc/puppet/manifests)
#
#    # fix `fqdn_rand` error
#    puppet.facter = { 'fqdn' => config.vm.hostname }
#  end
  
  # SHARED FILESYSTEMS
  #config.vm.synced_folder "/mnt", "/mnt", create: true
  #config.vm.synced_folder "/mnt/repos/private/syoung/notes", "/home/vagrant/notes",
  #owner: "root", group: "root"
  config.vm.synced_folder "../../../home/syoung/notes", "/home/vagrant/notes", mount_options: ["dmode=755", "fmode=755"]

  config.vm.synced_folder "../../../aguadev", "/aguadev", mount_options: ["dmode=755", "fmode=755"]


  #{:extra => 'dmode=777,fmode=777'}
  #config.vm.synced_folder "testfolder", "/home/vagrant/testfolder",
	#{:extra => 'dmode=777,fmode=777'}

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  # config.vm.box_url = "http://domain.com/path/to/above.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.

  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 8080, host: 8081

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network :private_network, ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network :public_network

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
   config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
   config.vm.provider :virtualbox do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:

     vb.customize ["modifyvm", :id, "--memory", "4096"]

   end
  
  # View the documentation for the provider you're using for more
  # information on available options.

  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  # You will need to create the manifests directory and a manifest in
  # the file base.pp in the manifests_path directory.
  #
  # An example Puppet manifest to provision the message of the day:
  #
  # # group { "puppet":
  # #   ensure => "present",
  # # }
  # #
  # # File { owner => 0, group => 0, mode => 0644 }
  # #
  # # file { '/etc/motd':
  # #   content => "Welcome to your Vagrant-built virtual machine!
  # #               Managed by Puppet.\n"
  # # }
  #
  # config.vm.provision :puppet do |puppet|
  #   puppet.manifests_path = "manifests"
  #   puppet.manifest_file  = "site.pp"
  # end

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
  # config.vm.provision :chef_solo do |chef|
  #   chef.cookbooks_path = "../my-recipes/cookbooks"
  #   chef.roles_path = "../my-recipes/roles"
  #   chef.data_bags_path = "../my-recipes/data_bags"
  #   chef.add_recipe "mysql"
  #   chef.add_role "web"
  #
  #   # You may also specify custom JSON attributes:
  #   chef.json = { :mysql_password => "foo" }
  # end

  # Enable provisioning with chef server, specifying the chef server URL,
  # and the path to the validation key (relative to this Vagrantfile).
  #
  # The Opscode Platform uses HTTPS. Substitute your organization for
  # ORGNAME in the URL and validation key.
  #
  # If you have your own Chef Server, use the appropriate URL, which may be
  # HTTP instead of HTTPS depending on your configuration. Also change the
  # validation key to validation.pem.
  #
  # config.vm.provision :chef_client do |chef|
  #   chef.chef_server_url = "https://api.opscode.com/organizations/ORGNAME"
  #   chef.validation_key_path = "ORGNAME-validator.pem"
  # end
  #
  # If you're using the Opscode platform, your validator client is
  # ORGNAME-validator, replacing ORGNAME with your organization name.
  #
  # If you have your own Chef Server, the default validation client name is
  # chef-validator, unless you changed the configuration.
  #
  #   chef.validation_client_name = "ORGNAME-validator"
end

	
</entry>
<entry [Thu 2013:12:05 04:00:25 EST] CREATED vagrant-centos VM>


1. CREATED DIRECTORY AND INITIALISED

mkdir -p /data2/vagrant/centos
cd /data2/vagrant/centos
vagrant init


2. LINK TO CENTRAL Vagrantfile

cd /data2/vagrant/centos
mv Vagrantfile Vagrantfile.orig
ln -s /home/syoung/notes/backup/vagrant/centos/Vagrantfile /data2/vagrant/centos/Vagrantfile


3. STARTUP AND CONNECT

vagrant up
vagrant ssh

	[default] Machine booted and ready!
	[default] The guest additions on this VM do not match the installed version of
	VirtualBox! In most cases this is fine, but in rare cases it can
	cause things such as shared folders to not work properly. If you see
	shared folder errors, please update the guest additions within the
	virtual machine and reload your VM.
	
	Guest Additions Version: 4.2.16
	VirtualBox Version: 4.3

4. CONFIRM /home/vagrant/notes SYNCED FOLDER ENTRY IN Vagrantfile

config.vm.synced_folder "../../../home/syoung/notes", "/home/vagrant/notes", mount_options: ["dmode=755", "fmode=755"]


5. VERIFY ACCESS TO SYNCED FOLDERS ON VAGRANT VM

vagrant up
vagrant ssh
ls /home/vagrant/notes

	OK


	
</entry>
<entry [Wed 2013:12:04 03:49:33 EST] AUTOMATICALLY UPGRADE PUPPET (INSTEAD OF BUILDING A NEW BOX)>

http://blog.doismellburning.co.uk/2013/01/19/upgrading-puppet-in-vagrant-boxes/

1. CREATE upgrade-puppet.sh IN VAGRANT BASE DIR

	- GET THE OS CODE NAME
	- ENABLE PUPPET LABS APT REPO
	- UPDATE apt-get INDEX
	- UPGRADE PUPPET

upgrade-puppet.sh

	#!/bin/bash
	
	apt-get install --yes lsb-release
	DISTRIB_CODENAME=$(lsb_release --codename --short)
	DEB="puppetlabs-release-${DISTRIB_CODENAME}.deb"
	DEB_PROVIDES="/etc/apt/sources.list.d/puppetlabs.list" # Assume that this file's existence means we have the Puppet Labs repo added
	
	if [ ! -e $DEB_PROVIDES ]
	then
		# Print statement useful for debugging, but automated runs of this will interpret any output as an error
		# print "Could not find $DEB_PROVIDES - fetching and installing $DEB"
		wget -q http://apt.puppetlabs.com/$DEB
		sudo dpkg -i $DEB
	fi
	sudo apt-get update
	sudo apt-get install --yes puppet


2. EDIT Vagrantfile

(NB: MUST BE BEFORE Puppet PROVISIONER)

ADD

config.vm.provision :shell, :path => "upgrade_puppet.sh"

	
</entry>
<entry [Wed 2013:12:04 03:39:30 EST] SSH FORWARDING WITH VAGRANT AWS>

http://www.benjaminoakes.com/2013/04/10/ssh-agent-forwarding-with-vagrant-aws/


we took some time to research how to get SSH agent forwarding working, which is valuable for us when remote pairing. We were getting stuck with errors like this:

Permission denied (publickey,gssapi-keyex,gssapi-with-mic).

It turns out that vagrant itself ignores anything but identity files, which was key to getting agent forwarding to work. This can be inspected using vagrant ssh-config

It turns out that lib/vagrant/util/ssh.rb can be modified like so:

--- a/lib/vagrant/util/ssh.rb
+++ b/lib/vagrant/util/ssh.rb
@@ -108,7 +108,7 @@ module Vagrant
         # IdentitiesOnly option. Also, we don't enable it in plain mode so
         # that SSH properly searches our identities and tries to do it itself.
         if !Platform.solaris? && !plain_mode
-          command_options += ["-o", "IdentitiesOnly=yes"]
+          command_options += ["-o", "IdentitiesOnly=no"]
         end
 
         # If we're not in plain mode, attach the private key path.


There’s a related change that can be made to make vagrant ssh-config match, but it seems to be cosmetic:

--- a/templates/commands/ssh_config/config.erb
+++ b/templates/commands/ssh_config/config.erb
@@ -6,7 +6,7 @@ Host <%= host_key %>
   StrictHostKeyChecking no
   PasswordAuthentication no
   IdentityFile "<%= private_key_path %>"
-  IdentitiesOnly yes
+  IdentitiesOnly no
   LogLevel FATAL
 <% if forward_agent -%>
   ForwardAgent yes
That was enough to get our SSH agent forwarding to work. These changes make sense in the context of AWS, but probably not in Vagrant at large. I’m tempted to make a pull request, but the above changes are a little half baked — and vagrant-aws still needs some fine tuning before the change can really be tested.


</entry>
<entry [Wed 2013:12:04 03:38:26 EST] VAGRANT AWS>

https://github.com/mitchellh/vagrant-aws

Install using standard Vagrant 1.1+ plugin installation methods. After installing, vagrant up and specify the aws provider. An example is shown below.

$ vagrant plugin install vagrant-aws
...
$ vagrant up --provider=aws
...
Of course prior to doing this, you'll need to obtain an AWS-compatible box file for Vagrant.

Quick Start

After installing the plugin (instructions above), the quickest way to get started is to actually use a dummy AWS box and specify all the details manually within a config.vm.provider block. So first, add the dummy box using any name you want:

$ vagrant box add dummy https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box
...
And then make a Vagrantfile that looks like the following, filling in your information where necessary.

Vagrant.configure("2") do |config|
  config.vm.box = "dummy"

  config.vm.provider :aws do |aws, override|
    aws.access_key_id = "YOUR KEY"
    aws.secret_access_key = "YOUR SECRET KEY"
    aws.keypair_name = "KEYPAIR NAME"

    aws.ami = "ami-7747d01e"

    override.ssh.username = "ubuntu"
    override.ssh.private_key_path = "PATH TO YOUR PRIVATE KEY"
  end
end
And then run vagrant up --provider=aws.

This will start an Ubuntu 12.04 instance in the us-east-1 region within your account. And assuming your SSH information was filled in properly within your Vagrantfile, SSH and provisioning will work as well.

Note that normally a lot of this boilerplate is encoded within the box file, but the box file used for the quick start, the "dummy" box, has no preconfigured defaults.

If you have issues with SSH connecting, make sure that the instances are being launched with a security group that allows SSH access.

Box Format

Every provider in Vagrant must introduce a custom box format. This provider introduces aws boxes. You can view an example box in the example_box/ directory. That directory also contains instructions on how to build a box.

The box format is basically just the required metadata.json file along with a Vagrantfile that does default settings for the provider-specific configuration for this provider.

Configuration

This provider exposes quite a few provider-specific configuration options:

access_key_id - The access key for accessing AWS
ami - The AMI id to boot, such as "ami-12345678"
availability_zone - The availability zone within the region to launch the instance. If nil, it will use the default set by Amazon.
instance_ready_timeout - The number of seconds to wait for the instance to become "ready" in AWS. Defaults to 120 seconds.
instance_type - The type of instance, such as "m1.small". The default value of this if not specified is "m1.small".
keypair_name - The name of the keypair to use to bootstrap AMIs which support it.
private_ip_address - The private IP address to assign to an instance within a VPC
region - The region to start the instance in, such as "us-east-1"
secret_access_key - The secret access key for accessing AWS
security_groups - An array of security groups for the instance. If this instance will be launched in VPC, this must be a list of security group IDs.
iam_instance_profile_arn - The Amazon resource name (ARN) of the IAM Instance Profile to associate with the instance
iam_instance_profile_name - The name of the IAM Instance Profile to associate with the instance
subnet_id - The subnet to boot the instance into, for VPC.
tags - A hash of tags to set on the machine.
use_iam_profile - If true, will use IAM profiles for credentials.
These can be set like typical provider-specific configuration:

Vagrant.configure("2") do |config|
  # ... other stuff

  config.vm.provider :aws do |aws|
    aws.access_key_id = "foo"
    aws.secret_access_key = "bar"
  end
end
In addition to the above top-level configs, you can use the region_config method to specify region-specific overrides within your Vagrantfile. Note that the top-level region config must always be specified to choose which region you want to actually use, however. This looks like this:

Vagrant.configure("2") do |config|
  # ... other stuff

  config.vm.provider :aws do |aws|
    aws.access_key_id = "foo"
    aws.secret_access_key = "bar"
    aws.region = "us-east-1"

    # Simple region config
    aws.region_config "us-east-1", :ami => "ami-12345678"

    # More comprehensive region config
    aws.region_config "us-west-2" do |region|
      region.ami = "ami-87654321"
      region.keypair_name = "company-west"
    end
  end
end
The region-specific configurations will override the top-level configurations when that region is used. They otherwise inherit the top-level configurations, as you would probably expect.

Networks

Networking features in the form of config.vm.network are not supported with vagrant-aws, currently. If any of these are specified, Vagrant will emit a warning, but will otherwise boot the AWS machine.

Synced Folders

There is minimal support for synced folders. Upon vagrant up, vagrant reload, and vagrant provision, the AWS provider will use rsync (if available) to uni-directionally sync the folder to the remote machine over SSH.

This is good enough for all built-in Vagrant provisioners (shell, chef, and puppet) to work!

Other Examples

Tags

To use tags, simply define a hash of key/value for the tags you want to associate to your instance, like:

Vagrant.configure("2") do |config|
  # ... other stuff

  config.vm.provider "aws" do |aws|
    aws.tags = {
      'Name' => 'Some Name',
      'Some Key' => 'Some Value'
    }
  end
end
User data

You can specify user data for the instance being booted.

Vagrant.configure("2") do |config|
  # ... other stuff

  config.vm.provider "aws" do |aws|
    # Option 1: a single string
    aws.user_data = "#!/bin/bash\necho 'got user data' > /tmp/user_data.log\necho"

    # Option 2: use a file
    aws.user_data = File.read("user_data.txt")
  end
end
Development

To work on the vagrant-aws plugin, clone this repository out, and use Bundler to get the dependencies:

$ bundle
Once you have the dependencies, verify the unit tests pass with rake:

$ bundle exec rake
If those pass, you're ready to start developing the plugin. You can test the plugin without installing it into your Vagrant environment by just creating a Vagrantfile in the top level of this directory (it is gitignored) and add the following line to your Vagrantfile

Vagrant.require_plugin "vagrant-aws"
Use bundler to execute Vagrant:

$ bundle exec vagrant up --provider=aws
	
</entry>
<entry [Tue 2013:12:03 05:41:57 EST] VAGRANT DEFAULT INSECURE KEYPAIR>

https://github.com/mitchellh/vagrant/tree/master/keys/

Insecure Keypair

These keys are the "insecure" public/private keypair we offer to base box creators for use in their base boxes so that vagrant installations can automatically SSH into the boxes.

FIND OUT THE LOCATION OF THE IDENTITY FILE:

vagrant ssh-config

	Host default
	  HostName 127.0.0.1
	  User vagrant
	  Port 2222
	  UserKnownHostsFile /dev/null
	  StrictHostKeyChecking no
	  PasswordAuthentication no
	  IdentityFile /root/.vagrant.d/insecure_private_key
	  IdentitiesOnly yes
	  LogLevel FATAL
	  ForwardAgent yes

  
If you're working with a team or company or with a custom box and you want more secure SSH, you should create your own keypair and configure the private key in the Vagrantfile with config.ssh.private_key_path

PRIVATE KEY

-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzI
w+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoP
kcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2
hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NO
Td0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcW
yLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQIBIwKCAQEA4iqWPJXtzZA68mKd
ELs4jJsdyky+ewdZeNds5tjcnHU5zUYE25K+ffJED9qUWICcLZDc81TGWjHyAqD1
Bw7XpgUwFgeUJwUlzQurAv+/ySnxiwuaGJfhFM1CaQHzfXphgVml+fZUvnJUTvzf
TK2Lg6EdbUE9TarUlBf/xPfuEhMSlIE5keb/Zz3/LUlRg8yDqz5w+QWVJ4utnKnK
iqwZN0mwpwU7YSyJhlT4YV1F3n4YjLswM5wJs2oqm0jssQu/BT0tyEXNDYBLEF4A
sClaWuSJ2kjq7KhrrYXzagqhnSei9ODYFShJu8UWVec3Ihb5ZXlzO6vdNQ1J9Xsf
4m+2ywKBgQD6qFxx/Rv9CNN96l/4rb14HKirC2o/orApiHmHDsURs5rUKDx0f9iP
cXN7S1uePXuJRK/5hsubaOCx3Owd2u9gD6Oq0CsMkE4CUSiJcYrMANtx54cGH7Rk
EjFZxK8xAv1ldELEyxrFqkbE4BKd8QOt414qjvTGyAK+OLD3M2QdCQKBgQDtx8pN
CAxR7yhHbIWT1AH66+XWN8bXq7l3RO/ukeaci98JfkbkxURZhtxV/HHuvUhnPLdX
3TwygPBYZFNo4pzVEhzWoTtnEtrFueKxyc3+LjZpuo+mBlQ6ORtfgkr9gBVphXZG
YEzkCD3lVdl8L4cw9BVpKrJCs1c5taGjDgdInQKBgHm/fVvv96bJxc9x1tffXAcj
3OVdUN0UgXNCSaf/3A/phbeBQe9xS+3mpc4r6qvx+iy69mNBeNZ0xOitIjpjBo2+
dBEjSBwLk5q5tJqHmy/jKMJL4n9ROlx93XS+njxgibTvU6Fp9w+NOFD/HvxB3Tcz
6+jJF85D5BNAG3DBMKBjAoGBAOAxZvgsKN+JuENXsST7F89Tck2iTcQIT8g5rwWC
P9Vt74yboe2kDT531w8+egz7nAmRBKNM751U/95P9t88EDacDI/Z2OwnuFQHCPDF
llYOUI+SpLJ6/vURRbHSnnn8a/XG+nzedGH5JGqEJNQsz+xT2axM0/W/CRknmGaJ
kda/AoGANWrLCz708y7VYgAtW2Uf1DPOIYMdvo6fxIB5i9ZfISgcJ/bbCUkFrhoH
+vq/5CIWxCPp0f85R4qxxQ5ihxJ0YDQT9Jpx4TMss4PSavPaBH3RXow5Ohe+bYoQ
NE5OgEXk2wVfZczCZpigBKbKZHNYcelXtTt/nP3rsCuGcM4h53s=
-----END RSA PRIVATE KEY-----


PUBLIC CERT

ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key

	
</entry>
<entry [Tue 2013:12:03 05:33:04 EST] CREATED CENTOS 6.4 BOX>

http://daker.me/2013/09/automate-your-dev-environment-with-vagrant.html

1. DOWNLOAD UBUNTU 13.10 VAGRANT BOX

LIST OF VAGRANT BOXES

http://www.vagrantbox.es/

DOWNLOAD CENTOS 6.4 BOX
CentOS 6.4 x86_64 Minimal (VirtualBox Guest Additions 4.2.16, Chef 11.6.0, Puppet 3.2.3)

vagrant box add centos-6.4-x86-64 http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130731.box

	Progress: 7% (Rate: 207k/s, Estimated time remaining: 0:16:13))
	...
	Successfully added box 'ubuntu-13.10-i386' with provider 'virtualbox'!


2. CREATE A PROJECT FILE

mkdir /data2/vagrant/centos
cd /data2/vagrant/centos
vagrant init

ADD THE BOXNAME:

emacs -nw Vagrantfile

	Vagrant::Config.run do |config|
		config.vm.box = "centos-6.4-x86-64"
	end


3. START A VM

cd /data2/vagrant/centos
vagrant up


4. SSH INTO VM

vagrant ssh



	
</entry>
<entry [Mon 2013:12:02 19:58:55 EST] CURRENT VAGRANT FILE>

# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.

  config.vm.box = "ubuntu-13.10-i386"
#  config.vm.box = "base"

  # SHARED FILESYSTEMS
  #config.vm.synced_folder "/mnt", "/mnt", create: true
  #config.vm.synced_folder "/mnt/repos/private/syoung/notes", "/home/vagrant/notes",
  #owner: "root", group: "root"
  config.vm.synced_folder "../../../home/syoung/notes", "/home/vagrant/notes", mount_options: ["dmode=755", "fmode=755"]

  config.vm.synced_folder "../../../aguadev", "/aguadev", mount_options: ["dmode=755", "fmode=755"]

  #{:extra => 'dmode=777,fmode=777'}
  #config.vm.synced_folder "testfolder", "/home/vagrant/testfolder",
	#{:extra => 'dmode=777,fmode=777'}

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  # config.vm.box_url = "http://domain.com/path/to/above.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.

  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 8080, host: 8081

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network :private_network, ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network :public_network

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
   config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
   config.vm.provider :virtualbox do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:

     vb.customize ["modifyvm", :id, "--memory", "4096"]

   end
  
  # View the documentation for the provider you're using for more
  # information on available options.

  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  # You will need to create the manifests directory and a manifest in
  # the file base.pp in the manifests_path directory.
  #
  # An example Puppet manifest to provision the message of the day:
  #
  # # group { "puppet":
  # #   ensure => "present",
  # # }
  # #
  # # File { owner => 0, group => 0, mode => 0644 }
  # #
  # # file { '/etc/motd':
  # #   content => "Welcome to your Vagrant-built virtual machine!
  # #               Managed by Puppet.\n"
  # # }
  #
  # config.vm.provision :puppet do |puppet|
  #   puppet.manifests_path = "manifests"
  #   puppet.manifest_file  = "site.pp"
  # end

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
  # config.vm.provision :chef_solo do |chef|
  #   chef.cookbooks_path = "../my-recipes/cookbooks"
  #   chef.roles_path = "../my-recipes/roles"
  #   chef.data_bags_path = "../my-recipes/data_bags"
  #   chef.add_recipe "mysql"
  #   chef.add_role "web"
  #
  #   # You may also specify custom JSON attributes:
  #   chef.json = { :mysql_password => "foo" }
  # end

  # Enable provisioning with chef server, specifying the chef server URL,
  # and the path to the validation key (relative to this Vagrantfile).
  #
  # The Opscode Platform uses HTTPS. Substitute your organization for
  # ORGNAME in the URL and validation key.
  #
  # If you have your own Chef Server, use the appropriate URL, which may be
  # HTTP instead of HTTPS depending on your configuration. Also change the
  # validation key to validation.pem.
  #
  # config.vm.provision :chef_client do |chef|
  #   chef.chef_server_url = "https://api.opscode.com/organizations/ORGNAME"
  #   chef.validation_key_path = "ORGNAME-validator.pem"
  # end
  #
  # If you're using the Opscode platform, your validator client is
  # ORGNAME-validator, replacing ORGNAME with your organization name.
  #
  # If you have your own Chef Server, the default validation client name is
  # chef-validator, unless you changed the configuration.
  #
  #   chef.validation_client_name = "ORGNAME-validator"
end

	
</entry>
<entry [Mon 2013:12:02 02:39:25 EST] SSH AGENT FORWARDING>

http://stackoverflow.com/questions/11955525/how-to-use-ssh-agent-forwarding-with-vagrant-ssh

http://stackoverflow.com/questions/11955525/how-to-use-ssh-agent-forwarding-with-vagrant-ssh

1. ADD TO Vagrantfile

Vagrant.configure("2") do |config|
	config.ssh.private_key_path = "~/.ssh/id_rsa"
	config.ssh.forward_agent = true
end

WHERE

config.ssh.private_key_path IS YOUR LOCAL PRIVATE KEY


2. ADD PRIVATE KEY TO LOCAL SSH-AGENT

CHECK IF KEY IS ALREADY ADDED TO SSH-AGENT

ssh-add -L

	ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDW8uE7j0KMhqR2ZLNphOKGRo8zOM2Q8+yqwfsD1HYVtEfDhp9EV9w6i4ool1aG9KJZA7IT7ufQFWMYrtEjelav4D24KSEJzxoSv8QJ/6tvp2wPrO2DBx6XBDMHExxVT54nyO4FhfrNcQt2skicVZbpMe3x+tsD2QOcMWI1aMI4IiMADnuagX++5hRO30U0QSWpxheZednEio12u0/CQvZ1EZ6cysw82zoEPOOfh+OExVP/YBo5j79+ZgwbUQ9r+drKacI8Cc4roIvkJ6fsfDd9k6YvvXXBqV1yRdf7ANtaMLoMgytyzPh0FnOLqTm+e7jfe6sKt+TStvLaLBUVQWU1 /home/syoung/.ssh/syoung/bitbucket/id_rsa
	ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9rZDdXPfVGwace/uRGJNUpa/IZ0WbEfEN7gbDsB8RJhua8zz+o6eksrbzNEtCUBzl8brQ8QQnphE2zGn2MMfE89jBQRmDJC2TYO7P0WSfCd0doduOtYSe20WToB2BSLJJrC/p0staaKi+W9vgDnOi5//a/V1pv3jNZxpZTEswIQLNtWJxA4tCVxYVlH/o5fLzvtijbE5fEq+CmPOiPlIBPM2WJGlZedBm2bVMyd7Hqxt2dj/AGWCXXTUyc6HcL+EGpHHrd9pJ2IrY1MhxUsS6Tm9zJ/wAR4VktCIdKnY0Tjv3wDsjvMRff/WuWchXueSPtySadoAhBU70SA6tNjx5 /home/syoung/.ssh/syoung/github/id_rsa
	ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCkQRhnXsOL9eL3usR/lZ9apDNUM2ov7fKFau0IezRPRrslLGNpKB6gapZYKHxaRPGs0Lsk91vt952ws01WdyQGsD2jw91ZjEGLrdatstqE73e3cTeeImqpnAJRDf2sZQb7gTXDNYgOcqUd4HpJEp7zNGu0p1wq7L4RxbP7+pWJeVO4QBy0w2fMaJ9/1uz+ETftqN15Py9Amg8oQgmFlugqFH+ejk3Pw+if+GMDF30J1wg3LfPV9K2Kw7i4DnnvtMjRgfclt6fIbu7oNRhPDknt+55CB2xE3/KVug71IcggVVCZD01LW5rJ6981sBc7VS5TNIH6KJzloFQta5xtH8yf syoung1@services-dev


ADD KEY TO SSH-AGENT

ssh-add ~/.ssh/PATH_TO/id_rsa


3. ADD PUBLIC KEY TO AUTHORIZED_KEYS ON VAGRANT VM

**** NOT NECESSARY - DID NOT DO THIS AND IT STILL WORKED ****

~/.ssh/authorized_keys

cat ~/.ssh/authorized_keys 

	ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key
	ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCkQRhnXsOL9eL3usR/lZ9apDNUM2ov7fKFau0IezRPRrslLGNpKB6gapZYKHxaRPGs0Lsk91vt952ws01WdyQGsD2jw91ZjEGLrdatstqE73e3cTeeImqpnAJRDf2sZQb7gTXDNYgOcqUd4HpJEp7zNGu0p1wq7L4RxbP7+pWJeVO4QBy0w2fMaJ9/1uz+ETftqN15Py9Amg8oQgmFlugqFH+ejk3Pw+if+GMDF30J1wg3LfPV9K2Kw7i4DnnvtMjRgfclt6fIbu7oNRhPDknt+55CB2xE3/KVug71IcggVVCZD01LW5rJ6981sBc7VS5TNIH6KJzloFQta5xtH8yf syoung1@services-dev


4. CHECK CONFIG FILES

IDENTIFY CONFIG FILES
ssh -v example.com
	OpenSSH_6.1p1 Debian-4, OpenSSL 1.0.1c 10 May 2012
	debug1: Reading configuration data /home/syoung/.ssh/config
	debug1: Reading configuration data /etc/ssh/ssh_config
	debug1: /etc/ssh/ssh_config line 19: Applying options for *
	debug1: Connecting to example.com [93.184.216.119] port 22.

/home/syoung/.ssh/config

	# syoung GITHUB
	Host github.com
	 User syoung
	 HostName github.com
	 PreferredAuthentications publickey
	 IdentityFile ~/.ssh/syoung/github/id_rsa
	 
	# syoung BITBUCKET
	Host bitbucket.org
	 User syoung
	 HostName bitbucket.org
	 PreferredAuthentications publickey
	 IdentityFile ~/.ssh/syoung/bitbucket/id_rsa


COMMENT OUT 'ForwardAgent no' IF UNCOMMENTED IN SYSTEM ssh_config

/etc/ssh/ssh_config

	
	# This is the ssh client system-wide configuration file.  See
	# ssh_config(5) for more information.  This file provides defaults for
	# users, and the values can be changed in per-user configuration files
	# or on the command line.
	
	# Configuration data is parsed as follows:
	#  1. command line options
	#  2. user-specific file
	#  3. system-wide file
	# Any configuration value is only changed the first time it is set.
	# Thus, host-specific definitions should be at the beginning of the
	# configuration file, and defaults at the end.
	
	# Site-wide defaults for some commonly used options.  For a comprehensive
	# list of available options, their meanings and defaults, please see the
	# ssh_config(5) man page.
	
	Host *
	#   ForwardAgent no
	#   ForwardX11 no
	#   ForwardX11Trusted yes
	#   RhostsRSAAuthentication no
	#   RSAAuthentication yes
	#   PasswordAuthentication yes
	#   HostbasedAuthentication no
	#   GSSAPIAuthentication no
	#   GSSAPIDelegateCredentials no
	#   GSSAPIKeyExchange no
	#   GSSAPITrustDNS no
	#   BatchMode no
	#   CheckHostIP yes
	#   AddressFamily any
	#   ConnectTimeout 0
	#   StrictHostKeyChecking ask
	#   IdentityFile ~/.ssh/identity
	#   IdentityFile ~/.ssh/id_rsa
	#   IdentityFile ~/.ssh/id_dsa
	#   Port 22
	#   Protocol 2,1
	#   Cipher 3des
	#   Ciphers aes128-ctr,aes192-ctr,aes256-ctr,arcfour256,arcfour128,aes128-cbc,3des-cbc
	#   MACs hmac-md5,hmac-sha1,umac-64@openssh.com,hmac-ripemd160
	#   EscapeChar ~
	#   Tunnel no
	#   TunnelDevice any:any
	#   PermitLocalCommand no
	#   VisualHostKey no
	#   ProxyCommand ssh -q -W %h:%p gateway.example.com
		SendEnv LANG LC_*
		HashKnownHosts yes
		GSSAPIAuthentication yes
		GSSAPIDelegateCredentials no



4. VERIFY KEY IS WORKING ON VAGRANT VM

Test it out

SSH in to vagrant VM and run

ssh -T git@github.com

	OK!!

	Hi syoung! You've successfully authenticated, but GitHub does not provide shell access.


NOTES
-----

*** DID NOT WORK - PRINTED EMPTY LINE ***
If you are unsure if your local key is being used, you can inspect the SSH_AUTH_SOCK variable:

echo "$SSH_AUTH_SOCK"
# Print out the SSH_AUTH_SOCK variable
# /tmp/ssh-4hNGMk8AZX/agent.79453




</entry>
<entry [Thu 2013:11:28 17:15:41 EST] FIXED: ls /vagrant HANGS>

PROBLEM

ON GUEST, ls /vagrant HANGS, AS DOES ls ANY SYNCED FOLDERS


DIAGNOSIS

VIRTUALBOX BUG WITH UBUNTU 13.04

https://bugs.launchpad.net/ubuntu/+bug/1239417

This issue is VirtualBox (and kernel 3.11) related. Latest version of VirtualBox 4.3 fixes this error.

https://www.virtualbox.org/changeset/48529/vbox

	Additions/linux: fix shared folders for Linux 3.11


SOLUTION

1. UPDATE VIRTUALBOX TO 4.3 (NEWEST VERSION) ON HOST MACHINE

https://www.virtualbox.org/wiki/Linux_Downloads

EDIT

/etc/apt/sources.list

ADD

deb http://download.virtualbox.org/virtualbox/debian saucy contrib

ADD KEY FOR VIRTUALBOX

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 54422A4B98AB5139

	<!--
		gpg: requesting key 98AB5139 from hkp server keyserver.ubuntu.com
		gpg: key 98AB5139: public key "Oracle Corporation (VirtualBox archive signing key) <info@virtualbox.org>" imported
		gpg: no ultimately trusted keys found
		gpg: Total number processed: 1
		gpg:               imported: 1
	-->
	
TO AVOID ERROR:
	
	W: GPG error: http://download.virtualbox.org saucy Release: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 54422A4B98AB5139

VERIFY OLD VIRTUALBOX VERSION

VBoxManage -version

	4.2.10_Ubuntur84101

	
INSTALL

sudo apt-get update
sudo apt-get install virtualbox-4.3

VERIFY NEW VIRTUALBOX VERSION

VBoxManage -version

	4.3.2r90405

	
2. UPDATE GuestAdditions ON GUEST TO MATCH HOST VERSION OF VIRTUALBOX (4.3.2)

REMOVE EXISTING VIRTUALBOX GUEST ADDITIONS

GET EXISTING VIRTUALBOX VERSION

 find . -type f -name "*vbox*"
	...
	./var/lib/dkms/virtualbox-guest/4.2.16/3.11.0-13-generic/i686/module/vboxvideo.ko

... TRIED TO RUN WITH uninstall FLAG BUT DOES NOT WORK:

	You appear to have a version of the VBoxGuestAdditions software
	on your system which was installed from a different source or using a
	different type of installer ... remove it properly before
	installing this version. 


GET dpkg-INSTALLED VIRTUALBOX

dpkg -l | grep virtualbox

	ii  virtualbox-guest-dkms            4.2.16-dfsg-3                    all          x86 virtualization solution - guest addition module source for dkms
	ii  virtualbox-guest-utils           4.2.16-dfsg-3                    i386         x86 virtualization solution - non-X11 guest utilities
	ii  virtualbox-guest-x11             4.2.16-dfsg-3                    i386         x86 virtualization solution - X11 guest utilities


REMOVE OLD VIRTUALBOX GUEST ADDITIONS

apt-get remove virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11

	After this operation, 11.1 MB disk space will be freed.
	Do you want to continue [Y/n]? 
	(Reading database ... 70520 files and directories currently installed.)
	Removing virtualbox-guest-dkms ...
	
	-------- Uninstall Beginning --------
	Module:  virtualbox-guest
	Version: 4.2.16
	Kernel:  3.11.0-13-generic (i686)
	-------------------------------------
	
	Status: Before uninstall, this module version was ACTIVE on this kernel.
	
	vboxguest.ko:
	 - Uninstallation
	   - Deleting from: /lib/modules/3.11.0-13-generic/updates/dkms/
	 - Original module
	   - No original module was found for this module on this kernel.
	   - Use the dkms install command to reinstall any previous module version.
	
	
	vboxsf.ko:
	 - Uninstallation
	   - Deleting from: /lib/modules/3.11.0-13-generic/updates/dkms/
	 - Original module
	   - No original module was found for this module on this kernel.
	   - Use the dkms install command to reinstall any previous module version.
	
	
	vboxvideo.ko:
	 - Uninstallation
	   - Deleting from: /lib/modules/3.11.0-13-generic/updates/dkms/
	 - Original module
	   - No original module was found for this module on this kernel.
	   - Use the dkms install command to reinstall any previous module version.
	
	depmod....
	
	DKMS: uninstall completed.
	
	------------------------------
	Deleting module version: 4.2.16
	completely from the DKMS tree.
	------------------------------
	Done.
	Removing virtualbox-guest-x11 ...
	Removing virtualbox-guest-utils ...
	Processing triggers for ureadahead ...
	Processing triggers for man-db ...

	
VERIFY OLD VIRTUALBOX GUEST ADDITIONS REMOVED

ll /var/lib/dkms/virtualbox-guest/
	ls: cannot access /var/lib/dkms/virtualbox-guest/: No such file or directory


INSTALL linux-headers AND build-essential LIBRARIES

sudo apt-get install linux-headers-$(uname -r) build-essential


DOWNLOAD VIRTUALBOX 4.3.2 GUEST ADDITIONS *.iso

wget http://download.virtualbox.org/virtualbox/4.3.2/VBoxGuestAdditions_4.3.2.iso

MOUNT *.iso FILE

mount VBoxGuestAdditions_4.3.2.iso /mnt -o loop -t iso9660


INSTALL GUEST ADDITIONS

cd /mnt
./VBoxLinuxAdditions.run

	OK
	
	
RESTART VAGRANT WITH SYNCED FOLDER ENTRY IN Vagrantfile

config.vm.synced_folder "../../../home/syoung/notes", "/home/vagrant/notes", mount_options: ["dmode=755", "fmode=755"]


VERIFY ACCESS TO SYNCED FOLDERS ON VAGRANT VM

ls /home/vagrant/notes
	
	OK


</entry>
<entry [Thu 2013:11:28 14:29:32 EST] FIXED: HANG OF VAGRANT VM ON vagrant up>

1. GET VAGRANT VM ID

cat .vagrant/machines/default/virtualbox/id; echo

	df476bff-cca4-4d83-a96c-536894a744e6

2. GET VM NAME IN VIRTUALBOX (SELECT USING VAGRANT VM ID)

VBoxManage list vms

	"test_default_1385014853" {df476bff-cca4-4d83-a96c-536894a744e6}


2. poweroff VIRTUALBOX VM


VBoxManage controlvm test_default_1385014853 poweroff


	
</entry>
<entry [Thu 2013:11:28 14:25:58 EST] GET SCREEN PRINT OF BOOTING VAGRANT VM>

1. GET MACHINE ID

cd /data2/vagrant
cd test
cat .vagrant/machines/default/virtualbox/action_provision
	1385014854


2. PRINT SCREEN WITH VIRTUALBOX

VBoxManage controlvm test_1385014854 screenshotpng foo.png
google-chrome foo.png

	
</entry>
<entry [Thu 2013:11:28 13:27:19 EST] GET VAGRANT LOGGING>

export VAGRANT_LOG=INFO

OR

export VAGRANT_LOG=DEBUG

</entry>
<entry [Wed 2013:11:20 23:14:22 EST] USE PUPPET ON VAGRANT>

http://daker.me/2013/09/automate-your-dev-environment-with-vagrant.html

Vagrant allow you to use different Provisioners to easily setup your VM with everything it needs to run your project :

I do prefer Puppet for provisioning, because it's easy and it allow you to easily create a manifest to control the package, file or service with a few lines of code.


Here is the Vagrantfile i use, i needed to forward the port 8000 because i want to access the webapp using my browser, i also increased the memory of the VM to 1GB, and made the project folder accessible to the VM :

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |ltp|

    ltp.vm.box = "ltp-devserver"
    ltp.vm.box_url = "http://files.vagrantup.com/precise32.box"
    ltp.vm.forward_port 8000, 8000
    ltp.vm.network :hostonly, "33.33.33.10"
    ltp.vm.customize ["modifyvm", :id, "--memory", 1024]

    ltp.ssh.max_tries = 50
    ltp.ssh.timeout = 300

    ltp.vm.share_folder("v-root", "/home/vagrant/ltp", ".")

    ltp.vm.provision :puppet do |puppet|
        puppet.manifests_path = "puppet/manifests"
        puppet.manifest_file  = "vagrant.pp"
    end
end

here one of the classes i use on my dev environement :

class init {

    group { "puppet":
        ensure => "present",
    }

    # Let's update the system
    exec { "update-apt":
        command => "sudo apt-get update",
    }

    # Let's install the dependecies
    package {
        ["python", "python-dev", "libjs-jquery", "libjs-jquery-ui", "iso-codes", "gettext", "python-pip", "bzr"]:
        ensure => installed,
        require => Exec['update-apt'] # The system update needs to run first
    }

    # Let's install the project dependecies from pip
    exec { "pip-install-requirements":
        command => "sudo /usr/bin/pip install -r $PROJ_DIR/requirements.txt",
        tries => 2,
        timeout => 600, # Too long, but this can take awhile
        require => Package['python-pip', 'python-dev'], # The package dependecies needs to run first
        logoutput => on_failure,
    }

}


You need to specify one manifest file in your Vagranfile, if you need to split it, you can use something like this :

$ tree
.
└── manifests
    ├── classes
    │   ├── init.pp
    │   └── ltp.pp
    └── vagrant.pp

I use vagrant.pp to define my project variables, and to make sure all the classes are executed in the order i want :


import "classes/*.pp"

$PROJ_DIR = "/home/vagrant/ltp"

Exec {
    path => "/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin",
}

class dev {

    class {
        init: before => Class[ltp];
        ltp:;
    }
}

include dev

The ltp class is only used to run some django commands :

class ltp {

    file { "$PROJ_DIR/loco_directory/local_settings.py":
        ensure => file,
        source => "$PROJ_DIR/loco_directory/local_settings.py.sample",
        replace => false;
    }

    exec {
        "db_download":
            cwd => "$PROJ_DIR/loco_directory",
            command => "/usr/bin/wget http://people.ubuntu.com/~daker/ltp/ltp.db",
            creates => "$PROJ_DIR/loco_directory/ltp.db";
    }

    exec {
        "managepy_syncdb":
            cwd => "$PROJ_DIR/loco_directory",
            command => "/usr/bin/python manage.py syncdb --noinput",
    }

    exec {
        "managepy_migratedb":
            cwd => "$PROJ_DIR/loco_directory",
            command => "/usr/bin/python manage.py migrate",
    }
}

Now all i have to do is vagrant up and let Vagrant do all his magic tricks :

$ vagrant up

[default] Importing base box 'ltp-devserver'...
[default] Matching MAC address for NAT networking...
[default] Clearing any previously set forwarded ports...
[default] Forwarding ports...
[default] -- 22 => 2222 (adapter 1)
[default] -- 8000 => 8000 (adapter 1)
[default] Creating shared folders metadata...
[default] Clearing any previously set network interfaces...
[default] Preparing network interfaces based on configuration...
[default] Running any VM customizations...
[default] Booting VM...
[default] Waiting for VM to boot. This can take a few minutes.
[default] VM booted and ready for use!
[default] Configuring and enabling network interfaces...
[default] Mounting shared folders...
[default] -- v-root: /home/vagrant/ltp
[default] -- manifests: /tmp/vagrant-puppet/manifests
[default] Running provisioner: Vagrant::Provisioners::Puppet...
[default] Running Puppet with /tmp/vagrant-puppet/manifests/vagrant.pp...
stdin: is not a tty
warning: Could not retrieve fact fqdn

notice: /Stage[main]/Init/Exec[update-apt]/returns: executed successfully

notice: /Stage[main]/Init/Package[python-pip]/ensure: ensure changed 'purged' to 'present'

notice: /Stage[main]/Init/Package[bzr]/ensure: ensure changed 'purged' to 'present'

notice: /Stage[main]/Init/Package[libjs-jquery-ui]/ensure: ensure changed 'purged' to 'present'

notice: /Stage[main]/Init/Package[python-dev]/ensure: ensure changed 'purged' to 'present'

notice: /Stage[main]/Init/Exec[pip-install-requirements]/returns: executed successfully

notice: /Stage[main]/Init/Package[gettext]/ensure: ensure changed 'purged' to 'present'

notice: /Stage[main]/Ltp/File[/home/vagrant/ltp/loco_directory/local_settings.py]/ensure: defined content as '{md5}25234f94c80418dcb7cc59f3db2dd7f8'

notice: /Stage[main]/Ltp/Exec[db_download]/returns: executed successfully

notice: /Stage[main]/Ltp/Exec[managepy_syncdb]/returns: executed successfully

notice: /Stage[main]/Ltp/Exec[managepy_migratedb]/returns: executed successfully

notice: Finished catalog run in 811.47 seconds
After i started using Vagrant, my workflow imporved a lot i start focusing on writing code rather than resolving packages conflicts, i do use a VM for each bug fix/feature i need to work on, and once the fix is merged i simply delete the VM without thinking about breaking anything.

[NB]: Ubuntu now officially supports Vagrant, and provides official Ubuntu boxes for 12.04, 12.10, 13.04 and 13.10.
	
</entry>
<entry [Wed 2013:11:20 21:53:28 EST] USE VAGRANT>

http://daker.me/2013/09/automate-your-dev-environment-with-vagrant.html

1. DOWNLOAD UBUNTU 13.10 VAGRANT BOX

vagrant box add ubuntu-13.10-i386 http://cloud-images.ubuntu.com/vagrant/saucy/current/saucy-server-cloudimg-i386-vagrant-disk1.box

	Progress: 7% (Rate: 207k/s, Estimated time remaining: 0:16:13))
	...
	Successfully added box 'ubuntu-13.10-i386' with provider 'virtualbox'!


2. CREATE A PROJECT FILE

cd /data2/vagrant
mkdir test
cd test
vagrant init

ADD THE BOXNAME:

emacs -nw Vagrantfile

	Vagrant::Config.run do |config|
		config.vm.box = "ubuntu-13.10-i386"
	end


3. START A VM

cd /data2/vagrant/test
vagrant up


4. SSH INTO VM

vagrant ssh

OR

ssh -p 2222 vagrant@localhost
	PASSWORD: vagrant

	Welcome to Ubuntu 13.10 (GNU/Linux 3.11.0-13-generic i686)
	
	 * Documentation:  https://help.ubuntu.com/
	
	  System information as of Thu Nov 21 06:42:12 UTC 2013
	
	  System load:  0.0               Processes:           78
	  Usage of /:   2.5% of 39.34GB   Users logged in:     0
	  Memory usage: 15%               IP address for eth0: 10.0.2.15
	  Swap usage:   0%
	
	  Graph this data and manage this system at:
		https://landscape.canonical.com/
	
	  Get cloud support with Ubuntu Advantage Cloud Guest:
		http://www.ubuntu.com/business/services/cloud
	
	  Use Juju to deploy your cloud instances and workloads:
		https://juju.ubuntu.com/#cloud-saucy
	
	0 packages can be updated.
	0 updates are security updates.


5. COPY FILES TO VM

scp -r -P 2222 /aguadev vagrant@localhost:

	OK



NOTES
-----

http://www.vagrantbox.es/

Vagrant is an amazing tool for managing virtual machines via a simple to use command line interface. With a simple vagrant up you can be working in a clean environment based on a standard template.

These standard templates are called base boxes, and this website is simply a list of boxes people have been nice enough to make publicly available.

Suggest a Box
Do you know of another base box? Send a pull request and we'll add it to the list below.

Available Boxes
To use the available boxes just replace {title} and {url} with the information in the table below.

vagrant box add {title} {url}
vagrant init {title}
vagrant up

The list of boxes was last updated on October 25th, 2013.

Official Ubuntu 13.10 daily Cloud Image i386 (Development release, No Guest Additions)	VirtualBox
http://cloud-images.ubuntu.com/vagrant/saucy/current/saucy-server-cloudimg-i386-vagrant-disk1.box
309M

	
</entry>
<entry [Wed 2013:11:20 21:39:56 EST] INSTALL VAGRANT>

http://www.dev-metal.com/setup-virtual-machine-multiple-vagrant-puphpet/

1. INSTALL VIRTUALBOX

sudo apt-get install virtualbox


2. INSTALL VAGRANT

sudo apt-get install vagrant

OR DOWNLOAD

#http://files.vagrantup.com/packages/a40522f5fabccb9ddabad03d836e120ff5d14093/vagrant_1.3.5_x86_64.deb
#dpkg -i vagrant_1.3.5_x86_64.deb

VERSION 1.4


wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.4.0_x86_64.deb
cd ~/software/vagrant
dpkg -i vagrant_1.4.0_x86_64.deb

3. CONFIRM VAGRANT INSTALLATION

vagrant --version

	Vagrant 1.3.5

	
</entry>