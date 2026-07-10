#!/usr/bin/env bash
#
# WVEC Bootstrap
#

wvec_bootstrap() {

    export WVEC_ROOT="$HOME/wvec"
    export VISTA_ROOT="$HOME/wvbuild/VistA-Source"

    #
    # Load the standard YottaDB runtime (UTF-8, PATH, etc.)
    #
    source /usr/local/etc/ydb_env_set || return 1

    #
    # Force the WorldVistA engineering environment
    #
    export ydb_chset="UTF-8"

    export ydb_dist="/usr/local/lib/yottadb/r206"

    export ydb_gbldir="$VISTA_ROOT/gld/vista.gld"

    export ydb_routines="$VISTA_ROOT/o*($VISTA_ROOT/r $HOME/.yottadb/r2.06_x86_64/r $HOME/.yottadb/r) $ydb_dist/utf8/libyottadbutil.so"

    export PATH="$ydb_dist:$PATH"
}
