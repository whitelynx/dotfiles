#!/bin/bash

COUNT=$(makoctl list | jq '.data|flatten(1)|length')
if [ $COUNT != 0 ]; then
	echo '{"text":"'$COUNT' ","class":"active"}'
else
	echo '{"text":"","class":"inactive"}'
fi
