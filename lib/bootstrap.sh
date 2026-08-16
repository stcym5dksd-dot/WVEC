#!/usr/bin/env bash
#
# WVEC Bootstrap
#

wvec_bootstrap() {

    export WVEC_ROOT="$HOME/wvec"
    export VISTA_ROOT="$HOME/wvbuild/VistA-Source"

    #
    # Load the WorldVistA runtime environment
    #
    source "$HOME/wvbuild/tools/WorldVistA_Bootstrap_Kit_V1/env/vista_env.sh" || return 1

    #
    # WVEC/VistA runtime paths
    #
    export ydb_chset=UTF-8
    export ydb_gbldir="$VISTA_ROOT/gld/vista.gld"
    export ydb_routines="$VISTA_ROOT/o/utf8*($VISTA_ROOT/r) $ydb_dist/utf8/libyottadbutil.so"

    return 0
}
