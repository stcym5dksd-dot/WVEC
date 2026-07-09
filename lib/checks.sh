#!/usr/bin/env bash
#
# WorldVistA Extended Engineering Console
# Health Check Library
#

check_yottadb() {
    [ -n "$ydb_dist" ]
}

check_globals() {
    [ -f "$ydb_gbldir" ]
}

check_database() {
    [ -f "$HOME/wvbuild/VistA-Source/mumps.dat" ]
}

check_routines() {
    [ -d "$HOME/wvbuild/VistA-Source/r" ]
}

check_configuration() {
    [ -f "$HOME/wvec/config/wvec.conf" ]
}
