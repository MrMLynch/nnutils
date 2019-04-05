#!/bin/bash

# Thanks Genie :D

SHELL=/bin/sh PATH=/bin:/sbin:/usr/bin:/usr/sbin
value=`cat $HOME/komodo/src/assetchains.json`
for name in $(jq -r '.[].ac_name' <<<${value}); 
	    do
		            String="https://bootstrap.dexstats.info/$name-bootstrap.tar.gz"
			            eval "$String"
			    done
