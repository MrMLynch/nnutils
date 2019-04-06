#!/bin/bash
cd "${BASH_SOURCE%/*}" || exit

node="[EU] Alert -"

if pgrep -x "iguana" > /dev/null; then
	TRUE="1"
else
	./telegram_send.sh "${node} iguana died. GO human GO!"
fi
