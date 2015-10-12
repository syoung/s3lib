from __future__ import unicode_literals
import json
import urllib
import urllib2

SendJSON = [
	{'userid':'andyh', 'password':'mypass'},
	{'PAGE':
		[	{'PAGENUM':'-1'}	]
	}
]

params = urllib.urlencode(SendJSON)	

# print params
# should see params of 'data=%5B%7B%22password%22%3A+%22mypass%22%2C+%22userid%22%3A+%22andyh%22%7D%2C+%7B%22PAGE%22%3A+%5B%7B%22PAGENUM%22%3A+%22-1%22%7D%5D%7D%5D'
f = urllib.urlopen("http://reqapi.annairesearch.com:8080/api/SubmitQuery.req?%s" % params)
print f.read()