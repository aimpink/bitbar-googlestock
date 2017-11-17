#!/bin/bash
#
# google stock info plugin
# by Alan Impink
# 
# <bitbar.title>Stock price</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Alan Impink</bitbar.author>
# <bitbar.author.github>sg-s</bitbar.author.github>
# <bitbar.desc>Custom stock price (Google Finance)</bitbar.desc>


# specify which stocks you want to monitor here
stock[0]="IBM"
stock[1]="AAPL"
stock[2]="AMZN"

s='http://finance.google.com/finance?q=stock_symbol'
n=${#stock[@]}
n=$((n-1))

for (( c=0; c<=n; c++ ))
do
	echo -n "${stock[$c]}:"; curl -s "${s/stock_symbol/${stock[$c]}}" | grep ref_ -m 1 | sed 's|<[^>]*>||g'
done
