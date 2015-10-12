#!/bin/sh

#### OPENSTACK TESTING
export ospassword=biofarm1!
export ostenantid=892dc778a2e14257b75b6e96d2e503ee
export ostenantname=CU
export osusername=stuarty
export amiid=0168ae2e-d9e7-47ab-a57d-aec56988021d
export instancetype=bcf.8c.64g
export osauthurl=http://10.2.16.64:5000/v2.0
export keypair=annai

export login=syoung
export password=********
#export token=ded526622a10cfaaea0134662696b748ff666696
export keyfile=/root/.ssh/id_rsa
#export keyfile=/agua/conf/aguadev/id_rsa
export curlfile=/agua/conf/curl.txt
export installdir=/agua