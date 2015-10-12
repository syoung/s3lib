domain



<entry [Fri 2014:10:10 11:21:56 EST] CREATED TEMP REDIRECT FROM OLD AGUA TO AGUA 2.0>

ON LINODE:

1. COMMENTED OUT REDIRECT IN http.conf

em /etc/httpd/conf/http.conf

# Redirect permanent /index.html http://www.aguadev.org/confluence


2. CREATED index.html FILE

/home/vesi/http/index.html

<!--

<html>
<head>
<meta http-equiv="Refresh" content="0; url=http://www.aguadev.org:8090" />

<title>www.aguadev.org</title>
</head>
<body>
Redirecting to www.aguadev.org
</body>
</html>

-->


3. FLUSHED BROWSER CACHE


4. TESTED - BROWSER REDIRECTS TO AGUA 2.0



</entry>
<entry [Fri 2014:10:10 09:00:54 EST] CHANGED aguadev.com TO digi02>

1. CHANGE DNS SERVERS ON GODADDY.COM

ns1.digitalocean.com
ns2.digitalocean.com
ns3.digitalocean.com


2. ADD DOMAIN IN DIGITAL OCEAN CONTROL PANEL

DNS TAB --> Add Domain --> fill in domain name and DROPLET IP address 
(NB: The domain name does not have a www at the beginning)

NAME            IP                  DROPLET
aguadev.org     192.241.223.100     digi02


3. ENABLE http://aguadev.org

DNS TAB --> Add Record --> A

A RECORD

    www    192.241.223.100



4. ENABLE http://www.aguadev.org

CNAME

    www    @


5. ENABLE http://wwwwww.aguadev.org

CNAME

    *       @

    
    
    OK SO FAR
    
    

6. ENABLE confluence.aguadev.org

A RECORD

    confluence    192.241.223.100




    

    
</entry>
<entry [Fri 2014:09:19 01:49:25 EST] HOW TO CHANGE aguadev.com TO digi02>

https://www.digitalocean.com/community/tutorials/how-to-set-up-a-host-name-with-digitalocean

1. CHANGE DNS SERVERS ON GODADDY.COM

ns1.digitalocean.com
ns2.digitalocean.com
ns3.digitalocean.com


2. ADD DOMAIN IN DIGITAL OCEAN CONTROL PANEL

DNS TAB --> Add Domain --> fill in domain name and DROPLET IP address 

NB: The domain name does not have a www at the beginning.

--> ADD AN A RECORD


3. ENABLE test.example.com

A RECORD

    test    123.45.78.90


4. ENABLE http://example.com


A RECORD

    www    123.45.78.90

    
4. ENABLE http://www.example.com

CNAME

    www    @


4. ENABLE http://wwwwww.example.com

CNAME

    *       @


    
</entry>
<entry [Sun 2013:10:06 11:09:56 EST] CREATED namecheap.com ACCOUNT>


USERNAME: stuartpyoung
PASSWORD: p****T*****
    
</entry>
<entry [Thu 2013:07:25 17:58:21 EST] valuedme.com AND valuedme.org>

$10.99 for one year

    
</entry>
<entry [Thu 2013:07:25 17:46:48 EST] GODADDY ACCOUNT NUMBER 28564238>

ACCOUNT : 28564238
EMAIL   :  youngstuart@hotmail.com
PASS    :   p****R*****


</entry>