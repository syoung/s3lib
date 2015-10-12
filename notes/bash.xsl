bash




<entry [Fri 2015:08:28 18:16:29 EST] PASTE MULTILINE TEXT INTO A FILE>
<!--


FILE=/root/.ssh/id_rsa-siphon1
echo "Creating id_rsa file: $FILE"
rm -fr $FILE

cat <<EOT >> $FILE
-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEA7Q0PYncYnZrvSCV2Vp+fcM1Fc3KJckTngc6zlzuZxwjhi2FK
bFHWuuqwBwz1EXhi4yKx1QEt98emEmjA1nxNpj+UcXNwY7cS/fhLNblD1FzBsXfG
...
5TaJw39PeeiR3W4agMlRvHsSCUUYOynZau39yiSbl9b7KNz110B+E3gj0C2Ms4FX
RJnvKEozC83TCxTRU4HaH6C6kjfzQYD6tJRn2TQUSIe8KYNU6QbgGw==
-----END RSA PRIVATE KEY-----
EOT


-->

</entry>
<entry [Sun 2015:04:12 23:22:13 EST] FOR file in $files FROM DIR LIST>

for file in $files; do cat insert/$file >> insert.sql; echo >> insert.sql ; done
	
</entry>
<entry [Sat 2014:06:28 05:28:06 EST] USE cut WITH NEWLINE DELIMITER>

USE -d$'\n'

cat file.cut | cut -d$'\n' -f1

OR

USE CNTL + V TO PRINT ^M, THEN HIT ENTER


    cut -d^M -f1 file_cut

OR, USE -c 1-

    cut -c 1- file_cut

	
</entry>
<entry [Sat 2014:06:28 04:24:39 EST] EXTRACT TOP LINE OF top>


top -b -d 1 | grep  --line-buffered -1 PID | sed -e 's/PID USER      PR  NI  VIRT  RES  SHR S  %CPU %MEM    TIME+  COMMAND//g'

	7117 syoung    20   0 2500m 906m  43m S  17.8  2.8  11:07.85 chrome
   --
   
	 
	7117 syoung    20   0 2500m 906m  43m S  22.4  2.8  11:08.08 chrome
   --

export HEADER="PID USER      PR  NI  VIRT  RES  SHR S  %CPU %MEM    TIME+  COMMAND"
top -b -d 1 | grep  --line-buffered -1 PID | sed -e 's/$HEADER//g'



top -b -d 1 | grep  --line-buffered -1 PID | sed -e 's/\-\-//g'

  PID USER      PR  NI  VIRT  RES  SHR S  %CPU %MEM    TIME+  COMMAND
 3552 syoung    20   0 1217m 202m  46m S  11.3  0.6   4:09.91 komodo



top -b -d 1 | xargs -n 12 echo | grep -1 "PID"
738048 buffers KiB Swap: 32767996 total, 0 used, 32767996 free, 2106024 cached
PID USER PR NI VIRT RES SHR S %CPU %MEM TIME+ COMMAND
26737 syoung 20 0 26052 1780 1040 R 17.0 0.0 0:00.04 top
--


top -b -d 1 | grep  --line-buffered -1 PID | grep -e "^ [0-9]*"
  PID USER      PR  NI  VIRT  RES  SHR S  %CPU %MEM    TIME+  COMMAND
 1297 syoung    20   0 26212 1832 1040 R  16.7  0.0   0:00.03 top
  PID USER      PR  NI  VIRT  RES  SHR S  %CPU %MEM    TIME+  COMMAND
 8037 syoung    20   0 1102m 207m  26m S  19.3  0.6  61:02.74 chrome
 
top -b -d 1 | grep  --line-buffered -1 PID | grep -e "^ [0-9]*" | sed -e 's/PID USER      PR  NI  VIRT  RES  SHR S  %CPU %MEM    TIME+  COMMAND//g'
 

 
top -b -d 1 | grep  --line-buffered -1 PID | xargs -n 12 | grep -v PID
1674 syoung 20 0 26184 1900 1040 R 21.7 0.0 0:00.04 top
COMMAND 8037 syoung 20 0 1102m 207m 26m S 24.0 0.6 63:22.82
TIME+ COMMAND 8037 syoung 20 0 1102m 207m 26m S 17.3 0.6
%MEM TIME+ COMMAND 8037 syoung 20 0 1102m 208m 26m S 20.2



top -b -d 1 | grep  --line-buffered -1 PID | perl -p -e "s/(\\s+PID[^\\n]+\\n|^\-\-\\n)//mg;" 

 4104 syoung    20   0 26452 2072 1040 R  21.0  0.0   0:00.06 top

 8037 syoung    20   0 1102m 209m  26m S  19.1  0.7  70:01.81 chrome

 8037 syoung    20   0 1102m 209m  26m S  16.2  0.7  70:01.98 chrome

BUT WON'T PRINT TO FILE!


top -b -d 1 | grep  --line-buffered -1 PID | perl -p -e "s/(\\s+PID[^\\n]+\\n|^\-\-\\n)//mg;"  >> OUT

cat OUT


</entry>
<entry [Sun 2014:06:08 19:23:11 EST] STRING REPLACE>

#!/bin/bash

HOSTNAME=`facter hostname`
#HOSTNAME=Download.v10.userdata
echo "HOSTNAME: $HOSTNAME"
WORKFLOW=${HOSTNAME/\.*/}
echo "WORKFLOW: $WORKFLOW"

	
</entry>
<entry [Fri 2014:04:18 04:35:27 EST] REDIRECT TO STDERR AND STDOUT AND STILL OUTPUT TO CONSOLE>

GET OUTPUT AND STDERR/STDOUT REDIRECTION

logfile=/full/path/to/log
exec > >( tee $logfile  ) 2>&1


GET STDERR/STDOUT REDIRECTION

logfile=/full/path/to/log
exec > $logfile 2>&1
	
exec >$logfile 2>&1

NB: The exec command is taking over the current shell running it and then sending stdout and stderr to this file. Now any command/function etc that is run within the script will send its output to that file.

NNB: Use 2>&1 on systems with older versions of bash. In modern cases this has been replaced with “&>”


</entry>
<entry [Wed 2014:04:16 15:53:44 EST] USE xargs TO READ LINES OF A FILE AS COMMAND LINE ARGUMENTS>


cat test | \
while read CMD; do
echo $CMD
done

xargs is the most flexible solution for splitting output into command arguments.

It is also very human readable and easy to use due to its simple parameterisation.

Format is xargs -n $NUMLINES mycommand.

For example, to echo each individual line in a file /tmp/tmp.txt you'd do:

cat /tmp/tmp.txt | xargs -n 1 echo
Or to diff each successive pair of files listed as lines in a file of the above name you'd do:

cat /tmp/tmp.txt | xargs -n 2 diff
The -n 2 instructs xargs to consume and pass as separate arguments two lines of what you've piped into it at a time.

You can tailor xargs to split on delimiters besides carriage return/newline.

Use man xargs and google to find out more about the power of this versatile utility.	


</entry>
<entry [Tue 2014:04:08 03:46:15 EST] READ LINES FROM A FILE AND INTO A VARIABLE>


emacs -nw runscript.sh

	#!/bin/bash
	
	while read LINE  
	do  
	  echo $LINE
	done
	
	exit


	
</entry>
<entry [Fri 2014:01:03 13:48:02 EST] GET REAL FILE PATH WITH 'readlink -f $0'>

#### SCRIPT MUST BE INVOKED, NOT SOURCED, FOR THIS TO WORK

FILEPATH=$(readlink -f $0)
echo "\$0: $0"
echo "FILEPATH: $FILEPATH"
echo "PWD: $PWD"
FILEDIR=`expr $FILEPATH : '\([\/a-zA-Z0-9]*\)/[^\/]*'`
echo "FILEDIR: $FILEDIR"
source $FILEDIR/common.sh

exit;
	

	
</entry>
<entry [Sun 2013:12:22 12:14:13 EST] ADD er FUNCTION FOR APACHE ERROR LOG>
	
function er() {
    APACHELOG=/var/log/apache2/error.log
    HTTPLOG=/var/log/httpd/error_log
    if [ -f "$APACHELOG" ]; then
        tail -f -n 100 "$APACHELOG";
    elif [ -f "$HTTPLOG" ]; then
        tail -f -n 100 "$HTTPLOG";
    else
        echo "NEITHER centos NOR ubuntu APACHE LOGS FOUND"
    fi;
}

	
</entry>