#!/usr/bin/env python
"""
TEST IPython
"""
import IPython
print "AFTER import IPython"

try:
    import IPython.Shell
#    ipy_shell = IPython.Shell.IPShellEmbed(argv=[])
except ImportError,e:

    print "ERROR: ", e
#    def ipy_shell():
#        log.error("Unable to load IPython.")
#        log.error("Please check that IPython is installed and working.")
#        log.error("If not, you can install it via: easy_install ipython")
