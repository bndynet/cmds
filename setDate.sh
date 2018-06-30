#!/bin/bash

MONTH=`date '+%m'`
DAY=`date '+%d'`
HOUR=`date '+%H'`
HAS_ARGS=false
SERVER="ntpupdate.tencentyun.com"

usage() {
    echo "USAGE(Example): setDate -m 03 -d 10 -h 23"
    echo "sync date from ${SERVER}..."
    ntpdate ${SERVER}
    echo "done."
    exit 1;
}

while getopts m:d:h: o; do
    case "$o" in
	m)
	    MONTH=${OPTARG}
	    HAS_ARGS=true
	    ;;
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
    keep=`date '+%M%Y'`
    d="${MONTH}${DAY}${HOUR}${keep}"
    echo "set date to ${d}..."
    date $d
    echo "current date: "`date`
fi
