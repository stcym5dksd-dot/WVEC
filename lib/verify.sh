#!/usr/bin/env bash
#
# WorldVistA Extended Engineering Console
# Verification Library
#

verify_installation() {

    echo
    echo "Checking installation..."
    echo

    [ -f "$VISTA_HOME/mumps.dat" ] \
        && echo "PASS  mumps.dat" \
        || echo "FAIL  mumps.dat"

    [ -f "$YDB_GBLDIR" ] \
        && echo "PASS  vista.gld" \
        || echo "FAIL  vista.gld"

    [ -d "$VISTA_HOME/r" ] \
        && echo "PASS  routines directory" \
        || echo "FAIL  routines directory"

    echo
}