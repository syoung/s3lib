newrelic



<entry [Sun 2013:12:15 06:17:57 EST] NEW RELIC stuarty@annai LICENSE KEY>


1. LICENCE KEY

715534b4fcf0b95ba60ea1b85c87b428427ec386



	
</entry>
<entry [Mon 2013:12:02 17:03:30 EST] NEW RELIC stuartpyoung LICENSE KEY>

1. LICENCE KEY

dfab023988d3c9a493e94b619407472ae0f10322


2. INSTALL NEW RELIC FOR node.js

npm install newrelic


3. CONFIGURE FILE newrelic.js

COPY

newrelic.js

FROM

node_modules/newrelic

TO THE ROOT DIRECTORY OF YOUR APPLICATION


Set a value for app_name

Replace the license_key value with your New Relic license key


4. REQUIRE newrelic IN YOUR APP

Make this the first line of your app's startup script:

require('newrelic');



</entry>