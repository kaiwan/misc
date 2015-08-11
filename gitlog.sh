#!/bin/bash
# Displays entire git log in a useful format.
#  Ref: http://githowto.com/history
# intention is to pipe this as input to egrep to look for desired pattern(s).
# Kaiwan NB.

# In kernel folder?
head -n1 Makefile |grep VERSION >/dev/null || {
 echo "Not in kernel src tree folder root ?"
 exit 1
}
[ ! -d .git ] && {
 echo ".git missing, aborting..."
 exit 1
}
git --no-pager log --pretty=format:"%h %ad | %s%d [%an]" --date=short
