linux



<entry [Tue 2015:01:27 08:43:01 EST] PRINT watch COMMAND OUTPUT TO FILE>
	
watch -t -n 10 "(date '+TIME:%H:%M:%S' ; ps aux | grep "pattern" | wc -l) | tee -a logfile"
	
</entry>
<entry [Tue 2014:09:02 14:31:26 EST] LDCONFIG>

http://linux.101hacks.com/unix/ldconfig/

What is ldconfig?

ldconfig is used to create, udpate and remove symbolic links for the current shared libraries based on the lib directories present in the /etc/ld.so.conf


3 ldconfig Examples

1. Display current libraries from the cache

This displays the list of directories and the libraries that are stored in the current cache. In the following example, it indicates that there are 916 libraries found in the cache file /etc/ld.so.cache, and it lists all of them below.

# ldconfig -p | head -5
916 libs found in cache `/etc/ld.so.cache'
	libzephyr.so.4 (libc6) => /usr/lib/libzephyr.so.4
	libzbar.so.0 (libc6) => /usr/lib/libzbar.so.0
	libz.so.1 (libc6) => /lib/libz.so.1
	libz.so (libc6) => /usr/lib/libz.so

 
2. Display libraries from every directory

Scans all the directories, and prints the directory name, and all the links that are created under it.

# ldconfig -v | head
/usr/lib/mesa:
	libGL.so.1 -> libGL.so.1.2
/usr/lib/i686-linux-gnu:
	liblouis.so.2 -> liblouis.so.2.2.0
/usr/lib/alsa-lib:
	libasound_module_ctl_oss.so -> libasound_module_ctl_oss.so
	libasound_module_ctl_bluetooth.so -> libasound_module_ctl_bluetooth.so
	libasound_module_pcm_bluetooth.so -> libasound_module_pcm_bluetooth.so
	libasound_module_pcm_vdownmix.so -> libasound_module_pcm_vdownmix.so
	libasound_module_rate_speexrate.so -> libasound_module_rate_speexrate_medium.so
The /etc/ld.so.conf has an include statement, which indicates that all the *.conf file under /etc/ld.so.conf.d directory should be considered.

# cat /etc/ld.so.conf
include /etc/ld.so.conf.d/*.conf
As you see below, there are multiple *.conf file located under this ld.so.conf.d directory. All of these files will be used.

# ls -1 /etc/ld.so.conf.d/
GL.conf
i486-linux-gnu.conf
i686-linux-gnu.conf
libasound2.conf
libc.conf
Sometimes when you do ldconfig -v, you might get the following error. This is because the directory referred by some of the *.conf file located under /etc/ld.so.conf.d is not valid, and contains directory names that doesn?t exist.

/sbin/ldconfig.real: Can't stat /lib/i486-linux-gnu: No such file or directory
/sbin/ldconfig.real: Can't stat /usr/lib/i486-linux-gnu: No such file or directory
/sbin/ldconfig.real: Can't stat /lib/i686-linux-gnu: No such file or directory
/sbin/ldconfig.real: Can't stat /lib64: No such file or directory
Note: You can either ignore these error mesages are remove those *.conf files from the /etc/ld.so.conf.d directory.

3. Inform System about the New Libraries

If you?ve installed a new program by compiling it from source, you might want to inform the system about the new libraries.

For example, let us assume that you?ve installed a program called dummy, which has all it?s libraries under /opt/dummy/lib directory.

The following example will update the links using only the directory /opt/dummy/lib. This doesn?t rebuilt the links by processing the /etc/ld.so.conf file. Please note that this doesn?t rebuild the cache. It just updates the link.

# ldconfig -n /opt/dummy/lib
Instead of the above, you can also add the ?/opt/dummy/lib? to /etc/ld.so.conf and do the following.

# vi /etc/ld.so.conf

# ldconfig

Syntax and Options

Syntax:

ldconfig [OPTION...]
Short Option	Long Option	Option Description
-v	?verbose	Indicates verbose mode. Prints current version number, name of each directory as it is scanned and links that are created.
-n		Process the directories that are specified from the command line. This doesn?t process the regular /usr/lib and lib directories. This also doesn?t process directories specified in the /etc/ld.so.conf. This option implies -N.
-N		This doesn?t rebuild the cache. Unless -X is also specified, links are still updated.
-X		This doesn?t update the links. Unless -N is also specified, the cache is still rebuilt.
-f		Use the specified config file instead of /etc/ld.so.conf.
-C		Use the specified cache instead of /etc/ld.so.cache.
-r		Change to and use root as the root directory.
-l		This is library mode, which manually links individual libraries.
-p	?print-cache	Print the lists of directories and candidate libraries stored in the current cache.
-c FORMAT	?format=FORMAT	Uses FORMAT for the cache file. Valid values for FORMAT: old, new and compat. compat is the default value.
-i	?ignore-aux-cache	Ignore auxiliary cache file.
-?	?help, ?usage	Display help
-V	?version	Display version number


Related Commands

ldd
ld.so
	
</entry>
<entry [Wed 2014:08:27 14:59:51 EST] NTFS FORMAT A THUMB DRIVE>

PROBLEM

CAN'T FIND mkfs.ntfs

mkfs -t ntfs /dev/sdd
	mkfs.ntfs: No such file or directory


DIAGNOSIS

SYMLINK POINTS TO MISSING FILE

ll /sbin/mkfs.ntfs
lrwxrwxrwx 1 root root 16 Aug 24  2013 /sbin/mkfs.ntfs -> /usr/sbin/mkntfs
root@comp2:/home/syoung# ll /usr/sbin/mkntfs
ls: cannot access /usr/sbin/mkntfs: No such file or directory
root@comp2:/home/syoung# ll /sbin/mkntfs
-rwxr-xr-x 1 root root 79984 Feb 25  2013 /sbin/mkntfs


SOLUTION

DELETE SYMLINK AND POINT TO EXISTING FILE

rm -fr /sbin/mkfs.ntfs
ln -s /sbin/mkntfs /sbin/mkfs.ntfs

RUN mkfs.ntfs WITH FORCE -F OPTION

mkfs.ntfs -F /dev/sdc



	
</entry>
<entry [Thu 2014:08:21 03:55:14 EST] INSTALL emacs 24>

1. INSTALL DEPENDENCIES

sudo apt-get install texinfo
sudo apt-get install libxpm-dev libjpeg-dev libgif-dev libtiff4-dev

2. INSTALL emacs

git clone git://git.savannah.gnu.org/emacs.git
cd emacs
./configure
make
make install


3. SELECT VERSION

sudo update-alternatives --config emacs
	CHOOSE VERSION 24


</entry>
<entry [Thu 2014:08:21 03:43:11 EST] INSTALL emacs LOCALLY>

1. DOWNLOAD

wget http://open-source-box.org/emacs/emacs-24.3.tar.gz


2. INSTALL WITH prefix

tar xvfz emacs-24.3.tar.gz
cd emacs-24.3
./configure --prefix=/home/stuarty/software/emacs/24.3 --bindir=/home/stuarty/bin



</entry>
<entry [Sat 2014:08:09 04:36:32 EST] FIX screen PROBLEM>

PROBLEM

screen -S something

	Cannot open your terminal '/dev/pts/0' - please check"

DIAGNOSIS

This is because another user (you) initiated the current terminal ? you probably did a sudo su into the user you are now trying to run screen as, right?

SOLUTION

Sign out and properly connect / sign in as the user you wish to use.

OR

Run script /dev/null to own the shell (more info over at Server Fault); then try screen again.
	
</entry>
<entry [Wed 2014:07:30 02:37:05 EST] TYPE 'TAB' ON COMMAND LINE>

 to type a tab character like so: press ctrl-v, then ctrl-i
 
	
</entry>
<entry [Sun 2014:07:20 01:50:44 EST] DELETE FILE STARTING WITH '--'>

rm -fr -- --filename
	
</entry>
<entry [Fri 2014:07:18 05:34:09 EST] INCREMENTAL HISTORY SEARCHING>

1. EDIT .inputrc

ADD:

"\e[A": history-search-backward
"\e[B": history-search-forward
"\e[C": forward-char
"\e[D": backward-char


2. TYPE TEXT AND HIT 'UP' ARROW

	OK


</entry>
<entry [Fri 2014:06:27 17:10:45 EST] MULTI-LINE grep>

SUMMARY:

M-x customize-variable RET vc-follow-symlinks RET


http://stackoverflow.com/questions/3717772/regex-grep-for-multi-line-search-needed

Without the need to install the grep variant pcregrep, you can do multiline search with grep.

$ grep -Pzo "(?s)^(\s*)\N*main.*?{.*?^\1}" *.c
Explanation:

-P activate perl-regexp for grep (a powerful extension of regular extensions)

-z suppress newline at the end of line, subtituting it for null character. That is, grep knows where end of line is, but sees the input as one big line.

-o print only matching. Because we're using -z, the whole file is like a single big line, so if there is a match, the entire file would be printed; this way it won't do that.

In regexp:

(?s) activate PCRE_DOTALL, which means that . finds any character or newline

\N find anything except newline, even with PCRE_DOTALL activated

.*? find . in nongreedy mode, that is, stops as soon as possible.

^ find start of line

\1 backreference to first group (\s*) This is a try to find same indentation of method

As you can imagine, this search prints the main method in a C (*.c) source file.
	
</entry>
<entry [Mon 2014:06:23 23:24:44 EST] .emacs FILE AVOID vc-follow-symlinks PROMPT>

http://dotfiles.org/~battlemidget/.emacs

; tips
; c-x left/right arrow for switching tabs

;; loadpath
(setq load-path (cons (expand-file-name "~/.el") load-path))

; Who needs these whatever-bars anyway?

;(tool-bar-mode -1)
;(menu-bar-mode -1)
;(scroll-bar-mode -1)

; Toggles the font-lock feature so that emacs
; highligths my texts.

(global-font-lock-mode t)

; Share the clipboard with X

(setq x-select-enable-clipboard t)

; Show column number on the status line

(column-number-mode t)

; Lets emacs uncompress .gz files before opening them

(auto-compression-mode 1)

; The proper TeX/LaTeX printing command for my system

(setq tex-dvi-print-command "dvips -f * | lpr")

; Preview TeX/LaTeX output with xdvi and telling it to
; watch the file for changes every 3 seconds

(setq tex-dvi-view-command "xdvi -watchfile 3 -expertmode 0")

; Set the papersize to a4

(setq ps-paper-type 'a4small)

; I use UTF-8

(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-default-font "Monospace:pixelsize=14")

;; quit message
(fset 'yes-or-no-p 'y-or-n-p)

(setq delete-auto-save-files t)                ; no "#" files after a save
(setq auto-save-list-file-prefix nil)        ; don't record sessions

;; When saving files, set execute permission if #! is in first line.
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

;; set the fill column
(setq-default fill-column 72)

;; turn on auto fill in all lmodes
(setq auto-fill-mode 1)

;; add automagic python load
;;(autoload 'python-mode "python-mode" "Python Mode." t)

;; Scroll 1 line
(progn (setq scroll-step 1)
       (setq scroll-preserve-screen-position t)
       (setq scroll-conservatively 9999))

;; No new lines at the end
(setq next-line-add-newlines nil)

;; Do not use tabs!
(setq-default indent-tabs-mode nil)

;; delete \b at line ends before saving a file
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

(setq inhibit-startup-message t)

;; Shhhh!
(setq visible-bell t)

;; To use emacs client
(server-start)

;; compilation
;; Autocompilation
(defun autocompile()
  "compile itself if ~/.emacs"
  (interactive)
  (if (string= (buffer-file-name) (concat default-directory ".emacs"))
      (byte-compile-file (buffer-file-name))))

;;;;;;;;;
;; python

(mapc (lambda (hook)
        (add-hook hook (lambda ()
                         (setq show-trailing-whitespace t))))
      '(python-mode-hook))

;(autoload 'py-complete-init "py-complete")
;(add-hook 'python-mode-hook 'py-complete-init)

;; end of python
;;;;;;;;;;;;;;;;

;; undo
(global-set-key (kbd "C-z") 'undo)

;; go to line
(global-set-key (kbd "C-M-g") 'goto-line)

(global-set-key (kbd "C-x C-r") 'query-replace-regexp)

;;;;;;;;;;
;; General

;; ibuffer
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; filladapt
(setq-default filladapt-mode t)

;; don't ask when changing case
(put 'downcase-region 'disabled nil)
(put 'upcase-region   'disabled nil)

;; overwrite mode is not disabled
(put 'overwrite-mode 'disabled nil)

(setq
  ;; don't show annoing startup msg
  inhibit-startup-message t
  ;; NO annoing backups
  make-backup-files nil
  ;; follow symlinks and don't ask
  vc-follow-symlinks t
  ;; see what you type
  echo-keystrokes 0.01
  ;; text scrolling
  scroll-conservatively 50
  scroll-preserve-screen-position 't
  scroll-margin 10
  ;; Insert space/slash after completion
  comint-completion-addsuffix t
  ;; number of chars in line
  fill-column 72
  ;; delete line in one stage
  kill-whole-line t
  ;; default mode
  default-major-mode 'text-mode
  ;; meaning are the same as the name :)
  delete-key-deletes-forward t
  ;; next-line don't add new lines
  next-line-add-newlines nil
  ;; Scroll by one line at a time
  scroll-step 1
  ;; don't add new lines when scrolling down
  next-line-add-newlines nil
  ;; make sure file ends with NEWLINE
  require-final-newline t
  ;; delete excess backup versions
  delete-old-versions t
  ;; setting the default tabulation
  default-tab-width 4
  ;; paste at cursor NOT at mouse pointer position
  mouse-yank-at-point t
  ;; apropos works better but slower
  apropos-do-all t
  ;; display time in the modeline
  display-time-24hr-format t
  display-time-day-and-date t
  ;; calendar customizing
  european-calendar-style t
  calendar-week-start-day 1
  ;; autosave every 512 keyboard inputs
  auto-save-interval 512
  ;; limit the number of newest versions
  kept-new-versions 5
  ;; limit the number of oldest versions
  kept-old-versions 5
  auto-save-list-file-prefix "~/.emacs.d/backups/save-"
  ;; don't beep
;  visible-bell t
  cursor-in-non-selected-windows nil
  ;; dired settings
  dired-recursive-copies t
  dired-recursive-deletes t
)

;; save position in files
(setq-default save-place t)

;; extensions

;;(require 'color-theme)
;;(color-theme-initialize)
;;(color-theme-charcoal-black)

	
</entry>
<entry [Thu 2014:02:27 01:46:05 EST] GUIDE TO WRITING PORTABLE SHELL SCRIPTS>

http://www.gnu.org/s/hello/manual/autoconf/Portable-Shell.html

	
</entry>
<entry [Tue 2014:02:25 23:05:56 EST] IPTABLES DELETE RULE>

iptables -L INPUT --line-numbers

Example output :

Chain INPUT (policy ACCEPT) 
    num  target prot opt source destination
    1    ACCEPT     udp  --  anywhere  anywhere             udp dpt:domain 
    2    ACCEPT     tcp  --  anywhere  anywhere             tcp dpt:domain 
    3    ACCEPT     udp  --  anywhere  anywhere             udp dpt:bootps 
    4    ACCEPT     tcp  --  anywhere  anywhere             tcp dpt:bootps


So if you would like to delete second rule :

iptables -D INPUT 2
	
</entry>
<entry [Thu 2013:06:13 14:07:15 EST] ZERO OUT PARTITION>


dd if=/dev/zero of=/dev/xxx bs=256k

    
</entry>
<entry [Thu 2013:06:13 01:19:23 EST] PASSWORD ENCRYPT WITH zip>

ZIP A FOLDER:

zip -e -r foldername.zip folder


ZIP A LIST OF FILES:

zip -e file_name.zip list_of_files


Working example:

$ touch file_{0,1}.txt # creates blank files file_0 & file_1    
$ zip -e file.txt file_* # ask zip to encrypt
$ ENTER PASSWORD:
$ VERIFY PASSWORD:
$ ls file*


    
</entry>
<entry [Thu 2013:06:13 01:15:45 EST] PASSWORD-ENCRYPT FOLDER WITH openssl>

ENCRYPT
tar cz zoo.data/ | openssl enc -aes-256-cbc -e > zoo.data.tar.gz.enc


DECRYPT
openssl aes-256-cbc -d -in zoo.data.tar.gz.enc  -out zoo.data.tar.gz



    
</entry>
<entry [Fri 2013:05:17 20:32:12 EST] BACKUP GPT PARTITION TABLE (WINDOWS 7) > 
    
Use my GPT fdisk (gdisk and sgdisk) to back up the data:

sgdisk -b $BACKUPFILE $SOURCEDRIVE

Restore a backup with the -l option:

sgdisk -l $BACKUPFILE $TARGETDRIVE


ALSO: COPY GPT PARTITION TABLE FROM ONE DISC TO ANOTHER

sgdisk -R=/dev/sdb /dev/sda
sgdisk -G /dev/sdb

The first command copies the partition table of sda to sdb (be careful not to mix these up). The second command randomizes the GUID on the disk and all the partitions. This is only necessary if the disks are to be used in the same machine, otherwise it's unnecessary.

</entry>
<entry [Sat 2013:04:20 20:12:23 EST] CAN'T INSTALL Internet Explorer ON LINUX>
    
IEs 4 Linux needs two packages: cabextract and Wine


1. DOWNLOAD WINE FOR UBUNTU
http://www.winehq.org/download/ubuntu

add-apt-repository ppa:ubuntu-wine/ppa
sudo apt-get update

sudo apt-get install wine1.5


2. DOWNLOAD ies4linux

mkdir -p /home/syoung/software/ie
cd /home/syoung/software/ie
wget http://www.tatanka.com.br/ies4linux/downloads/ies4linux-latest.tar.gz


3. INSTALL ies4linux

tar -zxvf ies4linux-latest.tar.gz
cd ies4linux-*
./ies4linux

    !!!! FAILS TO INSTALL!!!

4. START

~/bin/ie6

    
</entry>
<entry [Sun 2013:03:31 21:47:34 EST] USE -p / --perms OPTIONS TO PRESERVE PERMISSIONS WITH rsync>

rsync -av --safe-links --perms /media/syoung1/7945c1ea-4e51-4994-9b48-02e75f57748d/home/syoung /mnt/home/syoung

    
</entry>
<entry [Thu 2013:02:28 10:27:14 EST] CRONTAB>


34    *    *    *    *    /illumina/scripts/WGS/saffronDB/shell/run_queues.sh > /dev/null 2>&1
 
25    *    *    *    *    /illumina/scripts/WGS/saffronDB/shell/run_launch_builds.sh > /dev/null 2>&1
 
27    *    *    *    *    /illumina/scripts/WGS/saffronDB/shell/run_launchers.sh > /dev/null 2>&1
 
40    *    *    *    *    /illumina/scripts/WGS/saffronDB/shell/run_monitors.sh > /dev/null 2>&1
 
32    *    *    *    *    /illumina/scripts/WGS/saffronDB/shell/run_imports.sh > /dev/null 2>&1

 *    *    *    *    *    command to be executed
 *    *    *    *    *
 *    *    *    *    *
 *    *    *    *    *
 *    *    *    *    ****** day of week (0 - 7) (0 or 7 are Sunday, or use names)
 *    *    *    *********** month (1 - 12)
 *    *    **************** day of month (1 - 31)
 *    ********************* hour (0 - 23)
 ************************** min (0 - 59)
     
</entry>
<entry [Fri 2013:02:15 17:17:45 EST] BURN ISO TO USB>

sudo dd if=/home/syoung/software/ubuntu/ubuntu-12.10-desktop-amd64-130215.iso of=/dev/sdb
    
</entry>
<entry [Wed 2012:12:12 07:51:11 EST] GET DEVICE UUID>


Get UUID of Hard Disks
October 15, 2007 ? liquidat

The Universally Unique Identifier can be used to identify a device independent form its mount point or device name. This is more and more important as many devices today support hot-plugging or are external anyway. Therefore it makes sometimes sense to access a device (for example in fstab) not by device name but by the UUID.

There are several ways to get the UUID. The first one uses the /dev/ directory. While you are on is you might want to check other by-* directories, I never knew of them.
1
$
ls -l /dev/disk/by-uuid
2
lrwxrwxrwx 1 root root 10 11. Okt 18:02 53cdad3b-4b01-4a6c-a099-be1cdf1acf6d -> ../../sda2
Another way to get the uuid by usage of the tool blkid:
1
$ blkid /dev/sda1
2
/dev/sda1: LABEL="/" UUID="ee7cf0a0-1922-401b-a1ae-6ec9261484c0" SEC_TYPE="ext2" TYPE="ext3"

    
</entry>
<entry [Fri 2012:11:30 15:55:27 EST] IDENTIFY YOUR FILESYSTEM TYPE (ext2, ext3, ext4, ETC.)>

http://www.thegeekstuff.com/2011/04/identify-file-system-type/

5 Methods to Identify Your Linux File System Type (Ext2 or Ext3 or Ext4)
by RAMESH NATARAJAN on APRIL 18, 2011
 

Question: How do I identify my file system type? I like to upgrade my current file system to the latest ext4. Before that I would like to know what my current file system type is for various mount points I have on my UNIX system.

Answer: Use any one of the five methods mentioned below to identify your file system type.

Method 1: Use df -T Command

The -T option in the df command displays the file system type.

# df -T | awk '{print $1,$2,$NF}' | grep "^/dev"
/dev/sda1 ext2 /
/dev/sdb1 ext3 /home
/dev/sdc1 ext3 /u01
Method 2: Use Mount Command

Use the mount command as shown below.

# mount | grep "^/dev"
/dev/sda1 on / type ext2 (rw)
/dev/sdb1 on /home type ext3 (rw)
/dev/sdc1 on /u01 type ext3 (rw)
As shown in the above example:

/dev/sda1 is ext2 file system type. (mounted as /)
/dev/sdb1 is ext3 file system type. (mounted as /home)
/dev/sdc1 is ext3 file system type. (mounted as /u01)
Method 3: Use file Command

As root, use the file command as shown below. You need to pass the individual device name to the file command.

# file -sL /dev/sda1
/dev/sda1: Linux rev 1.0 ext2 filesystem data (mounted or unclean) (large files)

# file -sL /dev/sdb1
/dev/sda1: Linux rev 1.0 ext3 filesystem data (needs journal recovery)(large files)

# file -sL /dev/sdc1
/dev/sda1: Linux rev 1.0 ext3 filesystem data (needs journal recovery)(large files)
Note: You should execute the file command as root user. If you execute as non-root user, you?ll still get some output. But, that will not display the file system type as shown below.


 
$ file -sL /dev/sda1
/dev/sda1: writable, no read permission
Method 4: View the /etc/fstab file

If a particular mount point is configured to be mounted automatically during system startup, you can identify its file system type by looking at the /etc/fstab file.

As shown in the example below, / is ext2, /home is ext3, and /u01 is ext3.

# cat /etc/fstab
LABEL=/r       /        ext2    defaults    1 1
LABEL=/home    /home    ext3    defaults    0 0
LABEL=/u01     /u01     ext3    defaults    0 0
Method 5: Use fsck Command

Execute the fsck command as shown below. This will display the file system type of a given device.

# fsck -N /dev/sda1
fsck 1.39 (29-May-2006)
[/sbin/fsck.ext2 (1) -- /] fsck.ext2 /dev/sda1

# fsck -N /dev/sdb1
fsck 1.39 (29-May-2006)
[/sbin/fsck.ext3 (1) -- /home] fsck.ext3 /dev/sdb1

# fsck -N /dev/sdc1
fsck 1.39 (29-May-2006)
[/sbin/fsck.ext3 (1) -- /u01] fsck.ext3 /dev/sdc1
    
</entry>
<entry [Fri 2012:11:02 03:31:38 EST] RENAME USB DRIVE ***DIDN'T WORK*** >

sudo mlabel -i /dev/sdC1 ::PORTUGUESE-3


    
</entry>
<entry [Wed 2012:09:26 05:59:55 EST] GET THE FILESYSTEM OF A VOLUME>

parted -l
 
    
</entry>
<entry [Mon 2012:07:02 05:11:24 EST] if .. then .. else SHELL SCRIPT CONDITIONAL ON .git DIRS>

FLAT:

if [ ! -d .git ]; then git init; fi


C-STYLE:

if [ ! -d .git ]
then
    git init
fi

    
</entry>
<entry [Tue 2012:04:03 12:13:25 EST] COPY FROM FILE ON COMMAND LINE TO CLIPBOARD>

Copy your key to your clipboard with:

xclip -sel clip < ~/.ssh/id_rsa.pub    
    
</entry>
<entry [Sat 2012:03:17 23:21:17 EST] SECURE DELETE FILES AND WIPE EMPTY SPACE>

SUMMARY

1. INSTALL SECURE DELETE
sudo aptitude install secure-delete

2. CLEAN MEMORY
srmem -v

3. WRITE OVER BLANK SPACE
sfill -v /

4. FIND SWAP LOCATION
cat /proc/swaps

5. DISABLE SWAP
sudo swapoff /dev/sda3

6. WIPE SWAP
sudo sswap /dev/sda3

7. REENABLE SWAP
sudo swapon /dev/sda3




The Secure-Delete tools are a particularly useful set of programs that use advanced techniques to permanently delete files. To install the Secure-Delete tools in Ubuntu, run the following command

sudo aptitude install secure-delete

The Secure-Delete package comes with the following commands

srm(Secure remove) - used for deleting files or directories currently on your hard disk.

smem(Secure memory wiper) - used to wipe traces of data from your computer?s memory (RAM).

sfill(Secure free space wiper) - used to wipe all traces of data from the free space on your disk.

sswap(Secure swap wiper) - used to wipe all traces of data from your swap partition.


srm - Secure remove

srm removes each specified file by overwriting, renaming, and truncat-ing it before unlinking. This prevents other people from undeleting  or recovering any information about the file from the command line.

srm,  like  every  program  that  uses the getopt function to parse its arguments, lets you use the -- option to indicate  that  all  arguments are non-options.  To remove a file called ?-f? in the current directory, you could type either ?srm -- -f? or ?srm ./-f?.

srm Syntax

srm [OPTION]? FILE?

Available Options

-d, --directory - ignored (for compatibility with rm)

-f, --force - ignore nonexistent files, never prompt

-i, --interactive - prompt before any removal

-r, -R, --recursive - remove the contents of directories recursively

-s, --simple - only overwrite with a single pass of random data

-m, --medium - overwrite the file with 7 US DoD compliant passes  (0xF6,0×00,0xFF,random,0×00,0xFF,random)

-z, --zero - after overwriting, zero blocks used by file

-n, --nounlink - overwrite file, but do not rename or unlink it

-v, --verbose - explain what is being done

--help display this help and exit

--version - output version information and exit

srm Examples

Delete a file using srm

srm myfile.txt

Delete a directory using srm

srm -r myfiles

smem - Secure memory wiper

smem is designed to delete data which may lie still in your memory (RAM) in a secure manner which can not be recovered by thiefs, law enforcement or other threats. Note that with the new SDRAMs, data will not wither away but will be kept static - it is easy to extract the necessary information! The wipe algorythm is based on the paper ?Secure Deletion of Data from Magnetic and Solid-State Memory? presented at the 6th Usenix Security Symposium by Peter Gutmann, one of the leading civilian cryptographers.

smem Syntax

smem [-f] [-l] [-l] [-v]

Available Options

-f - fast (and insecure mode): no /dev/urandom.

-l - lessens the security. Only two passes are written: the first with 0×00 and a final random one.

-l -l for a second time lessons the security even more: only one pass with 0×00 is written.

-v - verbose mode

sfill - secure free space wipe

sfill is designed to delete data which lies on available diskspace on mediums in a secure manner which can not be recovered by thiefs, law enforcement or other threats. The wipe algorythm is based on the paper ?Secure Deletion of Data from Magnetic and Solid-State Memory? presented at the 6th Usenix Security Symposium by Peter Gutmann, one of the leading civilian cryptographers.

sfill Syntax

sfill [-f] [-i] [-I] [-l] [-l] [-v] [-z] directory/mountpoint

Available Option

-f - fast (and insecure mode): no /dev/urandom, no synchronize mode.

-i - wipe only free inode space, not free disk space

-I -wipe only free disk space, not free inode space

-l -lessens the security. Only two passes are written: one mode with 0xff and a final mode with random values.

-l -l for a second time lessons the security even more: only one random pass is written.

-v - verbose mode

-z - wipes the last write with zeros instead of random data

directory/mountpoint this is the location of the file created in your filesystem. It should lie on the partition you want to write.

sswap - Secure swap wiper

sswap is designed to delete data which may lie still on your swapspace in a secure manner which can not be recovered by thiefs,  law  enforce?ment  or  other  threats.The  wipe  algorythm  is based on the paper ?Secure Deletion of Data from Magnetic  and  Solid-State  Memory?  pre?sented  at  the  6th Usenix Security Symposium by Peter Gutmann, one of the leading civilian cryptographers.

sswap Syntax

sswap [-f] [-l] [-l] [-v] [-z] swapdevice

Available Option

-f - fast (and insecure mode): no /dev/urandom, no synchronize  mode.

-l - lessens the security. Only two passes are written: one mode with 0xff and a final mode with random values.

-l  -l for a second time lessons the security even  more:  only  one pass with random values is written.

-v - verbose mode

-z - wipes the last write with zeros instead of random data

sswap Examples

Before you start using sswap you must disable your swap partition.You can determine your mounted swap devices using the following command

cat /proc/swaps

Disable swap using the following command

sudo swapoff /dev/sda3

/dev/sda3 - This is my swap device

Once your swap device is disabled, you can wipe it with sswipe using the following command

sudo sswap /dev/sda3

After completing the above command you need to re-enable swap using the following command

sudo swapon /dev/sda3

Other Tool

DBAN

Darik?s Boot and Nuke (?DBAN?) is a self-contained boot disk that securely wipes the hard disks of most computers. DBAN will automatically and completely delete the contents of any hard disk that it can detect, which makes it an appropriate utility for bulk or emergency data destruction.

You can download from here


    
</entry>
<entry [Sun 2012:03:11 13:33:01 EST] PARSE TO PRETTIFY>
    
echo '{"username":"admin","sessionId":"9999999999.9999.999","project":"Project2","workflow":"Workflow2","mode":"getStatus"}' | grep -v "Content-type: text/html" | egrep -v "^\s*$" | sed -e 's|["'\'']|"|g' | /agua/bioapps/bin/utils/pretty.pl 

</entry>
<entry [Sun 2012:03:11 11:11:03 EST] QUICK CHECK FOR HACKED SSH CONNECTIONS>

SEE TREE OF ALL PROCESSES

ps auxf


EXAMINE ALL TCP CONNECTIONS
   
netstat -vatn  


</entry>
<entry [Wed 2011:11:30 17:51:38 EST] modules CONFIGURATION IN .bash_profile>

if [ -f /share/apps/modules/global/profile.modules ]
then
        . /share/apps/modules/global/profile.modules

        # put your own module loads here                                                
        module load lsf
fi


</entry>
<entry [Tue 2011:11:29 13:58:20 EST] INCREASE BUFFER IN screen>


http://www.samsarin.com/blog/2007/03/11/gnu-screen-working-with-the-scrollback-buffer/

he number of scrollback lines can be configured in your $HOME/.screenrc file, by adding the following line:

defscrollback 5000
This sets the scrollback to 5000 lines.

You can also override this default value when starting screen using the -h [num] option, where num is the number of scrollback lines.

Finally, if you want to change the number of lines of scrollback for a single window, using the ?scrollback? command. Hit C-a (Ctrl-A) : to go to the Screen command line and type scrollback num, where num is the number of scrollback lines.

You can check the number of scrollback lines in your window. Hit C-a i to display window information. You will see a status line with information similar to the following:

(27,42)/(186,42)+20 +flow UTF-8 3(bash)
In this case, my scrollback is 20 lines (it is displayed as +20 in the output above).

Entering Scrollback Mode and Navigating
To enter scrollback hit C-a [. A status line will indicate that you've entered copy mode. To exit scrollback mode, hit the escape button.

Navigating in scrollback mode will be pretty familiar to VI users. Here are some of the most common navigation keys (taken from the screen manpage):

h -    Move the cursor left by one character
j -    Move the cursor down by one line
k -    Move the cursor up by one line
l -    Move the cursor right by one character
0 -    Move to the beginning of the current line
$ -    Move to the end of the current line.
G -    Moves to the specified line 
       (defaults to the end of the buffer).
C-u -  Scrolls a half page up.
C-b -  Scrolls a full page up.
C-d -  Scrolls a half page down.
C-f -  Scrolls the full page down.

I often use the page up and page down commands to quickly scroll back through the window's history.

In addition to traditional navigation, Screen allows you to search the scrollback buffer using the following commands:

/ -    Search forward
? -    Search backward
Search is a very useful feature. For example, you could run a script and search for keywords in the output (such as Error), without having to redirect the output.

Copy and Paste
Scrollback mode is also know as copy mode and it allows you to copy any section of text into a copy buffer. To copy text, move the cursor to the start of the text you want to copy, hit spacebar, move the cursor to the end of the text you want to copy (Screen will highlight the text to be copied as you move), and again hit spacebar. Screen will indicate the number of characters copied into the copy buffer.

To paste text, simply hit C-a ].

Copying to the Mac Clipboard
While copying and pasting in a terminal is very useful, I also find that I often want to copy some text from a terminal into my clipboard. This next tip will show you how to do this for Mac OSX, but I'm sure it can be easily modified to work with other operating systems.

Open $HOME/.screenrc and add the following line:

bind b eval "writebuf" "exec sh -c 'pbcopy < /tmp/screen-exchange'"
This line tells Screen to write its copy buffer to a temporary file (defaults to /tmp/screen-exchange), and then sends that file to pbcopy, a Mac OSX utility that copies text into the Mac clipboard. In this case, I?ve bound the command to C-a b, but you can change to best suit your own environment.

Conclusion
This wraps up my review of Screen?s scrollback buffer. I hope this tutorial is useful, especially to those that frequently work in terminal windows.


    
</entry>
<entry [Wed 2011:10:26 12:05:53 EST] THE CHROOT, ENV AND TIMEOUT UTILITIES>

23.1 `chroot': Run a command with a different root directory
============================================================

`chroot' runs a command with a specified root directory.  On many
systems, only the super-user can do this.(1) Synopses:

     chroot OPTION NEWROOT [COMMAND [ARGS]...]
     chroot OPTION

   Ordinarily, file names are looked up starting at the root of the
directory structure, i.e., `/'.  `chroot' changes the root to the
directory NEWROOT (which must exist) and then runs COMMAND with
optional ARGS.  If COMMAND is not specified, the default is the value
of the `SHELL' environment variable or `/bin/sh' if not set, invoked
with the `-i' option.  COMMAND must not be a special built-in utility
(*note Special built-in utilities::).

   The program accepts the following options.  Also see *note Common
options::.  Options must precede operands.

`--userspec=USER[:GROUP]'
     By default, COMMAND is run with the same credentials as the
     invoking process.  Use this option to run it as a different USER
     and/or with a different primary GROUP.


`--groups=GROUPS'
     Use this option to specify the supplementary GROUPS to be used by
     the new process.  The items in the list (names or numeric IDs)
     must be separated by commas.


   Here are a few tips to help avoid common problems in using chroot.
To start with a simple example, make COMMAND refer to a statically
linked binary.  If you were to use a dynamically linked executable, then
you'd have to arrange to have the shared libraries in the right place
under your new root directory.

   For example, if you create a statically linked `ls' executable, and
put it in `/tmp/empty', you can run this command as root:

     $ chroot /tmp/empty /ls -Rl /

   Then you'll see output like this:

     /:
     total 1023
     -rwxr-xr-x 1 0 0 1041745 Aug 16 11:17 ls

   If you want to use a dynamically linked executable, say `bash', then
first run `ldd bash' to see what shared objects it needs.  Then, in
addition to copying the actual binary, also copy the listed files to
the required positions under your intended new root directory.
Finally, if the executable requires any other files (e.g., data, state,
device files), copy them into place, too.

   Exit status:

     125 if `chroot' itself fails
     126 if COMMAND is found but cannot be invoked
     127 if COMMAND cannot be found
     the exit status of COMMAND otherwise

   ---------- Footnotes ----------

   (1) However, some systems (e.g., FreeBSD) can be configured to allow
certain regular users to use the `chroot' system call, and hence to run
this program.  Also, on Cygwin, anyone can run the `chroot' command,
because the underlying function is non-privileged due to lack of
support in MS-Windows.



23.2 `env': Run a command in a modified environment
===================================================

`env' runs a command with a modified environment.  Synopses:

     env [OPTION]... [NAME=VALUE]... [COMMAND [ARGS]...]
     env

   Operands of the form `VARIABLE=VALUE' set the environment variable
VARIABLE to value VALUE.  VALUE may be empty (`VARIABLE=').  Setting a
variable to an empty value is different from unsetting it.  These
operands are evaluated left-to-right, so if two operands mention the
same variable the earlier is ignored.

   Environment variable names can be empty, and can contain any
characters other than `=' and ASCII NUL.  However, it is wise to limit
yourself to names that consist solely of underscores, digits, and ASCII
letters, and that begin with a non-digit, as applications like the
shell do not work well with other names.

   The first operand that does not contain the character `=' specifies
the program to invoke; it is searched for according to the `PATH'
environment variable.  Any remaining arguments are passed as arguments
to that program.  The program should not be a special built-in utility
(*note Special built-in utilities::).

   Modifications to `PATH' take effect prior to searching for COMMAND.
Use caution when reducing `PATH'; behavior is not portable when `PATH'
is undefined or omits key directories such as `/bin'.

   In the rare case that a utility contains a `=' in the name, the only
way to disambiguate it from a variable assignment is to use an
intermediate command for COMMAND, and pass the problematic program name
via ARGS.  For example, if `./prog=' is an executable in the current
`PATH':

     env prog= true # runs 'true', with prog= in environment
     env ./prog= true # runs 'true', with ./prog= in environment
     env -- prog= true # runs 'true', with prog= in environment
     env sh -c '\prog= true' # runs 'prog=' with argument 'true'
     env sh -c 'exec "$@"' sh prog= true # also runs 'prog='

   If no command name is specified following the environment
specifications, the resulting environment is printed.  This is like
specifying the `printenv' program.

   For some examples, suppose the environment passed to `env' contains
`LOGNAME=rms', `EDITOR=emacs', and `PATH=.:/gnubin:/hacks':

   * Output the current environment.
          $ env | LC_ALL=C sort
          EDITOR=emacs
          LOGNAME=rms
          PATH=.:/gnubin:/hacks

   * Run `foo' with a reduced environment, preserving only the original
     `PATH' to avoid problems in locating `foo'.
          env - PATH="$PATH" foo

   * Run `foo' with the environment containing `LOGNAME=rms',
     `EDITOR=emacs', and `PATH=.:/gnubin:/hacks', and guarantees that
     `foo' was found in the file system rather than as a shell built-in.
          env foo

   * Run `nemacs' with the environment containing `LOGNAME=foo',
     `EDITOR=emacs', `PATH=.:/gnubin:/hacks', and `DISPLAY=gnu:0'.
          env DISPLAY=gnu:0 LOGNAME=foo nemacs

   * Attempt to run the program `/energy/--' (as that is the only
     possible path search result); if the command exists, the
     environment will contain `LOGNAME=rms' and `PATH=/energy', and the
     arguments will be `e=mc2', `bar', and `baz'.
          env -u EDITOR PATH=/energy -- e=mc2 bar baz


   The program accepts the following options.  Also see *note Common
options::.  Options must precede operands.

`-0'
`--null'
     Output a zero byte (ASCII NUL) at the end of each line, rather
     than a newline. This option enables other programs to parse the
     output of `env' even when that output would contain data with
     embedded newlines.
    
`-u NAME'
`--unset=NAME'
     Remove variable NAME from the environment, if it was in the
     environment.

`-'
`-i'
`--ignore-environment'
     Start with an empty environment, ignoring the inherited
     environment.


   Exit status:

     0   if no COMMAND is specified and the environment is output
     125 if `env' itself fails
     126 if COMMAND is found but cannot be invoked
     127 if COMMAND cannot be found
     the exit status of COMMAND otherwise



23.7 `timeout': Run a command with a time limit
===============================================

`timeout' runs the given COMMAND and kills it if it is still running
after the specified time interval.  Synopsis:

     timeout [OPTION] DURATION COMMAND [ARG]...

   COMMAND must not be a special built-in utility (*note Special
built-in utilities::).

   The program accepts the following options.  Also see *note Common
options::.  Options must precede operands.

`-k DURATION'
`--kill-after=DURATION'
     Ensure the monitored COMMAND is killed by also sending a `KILL'
     signal, after the specified DURATION.  Without this option, if the
     selected signal proves not to be fatal, `timeout' does not kill
     the COMMAND.

`-s SIGNAL'
`--signal=SIGNAL'
     Send this SIGNAL to COMMAND on timeout, rather than the default
     `TERM' signal. SIGNAL may be a name like `HUP' or a number. Also
     see *Note Signal specifications::.

   DURATION is an integer followed by an optional unit:
     `s' for seconds (the default)
     `m' for minutes
     `h' for hours
     `d' for days
   A duration of 0 disables the associated timeout.

   Exit status:

     124 if COMMAND times out
     125 if `timeout' itself fails
     126 if COMMAND is found but cannot be invoked
     127 if COMMAND cannot be found
     the exit status of COMMAND otherwise


</entry>

<entry [Fri 2011:10:21 14:42:08 EST] LINUX ERROR CODES>

What happen when you execute the Linux command, you should receive the out put.  But what happen when there is something wrong with the way you execute the command??? Usually you will receive the standard error massage... for example... the ls command below cannot do the job that ls command should do because of the basiclinuxcommand file does not exist on the current directory.... then the output from the ls -l basiclinuxcommand command below should come from error code number 2 that print No such file or directory ...
 
Command error example:
[root@fedora ~]# ls -l basiclinuxcommand   ****** Linux command example
ls: cannot access basiclinuxcommand: No such file or directory   ***** standard error output
[root@fedora ~]#
 
Find Linux error code number:
To find last error code number... execute command below
[root@fedora ~]# echo $?
2
[root@fedora ~]#
 
List of Linux Error Codes:
 
Number
 C define
Message
0
 
Success
1
EPERM
Operation not permitted
2
ENOENT
No such file or directory
3
ESRCH
No such process
4
EINTR
Interrupted system call
5
EIO
Input/output error
6
ENXIO
Device not configured
7
E2BIG
Argument list too long
8
ENOEXEC
Exec format error
9
EBADF
Bad file descriptor
10
ECHILD
No child processes
11
EAGAIN
Resource temporarily unavailable
11
EWOULDBLOCK
Resource temporarily unavailable
12
ENOMEM
Cannot allocate memory
13
EACCES
Permission denied
14
EFAULT
Bad address
15
ENOTBLK
Block device required
16
EBUSY
Device or resource busy
17
EEXIST
File exists
18
EXDEV
Invalid cross-device link
19
ENODEV
No such device
20
ENOTDIR
Not a directory
21
EISDIR
Is a directory
22
EINVAL
Invalid argument
23
ENFILE
Too many open files in system
24
EMFILE
Too many open files
25
ENOTTY
Inappropriate ioctl for device
26
ETXTBSY
Text file busy
27
EFBIG
File too large
28
ENOSPC
No space left on device
29
ESPIPE
Illegal seek
30
EROFS
Read-only file system
31
EMLINK
Too many links
32
EPIPE
Broken pipe
33
EDOM
Numerical argument out of domain
34
ERANGE
Numerical result out of range
35
EDEADLK
Resource deadlock avoided
35
EDEADLOCK
Resource deadlock avoided
36
ENAMETOOLONG
File name too long
37
ENOLCK
No locks available
38
ENOSYS
Function not implemented
39
ENOTEMPTY
Directory not empty
40
ELOOP
Too many levels of symbolic links
 
EWOULDBLOCK
(same as EAGAIN)
42
ENOMSG
No message of desired type
43
EIDRM
Identifier removed
44
ECHRNG
Channel number out of range
45
EL2NSYNC
Level 2 not synchronized
46
EL3HLT
Level 3 halted
47
EL3RST
Level 3 reset
48
ELNRNG
Link number out of range
49
EUNATCH
Protocol driver not attached
50
ENOCSI
No CSI structure available
51
EL2HLT
Level 2 halted
52
EBADE
Invalid exchange
53
EBADR
Invalid request descriptor
54
EXFULL
Exchange full
55
ENOANO
No anode
56
EBADRQC
Invalid request code
57
EBADSLT
Invalid slot
 
EDEADLOCK
(same as EDEADLK)
59
EBFONT
Bad font file format
60
ENOSTR
Device not a stream
61
ENODATA
No data available
62
ETIME
Timer expired
63
ENOSR
Out of streams resources
64
ENONET
Machine is not on the network
65
ENOPKG
Package not installed
66
EREMOTE
Object is remote
67
ENOLINK
Link has been severed
68
EADV
Advertise error
69
ESRMNT
Srmount error
70
ECOMM
Communication error on send
71
EPROTO
Protocol error
72
EMULTIHOP
Multihop attempted
73
EDOTDOT
RFS specific error
74
EBADMSG
Bad message
75
EOVERFLOW
Value too large for defined data type
76
ENOTUNIQ
Name not unique on network
77
EBADFD
File descriptor in bad state
78
EREMCHG
Remote address changed
79
ELIBACC
Can not access a needed shared library
80
ELIBBAD
Accessing a corrupted shared library
81
ELIBSCN
.lib section in a.out corrupted
82
ELIBMAX
Attempting to link in too many shared libraries
83
ELIBEXEC
Cannot exec a shared library directly
84
EILSEQ
Invalid or incomplete multibyte or wide character
85
ERESTART
Interrupted system call should be restarted
86
ESTRPIPE
Streams pipe error
87
EUSERS
Too many users
88
ENOTSOCK
Socket operation on non-socket
89
EDESTADDRREQ
Destination address required
90
EMSGSIZE
Message too long
91
EPROTOTYPE
Protocol wrong type for socket
92
ENOPROTOOPT
Protocol not available
93
EPROTONOSUPPORT
Protocol not supported
94
ESOCKTNOSUPPORT
Socket type not supported
95
EOPNOTSUPP
Operation not supported
96
EPFNOSUPPORT
Protocol family not supported
97
EAFNOSUPPORT
Address family not supported by protocol
98
EADDRINUSE
Address already in use
99
EADDRNOTAVAIL
Cannot assign requested address
100
ENETDOWN
Network is down
101
ENETUNREACH
Network is unreachable
102
ENETRESET
Network dropped connection on reset
103
ECONNABORTED
Software caused connection abort
104
ECONNRESET
Connection reset by peer
105
ENOBUFS
No buffer space available
106
EISCONN
Transport endpoint is already connected
107
ENOTCONN
Transport endpoint is not connected
108
ESHUTDOWN
Cannot send after transport endpoint shutdown
109
ETOOMANYREFS
Too many references: cannot splice
110
ETIMEDOUT
Connection timed out
111
ECONNREFUSED
Connection refused
112
EHOSTDOWN
Host is down
113
EHOSTUNREACH
No route to host
114
EALREADY
Operation already in progress
115
EINPROGRESS
Operation now in progress
116
ESTALE
Stale NFS file handle
117
EUCLEAN
Structure needs cleaning
118
ENOTNAM
Not a XENIX named type file
119
ENAVAIL
No XENIX semaphores available
120
EISNAM
Is a named type file
121
EREMOTEIO
Remote I/O error
122
EDQUOT
Disk quota exceeded
123
ENOMEDIUM
No medium found
124
EMEDIUMTYPE
Wrong medium type
125
ECANCELED
Operation Canceled
126
ENOKEY
Required key not available
127
EKEYEXPIRED
Key has expired
128
EKEYREVOKED
Key has been revoked
129
EKEYREJECTED
Key was rejected by service
130
EOWNERDEAD
Owner died
131
ENOTRECOVERABLE
State not recoverable
 
Check on the file under /usr/include/asm/errno.h that contains a complete list of basic error codes.
Example error code lists on Linux Fedora system:
[root@fedora ~]# cat /usr/include/bits/errno.h
[root@fedora ~]# cat /usr/include/asm-generic/errno.h
 


    
</entry>
<entry [Fri 2011:06:17 23:59:01 EST] NO PASSWORD FOR SUDO & SUDO FOR FILE SYSTEMS>

1. NO PASSWORD SUDO
USE visudo TO EDIT /etc/sudoers

visudo

ON UBUNTU 

NB: *** MUST BE AT END OF FILE (OR WILL BE UNDONE BY %admin LINE) ***

syoung ALL=(ALL) NOPASSWD: ALL


OTHER LINUX

syoung ALL= NOPASSWD: ALL



2. SUDO FOR FILE SYSTEMS

https://help.ubuntu.com/community/Sudoers


Simple /etc/sudoers Examples

This section presents some simple examples of how to do many commonly required tasks using the sudo utility.
Granting All Access to Specific Users
You can grant users bob and bunny full access to all privileged commands, with this sudoers entry.
bob, bunny  ALL=(ALL) ALL

This is generally not a good idea because this allows bob and bunny to use the su command to grant themselves permanent root privileges thereby bypassing the command logging features of sudo. The example on using aliases in the sudoers file shows how to eliminate this prob


Granting Access To Specific Users To Specific Files

This entry allows user peter and all the members of the group operator to gain access to all the program files in the /sbin and /usr/sbin directories, plus the privilege of running the command /usr/local/apps/check.pl. Notice how the trailing slash (/) is required to specify a directory location:
peter, %operator ALL= /sbin/, /usr/sbin, /usr/local/apps/check.pl
Notice also that the lack of any username entries within parentheses () after the = sign prevents the users from running the commands automatically masquerading as another user. This is explained further in the next example.


Granting Access to Specific Files as Another User

The sudo -u entry allows allows you to execute a command as if you were another user, but first you have to be granted this privilege in the sudoers file.
This feature can be convenient for programmers who sometimes need to kill processes related to projects they are working on. For example, programmer peter is on the team developing a financial package that runs a program called monthend as user accounts. From time to time the application fails, requiring "peter" to stop it with the /bin/kill, /usr/bin/kill or /usr/bin/pkill commands but only as user "accounts". The sudoers entry would look like this:

peter ALL=(accounts) /bin/kill, /usr/bin/kill, /usr/bin/pkill

User peter is allowed to stop the monthend process with this command:


[peter@bigboy peter]# sudo -u accounts pkill monthend


Granting Access Without Needing Passwords
This example allows all users in the group operator to execute all the commands in the /sbin directory without the need for entering a password. This has the added advantage of being more convenient to the user:

%operator ALL= NOPASSWD: /sbin/


Using Aliases in the sudoers File

Sometimes you'll need to assign random groupings of users from various departments very similar sets of privileges. The sudoers file allows users to be grouped according to function with the group and then being assigned a nickname or alias which is used throughout the rest of the file. Groupings of commands can also be assigned aliases too.
In the next example, users peter, bob and bunny and all the users in the operator group are made part of the user alias ADMINS. All the command shell programs are then assigned to the command alias SHELLS. Users ADMINS are then denied the option of running any SHELLS commands and su:
Cmnd_Alias    SHELLS = /usr/bin/sh,  /usr/bin/csh, \
                       /usr/bin/ksh, /usr/local/bin/tcsh, \
                       /usr/bin/rsh, /usr/local/bin/zsh
 
 
User_Alias    ADMINS = peter, bob, bunny, %operator
ADMINS        ALL    = !/usr/bin/su, !SHELLS


This attempts to ensure that users don't permanently su to become root, or enter command shells that bypass sudo's command logging. It doesn't prevent them from copying the files to other locations to be run. The advantage of this is that it helps to create an audit trail, but the restrictions can be enforced only as part of the company's overall security policy.


Other Examples
You can view a comprehensive list of /etc/sudoers file options by issuing the command man sudoers.


Using syslog To Track All sudo Commands

All sudo commands are logged in the log file /var/log/messages which can be very helpful in determining how user error may have contributed to a problem. All the sudo log entries have the word sudo in them, so you can easily get a thread of commands used by using the grep command to selectively filter the output accordingly.
Here is sample output from a user bob failing to enter their correct sudo password when issuing a command, immediately followed by the successful execution of the command /bin/more sudoers.

[root@bigboy tmp]# grep sudo /var/log/messages
Nov 18 22:50:30 bigboy sudo(pam_unix)[26812]: authentication failure; logname=bob uid=0 euid=0 tty=pts/0 ruser= rhost= user=bob
Nov 18 22:51:25 bigboy sudo: bob : TTY=pts/0 ; PWD=/etc ; USER=root ; COMMAND=/bin/more sudoers


Conclusion

It is important to know how to add users, not just so they can log in to our system. Most server based applications usually run via a dedicated unprivileged user account, for example the MySQL database application runs as user mysql and the Apache Web server application runs as user apache. These accounts aren't always created automatically, especially if the software is installed using TAR files.
Finally, the sudo utility provides a means of dispersing the responsibility of systems management to multiple users. You can even give some groups of users only partial access to privileged commands depending on their roles in the organization. This makes sudo a valuable part of any company's server administration and security policy.


    
</entry>
<entry [Thu 2011:06:16 04:52:13 EST] FIXED CRONTAB>

PROBLEM:

CRON SEEMS TO BE CORRECTLY CONFIGURED:
crontab -l

* *     * * *   root    /agua/0.6/bin/scripts/checkBalancers.pl > /tmp/loadbalancers.out

BUT GET NO OUTPUT:

cat /tmp/loadbalancers.out

AND GET THIS ERROR:

tail /var/log/syslog
Jun 16 04:45:01 Satellite-L355 CRON[3792]: (root) CMD (root    /agua/0.6/bin/scripts/checkBalancers.pl > /tmp/loadbalancers.out)
Jun 16 04:45:01 Satellite-L355 CRON[3791]: (CRON) error (grandchild #3792 failed with exit status 127)
Jun 16 04:45:01 Satellite-L355 CRON[3791]: (CRON) info (No MTA installed, discarding output)


DIAGNOSIS:

https://bugs.launchpad.net/ubuntu/+source/cron/+bug/151231

I'm guessing that what's going on here is this: cron starts the job with the output piped (probably indirectly) into mail. However, 'mail' doesn't exist, as I haven't installed it, so the pipe isn't created properly. However, as the output is buffered, everything continues normally until the job has produced enough output to fill the buffer. The operating system tries to write the buffer into the (broken) pipe and fails (with a signal?) which terminates the process. If little or no output is produced by the job, the buffer flush doesn't happen until the process is terminating, so from the user's point of view, it terminates normally.

Part of the usual cron-generated email contains the command executed. Consequently, for a longer command there is less space left in the unflushed buffer so less output is required from the process before it fails.

**Suggestions**

If my speculation is correct, there seem to be two main options:

  1) cron should check whether its call to the 'mail' program succeeded, and if not, simply discard the job's output, or
  2) mail should be made a prerequisite for the cron package.

For a small machine, like mine, I'm not planning to install any more packages than strictly necessary, so I'd prefer option 1). This way, cron jobs would run reliably, it's just that I wouldn't get mail notifications with output, errors, and so on.

:: WORKAROUND ::
define MAILTO to empty (MAILTO="") at the beginning of the crontab .


SOLUTION:

use MAILTO='':

crontab -l

* *     * * *   root    export MAILTO=""; /agua/0.6/bin/scripts/checkBalancers.pl > /tmp/loadbalancers.out


... AND CRON RUNS FINE:

cat /tmp/loadbalancers.out

    Completed /agua/0.6/bin/scripts/checkBalancers.pl
    Thu Jun 16 04:55:04 EDT 2011


    
</entry>
<entry [Mon 2011:04:25 00:23:25 EST] COMMAND LINE COPY TRICKS>

xargs
-----
ls -1 | grep -v "^.kde$" | xargs -n 1 -iHERE cp -R HERE destination

Basically, 'ls -1' gets all the contents of the directory, grep removes an entry of ".kde", and then xargs copies everything else.


cp
--
cp *?[!php] /home/SOURCE/ /home/COPIED/

With this command in the bash you can copy all files except php from a directory.
  	

tar
---
		--wildcards 
		--no-wildcards-match-slash

       --exclude "PATTERN"
              exclude files based upon PATTERN

       -X, --exclude-from FILE
              exclude files listed in FILE
              
</entry>

<entry [Fri 2011:04:22 15:31:00 EST] FLUSH COMMANDS TO AND DISABLE WRITING TO .bash_history>

CLEAR ANY EXISTING .bash_history AND PREVENT ANY FURTHER WRITING TO .bash_history:

export HISTSIZE=0
export HISTFILESIZE=0

How do you set these options? Either export them in your environment in your personal bash configuration file (~/.bashrc) or in the global bash configuration file (/etc/bash.bashrc). The name of the configuration files can depend from your Linux distribution and bash version (the ones included are from Debian Linux), but you can always see your particular options using man bash. So, you can add in your configuration files the parameters you want like this:
export HISTCONTROL=ignoreboth
export HISTSIZE=500


USE history -a TO FLUSH COMMANDS IN CURRENT SESSION TO .bash_history

QUESTION: I often run several terms, each of which keep an individual bash history. If I close them all, and reopen, I lose all but one of the histories. Is there some way to restore or merge the histories from multiple terminals?

ANSWER:

The commands are kept in a memory buffer and are normally written to the history file only on the session exit.

USE history -a

TO append the new history lines (history lines entered since the beginning of the current Bash session) to the history file.


ALSO:

history -c (clear the history)
history -w (write to the file ? overwrite!)


PREVENT SAVING DUPLICATE LINES:
http://www.ducea.com/2006/05/15/linux-tips-take-control-of-your-bash_history/

ADD THIS TO .bash_profile:

HISTCONTROL=ignoreboth


	
</entry>

<entry [Fri 2011:04:22 12:39:34 EST] RESET IPTABLES>

**** RESTRICTED HTTP ACCESS USING APACHE
	SEE: apps.ubuntu.xsl
	[Fri 2011:04:22 12:56:52 EST] RESTRICT ACCESS TO APACHE>  ****

**** BLOCKED INCOMING SSH WITH THE FOLLOWING RULE ****


iptables -A INPUT -p tcp -m multiport --dport 21,22 -j DROP


CURRENT IPTABLES ON HP (SHOWING BLOCKED SSH):

iptables --list

	Chain INPUT (policy ACCEPT)
	target     prot opt source               destination         
	DROP       tcp  --  anywhere             anywhere            multiport dports ftp,ssh 
	
	Chain FORWARD (policy ACCEPT)
	target     prot opt source               destination         
	
	Chain OUTPUT (policy ACCEPT)
	target     prot opt source               destination         



	
BLOCK ALL PORTS EXCEPT 21,22,80,8080
http://lists.netfilter.org/pipermail/netfilter/2003-February/042131.html

Allow nothing in, nothing out, nothing forwarded, except these four specified TCP ports, replies, and associated traffic

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
iptables -A INPUT -p tcp -m multiport --dport 21,22,80,8080 -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -I INPUT -p tcp -m multiport --dport 21,22,80,8080 -j ACCEPT
iptables -I INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -I OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -I INPUT 1 -p tcp -m multiport --dport 21,22,80,8080 -j ACCEPT
iptables -I INPUT 1 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -I OUTPUT 1 -m state --state ESTABLISHED,RELATED -j ACCEPT


UNDO

iptables -D INPUT 0
iptables -D OUTPUT 0
iptables -D FORWARD 0
iptables -D INPUT -p tcp -m multiport --dport 21,22,80,8080 -j ACCEPT
iptables -D INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -D OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT


VERIFY CHANGES (OK):

iptables --list
	Chain INPUT (policy DROP)
	target     prot opt source               destination         
	ACCEPT     tcp  --  anywhere             anywhere            multiport dports ftp,ssh,www,http-alt 
	ACCEPT     all  --  anywhere             anywhere            state RELATED,ESTABLISHED 
	
	Chain FORWARD (policy DROP)
	target     prot opt source               destination         
	
	Chain OUTPUT (policy DROP)
	target     prot opt source               destination         
	ACCEPT     tcp  --  anywhere             anywhere            tcp spt:ssh 
	ACCEPT     all  --  anywhere             anywhere            state RELATED,ESTABLISHED 



NOTES
-----

BLOCKED ALL TRAFFIC WITH THE FOLLOWING

1. CHECK ACCESS BEFORE:
sudo iptables --list
	

2. BLOCK ALL TRAFFIC
iptables -A INPUT -j DROP
iptables -A OUTPUT -j DROP


SSH
---

# BLOCK INCOMING SSH
iptables -A INPUT -p tcp -m multiport --dport 21,22 -j DROP
# BLOCK OUTGOING SSH
iptables -A OUTPUT -p tcp -m multiport --dport 21,22 -j DROP

# ALLOW INCOMING SSH
iptables -A INPUT -p tcp -m multiport --dport 21,22 -j ACCEPT
# ALLOW OUTGOING SSH
iptables -A OUTPUT -p tcp -m multiport --dport 21,22 -j ACCEPT




HTTP
----

ALLOW INCOMING
iptables -A INPUT -p tcp -m multiport --dport 80,8080 -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

ALLOW OUTGOING
iptables -A OUTPUT -p tcp -m multiport --dport 80,8080 -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT


iptables -A INPUT -p tcp -m multiport --dport 21,22,80,8080 -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -I INPUT -p tcp -m multiport --dport 21,22,80,8080 -j ACCEPT
iptables -I INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -I OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -I INPUT 1 -p tcp -m multiport --dport 21,22,80,8080 -j ACCEPT
iptables -I INPUT 1 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -I OUTPUT 1 -m state --state ESTABLISHED,RELATED -j ACCEPT



CHECK ACCESS AFTER:
sudo iptables --list


RESET TO NONE:

iptables --flush




</entry>

<entry [Wed 2011:04:20 14:26:57 EST] SET TERMINAL COLOURS>

http://dtobi.wordpress.com/2011/03/19/color-your-shell-1-colorful-ls/


TURN ON COLOURS IN .bash_profile

# turn on color file listing
export CLICOLOR=1


CHECK THE CURRENT COLURS:

echo $LS_COLORS
rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:


SET TO REDUCED COLOUR SET IN .bash_profile:

export LS_COLORS='di=33:fi=0:ln=95:pi=5:so=5:bd=5:cd=5:or=37:mi=0:ex=31:*.rpm=90'

</entry>

<entry [Mon 2011:04:04 12:54:59 EST] SET IPTABLES>

BLOCK ALL PORTS EXCEPT 21,22,80,8080
http://lists.netfilter.org/pipermail/netfilter/2003-February/042131.html

Allow nothing in, nothing out, nothing forwarded, except these four specified TCP ports, replies, and associated traffic

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
iptables -A INPUT -p tcp -m multiport --dport 21,22,80,8080 -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -I INPUT -p tcp -m multiport --dport 21,22,80,8080 -j ACCEPT
iptables -I INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -I OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -I INPUT 1 -p tcp -m multiport --dport 21,22,80,8080 -j ACCEPT
iptables -I INPUT 1 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -I OUTPUT 1 -m state --state ESTABLISHED,RELATED -j ACCEPT


UNDO

iptables -D INPUT 0
iptables -D OUTPUT 0
iptables -D FORWARD 0
iptables -D INPUT -p tcp -m multiport --dport 21,22,80,8080 -j ACCEPT
iptables -D INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -D OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT


VERIFY CHANGES (OK):

iptables --list
	Chain INPUT (policy DROP)
	target     prot opt source               destination         
	ACCEPT     tcp  --  anywhere             anywhere            multiport dports ftp,ssh,www,http-alt 
	ACCEPT     all  --  anywhere             anywhere            state RELATED,ESTABLISHED 
	
	Chain FORWARD (policy DROP)
	target     prot opt source               destination         
	
	Chain OUTPUT (policy DROP)
	target     prot opt source               destination         
	ACCEPT     tcp  --  anywhere             anywhere            tcp spt:ssh 
	ACCEPT     all  --  anywhere             anywhere            state RELATED,ESTABLISHED 



NOTES
-----

BLOCKED ALL TRAFFIC WITH THE FOLLOWING

1. CHECK ACCESS BEFORE:
sudo iptables --list
	
	Chain INPUT (policy ACCEPT)
	target     prot opt source               destination         
	
	Chain FORWARD (policy ACCEPT)
	target     prot opt source               destination         
	
	Chain OUTPUT (policy ACCEPT)
	target     prot opt source               destination  

2. BLOCK ALL TRAFFIC

iptables -A INPUT -j DROP
iptables -A OUTPUT -j DROP


3. CHECK ACCESS AFTER:
sudo iptables --list
	
	Chain INPUT (policy ACCEPT)
	target     prot opt source               destination         
	DROP       all  --  anywhere             anywhere            
	
	Chain FORWARD (policy ACCEPT)
	target     prot opt source               destination         
	
	Chain OUTPUT (policy ACCEPT)
	target     prot opt source               destination         
	DROP       all  --  anywhere             anywhere 


4. ALLOW OUTGOING SSH

iptables -D INPUT -j DROP
iptables -D OUTPUT -j DROP

sudo iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT



NOTES
-----

SCRIPT TO ALLOW ONLY SSH FROM A SPECIFIED IP ADDRESS:
http://www.cyberciti.biz/tips/linux-iptables-4-block-all-incoming-traffic-but-allow-ssh.html

notes/apps/linux/iptables-restrict-ssh.sh



</entry>


<entry [Wed Mar  2 03:35:33 EST 2011] ADDED TO .bash_profile AUTOMATICALLY SET OWNERSHIP AND PERMISSIONS>
	
find ./ -type d -exec chown syoung:www-data {} \;; find ./ -type d -exec chmod 0775 {} \;; find ./ -type f -exec chmod 0664 {} \;

	
</entry>

<entry [Wed Jan 19 17:21:44 EST 2011] HOW updatedb RUNS AUTOMATICALLY>

ON AQUARIUS, DAILY CRON JOBS RUN AT 4.02am

cat /etc/crontab 
# run-parts
01 * * * * root run-parts /etc/cron.hourly
02 4 * * * root run-parts /etc/cron.daily
22 4 * * 0 root run-parts /etc/cron.weekly
42 4 1 * * root run-parts /etc/cron.monthly


THIS DAILY CRON SCRIPT RUNS updatedb:

cat /etc/cron.daily/mlocate.cron 

	#!/bin/sh
	nodevs=$(< /proc/filesystems awk '$1 == "nodev" { print $2 }')
	renice +19 -p $$ >/dev/null 2>&1
	/usr/bin/updatedb -f "$nodevs"


how is updatedb running without a crontab entry?
http://linux.derkeiler.com/Newsgroups/comp.os.linux.misc/2009-04/msg00245.html

From: Jean-David Beyer < jeandavid8@xxxxxxxxxxx>
Date: Thu, 16 Apr 2009 20:44:51 GMT
Rahul wrote:
		The updatedb manpage says "updatedb is usually run daily by cron(8) to update the default database." 
		
		I did "crontab -l" as root but did not find a relevant entry. Neither in cron.d nor cron.daily. 
		
		How exactly does updatedb run? locate seems to be working so updatedb must be getting run everyday but I am not really sure how! How does this work?


ANSWER:

My /etc/crontab (on Red Hat Enterprise Linux 5.3) looks like this:

# M is minute to start: 00 - 59
# H is hour to start; 00 - 23
# D is day of month to start: 01 - 31
# m is month to start: 01 - 12 -- 01 is January, etc.
# d is day of week to start: 00 - 06 -- 00 is Sunday, etc.

# run-parts
# cron.daily is run Monday - Saturday.
# cron.weekly is run Sunday only.

#M H D m d user program arguments
01 * * * * root run-parts /etc/cron.hourly
04 1 * * 1-6 root run-parts /etc/cron.daily
04 3 * * 0 root run-parts /etc/cron.weekly
19 4 1 * * root run-parts /etc/cron.monthly

So let us look at /etc/cron.daily...

[/etc/cron.daily]$ ls -l
total 48
-rwxr-xr-x 1 root root 379 Dec 18 2006 0anacron
lrwxrwxrwx 1 root root 39 May 22 2008 0logwatch ->
/usr/share/logwatch/scripts/logwatch.pl
-rwxr-xr-x 1 root root 118 Dec 1 11:42 cups
-rwxr-xr-x 1 root root 180 Sep 2 2008 logrotate
-rwxr-xr-x 1 root root 418 Jul 13 2006 makewhatis.cron
-rwxr-xr-x 1 root root 137 Sep 19 2008 mlocate.cron
-rwxr-xr-x 1 root root 2181 Jun 21 2006 prelink
-rwxr-xr-x 1 root root 296 Dec 3 01:39 rpm
-rwxr-xr-x 1 root root 100 Nov 2 2007 tetex.cron
-rwxr-xr-x 1 root root 328 Aug 26 2008 tmpwatch
-rwxr-xr-- 1 root root 2629 Mar 16 05:44 zBackup.cron

Now if I look in mlocate.cron, I observe...

[/etc/cron.daily]$ cat mlocate.cron
#!/bin/sh
nodevs=$(< /proc/filesystems awk '$1 == "nodev" { print $2 }')
renice +19 -p $$ >/dev/null 2>&1
/usr/bin/updatedb -f "$nodevs"

So on my system it runs a little after 01:04 everyday.


</entry>



<entry [Fri Jan  7 09:41:31 EST 2011] man LINE EDITING>

                          LINE EDITING

        These keys can be used to edit text being entered 
        on the "command line" at the bottom of the screen.

 RightArrow                       ESC-l     Move cursor right one character.
 LeftArrow                        ESC-h     Move cursor left one character.
 CNTL-RightArrow  ESC-RightArrow  ESC-w     Move cursor right one word.
 CNTL-LeftArrow   ESC-LeftArrow   ESC-b     Move cursor left one word.
 HOME                             ESC-0     Move cursor to start of line.
 END                              ESC-$     Move cursor to end of line.
 BACKSPACE                                  Delete char to left of cursor.
 DELETE                           ESC-x     Delete char under cursor.
 CNTL-BACKSPACE   ESC-BACKSPACE             Delete word to left of cursor.
 CNTL-DELETE      ESC-DELETE      ESC-X     Delete word under cursor.
 CNTL-U           ESC (MS-DOS only)         Delete entire line.
 UpArrow                          ESC-k     Retrieve previous command line.
 DownArrow                        ESC-j     Retrieve next command line.
 TAB                                        Complete filename & cycle.
 SHIFT-TAB                        ESC-TAB   Complete filename & reverse cycle.
 CNTL-L                                     Complete filename, list all.

...skipping...
  -c  -C  ....  --clear-screen  --CLEAR-SCREEN
                  Repaint by scrolling/clearing.
  -d  ........  --dumb
                  Dumb terminal.
  -D [xn.n]  .  --color=xn.n
                  Set screen colors. (MS-DOS only)
  -e  -E  ....  --quit-at-eof  --QUIT-AT-EOF
                  Quit at end of file.
  -f  ........  --force
                  Force open non-regular files.
  -F  ........  --quit-if-one-screen
                  Quit if entire file fits on first screen.
  -g  ........  --hilite-search
                  Highlight only last match for searches.
  -G  ........  --HILITE-SEARCH
                  Don't highlight any matches for searches.
  -h [N]  ....  --max-back-scroll=[N]
                  Backward scroll limit.
  -i  ........  --ignore-case
                  Ignore case in searches that do not contain uppercase.
  -I  ........  --IGNORE-CASE
                  Ignore case in all searches.
  -j [N]  ....  --jump-target=[N]
                  Screen position of target lines.
  -J  ........  --status-column
                  Display a status column at left edge of screen.
  -k [file]  .  --lesskey-file=[file]
                  Use a lesskey file.
  -L  ........  --no-lessopen
                  Ignore the LESSOPEN environment variable.
  -m  -M  ....  --long-prompt  --LONG-PROMPT
                  Set prompt style.
  -n  -N  ....  --line-numbers  --LINE-NUMBERS
                  Use line numbers.
  -o [file]  .  --log-file=[file]
  :x                *  Examine the first (or N-th) file from the command line.
  :d                   Delete the current file from the command line list.
  =  ^G  :f            Print current file name.
 ---------------------------------------------------------------------------

                    MISCELLANEOUS COMMANDS

  -< flag>              Toggle a command line option [see OPTIONS below].
  --< name>             Toggle a command line option, by name.
  _< flag>              Display the setting of a command line option.
  __< name>             Display the setting of an option, by name.
  +cmd                 Execute the less cmd each time a new file is examined.

  !command             Execute the shell command with $SHELL.
  |Xcommand            Pipe file between current pos & mark X to shell command.
  v                    Edit the current file with $VISUAL or $EDITOR.
  V                    Print version number of "less".
 ---------------------------------------------------------------------------

                           OPTIONS

        Most options may be changed either on the command line,
        or from within less by using the - or -- command.
        Options may be given in one of two forms: either a single
        character preceded by a -, or a name preceeded by --.

  -?  ........  --help
                  Display help (from command line).
  -a  ........  --search-skip-screen
                  Forward search skips current screen.
  -b [N]  ....  --buffers=[N]
                  Number of buffers.
  -B  ........  --auto-buffers
                  Don't automatically allocate buffers for pipes.
  -c  -C  ....  --clear-screen  --CLEAR-SCREEN
                  Repaint by scrolling/clearing.
  -d  ........  --dumb
                  Dumb terminal.
  -D [xn.n]  .  --color=xn.n
                  Set screen colors. (MS-DOS only)
  -e  -E  ....  --quit-at-eof  --QUIT-AT-EOF
                  Quit at end of file.
  -f  ........  --force
                  Force open non-regular files.
  -F  ........  --quit-if-one-screen
                  Quit if entire file fits on first screen.
  -g  ........  --hilite-search
                  Highlight only last match for searches.
  -G  ........  --HILITE-SEARCH
                  Don't highlight any matches for searches.
  -h [N]  ....  --max-back-scroll=[N]
                  Backward scroll limit.
  -i  ........  --ignore-case
                  Ignore case in searches that do not contain uppercase.
  -I  ........  --IGNORE-CASE
                  Ignore case in all searches.
  -j [N]  ....  --jump-target=[N]
                  Screen position of target lines.
  -J  ........  --status-column
                  Display a status column at left edge of screen.
  -k [file]  .  --lesskey-file=[file]
                  Use a lesskey file.
  -L  ........  --no-lessopen
                  Ignore the LESSOPEN environment variable.
  -m  -M  ....  --long-prompt  --LONG-PROMPT
                  Set prompt style.
  -n  -N  ....  --line-numbers  --LINE-NUMBERS
                  Use line numbers.
  -o [file]  .  --log-file=[file]
  -c  -C  ....  --clear-screen  --CLEAR-SCREEN
                  Repaint by scrolling/clearing.
  -d  ........  --dumb
                  Dumb terminal.
  -D [xn.n]  .  --color=xn.n
                  Set screen colors. (MS-DOS only)
  -e  -E  ....  --quit-at-eof  --QUIT-AT-EOF
                  Quit at end of file.
  -f  ........  --force
                  Force open non-regular files.
  -F  ........  --quit-if-one-screen
                  Quit if entire file fits on first screen.
  -g  ........  --hilite-search
                  Highlight only last match for searches.
  -G  ........  --HILITE-SEARCH
                  Don't highlight any matches for searches.
  -h [N]  ....  --max-back-scroll=[N]
                  Backward scroll limit.
  -i  ........  --ignore-case
                  Ignore case in searches that do not contain uppercase.
  -I  ........  --IGNORE-CASE
                  Ignore case in all searches.
  -j [N]  ....  --jump-target=[N]
                  Screen position of target lines.
  -J  ........  --status-column
                  Display a status column at left edge of screen.
  -k [file]  .  --lesskey-file=[file]
                  Use a lesskey file.
  -L  ........  --no-lessopen
                  Ignore the LESSOPEN environment variable.
  -m  -M  ....  --long-prompt  --LONG-PROMPT
                  Set prompt style.
  -n  -N  ....  --line-numbers  --LINE-NUMBERS
                  Use line numbers.
  -o [file]  .  --log-file=[file]
  :x                *  Examine the first (or N-th) file from the command line.
  :d                   Delete the current file from the command line list.
  =  ^G  :f            Print current file name.
 ---------------------------------------------------------------------------

                    MISCELLANEOUS COMMANDS

  -< flag>              Toggle a command line option [see OPTIONS below].
  --< name>             Toggle a command line option, by name.
  _< flag>              Display the setting of a command line option.
  __< name>             Display the setting of an option, by name.
  +cmd                 Execute the less cmd each time a new file is examined.

  !command             Execute the shell command with $SHELL.
  |Xcommand            Pipe file between current pos & mark X to shell command.
  v                    Edit the current file with $VISUAL or $EDITOR.
  V                    Print version number of "less".
 ---------------------------------------------------------------------------

                           OPTIONS

        Most options may be changed either on the command line,
        or from within less by using the - or -- command.
        Options may be given in one of two forms: either a single
        character preceded by a -, or a name preceeded by --.

  -?  ........  --help
                  Display help (from command line).
  -a  ........  --search-skip-screen
                  Forward search skips current screen.
  -b [N]  ....  --buffers=[N]
                  Number of buffers.
  -B  ........  --auto-buffers
                  Don't automatically allocate buffers for pipes.
  -c  -C  ....  --clear-screen  --CLEAR-SCREEN
                  Repaint by scrolling/clearing.
  -d  ........  --dumb
                  Dumb terminal.
  -D [xn.n]  .  --color=xn.n
                  Set screen colors. (MS-DOS only)
  -e  -E  ....  --quit-at-eof  --QUIT-AT-EOF
                  Quit at end of file.
  -f  ........  --force
                  Force open non-regular files.
  -F  ........  --quit-if-one-screen
                  Quit if entire file fits on first screen.
  -g  ........  --hilite-search
                  Highlight only last match for searches.
  -G  ........  --HILITE-SEARCH
                  Don't highlight any matches for searches.
  -h [N]  ....  --max-back-scroll=[N]
                  Backward scroll limit.
  -i  ........  --ignore-case
                  Ignore case in searches that do not contain uppercase.
  -I  ........  --IGNORE-CASE
                  Ignore case in all searches.
  -j [N]  ....  --jump-target=[N]
                  Screen position of target lines.
  -J  ........  --status-column
                  Display a status column at left edge of screen.
  -k [file]  .  --lesskey-file=[file]
                  Use a lesskey file.
  -L  ........  --no-lessopen
                  Ignore the LESSOPEN environment variable.
  -m  -M  ....  --long-prompt  --LONG-PROMPT
                  Set prompt style.
  -n  -N  ....  --line-numbers  --LINE-NUMBERS
                  Use line numbers.
  -o [file]  .  --log-file=[file]
                  Copy to log file (standard input only).
  -O [file]  .  --LOG-FILE=[file]
                  Copy to log file (unconditionally overwrite).
  -p [pattern]  --pattern=[pattern]
                  Start at pattern (from command line).
  -P [prompt]   --prompt=[prompt]
                  Define new prompt.
  -q  -Q  ....  --quiet  --QUIET  --silent --SILENT
                  Quiet the terminal bell.
  -r  -R  ....  --raw-control-chars  --RAW-CONTROL-CHARS
                  Output "raw" control characters.
  -s  ........  --squeeze-blank-lines
                  Squeeze multiple blank lines.
  -S  ........  --chop-long-lines
                  Chop long lines.
  -t [tag]  ..  --tag=[tag]
                  Find a tag.
  -T [tagsfile] --tag-file=[tagsfile]
                  Use an alternate tags file.
  -u  -U  ....  --underline-special  --UNDERLINE-SPECIAL
                  Change handling of backspaces.
  -V  ........  --version
                  Display the version number of "less".
  -w  ........  --hilite-unread
                  Highlight first new line after forward-screen.
  -W  ........  --HILITE-UNREAD
                  Highlight first new line after any forward movement.
  -x [N[,...]]  --tabs=[N[,...]]
                  Set tab stops.
  -X  ........  --no-init
                  Don't use termcap init/deinit strings.
                --no-keypad
                  Don't use termcap keypad init/deinit strings.
  -y [N]  ....  --max-forw-scroll=[N]
                  Forward scroll limit.
  -z [N]  ....  --window=[N]
                  Set size of window.
  -" [c[c]]  .  --quotes=[c[c]]
                  Set shell quote characters.
  -~  ........  --tilde
                  Don't display tildes after end of file.
  -# [N]  ....  --shift=[N]
                  Horizontal scroll amount (0 = one half screen width)

 ---------------------------------------------------------------------------




</entry>



<entry [Thu Jan  6 14:35:45 EST 2011] SCRIPT TO PRINT DISC USAGE>




for i in `du --max-depth=1 $HOME | sort -n -r | awk '{print $1 ":" $2}'`; do size=`echo $i | awk -F: '{print $1}'`; dir=`echo $i | awk -F: '{print $NF}'`; size2=$(($size/1024)); echo "$size2 MB used by $dir"; done | head -n 10 


0 MB used by /root
0 MB used by /root/.ipython
0 MB used by /root/.matplotlib
0 MB used by /root/.ssh
0 MB used by /root/.python26_compiled
0 MB used by /root/.cache


</entry>



<entry [Tue Nov 30 11:28:29 EST 2010] BASH SHELL EMACS EDITING>




Bash Emacs Editing Mode Cheat Sheet
http://www.catonmat.net/blog/bash-emacs-editing-mode-cheat-sheet

  
When you are working in a shell you certainly don't want to waste your time using arrow keys or home/end keys to navigate around the command line. One of the most popular shells, bash - Bourne Again SHell, uses GNU's Readline library for reading the command line.

The GNU Readline library provides a set of functions for use by applications that allow users to edit command lines as they are typed in. The readline library also includes functions to maintain a list of previously-entered command lines, to recall and perhaps reedit those lines, and perform csh-like history expansion on previous commands. Both emacs and vi editing modes are available.

I have mastered both of the editing modes and have created cheat sheets for both of them (and a tiny separate one for readline's history expansion).

This is a cheat sheet for the default, emacs, editing mode.

Here are a few examples with screenshots on how to use this editing mode.

Let '[]' be the position of cursor in all the examples.

Example 1: movement basics

Suppose you are at the end of the line and want to move 3 words backwards.

$ echo word1 word2 word3 word4 word5 word6[]
If you hit M-3 followed by M-b, you would end up exactly where you wanted:

$ echo word1 word2 word3 []word4 word5 word6
An alternative is to hit M-b three times in a row: M-b M-b M-b

If you look up on the cheat sheet what M-3 does, it sets the numeric-argument to 3 which in this case acts as a counter how many times should M-b command be repeated. The M-b command calls backward-word function which does the obvious.

The numeric-argument can also be negative, which makes the argument to be applied in the opposite direction.

Other shortcuts of interest are M-f to move forward and C-a, and C-e to move to the beginning and end of line.

Example 2: command history

Suppose you used a pretty complex command a while ago and now you remember just a few arguments of this command. You want to find this command and call it with a few arguments modified.

If you hit C-r readline will put you in an incremental reverse history search mode. Typing a part of the arguments you remember, will locate the previously executed command matching the typed text. Hitting C-r again will locate any other command which matches your typed text.

To put the found command on command line for editing hit C-j.

Example 3: completing

Suppose you want to quickly list all the users on the system.

Hit C-x ~ and read-line will attempt username completion and output all the usernames to the terminal.

$ []
adm        catonmat   ftp        halt       mailnull   nobody     root       smmsp      vcsa
apache     cpanel     games      lp         mysql      nscd       rpc        sshd
bin        daemon     gopher     mail       named      operator   rpm        sync
cat        dbus       haldaemon  mailman    news       picurls    shutdown   uucp
$ []
Suppose you now want to quickly list all the users on the system starting with 'm'. You can type 'm' followed by the same C-x ~ to do that.

$ m[]
mail      mailman   mailnull  mysql
$ m[]
The other interesting completions are:

C-x / which lists possible filename completion,
C-x $ which lists possible bash variable completion,
C-x @ which lists possible hostname completion and,
C-x ! which lists possible command completion.
and

Meta-/ which does filename completion,
Meta-$ which does bash variable completion,
Meta-@ which does hostname completion and,
Meta-! which does command completion.
Example 3: killing and yanking

Suppose you have to type a-long-word-like-this a couple of times.

The easiest way to do this is to kill the word, which puts it into the kill ring. Contents of the kill ring can be accessed by yanking.

For example, type 'a-long-word-like-this' in the shell:

$ command a-long-word-like-this []
Now press C-w to kill one word backward:

$ command []
Press C-y to yank (paste) the word as many times as you wish (I pressed it 3 times here:)

$ command a-long-word-like-this a-long-word-like-this a-long-word-like-this []
The kill ring does not contain just the one latest killing. It can be filled with a number of kills and rotated with M-y shortcut.

Another example:

Suppose you typed a longer command and you noticed that part of the THE TEXT GOT TYPED IN CAPITAL LETTERS. Without knowing the readline shortcuts you would erase the text and probably type it again. Now you can use the readline keyboard shortcuts and change the case very, very quickly.

You can use the following shortcuts to accomplish this:

1) M-l (Meta-l (on your computer, probably ESC-l)) shortcut is bound to readline's downcase-word function which lowercases the current word.
2) M-b shortcut is bound to readline's backward-word function which moves the cursor one word backwards.
3) M-<number> shortcut is bound to readline's numeric-argument function which in some cases acts as how many times should the following command be repeated.

Here is a real word example, suppose we have typed the following ([] is the cursor):

$ echo the text. THE TEXT GOT TYPED IN CAPITAL LETTERS[]
To get to the beginning of 'THE' we might repetitively hit M-b seven times or we could set the numeric argument to seven by typing M-7 and then hit M-b once.

After doing this the cursor would have moved before the word 'THE':

$ echo the text. []THE TEXT GOT TYPED IN CAPITAL LETTERS
Now, by setting the numerical argument to 7 again and by pressing M-l or by pressing M-l seven times, we turn the text all in lower case.

$ echo the text. the text got typed in capital letters[]
Actually what we did in this example was not as efficient as it could have been. The numeric-argument shortcut accepts negative arguments which turn the direction of the following command in other direction. We could have turned the text in lower case by hitting M--7 and M-l

If you really want to be more productive, I suggest you play around with the commands in the cheat sheet for a while.
My previous article on being more productive on the command line was screen's cheat sheet which allows to emulate multiple terminals in a single window. You can take a look at it as well!



CHEAT SHEET
http://www.catonmat.net/download/readline-emacs-editing-mode-cheat-sheet.txt

.---------------------------------------------------------------------------.
|                                                                           |
|                        Readline Emacs Editing Mode                        |
|                         Default Keyboard Shortcut                         |
|                               Cheat Sheet                                 |
|                                                                           |
'---------------------------------------------------------------------------'
| Peteris Krumins (peter@catonmat.net), 2007.10.30                          |
| http://www.catonmat.net  -  good coders code, great reuse                 |
|                                                                           |
| Released under the GNU Free Document License                              |
'---------------------------------------------------------------------------'

 ======================== Keyboard Shortcut Summary ========================

.--------------.-------------------.----------------------------------------.
|              |                   |                                        |
| Shortcut     | Function          | Description                            |
|              |                   |                                        |
'--------------'-------------------'----------------------------------------'
| Commands for Moving:                                                      |
'--------------.-------------------.----------------------------------------'
| C-a          | beginning-of-line | Move to the beginning of line.         |
'--------------+-------------------+----------------------------------------'
| C-e          | end-of-line       | Move to the end of line.               |
'--------------+-------------------+----------------------------------------'
| C-f          | forward-char      | Move forward a character.              |
'--------------+-------------------+----------------------------------------'
| C-b          | backward-char     | Move back a character.                 |
'--------------+-------------------+----------------------------------------'
| M-f          | forward-word      | Move forward a word.                   |
'--------------+-------------------+----------------------------------------'
| M-b          | backward-word     | Move backward a word.                  |
'--------------+-------------------+----------------------------------------'
| C-l          | clear-screen      | Clear the screen leaving the current   |
|              |                   | line at the top of the screen.         |
'--------------+-------------------+----------------------------------------'
| (unbound)    | redraw-current-   | Refresh the current line.              |
|              | line              |                                        |
'--------------'-------------------'----------------------------------------'
| Commands for Changing Text:                                               |
'--------------.-------------------.----------------------------------------'
| C-d          | delete-char       | Delete one character at point.         |
'--------------+-------------------+----------------------------------------'
| Rubout       | backward-delete-  | Delete one character backward.         |
|              | char              |                                        |
'--------------+-------------------+----------------------------------------'
| C-q or C-v   | quoted-insert     | Quoted insert.                         |
'--------------+-------------------+----------------------------------------'
| M-TAB or     | tab-insert        | Insert a tab character.                |
| M-C-i        |                   |                                        |
'--------------+-------------------+----------------------------------------'
| a, b, A, 1,  | self-insert       | Insert the character typed.            |
| ...          |                   |                                        |
'--------------+-------------------+----------------------------------------'
| C-t          | transpose-chars   | Exchange the char before cursor with   |
|              |                   | the character at cursor.               |
'--------------+-------------------+----------------------------------------'
| M-t          | transpose-words   | Exchange the word before cursor with   |
|              |                   | the word at cursor.                    |
'--------------+-------------------+----------------------------------------'
| M-u          | upcase-word       | Uppercase the current word.            |
'--------------+-------------------+----------------------------------------'
| M-l          | downcase-word     | Lowercase the current word.            |
'--------------+-------------------+----------------------------------------'
| M-c          | capitalize-word   | Capitalize the current word.           |
'--------------+-------------------+----------------------------------------'
| (unbound)    | overwrite-mode    | Toggle overwrite mode.                 |
'--------------'-------------------'----------------------------------------'
| Killing and Yanking:                                                      |
'--------------.-------------------.----------------------------------------'
| C-k          | kill-line         | Kill the text from point to the end of |
|              |                   | the line.                              |
'--------------+-------------------+----------------------------------------'
| C-x Rubout   | backward-kill     | Kill backward to the beginning of the  |
|              | -line             | line.                                  |
'--------------+-------------------+----------------------------------------'
| C-u          | unix-line-discard | Kill backward from point to the        |
|              |                   | beginning of the line.                 |
'--------------+-------------------+----------------------------------------'
| M-d          | kill-word         | Kill from point to the end of the      |
|              |                   | current word.                          |
'--------------+-------------------+----------------------------------------'
| M-Rubout     | backward-kill-word| Kill the word behind point.            |
'--------------+-------------------+----------------------------------------'
| C-w          | unix-word-rubout  | Kill the word behind point, using      |
|              |                   | white space as a word boundary.        |
'--------------+-------------------+----------------------------------------'
| M-\          | delete-           | Delete all spaces and tabs around      |
|              | horizontal-space  | point.                                 |
'--------------+-------------------+----------------------------------------'
| C-y          | yank              | Yank the top of the kill ring into the |
|              |                   | buffer at point.                       |
'--------------+-------------------+----------------------------------------'
| M-y          | yank-pop          | Rotate the kill ring, and yank the new |
|              |                   | top                                    |
'--------------+-------------------+----------------------------------------'
| (unbound)    | kill-whole-line   | Kill all characters on the current     |
|              |                   | line                                   |
'--------------+-------------------+----------------------------------------'
| (unbound)    | kill-region       | Kill the text between the point and    |
|              |                   | mark.                                  |
'--------------+-------------------+----------------------------------------'
| (unbound)    | copy-region-as-   | Copy the text in the region to the     |
|              | kill              | kill buffer.                           |
'--------------+-------------------+----------------------------------------'
| (unbound)    | copy-backward-    | Copy the word before point to the kill |
|              | word              | buffer.                                |
'--------------+-------------------+----------------------------------------'
| (unbound)    | copy-forward-word | Copy the word following point to the   |
|              |                   | kill buffer.                           |
'--------------'-------------------'----------------------------------------'
| Keyboard Macros:                                                          |
'--------------.-------------------.----------------------------------------'
| C-x (        | start-kbd-macro   | Begin saving the chars typed into the  |
|              |                   | current keyboard macro.                |
'--------------+-------------------+----------------------------------------'
| C-x )        | end-kbd-macro     | End saving the chars typed into the    |
|              |                   | current keyboard macro.                |
'--------------+-------------------+----------------------------------------'
| C-x e        | call-last-kbd-    | Re-execute the last keyboard macro     |
|              | macro             | defined.                               |
'--------------'-------------------'----------------------------------------'
| Commands for Manipulating the History:                                    |
'--------------.-------------------.----------------------------------------'
| Return       | accept-line       | Accept the line regardless of where    |
|              |                   | the cursor is.                         |
'--------------+-------------------+----------------------------------------'
| C-p          | previous-history  | Fetch the previous command from the    |
|              |                   | history list.                          |
'--------------+-------------------+----------------------------------------'
| C-n          | next-history      | Fetch the next command from the        |
|              |                   | history list.                          |
'--------------+-------------------+----------------------------------------'
| M-<          | beginning-of-     | Move to the first line in the history. |
|              | history           |                                        |
'--------------+-------------------+----------------------------------------'
| M->          | end-of-history    | Move to the end of the input history   |
'--------------+-------------------+----------------------------------------'
| C-r          | reverse-search-   | Search backward starting at the        |
|              | history           | current line (incremental).            |
'--------------+-------------------+----------------------------------------'
| C-s          | forward-search-   | Search forward starting at the current |
|              | history           | line (incremental).                    |
'--------------+-------------------+----------------------------------------'
| M-p          | non-incremental-  | Search backward using non-incremental  |
|              | reverse-search-   | search.                                |
|              | history           |                                        |
'--------------+-------------------+----------------------------------------'
| M-n          | non-incremental-  | Search forward using non-incremental   |
|              | forward-search-   | search.                                |
|              | history           |                                        |
'--------------+-------------------+----------------------------------------'
| M-C-y        | yank-nth-arg      | Insert the n-th argument to the        |
|              |                   | previous command at point.             |
'--------------+-------------------+----------------------------------------'
| M-. M-_      | yank-last-arg     | Insert the last argument to the        |
|              |                   | previous command.                      |
'--------------+-------------------+----------------------------------------'
| (unbound)    | history-search-   | Search forward for a string between    |
|              | backward          | start of line and point.               |
'--------------+-------------------+----------------------------------------'
| (unbound)    | history-search-   | Search backward for a string between   |
|              | forward           | start of line and point.               |
'--------------'-------------------'----------------------------------------'
| Completing:                                                               |
'--------------.-------------------.----------------------------------------'
| TAB          | complete          | Attempt to perform completion on the   |
|              |                   | text before point.                     |
'--------------+-------------------+----------------------------------------'
| M-?          | possible-         | List the possible completions of the   |
|              | completions       | text before point.                     |
'--------------+-------------------+----------------------------------------'
| M-*          | insert-           | Insert all completions of the text     |
|              | completions       | before point generated by              |
|              |                   | possible-completions.                  |
'--------------+-------------------+----------------------------------------'
| (unbound)    | menu-complete     | Similar to complete but replaces the   |
|              |                   | word with the first match.             |
'--------------+-------------------+----------------------------------------'
| (unbound)    | delete-char-or-   | Deletes the car if not at the          |
|              | list              | beginning of line or acts like         |
|              |                   | possible-completions at the end of     |
|              |                   | the line.                              |
'--------------'-------------------'----------------------------------------'
| Miscellaneous:                                                            |
'--------------.-------------------.----------------------------------------'
| C-x C-r      | re-read-init-file | Read and execute the contents of       |
|              |                   | inputrc file.                          |
'--------------+-------------------+----------------------------------------'
| C-g          | abort             | Abort the current editing command and  |
|              |                   | ring the terminal's bell.              |
'--------------+-------------------+----------------------------------------'
| M-a, M-b,    | do-uppercase-     | If the metafield char 'x' is lowercase |
| M-x, ...     | version           | run the command that is bound to       |
|              |                   | uppercase char.                        |
'--------------+-------------------+----------------------------------------'
| ESC          | prefix-meta       | Metafy the next character typed.       |
|              |                   | For example, ESC-p is equivalent to    |
|              |                   | Meta-p                                 |
'--------------+-------------------+----------------------------------------'
| C-_ or       | undo              | Incremental undo, separately           |
| C-x C-u      |                   | remembered for each line.              |
'--------------+-------------------+----------------------------------------'
| M-r          | revert-line       | Undo all changes made to this line.    |
'--------------+-------------------+----------------------------------------'
| M-&          | tilde-expand      | Perform tilde expansion on the current |
|              |                   | word.                                  |
'--------------+-------------------+----------------------------------------'
| C-@ or       | set-mark          | Set the mark to the point.             |
| M-< space>    |                   |                                        |
'--------------+-------------------+----------------------------------------'
| C-x C-x      | exchange-point-   | Swap the point with the mark.          |
|              | and-mark          |                                        |
'--------------+-------------------+----------------------------------------'
| C-]          | character-search  | Move to the next occurance of current  |
|              |                   | character under cursor.                |
'--------------+-------------------+----------------------------------------'
| M-C-]        | character-search- | Move to the previous occurrence of     |
|              | backward          | current character under cursor.        |
'--------------+-------------------+----------------------------------------'
| M-#          | insert-comment    | Without argument line is commented,    |
|              |                   | with argument uncommented (if it was   |
|              |                   | commented).                            |
'--------------+-------------------+----------------------------------------'
| C-e          | emacs-editing-    | When in vi mode, switch to emacs mode. |
|              | mode              |                                        |
'--------------+-------------------+----------------------------------------'
| M-C-j        | vi-editing-mode   | When in emacs mode, switch to vi mode. |
'--------------+-------------------+----------------------------------------'
| M-0, M-1,    | digit-argument    | Specify the digit to the argument.     |
| ..., M--     |                   | M-- starts a negative argument.        |
'--------------+-------------------+----------------------------------------'
| (unbound)    | dump-functions    | Print all of the functions and their   |
|              |                   | key bindings.                          |
'--------------+-------------------+----------------------------------------'
| (unbound)    | dump-variables    | Print all of the settable variables    |
|              |                   | and their values.                      |
'--------------+-------------------+----------------------------------------'
| (unbound)    | dump-macros       | Print all of the key sequences bound   |
|              |                   | to macros.                             |
'--------------+-------------------+----------------------------------------'
| (unbound)    | universal-        | Either sets argument or multiplies the |
|              | argument          | current argument by 4.                 |
'--------------'-------------------'----------------------------------------'


 ===========================================================================

.---------------------------------------------------------------------------.
| Peteris Krumins (peter@catonmat.net), 2007.10.30                          |
| http://www.catonmat.net  -  good coders code, great reuse                 | 
|                                                                           |
| Released under the GNU Free Document License                              |
'---------------------------------------------------------------------------'



</entry>
<entry [Sun Nov  7 20:37:54 EST 2010] CHANGE HOSTNAME ON CENTOS>


http://www.javamonamour.org/2009/06/centos-change-hostname-and-ips.html

CHANGE HOSTNAME
---------------

echo “newhostname” > /proc/sys/kernel/hostname

or

sysctl kernel.hostname=NEW_HOSTNAME

and edit /etc/sysconfig/network to set HOSTNAME to the value you need

see here

http://www.ducea.com/2006/08/07/how-to-change-the-hostname-of-a-linux-system/

also, run system-config-network and change hostname under DNS tab,
logout then login again

finally, add the new hostname to the hosts file





CHANGE IP
---------


ifconfig add eth0 192.168.63.129

see http://dhika.cikul.or.id/how-to-change-centos-ip-address.html

quote:
ifconfig command create temporary IP address change, if you reboot your server, you will see that your IP still not change. If you want make permanent ip change, you must edit files under /etc/sysconfig/network-scripts/
unquote.


and edit your /etc/hosts file

cd /etc/sysconfig/network-scripts/
vi ifcfg-eth0

DEVICE=eth0
BOOTPROTO=static
IPADDR=172.17.17.10
NETMASK=255.255.255.248
ONBOOT=yes

cp ifcfg-eth0:0
and edit correspondingly
service network restart

MAKE SURE your NETMASK is the same as the host machine, otherwise the 2 won't be able to communicate....

here the instructions are more precise:

http://www.xenocafe.com/tutorials/linux/redhat/bind_multiple_ip_addresses_to_single_nic/index.php


</entry>
<entry [Thu Aug 19 10:57:03 EDT 2010] FILENAME MATCHES AND REPLACEMENTS WITH SHELL SCRIPT>


#### CREATE A SUBDIR FOR EACH SQUASHED CHROMOSOME AND LINK SQUASHED FILES
cd /nethome/bioinfo/data/sequence/chromosomes/human/hg19/eland
FILES="*";
for FILE in $FILES;
do

    CHROM=$(echo $FILE | egrep "^chr[0-9XYM]+.2bpb");
    if [ "$CHROM" != "" ]; then
        CHROM=${CHROM/.2bpb/};
        echo MAKING DIR: $CHROM;
        mkdir $CHROM
        ln -s `pwd`/$CHROM.2bpb `pwd`/$CHROM/$CHROM.2bpb
        ln -s `pwd`/$CHROM.vld `pwd`/$CHROM/$CHROM.vld
    fi;

done;



</entry>



<entry [Thu Aug 19 10:57:03 EDT 2010] UNDERSTANDING /etc/fstab>



< How to edit and understand /etc/fstab - 1.1 >

There's a file called /etc/fstab in your Linux system. Learn what its contents mean and how it's used in conjunction with the mount command. When you learn to understand the fstab file, you'll be able to edit its contents yourself, too.
In this tuXfile I assume you already know how to mount filesystems and partitions with the mount command. If you don't, I suggest reading the Mounting tuXfile before reading this one.

< What is fstab and why it's useful >

fstab is a configuration file that contains information of all the partitions and storage devices in your computer. The file is located under /etc, so the full path to this file is /etc/fstab.
/etc/fstab contains information of where your partitions and storage devices should be mounted and how. If you can't access your Windows partition from Linux, aren't able to mount your CD or write to your floppy as a normal user, or have problems with your CD-RW, you probably have a misconfigured /etc/fstab file. So, you can usually fix your mounting problems by editing your fstab file.
/etc/fstab is just a plain text file, so you can open and edit it with any text editor you're familiar with. However, note that you must have the root privileges before editing fstab. So, in order to edit the file, you must either log in as root or use the su command to become root.

< Overview of the file >

Of course everybody has a bit different /etc/fstab file because the partitions, devices and their properties are different on different systems. But the basic structure of fstab is always the same. Here's an example of the contents of /etc/fstab:
/dev/hda2	/	ext2	defaults	1 1
/dev/hdb1	/home	ext2	defaults	1 2
/dev/cdrom	/media/cdrom	auto	ro,noauto,user,exec	0 0
/dev/fd0	/media/floppy	auto	rw,noauto,user,sync	0 0
proc	/proc	proc	defaults	0 0
/dev/hda1	swap	swap	pri=42	0 0
What does all this gibberish mean? As you see, every line (or row) contains the information of one device or partition. The first column contains the device name, the second one its mount point, third its filesystem type, fourth the mount options, fifth (a number) dump options, and sixth (another number) filesystem check options. Let's take a closer look at this stuff.

< 1st and 2nd columns: Device and default mount point >

The first and second columns should be pretty straightforward. They tell the mount command exactly the same things that you tell mount when you mount stuff manually: what is the device or partition, and what is the mount point. The mount point specified for a device in /etc/fstab is its default mount point. That is the directory where the device will be mounted if you don't specify any other mount point when mounting the device.
Like you already learned from the Mounting tuXfile, most Linux distros create special directories for mount points. Most distros create them under /mnt, but some (at least SuSE) under /media. As you probably noticed when looking at the example fstab, I use SuSE's mount points as an example.
What does all this mean? If I type the following command:
$ mount /dev/fd0
... my floppy will be mounted in /media/floppy, because that's the default mount point specified in /etc/fstab. If there is no entry for /dev/fd0 in my fstab when I issue the command above, mount gets very confused because it doesn't know where to mount the floppy.
You can freely change the default mount points listed in /etc/fstab if you're not satisfied with the defaults your distro has given you. Just make sure the mount point is a directory that already exists on your system. If it doesn't, simply create it.
Some partitions and devices are also automatically mounted when your Linux system boots up. For example, have a look at the example fstab above. There are lines that look like this:
/dev/hda2 / ext2 defaults 1 1
/dev/hdb1 /home ext2 defaults 1 2
As you've learned, these lines mean that /dev/hda2 will be mounted to / and /dev/hdb1 to /home. This is done automatically when your Linux system boots up... if it wouldn't, you'd have a hard time using your cool Linux system because all the programs you use are in / and you wouldn't be able to run them if / wasn't mounted! But how does the system know where you want to mount /dev/hda2 and /dev/hdb1? By looking at the /etc/fstab file of course.

< 3rd column: Filesystem type >

The third column in /etc/fstab specifies the filesystem type of the device or partition. Many different filesystems are supported but we'll take a look at the most common ones only.
ext2 and ext3 Very likely your Linux partitions are Ext3. Ext2 used to be the standard filesystem for Linux, but these days, Ext3 and ReiserFS are usually the default filesystems for almost every new Linux distro. Ext3 is a newer filesystem type that differs from Ext2 in that it's journaled, meaning that if you turn the computer off without properly shutting down, you shouldn't lose any data and your system shouldn't spend ages doing filesystem checks the next time you boot up.
reiserfs Your Linux partitions may very well be formatted as ReiserFS. Like Ext3, ReiserFS is a journaled filesystem, but it's much more advanced than Ext3. Many Linux distros (including SuSE) have started using ReiserFS as their default filesystem for Linux partitions.
swap The filesystem name is self-explanatory. The filesystem type "swap" is used in your swap partitions.
vfat and ntfs Your USB stick is most likely formatted as Vfat (more widely known as FAT32). Your Windows partitions are probably either Vfat or NTFS. The 9x series (95, 98, ME) all use Vfat, and the NT series (NT, 2000, XP, Vista, 7) use NTFS but they may be formatted as Vfat, too.
auto No, this isn't a filesystem type :-) The option "auto" simply means that the filesystem type is detected automatically. If you take a look at the example fstab above, you'll see that the floppy and CD-ROM both have "auto" as their filesystem type. Why? Their filesystem type may vary. One floppy might be formatted for Windows and the other for Linux's Ext2. That's why it's wise to let the system automatically detect the filesystem type of media such as floppies and cdroms.

< 4th column: Mount options >

The fourth column in fstab lists all the mount options for the device or partition. This is also the most confusing column in the fstab file, but knowing what some of the most common options mean, saves you from a big headache. Yes, there are many options available, but I'll take a look at the most widely used ones only. For more information, check out the man page of mount.
auto and noauto With the auto option, the device will be mounted automatically (at bootup, just like I told you a bit earlier, or when you issue the mount -a command). auto is the default option. If you don't want the device to be mounted automatically, use the noauto option in /etc/fstab. With noauto, the device can be mounted only explicitly.
user and nouser These are very useful options. The user option allows normal users to mount the device, whereas nouser lets only the root to mount the device. nouser is the default, which is a major cause of headache for new Linux users. If you're not able to mount your cdrom, floppy, Windows partition, or something else as a normal user, add the user option into /etc/fstab.
exec and noexec exec lets you execute binaries that are on that partition, whereas noexec doesn't let you do that. noexec might be useful for a partition that contains binaries you don't want to execute on your system, or that can't even be executed on your system. This might be the case of a Windows partition.
exec is the default option, which is a good thing. Imagine what would happen if you accidentally used the noexec option with your Linux root partition...
ro Mount the filesystem read-only.
rw Mount the filesystem read-write. Again, using this option might cure the headache of many new Linux users who are tearing their hair off because they can't write to their floppies, Windows partitions, or something else.
sync and async How the input and output to the filesystem should be done. sync means it's done synchronously. If you look at the example fstab, you'll notice that this is the option used with the floppy. In plain English, this means that when you, for example, copy a file to the floppy, the changes are physically written to the floppy at the same time you issue the copy command.
However, if you have the async option in /etc/fstab, input and output is done asynchronously. Now when you copy a file to the floppy, the changes may be physically written to it long time after issuing the command. This isn't bad, and may sometimes be favorable, but can cause some nasty accidents: if you just remove the floppy without unmounting it first, the copied file may not physically exist on the floppy yet!
async is the default. However, it may be wise to use sync with the floppy, especially if you're used to the way it's done in Windows and have a tendency to remove floppies before unmounting them first.
defaults Uses the default options that are rw, suid, dev, exec, auto, nouser, and async.

< 5th and 6th columns: Dump and fsck options >

Dump and, uh, what options? Well, dump is a backup utility and fsck is a filesystem check utility. I won't discuss them in great length here (they would both need their own tuXfile), but I'll mention them, because otherwise you'd spend the rest of the day wondering what on God's green Earth do these things mean.
The 5th column in /etc/fstab is the dump option. Dump checks it and uses the number to decide if a filesystem should be backed up. If it's zero, dump will ignore that filesystem. If you take a look at the example fstab, you'll notice that the 5th column is zero in most cases.
The 6th column is a fsck option. fsck looks at the number in the 6th column to determine in which order the filesystems should be checked. If it's zero, fsck won't check the filesystem.

< Example /etc/fstab entries >

As an example, we'll take a look at a couple of fstab entries that have been a source of endless frustration for new Linux users: floppy and CD-ROM (although these days floppies aren't that important anymore).
/dev/fd0 /media/floppy auto rw,noauto,user,sync 0 0
This line means that the floppy is mounted to /media/floppy by default and that its filesystem type is detected automatically. This is useful because the type of the floppy may wary. Note especially the rw and user options: they must be there if you want to be able to mount and write to the floppy as a normal user. If you have trouble with this, check your fstab file to see if these options are there. Also note the sync option. It can be async just as well, but it's sync because of reasons discussed a bit earlier.
/dev/cdrom /media/cdrom auto ro,noauto,user,exec 0 0
Note, again, the user option that enables you to mount the CD as a normal user. The CD-ROM has the ro option because it's no use mounting a CD-ROM read-write because you wouldn't be able to write to it anyway. Also note the exec option. It's especially useful if you'd like to be able to execute something from your CD.
Also note that the noauto option is used with the floppy and CD-ROM. This means that they won't be automatically mounted when your Linux system boots up. This is useful for removable media, because sometimes there won't be any floppy or CD-ROM when you boot up your system, so there isn't any reason to try to mount something that doesn't even exist.


</entry>
<entry [Thu Aug 19 10:57:03 EDT 2010] USING xargs TO PASS ARRAY OF ARGUMENTS TO COMMAND>

1. LIST DETAILS OF ALL FILES WITH '_' IN NAME:

cd /scratch/syoung/base/pipeline/solid/NA18507/SRP000239/SRX000600 | grep -v _
ls | grep -v _ | grep fastq | xargs ls -al

	-rw-rw-rw- 1 syoung root     316 Aug 12 01:50 SRR003845.fastq.gz
	-rw-rw-rw- 1 syoung root     863 Aug 12 01:53 SRR003848.fastq.gz
	-rw-rw-rw- 1 syoung root  892065 Aug 12 02:16 SRR004117.fastq.gz
	-rw-rw-rw- 1 syoung root   71737 Aug 12 02:20 SRR004121.fastq.gz
	-rw-rw-rw- 1 syoung root  451514 Aug 12 02:28 SRR004187.fastq.gz
	-rw-rw-rw- 1 syoung root  117880 Aug 12 02:39 SRR004207.fastq.gz
	-rw-rw-rw- 1 syoung root   42453 Aug 12 02:41 SRR004210.fastq.gz
	-rw-rw-rw- 1 syoung root   50252 Aug 12 02:43 SRR004812.fastq.gz
	-rw-rw-rw- 1 syoung root   28536 Aug 12 02:44 SRR004813.fastq.gz
	-rw-rw-rw- 1 syoung root 1281529 Aug 12 02:54 SRR004818.fastq.gz
	-rw-rw-rw- 1 syoung root 5470413 Aug 12 04:07 SRR004862.fastq.gz

WHERE FILES ARE HERE:

ls /scratch/syoung/base/pipeline/solid/NA18507/SRP000239/SRX000600 | grep -v _

	fasta
	singles
	SRR003845.fastq.gz
	SRR003848.fastq.gz
	SRR004117.fastq.gz
	SRR004121.fastq.gz
	SRR004187.fastq.gz
	SRR004207.fastq.gz
	SRR004210.fastq.gz
	SRR004812.fastq.gz
	SRR004813.fastq.gz
	SRR004818.fastq.gz
	SRR004862.fastq.gz



2. MOVE SINGLE READ FASTQ FILES TO singles DIRECTORY


ls | grep -v _ | grep fastq | xargs -L1 -p -IMYFILES mv MYFILES singles

	-rw-rw-rw- 1 syoung root     316 Aug 12 01:50 SRR003845.fastq.gz
	-rw-rw-rw- 1 syoung root     863 Aug 12 01:53 SRR003848.fastq.gz
	-rw-rw-rw- 1 syoung root  892065 Aug 12 02:16 SRR004117.fastq.gz
	-rw-rw-rw- 1 syoung root   71737 Aug 12 02:20 SRR004121.fastq.gz
	-rw-rw-rw- 1 syoung root  451514 Aug 12 02:28 SRR004187.fastq.gz
	-rw-rw-rw- 1 syoung root  117880 Aug 12 02:39 SRR004207.fastq.gz
	-rw-rw-rw- 1 syoung root   42453 Aug 12 02:41 SRR004210.fastq.gz
	-rw-rw-rw- 1 syoung root   50252 Aug 12 02:43 SRR004812.fastq.gz
	-rw-rw-rw- 1 syoung root   28536 Aug 12 02:44 SRR004813.fastq.gz
	-rw-rw-rw- 1 syoung root 1281529 Aug 12 02:54 SRR004818.fastq.gz
	-rw-rw-rw- 1 syoung root 5470413 Aug 12 04:07 SRR004862.fastq.gz


3. MOVE SINGLE READ INFO, FASTA AND QUAL FILES TO singles DIRECTORY



cd /scratch/syoung/base/pipeline/solid/NA18507/SRP000239/SRX000600/fasta
mkdir singles
ls | grep -v _ | grep fasta | xargs -L1 -IMYFILES mv MYFILES singles



NOTES
-----

http://en.wikipedia.org/wiki/Xargs

xargs is a command on Unix and most Unix-like operating systems. It is useful when one wants to pass a large number of arg
uments to a command. Until Linux kernel 2.6.23, arbitrarily long lists of parameters could not be passed to a command [1], so xargs will break the list of arguments into sublists small enough to be acceptable.

For example, commands like:

rm /path/*

or

rm `find /path -type f`

will fail with an error message of "Argument list too long" if there are too many files in /path.

However this version (functionally equivalent to rm `find /path -type f`) will not fail:

 find /path -type f -print0 | xargs -0 rm



#### find . -type f -name _ -exec ls -al '{}' \;


In this example, find feeds the input of xargs with a long list of file names. xargs then splits this list into sublists and calls rm once for every sublist. This is more efficient than this functionally equivalent version:

find /path -type f -exec rm '{}' \;

which calls rm once for every single file. Note however that with modern versions of find, the following variant does the same thing as the xargs version:
 find /path -type f -exec rm '{}' +
xargs often covers the same functionality as the backquote feature of many shells, but is more flexible and often also safer, especially if there are blanks or special characters in the input. It is a good companion for commands that output long lists of files like find, locate and grep, but only if you use -0 as xargs without -0 deals badly with file names containing ', " and space. GNU Parallel is the perfect companion to find, locate and grep if file names may contain ', " and space (newline still requires -0).



</entry>



<entry [Tue Jun 29 21:06:38 EDT 2010] REMOVE NUMBERED DIRECTORIES>




DIRS="*"
for DIR in $DIRS;
do
    SPLITDIR=$(echo $DIR | egrep "^[0-9]+" ); 
    if [ "$SPLITDIR" != "" ]; then
        echo SPLITDIR: `pwd`/$SPLITDIR;
		rm -fr `pwd`/$SPLITDIR
    fi;
done;




</entry>



<entry [Thu May 13 02:36:22 EDT 2010] CREATE STATICALLY LINKED APPLICATIONS CONTAINING ALL DEPENDENCIES>




COMMERCIAL TOOL
http://magicErmine.com

DISCUSSION OF STATICALLY LINKED APPS
http://www.cplusplus.com/forum/general/7401/





</entry>



<entry [Thu May 13 02:36:22 EDT 2010] SYNCHRONISE DIRECTORIES ON TWO MACHINES>

http://xahlee.org/UnixResource_dir/unix_tips.html


How to 2-way sync local dir and remote machine

Use Unison. Both machines must have unison installed. The “rsync” tool does just one way sync (overwritting any changes on the remote machine), while “unison” asks you for each changed file (or non-existant file/dir) which direction you want the update be.

Here's a sample command i use.

Synching to a remote server: unison -servercmd /sw/bin/unison /Users/xah/uci-server/vmm ssh://xahlee@virtualmathmuseum.org//Library/WebServer/Documents/vmm

In this server, it contains works done by other people, so i can't just update it one-way with rsync.

The “-servercmd /sw/bin/unison” specifies the path of the unison command on the server. (needed when it is not in the default search path on remote machine's user account) The “/Users/xah/uci-server/vmm” is the local dir. The “ssh://xahlee@virtualmathmuseum.org//Library/WebServer/Documents/vmm” specifies the remote dir, remote machine's domain name, login account, and the protocol to use.

Synching my PC and Mac: unison -servercmd /usr/bin/unison c:/Users/xah/web ssh://xah@169.254.145.104//Users/xah/web

If you are syncing from Mac and Windows, you many want to add “-rsrc false”, which will ignore resource fork and file type info. If you want to ignore file permissions, you can use “-perms 0”

Note that unison is picky about the unison version on your machine and the version on the remote machine. For example, if on your machine you have 2.27, on remote server you have 2.17, then when you try to sync the 2 machines, then unison will complain and stop. (it'll say something to the effect of “expected header is 2.27 but got 2.17”) Typically, you install more than one version of unison on your machine (or on the remote machine if you can).

Unison has builtin doc. Type “unison -help” or “unison -doc topics”.

Note that Unison as of version 2.27, it does not support file names containing Unicode chars. So, if you have files with Chinese chars, math symbols, etc, Unison will still work but the result file name will be gibberish.



</entry>



<entry [Tue Mar 30 17:42:05 EDT 2010] LIST FILES IN DIRECTORY ON COMMAND LINE AND RUN ACTION IN LOOP>



1. GET DIRS IN CURRENT DIRECTORY


DIRS="1*"
echo $DIRS
		1 10 100 11 12 13 14 15 16 17 18 19


GET ALL NUMERIC-ONLY SUBDIRS:


DIRS=`ls | grep "^[0-9]"`
echo $DIRS

		1 10 100 11 12 13 14 15 16 17 18 19 2 20 21 22 23 24 25 26 27 28 29 3 30 31 32 33 34 35 36 37 38 39 4 40 41 42 43 44 45 46 47 48 49 5 50 51 52 53 54 55 56 57 58 59 6 60 61 62 63 64 65 66 67 68 69 7 70 71 72 73 74 75 76 77 78 79 8 80 81 82 83 84 85 86 87 88 89 9 90 91 92 93 94 95 96 97 98 99


2. LOOP THROUGH DIRS DOING ACTION

for DIR in "$DIRS"; do cp -r $DIR /nethome/syoung/base/pipeline/SRA/NA18507/eland/eland1; done




NOTES
=====

for f in "$FILES"; do echo "Processing $f file.."; done

Sample shell script to loop through all files

#!/bin/bash
FILES="*"
for f in "$FILES"
do
  echo "Processing $f file..."
  # take action on each file. $f store current file name
  cat $f
done



</entry>



<entry [Tue Mar 30 17:42:05 EDT 2010] USING lftp TO AUTOMATE FTP DOWNLOADS>



EXAMPLE

lftp -c "set ftp:list-options -a;
open ftp://user:password@your.ftp.com; 
lcd ./web;
cd /web/public_html;
mirror --reverse --delete --use-cache --verbose --allow-chown  
--allow-suid --no-umask --parallel=2 --exclude-glob .svn"


	
As written by esel

lftp is very good tool.

I suggest you to parametrize the script, and make use of the

exclude-glob
options, that excludes filenames using the glob feature (*,? ..) of your shell:

#!/bin/bash    
HOST="your.ftp.host.dom"
USER="username"
PASS="password"
LCD="/path/of/your/local/dir"
RCD="/path/of/your/remote/dir"
lftp -c "set ftp:list-options -a;
open ftp://$USER:$PASS@$HOST; 
lcd $LCD;
cd $RCD;
mirror --reverse \
       --delete \
       --verbose \
       --exclude-glob a-dir-to-exclude/ \
       --exclude-glob a-file-to-exclude \
       --exclude-glob a-file-group-to-exclude* \
       --exclude-glob other-files-to-esclude"




NOTE: MAKE SURE YOU'RE NOT IN YOUR HOME FOLDER WHEN TESTING!!!! OR YOU MAY DELETE IMPORTANT FILES


E.G., I RAN THIS:

lftp -c "set ftp:list-options -a;
open http://hgdownload.cse.ucsc.edu/goldenPath/; 
lcd ./hg19/database;
cd /nethome/syoung/base/pipeline/snpfilter;
mirror --delete --use-cache --verbose --allow-chown  
--allow-suid --no-umask --parallel=2 --exclude-glob .svn"


... AND IT DELETED FILES IN MY ~ DIRECTORY:


> --allow-suid --no-umask --parallel=2 --exclude-glob .svn"
./hg19/database: No such file or directory                       
cd: Access failed: 404 Not Found (/nethome/syoung/base/pipeline/snpfilter)
Removing old file `#.bash_profile#'
Removing old file `.bash_history'
Removing old file `.bash_logout'
Removing old file `.bash_profile'
Removing old file `.bash_profile.bkp'
Removing old file `.bash_profile.old'
Removing old file `.bash_profile~'
Removing old file `.bashrc'
Removing old file `.bashrc.old'
Removing old file `.chr1.fa.gz.Jeu33S'
Removing old directory `.cpan'
Removing old file `.cshrc'
Removing old file `.emacs'
Removing old directory `.emacs.d'
Removing old file `.forward'
Removing old file `.kshenv'
Removing old directory `.lftp'
Removing old file `.login'
Removing old directory `.lsbatch'
Removing old file `.module'
Removing old directory `.mozilla'
Removing old file `.profile'
Removing old directory `.ssh'
Removing old file `.viminfo'
Removing old file `README.txt'
Removing old directory `base'
rm `ampPrimerPairTrimmer.exe' []
[5]+  Stopped                 lftp -c "



SO COPIED SOME FILES OVER FROM ANOTHER INSTALLATION AND LOGGED BACK IN.
LUCKILY, WHEN I LOGGED BACK IN, AUTOMATIC SCRIPTS ADDED BACK .module, .bash_profile AND OTHER
IMPORTANT FILES/DIRECTORIES:
    
    Last login: Tue Mar 30 15:33:58 2010 from 10.136.60.167
    
    /share/apps/modules/bin/add.modules
            adds a few lines to the beginning of your
            /nethome/syoung/.cshrc, /nethome/syoung/.login,
            /nethome/syoung/.profile, /nethome/syoung/.bashrc, and
            possibly your /nethome/syoung/.kshenv (or whatever is
            specified by the ENV environment variable).
            Also your /nethome/syoung/.bash_profile will be processed.
            The lines are prepended for sourcing the /share/apps/modules/global/csh.modules or
            /share/apps/modules/global/profile.modules files or to define the module alias or function.
            Why is it necessary?
            To insure that you will have access to modules for all subshells,
            these lines need to be added to some of your 'dot' files.
    
            Your old .cshrc, .login, .profile, .bashrc and .kshenv will be
            renamed to .login.old, .cshrc.old, .profile.old, .bashrc.old and
            .kshenv.old respectively.  So if you have any problems you will
            can easily restore them.
    
            This is version $Id: add.modules.in,v 1.2.20.1 2008/02/12 00:06:12 rkowen Exp $ .
    
    Continue on (type n for no - default=yes)?\c
    
    Processing your .bash_profile (your old one is .bash_profile.old)
    Cleaning .bash_profile
    Adding sourcing lines at beginning of .bash_profile
    
    Processing your .profile (your old one is .profile.old)
    Cleaning .profile
    Adding sourcing lines at beginning of .profile
    You had no .bashrc as I see it.  Copying /etc/skel/.kshenv for you.
    You had no .kshenv as I see it.  Copying /etc/skel/.kshenv for you.
    
    Processing your .login (your old one is .login.old)
    Cleaning .login
    Adding sourcing lines at beginning of .login
    
    Processing your .cshrc (your old one is .cshrc.old)
    Cleaning .cshrc
    Adding alias or function lines at beginning of .cshrc
    [syoung@u02 ~]$ 




    






</entry>
<entry [Sat Mar 20 04:23:21 EDT 2010] USING SED>



http://www.grymoire.com/Unix/Sed.html#uh-3


CONVERT WITH sed

cat chr2.fa.fai
    
    chr2    242951149       6       50      51

sed -e 's/\(chr[A-Z0-9]*\)/\1.fa/' chr2.fa.fai 
    
    chr2.fa 242951149       6       50      51


sed -e 's/\(chr[A-Z0-9]*\)/\1.fa/' < chr1.fa.fai > TMP; mv -f TMP  chr1.fa.fai
sed -e 's/\(chr[A-Z0-9]*\)/\1.fa/' < chr2.fa.fai > TMP; mv -f TMP  chr2.fa.fai
sed -e 's/\(chr[A-Z0-9]*\)/\1.fa/' < chr3.fa.fai > TMP; mv -f TMP  chr3.fa.fai
sed -e 's/\(chr[A-Z0-9]*\)/\1.fa/' < chr4.fa.fai > TMP; mv -f TMP  chr4.fa.fai
sed -e 's/\(chr[A-Z0-9]*\)/\1.fa/' < chr5.fa.fai > TMP; mv -f TMP  chr5.fa.fai
etc...




AVOID THE 'PICKET FENCE'

The character after the s is the delimiter. It is conventionally a slash, because this is what ed, more, and vi use. It can be anything you want, however. If you want to change a pathname that contains a slash - say /usr/local/bin to /common/bin - you could use the backslash to quote the slash:

sed 's/\/usr\/local\/bin/\/common\/bin/' < old >new
Gulp. Some call this a 'Picket Fence' and it's ugly. It is easier to read if you use an underline instead of a slash as a delimiter:

sed 's_/usr/local/bin_/common/bin_' < old >new
Some people use colons:

sed 's:/usr/local/bin:/common/bin:' < old >new
Others use the "|" character.

sed 's|/usr/local/bin|/common/bin|' < old >new




Using & as the matched string

Sometimes you want to search for a pattern and add some characters, like parenthesis, around or near the pattern you found. It is easy to do this if you are looking for a particular string:

sed 's/abc/(abc)/' < old >new
This won't work if you don't know exactly what you will find. How can you put the string you found in the replacement string if you don't know what it is?

The solution requires the special character "&." It corresponds to the pattern found.

sed 's/[a-z]*/(&)/' < old >new
You can have any number of "&" in the replacement string. You could also double a pattern, e.g. the first number of a line:

% echo "123 abc" | sed 's/[0-9]*/& &/'
123 123 abc
Let me slightly amend this example. Sed will match the first string, and make it as greedy as possible. The first match for '[0-9]*' is the first character on the line, as this matches zero of more numbers. So if the input was "abc 123" the output would be unchanged (well, except for a space before the letters). A better way to duplicate the number is to make sure it matches a number:

% echo "123 abc" | sed 's/[0-9][0-9]*/& &/'
123 123 abc
The string "abc" is unchanged, because it was not matched by the regular expression. If you wanted to eliminate "abc" from the output, you must expand the the regular expression to match the rest of the line and explicitly exclude part of the expression using "(", ")" and "\1", which is the next topic.



Using \1 to keep part of the pattern

I have already described the use of "(" ")" and "1" in my tutorial on regular expressions. To review, the escaped parentheses (that is, parentheses with backslashes before them) remember portions of the regular expression. You can use this to exclude part of the regular expression. The "\1" is the first remembered pattern, and the "\2" is the second remembered pattern. Sed has up to nine remembered patterns.

If you wanted to keep the first word of a line, and delete the rest of the line, mark the important part with the parenthesis:

sed 's/\([a-z]*\).*/\1/'
I should elaborate on this. Regular exprssions are greedy, and try to match as much as possible. "[a-z]*" matches zero or more lower case letters, and tries to be as big as possible. The ".*" matches zero or more characters after the first match. Since the first one grabs all of the lower case letters, the second matches anything else. Therefore if you type

echo abcd123 | sed 's/\([a-z]*\).*/\1/'
This will output "abcd" and delete the numbers.

If you want to switch two words around, you can remember two patterns and change the order around:

sed 's/\([a-z]*\) \([a-z]*\)/\2 \1/'
Note the space between the two remembered patterns. This is used to make sure two words are found.

The "\1" doesn't have to be in the replacement string (in the right hand side). It can be in the pattern you are searching for (in the left hand side). If you want to eliminate duplicated words, you can try:

sed 's/\([a-z]*\) \1/\1/'
You can have up to nine values: "\1" thru "\9."



/1, /2, etc. Specifying which occurrence

With no flags, the first pattern is changed. With the "g" option, all patterns are changed. If you want to modify a particular pattern that is not the first one on the line, you could use "\(" and "\)" to mark each pattern, and use "\1" to put the first pattern back unchanged. This next example keeps the first word on the line but deletes the second:

sed 's/\([a-zA-Z]*\) \([a-zA-Z]*\) /\1 /' < old >new
Yuck. There is an easier way to do this. You can add a number after the substitution command to indicate you only want to match that particular pattern. Example:

sed 's/[a-zA-Z]* //2' < old >new
You can combine a number with the g (global) flag. For instance, if you want to leave the first world alone alone, but change the second, third, etc. to DELETED, use /2g:

sed 's/[a-zA-Z]* /DELETED /2g' < old >new
Don't get /2 and \2 confused. The /2 is used at the end. \2 is used in inside the replacement field.

Note the space after the "*" character. Without the space, sed will run a long, long time. (Note: this bug is probably fixed by now.) This is because the number flag and the "g" flag have the same bug. You should also be able to use the pattern

sed 's/[^ ]*//2' < old >new
but this also eats CPU. If this works on your computer, and it does on some Unix systems, you could remove the encrypted password from the password file:

sed 's/[^:]*//2' </etc/passwd >/etc/password.new
But this didn't work for me the time I wrote thise. Using "[^:][^:]*" as a work-around doesn't help because it won't match an non-existent password, and instead delete the third field, which is the user ID! Instead you have to use the ugly parenthesis:

sed 's/^\([^:]*\):[^:]:/\1::/' </etc/passwd >/etc/password.new
You could also add a character to the first pattern so that it no longer matches the null pattern:

sed 's/[^:]*:/:/2' </etc/passwd >/etc/password.new
The number flag is not restricted to a single digit. It can be any number from 1 to 512. If you wanted to add a colon after the 80th character in each line, you could type:

sed 's/./&:/80' <file >new
You can also do it the hard way by using 80 dots:

sed 's/^................................................................................/&:/' <file >new


</entry>



<entry [Wed Mar 17 17:30:17 EDT 2010] HOW TO CREATE A PATCH FILE>




1) copy the file you want to patch, e.g., a Makefile to Makefile.old in the same directory

2) edit the original Makefile

3) from that directory, run:

diff -u Makefile.old Makefile > Makefile.patch



EXAMPLE
=======

CREATED PATCH FILE AND SENT TO Cole Trapnell cole@:

diff -u cufflinks.cpp.orig  cufflinks.cpp > cufflinks-0.7.0.patch

cat cufflinks-0.7.0.patch 

	--- cufflinks.cpp.orig  2010-03-17 17:13:23.253099000 -0400
	+++ cufflinks.cpp       2010-03-17 16:55:10.576099000 -0400
	@@ -43,7 +43,7 @@
	 {"collapse-rounds",         required_argument,          0,                      'c'},
	 {"GTF",                                            required_argument,           0,                      'G'},
	 #if ENABLE_THREADS
	-{"num-threads",                                required_argument,       0,          't'},
	+{"num-threads",                                required_argument,       0,          'p'},
	 #endif
	 {0, 0, 0, 0} // terminator
	 };
	@@ -54,6 +54,7 @@
		 fprintf(stderr, "Usage:   cufflinks <hits.sam>\n");
			fprintf(stderr, "Options:\n\n");
			fprintf(stderr, "-m/--inner-dist-mean         the average inner distance between mates              [ default:     45 ]\n");
	+       fprintf(stderr, "-m/--transcript-score-thresh the minimum transcript score accepted                 [ default:      0 ]\n");
			fprintf(stderr, "-s/--inner-dist-std-dev      the inner distance standard deviation                 [ default:     20 ]\n");
			fprintf(stderr, "-c/--collapse-rounds         rounds of pre-assembly alignment collapse             [ default:      1 ]\n");
			fprintf(stderr, "-F/--min-isoform-fraction    suppress transcripts below this abundance level       [ default:   0.05 ]\n");


HOW TO USE THE PATCH:

1. TRANSFER THE PATCH FILE TO THE SAME DIRECTORY AS THE UNPATCHED cufflinks.cpp FILE

ll
	-rw-r--r-- 1 syoung bioinfo 1.2K Mar 17 17:37 cufflinks-0.7.0.patch
	-rw-r--r-- 1 syoung bioinfo 6.1K Mar 17 17:37 cufflinks.cpp.orig


2. BACKUP cufflinks.cpp

cp cufflinks.cpp cufflinks.cpp.orig



3. RUN patch

[syoung@kronos tmp]$ patch -p0 < cufflinks-0.7.0.patch 
patching file cufflinks.cpp.orig


4. CHECK DIFFERENCES BETWEEN PATCHED AND UNPATCHED WITH diff

diff cufflinks.cpp cufflinks.cpp.orig

	46c46
	< {"num-threads",                               required_argument,       0,          'p'},
	---
	> {"num-threads",                               required_argument,       0,          't'},
	57d56
	<       fprintf(stderr, "-m/--transcript-score-thresh the minimum transcript score accepted                 [ default:      0 ]\n");







</entry>



<entry [Mon Mar 15 15:39:54 UTC 2010] FIND OUT IF 64-BIT OR 32-BIT>

Type: 
uname -a

If it says something like this:

Linux lake.interim.stanford.edu 2.6.9-78.0.1.ELsmp #1 SMP Tue Jul 22 18:11:48 EDT 2008 i686 i686 i386 GNU/Linux

where there is an "i686" or "i386", then you have 32 bit linux.

If it says something like this:

Linux lake.interim.stanford.edu 2.6.9-67.ELsmp #1 SMP Wed Nov 7 13:56:44 EST 2007 x86_64 x86_64 x86_64 GNU/Linux

where there is an "x86_64" present, then you have 64 bit linux.

If it says something like

Linux lake.interim.stanford.edu 2.4.21-sgi240rp04041413_10065 #1 SMP Wed Apr 14 13:09:51 PDT 2004 ia64 unknown

where there is an "ia64" present, then you have itanium linux.


</entry>
<entry [Sun Mar  7 13:09:43 EST 2010] INSTALL PATCH FIL
E (FOR MAQ TO CONVERT ILLUMINA 1.3+ TO SANGER)>



SEE ALSO HOW TO DO IT IN TORTOISESVN:
http://tortoisesvn.net/docs/release/TortoiseSVN_en/tsvn-dug-patch.html


( COPIED FROM:
Notes-project22-agua.txt
Sun Mar  7 13:09:43 EST 2010
MAQ - CONVERT ILLUMINA 1.3+ TO SANGER )


http://stephenjungels.com/jungels.net/articles/diff-patch-ten-minutes.html

http://www.linuxforums.org/articles/using-diff-and-patch_80.html

1. DOWNLOADED PATCH FILE:

http://sourceforge.net/tracker/index.php?func=detail&aid=2824334&group_id=191815&atid=938893

    Illumina to sanger conversion - ID: 2824334
    Last Update: Attachment added ( daweonline )
    Details:
    
    As new Illumina software (GA 1.3+) has changed quality score encoding, I've
    written a small patch which adds 'ill2sanger' function, to convert new
    illumina fastq files into sanger fastq.
    It applies to maq-0.7.1. Essentially it takes the illumina score and adds
    2. The function to read fastq files (defined in seq.c) removes 33 to this
    score, so that the overall operation is removal of 31 from illumina score 

PATCH FILE LOCCATION
maq-ill2sanger.patch
http://sourceforge.net/tracker/download.php?group_id=191815&atid=938893&file_id=335812&aid=2824334

2. APPLIED PATCH

ll maq-ill2sanger.patch
		-rw-r--r-- 1 syoung bioinfo 3.6K Feb  7 23:37 maq-ill2sanger.patchll maq-ill2sanger.patch

cat maq-ill2sanger.patch

		diff -Naur maq-0.7.1/fastq2bfq.c maq-0.7.1.new/fastq2bfq.c
		--- maq-0.7.1/fastq2bfq.c	2008-03-15 13:06:00.000000000 +0100
		+++ maq-0.7.1.new/fastq2bfq.c	2009-07-20 16:52:27.000000000 +0200
		@@ -79,13 +79,36 @@
			seq_set_block_size(256);
			while ((l = seq_read_fastq(fpin, &seq, &qual, name)) >= 0) {
				int i;
		-		fprintf(fpout, "@%s\n%s\n+\n", name, seq.s);
		+		fprintf(fpout, "@%s\n%s\n+%s\n", name, seq.s, name);
				for (i = 0; i != l; ++i)
					qual.s[i] = table[(int)qual.s[i]];
				fprintf(fpout, "%s\n", qual.s);
			}
			free(seq.s); free(qual.s);
		 }
		+void ill2sanger(FILE *fpin, FILE *fpout)
		+{
		+	seq_t seq, qual;
		+	char name[256];
		+	int table[128];
		+	int l;
		+	/* calculate table */
		+	for (l = 0; l != 128; ++l) {
		+		table[l] = (int)(l +2);
		+		if (table[l] <= 33) table[l] = 33;
		+		if (table[l] >= 126) table[l] = 126;
		+	}
		+	INIT_SEQ(seq); INIT_SEQ(qual);
		+	seq_set_block_size(256);
		+	while ((l = seq_read_fastq(fpin, &seq, &qual, name)) >= 0) {
		+		int i;
		+		fprintf(fpout, "@%s\n%s\n+%s\n", name, seq.s, name);
		+		for (i = 0; i != l; ++i) 
		+			qual.s[i] = table[(int)qual.s[i]];
		+		fprintf(fpout, "%s\n", qual.s);
		+	}
		+	free(seq.s); free(qual.s);
		+}
		 int ma_sol2sanger(int argc, char *argv[])
		 {
			FILE *fpin, *fpout;
		@@ -100,6 +123,21 @@
			fclose(fpin); fclose(fpout);
			return 0;
		 }
		+
		+int ma_ill2sanger(int argc, char *argv[])
		+{
		+	FILE *fpin, *fpout;
		+	fpin = fpout = 0;
		+	if (argc < 3) {
		+		fprintf(stderr, "Usage: maq ill2sanger <in.fastq> <out.fastq>\n");
		+		return 1;
		+	}
		+	fpin = (strcmp(argv[1], "-") == 0)? stdin : fopen(argv[1], "r");
		+	fpout = (strcmp(argv[2], "-") == 0)? stdout : fopen(argv[2], "w");
		+	ill2sanger(fpin, fpout);
		+	fclose(fpin); fclose(fpout);
		+	return 0;
		+}
		 int ma_fastq2bfq(int argc, char *argv[])
		 {
			FILE *fp_fq;
		diff -Naur maq-0.7.1/main.c maq-0.7.1.new/main.c
		--- maq-0.7.1/main.c	2008-09-22 10:54:10.000000000 +0200
		+++ maq-0.7.1.new/main.c	2009-07-20 14:28:26.000000000 +0200
		@@ -28,6 +28,7 @@
			fprintf(stderr, "         glfgen      generate .glz consensus\n\n");
			fprintf(stderr, "Format converting:\n");
			fprintf(stderr, "         sol2sanger  convert Solexa FASTQ to standard/Sanger FASTQ\n");
		+	fprintf(stderr, "         ill2sanger  convert Illumina (GA 1.3+) FASTQ to standard/Sanger FASTQ\n");
			fprintf(stderr, "         mapass2maq  convert mapass2's map format to maq's map format\n");
			fprintf(stderr, "         bfq2fastq   convert BFQ to FASTQ format\n\n");
			fprintf(stderr, "Information extracting:\n");
		@@ -80,6 +81,7 @@
			else if (strcmp(argv[1], "assemble") == 0) return ma_assemble(argc-1, argv+1);
			else if (strcmp(argv[1], "glfgen") == 0) return maq_glfgen(argc-1, argv+1);
			else if (strcmp(argv[1], "sol2sanger") == 0) return ma_sol2sanger(argc-1, argv+1);
		+	else if (strcmp(argv[1], "ill2sanger") == 0) return ma_ill2sanger(argc-1, argv+1);
			else if (strcmp(argv[1], "mapass2maq") == 0) return ma_mapass2maq(argc-1, argv+1);
			else if (strcmp(argv[1], "bfq2fastq") == 0) return ma_bfq2fastq(argc-1, argv+1);
			else if (strcmp(argv[1], "mapview") == 0) return ma_mapview(argc-1, argv+1);
		diff -Naur maq-0.7.1/main.h maq-0.7.1.new/main.h
		--- maq-0.7.1/main.h	2008-09-22 10:54:10.000000000 +0200
		+++ maq-0.7.1.new/main.h	2009-07-20 14:28:39.000000000 +0200
		@@ -25,6 +25,7 @@
			int ma_rbcc(int argc, char *argv[]);
			int ma_subpos(int argc, char *argv[]);
			int ma_sol2sanger(int argc, char *argv[]);
		+	int ma_ill2sanger(int argc, char *argv[]);
			int ma_bfq2fastq(int argc, char *argv[]);
			int ma_fakemut(int argc, char *argv[]);     /* in fasta2bfa.c */
			int ma_abpair(int argc, char *argv[]);      /* in pair_stat.cc */



cd /nethome/bioinfo/apps/maq

patch -p0 < maq-ill2sanger.patch 

		patching file maq-0.7.1/fastq2bfq.c
		patching file maq-0.7.1/main.c
		patching file maq-0.7.1/main.h


[bioinfo@m1 0.7.1]$ make 
cd . && /bin/sh /nethome/bioinfo/apps/maq/0.7.1/missing --run autoheader
/nethome/bioinfo/apps/maq/0.7.1/missing: line 54: autoheader: command not found
WARNING: `autoheader' is missing on your system.  You should only need it if
         you modified `acconfig.h' or `configure.ac'.  You might want
         to install the `Autoconf' and `GNU m4' packages.  Grab them
         from any GNU archive site.
rm -f stamp-h1
touch config.h.in
cd . && /bin/sh ./config.status config.h
config.status: creating config.h
config.status: config.h is unchanged
make  all-am
make[1]: Entering directory `/nethome/bioinfo/apps/maq/0.7.1'
gcc -DHAVE_CONFIG_H -I.     -Wall -m64 -D_FASTMAP -DMAQ_LONGREADS -g -O2 -c main.c
gcc -DHAVE_CONFIG_H -I.     -Wall -m64 -D_FASTMAP -DMAQ_LONGREADS -g -O2 -c fasta2bfa.c
gcc -DHAVE_CONFIG_H -I.     -Wall -m64 -D_FASTMAP -DMAQ_LONGREADS -g -O2 -c fastq2bfq.c
g++ -DHAVE_CONFIG_H -I.     -Wall -m64 -D_FASTMAP -DMAQ_LONGREADS -g -O2 -c -o match_aux.o match_aux.cc
g++ -DHAVE_CONFIG_H -I.     -Wall -m64 -D_FASTMAP -DMAQ_LONGREADS -g -O2 -c -o match.o match.cc
g++ -DHAVE_CONFIG_H -I.     -Wall -m64 -D_FASTMAP -DMAQ_LONGREADS -g -O2 -c -o assemble.o assemble.cc
g++  -Wall -m64 -D_FASTMAP -DMAQ_LONGREADS -g -O2   -o maq main.o const.o seq.o bfa.o read.o fasta2bfa.o fastq2bfq.o merge.o match_aux.o match.o sort_mapping.o assemble.o pileup.o mapcheck.o get_pos.o assopt.o aux_utils.o rbcc.o subsnp.o pair_stat.o indel_soa.o maqmap.o maqmap_conv.o altchr.o submap.o rmdup.o simulate.o genran.o indel_pe.o stdaln.o indel_call.o eland2maq.o csmap2ntmap.o break_pair.o glfgen.o -lm -lz 
make[1]: Leaving directory `/nethome/bioinfo/apps/maq/0.7.1'


3. RECOMPILE

NEWLY COMPILED maq HAS ill2sanger OPTION:

[bioinfo@m1 0.7.1]$ ./maq ill2sanger
Usage: maq ill2sanger <in.fastq> <out.fastq>
[bioinfo@m1 0.7.1]$ 


OLD maq VERSION DOES NOT:

[bioinfo@m1 0.7.1-bkp]$ ./maq ill2sanger
ERROR: unrecognized command 'ill2sanger'



NOTES
=====



http://www.linuxquestions.org/questions/linux-general-1/how-do-you-apply-a-diff-patch-529154/
The basic concept it to apply the 'diff' using the patch command.
Basic command syntax
Code:
$ patch -p[num] < [patchfile]
Example
Code:
$ patch -p1 < diff
Whether or not this will work for your diff file will depend on what your patching and how the diff file is written. Recommend doing 'man patch' and 'man diff' and read the manual. Would also help you to look at any README files or HOW-To's about the specific use of the diff you trying to apply.


</entry>



<entry [Tue Sep 15 21:35:05 EDT 2009] GET THE IP ADDRESS OF YOUR COMPUTER>



emacs /etc/sysconfig/network-scripts/ifcfg-eth0

    # Intel Corporation 82545EM Gigabit Ethernet Controller (Copper)
    DEVICE=eth0
    BOOTPROTO=none
    ONBOOT=yes
    IPADDR=204.68.94.222
    NETMASK=255.255.255.0
    GATEWAY=204.68.94.1
    TYPE=Ethernet



CHANGE IP ADDRESS

EDIT THE ABOVE FILE AND THEN RESTART:

run service network restart

ps
 don't forget to change default gw also,
 it's located in /etc/sysconfig/network



</entry>



<entry [Tue Sep 15 21:35:05 EDT 2009] CHANGE LINUX LOGIN MESSAGE>



EDIT THIS FILE
/etc/motd

</entry>



<entry [Thurs Aug 6 14:29:39 EDT 2009] MORE find command EXAMPLES>




   Find files named core in or below the directory /tmp and
       delete them.  Note that this will  work  incorrectly  if
       there  are  any filenames containing newlines, single or
       double quotes, or spaces.

       find /tmp -name core -type f -print0 | xargs -0  /bin/rm
       -f

       Find files named core in or below the directory /tmp and
       delete them, processing filenames in  such  a  way  that
       file  or  directory  names  containing  single or double
       quotes, spaces or newlines are correctly  handled.   The
       -name test comes before the -type test in order to avoid
       having to call stat(2) on every file.

       find . -type f -exec file â{}â \;

       Runs âfileâ on every file in or below the current direc-
       tory.   Notice  that  the  braces are enclosed in single
       quote marks to protect them from interpretation as shell
       script  punctuation.    The  semicolon is similarly pro-
       tected by the use of a backslash, though â;â could  have
       been used in that case also.

       find /    \( -perm -4000 -fprintf /root/suid.txt â%#m %u %p\nâ \) , \
                 \( -size +100M -fprintf /root/big.txt â%-10s %p\nâ \)

       Traverse  the filesystem just once, listing setuid files
       and directories into /root/suid.txt and large files into
       /root/big.txt.

       find $HOME -mtime 0

       Search  for files in your home directory which have been
       modified in the last twenty-four  hours.   This  command
       works this way because the time since each file was last
       modified is divided by 24 hours  and  any  remainder  is
:


</entry>



<entry [Mon Oct 27 14:29:39 EDT 2008] find command EXAMPLES>



find . -type f -name "122"  -exec mv {} alta-cyclic \;


sudo find / -type f -name *.jpg  -exec cp {} . \;
find . -type f -size +10000 -exec ls -al {} \;
find . -atime +1 -type f -exec mv {} TMP \; # mv files older then 1 day to dir TMP
find . -name "-F" -exec rm {} \;   # a script error created a file called -F 
find . -exec grep -i "vds admin" {} \;
find . \! -name "*.Z" -exec compress -f {} \;
find . -type f \! -name "*.Z" \! -name ".comment" -print | tee -a /tmp/list
find . -name *.ini
find . -exec chmod 775 {} \;
find . -user xuser1 -exec chown -R user2 {} \;
find . -name ebtcom*
find . -name mkbook
find . -exec grep PW0 {} \;
find . -exec grep -i "pw0" {} \;
find . -atime +6
find . -atime +6 -exec ll | more
find . -atime +6 -exec ll | more \;
find . -atime +6 -exec ll \;
find . -atime +6 -exec ls \;
find . -atime +30 -exec ls \;
find . -atime +30 -exec ls \; | wc -l
find . -name auth*
find . -exec grep -i plotme10 {};
find . -exec grep -i plotme10 {} \;
find . -ls -exec grep 'PLOT_FORMAT 22' {} \;
find . -print -exec grep 'PLOT_FORMAT 22' {} \;
find . -print -exec grep 'PLOT_FORMAT' {} \;
find . -print -exec grep 'PLOT_FORMAT' {} \;
find ./machbook -exec chown 184 {} \;
find . \! -name '*.Z' -exec compress {} \;
find . \! -name "*.Z" -exec compress -f {} \;
find /raid/03c/ecn -xdev -type f -print
find /raid/03c/ecn -xdev -path -type f -print
find / -name .ssh* -print | tee -a ssh-stuff
find . -name "*font*"
find . -name hpmcad*
find . -name *fnt*
find . -name hp_mcad* -print
find . -grep Pld {} \;
find . -exec grep Pld {} \;
find . -exec grep Pld {} \;
find . -exec grep PENWIDTH {} \; | more
find . -name config.pro
find . -name config.pro
find /raid -type d ".local_sd_customize" -print
find /raid -type d -name ".local_sd_customize" -print
find /raid -type d -name ".local_sd_customize" -ok cp /raid/04d/MCAD-apps/I_Custom/SD_custom/site_sd_customize/user_filer_project_dirs {} \;
find /raid -type d -name ".local_sd_customize" -exec cp /raid/04d/MCAD-apps/I_Custom/SD_custom/site_sd_customize/user_filer_project_dirs {} \;
find . -name xeroxrelease
find . -exec grep xeroxrelease {} \;
find . -name xeroxrelease
find . -name xeroxrelease* -print 2>/dev/null
find . -name "*release*" 2>/dev/null
find / -name "*xerox*" 2>/dev/null
find . -exec grep -i xeroxrelease {} \;
find . -print -exec grep -i xeroxrelease {} \;
find . -print -exec grep -i xeroxrelease {} \; > xeroxrel.lis
find . -exec grep -i xeroxrel {} \;
find . -print -exec grep -i xeroxrel {} \;
find . -print -exec grep -i xeroxrel {} \; | more
find /raid/03c/inwork -xdev -type f -print >> /raid/04d/user_scripts/prt_list.tmp
find . -exec grep '31.53' {} \;
find . -ls -exec grep "31/.53" {} \; > this.lis
find . -print -exec grep "31/.53" {} \; > this.lis
find . -print -exec grep 31.53 {} \; > this.lis
find . -exec grep -i pen {} /;
find . -exec grep -i pen {} \;
find . -print -exec grep -i pen {} \; | more
find . -exec grep -i pen {} \;
find . -atime +6 -exec ll | more \;
find . -atime +6 -exec ll \;
find . -atime +6 -exec ls \;
find . -atime +30 -exec ls \;
find . -atime +30 -exec ls \; | wc -l
find . \! -name '*.Z' -exec compress -f {} \;
find . -name 'cache*' -depth -exec rm {} \;
find . -name 'cache*' -depth -print | tee -a /tmp/cachefiles
find . -name 'cache[0-9][0-9]*' -depth -print | tee -a /tmp/cachefiles
find . -name 'hp_catfile' 'hp_catlock' -depth -print | tee -a /tmp/hp.cats
find . -name 'hp_catfile' -name 'hp_catlock' -depth -print | tee -a /tmp/hp.cats
find . -name 'hp_cat*' -depth -print | tee -a /tmp/hp.cats
find . -name 'hp_cat[fl]*' -depth -print | tee -a /tmp/hp.cats
find /raid -name 'hp_cat[fl]*' -depth -print
find . \! -name '*.Z' -exec compress -f {} \;
find . -name '*' -exec compress -f {} \;
find . -xdev -name "wshp1*" -print
find . -xdev -name "wagoneer*" -print
find . -name "xcmd" -depth -print
find /usr/contrib/src -name "xcmd" -depth -print
find /raid -type d -name ".local_sd_customize" -exec ls {} \; 
find /raid -type d -name ".local_sd_customize" \
   -exec cp /raid/04d/MCAD-apps/I_Custom/SD_custom/site_sd_customize/user_filer_project_dirs {} \;




</entry>



<entry [Mon Oct 27 14:29:39 EDT 2008] USE diff TO APPLY A PATCH>





Creating and Applying Patches
http://www.whatwoulddrupaldo.org/creating-and-applying-patches

I regularly find myself digging up the proper nodes to explain to someone on the forums how to apply a patch either from a shell command line or locally on a windows machine.

I also find myself always needing to dig up the information on the proper command line syntax for generating a patch for submission.

So here's the scoop, so I don't have to do all that oh-so-complicated searching everytime ;)

Creating a patch:

diff -uF^function old.module new.module > file.patch

More info available at http://drupal.org/diffanpatch

Applying a patch from shell:

patch old.module < file.patch



(I find that the -p option is rarely needed)

Applying a patch on a local windows box to upload via FTP:
Discussion of various means here

</entry>



<entry [Wed Oct 22 23:57:10 EDT 2008] CENTOS RPM SITE>



http://isoredirect.centos.org/centos/5/extras/i386/RPMS/



</entry>



<entry [Wed Oct 22 23:47:10 EDT 2008] RPM HOW TO UNINSTALL>



http://www.faqs.org/docs/securing/chap4sec23.html

Use RPM command to uninstall.

The command to uninstall software is:

$ rpm -e <softwarename(s)>
         

Where <softwarename> is the name of the software you want to uninstall e.g. (foo).

Since Programs like apmd, kudzu, and sendmail are daemons that run as process. It is better to stop those processes before uninstalling them from the system.To stop those processes, use the following commands:

         [root@deep] /# /etc/rc.d/init.d/apmd stop
         [root@deep] /# /etc/rc.d/init.d/sendmail stop
         [root@deep] /# /etc/rc.d/init.d/kudzu stop
         

   1.

      Version 6.1 only Now you can uninstall them safely, and all other packages, as shown below: Remove the specified packages for Red Hat Linux version 6.1 (Cartman).

                   [root@deep] /# rpm -e --nodeps pump mt-st eject mailcap apmd kernel-pcmcia-cs linuxconf getty_ps 
                   setconsole isapnptools setserial kudzu raidtools gnupg redhat-logos redhat-release gd pciutils rmt

      Version 6.2. only Remove the specified packages for Red Hat Linux version 6.2 (Zoot).

                   [root@deep] /# rpm -e --nodeps pump mt-st eject mailcap apmd kernel-pcmcia-cs linuxconf getty_ps 
                   isapnptools setserial kudzu raidtools gnupg redhat-logos redhat-release gd pciutils rmt

   2.

      Version All Remove the linux.conf-installed file manually.

               [root@deep] /# rm -f /etc/conf.linuxconf-installed
               

    Note: This is a configuration file related to linuxconf software that must be removed manually. 

The program hdparm is needed by IDE hard disk but not SCSI hard disks. If you have an IDE disk on your system you must keep this program (hdparm), but if you don't have an IDE hard disk you can remove it safely from your system. To remove hdparm from your system, use the following command:

         [root@deep] /# rpm -e hdparm
         

Use the programs kbdconfig, mouseconfig, timeconfig, authconfig, ntsysv, and setuptool in order to set your keyboard language and type, your mouse type, your default time zone, your NIS and shadow passwords, your numerous symbolic links in /etc/rc.d directory, and text mode menu utility which allow you to access all of these features. After those configurations have been set during the installation stage of your Linux server it's rare that you would need to change them again. So, you can uninstall them, and if in future you need to change your keyboard, mouse, default time, etc again via test mode menu, all you have to do is to install the program with the RPM from your original CD-ROM. To remove all the above programs from your system, use the following command:

         [root@deep] /# rpm -e kbdconfig mouseconfig timeconfig authconfig ntsysv setuptool
         

Even if you are not intending to install a mail server on your Linux system, the program Sendmail is always needed on your servers for potential messages sent to the root user by different software services installed on your machine.

Sendmail is a Mail Transport Agent -MTA program that sends mail from one machine to another. It can be configured in different manners; it can serve as an internal delivery mail system to a Mail Hub Server, or can be configured to be a Central Mail Hub Server for all Sendmail machines on your network. So depending on what you want to do with Sendmail, you must configure it to respond to your specific needs. For this reason you must uninstall Sendmail and see the relevant sections in this book that is related to Sendmail configuration and installation.

To remove Sendmail from your system, use the following command:

         [root@deep] /# rpm -e sendmail
         



</entry>



<entry [Wed Oct 22 23:11:58 EDT 2008] FIND OUT WHICH VERSION OF centos:>



$ cat /etc/redhat-release
CentOS release 5.2 (Final)




</entry>



<entry [Wed Oct 22 23:03:08 EDT 2008] HOW TO USE Apt AND yum>



BASED ON THIS PAGE:

http://dag.wieers.com/rpm/FAQ.php#B4

B3. How do I use Apt ?
Apt originally was developed by the Debian project to work together with DEB packages. Since there are not many functional differences between RPM and DEB packages, Conectiva ported Apt to use RPM.

To install Apt, download the latest package for your distribution from: http://dag.wieers.com/packages/apt/. The configuration of Apt is inside the rpmforge-release package.

If you've done that, the rest is simple. Update the local repository meta-data by doing:

apt-get update
You can upgrade your system with the latest packages with:

apt-get upgrade
And finally you can add new software by typing:

apt-get install <name of package>
Or search for software in the local repository meta-data:

apt-cache search <keyword> apt-cache show <name of package>
From time to time you may want to save some diskspace:

apt-get clean
Remember to update your local repository often before upgrading or installing software, so that you can enjoy the latest and greatest.

Some people rather use a graphical program to select and install packages. Apt has a nifty graphical front-end, called Synaptic. You can install it by doing:

apt-get install synaptic
Or download it from: http://dag.wieers.com/packages/synaptic/

B4. How do I use Yum ?
Yum is an update-tool written in python. The advantage of Yum is that it is written in Python. The disadvantage is that there are many versions of Yum, and only recent versions work with recent distributions. If you like to use a single tool across all distributions, it's better to use Apt.

Yum is usually already installed if you're running Fedora Core. In case you are using Red Hat Enterprise Linux or an older Red Hat Linux distribution. You can find Yum at: http://dag.wieers.com/packages/yum/

The configuration of Yum is inside the rpmforge-release package. You need to install it yourself.

If you've done that, the rest is simple. Upgrade your system by doing:

yum update
You can add new software by typing:

yum install <name of package>
Or update installed software:

yum update <name of package>
Or search for software in the local repository meta-data:

yum search <keyword>
Or simply list all available software:

yum list available
From time to time you may want to save some diskspace:

yum clean


</entry>



<entry [Tue Oct 21 11:42:55 EDT 2008] CREATE zion USER AND GIVE IT A UID AND GID>



1. CHECK syoung USER AND GROUP IDS IN CCS LDAP

USER syoung ON CCS LDAP
[syoung@olympus ~]$ id 
uid=1008(syoung) gid=1072(bioinfo) groups=1072(bioinfo)

USER syoung ON zion
[syoung@zion ~]$ id
uid=500(syoung) gid=502 groups=502


2. EDIT bioinfo GROUP ENTRY IN /etc/group

FROM

bioinfo:x:502:

TO

bioinfo:x:1072:


3. USE groupdel AND groupadd TO REMOVE OLD bioinfo GROUP FROM passwd FILE

sudo /usr/sbin/groupdel bioinfo

sudo /usr/sbin/groupadd -g 1072 bioinfo



2. CREATE USER AND ADD TO GROUPS:

sudo /usr/sbin/useradd -u 1008 -G bioinfo zion



( NB:

CAN USE -a OPTION MODIFY USER AND ADD ADDITIONAL GROUPS (-G OPTION) WITHOUT OVERWRITING EXISTING GROUPS:

/usr/sbin/usermod -a -G mihgg zion)

CAN USE userdel TO REMOVE A USER:

sudo /usr/sbin/userdel zion )




4. SET NEW PASSWORD

passwd zion



5. GET USER INFO FOR zion

[syoung@zion ~]$ id zion
uid=1008(zion) gid=1008(zion) groups=1008(zion),1072(bioinfo)



ABOVE INSTRUCTIONS ARE BASED ON:

Howto: Linux Add User To Group
http://www.cyberciti.biz/faq/howto-linux-add-user-to-group/#comment-37267


useradd example - Add a new user to secondary group
===================================================

Use useradd command to add new users to existing group (or create a new group and then add user). If group does not exist, create it. Syntax:

    useradd -G {group-name} username

Create a new user called vivek and add it to group called developers. First login as a root user (make sure group developers exists), enter:

    grep developers /etc/group

developers:x:1124:


If you do not see any output then you need to add group developers using groupadd command:

    groupadd developers

Next, add a user called vivek to group developers:

    useradd -G developers vivek

Setup password for user vivek:

    passwd vivek

Ensure that user added properly to group developers:

    id vivekOutput:

uid=1122(vivek) gid=1125(vivek) groups=1125(vivek),1124(developers)

Please note that capital G (-G) option add user to a list of supplementary groups. Each group is separated from the next by a comma, with no intervening whitespace. For example, add user jerry to groups admins, ftp, www, and developers, enter:

    useradd -G admins,ftp,www,developers jerry



useradd example - Add a new user to primary group
=================================================

To add a user tony to group developers use following command:

    useradd -g developers tony
    id tony

    uid=1123(tony) gid=1124(developers) groups=1124(developers)


Please note that small -g option add user to initial login group (primary group). The group name must exist. A group number must refer to an already existing group.



usermod example - Add a existing user to existing group
=======================================================

Add existing user tony to ftp supplementary/secondary group with usermod command using -a option ~ i.e. add the user to the supplemental group(s). Use only with -G option :


    usermod -a -G ftp tony
    
Change existing user tony primary group to www:

    usermod -g www tony





</entry>



<entry [Fri Oct 17 16:17:37 EDT 2008] WORKAROUND argument list too long FOR rm>
    
# rm spam-*
/bin/rm: Argument list too long.

1. GET NUMBER OF FILES 

# ls -1 | grep virus | wc -l
    1667

2. USE find AND PIPE MATCHING FILES TO rm, ONE AT A TIME

# find . -name 'spam-*' | xargs rm

</entry>
<entry [Wed Oct 15 17:17:37 EDT 2008] BASIC RSYNC COMMAND>

rsync -av -e ssh username@oldserverhost:/home/old_home/ /home/new_home/

</entry>
<entry [Fri Oct 10 15:04:36 EDT 2008] REPLACE A STRING IN A FILE>

perl -p -i -e "s/080801_HWI-EAS185_0001_20GVYAAXX_Jia_cDNA2_mtDNA_Total_Small_Medium_JH/workflow1/g" RunLog*


find and sed with pipe
======================

find . -name '*.tif' | sed -e 's%\(.//*\)\(.\)\(.\)\(.\)\(.*\)%ditto \1\2\3\4\5 /some/path/\2/\3/\4/%' | sh


find . -name 'Runlog*' | sed -e 's/080801_HWI-EAS185_0001_20GVYAAXX_Jia_cDNA2_mtDNA_Total_Small_Medium_JH/workflow1/g' | sh

DIDN'T WORK


grep and sed with xargs
=======================

http://yassinechaouche.thecoderblogs.com/2008/08/28/replace-a-string-in-multiple-files/

greppy -l  “SESSION.get(idEntreprise)” | xargs sed -i -e “s/SESSION.get(idEntreprise)/SESSION.get(\”idEntreprise\”)/”

One handy alias :
alias greppy=‘find . -name "*.py" | grep -v svn | xargs grep –color’



perl with grep and xargs
========================



grep -rl OLDSTRING *.FILEEXTENSION | xargs perl -pi~ -e 's/OLDSTRING/NEWSTRING/g'



sed (stream editor)
===================

We have a file called sedtest.txt, which contains the string "1.0". To
change the string to "2.0":

sed -e 's/1.0/2.0/g' sedtest.txt > sedtest2.txt mv –f sedtest2.txt sedtest.txt

Remove empty lines:

sed -e '/^ *$/d' sedtest1.txt 


perl
====

perl -p -i -e “s/text/replacement text/g" filename


shell script
============

cd pathname
for y in `ls *`;
do 
   sed 's_c:/mydocuments/pictures_d:/mypics/personal_' $y > temp; mv temp $y;
done

http://wiki.ajo.es/index.php/How_to_replace_a_string_in_multiple_files_UNIX

  #!/bin/sh myname="/tmp/`whoami``date +%d%m%H%M%S`" 
  if test -f $myname then 
     echo "$0: Cannot make directory $myname (already exists)" 1&>2 
     exit 0 
  fi 
  mkdir "$myname" 
  for FILE in $@; do 
     sed 's/old_string/new_string/g' $FILE > "$myname"/"$FILE"new_tmp 
     mv "$myname"/"$FILE"new_tmp $FILE 
  done 
  rmdir $myname
  
  
  
</entry>
<entry [Tue Sep  2 10:41:28 EDT 2008] FIND THE php.ini FILE TO RESET THE MAX FILE UPLOAD SIZE>



1. CREATE THE phpinfo.php FILE IN THE HTML DIRECTORY:

<?php
#Wallpaperama.com
phpinfo();
?>


2. BROWSE TO IT AND LOOK FOR THE Configuration File (php.ini) Path 

/etc/php.ini


3. CHECK THE CURRENT VALUE OF post_max_size

post_max_size	8M	8M


4. EDIT post_max_size IN THE php.ini FILE

; Maximum size of POST data that PHP will accept.
post_max_size = 100M


5. RESTART APACHE

/usr/sbin/apachectl -k stop   
/usr/sbin/apachectl -k start

NB: START AND STOP IS BETTER THAN RESTART

/usr/sbin/apachectl -k restart



</entry>



<entry [Tue Sep  2 10:40:28 EDT 2008] CHECK IF YOUR SYSTEM IS 64-BIT OF 32-BIT WITH uname -a>



ON solexa01:

uname -a
Linux solexa01 2.6.18-53.el5 #1 SMP Wed Oct 10 16:34:19 EDT 2007 x86_64 x86_64 x86_64 GNU/Linux




</entry>



<entry [Fri Aug 29 21:27:21 EDT 2008] RESTORE USER AND GROUP INFO>



Ubuntu Linux Restore admin / root level permissions

http://www.cyberciti.biz/tips/ubuntu-admin-group-permissions.html

Posted by Vivek Gite [Last updated: November 1, 2007]

I was writing and testing few python scripts (yes I'm moving lot of stuff from shell / perl to python these days) and accidentally I renamed my own user account from vivek to test. However, I did not noticed change until I rebooted my box. Now I cannot run sudo (or become a root user) and cannot access special devices such as sound or video.

By default your first account has all power via sudo under Ubuntu Linux. There is a special group called adm and admin which grants unlimited power via sudo.

The only solution was to boot computer in emergency mode (reboot computer and at grub menu select recovery mode kernel), open /etc/group file and add user vivek to admin and adm group:
# vi /etc/group
Add user vivek to admin and adm group:
admin:x:117:vivek
adm:x:4:vivek

Save and close the file.

Now I'm able to run sudo and do other stuff. Luckily, my scripts always backup critical files before modification. So I was able to restore permission instantly. Here is my group membership with all power and glory ;)
$ id
$ groups
Output:

vivek adm dialout cdrom floppy audio dip video plugdev scanner netdev lpad



</entry>



<entry [Fri Aug 29 20:35:16 EDT 2008] CREATE NEW USER AND ADD TO GROUPS IN CENTOS>



1. CHECK EXISTING USER GROUP ENTRIES IN /etc/groups

users:x:100:jhoffman,warner,jhahn,Mihglabtech,dhedges,syoung
mihgg:x:1046:jhoffman,warner,jhahn,Mihglabtech,dhedges,syoung

2. CREATE USER AND ADD TO GROUPS:

/usr/sbin/useradd -G users szuchner

3. MODIFY USER AND ADD ADDITIONAL GROUPS (-G OPTION) WITHOUT OVERWRITING EXISTING GROUPS (-a OPTION):

/usr/sbin/usermod -a -G mihgg szuchner

4. SET NEW PASSWORD:

passwd szuchner

5. GET USER INFO FOR szuchner:

id szuchner
uid=1121(szuchner) gid=1121(szuchner) groups=1121(szuchner),100(users),1046(mihgg) context=user_u:system_r:unconfined_t


DID SAME FOR USER uozomaro:
===========================

CHECK FOR USERS IN /etc/passwd

    [root@solexa01 sbin]# cat /etc/passwd
    root:x:0:0:root:/root:/bin/bash
    bin:x:1:1:bin:/bin:/sbin/nologin
    daemon:x:2:2:daemon:/sbin:/sbin/nologin
    adm:x:3:4:adm:/var/adm:/sbin/nologin
    lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
    sync:x:5:0:sync:/sbin:/bin/sync
    shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
    halt:x:7:0:halt:/sbin:/sbin/halt
    mail:x:8:12:mail:/var/spool/mail:/sbin/nologin
    news:x:9:13:news:/etc/news:
    uucp:x:10:14:uucp:/var/spool/uucp:/sbin/nologin
    operator:x:11:0:operator:/root:/sbin/nologin
    games:x:12:100:games:/usr/games:/sbin/nologin
    gopher:x:13:30:gopher:/var/gopher:/sbin/nologin
    ftp:x:14:50:FTP User:/var/ftp:/sbin/nologin
    nobody:x:99:99:Nobody:/:/sbin/nologin
    rpm:x:37:37::/var/lib/rpm:/sbin/nologin
    dbus:x:81:81:System message bus:/:/sbin/nologin
    nscd:x:28:28:NSCD Daemon:/:/sbin/nologin
    vcsa:x:69:69:virtual console memory owner:/dev:/sbin/nologin
    pcap:x:77:77::/var/arpwatch:/sbin/nologin
    rpc:x:32:32:Portmapper RPC user:/:/sbin/nologin
    mailnull:x:47:47::/var/spool/mqueue:/sbin/nologin
    smmsp:x:51:51::/var/spool/mqueue:/sbin/nologin
    avahi:x:70:70:Avahi daemon:/:/sbin/nologin
    sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin
    rpcuser:x:29:29:RPC Service User:/var/lib/nfs:/sbin/nologin
    nfsnobody:x:4294967294:4294967294:Anonymous NFS User:/var/lib/nfs:/sbin/nologin
    haldaemon:x:68:68:HAL daemon:/:/sbin/nologin
    distcache:x:94:94:Distcache:/:/sbin/nologin
    apache:x:48:48:Apache:/var/www:/sbin/nologin
    ntp:x:38:38::/etc/ntp:/sbin/nologin
    webalizer:x:67:67:Webalizer:/var/www/usage:/sbin/nologin
    squid:x:23:23::/var/spool/squid:/sbin/nologin
    xfs:x:43:43:X Font Server:/etc/X11/fs:/sbin/nologin
    gdm:x:42:42::/var/gdm:/sbin/nologin
    sabayon:x:86:86:Sabayon user:/store/home/sabayon:/sbin/nologin
    hpsmh:x:100:500::/opt/hp/hpsmh:/sbin/nologin
    warner:x:500:100::/store/home/warner:/bin/bash
    whulme:x:501:100:William Hulme:/store/home/whulme:/bin/bash
    ikonidari:x:502:100:Ioanna Konidari:/store/home/ikonidari:/bin/bash
    pwhitehead:x:503:100:Patrice Whitehead:/store/home/pwhitehead:/bin/bash
    spatel6:x:504:100:Shilpa Patel:/store/home/spatel6:/bin/bash
    ckroner:x:505:100:Charles Kroner:/store/home/ckroner:/bin/bash
    rotto1:x:506:100:Rachaele Otto:/store/home/rotto1:/bin/bash
    jhahn:x:507:100::/home/jhahn:/bin/bash
    Mihglabtech:x:508:100::/home/Mihglabtech:/bin/bash
    jhoffman:x:509:100::/home/jhoffman:/bin/bash
    anunez1:x:510:100::/home/anunez1:/bin/bash
    syoung:x:511:100::/home/syoung:/bin/bash
    dhedges:x:512:100::/home/dhedges:/bin/bash
    mysql:x:513:510::/home/mysql:/bin/bash
    ddittman:x:514:100::/home/ddittman:/bin/bash
    jhuang:x:515:100::/home/jhuang:/bin/bash
    zjiang:x:516:100::/home/zjiang:/bin/bash
    mihg:x:1120:1120::/home/mihg:/bin/bash
    uozomaro:x:517:100::/home/uozomaro:/bin/bash
    szuchner:x:1121:1121::/home/szuchner:/bin/bash

1. CHECK EXISTING USER INFO

id uozomaro
uid=517(uozomaro) gid=100(users) groups=100(users) context=user_u:system_r:unconfined_t

2. ADD USER TO GROUP mihgg BY MODIFYING USER GROUPS (-G OPTION) WITHOUT OVERWRITING EXISTING GROUPS (-a OPTION):

/usr/sbin/usermod -a -G mihgg uozomaro

CHECK INFO:

id uozomaro
uid=517(uozomaro) gid=100(users) groups=100(users),1046(mihgg) context=user_u:system_r:unconfined_t



ABOVE INSTRUCTIONS ARE BASED ON:

Howto: Linux Add User To Group
http://www.cyberciti.biz/faq/howto-linux-add-user-to-group/#comment-37267


useradd example - Add a new user to secondary group
===================================================

Use useradd command to add new users to existing group (or create a new group and then add user). If group does not exist, create it. Syntax:

    useradd -G {group-name} username

Create a new user called vivek and add it to group called developers. First login as a root user (make sure group developers exists), enter:

    grep developers /etc/group

developers:x:1124:


If you do not see any output then you need to add group developers using groupadd command:

    groupadd developers

Next, add a user called vivek to group developers:

    useradd -G developers vivek

Setup password for user vivek:

    passwd vivek

Ensure that user added properly to group developers:

    id vivekOutput:

uid=1122(vivek) gid=1125(vivek) groups=1125(vivek),1124(developers)

Please note that capital G (-G) option add user to a list of supplementary groups. Each group is separated from the next by a comma, with no intervening whitespace. For example, add user jerry to groups admins, ftp, www, and developers, enter:

    useradd -G admins,ftp,www,developers jerry



useradd example - Add a new user to primary group
=================================================

To add a user tony to group developers use following command:

    useradd -g developers tony
    id tony

    uid=1123(tony) gid=1124(developers) groups=1124(developers)


Please note that small -g option add user to initial login group (primary group). The group name must exist. A group number must refer to an already existing group.



usermod example - Add a existing user to existing group
=======================================================

Add existing user tony to ftp supplementary/secondary group with usermod command using -a option ~ i.e. add the user to the supplemental group(s). Use only with -G option :


    usermod -a -G ftp tony
    
Change existing user tony primary group to www:

    usermod -g www tony




</entry>



<entry [Fri Aug 29 16:35:55 EDT 2008] RESTART SSHD SERVER + Disabling root login via SSH (CentOS)>




1. RESTART SSHD SERVER

    sudo /etc/init.d/sshd restart

2. Disabling root login via SSH (CentOS)

This specifically applies to Centos 5.x

    # vi /etc/ssh/sshd_config

Preferably do this on a second login if you have to do this on a remote system… and keep the one of them open! All you have to do is locate the line “PermitRootLogin yes” and change it to:

    PermitRootLogin no

Then restart SSH:

    # /etc/init.d/sshd restart



</entry>



<entry [Wed Jul 23 22:44:40 EDT 2008] SET THE DATE AND TIME ON THE COMMAND LINE >



sudo date 072322452008

EXAMPLES

The command:

    date "+DATE: %m/%d/%y%nTIME: %H:%M:%S"

will display:

    DATE: 11/21/87
    TIME: 13:36:16

The command:

    date 061316271985

sets the date to ``June 13, 1985, 4:27 PM''.

The command:

    date 1432

sets the time to 2:32 PM, without modifying the date.



</entry>



<entry [Fri Jul 11 18:16:31 EDT 2008] How to run a CRON task every 5 minutes>



emacs /etc/crontab

>>>
SHELL=/bin/bash
PATH=/sbin:/bin:/usr/sbin:/usr/bin
MAILTO=root
HOME=/

# run-parts
01 * * * * root run-parts /etc/cron.hourly
02 4 * * * root run-parts /etc/cron.daily
22 4 * * 0 root run-parts /etc/cron.weekly
42 4 1 * * root run-parts /etc/cron.monthly
<<<

TO RUN EVERY 5 MINS:

MAILTO=cron@username.plus.com
0,5,10,15,20,25,30,35,40,45,50,55 * * * * /command/to/execute

*** OR THE SHORTCUT:

MAILTO=cron@username.plus.com
*/5 * * * * /command/to/execute



</entry>



<entry [Fri Jul 11 14:26:07 EDT 2008] FIND OUT THE linux VERSION ON THE COMMAND LINE>



[syoung@solexa01 syoung]$ cat /etc/*-release
Red Hat Enterprise Linux Server release 5.1 (Tikanga)


</entry>