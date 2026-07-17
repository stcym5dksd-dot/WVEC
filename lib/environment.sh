#!/bin/bash
#
# environment.sh
# WVEC Environment Initialization
#

wvec_init() {

    #
    # Load the standard YottaDB environment
    #
    if [ -f /usr/local/etc/ydb_env_set ]; then
        source /usr/local/etc/ydb_env_set
    else
        echo "ERROR: Cannot find /usr/local/etc/ydb_env_set"
        return 1
    fi

    #
    # Override with the WorldVistA database
    #
    export ydb_gbldir="$HOME/wvbuild/VistA-Source/gld/vista.gld"

    #
    # Basic verification
    #
    if [ ! -f "$ydb_gbldir" ]; then
        echo "ERROR: Global directory not found:"
        echo "  $ydb_gbldir"
        return 1
    fi

    echo
    echo "=========================================="
    echo "WVEC Environment Initialized"
    echo "=========================================="
    echo "YottaDB : $ydb_dist"
    echo "Global  : $ydb_gbldir"
    echo

    return 0
}
