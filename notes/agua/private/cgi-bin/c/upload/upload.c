#include <stdio.h>

#define REAL_PATH "./upload.pl"

main(ac, av) 
char **av;
{
	freopen("upload.out", "w", stdout);  // redirect stdoutput
	freopen("upload.err", "w", stderr);  // redirect stderror

	///* Set euid and egid to actual user */
	//gid = getgid();
	//setegid(getgid());
	//seteuid(getuid());
	//
	/* Set uid, gid, euid and egid to root */    
	setegid(0);
	seteuid(0);
	setgid(0);
	setuid(0);

	printf("before execv(REAL_PATH, av)");
	execv(REAL_PATH, av);
}
