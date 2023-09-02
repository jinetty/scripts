#!/bin/env bash

directories=""
[[ -z $1 ]] && echo "You need to specify a path to list directories." && exit
if [[ $(stat -c '%u' $1) -eq $UID ]] && [[ $(stat -c '%a' $1) -gt 400 ]]; then
    for directory in $(find $1 -type d -name ".git" 2>/dev/null |sed 's/.git//g')
    do
        directories="$directories $directory\n"
    done
    directories=$(echo $directories | awk '{OFS="\n"; $1=$1}1' | sort)
    echo "Local git repositories are:"
    echo -ne $directories|nl
else
    echo "This location does not have right permissions! You maybe need root permissions."
    exit
fi
