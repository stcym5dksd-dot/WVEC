#!/usr/bin/env bash
#
# compiler.sh
# WVEC Build Compiler
#

compile_routine() {

    local routine="$1"
    local name
    local objdir
    local logfile

    name=$(basename "$routine")
    objdir="$HOME/wvbuild/VistA-Source/o"
    logfile="/tmp/wvec_compile.log"

    printf "  %-20s" "$name"

    mkdir -p "$objdir"

    rm -f "$objdir/${name%.m}.o"

    "$ydb_dist/mumps" \
        -object="$objdir/${name%.m}.o" \
        "$routine" \
        >"$logfile" 2>&1

    if [[ -f "$objdir/${name%.m}.o" ]]; then
        echo "PASS"
        return 0
    else
        echo "FAIL"
        cat "$logfile"
        return 1
    fi
}
