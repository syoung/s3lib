#!/bin/sh

# Headers are written first. The special "Status"
# header indicates the response status code
echo "Status: 200"
echo "Content-Type: text/plain"
echo

echo "whoami:"
echo `whoami`

# Followed by a response body
echo "Hello World!"