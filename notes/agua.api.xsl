agua.api


<entry [Sun 2014:02:09 10:33:08 EST] APICRAFT>

https://groups.google.com/forum/#!forum/api-craft

	
</entry>
<entry [Sat 2012:12:29 08:59:52 EST] WHAT DEVELOPERS WANT>

VARIOUS APIS
http://ffeathers.wordpress.com/2012/03/04/what-developers-want/

ATLASSIAN API
https://developer.atlassian.com/display/DOCS/Introduction+to+the+Atlassian+Plugin+SDK;jsessionid=D4A2FFE59A830E1829C5CC7C6FAC23C9


    
</entry>
<entry [Sat 2012:12:29 08:59:28 EST] AGUA API>

This API consists of predefined list of queries that may be made to the Agua backend system. The API describes the required format for these queries and the format of the elicited response.

All requests are made in JSON format, which is a simple but powerful data representation format. Requests are in 'PUT' requests with a size limit of 10,000 characters. Larger PUT requests can be handled by a simple edit and recompile of the 'agua' application. This application absorbs the setuid bit for security purposes before allowing the request to interact with the backend. It also limits the request size to prevent a buffer overrun-style intrusion.

File system listing requests are the only exception: they are 'GET' requests (e.g., made by the Project.js module) in order to conform to the Dojo javascript modules internal workings.


View API

refreshView
updateViewLocation
updateViewTracklist
activateView
addView
viewStatus
removeView
addViewFeature
removeViewFeature

