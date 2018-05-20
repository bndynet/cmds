#!/bin/bash

DAY=`date '+%m'`
HOUR=`date '+%H'`
HAS_ARGS=false
SERVER="ntpupdate.tencentyun.com"

usage() {
    echo "USAGE(Example): setDate -d 10 -h 23"
    echo "sync date from ${SERVER}..."
    ntpdate ${SERVER}
    echo "done."
    exit 1;
}

while getopts d:h: o; do
    case "$o" in
        d)
            DAY=${OPTARG}
            HAS_ARGS=true
            ;;
        h)
            HOUR=${OPTARG}
            HAS_ARGS=true
            ;;
    esac
done

shift $OPTIND-1

if !(${HAS_ARGS}); then
    usage
else
    echo "current date: "`date`
    d1=`date '+%m'`
    d2=`date '+%M%Y'`
    d="${d1}${DAY}${HOUR}${d2}"
    echo "set date to ${d}..."
    date $d
    echo "current date: "`date`
fi
