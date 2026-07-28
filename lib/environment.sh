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
    # WorldVistA installation root
    #
    export VISTA_ROOT="$HOME/wvbuild/VistA-Source"

    #
    # Use the WorldVistA global directory
    #
    export ydb_gbldir="$VISTA_ROOT/gld/vista.gld"

    #
    # Use the WVEC compiled object directory and source directory
    #
    export ydb_routines="$VISTA_ROOT/o*( $VISTA_ROOT/r ) $ydb_dist/utf8/libyottadbutil.so"

    #
    # Basic verification
    #
    if [ ! -f "$ydb_gbldir" ]; then
        echo
        echo "ERROR: WorldVistA global directory not found."
        echo "Expected:"
        echo "    $ydb_gbldir"
        echo
        return 1
    fi

    #
    # Verify routine directories
    #
    if [ ! -d "$VISTA_ROOT/o" ]; then
        echo
        echo "WARNING: Object directory missing:"
        echo "    $VISTA_ROOT/o"
        echo
    fi

    if [ ! -d "$VISTA_ROOT/r" ]; then
        echo
        echo "WARNING: Routine source directory missing:"
        echo "    $VISTA_ROOT/r"
        echo
    fi

    echo
    echo "=========================================="
    echo "     WVEC Environment Initialized"
    echo "=========================================="
    echo "YottaDB     : $ydb_dist"
    echo "VISTA_ROOT  : $VISTA_ROOT"
    echo "Globals     : $ydb_gbldir"
    echo "Routines    : $ydb_routines"
    echo "=========================================="
    echo

    return 0
}
