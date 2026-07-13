#!/bin/bash

show_live_status() {

    clear

    echo "======================================================"
    echo "             Live WorldVistA Status"
    echo "======================================================"
    echo

    echo "Kernel"
    echo "------"

    if echo 'WRITE $$VERSION^XPDUTL,! HALT' \
        | $ydb_dist/mumps -direct 2>/dev/null >/tmp/wvec.version
    then
        printf "Status : RUNNING\n"
        printf "Version: "
        cat /tmp/wvec.version
    else
        printf "Status : NOT RUNNING\n"
    fi

    echo
    read -p "Press ENTER..."
}
