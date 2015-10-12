jenkins



<entry [Fri 2014:01:03 14:22:07 EST] AUTOMATED NETWORK TESTING>

1. SET UP JENKINS SERVER

http://ci.openstack.org/jenkins.html

Sysadmin

Jenkins is largely hidden, and has no sensitive data exposed publically, so we use self-signed certs for Jenkins masters.

After bringing up a jenkins node (16G memory instance if you use the stock jenkins.default) with puppet, log in and configure Jenkins by hand:

    Configure the site so it knows it’s correct url. (Jenkins URL in global config). This is needed to complete an SSO sign-in.
    Configure the OpenID plugin for your SSO site (e.g. Launchpad)
    Do not set CSRF protection - that breaks Jenkins job builder.
    Login.
    Setup matrix security: add the ‘authenticated’ pseudo user and grant Admin access to your own user.
    Setup one account per http://ci.openstack.org/jenkins-job-builder/installation.html#configuration-file and grab the API token for it.
    Configure the number of executors you want on the Jenkins Master (e.g. 1)
    Configure a maven environment (if you have Maven projects to test).
    Enable the gearman plugin globally. Your gearman server is zuul.$project. If Test Connection fails, do a puppet run (puppet agent –test) on the zuul machine, as gearman wouldn’t have started with no workers configured.
    Configure the timestamper plugin. E.g. to ‘<b>’yyyy-MM-dd HH:mm:ss’</b> ‘
    Enable the zmq plugin globally if it is visible. No settings were visible when writing this doc.
    You will configure global scp and ftp credentials for static and docs sites respectively later, but as we haven’t setup those sites yet, thats not possible :).

Puppet takes care of the rest.


Java, Eclipse, Selenium, TestNG, Maven, Perforce, and the Jenkins continuous integration system

	
</entry>