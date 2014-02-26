#!/bin/sh

if [ $# -lt 1 ]; then
    echo "usage) ${0} src_dir"
    exit -1
fi

SRC=$1

files=`ls ${SRC}`

for file in $files; do
    if [ -f "${SRC}/${file}" ]; then
        TMP="${file}.old"
        echo "iconv -f euc-kr -t utf-8 ${SRC}/${file} > ${SRC}/${TMP}"
        iconv -f euc-kr -t utf-8 ${SRC}/${file} > /dev/null
        if [ "$?" = "0" ]; then
            iconv -f euc-kr -t utf-8 ${SRC}/${file} > ${SRC}/${TMP}
            mv ${SRC}/${TMP} ${SRC}/${file}
        fi
    fi
done

exit 0
