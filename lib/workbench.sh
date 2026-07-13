#!/usr/bin/env bash
#
# WVEC Engineering Workbench
#

wvec_workbench() {

    while true
    do
        clear

        echo "======================================================"
        echo "      WorldVistA Engineering Workbench"
        echo "======================================================"
        echo

        read -p "WVEC> " cmd

        case "$cmd" in

            help)

                echo
                echo "Available commands"
                echo "------------------"
                echo "help         Show this help"
                echo "status       Show WVEC status"
                echo "programmer   Start the VistA programmer environment"
                echo "quit         Return to the main menu"
                echo
                read -p "Press ENTER..."
                ;;

            status)

                echo
                echo "WVEC Status"
                echo "-----------"
                echo "YottaDB : $ydb_dist"
                echo "Global  : $ydb_gbldir"
                echo "Branch  : $(git -C "$HOME/wvec" branch --show-current)"
                echo "Commit  : $(git -C "$HOME/wvec" rev-parse --short HEAD)"
                echo
                read -p "Press ENTER..."
                ;;

            programmer)

                clear
                echo
                echo "Starting WorldVistA..."
                echo

                "$ydb_dist/mumps" -direct

                ;;

            quit|exit)

                break
                ;;

            "")

                ;;

            *)

                echo
                echo "Unknown command: $cmd"
                echo "Type 'help' for a list of commands."
                sleep 2
                ;;

        esac

    done
}
