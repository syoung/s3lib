import psutil
from memory_profiler import profile

class Test ():
   
   @profile
   def my_func():
	   a = [1] * (10 ** 6)
	   b = [2] * (2 * 10 ** 7)
	   del b
	   return a
   
   if __name__ == '__main__':
	   my_func()


t = Test()

#
#1. INSTALL SETUPTOOLS
#
#sudo su
#apt-get install python-setuptools
#
#
#2. INSTALL PROFILER
#
#easy_install -U memory_profiler
#
#
#3. INSTALL psutil (FOR SPEED)
#
#easy_install -U psutil
#
#
#4. USE PROFILER
#
# python profileme.py
# 
#Filename: profileme.py
#
#Line #    Mem usage    Increment   Line Contents
#================================================
#     5      5.3 MiB      0.0 MiB      @profile
#     6                                def my_func():
#     7      9.2 MiB      3.8 MiB   	   a = [1] * (10 ** 6)
#     8     85.5 MiB     76.3 MiB   	   b = [2] * (2 * 10 ** 7)
#     9      9.2 MiB    -76.3 MiB   	   del b
#    10      9.2 MiB      0.0 MiB   	   return a

