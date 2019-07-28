#!/bin/bash

nodes=$(curl -s --url "http://127.0.0.1:7776" --data "{\"agent\":\"dpow\",\"method\":\"ipaddrs\"}" | jq -r .[])
timedate=$(date -u +'%d/%m/%Y %H:%M:%S')
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

for node in $nodes
do
  if netcat -z -w 2 $node 17775 2>/dev/null; then
    printf "[$timedate] ${GREEN}$node -  ^|^s${NC}\n"
  else
    printf "[$timedate] ${RED}$node -  ^|^w${NC}\n" | tee -a notcool.bro
  fi
done
