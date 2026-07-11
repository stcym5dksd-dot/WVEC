#!/usr/bin/env bash
#
# WVEC Engineering Workbench
#

wvec_workbench() {

    while true
    do
        clear

        echo "======================================================"
        echo "      WorldVistA Engineering Workbench (Experimental)"
        echo "======================================================"
        echo

        read -p "WVEC> " cmd

        case "$cmd" in

            help)

                echo
                echo "Available commands"
                echo "------------------"
                echo "help      Show this help"
                echo "status    Show system status"
                echo "quit      Return to WVEC"
                echo
                read -p "Press ENTER..."
                ;;

            status)

                echo
                echo "WVEC Status"
                echo "-----------"
                echo "YottaDB : $ydb_dist"
                echo "Global  : $ydb_gbldir"
                echo "Git     : $(git -C "$HOME/wvec" rev-parse --short HEAD 2>/dev/null)"
                echo
                read -p "Press ENTER..."
                ;;

            quit|exit)

                break
                ;;

            "")

                ;;

            *)

                echo
                echo "Unknown command: $cmd"
                sleep 2
                ;;

        esac

    done
}
