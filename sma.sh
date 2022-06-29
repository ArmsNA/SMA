#!/bin/bash

#Used to confirm integrity of the memory dump
md5sum memdump.raw

#Used to identify mem dump profile
voly.py -f memdump.raw imageinfo

#Used to identify files, folders, or executables/installers that have existed, even if existed
vol.py -f memdump.raw --profile Win7SP1x64 shellbags

#Used to find nonhidden processes
vol.py -f memdump.raw --profile Win7SP1x64 pslist

#Used to find nonhidden && hidden processes
vol.py -f memdump.raw --profile Win7SP1x64 psxview

#Used to identify and investigate passed cli arguments
vol.py -f memdump.raw --profile Win7SP1x64 cmdscan

#Used to display DLLs for specific process running on 6476 
voly.py -f memdump.raw --profile Win7SP1.64 dlllist -p 6476

#Used to display DLLs for specific process running on 8040 in an attempt to find 
#  suspicious/potential IoC differences between the processes
voly.py -f memdump.raw --profile Win7SP1.64 dlllist -p 8040