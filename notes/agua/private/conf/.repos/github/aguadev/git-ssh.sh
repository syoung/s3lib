#!/bin/sh
	
exec ssh -T -i /agua/conf/aguadev/id_rsa -o "StrictHostKeyChecking no" -o "IdentitiesOnly yes" "$@"

exit 0

