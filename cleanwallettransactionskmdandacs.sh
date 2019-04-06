#!/bin/bash
cd "${BASH_SOURCE%/*}" || exit

date=$(date +%Y-%m-%d %H:%M:%S)

echo "----------------------------------------"
echo "Cleaning spent UTXO's - ${date}"
echo "----------------------------------------"

./cleanwallettransactions.sh KMD &

./listassetchains.py | while read chain; do
  ./cleanwallettransactions.sh ${chain} &
done
