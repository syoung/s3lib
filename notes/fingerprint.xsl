fingerprint


<entry [Mon 2013:12:30 15:38:54 EST] INSTALLED truesuite FOR UPEK ON OSX>

http://web.archive.org/web/20130616232312/http://support.authentec.com/Downloads/Mac/TrueSuite.aspx#LiveTabsContent39073



    
</entry>
<entry [Wed 2013:08:21 20:09:57 EST] FIX ERROR: KEYCHAIN ...>

USE SEAHORSE:

1. START THE Gnome Keyring Manager (Seahorse)

Press Alt+F2, type seahorse and press Enter to start the Gnome Keyring Manager

Alternately, open a terminal with Ctrl+F2+T, type seahorse & and press Enter.

2. CHANGE PASSWORD

The "Passwords and Keys" window should come up as shown below. Under the Passwords tab, select login, right-click on it, and then click on Change Password:

The "Change Keyring Password" box will come up. Type your old password, and then leave the new/confirm password fields blank. Then press OK, and the information box shown below will pop-up; read it, and then click on Use Unsafe Storage to not have to enter your password at each login:

enter image description here

Close the keyring manager. After you log out/reboot, you won't be asked for your password any more.


	
</entry>
<entry [Fri 2013:07:05 01:02:23 EST] INSTALL FINGERPRINT-GUI>
 
   
sudo add-apt-repository ppa:fingerprint/fingerprint-gui
sudo apt-get update
sudo apt-get install libbsapi policykit-1-fingerprint-gui fingerprint-gui


#### DON'T NEED TO INSTALL THIS

#sudo apt-get install fprint-demo libfprint-dev libfprint0 libpam-fprintd aes2501-wy    

</entry>
