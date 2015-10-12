services


<entry [Tue 2013:02:19 14:12:15 EST] PULLED saffrondev AND services FROM BITBUCKET>

NOTE: ALREADY ENABLED MULTIPLE SSH KEYS 
SEE [Tue 2013:02:19 11:47:26 EST] ENABLED MULTIPLE SSH KEYS WITH USER syoung

CHECKLIST:
    -   ssh-agent IS RUNNING
        ps aux | grep ssh-agent
        
        IF NOT RUNNING:
        exec ssh-agent /bin/bash
        
    -   KEY HAS BEEN ADDED USING ssh-add
        ssh-add /home/syoung/.ssh/hosts/bitbucket    

    -   FOR git pull TO WORK:
        -   MUST BE IN SAME SHELL IN WHICH ssh-agent WAS STARTED AND KEYS WERE ADDED



1. PULL saffrondev FROM BITBUCKET

mkdir -p /mnt/repos/private/illuminadev/saffrondev
cd /mnt/repos/private/illuminadev/saffrondev
git pull -u bit master
    remote: Counting objects: 6753, done.
    remote: Compressing objects: 100% (2788/2788), done.
    remote: Total 6753 (delta 3605), reused 6753 (delta 3605)
    Receiving objects: 100% (6753/6753), 24.17 MiB | 2.18 MiB/s, done.
    Resolving deltas: 100% (3605/3605), done.
    From ssh://bitbucket.org/illuminadev/saffrondev
     * branch            master     -> FETCH_HEAD


2. PULL services FROM BITBUCKET

mkdir -p /mnt/repos/private/illuminadev/services
cd /mnt/repos/private/illuminadev/services
git init
git remote add bit ssh://git@bitbucket.org/illuminadev/services.git 
git pull -u bit master
    remote: Counting objects: 3070, done.
    remote: Compressing objects: 100% (1922/1922), done.
    remote: Total 3070 (delta 1123), reused 3053 (delta 1119)
    Receiving objects: 100% (3070/3070), 5.41 MiB | 1.46 MiB/s, done.
    Resolving deltas: 100% (1123/1123), done.
    From ssh://bitbucket.org/illuminadev/services
     * branch            master     -> FETCH_HEAD


</entry>
<entry [Tue 2013:02:19 11:47:26 EST] ENABLED MULTIPLE SSH KEYS WITH USER syoung (ADDED illuminadev PRIVATE KEY CONFIGURATION TO SSH config FILE)>

1. COPY illuminadev KEYS TO /home/syoung/.ssh/hosts

mkdir /home/syoung/.ssh/
cp /home/syoung/notes/agua/keypairs/illuminadev/id_rsa* /home/syoung/.ssh/hosts/bitbucket
cp /home/syoung/notes/agua/keypairs/illuminadev/id_rsa* /home/syoung/.ssh/hosts/github


2. CREATE SSH CONFIG FILE

em ~/.ssh/config

# GITHUB
Host github.com
 User illuminatest
 HostName github.com
 PreferredAuthentications publickey
 IdentityFile ~/.ssh/hosts/github/id_rsa
 
# BITBUCKET
Host bitbucket.org
 User illuminadev
 HostName bitbucket.org
 PreferredAuthentications publickey
 IdentityFile ~/.ssh/hosts/bitbucket/id_rsa


3. START SSH-AGENT IF NOT RUNNING *** AS syoung USER ***

ps aux | grep ssh-agent

NOT RUNNING?

exec ssh-agent /bin/bash


4. ADD KEYS TO SSH-AGENT *** AS syoung USER ***

ssh-add -l
    The agent has no identities.

ssh-add /home/syoung/.ssh/hosts/bitbucket/id_rsa
    Identity added: /home/syoung/.ssh/hosts/bitbucket/id_rsa (/home/syoung/.ssh/hosts/bitbucket/id_rsa)
ssh-add /home/syoung/.ssh/hosts/github/id_rsa
    Identity added: /home/syoung/.ssh/hosts/github/id_rsa (/home/syoung/.ssh/hosts/github/id_rsa)
    
 
5. PULL saffrondev FROM BITBUCKET

cd /mnt/repos/private/illuminadev/saffrondev
git pull -u bit master
    remote: Counting objects: 6753, done.
    remote: Compressing objects: 100% (2788/2788), done.
    remote: Total 6753 (delta 3605), reused 6753 (delta 3605)
    Receiving objects: 100% (6753/6753), 24.17 MiB | 2.18 MiB/s, done.
    Resolving deltas: 100% (3605/3605), done.
    From ssh://bitbucket.org/illuminadev/saffrondev
     * branch            master     -> FETCH_HEAD


</entry>
<entry [Thu 2013:02:14 23:05:38 EST] STASH>

INTRODUCTION
http://www.atlassian.com/en/software/stash/whats-new/stash-21?utm_source=stash-2-1-email&utm_medium=email&utm_campaign=stash-2-1&utm_content=j

GETTING STARTED
https://confluence.atlassian.com/display/STASH/Getting+Started


</entry>
<entry [Thu 2013:02:14 20:29:09 EST] WEBMAIL>

webmail.illumina.com

NOTE: MUST USE 'ILLUMINA\syoung1'

</entry>
<entry [Thu 2013:02:14 20:27:50 EST] HOST LOCATIONS>

SAFFRON
http://ussd-prd-lnwb01.illumina.com/saffronDB/cgi-bin/project.cgi
    


SSH TO NODE 2 OF 4 ENTRY NODES FOR SGE MASTER

ssh syoung1@uscp-prd-lndt.illumina.com

    syoung1@uscp-prd-lndt-1-2


hostname
    uscp-prd-lndt-1-2.local


ll /illumina/

    drwxr-xr-x  5 root     root                    60 Oct  3 05:32 archive
    -rw-r--r--  1    65534 root                     0 Oct 25 16:59 bla
    drwxr-xr-x  6 root     root                    59 May  4  2012 build
    -rw-r--r--  1    65534 root                     0 Oct 12 09:38 contrib
    drwxrwxrwx  9 root     root                   183 Oct 12 09:38 contribute
    drwxrwxr-x 36 mvarea   GRP_HPC_Development_RW 563 Dec 12 11:32 development
    lrwxrwxrwx  1 bsickler root                    24 Oct  5 11:28 Genomes -> scratch/services/Genomes
    drwxrwxr-x 19 root     root                   589 Jan 11 08:05 GIS
    drwxrwxrwx 15 root     root                   465 Dec 19 13:03 goldilocks
    drwxr-xr-x  3 root     root                    20 Jan 22 10:25 gridware
    drwxr-xr-x  6 root     root                    59 May  4  2012 postbuild
    drwxr-xr-x  9 root     root                   132 Sep 14 14:59 scratch
    drwxrwxrwx 28 root     root                   560 Feb 12 10:54 scripts
    drwxrwxr-x  5 adesikan GRP_HPC_Software_RW     44 Dec  7 13:21 software
    -rw-r--r--  1 root     root                     0 Oct 25 16:52 testfile
    drwxrwxrwx 52 root     root                   880 Feb  7 18:10 thirdparty
    drwxrwxrwx  6 root     root                    59 Feb 14 10:44 upload


</entry>
