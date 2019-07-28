#!/bin/bash

nodes=$(netstat -tenpula | grep 17776 | awk '{print $5}' | sort -n | sed 's/\:.*$//' | uniq)

for node in $nodes
do
  if netcat -z -w 2 $node 17775 2>/dev/null; then
    echo "$node ✓"
  else
    echo "$node ✗"
  fi
done
