#include <stdio.h>
#include <unistd.h>

int gid;
char *getInput(char *inputline, size_t size)
{
    size_t i = 0;
    for ( ;; )
    {
        int ch = getchar();
        if ( ch == '\n' || ch == EOF )
        {
            break;
        }
        inputline[i] = ch;

        if ( ++i >= size - 1 )
        {
            printf("inputline may not exceed %lu digits\n", (long unsigned)(size - 1));
            break;
        }
    }
    inputline[i] = '\0';
    
    return inputline;
}
 
void input(char * number, size_t size)
{
    getInput(number, size);
    //freopen("init.out", "w", stdout);  // redirect stdoutput
    //freopen("init.err", "w", stderr);  // redirect stderror

    // NB: Intervening "'" is required for app.pl to catch the input
    execl("./admin.pl", "'", number, NULL); 
}

int main(void)
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

    /* Collate input and pass to executable */
    int MAX_INPUT = 10000;
    char number[MAX_INPUT];
    input(number, sizeof number);
    return 0;
}
