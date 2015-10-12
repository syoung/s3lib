#!/bin/sh
	
exec ssh -T -i  -o "StrictHostKeyChecking no" -o "IdentitiesOnly yes" "$@"

exit 0

