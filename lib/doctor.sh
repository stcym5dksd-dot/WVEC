#!/usr/bin/env bash
#
# WVEC Doctor Library
#

wvec_doctor() {

    banner

    echo "WVEC Doctor"
    echo "============"
    echo

    echo "Environment"
    echo "-----------"

    check_yottadb      && pass "YottaDB Environment" || fail "YottaDB Environment"
    check_globals      && pass "Global Directory"    || fail "Global Directory"
    check_database     && pass "Database File"       || fail "Database File"
    check_routines     && pass "Routine Directory"   || fail "Routine Directory"
    check_configuration && pass "Configuration"       || fail "Configuration"

    echo
    pause
}
