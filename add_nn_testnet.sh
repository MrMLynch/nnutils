#!/bin/bash

# Credit: ComputerGenie... stay salty

file="$HOME/2019NNtestnet/iguana/m_notary_testnet"
while IFS= read -r line
do
    ip=$( echo $line | grep addnotary | sed 's/[{}]//g' | sed 's_\\__g' | sed 's_"__g' | sed 's=curl --url http://127.0.0.1:7776 --data agent:iguana,method:addnotary,ipaddr:==')
    if [ ${#ip} -gt 1 ]; then
    KMD=$(komodo-cli addnode $ip onetry)
    BEER=$(komodo-cli -ac_name=BEER addnode $ip onetry)
    PIZZA=$(komodo-cli -ac_name=PIZZA addnode $ip onetry)
    TXSCLCC=$(komodo-cli -ac_name=TXSCLCC addnode $ip onetry)
    fi
done <"$file"
