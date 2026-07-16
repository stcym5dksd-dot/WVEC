#!/bin/bash
#
# compiler.sh
# WVEC Compile and Verification Library
#

compile_routine() {
    local routine="$1"

    printf "  %-20s" "$(basename "$routine")"

    if yottadb "$routine" >/tmp/wvec_compile.log 2>&1
    then
        echo "PASS"
        return 0
    else
        echo "FAIL"
        cat /tmp/wvec_compile.log
        return 1
    fi
}
