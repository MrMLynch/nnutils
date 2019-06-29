#!/bin/bash
cd "${BASH_SOURCE%/*}" || exit

echo "Updating iguana..."
(cd ~/SuperNET/iguana && git checkout dev && git pull && ./m_notary "" notary_nosplit > ~/logs/iguana.log 2> ~/logs/iguana_error.log &)

echo "Init dPoW..."
(cd ~/SuperNET/iguana && ./dpowassets)
