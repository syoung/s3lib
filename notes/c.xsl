c


<entry [Thu 2013:05:02 11:08:58 EST] SEARCH ONLINE FOR C STUFF>

1. STACK OVERFLOW WITH C TAG

http://stackoverflow.com/tags/c


2. GOOGLE

Use the + or - signs to add or remove weight for a search term.

+C for articles where the letter C stands alone
+C -C++ for C articles where there are no references to C++
+"C Sharp" for articles with weight added to a grouped term

    
</entry>
<entry [Thu 2012:12:20 01:14:06 EST] CREATED upload.cgi C WRAPPER FOR upload.pl>

1. CREATED upload.c

<!--    
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
-->

2. COMPILED INTO upload.cgi

cd /agua/private/cgi-bin/c/upload
cc -o upload.cgi upload.c



3. TESTED upload.cgi WITH upload.pl

<!--    
    #!/usr/bin/perl -w
    
    
    my $input = <STDIN>;
    
    my $outfile = "./OUT";
    open(OUT, ">$outfile") or die "Can't open outfile: $outfile\n";
    print OUT $input;
    close(OUT) or die "Can't close outfile: $outfile\n";

-->



cd /agua/private/cgi-bin/c/upload
./upload.cgi < /agua/t/bin/Agua/Upload/inputs/google-chrome-stable_current_amd64.deb

cat OUT

<!--

-----------------------------15400688611499959261267840338
Content-Disposition: form-data; name="uploadedfiles[]"; filename="google-chrome-stable_current_amd64.deb"
Content-Type: application/x-deb

!<arch> debian-binary 1351708228 0 0 100644 4 ` 2.0 control.tar.gz 1351708228 0 0 100644 5894 ` ^_\213^H�����^B^Cí<y^?âF\226ùwõ)*Ø;ÝnÌ!\20118é\236^U ^N^[\
0æ0ØÓ^YGG!d\204$tpx2ûÙ÷U\225Äeww²»Iv^?£ú%mSÇ«Wï®WÏ¤3ßýî-^Kíòâ\202þ\204vü\223þÎ^KÙ|^(\òÙ<ô_^òüwèâ»? ^E\236/»^H}çÚ¶ÿµyß^Zÿ^?ÚÒ^YÇö|Ãòü?\213ÿB\216/^Töø\237û\
.Ëó^W9à^?6æÿïÞN¾Ï(\206\225ñ¦Ü w\202*¶³q }ê£÷ê^Y^R²Ù^R^ZL1ªL]{n^Ds$^FþÔv½4^RM^SÑ\211^^r±\207Ý%ÖÒ°~èadO\220?5<äÙ\201«b¤Ú^ZFðQ·\227Øµ°\206\224 \222Q¹_MyþÆÄÈ\
4TlÁ2^?*ûH\225-¤`�4±

-----------------------------15400688611499959261267840338
Content-Disposition: form-data; name="path"

Project1/Workflow1/data
-----------------------------15400688611499959261267840338
Content-Disposition: form-data; name="username"

guest
-----------------------------15400688611499959261267840338
Content-Disposition: form-data; name="sessionId"
1355898711.1206.532
-----------------------------15400688611499959261267840338--

-->



4. MOVED ORIGINAL upload.cgi TO upload.pl

cd /var/www/cgi-bin/agua
mv upload.cgi upload.pl



5. COPIED upload.cgi TO CGI-BIN

cd /agua/private/cgi-bin/c/upload
sudo cp upload.cgi /var/www/cgi-bin/agua


6. SET PERMISSIONS

Set permissions as follows:
chown root:wheel ./upload 
chmod 4755 ./upload
chown root:wheel ./upload.pl 
chmod 0755 ./upload.pl


Now you access the C wrapper as 'http://www.yourweb.com/cgi-bin/upload', which just calls 'upload.pl' with the suid flag set.
That's it! 




NOTES
-----

http://www.redantigua.com/apache-suid-perl.html

Run suid Perl scripts under Apache without suidperl (using a really simple C wrapper)
Run suid Perl scripts under Apache without suidperl (using a really simple C wrapper)
If Perl was installed on your computer without the 'suidperl' program, you can't run suid Perl script.
One situation may be when you want to use your nifty administrative Perl tool from a web interface, i.e. run a script which requires root access.
Anyhow, your Apache server runs as user 'http' or 'nobody', which makes it impossible to use the Perl script with 'suidperl' missing.
Here is where we will use the C wrapper (calm down, you don't need any C knowledge at all):
Assume that your Perl script is installed as 'http://www.yourweb.com/cgi-bin/yourniftytool.pl', but it doesn't work very well... :-(

Create yourniftytool.c:
/*
 *
 * Compile via "cc -o yourniftytool yourniftytool.c"
 * and install as ./yourniftytool.
 * chown root:wheel ./yourniftytool 
 * chmod 4755 ./yourniftytool
 * chown root:wheel ./yourniftytool.pl 
 * chmod 0755 ./yourniftytool.pl
 *
 */
#define REAL_PATH "./yourniftytool.pl"
main(ac, av)
     char **av;
{
  execv(REAL_PATH, av);
}

Compile as
cc -o yourniftytool yourniftytool.c

Set permissions as follows:
chown root:wheel ./yourniftytool 
chmod 4755 ./yourniftytool
chown root:wheel ./yourniftytool.pl 
chmod 0755 ./yourniftytool.pl
Now you access the C wrapper as 'http://www.yourweb.com/cgi-bin/yourniftytool', which just calls 'yourniftytool.pl' with the suid flag set.
That's it! 

NOTE:
If you didn't consider the SUID requirements for Perl scripts already, here is a hint what to put at the beginning of 'yourniftytool.pl':
# Required for SUID programs
#----------------------------------------
delete @ENV{qw(IFS CDPATH ENV BASH_ENV)};
$ENV{'PATH'}='/bin:/usr/bin';
#----------------------------------------


</entry>
<entry [Mon 2012:02:27 01:02:26 EST] ADDED download.c TO CALL download.pl>

gcc download.c -o download.cgi


export QUERY_STRING="mode=downloadFile&username=admin&sessionId=9999999999.9999.999&filepath=/nethome/admin/agua/Project1/Workflow1/stdout/3-elandIndex.stdout"

./download.cgi

    
</entry>
<entry [Wed 2011:04:20 14:45:09 EST] CREATED workflow.c TO CALL workflow.pl>

FINAL VERSION:
    
<!--

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
    //freopen("workflow.out", "w", stdout);  // redirect stdoutput
    //freopen("workflow.err", "w", stderr);  // redirect stderror

    // NB: Intervening "'" is required for app.pl to catch the input
    execl("/var/www/cgi-bin/agua/0.6/workflow.pl", "'", number, NULL); 
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


-->



COMPILE:

gcc workflow.c -o workflow.cgi


</entry>
<entry [Wed 2011:04:20 14:42:40 EST] CORE DUMP DEBUGGING SUMMARY>
    
    
SO MUST RUN gcc USING -g FLAG TO ADD SYMBOLS FOR DEBUGGING TO CORE:

gcc -g agua.c -o agua


NOW PROBE WITH dbg (NB: DON'T HAVE TO RERUN PROGRAMME TO REDUMP CORE):

dbg agua core


</entry>
<entry [Wed 2011:04:20 14:42:03 EST] FIXED incompatible implicit declaration of built-in function ‘execl’>
    
    
FIRST TIME NO PROBLEM BUT, WITH NO CHANGES

wrap.c: In function ‘input’:
wrap.c:34: warning: incompatible implicit declaration of built-in function ‘execl’

SOLUTION:

ADD #include <unistd.h> AT TOP OF SCRIPT


echo '{"username":"syoung","sessionId":"9999999999.9999.999","mode":"addCluster","cluster":"picocluster","clustername":"picocluster","minnodes":"0","maxnodes":"1","typecombo":"t1.micro","amiid":"ami-d1c42db8","description":"Small test cluster","notes":"Notes","instancetype":"t1.micro"}' | ./workflow

    OK!

</entry>
<entry [Thu Feb 17 00:57:20 EST 2011] FIX getchar ISSUES>

FINAL WORKING VERSION USES freopen FOR REDIRECTION OF STDOUT AND STDERR BEFORE system CALL

NB: DEBUGGING

ulimit -c unlimited
gcc -g agua.c -o agua -fno-stack-protector
gdb agua core


FULL SCRIPT
http://www.daniweb.com/forums/thread29250.html


<!--
    #include <stdio.h>
    
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
        freopen("admin.out", "w", stdout);  // redirect stdoutput
        freopen("admin.err", "w", stderr);  // redirect stderror
    
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

-->

</entry>
<entry [Thu Feb 17 00:56:20 EST 2011] FIX ERROR 'warning: not enough variable arguments to fit a sentinel'>
    
    
http://www.linuxonly.nl/docs/2/2_Sentinel_warning_missing_sentinel_in_function_call.html


ADD A LAST INPUT ARGUMENT TO THE FUNCTION IN QUESTION:

(char *)NULL

Sentinels & warnings

A sentinel is a special value which indicates the end of a series of data. In the context of GCC, it is a null pointer which ends a list of parameters to a function.

The function

execl(const char * path, const char * arg, ...)

takes a variable amount of parameters. To know where to stop reading parameters, the last parameter must be a null pointer. When you do not end the list with a null pointer, execl will not stop scanning, which will result in errors. The following code, therefore, is wrong:

#include < unistd.h>

int main() {
	execl("/bin/ls", "ls", "-l");
	return 0;
}

The execl function call is not terminated by a null pointer and GCC will give a warning. The following code is better:

#include < unistd.h>

int main() {
	execl("/bin/ls", "ls", "-l", NULL);
	return 0;
}
As you can see, the execl function is now terminated by a null pointer and it will stop scanning it's arguments after that. However, GCC 4 will still issue a warning: 
warning: missing sentinel in function call 
This is because NULL is not of the right type: it is defined as integer 0 instead of a pointer with the value 0. Doing an explicit cast can make the warning go away:

#include < unistd.h>

int main() {
	execl("/bin/ls", "ls", "-l", (char *)NULL);
	return 0;
}
Using sentinels

One can specify that a function uses a sentinel by declaring it as follows:

char * build_path(const char * str, ...) __attribute__((__sentinel__(0)));
This indicates that the parameter list is ended with the special value 0, which must be a char pointer.

On most systems, there is no difference between 0 and (char *)0. On 64 bit systems, however, the integer 0 is 32 bits and the pointer 0 is 64 bits. The compiler does not know whether it is an integer or a pointer, and defaults for the integer. This will not clear the upper 32 bits and the function will not stop scanning its parameters.


</entry>
<entry [Thu Feb 17 00:55:20 EST 2011] DISABLE 'STACK SMASHING' PROTECTION>

http://stackoverflow.com/questions/1345670/stack-smashing-detected


An input of string greater than size 10 causes corruption of gcc inbuilt protection canary variable followed by SIGABRT to terminate the program.

You can disable this protection of gcc using option
-fno-stack-protector 
while compiling.
In that case you will get a segmentation fault if you try to access illegal memory location. and of course you can detect the point of overflow using tools mentioned above :)


USE THIS TO DISABLE:

gcc -g getline.c -o getline -fno-stack-protector
 

TO AVOID THIS:

root@hplaptop:/home/syoung/base/pipeline/c# echo 'hsers wereasdfasdf ae' | ./getline
enter a 9-digit number: input may not exceed 9 digits
number = "hsers wer"
*** stack smashing detected ***: ./getline terminated
======= Backtrace: =========
/lib/libc.so.6(__fortify_fail+0x37)[0x7eff6ba58537]
/lib/libc.so.6(__fortify_fail+0x0)[0x7eff6ba58500]
./getline[0x4008a2]
/lib/libc.so.6(+0x65c8)[0x7eff6b95f5c8]
======= Memory map: ========
00400000-00401000 r-xp 00000000 08:06 8652764                            /home/syoung/base/pipeline/c/getline
00600000-00601000 r--p 00000000 08:06 8652764                            /home/syoung/base/pipeline/c/getline
00601000-00602000 rw-p 00001000 08:06 8652764                            /home/syoung/base/pipeline/c/getline
01a45000-01a66000 rw-p 00000000 00:00 0                                  [heap]
7eff6b743000-7eff6b758000 r-xp 00000000 08:01 2097225                    /lib/libgcc_s.so.1
7eff6b758000-7eff6b957000 ---p 00015000 08:01 2097225                    /lib/libgcc_s.so.1
7eff6b957000-7eff6b958000 r--p 00014000 08:01 2097225                    /lib/libgcc_s.so.1
7eff6b958000-7eff6b959000 rw-p 00015000 08:01 2097225                    /lib/libgcc_s.so.1
7eff6b959000-7eff6bad3000 r-xp 00000000 08:01 2097241                    /lib/libc-2.12.1.so
7eff6bad3000-7eff6bcd2000 ---p 0017a000 08:01 2097241                    /lib/libc-2.12.1.so
7eff6bcd2000-7eff6bcd6000 r--p 00179000 08:01 2097241                    /lib/libc-2.12.1.so
7eff6bcd6000-7eff6bcd7000 rw-p 0017d000 08:01 2097241                    /lib/libc-2.12.1.so
7eff6bcd7000-7eff6bcdc000 rw-p 00000000 00:00 0 
7eff6bcdc000-7eff6bcfc000 r-xp 00000000 08:01 2097280                    /lib/ld-2.12.1.so
7eff6bedd000-7eff6bee0000 rw-p 00000000 00:00 0 
7eff6bef8000-7eff6befc000 rw-p 00000000 00:00 0 
7eff6befc000-7eff6befd000 r--p 00020000 08:01 2097280                    /lib/ld-2.12.1.so
7eff6befd000-7eff6befe000 rw-p 00021000 08:01 2097280                    /lib/ld-2.12.1.so
7eff6befe000-7eff6beff000 rw-p 00000000 00:00 0 
7fff3cfb9000-7fff3cfda000 rw-p 00000000 00:00 0                          [stack]
7fff3cfff000-7fff3d000000 r-xp 00000000 00:00 0                          [vdso]
ffffffffff600000-ffffffffff601000 r-xp 00000000 00:00 0                  [vsyscall]
Aborted



http://linux.die.net/man/3/getchar


fgetc(), getc() and getchar() return the character read as an unsigned char cast to an int or EOF on end of file or error.

http://stackoverflow.com/questions/4629891/how-to-convert-from-integer-to-unsigned-char-in-c-given-integers-larger-than-256

npo need to cast when pushing tpo char arraay


getchar(3) - Linux man page

Name

fgetc, fgets, getc, getchar, gets, ungetc - input of characters and strings

Synopsis

#include < stdio.h>

int fgetc(FILE *stream);
char *fgets(char *s, int size, FILE *stream);
int getc(FILE *stream);
int getchar(void);
char *gets(char *s);
int ungetc(int c, FILE *stream);

Description


 
fgetc() reads the next character from stream and returns it as an unsigned char cast to an int, or EOF on end of file or error.

getc() is equivalent to fgetc() except that it may be implemented as a macro which evaluates stream more than once.

getchar() is equivalent to getc(stdin).

gets() reads a line from stdin into the buffer pointed to by s until either a terminating newline or EOF, which it replaces with '\0'. No check for buffer overrun is performed (see BUGS below).

fgets() reads in at most one less than size characters from stream and stores them into the buffer pointed to by s. Reading stops after an EOF or a newline. If a newline is read, it is stored into the buffer. A '\0' is stored after the last character in the buffer.

ungetc() pushes c back to stream, cast to unsigned char, where it is available for subsequent read operations. Pushed-back characters will be returned in reverse order; only one pushback is guaranteed.

Calls to the functions described here can be mixed with each other and with calls to other input functions from the stdio library for the same input stream.

For non-locking counterparts, see unlocked_stdio(3).

Return Value

fgetc(), getc() and getchar() return the character read as an unsigned char cast to an int or EOF on end of file or error.

gets() and fgets() return s on success, and NULL on error or when end of file occurs while no characters have been read.

ungetc() returns c on success, or EOF on error.




Re: stdin & stream
If you wish, your program can assume that if there was nothing on the command line, redirection is being used. In that case, instead of using the fopen(), simply assign stdin to your stream:
C Syntax (Toggle Plain Text)
FILE *stream;
 
if (argc < 2)
{
    stream = stdin;
}
else
{
    stream = fopen(argv[i],"r");
    if (stream==NULL) 
   ...
}
This allows your program to take a file
> prog file.name

redirected file
>prog < file.name

or from the keyboard
>prog


</entry>
<entry [Thu Feb 17 00:56:20 EST 2011] FIX C ON UBUNTU>

apt-get install build-essential

    Reading package lists... Done
    Building dependency tree       
    Reading state information... Done
    build-essential is already the newest version.
    0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.

</entry>
<entry [Wed Feb 16 19:10:33 EST 2011] GET STDIN AND USE TO EXECUTE A PROGRAM>


http://stackoverflow.com/questions/70842/execute-program-from-within-a-c-program
http://www.crasseux.com/books/ctutorial/getc-and-fgetc.html
  

ENABLE CORE DUMP

I have a program that is segfaulting - I want to look at the core dump, except that I am not getting one in my directory - do I need to specify something to gcc to make it leave the core dump file in my directory?


ulimit -c unlimited


RUN APPLICATION TO GET CORE DUMP

gcc agua.c -o agua

echo '{"username":"syoung","sessionId":"1228791394.7868.158","mode":"addUser","data":{"username":"aaa"}}' | ./agua

  Segmentation fault (core dumped)


INVESTIGATE DUMPED CORE
  ...
  Reading symbols from /home/syoung/0.5/cgi-bin/agua...(no debugging symbols found)...done.
  [New Thread 13582]
  
  warning: Can't read pathname for load map: Input/output error.
  Reading symbols from /lib/libc.so.6...(no debugging symbols found)...done.
  Loaded symbols for /lib/libc.so.6
  Reading symbols from /lib64/ld-linux-x86-64.so.2...(no debugging symbols found)...done.
  Loaded symbols for /lib64/ld-linux-x86-64.so.2
  Core was generated by `./agua'.
  Program terminated with signal 11, Segmentation fault.
  #0  0x0000000000400803 in main ()
  (gdb) 


CAN'T USE FILE COMMAND INSIDE gdb SO TRY IT OUTSIDE TO CHECK IF EXECUTABLE CONTAINS DEBUGGING SYMBOLS:

file agua

    agua: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.15, not stripped



SO MUST RUN gcc USING -g FLAG TO ADD SYMBOLS FOR DEBUGGING TO CORE:

gcc -g agua.c -o agua


NOW PROBE WITH dbg (NB: DON'T HAVE TO RERUN PROGRAMME TO REDUMP CORE):

dbg agua core


    Core was generated by `./agua'.
    Program terminated with signal 11, Segmentation fault.
    #0  0x0000000000400803 in main (argc=1, argv=0x7ffff87128c8) at agua.c:36
    36	        input[nc] = (char)c;


</entry>
<entry [Wed Feb 16 19:09:33 EST 2011] USEFUL C 'INCLUDES'>

Libraries functions are included by specying the name of the appropriate header file in an include statement:
  #include < stdlib.h>
  #include < string.h>
This is similar to C++ but the .h is required.
Here are some of the most useful C libraries:

stdio : printf, fprintf, sprintf, fgets, fputs
string : strcpy, strcmp, strncmp, strtok, strlen
stdlib : utility functions: atoi, atol,
assert : useful in debugging: assert
You should know what most of these functions do, especially strtok() which you'll be using at a crucial point in the Yash shell.


</entry>
<entry [Wed Feb 16 19:08:33 EST 2011] TROUBLESHOOTING SEGFAULTS>


There are 5 common mistakes that lead to segmentation faults:

  1. dereferencing NULL
  2. dereferencing an uninitialized pointer
  3. dereferencing a pointer that has been freed (or deleted, in C++) or that has gone out of scope   (in the case of arrays declared in functions)
  4. writing off the end of an array.   
  5. a recursive function that uses all of the stack space. On some systems, this will cause a "stack overflow" report, and on others, it will merely appear as another type of segmentation fault. 


Debugging Segmentation Faults and Pointer Problems
http://www.cprogramming.com/debugging/segfaults.html


For new programmers, debugging errors associated with pointers can be a nightmare. "Segmentation Fault (core dumped)" is a pretty vague error message, and it's even worse when strange bugs start appearing that don't cause segmentation faults -- but that result in things like memory getting overwritten in unexpected ways. 

But finding problems with pointers is easier than you'd think. Those segfaults often turn out to be among the easiest bugs to find, and using special tools such as Valgrind, even finding buffer overflows is simplified. 

This tutorial assumes that you have a basic knowledge of pointers such as can be acquired by reading a pointer tutorial. It would help to be running a system that has a debugger such as GDB, or to at least have sufficient familiarity with GDB-like debuggers to understand the examples presented. Finally, for finding buffer overflows and other invalid uses of memory, you will fare best with Valgrind, though none of the examples will use it.
What is a segmentation fault?

When your program runs, it has access to certain portions of memory. First, you have local variables in each of your functions; these are stored in the stack. Second, you may have some memory, allocated during runtime (using either malloc, in C, or new, in C++), stored on the heap (you may also hear it called the "free store"). Your program is only allowed to touch memory that belongs to it -- the memory previously mentioned. Any access outside that area will cause a segmentation fault. Segmentation faults are commonly referred to as segfaults. 

There are four common mistakes that lead to segmentation faults: dereferencing NULL, dereferencing an uninitialized pointer, dereferencing a pointer that has been freed (or deleted, in C++) or that has gone out of scope (in the case of arrays declared in functions), and writing off the end of an array. 

A fifth way of causing a segfault is a recursive function that uses all of the stack space. On some systems, this will cause a "stack overflow" report, and on others, it will merely appear as another type of segmentation fault. 

The strategy for debugging all of these problems is the same: load the core file into GDB, do a backtrace, move into the scope of your code, and list the lines of code that caused the segmentation fault. 

For instance, running on a Linux system, here's an example session:
% gdb example core
This just loads the program called example using the core file called "core". The core file contains all the information needed by GDB to reconstruct the state of execution when the invalid operation caused a segmentation fault. 

Once we've loaded up gdb, we get the following:
Some copyright info

Core was generated by `example'.
Program terminated with signal 11, Segmentation fault.

Some information about loading symbols
#0  0x0804838c in foo() () at t.cpp:4
4           *x = 3;
So, execution stopped inside the function called foo() on line 4, which happened to be the assignment of the number 3 to the location pointed to by x. This is a goldmine of information: we already know exactly where the problem happened and which pointer was involved. 

(gdb) list
1       void foo()
2       {
3           char *x = 0;
4           *x = 3;
5       }
6       
7       int main()
8       {
9           foo();
10          return 0;
(gdb) 
Since this is a somewhat contrived example, we can immediately find the error. The pointer x is initialized to 0, equivalent to NULL (in fact, NULL is a stand-in for 0), and we know that it's a no-no to then try to access that pointer. 

But what if it weren't so obvious? Simply printing the value of the pointer can often lead to the solution. In this case:
(gdb) print x
$1 = 0x0
Printing out x reveals that it points to memory address 0x0 (the 0x indicates that the value following it is in hexadecimal, traditional for printing memory addresses). The address 0x0 is invalid -- in fact, it's NULL. If you dereference a pointer that stores the location 0x0 then you'll definitely get a segmentation fault, just as we did. 

If we'd gotten something more complicated, such as execution crashing inside a system call or library function (perhaps because we passed an uninitialized pointer to fgets), we'd need to figure out where we called the library function and what might have happened to cause a segfault within it. Here's an example from another debugging session:
#0  0x40194f93 in strcat () from /lib/tls/libc.so.6
(gdb)
This time, the segfault occurred because of something inside strcat. Does this mean the library function did something wrong? Nope! It means that we probably passed a bad value to the function. To debug this, we need to see what we passed into strcat. 

So let's see what function call we made that led to the segfault.
(gdb) backtrace
#0  0x40194f93 in strcat () from /lib/tls/libc.so.6
#1  0x080483c9 in foo() () at t.cpp:6
#2  0x080483e3 in main () at t.cpp:11
(gdb) 
Backtrace lists the function calls that had been made at the time the program crashed. Each function is directly above the function that called it. So foo was called by main in this case. The numbers on the side (#0, #1, #2) also indicate the order of calls, from most recent to longest ago. 

To move from viewing the state within each function (encapsulated in the idea of a stack frame), we can use the up and down commands. Right now, we know we're in the strcat stack frame, which contains all of the local variables of strcat, because it's the top function on the stack. We want to move "up" (toward the higher numbers); this is the opposite of how the stack is printed.
(gdb) up
#1  0x080483c9 in foo() () at t.cpp:6
6           strcat(x, "end");
(gdb)
This helps a little -- we know that we have a variable called x and a constant string. We should probably lookup the strcat function at this point to make sure that we got the order of arguments correct. Since we did, the problem must be with x.
(gdb) print x
$1 = 0x0
There it is again: a NULL pointer. The strcat function must be derefencing a NULL pointer that we gave it, and even though it's a library function, it doesn't do anything magical. 

NULL pointers are generally pretty easy to work with -- once we've found one, we know that somewhere along the line, we didn't allocate some memory that we should have. It's just a question of where. A common mistake is to not check the return from malloc to make sure that the system isn't out of memory. Another common mistake is to assume that a function that calls malloc doesn't return NULL even though it returns the result of malloc. Note that in C++, when you call new, it will throw an exception, bad_alloc, if sufficient memory cannot be allocated. Your code should be prepared to handle this situation cleanly, and if you choose to catch the exception and return NULL inside a function that ordinarily returns a new'ed pointer, this advice still holds.
char *create_memory()
{
    char *x = malloc(10);
    if(x == NULL)
    {
        return NULL;
    }
    strcpy(x, "a string");
    return x;
}

void use_memory()
{
    char *new_memory = create_memory();
    new_memory[0] = 'A'; /* make it a capital letter */
}
We did a good thing by checking to make sure that malloc succeeds before using the memory in create_memory, but we don't check to make sure that create_memory returns a valid pointer! Shame on us. This is a bug that won't catch you until you're running your code on a real system unless you explicitly test your code in low memory situations.
Dereferencing an Uninitialized Pointer

Figuring out whether or not a pointer has been initialized is a bit harder than figuring out whether a pointer is NULL. The best way to avoid using an uninitialized pointer is to set your pointers to NULL when you declare them (or immediately initialize them). That way, if you do use a pointer that hasn't had memory allocated for it, you will immediately be able to tell. 

If you don't set your pointers to NULL when you declare them, then you'll have a much harder time of it (remember that non-static variables aren't automatically initialized to anything in C or C++). You might need to figure out if 0x4025e800 is valid memory. One way you can get a sense of this in GDB is by printing out the addresses stored in other pointers you've allocated. If they're fairly close together, you've probably correctly allocated memory. Of course, there's no guarantee that this rule of thumb will hold on all systems. 

In some cases, your debugger can tell you that an address is invalid based on the value stored in the pointer. For instance, in the following example, GDB indicates that the char* x, which I set to point to the memory address "30", is not accessible.
(gdb) print x
$1 = 0x1e < out of bounds>
(gdb) print *x
Cannot access memory at address 0x1e
Generally, though, the best way to handle such a situation is just to avoid having to rely on memory's being close together or obviously invalid. Set your variables to NULL from the beginning.
Dereferencing Freed Memory

This is another tricky bug to find because you're working with memory addresses that look valid. The best way to handle such a situation is again preventative: set your pointer to point to NULL as soon as you've freed it. That way, if you do try to use it later, then you'll have another "dereferencing NULL" bug, which should be much easier to track. 

Another form of this bug is the problem of dealing with memory that has gone out of scope. If you declare a local array such as
char *return_buffer()
{
    char x[10];
    strncpy(x, "a string", sizeof(x));
    return x;
}
then the array, x, will no longer be valid once the function returns. This is a really tricky bug to find because once again the memory address will look valid when you print it out in GDB. In fact, your code might even work sometimes (or just display weird behavior by printing whatever happens to be on the stack in the location that used to be the memory of the array x). Generally, the way you'll know if you have this kind of bug is that you'll get garbage when you print out the variable even though you know that it's initialized. Watch out for the pointers returned from functions. If that pointer is causing you trouble, check the function and look for whether the pointer is pointing to a local variable in the function. Note that it is perfectly fine to return a pointer to memory allocated in the function using new or malloc, but not to return a pointer to a statically declared array (e.g., char x[10]). 

Tools such as Valgrind can be immensely helpful in tracking down these bugs because they watch memory to ensure that it's valid. If it isn't, Valgrind will alert you. Our Valgrind tutorial goes into more detail about finding this sort of bug. 

Of course, the best solution is simply to avoid ever doing anything like this. Technically, you could use a static buffer, which would allow you to have a permanent buffer you could pass around. But this is only asking for trouble if you later decide, for whatever reason, that you don't need it to be static (if you forget why you made it static in the first place, for instance).
Writing off the end of the array

Generally, if you're writing off the bounds of an array, then the line that caused the segfault in the first place should be an array access. (There are a few times when this won't actually be the case -- notably, if the fact that you wrote off an array causes the stack to be smashed -- basically, overwriting the pointer that stores where to return after the function completes.) 

Of course, sometimes, you won't actually cause a segfault writing off the end of the array. Instead, you might just notice that some of your variable values are changing periodically and unexpectedly. This is a tough bug to crack; one option is to set up your debugger to watch a variable for changes and run your program until the variable's value changes. Your debugger will break on that instruction, and you can poke around to figure out if that behavior is unexpected.
(gdb) watch [variable name]
Hardware watchpoint 1: [variable name]
(gdb) continue
...
Hardware watchpoint 1: [variable name]

Old value = [value1]
New value = [value2]
This approach can get tricky when you're dealing with a lot of dynamically allocated memory and it's not entirely clear what you should watch. To simplify things, use simple test cases, keep working with the same inputs, and turn off randomized seeds if you're using random numbers!
Stack Overflows

A stack overflow isn't the same type of pointer-related problem as the others. In this case, you don't need to have a single explicit pointer in your program; you just need a recursive function without a base case. Nevertheless, this is a tutorial about segmentation faults, and on some systems, a stack overflow will be reported as a segmentation fault. (This makes sense because running out of memory on the stack will violate memory segmentation.) 

To diagnose a stack overflow in GDB, typically you just need to do a backtrace:
(gdb) backtrace
#0  foo() () at t.cpp:5
#1  0x08048404 in foo() () at t.cpp:5
#2  0x08048404 in foo() () at t.cpp:5
#3  0x08048404 in foo() () at t.cpp:5
[...]
#20 0x08048404 in foo() () at t.cpp:5
#21 0x08048404 in foo() () at t.cpp:5
#22 0x08048404 in foo() () at t.cpp:5
---Type  to continue, or q  to quit---
If you find a single function call piling up an awfully large number of times, this is a good indication of a stack overflow. 

Typically, you need to analyze your recursive function to make sure that all the base cases (the cases in which the function should not call itself) are covered correctly. For instance, in computing the factorial function
int factorial(int n)
{
    // What about n < 0?
    if(n == 0)
    {
        return 1;
    }
    return factorial(n-1) * n;
}
In this case, the base case of n being zero is covered, but what about n < 0? On "valid" inputs, the function will work fine, but not on "invalid" inputs like -1. 

You also have to make sure that your base case is reachable. Even if you have the correct base case, if you don't correctly progress toward the base case, your function will never terminate.
int factorial(int n)
{
    if(n <= 0)
    {
        return 1;
    }
    // Ooops, we forgot to subtract 1 from n
    return factorial(n) * n;
}
Summary

While segmentation faults can be nasty and difficult to track down when you are first learning to program, over time you will start to see them as falling into a small number of patterns that are relatively easy to track down. This tutorial hasn't covered every possible scenario for causing segmentation faults, but it touches on many of the basic problems you may encounter.


</entry>
