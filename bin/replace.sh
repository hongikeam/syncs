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
        echo "sed -e "${PATTERN}" ${SRC}/${file} > ${SRC}/${TMP}"
        sed -e "${PATTERN}" ${SRC}/${file} > /dev/null
        if [ "$?" = "0" ]; then
            sed -e "${PATTERN}" ${SRC}/${file} > ${SRC}/${TMP}
            mv ${SRC}/${TMP} ${SRC}/${file}
        fi
    fi
done

exit 0
