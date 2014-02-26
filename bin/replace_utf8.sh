#!/bin/sh

if [ $# -lt 2 ]; then
    echo "usage) ${0} pattern src_dir"
    exit -1
fi

PATTERN=$1
SRC=$2

files=`ls ${SRC}`

for file in $files; do
    if [ -f "${SRC}/${file}" ]; then
        TMP="${file}.old"
        echo "iconv -f euc-kr -t utf-8 ${SRC}/${file} | sed -e "${PATTERN}" > ${SRC}/${TMP}"
        iconv -f euc-kr -t utf-8 ${SRC}/${file} | sed -e "${PATTERN}" > /dev/null
        if [ "$?" = "0" ]; then
            iconv -f euc-kr -t utf-8 ${SRC}/${file} | sed -e "${PATTERN}" > ${SRC}/${TMP}
            mv ${SRC}/${TMP} ${SRC}/${file}
        fi
    fi
done

exit 0
