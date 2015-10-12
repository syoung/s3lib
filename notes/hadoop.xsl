hadoop


<entry [Sun 2014:11:16 23:01:29 EST] INSTALL PIG>

http://www.cloudera.com/content/cloudera/en/documentation/cdh4/latest/CDH4-Installation-Guide/cdh4ig_topic_16_2.html


Installing Pig
To install Pig On Red Hat-compatible systems:

$ sudo yum install pig
To install Pig on SLES systems:

$ sudo zypper install pig
To install Pig on Ubuntu and other Debian systems:

$ sudo apt-get install pig
  Note:
Pig automatically uses the active Hadoop configuration (whether standalone, pseudo-distributed mode, or distributed). After installing the Pig package, you can start the grunt shell.

To start the Grunt Shell (MRv1):

Use commands similar to the following, replacing the < component_version> strings with the current HBase, ZooKeeper and CDH versions.

$ export PIG_CONF_DIR=/usr/lib/pig/conf
$ export PIG_CLASSPATH=/usr/lib/hbase/hbase-< HBase_version>-cdh< CDH_version>-security.jar:/usr/lib/zookeeper/zookeeper-< ZooKeeper_version>-cdh< CDH_version>.jar
$ pig 
2012-02-08 23:39:41,819 [main] INFO  org.apache.pig.Main - Logging error messages to: /home/arvind/pig-0.9.2-cdh4b1/bin/pig_1328773181817.log
2012-02-08 23:39:41,994 [main] INFO  org.apache.pig.backend.hadoop.executionengine.HExecutionEngine - Connecting to hadoop file system at: hdfs://localhost/
...
grunt>
Here's an example.

$ export PIG_CONF_DIR=/usr/lib/pig/conf
$ export PIG_CLASSPATH=/usr/lib/hbase/hbase-0.94.6-cdh4.4.0-security.jar:/usr/lib/zookeeper/zookeeper-3.4.5-cdh4.4.0.jar
$ pig 
2012-02-08 23:39:41,819 [main] INFO  org.apache.pig.Main - Logging error messages to: /home/arvind/pig-0.9.2-cdh4b1/bin/pig_1328773181817.log
2012-02-08 23:39:41,994 [main] INFO  org.apache.pig.backend.hadoop.executionengine.HExecutionEngine - Connecting to hadoop file system at: hdfs://localhost/
...
grunt> 
To start the Grunt Shell (YARN):

  Important:
For each user who will be submitting MapReduce jobs using MapReduce v2 (YARN), or running Pig, Hive, or Sqoop in a YARN installation, set the HADOOP_MAPRED_HOME environment variable as follows:
$ export HADOOP_MAPRED_HOME=/usr/lib/hadoop-mapreduce
Use the following commands, replacing the < component_version> string with the current HBase, ZooKeeper and CDH version numbers.

$ export PIG_CONF_DIR=/usr/lib/pig/conf
$ export PIG_CLASSPATH=/usr/lib/hbase/hbase-< HBase_version>-cdh< CDH_version>-security.jar:/usr/lib/zookeeper/zookeeper-< ZooKeeper_version>-cdh< CDH_version>.jar
$ pig 
...
grunt>
For example,

$ export PIG_CONF_DIR=/usr/lib/pig/conf
$ export PIG_CLASSPATH=/usr/lib/hbase/hbase-0.94.6-cdh4.4.0-security.jar:/usr/lib/zookeeper/zookeeper-3.4.5-cdh4.4.0.jar
$ pig 
...
grunt>
To verify that the input and output directories from the example grep job exist (see Installing CDH4 on a Single Linux Node in Pseudo-distributed Mode), list an HDFS directory from the Grunt Shell:

grunt> ls
hdfs://localhost/user/joe/input < dir>
hdfs://localhost/user/joe/output < dir>
To run a grep example job using Pig for grep inputs:

grunt> A = LOAD 'input';
grunt> B = FILTER A BY $0 MATCHES '.*dfs[a-z.]+.*';
grunt> DUMP B;
 	
To check the status of your job while it is running, look at the JobTracker web console http://localhost:50030/.


	
</entry>