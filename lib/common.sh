#!/usr/bin/env bash
#
# WVEC Common Library
#

banner() {
    clear
    echo "======================================================"
    echo "     WorldVistA Extended Engineering Console"
    echo "                 Version 2.1"
    echo "======================================================"
    echo
}

pause() {
    echo
    read -p "Press ENTER to continue..."
}

pass() {
    printf "PASS  %s\n" "$1"
}

fail() {
    printf "FAIL  %s\n" "$1"
}
