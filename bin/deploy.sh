#!/bin/bash

while read line; do
    IFS='|'
    file=( $line )
    # $file[0]: 파일명, $file[1]: 모드
    echo "${file[1]} ${file[0]}" >> /tmp/deploy.log
done

