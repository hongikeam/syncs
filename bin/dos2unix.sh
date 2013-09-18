#!/bin/sh

if [ $# -gt 0 ]; then
    for file in $* ; do
        if [ -f $file ]; then
            echo "d2u ${file} -> ${file}.txt"
            sed 's///g' $file > "${file}.txt"
        fi
    done
else
    while read file ; do
        if [ "" == $file ]; then
            exit 0
        fi

        if [ -f $file ]; then
            echo "d2u ${file} -> ${file}.txt"
            sed 's///g' $file > "${file}.txt"
        fi
    done
fi

exit 0

