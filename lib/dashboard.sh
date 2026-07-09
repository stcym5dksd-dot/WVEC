#!/usr/bin/env bash
#
# WorldVistA Extended Engineering Console
# Dashboard Library
#

show_dashboard() {

    banner

    local failures=0

    echo "System Health"
    echo "-------------"

    if [ -n "$ydb_dist" ]; then
        pass "YottaDB Environment"
    else
        fail "YottaDB Environment"
        failures=$((failures + 1))
    fi

    if [ -f "$ydb_gbldir" ]; then
        pass "Global Directory"
    else
        fail "Global Directory"
        failures=$((failures + 1))
    fi

    if [ -f "$HOME/wvbuild/VistA-Source/mumps.dat" ]; then
        pass "Database File"
    else
        fail "Database File"
        failures=$((failures + 1))
    fi

    if [ -d "$HOME/wvbuild/VistA-Source/r" ]; then
        pass "Routine Directory"
    else
        fail "Routine Directory"
        failures=$((failures + 1))
    fi

    if [ -f "$HOME/wvec/config/wvec.conf" ]; then
        pass "Configuration"
    else
        fail "Configuration"
        failures=$((failures + 1))
    fi

    echo

    if [ "$failures" -eq 0 ]; then
        echo "Overall Status : PASS"
    else
        echo "Overall Status : FAIL ($failures issue(s))"
    fi
echo

show_taskman_status

echo
pause
}
