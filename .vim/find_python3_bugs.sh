#!/bin/bash

# TODO: utility script to help me find python2 vs 3 bugs in installed vim scripts

grep -i3 -Rne "has(.python3\?.)" *
echo "--"
echo "Report:"
grep -R "has(.python3\?.)" * | awk 'BEGIN { FS = ":" } { print $1 }' | sort | uniq -c | sort -nr
