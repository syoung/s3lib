#include <stdio.h>
#include <unistd.h>
#include <strings.h>

int gid;
 
int main (int argc, char *argv[] )
{
    freopen("download.out", "w", stdout);  // redirect stdoutput
    freopen("download.err", "w", stderr);  // redirect stderror

    /* Set euid and egid to actual user */
    gid = getgid();
    setegid(getgid());
    seteuid(getuid());
    
    /* Set uid, gid, euid and egid to root */    
    setegid(0);
    seteuid(0);
    setgid(0);
    setuid(0);

    /* Collate input and pass to executable */
    int MAX_INPUT = 10000;
    char input[MAX_INPUT];
    int j;
    for (j = 0; argv[1][j]; j++) {
        if ( j > MAX_INPUT) break;
        //printf ("argv[1][%d] is %c\n", j, argv[1][j]);
        input[j]= argv[1][j];
    }
  
    // NB: Intervening "'" is required for target to receive input
    execl("./download.pl", "'", input, NULL); 
  
    return(0);
}
