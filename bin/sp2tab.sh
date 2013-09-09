#!/bin/sh

if [ $# -lt 1 ]; then
    echo "usage) ${0} src_dir"
    exit -1
fi

cmd=unexpand
opts="--first-only -t 4"
src=$1

files=`ls ${src}`

for file in $files; do
    if [ -f "${src}/${file}" ]; then
        TMP="${file}.old"
        echo "$cmd $opts ${src}/${file} > ${src}/${TMP}"
        $cmd $opts ${src}/${file} > /dev/null
        if [ "$?" = "0" ]; then
            $cmd $opts ${src}/${file} > ${src}/${TMP}
            mv ${src}/${TMP} ${src}/${file}
        fi
    fi
done

exit 0
