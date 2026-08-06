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
}
