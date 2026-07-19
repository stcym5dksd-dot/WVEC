#!/bin/bash
#
# doctor.sh
# WVEC Engineering Doctor
#

wvec_doctor() {

    echo
    echo "=========================================="
    echo "      WVEC Engineering Doctor"
    echo "=========================================="
    echo

    check_item() {
        local label="$1"
        local command="$2"

        printf "%-30s" "$label"

        if eval "$command" >/dev/null 2>&1
        then
            echo "PASS"
        else
            echo "FAIL"
        fi
    }

    echo "Environment"
    echo "-----------"

    check_item "YottaDB Installed" "command -v yottadb"
    check_item "Global Directory" "[ -f \"$ydb_gbldir\" ]"
    check_item "Routine Source" "[ -d \"$HOME/wvbuild/VistA-Source/r\" ]"
    check_item "WVEC Source" "[ -d \"$HOME/wvec/src/routines\" ]"

    echo
    echo "Repository"
    echo "----------"

    check_item "Git Repository" "git rev-parse --is-inside-work-tree"
    check_item "Build Utility" "[ -x \"$HOME/wvec/bin/wvec-build\" ]"
    check_item "Compiler Library" "[ -f \"$HOME/wvec/lib/compiler.sh\" ]"
    check_item "Validator Library" "[ -f \"$HOME/wvec/lib/validator.sh\" ]"

    echo
    echo "Reports"
    echo "-------"

    check_item "Reports Directory" "[ -d \"$HOME/wvec/reports\" ]"
    check_item "Build Manifest" "[ -f \"$HOME/wvec/reports/build-manifest.txt\" ]"

    echo
    echo "=========================================="
    echo "Doctor completed."
    echo "=========================================="
    echo
}
