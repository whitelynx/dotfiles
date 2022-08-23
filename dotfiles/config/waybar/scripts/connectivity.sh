#!/bin/bash

if ping -c 2 1.1.1.1 -q >/dev/null ; then
	echo '{"text":"","class":"connected"}'
else
	echo '{"text":"","class":"disconnected"}'
fi
