<entry [Thu 2012:08:09 01:34:06 EST] FIXED ERROR: 'Permission to syoung/biorepository.git denied to syoung/aguatestdev'>

PROBLEM

GIT ASSUMES syoung:aguatestdev KEY WHEN TRYING TO PUSH TO syoung:biorepository

export GIT_SSH=/agua/conf/.repos/github/syoung/git-ssh.sh;
git push -u github master --force --verbose

    Pushing to git@github.com:syoung/biorepository.git
    ERROR: Permission to syoung/biorepository.git denied to syoung/aguatestdev.
    fatal: The remote end hung up unexpectedly

WHERE GIT-SSH FILE CONTAINS LOCATION OF KEY FILE:

cat /agua/conf/.repos/github/syoung/git-ssh.sh 

    #!/bin/sh
    
    exec ssh -v -T -i /agua/conf/.repos/github/syoung/id_rsa -o "StrictHostKeyChecking no" -o "IdentitiesOnly yes" "$@"
    exit 0


DIAGNOSIS

PREVIOUSLY SET ed2_private_key AS DEPLOY KEY FOR syoung:aguatestdev
(SEE [Mon 2012:07:16 05:49:53 EST] SUCCESSFUL TEST UPGRADE aguatest USING DEPLOY KEY)

syoung:aguatestdev --> Admin --> Deploy Keys

    EC2 aquarius4 ? (74:4d:d4:a9:f3:bd:58:ce:11:a3:0b:92:e9:ce:35:7e)



SOLUTION

1. REMOVE ec2_private_key DEPLOY KEY FROM syoung:aguatestdev

syoung:aguatestdev --> Admin --> Deploy Keys --> Delete

NO MORE ERROR MESSAGE:
    
    ERROR: Permission to syoung/biorepository.git denied to syoung/aguatestdev

BUT NOW GIVES ERROR:

    Permission denied (publickey).


2. ADD ec2_private_key AS DEPLOY KEY TO syoung:biorepository

    ec2_private_key (74:4d:d4:a9:f3:bd:58:ce:11:a3:0b:92:e9:ce:35:7e)


3. VERIFY SSH KEY ON GITHUB

www.github.com/syoung --> Edit My Profile --> SSH Keys
    
    aquarius2 (a0:0d:00:4b:2f:7d:61:07:a9:ec:13:33:fa:df:84:af)


4. TEST PUSH TO syoung:biorepository USING id_rsa

    OK
    
OpenSSH_5.9p1 Debian-5ubuntu1, OpenSSL 1.0.1 14 Mar 2012
debug1: Reading configuration data /etc/ssh/ssh_config
debug1: /etc/ssh/ssh_config line 19: Applying options for *
debug1: Connecting to github.com [207.97.227.239] port 22.
debug1: Connection established.
debug1: permanently_set_uid: 0/0
debug1: identity file /agua/conf/.repos/github/syoung/id_rsa type 1
debug1: Checking blacklist file /usr/share/ssh/blacklist.RSA-1024
debug1: Checking blacklist file /etc/ssh/blacklist.RSA-1024
debug1: identity file /agua/conf/.repos/github/syoung/id_rsa-cert type -1
debug1: Remote protocol version 2.0, remote software version OpenSSH_5.5p1 Debian-6+squeeze1+github8
debug1: match: OpenSSH_5.5p1 Debian-6+squeeze1+github8 pat OpenSSH*
debug1: Enabling compatibility mode for protocol 2.0
debug1: Local version string SSH-2.0-OpenSSH_5.9p1 Debian-5ubuntu1
debug1: SSH2_MSG_KEXINIT sent
debug1: SSH2_MSG_KEXINIT received
debug1: kex: server->client aes128-ctr hmac-md5 none
debug1: kex: client->server aes128-ctr hmac-md5 none
debug1: SSH2_MSG_KEX_DH_GEX_REQUEST(1024< 1024< 8192) sent
debug1: expecting SSH2_MSG_KEX_DH_GEX_GROUP
debug1: SSH2_MSG_KEX_DH_GEX_INIT sent
debug1: expecting SSH2_MSG_KEX_DH_GEX_REPLY
debug1: Server host key: RSA 16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48
debug1: Host 'github.com' is known and matches the RSA host key.
debug1: Found key in /root/.ssh/known_hosts:1
debug1: ssh_rsa_verify: signature correct
debug1: SSH2_MSG_NEWKEYS sent
debug1: expecting SSH2_MSG_NEWKEYS
debug1: SSH2_MSG_NEWKEYS received
debug1: Roaming not allowed by server
debug1: SSH2_MSG_SERVICE_REQUEST sent
debug1: SSH2_MSG_SERVICE_ACCEPT received
debug1: Authentications that can continue: publickey
debug1: Next authentication method: publickey
debug1: Offering RSA public key: /agua/conf/.repos/github/syoung/id_rsa
debug1: Server accepts key: pkalg ssh-rsa blen 151
debug1: read PEM private key done: type RSA
debug1: Authentication succeeded (publickey).
Authenticated to github.com ([207.97.227.239]:22).
debug1: channel 0: new [client-session]
debug1: Requesting no-more-sessions@openssh.com
debug1: Entering interactive session.
debug1: Remote: Forced command: gerve syoung/biorepository 74:4d:d4:a9:f3:bd:58:ce:11:a3:0b:92:e9:ce:35:7e
debug1: Remote: Port forwarding disabled.
debug1: Remote: X11 forwarding disabled.
debug1: Remote: Agent forwarding disabled.
debug1: Remote: Pty allocation disabled.
debug1: Remote: Forced command: gerve syoung/biorepository 74:4d:d4:a9:f3:bd:58:ce:11:a3:0b:92:e9:ce:35:7e
debug1: Remote: Port forwarding disabled.
debug1: Remote: X11 forwarding disabled.
debug1: Remote: Agent forwarding disabled.
debug1: Remote: Pty allocation disabled.
debug1: Sending environment.
debug1: Sending env LANG = en_US.UTF-8
Hi syoung/biorepository! You've successfully authenticated, but GitHub does not provide shell access.
debug1: client_input_channel_req: channel 0 rtype exit-status reply 0
debug1: client_input_channel_req: channel 0 rtype eow@openssh.com reply 0
debug1: channel 0: free: client-session, nchannels 1
Transferred: sent 2368, received 2856 bytes, in 0.2 seconds
Bytes per second: sent 13191.0, received 15909.4
debug1: Exit status 1



</entry>
<entry [Thu 2012:07:26 04:39:31 EST] START SSH-AGENT, USE IT TO LOAD id_rsa KEY FILE>

1. START SSH-AGENT

Some users find that the ssh-agent binds to the terminal window they use effectively blocking any further action with SSH. To avoid this problem, this runs the process and also forks it from the terminal window:
$ eval 'ssh-agent'

exec ssh-agent /bin/bash

CONFIRM STARTED:

ps aux | grep ssh
eval 'ssh-agent'

    SSH_AUTH_SOCK=/tmp/ssh-vmXyRrtX3489/agent.3489; export SSH_AUTH_SOCK;
    SSH_AGENT_PID=3490; export SSH_AGENT_PID;
    echo Agent pid 3490;


2. ADD KEY USING SSH-ADD

ssh-add /agua/conf/.repos/github/syoung/id_rsa

    Identity added: /agua/conf/.repos/github/syoung/id_rsa (/agua/conf/.repos/github/syoung/id_rsa)
    

3. TEST CONNECT TO GITHUB  *** FAILS *** BECAUSE NOT DEPLOY KEY (OK)
    
ssh -vT git@github.com -i /agua/conf/.repos/github/syoung/id_rsa

    OpenSSH_5.9p1 Debian-5ubuntu1, OpenSSL 1.0.1 14 Mar 2012
    debug1: Reading configuration data /etc/ssh/ssh_config
    debug1: /etc/ssh/ssh_config line 19: Applying options for *
    debug1: Connecting to github.com [207.97.227.239] port 22.
    debug1: Connection established.
    debug1: permanently_set_uid: 0/0
    debug1: identity file /agua/conf/.repos/github/syoung/id_rsa type 1
    debug1: Checking blacklist file /usr/share/ssh/blacklist.RSA-1024
    debug1: Checking blacklist file /etc/ssh/blacklist.RSA-1024
    debug1: identity file /agua/conf/.repos/github/syoung/id_rsa-cert type -1
    debug1: Remote protocol version 2.0, remote software version OpenSSH_5.5p1 Debian-6+squeeze1+github8
    debug1: match: OpenSSH_5.5p1 Debian-6+squeeze1+github8 pat OpenSSH*
    debug1: Enabling compatibility mode for protocol 2.0
    debug1: Local version string SSH-2.0-OpenSSH_5.9p1 Debian-5ubuntu1
    debug1: SSH2_MSG_KEXINIT sent
    debug1: SSH2_MSG_KEXINIT received
    debug1: kex: server->client aes128-ctr hmac-md5 none
    debug1: kex: client->server aes128-ctr hmac-md5 none
    debug1: SSH2_MSG_KEX_DH_GEX_REQUEST(1024< 1024< 8192) sent
    debug1: expecting SSH2_MSG_KEX_DH_GEX_GROUP
    debug1: SSH2_MSG_KEX_DH_GEX_INIT sent
    debug1: expecting SSH2_MSG_KEX_DH_GEX_REPLY
    debug1: Server host key: RSA 16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48
    debug1: Host 'github.com' is known and matches the RSA host key.
    debug1: Found key in /root/.ssh/known_hosts:1
    debug1: ssh_rsa_verify: signature correct
    debug1: SSH2_MSG_NEWKEYS sent
    debug1: expecting SSH2_MSG_NEWKEYS
    debug1: SSH2_MSG_NEWKEYS received
    debug1: Roaming not allowed by server
    debug1: SSH2_MSG_SERVICE_REQUEST sent
    debug1: SSH2_MSG_SERVICE_ACCEPT received
    debug1: Authentications that can continue: publickey
    debug1: Next authentication method: publickey
    debug1: Offering RSA public key: /agua/conf/.repos/github/syoung/id_rsa
    debug1: Authentications that can continue: publickey
    debug1: No more authentication methods to try.
    Permission denied (publickey).

</entry>
<entry [Thu 2012:07:26 04:39:30 EST] FIXED ERROR: 'Permission to ... denied to agua'>

PROBLEM:

CAN'T PUSH TO syoung:biorepository WHEN RUN ON COMMAND LINE:

cat /agua/conf/aguadev/envars.sh
    #!/bin/sh
    
    export login=aguadev
    export password=rst2agua
    export token=e8710ff995ac78c1340315f12e4e9e478e366b76
    export keyfile=/agua/conf/aguadev/id_rsa
    export curlfile=/agua/conf/aguadev/curl.txt
    export installdir=/agua

source /agua/conf/aguadev/envars.sh
cd /agua/repos/public/admin/biorepository; 
git push -u github master --force --verbose

    Pushing to git@github.com:syoung/biorepository.git
    ERROR: Permission to syoung/biorepository.git denied to agua.
    fatal: The remote end hung up unexpectedly


SOLUTION:

DON'T DO source BEFORE RUNNING TEST BECAUSE IT SPECIFIES THE WRONG keyfile LOCATION (I.E., IT SPECIFIES THE LOCATION OF THE KEY ALREADY REGISTERED TO THE agua GITHUB USER)

    
    
</entry>
<entry [Thu 2012:07:26 04:39:29 EST] TEST generateOAuthToken>
    

echo '{"login":"syoung","password":"XXXXX","clientid":"96580e0b6f984bb8b64d","username":"admin","sessionId":"9999999999.9999.999","hubtype":"github","mode":"generateOAuthToken","SHOWLOG":4}' | ./workflow.pl


</entry>
<entry [Tue 2012:07:24 05:13:20 EST] TEST StarCluster deleteKeyPair AND addKeyPair>

reset; echo '{"amazonuserid":"728213020069","awsaccesskeyid":"AKIAIKZHIY7T75JIF34A","awssecretaccesskey":"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","ec2privatekey":"-----BEGIN PRIVATE KEY-----\nMIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAJn7o8oOUaUgTwI40aoRXrmuKyhZ\nWWZJeWcLhnYcmsgC2F4f9zHS9UpRecWh2QrrLXVmu+xduw1dofWxUAT/p/51lGOV5hyrdtsMoHDQ\nNVIvC6M2ETD+tz5ait3k6Z7A1aWrV86m7ytU55mj7BnijXtpMvI0nXs59VVeg4cBw/QFAgMBAAEC\ngYBDAJlLoaFrLbzTZa/txbMnLp8+5modNRlrejtfB6FeKMbHZjdk6busQ/mtwngz5ROZw0NAXaS3\n8yc3RplgI3KQeiv9utzn8xSanX/acWsuQOTtGTLlXUuvmUrD40MmnMiL20ChH6zuDZCbT5ucCEGG\nM6E0chY/gJYRODxWBkkrgQJBAO4JROSapUmEXko68QuKhBKz+gQgAZM27TnBKYsMINTJb1TZpNpC\naE1bFRy1uNLcs6hFidQ6tSPTTCdjNh7CACUCQQClmoHtP0Sk5wa8iglSaPhSA9CaewO8UlZO3TXK\npzVepeBklR+SZSCDOHLAZ/+yZUB3onmlVS1Z/qZm01gNym5hAkEAlIqiPEoo9RyuPoJTo5EX5Bf9\n4A8dDIINPapFw2iZIFBnsjpzPmSMdCFvpk/ce3GQh2SFozPTj/yunDG0NzN3JQJBAJxTKvzzMXBc\n6X4G69/QWUDKexuorhESxIhzxziC+R1chmNMZd5C+hsEqUY5piUX8XA9fol0y3fdq+T68m8qPWEC\nQQDshvJAArMe1CUpJZFqovE/iN1P+9OzavTYStK8F8AVYnZR/KAV5M5rDE3gXBKq2WxUXjT0vdIN\nukFcKuTSGIpO\n-----END PRIVATE KEY-----","ec2publiccert":"-----BEGIN CERTIFICATE-----\nMIICdjCCAd+gAwIBAgIFfadFC7owDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMC\nVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMY\nQVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTExMDgyNTEwMDEwNVoXDTEyMDgy\nNDEwMDEwNVowUjELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAV\nBgNVBAsTDkFXUy1EZXZlbG9wZXJzMRUwEwYDVQQDEww3bnd6MHM3c2Npa28wgZ8w\nDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAJn7o8oOUaUgTwI40aoRXrmuKyhZWWZJ\neWcLhnYcmsgC2F4f9zHS9UpRecWh2QrrLXVmu+xduw1dofWxUAT/p/51lGOV5hyr\ndtsMoHDQNVIvC6M2ETD+tz5ait3k6Z7A1aWrV86m7ytU55mj7BnijXtpMvI0nXs5\n9VVeg4cBw/QFAgMBAAGjVzBVMA4GA1UdDwEB/wQEAwIFoDAWBgNVHSUBAf8EDDAK\nBggrBgEFBQcDAjAMBgNVHRMBAf8EAjAAMB0GA1UdDgQWBBSfnvEL4oqKMCGxlSti\nZQ2dJO9DGDANBgkqhkiG9w0BAQUFAAOBgQBaDJBUbtk5CA2hJfE8QPpgBwwc3M+7\ncPc0wi5cITImtvWMCDvdf6LcgByFejtAgycR2XA0YczBj2Zd6qzPDWXnFbMA35kU\nbs8Jd1e9lG7Tr6YV0q3etpm6+rP77wmKAF3yniv1cJp1WwfpRVsTEliwEnI+IC4z\n0626imzblXE8IA==\n-----END CERTIFICATE-----","username":"admin","sessionId":"9999999999.9999.999","repotype":"gitaws","mode":"addAws","SHOWLOG":4}' | ./workflow.pl
   

{"error":"Problem deleting keypair from EC2: Unexpected error:org.codehaus.xfire.fault.XFireFault: Signature creation failed; nested exception is: 	java.security.spec.InvalidKeySpecException: jav...","subroutine":"Agua::StarCluster::deleteKeypair","linenumber":"353","filename":"/mnt/agua/cgi-bin/lib/Agua/StarCluster.pm","timestamp":"2012-07-24 05:12:08"}
Doing EXITLABEL
    
</entry>
<entry [Sun 2012:07:22 23:22:47 EST] TEST Admin Aws PANEL>

 reset; echo '{"amazonuserid":"728213020069","awsaccesskeyid":"AKIAIKZHIY7T75JIF34A","awssecretaccesskey":"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","ec2publiccert":"-----BEGIN CERTIFICATE-----MIICdjCCAd+gAwIBAgIFfadFC7owDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMYQVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTExMDgyNTEwMDEwNVoXDTEyMDgyNDEwMDEwNVowUjELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAVBgNVBAsTDkFXUy1EZXZlbG9wZXJzMRUwEwYDVQQDEww3bnd6MHM3c2Npa28wgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAJn7o8oOUaUgTwI40aoRXrmuKyhZWWZJeWcLhnYcmsgC2F4f9zHS9UpRecWh2QrrLXVmu+xduw1dofWxUAT/p/51lGOV5hyrdtsMoHDQNVIvC6M2ETD+tz5ait3k6Z7A1aWrV86m7ytU55mj7BnijXtpMvI0nXs59VVeg4cBw/QFAgMBAAGjVzBVMA4GA1UdDwEB/wQEAwIFoDAWBgNVHSUBAf8EDDAKBggrBgEFBQcDAjAMBgNVHRMBAf8EAjAAMB0GA1UdDgQWBBSfnvEL4oqKMCGxlStiZQ2dJO9DGDANBgkqhkiG9w0BAQUFAAOBgQBaDJBUbtk5CA2hJfE8QPpgBwwc3M+7cPc0wi5cITImtvWMCDvdf6LcgByFejtAgycR2XA0YczBj2Zd6qzPDWXnFbMA35kUbs8Jd1e9lG7Tr6YV0q3etpm6+rP77wmKAF3yniv1cJp1WwfpRVsTEliwEnI+IC4z0626imzblXE8IA==-----END CERTIFICATE-----","ec2privatekey":"-----BEGIN PRIVATE KEY-----\nMIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAJn7o8oOUaUgTwI40aoRXrmuKyhZ\nWWZJeWcLhnYcmsgC2F4f9zHS9UpRecWh2QrrLXVmu+xduw1dofWxUAT/p/51lGOV5hyrdtsMoHDQ\nNVIvC6M2ETD+tz5ait3k6Z7A1aWrV86m7ytU55mj7BnijXtpMvI0nXs59VVeg4cBw/QFAgMBAAEC\ngYBDAJlLoaFrLbzTZa/txbMnLp8+5modNRlrejtfB6FeKMbHZjdk6busQ/mtwngz5ROZw0NAXaS3\n8yc3RplgI3KQeiv9utzn8xSanX/acWsuQOTtGTLlXUuvmUrD40MmnMiL20ChH6zuDZCbT5ucCEGG\nM6E0chY/gJYRODxWBkkrgQJBAO4JROSapUmEXko68QuKhBKz+gQgAZM27TnBKYsMINTJb1TZpNpC\naE1bFRy1uNLcs6hFidQ6tSPTTCdjNh7CACUCQQClmoHtP0Sk5wa8iglSaPhSA9CaewO8UlZO3TXK\npzVepeBklR+SZSCDOHLAZ/+yZUB3onmlVS1Z/qZm01gNym5hAkEAlIqiPEoo9RyuPoJTo5EX5Bf9\n4A8dDIINPapFw2iZIFBnsjpzPmSMdCFvpk/ce3GQh2SFozPTj/yunDG0NzN3JQJBAJxTKvzzMXBc\n6X4G69/QWUDKexuorhESxIhzxziC+R1chmNMZd5C+hsEqUY5piUX8XA9fol0y3fdq+T68m8qPWEC\nQQDshvJAArMe1CUpJZFqovE/iN1P+9OzavTYStK8F8AVYnZR/KAV5M5rDE3gXBKq2WxUXjT0vdIN\nukFcKuTSGIpO\n-----END PRIVATE KEY-----","username":"admin","sessionId":"9999999999.9999.999","repotype":"github","mode":"addAws","SHOWLOG":4}' | ./workflow.pl

 
DUMMY FORM INPUT:
 
-----BEGIN PRIVATE KEY-----
AAAA
AAA
AAA
AAA
-----END PRIVATE KEY-----

-----BEGIN CERTIFICATE-----
AAAA
AAA
AAA
AAA
-----END CERTIFICATE-----



</entry>
<entry [Mon 2012:07:16 05:49:53 EST] SUCCESSFUL TEST UPGRADE aguatest USING DEPLOY KEY>

1. LOADED private.pem, public.pem AND GENERATED id_rsa.pub

reset; echo '{"username":"admin","login":"syoung","token":"21a393b182705f3d5faea967496b465cbacbff8b","volumesize":"100","amazonuserid":"728213020069","awsaccesskeyid":"AKIAIKZHIY7T75JIF34A","secretaccesskey":"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","ec2publiccert":"-----BEGIN CERTIFICATE-----\nMIICdjCCAd+gAwIBAgIFfadFC7owDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMC\nVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMY\nQVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTExMDgyNTEwMDEwNVoXDTEyMDgy\nNDEwMDEwNVowUjELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAV\nBgNVBAsTDkFXUy1EZXZlbG9wZXJzMRUwEwYDVQQDEww3bnd6MHM3c2Npa28wgZ8w\nDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAJn7o8oOUaUgTwI40aoRXrmuKyhZWWZJ\neWcLhnYcmsgC2F4f9zHS9UpRecWh2QrrLXVmu+xduw1dofWxUAT/p/51lGOV5hyr\ndtsMoHDQNVIvC6M2ETD+tz5ait3k6Z7A1aWrV86m7ytU55mj7BnijXtpMvI0nXs5\n9VVeg4cBw/QFAgMBAAGjVzBVMA4GA1UdDwEB/wQEAwIFoDAWBgNVHSUBAf8EDDAK\nBggrBgEFBQcDAjAMBgNVHRMBAf8EAjAAMB0GA1UdDgQWBBSfnvEL4oqKMCGxlSti\nZQ2dJO9DGDANBgkqhkiG9w0BAQUFAAOBgQBaDJBUbtk5CA2hJfE8QPpgBwwc3M+7\ncPc0wi5cITImtvWMCDvdf6LcgByFejtAgycR2XA0YczBj2Zd6qzPDWXnFbMA35kU\nbs8Jd1e9lG7Tr6YV0q3etpm6+rP77wmKAF3yniv1cJp1WwfpRVsTEliwEnI+IC4z\n0626imzblXE8IA==\n-----END CERTIFICATE-----","ec2privatekey":"-----BEGIN PRIVATE KEY-----\nMIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAJn7o8oOUaUgTwI40aoRXrmuKyhZ\nWWZJeWcLhnYcmsgC2F4f9zHS9UpRecWh2QrrLXVmu+xduw1dofWxUAT/p/51lGOV5hyrdtsMoHDQ\nNVIvC6M2ETD+tz5ait3k6Z7A1aWrV86m7ytU55mj7BnijXtpMvI0nXs59VVeg4cBw/QFAgMBAAEC\ngYBDAJlLoaFrLbzTZa/txbMnLp8+5modNRlrejtfB6FeKMbHZjdk6busQ/mtwngz5ROZw0NAXaS3\n8yc3RplgI3KQeiv9utzn8xSanX/acWsuQOTtGTLlXUuvmUrD40MmnMiL20ChH6zuDZCbT5ucCEGG\nM6E0chY/gJYRODxWBkkrgQJBAO4JROSapUmEXko68QuKhBKz+gQgAZM27TnBKYsMINTJb1TZpNpC\naE1bFRy1uNLcs6hFidQ6tSPTTCdjNh7CACUCQQClmoHtP0Sk5wa8iglSaPhSA9CaewO8UlZO3TXK\npzVepeBklR+SZSCDOHLAZ/+yZUB3onmlVS1Z/qZm01gNym5hAkEAlIqiPEoo9RyuPoJTo5EX5Bf9\n4A8dDIINPapFw2iZIFBnsjpzPmSMdCFvpk/ce3GQh2SFozPTj/yunDG0NzN3JQJBAJxTKvzzMXBc\n6X4G69/QWUDKexuorhESxIhzxziC+R1chmNMZd5C+hsEqUY5piUX8XA9fol0y3fdq+T68m8qPWEC\nQQDshvJAArMe1CUpJZFqovE/iN1P+9OzavTYStK8F8AVYnZR/KAV5M5rDE3gXBKq2WxUXjT0vdIN\nukFcKuTSGIpO\n-----END PRIVATE KEY-----","sessionId":"9999999999.9999.999","mode":"addAws","repotype":"github","SHOWLOG":4}' | ./workflow.pl
    OK

    
2. SET GENERATED id_rsa.pub AS DEPLOY KEY FOR syoung:aguatestdev

GET id_rsa.pub

ll /agua/conf/.repos/github/syoung

    -rwx------ 1 root root  134 Jul 16 05:45 git-ssh.sh*
    -rw------- 1 root root  913 Jul 16 05:49 id_rsa
    -rw-r--r-- 1 root root  213 Jul 16 05:49 id_rsa.pub

cat id_rsa.pub 
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQCZ+6PKDlGlIE8CONGqEV65risoWVlmSXlnC4Z2HJrIAtheH/cx0vVKUXnFodkK6y11ZrvsXbsNXaH1sVAE/6f+dZRjleYcq3bbDKBw0DVSLwujNhEw/rc+Word5OmewNWlq1fOpu8rVOeZo+wZ4o17aTLyNJ17OfVVXoOHAcP0BQ==

ADD AS DEPLOY KEY:

https://github.com/syoung/aguatestdev -->  Admin --> Deplay Keys --> Add Deploy Key

    EC2 aquarius4 ? (74:4d:d4:a9:f3:bd:58:ce:11:a3:0b:92:e9:ce:35:7e)

    
3. RUN UPGRADE USING PRIVATE KEY FOR DEPLOY KEY
    
reset; echo '{"username":"admin","sessionId":"9999999999.9999.999","package":"aguatestdev","repository":"aguatestdev","version":"0.8.0-alpha+build10","owner":"syoung","installdir":"/agua/t","mode":"upgrade","random":251549222216,"SHOWLOG":4}' | ./workflow.pl
  
    OK !!!
    

   
    
</entry>
<entry [Sun 2012:07:15 07:37:05 EST] TEST ADMIN SETTINGS addAws>

ADD:

reset; echo '{"username":"admin","login":"syoung","token":"21a393b182705f3d5faea967496b465cbacbff8b","volumesize":"100","amazonuserid":"728213020069","awsaccesskeyid":"AKIAIKZHIY7T75JIF34A","secretaccesskey":"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","ec2publiccert":"-----BEGIN CERTIFICATE-----\nMIICdjCCAd+gAwIBAgIFfadFC7owDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMC\nVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMY\nQVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTExMDgyNTEwMDEwNVoXDTEyMDgy\nNDEwMDEwNVowUjELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAV\nBgNVBAsTDkFXUy1EZXZlbG9wZXJzMRUwEwYDVQQDEww3bnd6MHM3c2Npa28wgZ8w\nDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAJn7o8oOUaUgTwI40aoRXrmuKyhZWWZJ\neWcLhnYcmsgC2F4f9zHS9UpRecWh2QrrLXVmu+xduw1dofWxUAT/p/51lGOV5hyr\ndtsMoHDQNVIvC6M2ETD+tz5ait3k6Z7A1aWrV86m7ytU55mj7BnijXtpMvI0nXs5\n9VVeg4cBw/QFAgMBAAGjVzBVMA4GA1UdDwEB/wQEAwIFoDAWBgNVHSUBAf8EDDAK\nBggrBgEFBQcDAjAMBgNVHRMBAf8EAjAAMB0GA1UdDgQWBBSfnvEL4oqKMCGxlSti\nZQ2dJO9DGDANBgkqhkiG9w0BAQUFAAOBgQBaDJBUbtk5CA2hJfE8QPpgBwwc3M+7\ncPc0wi5cITImtvWMCDvdf6LcgByFejtAgycR2XA0YczBj2Zd6qzPDWXnFbMA35kU\nbs8Jd1e9lG7Tr6YV0q3etpm6+rP77wmKAF3yniv1cJp1WwfpRVsTEliwEnI+IC4z\n0626imzblXE8IA==\n-----END CERTIFICATE-----","ec2privatekey":"-----BEGIN PRIVATE KEY-----\nMIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAJn7o8oOUaUgTwI40aoRXrmuKyhZ\nWWZJeWcLhnYcmsgC2F4f9zHS9UpRecWh2QrrLXVmu+xduw1dofWxUAT/p/51lGOV5hyrdtsMoHDQ\nNVIvC6M2ETD+tz5ait3k6Z7A1aWrV86m7ytU55mj7BnijXtpMvI0nXs59VVeg4cBw/QFAgMBAAEC\ngYBDAJlLoaFrLbzTZa/txbMnLp8+5modNRlrejtfB6FeKMbHZjdk6busQ/mtwngz5ROZw0NAXaS3\n8yc3RplgI3KQeiv9utzn8xSanX/acWsuQOTtGTLlXUuvmUrD40MmnMiL20ChH6zuDZCbT5ucCEGG\nM6E0chY/gJYRODxWBkkrgQJBAO4JROSapUmEXko68QuKhBKz+gQgAZM27TnBKYsMINTJb1TZpNpC\naE1bFRy1uNLcs6hFidQ6tSPTTCdjNh7CACUCQQClmoHtP0Sk5wa8iglSaPhSA9CaewO8UlZO3TXK\npzVepeBklR+SZSCDOHLAZ/+yZUB3onmlVS1Z/qZm01gNym5hAkEAlIqiPEoo9RyuPoJTo5EX5Bf9\n4A8dDIINPapFw2iZIFBnsjpzPmSMdCFvpk/ce3GQh2SFozPTj/yunDG0NzN3JQJBAJxTKvzzMXBc\n6X4G69/QWUDKexuorhESxIhzxziC+R1chmNMZd5C+hsEqUY5piUX8XA9fol0y3fdq+T68m8qPWEC\nQQDshvJAArMe1CUpJZFqovE/iN1P+9OzavTYStK8F8AVYnZR/KAV5M5rDE3gXBKq2WxUXjT0vdIN\nukFcKuTSGIpO\n-----END PRIVATE KEY-----","sessionId":"9999999999.9999.999","mode":"addAws","repotype":"github","SHOWLOG":4}' | ./workflow.pl


{"status":"Added AWS credentials for user admin","subroutine":"Agua::Common::Aws::addAws","linenumber":"107","filename":"/mnt/agua/cgi-bin/lib/Agua/Common/Aws.pm","timestamp":"2012-07-16 04:05:39"}
workflow->addAws(): 37.910519


REMOVE:

echo '{"username":"admin","login":"syoung","token":"21a393b182705f3d5faea967496b465cbacbff8b","volumesize":"100","amazonuserid":"728213020069","awsaccesskeyid":"AKIAIKZHIY7T75JIF34A","secretaccesskey":"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","ec2publiccert":"","ec2privatekey":"","sessionId":"9999999999.9999.999","mode":"addAws","repotype":"github","SHOWLOG":4}' | ./workflow.pl

    OK

    
    
    
    
    
</entry>
<entry [Sat 2012:07:14 23:57:01 EST] ADD BOOKMARKLET TO FIREFOX BOOKMARKS>

1. COPY FROM FIREBUG

    A. CLICK BOTTOM 'Copy' BUTTON IN Console
    (RIGHT PANE, RED BUTTON AT BOTTOM RIGHT)

    B. RIGHT-CLICK FIREFOX BOOKMARKS BAR --> NEW BOOKMARK --> LOCATION

2. ALTERNATELY, EMBED THE JAVASCRIPT IN A LINK AND DRAG TO BOOKMARKS BAR

NB: SHOW BOOKMARKS BAR: View --> Toolbars --> Bookmarks Toolbar


<!--
<a href="javascript:(function(){if%20%28document.getElementById%28%27bmletMain%27%29%29%7BbmletRefresh%28%29%3Breturn%3B%7D%3Bvar%20d%20%3D%20document%3Bs%3Dd.createElement%28%27script%27%29%3Bs.setAttribute%28%27src%27%2C%27http%3A//marklets.com/Marklet/marklet.js%27%29%3Bs.setAttribute%28%27type%27%2C%27text/javascript%27%29%3Bd.body.appendChild%28s%29%3B})();" onclick="window.alert('Right click on a bookmarklet and select \'Add to Favorites\'...');return false;" class="button bookmarklet"><span>Marklets.com</span>
    <img alt="bookmarklet" src="images/ribbon.png">
</a>
-->


NOTES
-----

http://marklets.com/FAQ.aspx#firefox

Add a bookmarklet to Firefox's Bookmark Toolbar

1. Typically, you would first find a bookmarklet you would like to add to your browser. Later you can search our database but for the purposes of this tutorial we've supplied the Marklets.com bookmarklet below. Note that all bookmarklets on Marklets.com will be displayed as a blue button with an orange ribbon so it's easy to tell which links are bookmarklets and which aren't.

2. Make sure Bookmarks Toolbar is visible. Select "View" from main menu then "Toolbars" and check "Bookmarks Toolbar".

3. Drag the bookmarklet to the Bookmarks Toolbar. Remember, all bookmarklets on our site will be displayed as a blue button with an orange ribbon just like the "Marklets.com" bookmarklet below.


</entry>    
<entry [Thu 2012:07:12 16:20:36 EST] TEST NEW executeWokflow AND getStatus>

executeWorkflow

echo '{"username":"admin","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","start":1,"mode":"executeWorkflow","workflownumber":1,"SHOWLOG":4}' | ./workflow.cgi


getStatus

echo '{"username":"admin","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","start":1,"mode":"getStatus","workflownumber":1,"SHOWLOG":4}' | ./workflow.cgi

    
</entry>
<entry [Fri 2012:07:06 14:57:06 EST] POPULATE repoaccess TABLE>

INSERT INTO repoaccess VALUES ('syoung','syoung','github','ded526622a10cfaaea0134662696b748ff666696','');

INSERT INTO repoaccess VALUES ('admin','syoung','github','ded526622a10cfaaea0134662696b748ff666696','');
    
</entry>
<entry [Thu 2012:07:05 12:58:56 EST] PROFILE workflow.pl WITH Devel::DProf>

CREATE tmon.out FILE:

perl -d:DProf -Q -O -o /mnt/home/syoung/notes/agua/profile/workflow.dprof.out workflow.pl  '{"project":"Project1","workflow":"Workflow1","workflownumber":"1","start"username":"admin","sessionId":"9999999999.9999.999","mode":"getStatus"}'


PROCESS tmon.out FILE AND CREATE SUMMARY:

dprofpp

dprofpp will be removed from the Perl core distribution in the next major release. Please install Devel::DProf from CPAN.
Total Elapsed Time = 8.722894 Seconds
  User+System Time = 8.342894 Seconds
Exclusive Times
%Time ExclSec CumulS #Calls sec/call Csec/c  Name
 7.06   0.589  0.589   1270   0.0005 0.0005  Eval::Closure::_clean_eval
 2.03   0.169  1.497   3893   0.0000 0.0004  Class::MOP::Class::_construct_instance
 1.99   0.166  0.331  24379   0.0000 0.0000  Class::MOP::Attribute::initialize_instance_slot
 1.67   0.139  2.472     81   0.0017 0.0305  Module::Runtime::require_module
 1.65   0.138  0.263   3095   0.0000 0.0001  Class::MOP::Class::get_all_attributes
 1.62   0.135  4.347   4771   0.0000 0.0009  Try::Tiny::try
 1.35   0.113  0.113  53249   0.0000 0.0000  UNIVERSAL::isa
 1.34   0.112  0.193   2307   0.0000 0.0001  Moose::Meta::Class::_call_all_triggers
 1.31   0.109  0.801  11424   0.0000 0.0001  Moose::Meta::Attribute::initialize_instance_slot
 1.16   0.097  4.368  18636   0.0000 0.0002  Class::MOP::Class:::around
 1.14   0.095  0.408  11290   0.0000 0.0000  Class::MOP::Mixin::HasMethods::get_method
 1.09   0.091  0.375   6230   0.0000 0.0001  MooseX::Types::TypeDecorator::AUTOLOAD
 1.09   0.091  0.095    876   0.0001 0.0001  Class::MOP::Instance::BUILDARGS
 1.07   0.089  0.297  31185   0.0000 0.0000  Class::MOP::Class::initialize
 1.05   0.088  0.275  14748   0.0000 0.0000  Class::MOP::Mixin::HasMethods::_get_maybe_raw_method

 
CONCLUSION

MOOSE IS THE MOST TIME-CONSUMING PART


   

</entry>
<entry [Tue 2012:07:03 22:19:59 EST] PROFILE workflow.pl WITH Devel::NYTProf AND Devel::SmallProf>

Devel::NYTProf
--------------
http://www.perl.org/about/whitepapers/perl-profiling.html

# profile code and write database to ./nytprof.out
# perl -d:NYTProf some_perl.pl

cd /home/syoung/notes/agua/profile
perl -d:NYTProf /var/www/cgi-bin/agua/workflow.pl '{"project":"Project1","workflow":"Workflow1","workflownumber":"1","start"username":"admin","sessionId":"9999999999.9999.999","mode":"getStatus"}'

    OK
    
# convert database into a set of html files, e.g., ./nytprof/index.html
# and open a web browser on the nytprof/index.html file
nytprofhtml --open

    OK
    
# or into comma separated files, e.g., ./nytprof/*.csv
nytprofcsv
    
    OK
  
VIEW OUTPUT HTML FILE:
file:///mnt/home/syoung/notes/agua/profile/nytprof/index.html


*** MOOSE MODULES ARE RESPONSIBLE FOR DELAY ***
LONGEST MOOSE MODULE                5000+ MILLISECONDS 
LONGEST AGUA MODULE (Workflow.pm)      65 MILLISECONDS


Devel::SmallProf
----------------

reset ; perl -d:SmallProf ./workflow.pl '{"project":"Project1","workflow":"Workflow1","workflownumber":"1","start":1,"stop":3,"username":"admin","sessionId":"9999999999.9999.999","mode":"executeWorkflow","submit":1,"cluster":"admin-smallcluster","SHOWLOG":4}' 
   
    
</entry>
<entry [Mon 2012:07:02 07:29:19 EST] KOMODO REPLACE TO ADD 'mkdir -p $outputsdir' TO *.t FILES>

FROM:

unshift\(@INC, "\$installdir\/lib"\);\r*\n}WITH:


TO:

    unshift(@INC, "$installdir/lib");\n}\n\n#### CREATE OUTPUTS DIR\nmy $outputsdir = "$Bin/outputs";\n`mkdir -p $outputsdir` if not -d $outputsdir;\n
    

    
</entry>
<entry [Tue 2012:06:26 15:18:06 EST] USE prove TO GET TEST DETAILS ON make>

http://stackoverflow.com/questions/5307290/make-test-more-verbose-in-perl

the prove command that comes with Test-Harness:

prove --blib --verbose

OR

prove -bv

The --blib option causes it to look for the built-but-uninstalled module created by make or ./Build, but if you forgot to rebuild the module after changing something, it will run the tests against the previously-built copy. If you haven't built the module at all, it will test the installed version of the module instead.


prove also lets you run only a specific test or tests:

prove -bv t/failing.t

    
</entry>
<entry [Sat 2012:06:23 12:31:50 EST] SET ENVIRONMENT VARIABLES>
    
1. CHANGE TO ROOT
sudo su


2. WRITE ENVARS FILE

emacs -nw /agua/conf/envars.sh

#!/bin/sh

export login=aguadev
export password=***
export token=7b886736c4a777298cadd19b673679a8385c755f
export keyfile=/root/.ssh/id_rsa
export curlfile=/agua/conf/curl.txt
export installdir=/agua


3. SOURCE FILE TO EXPORT VARS

source /agua/conf/envars.sh


4. RUN TESTS

cd /agua/t
make



SYOUNG USER:

sudo su


export login=syoung
export password=***
#export token=21a393b182705f3d5faea967496b465cbacbff8b  #public
#export token=efe7c3660f0b60602562b21f8ee2824d09a73caa  #private
export token=ded526622a10cfaaea0134662696b748ff666696   #delete
export keyfile=/root/.ssh/id_rsa

cd /agua/t
make

    
</entry>
<entry [Sun 2012:06:10 05:33:45 EST] MOVED /agua/t TO /repos/private/syoung/aguatest>

1. MOVED /agua/t

mv /agua/t /repos/private/syoung/aguatest


2. LINKED BACK

ln -s /repos/private/syoung/aguatest /agua/t


3. CHANGED "use lib" IN *.t FILES TO USE SIMPLE RELATIVE PATH TO FIND Agua::Test MODULES AND EXTENDED PATH TO FIND Agua MODULES

FROM:

use FindBin qw($Bin);
use lib "$Bin/../../../../../../t/lib";
use lib "$Bin/../../../../../../lib";

TO:

use FindBin qw($Bin);
use lib "$Bin/../../../../../lib";
BEGIN
{
    my $installdir = $ENV{'installdir'} || "/agua";
    unshift(@INC, "$installdir/lib");
}


TEST FILES:

cd /mnt/repos/private/syoung/aguatest/bin
find . -type f -name "*\.t" 

    ./Agua/Admin/Admin.t
    ./Agua/CLI/Project/Project.t
    ./Agua/Cluster/Jobs/Jobs.t
    ./Agua/Cluster/SCInstance/SCInstance.t
    ./Agua/Common/Stage/Stage.t
    ./Agua/Common/File/File.t
    ./Agua/Common/Logger/Logger.t
    ./Agua/Common/Package/Upgrade/Upgrade.t
    ./Agua/Common/Package/Sync/Sync.t
    ./Agua/Common/Package/Defaults/Defaults.t
    ./Agua/Common/Package/Insert/Insert.t
    ./Agua/Common/Cluster/Cluster.t
    ./Agua/Common/Workflow/Workflow.t
    ./Agua/Configure/Configure.t
    ./Agua/Folders/Folders.t
    ./Agua/JBrowse/JBrowse.t
    ./Agua/Monitor/SGE/SGE.t
    ./Agua/Ops/Version/Version.t
    ./Agua/Ops/Install/Install.t
    ./Agua/Ops/GitHub/GitHub.t
    ./Agua/OpsInfo/OpsInfo.t
    ./Agua/StarCluster/StarCluster.t ==> /agua/private
    ./Agua/Upload/Upload.t
    ./Agua/View/View.t
    ./Agua/Util/Util.t
    ./Conf/Agua/Agua.t
    ./Conf/Json/Json.t
    ./Conf/StarCluster/StarCluster.t
    ./Doc/Doc.t
    ./File/Tools/Tools.t



KOMODO MULTILINE REPLACE:

use FindBin qw\(\$Bin\);\nuse lib "\$Bin/../../../../../lib";\nuse lib "\$Bin/../../../../lib";


WITH:

use FindBin qw($Bin);\nuse lib "$Bin/../../../../../lib";
BEGIN
{
    my $installdir = $ENV{'installdir'} || "/agua";
    unshift(@INC, "$installdir/lib");
}


4. CHANGED *.conf FILE LOCATION IN *.t FILES

KOMODO MULTILINE REPLACE:

my \$conffile    =    "\$Bin/../../../../../../conf/default.conf";


WITH:

my $installdir  =   $ENV{'installdir'} || "/agua";
my $configfile    =   "$installdir/conf/default.conf";


NOTES
-----

sed and Multi-Line Search and Replace

I’ve been experimenting with getting regular expression patterns to match over multiple lines using sed. For example, one might want to change

http://austinmatzko.com/2008/04/26/sed-multi-line-search-and-replace/

<!--
<p>previous text</p>
<h2>
<a href="http://some-link.com">A title here</a>
</h2>
<p>following text</p>
to

<p>previous text</p>
No title here
<p>following text</p>
sed cycles through each line of input one line at a time, so the most obvious way to match a pattern that extends over several lines is to concatenate all the lines into what is called sed‘s “hold space,” then look for the pattern in that (long) string. That’s what I do in the following lines:

#!/bin/sh
sed -n '
# if the first line copy the pattern to the hold buffer
1h
# if not the first line then append the pattern to the hold buffer
1!H
# if the last line then ...
$ {
        # copy from the hold to the pattern buffer
        g
        # do the search and replace
        s/<h2.*</h2>/No title here/g
        # print
        p
}
' sample.php > sample-edited.php;
A more compact version:


sed -n '1h;1!H;${;g;s/<h2.*</h2>/No title here/g;p;}' sample.php > sample-edited.php;
 
As far as I can tell, that’s the most efficient way to match general multi-line patterns. I initially thought it might be more efficient not to keep the complete input in the hold buffer, so I modified the algorithm to print out the string whenever a match is found:


-->

    
</entry>
<entry [Mon 2012:06:04 02:20:44 EST] SET TEST ENVIRONMENT VARIABLES>

TO PROVIDE login, token AND keyfile ARGUMENTS BEFORE make

source /agua/conf/envars.sh


WHERE FILE /agua/conf/envars.sh CONTAINS:

export login=syoung
export token=4416b765217a3c3de1ed99938ffe25e0 
export keyfile=/root/.ssh/id_rsa
cd /agua/t
make


    
</entry>
<entry [Sun 2012:06:03 19:35:13 EST] LOAD TEST aguatest DATABASE FROM DUMP FILE>

NOTE: DON'T NEED THIS ANY MORE BECAUSE TAKEN CARE OF IN Stage.t

1. LOAD aguatest DATABASE:  
  
mysql -u aguatest -p99999999 aguatest < /agua/t/dump/agua.dump  

2. RUN Stage.t

cd ./bin/Agua/Ops/Stage
sudo ./Stage.t


    
</entry>
<entry [Sat 2012:06:02 14:29:51 EST] TEST t/bin/Agua/Ops/Install>

cd ./bin/Agua/Ops/Install
./Install.t \
--token 4416b765217a3c3de1ed99938ffe25e0 \
--login syoung

    
</entry>
<entry [Tue 2012:05:29 23:54:56 EST] COMPLETE LIST OF *.t FILES IN Makefile>

LIST OF ALL FILES IN t/bin

cd /mnt/agua/t/bin
ll  */* | egrep -e "\.t"

-rwxrwxr-x 1 syoung syoung  917 Apr  5 10:47 Doc/Doc.t*
-rwxrwxr-x  1 syoung syoung 2096 Apr  5 10:16 Admin.t*
-rwxrwxr-x  1 syoung syoung 1300 Apr  5 10:11 Cluster.t*
-rwxrwxr-x  1 syoung syoung 1328 Jan 12 12:37 SCInstance.t*
-rwxrwxr-x  1 syoung syoung 1168 Jan 17 14:25 Configure.t*
-rwxrwxr-x  1 syoung syoung 4819 Jan 12 12:11 JBrowse.t*
-rwxrwxr-x  1 syoung syoung  934 Jan 29 13:02 OpsInfo.t*
-rwxrwxr-x  1 syoung syoung 1553 Mar 19 02:55 Project.t*
-rwxrwxr-x  1 syoung syoung 1667 Apr  5 10:16 Stage.t*
-rwxrwxr-x  1 syoung syoung 5409 Jan 12 12:30 StarCluster.t*
-rwxrwxr-x  1 syoung syoung 1050 Apr  5 10:15 Upload.t*
-rwxrwxr-x  1 syoung syoung  474 Jan 12 12:32 Util.t*
-rwxrwxr-x  1 syoung syoung  709 Apr 12 15:11 Version.t*
-rwxrwxr-x  1 syoung syoung   4473 Apr  5 10:12 View.t*
-rwxrwxr-x  1 syoung syoung 2407 Apr  5 10:16 Workflow.t*
-rwxrwxr-x 1 syoung syoung  949 Jan 12 11:51 Agua.t*
-rwxrwxr-x 1 syoung syoung  2815 Apr  4 21:18 Json.t*
-rwxrwxr-x 1 syoung syoung 1181 Dec 21 07:50 StarCluster.t*
-rwxrwxr-x 1 syoung syoung 1117 Jan 12 12:16 Tools.t*

        cd ./bin/File/Tools; 
        cd ./bin/Agua/StarCluster; 
        cd ./bin/Agua/View; 
        cd ./bin/Agua/Upload; 
        cd ./bin/Agua/Monitor/SGE; /..
        cd ./bin/Agua/Common; 
        cd ./bin/Agua/Common/Package; /..
        cd ./bin/Agua/JBrowse; 
        cd ./bin/Agua/Cluster/Jobs; /..
        cd ./bin/Agua/Cluster; 
        cd ./bin/Agua/Cluster; 
        cd ./bin/Agua/Workflow; 
        cd ./bin/Agua/Util; 
        cd ./bin/Agua/Doc; 
        cd ./bin/Agua/Stage; 
        cd ./bin/Agua/Admin; 
        cd ./bin/Doc; 
        cd ./bin/Conf/StarCluster; 
        cd ./bin/Conf/Agua; 
        cd ./bin/Conf/Json; 




NOTES
=====

OLD MAKEFILE

cd /agua/t
cat Makefile

    #Thu Jan 12 12:33:55 CST 2012
    # THIS MAKEFILE WAS GENERATED BY /agua/0.6/t/makefile.pl
    
    all:
        cd ./bin/File/Tools; perl -MTest::Harness -e '$$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../..
        cd ./bin/Agua/StarCluster; perl -MTest::Harness -e '$$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../..
        cd ./bin/Agua/View; perl -MTest::Harness -e '$$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../..
        cd ./bin/Agua/Upload; perl -MTest::Harness -e '$$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../..
        cd ./bin/Agua/Monitor/SGE; perl -MTest::Harness -e '$$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../../..
        cd ./bin/Agua/Common; perl -MTest::Harness -e '$$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../..
        cd ./bin/Agua/Common/Package; perl -MTest::Harness -e '$$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../../..
        cd ./bin/Agua/JBrowse; perl -MTest::Harness -e '$$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../..
        cd ./bin/Agua/Cluster/Jobs; perl -MTest::Harness -e '$$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../../..
        cd ./bin/Agua/Cluster; perl -MTest::Harness -e '$$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../..
        cd ./bin/Agua/Cluster; perl -MTest::Harness -e '$$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../..
        cd ./bin/Agua/Workflow; perl -MTest::Harness -e '$$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../..
        cd ./bin/Agua/Util; perl -MTest::Harness -e '$$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../..
        cd ./bin/Agua/Doc; perl -MTest::Harness -e '$$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../..
        cd ./bin/Agua/Stage; perl -MTest::Harness -e '$$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../..
        cd ./bin/Agua/Admin; perl -MTest::Harness -e '$$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../..
        cd ./bin/Doc; perl -MTest::Harness -e '$$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../..
        cd ./bin/Conf/StarCluster; perl -MTest::Harness -e '$$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../..
        cd ./bin/Conf/Agua; perl -MTest::Harness -e '$$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../..
        cd ./bin/Conf/Json; perl -MTest::Harness -e '$$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../..


TROUBLESHOOTING
===============

cd ./bin/Agua/View; perl -MTest::Harness -e '$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../..
View.t .. 1/? cp: cannot stat `/mnt/agua/t/bin/Agua/View/outputs/data/plugins/view/jbrowse/users/admin/Project1/View1/data/trackInfo.bkp.js': No such file or directory

    OK

cd ./bin/Agua/Common/File; perl -MTest::Harness -e '$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../../..
File.t .. 1/? Can't locate object method "isTestUser" via package "Test::Agua::Common::File" at ../../../../../lib/Agua/Common/Database.pm line 46.

    OK

cd ./bin/Agua/Common/Package/trash; perl -MTest::Harness -e '$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../../../..

    OK

cd ./bin/Agua/Common/Package/Upgrade; perl -MTest::Harness -e '$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../../../..
Upgrade.t .. You tried to plan twice at Upgrade.t line 44.
    
    OK

cd ./bin/Agua/Common/Package/Sync; perl -MTest::Harness -e '$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../../../..
    
    OK

cd ./bin/Agua/Common/Package/Defaults; perl -MTest::Harness -e '$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../../../..
    
    OK

cd ./bin/Agua/Common/Package/Insert; perl -MTest::Harness -e '$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../../../..
    
    OK


cd ./bin/Agua/Project; perl -MTest::Harness -e '$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../..

    OK

cd /agua/t/bin/Agua/Folders
./Folders.t 

    Doing test renameWorkflow
    DBD::mysql::db do failed: Table 'aguatest.project' doesn't exist at /mnt/agua/t/bin/Agua/Folders/../../../../lib/Agua/DBase/MySQL.pm line 259.

    OK - ENABLED MYSQL 'LOAD DATA'
    
cd ./bin/Agua/Workflow; perl -MTest::Harness -e '$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../..

    OK

cd ./bin/Agua/CLI/Project; perl -MTest::Harness -e '$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../../..

    OK


cd ./bin/Agua/Ops/Install; perl -MTest::Harness -e '$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../../..

    OK

cd ./bin/Agua/Stage; perl -MTest::Harness -e '$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../..

Stage.t .. Use of uninitialized value $username in string eq at ../../../../lib/Agua/Common/Base.pm line 461.
Use of uninitialized value $username in string eq at ../../../../lib/Agua/Common/Base.pm line 461.

    OK

cd ./bin/Agua/Common/Package/Upgrade; perl -MTest::Harness -e '$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../../../..
Upgrade.t .. cat: /mnt/agua/t/bin/Agua/Common/Package/Upgrade/outputs/source/0.1: No such file or directory

    OK

cd ./bin/Agua/Common/Package/Sync; perl -MTest::Harness -e '$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../../../..
Sync.t .. Use of uninitialized value $username in string eq at /mnt/agua/t/bi
    OK


cd ./bin/Agua/Common/Package/Sync; perl -MTest::Harness -e '$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../../../..
Sync.t .. 174/176 malformed JSON string, neither array, object, number, string or atom, at character offset 0 (before "<!DOCTYPE html>\n< ht...") at (eval 518) line 161.



cd ./bin/Agua/Common/Package/Defaults; perl -MTest::Harness -e '$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../../../..
Defaults.t .. Use of uninitialized value $username in string eq at /mnt/agua/t/bin/Agua/Common/Package/Defaults/../../../../../../lib/Agua/Common/Base.pm line 466.
    OK

cd ./bin/Agua/Common/Package/Insert; perl -MTest::Harness -e '$Test::Harness::verbose=0; runtests @ARGV;' *.t; cd ../../../../..
Insert.t .. Use of uninitialized value $username in string eq at /mnt/agua/t/bin/Agua/Common/Package/Insert/../../../../../../lib/Agua/Common/Base.pm line 466.
    OK



</entry>
<entry [Tue 2012:05:29 16:17:13 EST] COMPLETE LINEUP OF CURRENT TESTS>

t/plugins/core/common
t/plugins/dojox/timing
t/plugins/folders/copyfile
t/plugins/folders/filedrag
t/plugins/home/version
t/plugins/view/addview
t/plugins/view/addviewfeature
t/plugins/view/getset
t/plugins/view/removeview
t/plugins/view/removeviewfeature
t/plugins/workflow/execute
t/plugins/workflow/io
t/plugins/workflow/runstatus
 
    
</entry>
<entry [Mon 2012:05:28 23:36:00 EST] FIXED _browserRunner.js TO ALLOW LONGER DEFAULT TIMEOUT>

util/doh/_browserRunner.js LINE 634:

				timeout: timeout || 120000, // IF UNDEFINED, setTimeout IS NOT SET
//				timeout: timeout||10000, // 10s

LATER:

ALLOW ADDITIONAL timeout ARGUMENT FOR runner.html IN runTests.html:

E.G.:
          content="0;url=../../dojo-1.6.1rc2/util/doh/runner.html?testModule=t.plugins.module&registerModulePath=plugins,../../plugins;t,../../t&timeout=240000">

 
    
</entry>
<entry [Mon 2012:05:28 01:11:31 EST] FIX EARLY QUIT FOR dojox.timing TEST IN DOH TESTS>

 1 tests to run in 1 groups
 ------------------------------------------------------------
 GROUP "t.plugins.dojox.timing.test" has 1 test to run
 3 tests to run in 1 groups
 ------------------------------------------------------------
 GROUP "plugins.dojox.timing" has 3 tests to run
 Error: test timeout in ../../../t/plugins/dojox/timing/test.html
     ERROR IN:
  (function () {return this.d;})
 FAILED test: ../../../t/plugins/dojox/timing/test.html 12020 ms
 WOOHOO!!
 ------------------------------------------------------------
 | TEST SUMMARY:
 ------------------------------------------------------------
      1 tests in 1 groups
      1 errors
      0 failures
 PASSED test: ../../../t/plugins/dojox/timing/test.html::plugins.dojox.timing::interval 12057 ms
 PASSED test: ../../../t/plugins/dojox/timing/test.html::plugins.dojox.timing::arguments 5091 ms
 PASSED test: ../../../t/plugins/dojox/timing/test.html::plugins.dojox.timing::attenuate 18067 ms
    
</entry>
<entry [Sun 2012:05:27 22:07:52 EST] TIMER CODE>


setTimer : function () {
	console.log("RunStatus.setTimer    this.timerInterval: " + this.timerInterval);
	
	if ( this.timer != null ) {
		return;
	}
	
	this.timer = new dojox.timing.Timer;
	this.timer.setInterval(this.timerInterval);	// 1000ths OF A SECOND	
	var thisObject = this;	
	this.timer.onTick = function()
	{
		console.log("RunStatus.setTimer    onTick()");
		console.log("RunStatus.setTimer    time: " + new Date().toTimeString());

		// STOP POLLING WHEN THE LAST RUNNING ITEM HAS
		// COMPLETED (I.E., WHEN 'this.completed' == true)
		console.log("RunStatus.setTimer     thisObject.completed: " + dojo.toJson(thisObject.completed));
		if ( thisObject.completed == true )
		{
			console.log("RunStatus.setTimer     Stopping timer because thisObject.completed: " + thisObject.completed);
			thisObject.stopPolling();
			return;
		}

        setTimeout(function() {
            try {
                console.log("RunStatus.setTimer     Doing setTimeout(this.queryStatus(this.runner))");
                thisObject.queryStatus(thisObject.runner);
            } catch(error) {
                console.log("RunStatus.setTimer     Error doing setTimeout(this.queryStatus(this.runner)): " + dojo.toJson(error));
            }
        }, 100);

	};	//	timer.onTick
},


    
</entry>
