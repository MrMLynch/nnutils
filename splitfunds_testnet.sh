#!/bin/bash
cd "${BASH_SOURCE%/*}" || exit

coin=$1
duplicates=$2

utxo_size=10000

curl http://127.0.0.1:7778 --silent --data "{\"coin\":\"${coin}\",\"agent\":\"iguana\",\"method\":\"splitfunds\",\"satoshis\":${utxo_size},\"sendflag\":1,\"duplicates\":${duplicates}}"
