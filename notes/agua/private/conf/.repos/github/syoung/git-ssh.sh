#!/bin/sh
	
exec ssh -T -i /aguadev/conf/.repos/github/syoung/id_rsa -o "StrictHostKeyChecking no" -o "IdentitiesOnly yes" "$@"

exit 0

