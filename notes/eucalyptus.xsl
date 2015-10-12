eucalyptus


<entry [Wed 2013:01:16 06:19:54 EST] INSTALL INFO>


https://github.com/eucalyptus/eucalyptus/blob/master/INSTALL

http://www.eucalyptus.com/docs/3.2/ig/installing_euca_release.html

    
</entry>
<entry [Wed 2013:01:16 06:15:35 EST] COPY EC2 AMI TO EUCALYTPUS>


migrating an ec2 ami to eucalyptus
By dkavanagh	 2 Comments
Categories: Uncategorized	
Tags: aws, cloud, EC2, eucalyptus
There have been different instructions for using an image from Amazon’s EC2 on a local Eucalyptus cluster. This seems to be what worked best for me.

The basic steps are, launch an instance of the AMI, run euca-bundle-vol with your Eucalyptus credentials, upload bundle, register. While it would be possible to use the download-bundle/un-bundle method detailed in this post, that only works with images that your account created. The use case I’m addressing here is to get starting images for building some custom images within your private cloud. Another use case is when duplicating custom images from private to public cloud for purposes of cloud-bursting. That’ll be covered in another post.

specifically, when converting ami-1a837773 (Ubuntu-Maverick-32bit)

ec2-run-instances ami-1a837773 -k dak-keypair

When that boots, scp the credentials zip file that you got from the ECC (or your own cloud)  (i.e. scp -i dak-keypair euca2*.zip ubuntu@50.16.60.6:.) (UPDATE: my image didn’t have zip installed, so I repackaged the zip as a tar.gz) Because Ubuntu images don’t allow root login, we can only copy files into the user directory. Ideally, we don’t want credentials on the root filesystem because they’ll end up in the bundle. So, the first thing we’ll need to do after logging into the instance is to move the zip file to /mnt directory (ephemeral store). (There are additional security concerns that may apply. This post at alestic.com covers that well.)

On the instance;

1
sudo mv euca2*.zip /mnt
2
cd /mnt
3
sudo unzip euca2*.zip
4
source eucarc
To bundle/upload the image, you’ll need the euca2ools. There are some instructions here that help. This Maverick image already has them installed.

If the image has a default kernel specified (as this Maverick one does), that aki id won’t work on eucalyptus. For the ECC, looking at the list of images shows that many of them specify the eki-6CBD12F2 kernel, so I will also use that when overriding the EC2 kernel.  If you run your own Eucalyptus installation, it is easy to get the default kernel id via the management interface on the “Configuration” tab. Take note of the ramdisk id also, since that goes hand-in-hand with the kernel.

In the case of a private Eucalyptus installation, network restrictions probably won't allow the EC2 instance to upload to Eucalyptus directly. One way to do that is downloading a gzipped image to your local machine, run euca-bundle-image prior to upload. That is time consuming and since I'm working with ECC here, all of the operations can be run on the EC2 instance.

1
sudo -E euca-bundle-vol -p Ubuntu-10.10-Maverick-32bit -s 2048 -d /mnt -r i386 --kernel eki-6CBD12F2 --ramdisk eri-A97113E4</pre>
2
euca-upload-bundle -b dak-images -m /mnt/Ubuntu-10.10-Maverick-32bit.manifest.xml
3
euca-register dak-images/Ubuntu-10.10-Maverick-32bit.manifest.xml

At this point, you should be all set to launch the image.


Footnote: I've tested this with a Maverick S3 backed AMI and a Lucid EBS backed AMI.


</entry>