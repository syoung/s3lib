perl6

<entry [Sat 2015:08:15 15:54:19 EST] INSTALL p6 ON LINUX>

1. INSTALL rakudobrew

sudo git clone https://github.com/tadzik/rakudobrew /home/syoung/.rakudobrew

ADD TO .profile

export PATH=~/.rakudobrew/bin:$PATH


2. INSTALL LATEST RAKUDO WITH MOARVM

rakudobrew build moar


3. INSTALL PANDA module management tool

rakudobrew build-panda


4. LATER: UPGRADE Perl 6

rakudobrew build moar


5. LATER: UPGRADE rakudobrew

rakudobrew self-upgrade


5. UNINSTALL Perl 6


rm -fr ~/.rakudobrew



</entry>