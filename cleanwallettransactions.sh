#!/bin/bash
cd "${BASH_SOURCE%/*}" || exit

# Coin we're resetting
coin=$1

if [[ -z "${coin}" ]]; then
  echo "No coin set, can't clean wallet transactions!"
  exit
fi

clif=$(./listclis.sh ${coin})
cli=/usr/local/bin/${clif}

result=$($cli cleanwallettransactions)
result_formatted=$(echo $result | jq -r '"Total Tx: \(.total_transactons) | Remaining Tx: \(.remaining_transactons) | Removed Tx: \(.removed_transactions)"')

echo "[$coin] $(date +'%Y-%m-%d %H:%M:%S') | $result_formatted"
#echo "[$coin] -- Finished --"
