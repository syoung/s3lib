openstack



<entry [Wed 2014:08:06 05:20:19 EST] GET QUOTA AND USAGE>

. /agua/conf/.targetdir/CU-openrc.sh && nova quota-show
+-----------------------------+---------+
| Quota                       | Limit   |
+-----------------------------+---------+
| instances                   | 100     |
| cores                       | 576     |
| ram                         | 4718592 |
| floating_ips                | 10      |
| fixed_ips                   | -1      |
| metadata_items              | 128     |
| injected_files              | 5       |
| injected_file_content_bytes | 10240   |
| injected_file_path_bytes    | 255     |
| key_pairs                   | 100     |
| security_groups             | 10      |
| security_group_rules        | 20      |
+-----------------------------+---------+
root@master:/agua/bin/daemon# . /agua/conf/.targetdir/CU-openrc.sh && nova list
+--------------------------------------+----------------------+--------+------------+-------------+-----------------------------------------+
| ID                                   | Name                 | Status | Task State | Power State | Networks                                |
+--------------------------------------+----------------------+--------+------------+-------------+-----------------------------------------+
| b3e777df-9d3d-4c6d-a376-eeed286b0897 | Download-28c10ce3954 | ACTIVE | -          | Running     | tenant_net=10.2.24.104, 132.249.227.105 |
| 7b6bf94d-f8e7-4989-a123-7c22af1d6333 | master               | ACTIVE | -          | Running     | tenant_net=10.2.24.103, 132.249.227.125 |
| 5797cd14-e8bd-493f-828a-13f5ff8d2ce5 | nrc                  | ACTIVE | -          | Running     | tenant_net=10.2.24.123, 132.249.227.107 |
| 4f724c22-c8c4-4ecc-b537-9554eddde200 | share                | ACTIVE | -          | Running     | tenant_net=10.2.24.107, 132.249.227.126 |
| e8e4a394-c733-46da-8e05-77deeba2be0b | workflowone          | ACTIVE | -          | Running     | tenant_net=10.2.24.115, 132.249.227.110 |
| d8ec7d0d-caaf-4ecf-ab8a-bcbd9fd2060c | workflowtwo          | ACTIVE | -          | Running     | tenant_net=10.2.24.117, 132.249.227.108 |
+--------------------------------------+----------------------+--------+------------+-------------+-----------------------------------------+
 
</entry>
<entry [Sun 2014:05:11 09:31:06 EST] INSTALL OPENSTACK API CLIENTS>
	

aptitude install -y python-pip 
pip install python-novaclient 
pip install python-cinderclient 


</entry>
<entry [Thu 2014:05:08 14:20:50 EST] nova boot COMMAND WITH USER DATA>

nova boot --image ubuntu-cloudimage --flavor 1 --user-data mydata.file
	
</entry>
<entry [Tue 2014:04:22 02:57:45 EST] GET USER DATA AND OTHER INFO>

 curl http://169.254.169.254/2009-04-04/meta-data/security-groups; echo

curl http://169.254.169.254/2009-04-04/meta-data/ami-id; echo
ami-0000002e
curl http://169.254.169.254/2009-04-04/meta-data/ami-launch-index; echo
0
curl http://169.254.169.254/2009-04-04/meta-data/ami-manifest-path; echo
FIXME
curl http://169.254.169.254/2009-04-04/meta-data/block-device-mapping/; echo
ami
root
curl http://169.254.169.254/2009-04-04/meta-data/hostname; echo
testinstance.novalocal
curl http://169.254.169.254/2009-04-04/meta-data/instance-action; echo
none
curl http://169.254.169.254/2009-04-04/meta-data/instance-id; echo
i-00000581
curl http://169.254.169.254/2009-04-04/meta-data/instance-type; echo
bcf.8c.64g
curl http://169.254.169.254/2009-04-04/meta-data/kernel-id; echo
aki-00000002
curl http://169.254.169.254/2009-04-04/meta-data/local-hostname; echo
testinstance.novalocal
curl http://169.254.169.254/2009-04-04/meta-data/local-ipv4; echo
10.2.24.145
curl http://169.254.169.254/2009-04-04/meta-data/placement/; echo
availability-zone
curl http://169.254.169.254/2009-04-04/meta-data/public-hostname; echo
testinstance.novalocal
curl http://169.254.169.254/2009-04-04/meta-data/public-ipv4; echo
132.249.227.109
curl http://169.254.169.254/2009-04-04/meta-data/public-keys/; echo
0=annai
curl http://169.254.169.254/2009-04-04/meta-data/ramdisk-id; echo
ari-00000002
curl http://169.254.169.254/2009-04-04/meta-data/reservation-id; echo


GET SUBMITTED USER DATA
curl http://169.254.169.254/2009-04-04/user-data

GET INSTANCE META DATA

INTERNAL IP
curl http://169.254.169.254/2009-04-04/meta-data/local-ipv4

EXTERNAL IP
curl http://169.254.169.254/2009-04-04/meta-data/public-ipv4

curl http://169.254.1+69.254/2009-04-04/meta-data/instance-id

curl http://169.254.169.254/2009-04-04/meta-data/hostname

	split.v2-5.hd800-real-de2e4a8b-7034-4525-ab3e-33fc993797f8.novalocal

	
curl http://169.254.169.254/2009-04-04/meta-data/local-hostname

curl http://169.254.169.254/2009-04-04/meta-data/public-hostname
	
curl http://169.254.169.254/2009-04-04/meta-data/instance-id


curl http://169.254.169.254/2009-04-04/meta-data/block-device-mapping/

ami-id
ami-launch-index
ami-manifest-path
block-device-mapping/
hostname
instance-action
instance-id
instance-type
kernel-id
local-hostname
local-ipv4
placement/
public-hostname
public-ipv4
public-keys/
ramdisk-id
reservation-id
security-groups

$ curl http://169.254.169.254/2009-04-04/meta-data/block-device-mapping/
ami
$ curl http://169.254.169.254/2009-04-04/meta-data/placement/
availability-zone
$ curl http://169.254.169.254/2009-04-04/meta-data/public-keys/
0=mykey



curl http://169.254.169.254/2009-04-04/meta-data/ami-id; echo
curl http://169.254.169.254/2009-04-04/meta-data/ami-launch-index; echo
curl http://169.254.169.254/2009-04-04/meta-data/ami-manifest-path; echo
curl http://169.254.169.254/2009-04-04/meta-data/block-device-mapping/; echo
curl http://169.254.169.254/2009-04-04/meta-data/hostname; echo
curl http://169.254.169.254/2009-04-04/meta-data/instance-action; echo
curl http://169.254.169.254/2009-04-04/meta-data/instance-id; echo
curl http://169.254.169.254/2009-04-04/meta-data/instance-type; echo
curl http://169.254.169.254/2009-04-04/meta-data/kernel-id; echo
curl http://169.254.169.254/2009-04-04/meta-data/local-hostname; echo
curl http://169.254.169.254/2009-04-04/meta-data/local-ipv4; echo
curl http://169.254.169.254/2009-04-04/meta-data/placement/; echo
curl http://169.254.169.254/2009-04-04/meta-data/public-hostname; echo
curl http://169.254.169.254/2009-04-04/meta-data/public-ipv4; echo
curl http://169.254.169.254/2009-04-04/meta-data/public-keys/; echo
curl http://169.254.169.254/2009-04-04/meta-data/ramdisk-id; echo
curl http://169.254.169.254/2009-04-04/meta-data/reservation-id; echo
curl http://169.254.169.254/2009-04-04/meta-data/security-groups; echo



</entry>