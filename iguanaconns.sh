#!/bin/bash

cd "${BASH_SOURCE%/*}" || exit

date=$(date +'%Y-%m-%d %H:%M:%S')

igconns=$(curl -s --url "http://127.0.0.1:7776" --data "{\"agent\":\"dpow\",\"method\":\"active\"}" | jq '[.[] | select(.bestk > 0)] | . |length')

echo "----------------------------------------------"
echo "${date} - Iguana connections: ${igconns}"
echo "----------------------------------------------"
