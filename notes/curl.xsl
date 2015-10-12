curl


<entry [Fri 2012:06:22 14:18:03 EST] curl GET AND POST PARAMETERS>

how to issue a GET

curl -G -d "key=val" "http://yadayadayada"

how to do a POST

curl -d "key=val" "http://yadayadayada" curl -F "key=val" "http://yadayadayada"


HOW TO DO BOTH:
use the POST method, but have the URL contain your GET data.

http://www.example.com/index.php?username=fred

    
</entry>
<entry [Tue 2012:06:19 00:28:54 EST] curl DEBUGGING>

PHP EXAMPLES

http://developer.yahoo.com/search/boss/boss_api_guide/codeexamples.html

CURL MAN PAGE

http://curl.haxx.se/docs/httpscripting.html


1. PRINT HEADER DETAILS TO LOG WITH --trace-ascii

USE login AND password ON MASTER 

curl \
-K /agua/conf/curl.txt \
--trace-ascii /tmp/curl-w-passsword.log \
https://github.com/login/oauth/authorize?client_id=96580e0b6f984bb8b64d&scope=public_repo&redirect_uri=http://ec2-50-19-18-44.compute-1.amazonaws.com/cgi-bin/agua/callback.cgi

GET CODE IN RESPONSE:
<!--
<html><body>You are being <a href="http://ec2-50-19-18-44.compute-1.amazonaws.com/cgi-bin/agua/callback.cgi?code=132e8fe76e0e45d6d117">redirected</a>.</body></html>

-->


USE client_id ON MASTER

curl \
-K /agua/conf/curl.txt \
--trace-ascii /tmp/curl-no-passsword.log \
https://github.com/login/oauth/authorize?client_id=96580e0b6f984bb8b64d&scope=public_repo&redirect_uri=http://ec2-50-19-18-44.compute-1.amazonaws.com/cgi-bin/agua/callback.cgi

NO CODE IN RESPONSE:

<!--
<html><body>You are being <a href="https://github.com/login?return_to=%2Flogin%2Foauth%2Fauthorize%3Fclient_id%3D96580e0b6f984bb8b64d">redirected</a>.</body></html>

-->

https://github.com/login/oauth/authorize?response_type=code&client_id=96580e0b6f984bb8b64d&scope=public_repo&redirect_uri=http://ec2-50-19-18-44.compute-1.amazonaws.com/cgi-bin/agua/callback.cgi



DIFFERENCE BETWEEN LOGS:

> == Info: Server auth using Basic with user 'syoung'
> => Send header, 261 bytes (0x105)
108,112c109,114
< 0044: User-Agent: curl/7.22.0 (x86_64-pc-linux-gnu) libcurl/7.22.0 Ope
< 0084: nSSL/1.0.1 zlib/1.2.3.4 libidn/1.23 librtmp/2.3
< 00b5: Host: github.com
< 00c7: Accept: */*
< 00d4: 
---
> 0044: Authorization: Basic c3lvdW5nOnJzdDJnaXRodWI=
> 0073: User-Agent: curl/7.22.0 (x86_64-pc-linux-gnu) libcurl/7.22.0 Ope
> 00b3: nSSL/1.0.1 zlib/1.2.3.4 libidn/1.23 librtmp/2.3
> 00e4: Host: github.com
> 00f6: Accept: */*
> 0103: 
118c120
< 0000: Location: https://github.com/login?return_to=%2Flogin%2Foauth%2F
< 0040: authorize%3Fclient_id%3D96580e0b6f984bb8b64d
< <= Recv header, 14 bytes (0xe)
< 0000: X-Runtime: 2
---
> 0000: Location: http://ec2-50-19-18-44.compute-1.amazonaws.com/cgi-bin
> 0040: /agua/callback.cgi?code=132e8fe76e0e45d6d117
> <= Recv header, 15 bytes (0xf)
> 0000: X-Runtime: 22
133a136,141
> <= Recv header, 274 bytes (0x112)
> 0000: Set-Cookie: _gh_sess=BAh7CDoJdXNlcmkDn0EEOg9zZXNzaW9uX2lkIiU4M2R
> 0040: lNWZlYzlhNmViZTNmZGJhZGEzZTVhMzlkNzU1YjoQZmluZ2VycHJpbnQiJTMxYzE
> 0080: wMjVkZGU2ZDBmYmIyNzMxMzhiYzAzMWFiYTRk--19e7dce36d1d1cc5135d6583d
> 00c0: 4180a08f05f9dec; path=/; expires=Sat, 01-Jan-2022 00:00:00 GMT; 
> 0100: secure; HttpOnly
141,143c149,151
< 0000: <html><body>You are being <a href="https://github.com/login?retu
< 0040: rn_to=%2Flogin%2Foauth%2Fauthorize%3Fclient_id%3D96580e0b6f984bb
< 0080: 8b64d">redirected</a>.</body></html>
---
> 0000: <html><body>You are being <a href="http://ec2-50-19-18-44.comput
> 0040: e-1.amazonaws.com/cgi-bin/agua/callback.cgi?code=132e8fe76e0e45d
> 0080: 6d117">redirected</a>.</body></html>
root@syoung-Satellite-L355:/home/syoung# diff /tmp/curl-no-passsword.log  /tmp/curl-w-passsword.log


NOTES
-----

http://curl.haxx.se/docs/httpscripting.html

CURL DEBUGGING
--------------

14. Debug
 
 Many times when you run curl on a site, you'll notice that the site doesn't
 seem to respond the same way to your curl requests as it does to your
 browser's.
 
 Then you need to start making your curl requests more similar to your
 browser's requests:
 
 * Use the --trace-ascii option to store fully detailed logs of the requests
   for easier analyzing and better understanding
 
 * Make sure you check for and use cookies when needed (both reading with --cookie and writing with --cookie-jar)
 
 * Set user-agent to one like a recent popular browser does
 
 * Set referer like it is set by the browser
 
 * If you use POST, make sure you send all the fields and in the same order as
   the browser does it. (See chapter 4.5 above)
 
 A very good helper to make sure you do this right, is the LiveHTTPHeader tool
 that lets you view all headers you send and receive with Mozilla/Firefox
 (even when using HTTPS).
 
 A more raw approach is to capture the HTTP traffic on the network with tools
 such as ethereal or tcpdump and check what headers that were sent and
 received by the browser. (HTTPS makes this technique inefficient.)
 
15. References
 
 RFC 2616 is a must to read if you want in-depth understanding of the HTTP
 protocol.
 
 RFC 3986 explains the URL syntax.
 
 RFC 2109 defines how cookies are supposed to work.
 
 RFC 1867 defines the HTTP post upload format.
 
 http://curl.haxx.se is the home of the cURL project

    
</entry>