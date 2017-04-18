#!/bin/sh
if [ ! -z $1 ] ; then 
	curl --silent -I $1 | grep -oE "https?://[0-9a-z_\.]+"
fi