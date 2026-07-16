#!/bin/bash
#
# validator.sh
# WVEC Source Validation Library
#

validate_routine() {
    local routine="$1"
    local file
    local first
    local second

    file=$(basename "$routine" .m)

    #
    # First line must begin with routine name
    #
    first=$(head -1 "$routine" | awk '{print $1}')

    if [ "$first" != "$file" ]; then
        echo "Routine name mismatch"
        return 1
    fi

    #
    # Second line should contain version information
    #
    second=$(sed -n '2p' "$routine")

    if [[ "$second" != ' ;;'* ]]; then
        echo "Missing version line"
        return 1
    fi

    #
    # No TAB characters
    #
    if grep -q $'\t' "$routine"; then
        echo "TAB characters found"
        return 1
    fi

    return 0
}
