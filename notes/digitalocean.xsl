digitalocean



<entry [Fri 2014:09:12 14:07:48 EST] LAUNCHED digi02>


1. LOGIN

ssh root@192.241.223.100
nzyhumxkodqa#C**b*s

2. ADD USER vesi

groupadd vesi 
useradd --create-home vesi -g vesi 


3. ADD KEY aquarius7

mkdir -p /home/vesi/.ssh
emacs /home/vesi/.ssh/authorized_keys

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyvEtr0Q9BqAHGyQ2ecNPczQ8hf9BiOu9wwUn0YZkNyyP8jmIvUnubske/nF4U/NpL8AoCUjerds4aRpaQnCYbhTegMdEDUrNsqAF4eQ9ppoHQppGzcqZGhBwhqMtpzQbPAFsA9ANYY3vx6UlIJJqIDA75K8erDK0SouWpnCTOfebEebHHHQOj6vRnAw4k7fet0leyN7c4Sehxn+myqCP9mlhXcUfJuhkO+A8DhCOHTtyTRyKsuPPnv2pI+I1Nt38MlM0PNj6OEznvxU2e1+LKdVJplaXHYSXFsj5H6F7gkgzw05oyDuuf61kgaIiXr4GML1r876oCAojv59sxFFdJ syoung@comp3

chmod 400 /home/vesi/.ssh/authorized_keys
chown -R vesi:vesi /home/vesi/.ssh


4. ADD TO SUDOERS

vesi    ALL=(ALL:ALL) NOPASSWD: ALL


5. ADD SHORTCUT TO .profile

alias digi2='ssh vesi@192.241.223.100'


    
</entry>
<entry [Mon 2014:09:08 14:02:35 EST] CREATED aquarius7 KEY FOR DIGITAL OCEAN, GITHUB AND BITBUCKET>

1. CREATE aquarius7

cd /home/syoung/.ssh
ssh-keygen

    Your identification has been saved in /home/syoung/.ssh/id_rsa.
    Your public key has been saved in /home/syoung/.ssh/id_rsa.pub.
    The key fingerprint is:
    26:f8:31:4b:b7:7c:f3:98:0b:a5:3b:12:fe:8a:12:96 syoung@comp3
    The key's randomart image is:
    +--[ RSA 2048]----+
    |                 |
    |                 |
    |                 |
    |     .           |
    |   .. = S .      |
    |  E  o.O +       |
    | . . .o.= o      |
    |  .  .o .+ =     |
    |   .. .+o.+..    |
    +-----------------+

    
2. STORE aquarius7 IN KEYPAIRS

cd /home/syoung/.ssh/aquarius7
zip -e aquarius7.zip id_rsa*
    c**b*s#**x


3. ADD aquarius7 AS vesi KEY ON DIGITAL OCEAN

CONNECT

ssh root@107.170.219.63
jzkskaecvbcx


ADD TO .profile

alias digi='ssh vesi@107.170.219.63'

    OK

    
</entry>
<entry [Fri 2014:09:05 23:09:08 EST] CREATED USER vesi>

1. ADD vesi

groupadd vesi 
useradd --create-home vesi -g vesi 


2. ADD KEY aquarius7

mkdir -p /home/vesi/.ssh
emacs /home/vesi/.ssh/authorized_keys

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyvEtr0Q9BqAHGyQ2ecNPczQ8hf9BiOu9wwUn0YZkNyyP8jmIvUnubske/nF4U/NpL8AoCUjerds4aRpaQnCYbhTegMdEDUrNsqAF4eQ9ppoHQppGzcqZGhBwhqMtpzQbPAFsA9ANYY3vx6UlIJJqIDA75K8erDK0SouWpnCTOfebEebHHHQOj6vRnAw4k7fet0leyN7c4Sehxn+myqCP9mlhXcUfJuhkO+A8DhCOHTtyTRyKsuPPnv2pI+I1Nt38MlM0PNj6OEznvxU2e1+LKdVJplaXHYSXFsj5H6F7gkgzw05oyDuuf61kgaIiXr4GML1r876oCAojv59sxFFdJ syoung@comp3

chmod 400 /home/vesi/.ssh/authorized_keys
chown -R vesi:vesi /home/vesi/.ssh


3. ADD TO SUDOERS

vesi    ALL=(ALL:ALL) NOPASSWD: ALL


4. ADD SHORTCUT TO .profile

alias digi='ssh vesi@107.170.219.63'


    
</entry>
<entry [Sat 2014:03:22 12:54:26 EST] SUPPORT>

https://cloud.digitalocean.com/support


get started or install specific software to your Droplet:

https://www.digitalocean.com/community


how-to guide:

https://www.digitalocean.com/community/articles/how-to-create-your-first-digitalocean-droplet-virtual-server


chat with fellow developers IRC channel

#digitalocean on irc.freenode.com

web-chat:

http://webchat.freenode.net/?channels=digitalocean&uio=d4

	
</entry>
<entry [Sat 2014:03:22 12:46:48 EST] agua DROPLET>

ssh root@107.170.219.63
jzkskaecvbcx
###kdzhimqofddb

</entry>
<entry [Sat 2014:03:22 12:41:53 EST] DIGITAL OCEAN ACCOUNT LOGIN>

USER: stuartpyoung@gmail
PASS: s****
CARD: VISA
	
</entry>