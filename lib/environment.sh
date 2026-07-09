#!/usr/bin/env bash
#
# WorldVistA Extended Engineering Console
# Environment Library
#

load_environment() {

    if [ -z "$YDB_ENV" ]; then
        echo "ERROR: WVEC configuration has not been loaded."
        return 1
    fi

    if [ ! -f "$YDB_ENV" ]; then
        echo "ERROR: Cannot find YottaDB environment file:"
        echo "       $YDB_ENV"
        return 1
    fi

    # Load YottaDB environment
    source "$YDB_ENV"

    # Export WorldVistA settings
    export ydb_gbldir="$YDB_GBLDIR"
    export ydb_routines="$YDB_ROUTINES"

    return 0
}
