#include <stdio.h>
#include <unistd.h>
#include <strings.h> // non-neccessary
#include <stdlib.h>

int gid;
 
int main (int argc, char *argv[] )
{
    //freopen("/tmp/download.out", "w", stdout);  // redirect stdoutput
    //freopen("/tmp/download.err", "w", stderr);  // redirect stderror

    ///* Set euid and egid to actual user */
    //gid = getgid();
    //setegid(getgid());
    //seteuid(getuid());
    
    /* Set uid, gid, euid and egid to root */    
    setegid(0);
    seteuid(0);
    setgid(0);
    setuid(0);

    // MAX LENGTH OF INPUT QUERY STRING
    int MAX_INPUT = 1000;

    char *input = malloc(MAX_INPUT + 1);
    input = getenv("QUERY_STRING");
    //printf("input: %s", input);

    // TESTING
    //printf("argc: %d\n", argc);
    //printf("argv[0]: %s\n", argv[0]);
    //int MAX_INPUT = 10000;
    //char input[MAX_INPUT];
    //int j;
    //for (j = 0; argv[1][j]; j++) {
    //    if ( j > MAX_INPUT) break;
    //    //printf ("argv[1][%d] is %c\n", j, argv[1][j]);
    //    input[j]= argv[1][j];
    //}
    //input[j] = '\0';
    //printf("input: %s", input);

    //// NB: Intervening "'" is required for target to receive input
    execl("./download.pl", "'", input, NULL); 
  
    return(0);
}
