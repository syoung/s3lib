#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <signal.h>
#include <strings.h>
#include <string.h>

int gid;

/* main(int argc, char **argv) - main process loop */
int main(int argc, char **argv)
{
    /* Set euid and egid to actual user */
    gid = getgid();
    setegid(getgid());
    seteuid(getuid());
    
    /* Set uid, gid, euid and egid to root */    
    setegid(0);
    seteuid(0);
    setgid(0);
    setuid(0);

    int c;
    int nc = 0;   
    char *input;
    while ( (c = getchar()) != EOF )
    {
        if ( c == '\n' || c == '\r' )
        {
            break;
        }

      input[nc] = (char)c;
        nc++;
    }
    /* Terminate string with null character: */
    input[nc] = '\0';
    
    int i;
    for ( i = 0; i < nc; i++ )
    {
        printf("%c", input[i]);
    }
    
    char command[] = "";
    strcat(command, "echo  '");
    strcat(command, input);
    strcat(command, "' | ");
    strcat(command, "/var/www/cgi-bin/agua/0.5/admin.pl");

    return 0;
}
