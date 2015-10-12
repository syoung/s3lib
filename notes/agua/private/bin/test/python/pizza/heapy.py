from guppy import hpy;

hp=hpy()

h = hp.heap()

print h



#1. INSTALL python-dev
#
#apt-get install python-dev
#
#
#2. INSTALL guppy
#
#easy_install -U guppy
#
#
#3. USE heapy IN GUPPY
#
#python heapy.py
#
#
#python heapy.py 
#Partition of a set of 25976 objects. Total size = 1923336 bytes.
# Index  Count   %     Size   % Cumulative  % Kind (class / dict of class)
#     0  11836  46   761068  40    761068  40 str
#     1   5853  23   212980  11    974048  51 tuple
#     2    324   1   136416   7   1110464  58 dict (no owner)
#     3   1636   6   117792   6   1228256  64 types.CodeType
#     4     70   0   107440   6   1335696  69 dict of module
#     5    199   1   104632   5   1440328  75 dict of type
#     6   1601   6    89656   5   1529984  80 function
#     7    199   1    88244   5   1618228  84 type
#     8    124   0    67168   3   1685396  88 dict of class
#     9   1045   4    37620   2   1723016  90 __builtin__.wrapper_descriptor
#<90 more rows. Type e.g. '_.more' to view.>
