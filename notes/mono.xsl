mono


<entry [Fri 2014:03:28 03:12:00 EST] MONO BASIC TUTORIAL>

http://mono-project.com/Mono_Basics


	
</entry>
<entry [Fri 2014:03:28 02:58:50 EST] INSTALLED mono ON UBUNTU>

http://linuxpoison.blogspot.com/2010/11/how-to-compile-and-run-c-net.html#ixzz2xFZ6iesw

1. INSTALL mono

sudo apt-get install mono-xsp2 mono-xsp2-base


2. CREATE TEST SCRIPT

emacs -nw hello.cs

<!--
using System;
 
	public class HelloWorld
	{
		static public void Main ()
		{
			Console.WriteLine ("Hello Mono World");
		}
	 
	}
-->


3. COMPILE TEST SCRIPT

gmcs hello.cs

WHICH CREATES FILE:

hello.exe


4. RUN hello.exe

mono hello.exe

WHICH SHOULD OUTPUT

Hello Mono World

	OK

</entry>