#!/bin/bash
cd "${BASH_SOURCE%/*}" || exit

# optionally consolidate a single coin
# e.g. "KMD"
coin=$1

# change node address here
nAddress="RU2Wi8FGdheQXSfHzgtMANB6JJTLchfHhE"

date=$(date +'%Y-%m-%d %H:%M:%S')

if [[ -z "${coin}" ]]; then
	echo "----------------------------------------"
	echo "Merging UTXO's - ${date}"
	echo "----------------------------------------"

	./listcoins.sh | while read coin; do
		./merge.sh $coin &
	done;
	exit;
fi

clif=$(./listclis.sh ${coin})                                              

cli=/usr/local/bin/${clif}

#balance=$(${clif} getbalance)
echo "[${coin}] Current balance: $(${cli} getbalance) - consolidating..."
txid=$(${cli} sendtoaddress ${nAddress} $(${cli} getbalance) \"\" \"\" true)

if [[ ${txid} != "null" ]]; then
	echo "[${coin}] Merge TXID: ${txid}"
else
	echo "[${coin}] Error: $(echo ${txid} | jq -r '.error')"
fi

# split the new UTXO so we have enough for notas
utxocount=0

if [[ $utxocount -eq 0 ]]; then
	while [ $utxocount -eq 0 ]; do
		sleep 2
		utxocount=$(${cli} listunspent | jq length)
	done
	if [[ $utxocount -ge 1 ]]; then
		./utxosplitter.sh $coin &
		echo "[$coin] -- Finished --"
	fi
fi
